#!/bin/sh

Help()
{
	>&2 echo "Initialize Certificate Authority for Docker TLS authentication"
	>&2 echo ""
	>&2 echo "Usage:"
	>&2 echo "  $(basename "$0") -d<directory>"
	>&2 echo "  $(basename "$0") -h"
	>&2 echo "Options:"
	>&2 echo "  d: Directory to use for opertion"
	>&2 echo "Example: $(basename "$0") -d/certs/ca"
}

if [ $# -eq 0 ]; then
	Help
	exit 1;
fi

while getopts "hd:" option; do
	case $option in
		h)
			Help
			exit;;
		d)
			dir="$OPTARG";;
		\?)
			>&2 echo "Invalid option: ${option}"
			Help
			exit 1;;
	esac
done

>&2 echo "Setting up Certificate Authority in ${dir}"

set -eu

# Initialize directory
mkdir -p "${dir}"

key_file="${dir}/key.pem"
cert_file="${dir}/cert.pem"

if [ ! -s "${key_file}" ]; then
	>&2 echo "Generating new CA key in ${dir}"
	openssl genrsa -out "${key_file}" 4096

	if [ -s "${cert_file}" ]; then
		>&2 echo "Backing-up existing certificate before replacing..."
		# cp with --backup and --force on the same file creates a backup of
		# the file. Using this here for automatic numbering.
		cp --verbose \
			--backup=numbered \
			--force \
			--verbose \
			"${cert_file}" "${cert_file}"
		# Now delete the original so the the next step creates a new one.
		rm "${cert_file}"
	fi
else
	>&2 echo "Using existing CA key in ${key_file}"
fi

if [ ! -s "${cert_file}" ]; then
	>&2 echo "Generating new CA cert in ${cert_file}"
	openssl req -new -key "${key_file}" \
		-out "${cert_file}" \
		-subj "/CN=docker:dind CA" \
		-outform PEM \
		-x509 \
		-days=825
else
	>&2 echo "Already a certificate in ${cert_file}"
fi

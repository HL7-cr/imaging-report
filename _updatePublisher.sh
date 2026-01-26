#!/bin/bash
echo "Downloading FHIR IG Publisher..."
mkdir -p input-cache
cd input-cache
curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o publisher.jar
if [ -f publisher.jar ]; then
	echo "IG Publisher downloaded successfully"
else
	echo "Failed to download IG Publisher"
	exit 1
fi
cd ..

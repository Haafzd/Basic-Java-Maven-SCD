#!/usr/bin/env bash
set -euo pipefail

PACKAGE_REPOSITORY="Haafzd/Basic-Java-Maven-SCD"
DEPLOY_REPOSITORY="Haafzd/Basic-Java-Maven-SCD-deploy"
VERSION_FILE="setting.ini"

major=$(grep '^major=' "$VERSION_FILE" | cut -d'=' -f2)
minor=$(grep '^minor=' "$VERSION_FILE" | cut -d'=' -f2)
patch=$(grep '^patch=' "$VERSION_FILE" | cut -d'=' -f2)
version="${major}.${minor}.${patch}"

echo "Starting deployment simulation"
echo "Package repository: ${PACKAGE_REPOSITORY}"
echo "Deployment repository: ${DEPLOY_REPOSITORY}"
echo "Version: ${version}"
echo "Artifact: contohproject-${version}.jar"
echo "Deployment script finished"

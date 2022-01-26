#!/usr/bin/env bash
set -e

# run this only after cloing .github and helm repo
cd helm
rm -rf .git
cd ..

mv helm/LICENSE .
mv helm/charts .
rm -rf helm

cd .github
rm -rf .git
rm -rf workflow-templates/*.properties.json
mv workflow-templates/ workflows
cd ..

mv .github/pom.xml .
mv .github/LICENSE .

echo "you are all set :)"

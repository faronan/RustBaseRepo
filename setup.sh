echo ".devcontainer" >> .gitignore
echo ".vscode" >> .gitignore
echo "setup.sh" >> .gitignore

export $(cat .env)
rm .env

grep -l 'base' Cargo.toml .vscode/launch.json  | xargs sed -i "s/base/${PACKAGE_NAME}/g"

git add .
git commit
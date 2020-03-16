echo ".devcontainer" >> .gitignore
echo ".vscode" >> .gitignore

export $(cat .env)
rm .env
rm setup.sh

grep -l 'base' Cargo.toml .vscode/launch.json  | xargs sed -i "" "s/base/${PACKAGE_NAME}/g"

cargo update

git add .
git commit -m "initial commit"
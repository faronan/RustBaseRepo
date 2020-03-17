export $(cat .env)
if [ -z "$PACKAGE_NAME" ]; then
  exit
fi

rm .env
rm setup.sh

echo ".devcontainer" >> .gitignore
echo ".vscode" >> .gitignore

grep -l 'base' Cargo.toml .vscode/launch.json  | xargs sed -i "" "s/base/${PACKAGE_NAME}/g"

cargo update

git init
git add .
git commit -m "initial commit"
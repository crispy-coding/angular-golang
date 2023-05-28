# angular-golang

### Requirements
* Modern backend language
* Modern frontend framework
* Simple build/usage of one small docker container

Suited for small to medium sized projects, though separation in different containers should be easy.

"configurations": {
"production": {
"fileReplacements": [
{
"replace": "src/environments/environment.ts",
"with": "src/environments/environment.prod.ts"
}
],

added "environments"

bash build-and-run.sh

ng serve
go run main.go
# CurtainOS packaging with nickel
Project to play around packaging for CurtainOS with nickel
```sh
nix run nickel -- -f packages.ncl export --format json
```
Its the base for a reproducibility branch of CTOS.
## Intro
the pkgs folder contains the actual build files. To add a build file add it in the pkgs filder and add it to the packages.ncl file like following:
```ncl
m%"%{(import "pkgs/example.ncl").package.name}"%m = addPackage (import "pkgs/example.ncl"),}"
```
replace exmaple with your package name.

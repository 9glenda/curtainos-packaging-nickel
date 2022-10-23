# CurtainOS packaging with nickel
Project to play around packaging for CurtainOS with nickel
```sh
nix run nickel -- -f packaging/packages.ncl export --format json
```
Its the base for a reproducibility branch of CTOS.
examole output:
```json
{
  "example": {
    "dependencies": {
      "build": [
        "example",
        "world"
      ],
      "conflicts": [],
      "opt": [],
      "source": "https://example.com/download"
    },
    "install": {
      "installation": "example"
    },
    "package": {
      "des": "example world",
      "name": "example",
      "stripping": true,
      "ver": "0.1.1"
    }
  },
  "hello": {
    "dependencies": {
      "build": [
        "example",
        "world"
      ],
      "conflicts": [],
      "opt": [],
      "source": "https://example.com/download"
    },
    "install": {
      "installation": "hello"
    },
    "package": {
      "des": "hello world",
      "name": "hello",
      "stripping": true,
      "ver": "0.1.1"
    }
  }
}
```
## Intro
the pkgs folder contains the actual build files. To add a build file add it in the pkgs filder and add it to the packages.ncl file like following:
```ncl
m%"%{(import "pkgs/example.ncl").package.name}"%m = addPackage (import "pkgs/example.ncl"),}"
```
replace exmaple with your package name.

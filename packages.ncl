let packageList = [] in
let addPackage = fun package => 
let packageList = packageList @ package.package.name in 
package in
let packages = {
  m%"%{(import "pkgs/example.ncl").package.name}"%m = addPackage (import "pkgs/example.ncl"),
  m%"%{(import "pkgs/hello.ncl").package.name}"%m = addPackage (import "pkgs/hello.ncl"),
} in packages

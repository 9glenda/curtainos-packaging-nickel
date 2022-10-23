let packageList = [] in
let packageListFull = [] in

let addPackage = fun package => 
  let packageList = packageList @ package.package.name in
  let packageListFull = packageListFull @ package in
  # { m%"%{package.package.name}"%m = package } in
package in

let packages = {
  m%"%{(import "pkgs/example.ncl").package.name}"%m = addPackage (import "pkgs/example.ncl"),
  m%"%{(import "pkgs/hello.ncl").package.name}"%m = addPackage (import "pkgs/hello.ncl"),
} in 
#let check = all (fun x => all (elem x packageList) x.dependencies.build) packageList in
#if check == false then
#  check
#else
packages

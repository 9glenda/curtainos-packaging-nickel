let SettingsSchema = {
  semVer | doc "enable SemanticVersion check"
         | Bool
         | default = false,
} in

let settings | SettingsSchema = import "settings.ncl" in

let SemanticVersion = fun label value =>
  let pattern = "^\\d{1,2}\\.\\d{1,2}(\\.\\d{1,2})?$" in
  if string.is_match pattern value then
    value
  else
    if settings.semVer == true then
    let msg = "invalid version number" in
      contract.blame_with msg label
    else
      value
  in


let PackageSchema = { 
  name | doc "Name of the package"
       | default = "example"
       | Str,
  ver | doc "Version of the package" 
      | default = "0.0.1"
      | SemanticVersion,
  des | doc "Description of the package"
      | default = "Description"
      | Str,
  stripping | doc "Stripping the package"
            | Bool,
} in
let InstallSchema = {
  installation | doc "Install script"
               | default = "make"
               | Str, 
} in
let DependenciesSchema = {
  build | doc "Build dependencies"
        | Array Str
        | default = [],

  source | doc "Link to source"
         | default = "https://example.com/download"
         | Str,
   opt | doc "Optional dependencies"
       | Array Str
       | default = [],
   conflicts | doc "Conflicts dependencies"
             | Array Str
             | default = [],
} in
let AppSchema = {
  package | doc "Package section"
          | PackageSchema,
  dependencies | doc "Dependencies sction"
               | DependenciesSchema,
  install | doc "Install section"
          | InstallSchema,
# not needed because of using a seperate settings.ncl file
# settings | doc "Settings for checks on the values"
# | SettingsSchema
} in
let conf | AppSchema = import "conf.ncl" in

conf

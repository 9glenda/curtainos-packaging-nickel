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
       | Str,
  ver | doc "Version of the package" 
      | SemanticVersion,
  des | doc "Description of the package"
      | Str,
  stripping | doc "Stripping the package"
            | Bool,
} in
let AppSchema = {
  package | doc "Package section"
          | PackageSchema,
# not needed because of using a seperate settings.ncl file
# settings | doc "Settings for checks on the values"
# | SettingsSchema
} in
let conf | AppSchema = import "conf.ncl" in


conf
# conf | AppSchema # not needed because of doing | AppSchema in let

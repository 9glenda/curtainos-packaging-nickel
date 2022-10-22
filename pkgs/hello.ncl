let hello | (import "../pkg.ncl")  = {
  package = {
    name = "hello",
    ver = "0.1.1",
    des = "hello world",
    stripping = true,
  },
  install = {
    installation = "hello",
  },
  dependencies = {
    build = [ "example", "world" ],
  },
} in hello
# let packages = import "packages.ncl" in
# let packages = [] @ [ hello ] in packages
# let packages = { hello = helloPKG } in packages

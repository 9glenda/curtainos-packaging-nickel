let example | (import "../pkg.ncl")  = {
  package = {
    name = "example",
    ver = "0.1.1",
    des = "example world",
    stripping = true,
  },
  install = {
    installation = "example",
  },
  dependencies = {
    build = [ "example", "world" ],
  },
} in example

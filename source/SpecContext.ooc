import structs/ArrayList

import Specification

SpecContext: class {
  beforeFunc: Func
  becauseFunc: Func
  specs: ArrayList<Specification>

  name: String
  init: func(.name) {
    this name = name
    this beforeFunc = func { }
    this becauseFunc = func { }
    this specs = ArrayList<Specification> new()
  }

  before: func(b: Func) {
    this beforeFunc = b
  }
  because: func(b: Func) {
    this becauseFunc = b
  }
  it: func ~impl (name: String, impl: Func) {
    spec := Specification new(name, impl)
    this specs add(spec)
  }

  it: func ~unimpl (name: String) {
    spec := Specification new(name)
    this specs add(spec)
  }

  run: func() {
  }
}

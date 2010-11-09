import structs/ArrayList

import Specification

Context: class {
  beforeFunc: Func
  specs: ArrayList<Specification>
  runnable: Bool

  name: String
  init: func(.name) {
    this name = name
    this beforeFunc = func { }
    this specs = ArrayList<Specification> new()
    this runnable = false;
  }

  before: func(b: Func) {
    this beforeFunc = b
  }
  it: func ~impl (name: String, impl: Func) {
    spec := Specification new(name, impl)
    this specs add(spec)
    this runnable = true
  }

  it: func ~unimpl (name: String) {
    spec := Specification new(name)
    this specs add(spec)
    this runnable = true
  }

  run: func() {
    "" println()
    ("+ " + (this name)) println()
    this beforeFunc()
    for (spec in specs) {
      msg := (" - " + (spec name))
      failed := false
      fe: Exception
      if(spec hasImpl) {
        try {
          spec runSpec()
        }
        catch(e: Exception){
          msg += " [FAILED]"
          // do something useful w/ exception
          fe = e
          failed = true
        }
      }
      else {
        msg += " [UNIMPLEMENTED]"}
      msg println()
      if (failed) fe print()
    }
  }
}

import structs/ArrayList

import Specification
import ContextResult
import SpecificationResult

Context: class {
  beforeFunc: Func
  beforeDeclared: Bool
  afterFunc: Func
  afterDeclared: Bool
  specs: ArrayList<Specification>
  runnable: Bool

  name: String
  init: func(.name) {
    this name = name
    this beforeFunc = func { }
    this beforeDeclared = false
    this afterFunc = func { }
    this afterDeclared = false
    this specs = ArrayList<Specification> new()
    this runnable = false;
  }

  before: func(b: Func) {
    if(beforeDeclared) {
      Exception new("Attempt to declare multiple 'before' sections in Context '"+ (this name)+"'") throw()
    }
    this beforeFunc = b
    this beforeDeclared = true
  }
  after: func(b: Func) {
    if(afterDeclared) {
      Exception new("Attempt to declare multiple 'after' sections in Context '"+ (this name)+"'") throw()
    }
    this afterFunc = b
    this afterDeclared = true
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

  run: func() -> ContextResult {
    this beforeFunc()
    specResults := ArrayList<SpecificationResult> new()
    for (spec in specs) {
      result := spec runSpec()
      specResults add(result)
    }
    this afterFunc()

    return (ContextResult new(this name, specResults))
  }
}

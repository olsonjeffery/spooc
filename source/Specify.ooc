import structs/ArrayList

SpecContext: class {
  beforeFunc: Func
  becauseFunc: Func
  specNames: ArrayList<String>
  specFuncs: ArrayList<Func>

  name: String
  init: func(.name) {
    this name = name
    this beforeFunc = func { }
    this becauseFunc = func { }
    this specNames = ArrayList<String> new()
    this specFuncs = ArrayList<Func> new()
  }

  before: func(b: Func) {
    this beforeFunc = b
  }
  because: func(b: Func) {
    this becauseFunc = b
  }
  it: func(name: String, spec: Func) {
    this specNames add(name)
    this specFuncs add(spec)
  }

  run: func() {
  }
}

Specify: class {
  contexts: static ArrayList<SpecContext>
  when: static func(name: String, spec: Func(SpecContext)) {
    ctx := SpecContext new(name)
    spec(ctx)

    if (This contexts == null) {
      This contexts = ArrayList<SpecContext> new()
    }
    This contexts add(ctx)
  }

  runAll: static func() -> Int {
    for(ctx in This contexts) {
      ctx name println()
      ctx run()
    }

    return 0
  }
}

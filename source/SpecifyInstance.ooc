import structs/ArrayList

import SpecContext

SpecifyInstance: class {
  contexts: ArrayList<SpecContext>

  init: func() {
    this contexts = ArrayList<SpecContext> new()
  }

  when: func(name: String, spec: Func(SpecContext)) {
    ctx := SpecContext new(name)
    spec(ctx)

    this contexts add(ctx)
  }

  runAll: func() -> Int {
    this contexts each(|ctx| {
      ("+ " + (ctx name)) println()
      ctx run()
    })

    return 0
  }
}

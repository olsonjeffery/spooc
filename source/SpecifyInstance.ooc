import structs/ArrayList

import Context

SpecifyInstance: class {
  contexts: ArrayList<Context>

  init: func() {
    this contexts = ArrayList<Context> new()
  }

  when: func(name: String, spec: Func(Context)) {
    ctx := Context new(name)
    spec(ctx)

    this contexts add(ctx)
  }

  runAll: func() -> Int {
    "---" println()
    this contexts each(|ctx| {
      ctx run()
    })
    "---" println()

    return 0
  }
}

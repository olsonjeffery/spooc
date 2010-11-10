import structs/ArrayList

import Context
import RunResult
import ContextResult

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

  runAll: func() -> RunResult {
    "---" println()
    ctxResults := ArrayList<ContextResult> new()
    this contexts each(|ctx| {
      if(ctx runnable) {
        ctxResults add(ctx run())
      }
    })
    "---" println()

    return (RunResult new(ctxResults))
  }
}

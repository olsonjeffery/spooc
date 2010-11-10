import SpecifyInstance
import Context
import RunResult

// Specify is just a static singleton wrapper around
// the SpecifyInstance class, which is where the actual
// impl of our testing DSL lives.. This way, we have
// a usable DSL for composing tests (Specify.when(), etc)
// and SpecInstance itself is testable
Specify: class {
  initIfNeeded: static func() {
    if (This specInst == null) {
      This specInst = SpecifyInstance new()
    }
  }

  specInst: static SpecifyInstance
  when: static func(name: String, spec: Func(Context)) {
    This initIfNeeded()
    This specInst when(name, spec)
  }

  runAll: static func() -> RunResult {
    This initIfNeeded()
    return This specInst runAll()
  }
}

Fixture: class {
  fixture: func() {}
}

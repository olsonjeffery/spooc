import SpecifyInstance
import SpecContext

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
  when: static func(name: String, spec: Func(SpecContext)) {
    This initIfNeeded()
    This specInst when(name, spec)
  }

  runAll: static func() -> Int {
    This initIfNeeded()
    This specInst runAll()
  }
}

Specification: class {
  name: String
  impl: Func
  runnable: Bool
  init: func ~impl (=name, =impl) { 
    this runnable = true
  }
  init: func ~noimpl (=name) { 
    this runnable = false 
    this impl = func() {}
  }

  runSpec: func() {
    this impl()
  }
}

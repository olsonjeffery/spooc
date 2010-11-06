Specification: class {
  name: String
  impl: Func
  hasImpl: Bool
  init: func ~impl (=name, =impl) { this hasImpl = true }
  init: func ~noimpl (=name) { this hasImpl = false }
}

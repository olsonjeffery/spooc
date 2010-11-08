import lang/Exception
// Assertion library

Assert: class {
  isTrue: static func(result: Bool) {
    if(!result) {
      Exception new("Excepted true, was: " + (result toString())) throw()
    }
  }
}

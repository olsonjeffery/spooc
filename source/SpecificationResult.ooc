SpecificationResult: class {
  name: String
  runnable: Bool
  failed: Bool
  error: Bool
  failureException: Exception
  errorException: Exception

  init: func(=name, =runnable, =failureException, =errorException) {
    failed = false
    error = false
    if(this failureException != null) {
      failed = true
    }
    if(this errorException != null) {
      error = true
    }
  }
}

import Assert
import SpecificationResult

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

  runSpec: func() -> SpecificationResult {
    result: SpecificationResult
    if (this runnable) {
      fe: AssertionFailureError
      fe = null
      ee: Exception
      ee = null
      try {
        this impl()
      }
      catch(e: AssertionFailureError) {
        fe = e
      }
      catch(e: Exception) {
        ee = e
      }
      result = SpecificationResult new(this name, this runnable, fe, ee)
    }
    else {
      result = SpecificationResult new(this name, this runnable, null, null)
    }
    return result
  }
}

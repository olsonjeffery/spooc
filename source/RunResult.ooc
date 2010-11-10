import structs/ArrayList

import ContextResult
import SpecificationResult

RunResult: class {
  contexts: ArrayList<ContextResult>
  totalPassed: Int
  totalFailed: Int
  totalUnimplemented: Int
  totalError: Int
  totalSpecs: Int

  init: func(=contexts) {
    this parseForResults(contexts)
  }

  parseForResults: func(ctxResults: ArrayList<ContextResult>) {
    this totalPassed = 0
    this totalFailed = 0
    this totalUnimplemented = 0
    this totalError = 0
    this totalSpecs = 0
    for(ctx in ctxResults) {
      for(spec in (ctx specs)) {
        if (!(spec runnable)) {
          this totalUnimplemented += 1
        }
        else if (spec failed) {
          this totalFailed += 1
        }
        else if (spec error) {
          this totalError += 1
        }
        else {
          this totalPassed += 1
        }
        this totalSpecs += 1
      }
    }
  }
}

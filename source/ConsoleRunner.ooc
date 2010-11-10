import structs/ArrayList

import Runner
import RunResult
import ContextResult
import SpecificationResult

ConsoleRunner: class extends Runner {
  processResult: func(result: RunResult) {
    "" println()
    
    for(ctx in result contexts) {
      "" println()
      ("+ " + (ctx name)) println()
      for(spec in ctx specs) {
        msg := (" - " + (spec name))
        fe := spec failureException
        ee := spec errorException
        failed := spec failed
        error := spec error
        if(!(spec runnable)) msg += " [UNIMPLEMENTED]"
        else if (spec failed) msg += " [FAILED]"
        else if (spec error) msg += " [ERROR]"
        msg println()
        if (failed) fe print()
        if (error) ee print()
      }
    }

    "" println()
    "-----" println()
    ((result totalSpecs toString()) + " specs. "+(result totalPassed toString())+" passed, "+(result totalFailed toString())+" failed, "+(result totalError toString())+" errors, "+ (result totalUnimplemented toString())+" unimpl'd.") println()
    "-----" println()
  }
}

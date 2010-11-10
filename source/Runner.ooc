import structs/ArrayList

import RunResult

Runner: abstract class {
  processResult: abstract func(results: RunResult)
}

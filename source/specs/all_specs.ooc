import ../Specify

import ../ConsoleRunner

import context_decl_specs
import context_run_specs

main: func {
  result := (Specify.runAll())
  ConsoleRunner new() processResult(result)
}

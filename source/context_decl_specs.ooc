import Specify
import Assert
import SpecifyInstance

specInst: SpecifyInstance

main: func() {
  Specify when("declaring a new context via SpecifyInstance.when()", |ctx| {

    ctx before(|| {
      specInst = SpecifyInstance new()
    })

    ctx because(|| {
      // this is not an actual, testable spec.. this is the spec
      // we're declaring to test desired behavior
      specInst when("foo", |ctx_under_test| {
      })
    })

    ctx it("should create and store a new context within the SpecifyInstance contexts property", || {
      "derp" println()
      Assert isTrue(specInst contexts size == 1)
    })
  })
  Specify.runAll()
}

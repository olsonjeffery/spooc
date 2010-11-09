import Specify
import Assert

import SpecifyInstance

specInst: SpecifyInstance

Specify when("declaring a new context via SpecifyInstance.when()", |ctx| {

  ctx before(|| {
    specInst = SpecifyInstance new()
    // this is not an actual, testable spec.. this is the spec
    // we're declaring to test desired behavior
    specInst when("foo", |ctx_under_test| {
    })
  })

  ctx it("should create and store a new context within the SpecifyInstance contexts property", || {
    specInst contexts size shouldEqual(1)
  })
})

Specify.when("declaring a new context with no specs", |ctx| {

  ctx it("should not be runnable")
})

Specify.when("declaring a new context with one or more specs", |ctx| {
  ctx it("should be runnable")
})

Specify.when("declaring a spec when no before section", |ctx| {
  ctx it("should work")
})

Specify.when("declaring a spec with multiple before sections", |ctx| {
  ctx it("should cause an error")
})

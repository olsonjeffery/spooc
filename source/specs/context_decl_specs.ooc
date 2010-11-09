import ../Specify
import ../Assert

import ../SpecifyInstance
import ../Context

specInst: SpecifyInstance

actionFailed: Bool

Specify when("declaring a new context via SpecifyInstance.when() that has no specs", |ctx| {

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

  ctx it("should not be runnable", || { specInst contexts first() runnable shouldBeFalse() })
})

Specify.when("declaring a new context with one or more specs", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("foo", |ctx_under_test| {
      ctx_under_test it("should blah blah")
    })
  })
  ctx it("should be runnable", || { specInst contexts first() runnable shouldBeTrue() })
})

Specify.when("declaring a context when no before section", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    actionFailed = Assert throws(|| {
      specInst when("foo", |ctx_under_test| {
      })
    })
  })
  ctx it("should work", || {
    actionFailed shouldBeFalse()
  })
})

Specify.when("declaring a context with a single before section", |ctx| {
  ctx it("should work")
})

Specify.when("declaring a context with multiple before sections", |ctx| {
  ctx it("should cause an error")
})

Specify.when("declaring a context within a spec with an implementation", |ctx| {
  ctx it("should be runnable")
})

Specify.when("declaring a context within a spec with no implementation", |ctx| {
  ctx it("should be not runnable")
})

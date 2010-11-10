import ../Specify
import ../Assert

import ../SpecifyInstance

import ../ContextResult
import ../SpecificationResult
import ../RunResult

specInst: SpecifyInstance
result: RunResult
Specify when("running with a single Context with no specs", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ no specs", |ctx_under_test| {
    })
    
    result = specInst runAll()
  })
  ctx it ("should not run the Context", || {
    result contexts size shouldEqual(0) 
  })
})

ctxName := "ctx w/ a spec"
Specify when("running with two Contexts, one of which has no specs", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ no specs", |ctx_under_test| {
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("is a spec, indeed")
    })
    
    result = specInst runAll()
  })
  ctx it ("should return one ContextResult", || {
    result contexts size shouldEqual(1)
  })
  ctx it ("should have the result's name match the Context that has specs", || {
    result contexts first() name shouldEqual(ctxName)
  })
})

Specify when("running a Context with a single, unimplemented spec", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ an unimpl'd spec", |ctx_under_test| {
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("unimpl'd")
    })
    
    result = specInst runAll()
  })
  ctx it ("should have 0 passing specs", || {
    result totalPassed shouldEqual(0)
  })
  ctx it ("should have 0 failing specs", ||{
    result totalFailed shouldEqual(0)
  })
  ctx it ("should have 1 unimpld spec", ||{
    result totalUnimplemented shouldEqual(1)
  })
  ctx it ("should have 0 error'd specs", ||{
    result totalError shouldEqual(0)
  })
  ctx it ("should have 1 total spec", ||{
    result totalSpecs shouldEqual(1)
  })
})

Specify when("running a Context with a single, passing spec", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ a passing spec", |ctx_under_test| {
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("passing", || { true shouldBeTrue() })
    })
    
    result = specInst runAll()
  })
  ctx it ("should have 1 passing specs", || { result totalPassed shouldEqual(1) })
  ctx it ("should have 0 failing specs", || { result totalFailed shouldEqual(0)})
  ctx it ("should have 0 unimpld spec", || { result totalUnimplemented shouldEqual(0)})
  ctx it ("should have 0 error'd specs", || { result totalError shouldEqual(0)})
  ctx it ("should have 1 total spec", || { result totalSpecs shouldEqual(1)})
})

Specify when("running a Context with a single, failing spec", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ a failing spec", |ctx_under_test| {
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("failing", || { true shouldBeFalse() })
    })
    
    result = specInst runAll()
  })
  ctx it ("should have 0 passing specs", || { result totalPassed shouldEqual(0) })
  ctx it ("should have 1 failing specs", || { result totalFailed shouldEqual(1)})
  ctx it ("should have 0 unimpld spec", || { result totalUnimplemented shouldEqual(0)})
  ctx it ("should have 0 error'd specs", || { result totalError shouldEqual(0)})
  ctx it ("should have 1 total spec", || { result totalSpecs shouldEqual(1)})
})

Specify when("running a Context with a single, erroring spec", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ erroring spec", |ctx_under_test| {
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("erroring", || { Exception new("blah") throw() })
    })
    
    result = specInst runAll()
  })
  ctx it ("should have 0 passing specs", || { result totalPassed shouldEqual(0) })
  ctx it ("should have 0 failing specs", || { result totalFailed shouldEqual(0)})
  ctx it ("should have 0 unimpld spec", || { result totalUnimplemented shouldEqual(0)})
  ctx it ("should have 1 error'd specs", || { result totalError shouldEqual(1)})
  ctx it ("should have 1 total spec", || { result totalSpecs shouldEqual(1)})
})

Specify when("when running two Contexts with a three total specs between them", |ctx| {
  ctx before(|| {
    specInst = SpecifyInstance new()
    specInst when("ctx w/ erroring spec", |ctx_under_test| {
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("bleh")
    })
    specInst when(ctxName, |ctx_under_test| {
      ctx_under_test it("bleh")
      ctx_under_test it("boognish")
    })
    
    result = specInst runAll()
  })
  ctx it("should show the first Context has one spec", || {
    result contexts first() specs size shouldEqual(1)
  })
  ctx it("should show the last Context has two specs", || {
    result contexts last() specs size shouldEqual(2)
  })
  ctx it("should show three total specs", || {
    result totalSpecs shouldEqual(3)
  })
})

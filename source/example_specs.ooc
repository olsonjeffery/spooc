//use spooc
import Specify

main: func {
  Specify when("doing blah blah", |ctx|{
    // state for the context
    sut := SystemUnderTest new()
    foo := 0

    // setup code that is ran first, used
    // to establish the context..
    ctx.before(||{
      foo = 1
    })

    // this is always ran after any before()
    // closure, but before any it() specs..
    // should be used to specify the "money
    // item" that verifies your desired behavior
    // NOTE: strictly speaking, this isn't neccesary,
    // but is useful to "call out" the important
    // behavior you're verifying. it's value is purely
    // semantic.
    ctx.because(|| {
      foo = 2 
    })

    // a specification of desired behavior
    ctx.it("should do something", || {
      // an assertion. "good practice" for
      // Context/Spec style testing dictates
      // that you should try your damnedest 
      // to make each it() call a one-line..
      // so if you're doing multiple asserts
      // in one it(), maybe you should split
      // them up?
      //foo.shouldEqual(2)
    })
  })

  Specify runAll()

  return 1
}

SystemUnderTest: class {
}

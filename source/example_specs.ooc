//use spooc
import Specify

main: func {
  Specify when("when doing foo with an input of bar", |ctx|{
    // state for the context
    sut: SystemUnderTest
    result := -1
    input := ""

    // setup code that is ran first, used
    // to establish the context..
    ctx.before(||{
      sut = SystemUnderTest new()
      input = "bar"
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
      result = sut foo(input) 
    })

    // a specification of desired behavior
    ctx.it("should provide the answer to the ultimate question of life, the universe and everything", || {
      // an assertion. "good practice" for
      // Context/Spec style testing dictates
      // that you should try your damnedest 
      // to make each it() call a one-line..
      // so if you're doing multiple asserts
      // in one it(), maybe you should split
      // them up?
      //result.shouldEqual("42")
    })
  })

  return Specify runAll()
}

SystemUnderTest: class {
  foo: func(input: String) -> String {
    result := "baz"
    if (input == "bar") {
      result = "42"  
    }
    return result
  }
}

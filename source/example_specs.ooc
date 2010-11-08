//use spooc 
import Specify
import Assert

// state for the contexts that appear in fixture()
sut: SystemUnderTest
result: Int
input: String

// by convention, the contexts are contained within
// a class that has the same name as the module (filename - ooc)
example_specs: class extends Fixture {
  // inside of the fixture() method you place all of
  // the testable scenarios that you want to verify
  // the behavior of, each represented by a call to
  // Specify.when(). In the parlance of Context/Spec
  // testing, each one of these scenarios is called a
  // Context.
  fixture: func {
    Specify when("when doing foo with an input of bar", |ctx|{

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
        Assert.isTrue(result == 42)
      })
    })

  }
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

main: func {
  // loads the contexts/specs in fixture()
  // into the global runner
  example_specs new() fixture()
  // run the loaded contexts/specs
  return Specify runAll()
}

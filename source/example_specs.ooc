//use spooc 
import Specify
import Assert

// State for the contexts that appear in the below contexts
sut: SystemUnderTest
result: String
input: String

// An example of a testable scenario, containing some
// behavior you'd like to verify in a given situation.
// In the parlance of Context/Spec testing, each one 
// of these scenarios is called a Context.
Specify when("doing foo with an input of bar", |ctx|{

  // setup code that is ran first, used
  // to establish the Context..
  ctx.before(||{
    sut = SystemUnderTest new()
    input = "bar"

    result = sut foo(input) 
  })

  // A Specification of desired behavior. A given
  // context can contain zero or more of these.
  ctx.it("should provide the answer to the ultimate question of life, the universe and everything", || {
    // An assertion. "Good practice" for
    // Context/Spec style testing dictates
    // that you should try your damnedest 
    // to make each it() call a one-liner..
    // so if you're doing multiple asserts
    // in one it(), maybe you should think
    // about splitting them up?
    result.shouldEqual("42")
  })

  // You can also "flush" out Specifications by name
  // only. In this case, the spec will be annotated,
  // at runtime, of this fact.
  ctx.it("should be an unimplemented spec")
})

// The Type that the above Context covers. A given
// set of Contexts in a module can cover as many or
// as few classes as you'd like. Whether 
SystemUnderTest: class {
  foo: func(input: String) -> String {
    result := "baz"
    if (input == "bar") {
      result = "42"  
    }
    return result
  }
}

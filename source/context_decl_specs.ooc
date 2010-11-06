import Specify

main: func() {
  Specify when("declaring a new context via SpecifyInstance.when()", |ctx| {
    ctx it("should create and store a new context within the SpecifyInstance contexts property", || {})
  })
}

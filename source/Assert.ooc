import lang/Exception
// Assertion library

Assert: class {
  isTrue: static func(result: Bool) {
    if(!result) {
      Exception new("Excepted true, was: " + (result toString())) throw()
    }
  }

  throws: static func(f:Func) -> Bool {
    result := false
    try {
      f()
    }
    catch(e: Exception) {
      result = true
    }
    return result
  }

  doesNotThrow: static func(f:Func) -> Bool {
    return !(This.throws(f))
  }
}

extend Bool {
  shouldEqual: func(other: Bool) {
    me := this
    if (me != other) {
      meVal := me toString() 
      otherVal := other toString()
      Exception new("Expected "+ otherVal + ", was " + meVal) throw()
    }
  }
}

extend Int {
  shouldEqual: func(other: Int) {
    me := this
    if (me != other) {
      meVal := me toString() 
      otherVal := other toString()
      Exception new("Expected "+ otherVal + ", was " + meVal) throw()
    }
  }
}
extend SSizeT {
  shouldEqual: func(other: SSizeT) {
    me := this
    if (me != other) {
      meVal := me toString() 
      otherVal := other toString()
      Exception new("Expected "+ otherVal + ", was " + meVal) throw()
    }
  }
}

extend String {
  shouldEqual: func(other: String) {
    me := this
    if (me != other) {
      meVal := me 
      otherVal := other
      Exception new("Expected "+ otherVal + ", was " + meVal) throw()
    }
  }
}

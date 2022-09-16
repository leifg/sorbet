# typed: strict

def test_must_because # error: does not have a `sig`
  x = T.cast(nil, T.nilable(String)) # error: `T.cast` is useless
  T.assert_type!(T.must_because(x) {'reason'}, String)

  T.must_because(x) {'reason'}
  T.must_because()  # error-with-dupes: Not enough arguments
  T.must_because(x) # error: requires a block parameter
  T.must_because(x, 0)
  #                 ^ error-with-dupes: Expected: `1`, got: `2`
  T.must_because(x) {0} # error: Expected `String`
end

-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?

-- The Bounded class is used to name the upper and lower limits of a type.
-- The minBound function is the minimum size of the data type.
-- The maxBound is the maximum size of the data type.

-- type Bounded :: * -> Constraint -- Bounded constrains any data types that is listed as an instance of Bounded.
-- Bounded types are polymorphic constants.

minBound :: (Bool, Int, Char)

bound3To9 :: Bounded Int => Int -> Int
    minBound = 3
    maxBound = 9


-- Question 2
-- The types Int and Word belong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.
minBound :: (Word)
maxBound :: (Word)

minBound :: (Int)
maxBound :: (Int)

-- minBound and maxBound for Word and Int each gives the same range of numbers.
-- The difference is that minBound for Word starts at 0 and maxBound is at 18446744073709551615
-- While minBound for Int starts at -9223372036854775808 and maxBound goes to 9223372036854775808
-- So there are definitely negative Int values but no negative Word values.


-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?


-- Question 4
-- Add type signatures to the functions below and use type variables and type classes.
-- Then uncomment the functions and try to compile.


-- Question 5
-- Investigate the numeric type classes to figure out which behaviors they provide to change between numeric types.

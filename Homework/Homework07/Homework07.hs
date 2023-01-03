-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?

-- Question 1
-- Investigate the `Bounded` type class. What behaviours it provides?

-- The Bounded type class has many instances including Word, Ordering, Int, Char, and Bool. 
-- It sets a constrained limit in a function to not go past or before a certain instance.
-- The minBound function is the beginning of the bounded region that doesn't take data beforehand
-- The maxBound is the end of the bounded region that doesn't take data afterwards.

-- type Bounded :: * -> Constraint -- Bounded constrains any data types that is listed as an instance of Bounded.
-- Bounded types are polymorphic constants.

bound3To9 :: Bounded a => a -> a
bound3To9 = (minBound 3) && (maxBound 9)


-- Question 2
-- The types Int and Word bellong to the same type classes. What is the difference
-- between them? Check maybe the maxBound and minBound parameter for both types.


-- Question 3
-- Investigate the `Enum` type class. What behaviours provides?


-- Question 4
-- Add type signatures to the functions below and use type variables and type classes.
-- Then uncomment the functions and try to compile.


-- Question 5
-- Investigate the numeric type classes to figure out which behaviors they provide to change between numeric types.

-- Question 1
-- Lets say you have the nested values defined below. How would you get the value of
-- 4 by using only pattern matching in a function?

nested :: [([Int], [Int])]
nested = [([1,2],[3,4]), ([5,6],[7,8])]

checkFor4 :: [([Int], [Int])] -> String
checkFor4 [([_,_],[_,x]),([_,_],[_,_])] = show x
checkFor4 _ = "Wrong input list!"

--checkFor4 [([x==4:_],[_:_]):([_:_],[_:_])] || [([_:y==4],[_:_]):([_:_],[_:_])] = "The first list of the first tuple has 4"

--checkFor4 ((fst $ nested !! 0) !! 0 ==4) || ((fst $ nested !! 0) !! 1 ==4) = "The first list of the first tuple has 4"
--checkFor4 ((snd $ nested !! 0) !! 0 ==4) || ((snd $ nested !! 0) !! 1 ==4)  = "The second list of the first tuple has 4" where (x==4 || y==4)
--checkFor4 ((fst $ nested !! 1) !! 0 ==4) || ((fst $ nested !! 1) !! 1 ==4)  = "The first list of the second tuple has 4" where (x==4 || y==4)
--checkFor4 ((snd $ nested !! 1) !! 0 ==4) || ((snd $ nested !! 1) !! 1 ==4)  = "The second list of the second tuple has 4" where (x==4 || y==4)
--checkFor4 _ = "There is no 4!"



-- Question 2
-- Write a function that takes a list of elements of any type and, if the list has 3 or more elements, it
-- removes them. Else, it does nothing. Do it two times, one with multiple function definitions and one with
-- case expressions.

rem3Elem :: [a] -> [a]
rem3Elem (_:_:_:xs) = xs
rem3Elem x          = x

rem3Elem' :: [a] -> [a]
rem3Elem' list = case list of
    (_:_:_:xs) -> xs
    x          -> x

-- Question 3
-- Create a function that takes a 3-element tuple (all of type Integer) and adds them together

add3ElemTuple :: (Double, Double, Double) -> Double
add3ElemTuple (x,y,z) = x + y + z


-- Question 4
-- Implement a function that returns True if a list is empty and False otherwise.

isEmp :: [a] -> Bool
isEmp anyList = case anyList of
    []     -> True
    _      -> False

-- Question 5
-- Write the implementation of the tail function using pattern matching. But, instead of failing if
-- the list is empty, return an empty list.

tailEmp :: [a] -> [a]
tailEmp myList = case myList of
    x:xs     -> xs
    []       -> []


-- Question 6
-- write a case expression wrapped in a function that takes an Int and adds one if it's even. Otherwise does nothing. 
-- (Use the `even` function to check if the number is even.)


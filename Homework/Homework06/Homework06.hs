-- Question 1
-- Write a function called `repeat'` that takes a value and creates an infinite list with
-- the value provided as every element of the list.
--
-- >>> repeat 17
--[17,17,17,17,17,17,17,17,17...

repeat' :: Int -> [Int]
repeat' x = x : repeat' x

-- Question 2
-- Using the `repeat'` function and the `take` function we defined in the lesson (comes with Haskell),
-- create a function called `replicate'` that takes a number `n` and a value `x` and creates a list
-- of length `n` with `x` as the value of every element. (`n` has to be Integer.)
--
replicate' :: Integer -> Int -> [Int]
replicate' n x | n <= 0 = []
replicate' n x = x : replicate' (n-1) x

-- >>> replicate 0 True
-- []
-- >>> replicate (-1) True
-- []
-- >>> replicate 4 True
-- [True,True,True,True]


-- Question 3
-- Write a function called `concat'` that concatenates a list of lists.
--
-- >>> concat' [[1,2],[3],[4,5,6]]
-- [1,2,3,4,5,6]

concat' :: Int -> [[b]] -> [b]
concat' n _ | n <= 0 = []
concat' n [] = []
concat' n x = concat' (n-1) x ++ (x !! (n-1))

-- Question 4
-- Write a function called `zip'` that takes two lists and returns a list of
-- corresponding pairs (zips them) like this:
--
-- >>> zip' [1, 2] ['a', 'b']
-- [(1,'a'),(2,'b')]
--
-- If one input list is shorter than the other, excess elements of the longer
-- list are discarded, even if one of the lists is infinite:
--
-- >>> zip' [1] ['a', 'b']
-- [(1,'a')]
-- >>> zip' [1, 2] ['a']
-- [(1,'a')]
-- >>> zip' [] [1..]
-- []
-- >>> zip' [1..] []
-- []

zip' :: [a] -> [b] -> [(a,b)]
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys
zip' _ _ = []

-- Question 5
-- Create a function called `zipWith'` that generalises `zip'` by zipping with a
-- function given as the first argument, instead of a tupling function.
--
-- > zipWith' (,) xs ys == zip' xs ys
-- > zipWith' f [x1,x2,x3..] [y1,y2,y3..] == [f x1 y1, f x2 y2, f x3 y3..]
--
-- For example, `zipWith' (+)` is applied to two lists to produce the list of
-- corresponding sums:
--
-- >>> zipWith (+) [1, 2, 3] [4, 5, 6]
-- [5,7,9]

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
zipWith' _ _ _ = []

-- Question 6
-- Write a function called `takeWhile'` that takes a precate and a list and
-- returns the list up until an element that doesn't satisfy the predicate.
--
-- >>> takeWhile (< 3) [1,2,3,4,1,2,3,4]
-- [1,2]
-- >>> takeWhile (< 9) [1,2,3]
-- [1,2,3]
-- >>> takeWhile (< 0) [1,2,3]
-- []

takeWhile' :: (Int -> Int -> Bool) -> Int -> [Int] -> [Int]
takeWhile' f n (x:xs)
  | f n x = x : takeWhile' f n xs
  | otherwise     = []
takeWhile' _ _ _ = []

-- takeWhile' (<) 0 [1,2,3,-1,6,7,8]

-- Question 7 (More difficult)
-- Write a function that takes in an integer n, calculates the factorial n! and
-- returns a string in the form of 1*2* ... *n = n! where n! is the actual result.

justTheFact :: Int -> Int
justTheFact n | n < 1 = 1
justTheFact n = n * justTheFact (n-1)

-- Question 8
-- Below you have defined some beer prices in bevogBeerPrices and your order list in
-- orderList + the deliveryCost. Write a function that takes in an order and calculates
-- the cost including delivery. Assume that the two lists have the beers in the same order.

bevogBeerPrices :: [(String, Double)]
bevogBeerPrices =
  [ ("Tak", 6.00),
    ("Kramah", 7.00),
    ("Ond", 8.50),
    ("Baja", 7.50)
  ]

orderList :: [(String, Double)]
orderList =
  [ ("Tak", 5),
    ("Kramah", 4),
    ("Ond", 7)
  ]

deliveryCost :: Double
deliveryCost = 8.50

-- TO-DO

orderCost :: [(String, Double)] -> Double -> [(String, Double)] -> Double
orderCost order delivCost priceList = delivCost + foldr ((+) . getItemCost getPrice) 0.0 order
  where
    getItemCost :: (String -> Double) -> (String, Double) -> Double
    getItemCost f (name, num) = f name * num
    getPrice :: String -> Double
    getPrice item = snd $ foldr (\(s, c) acc -> if s == item then (s, c) else acc)
("", 0.0) priceList

-------------------------------------------------------------------------------------------------------
-- Dictionary data structure to hold student names and grades -----------------------------------------
-------------------------------------------------------------------------------------------------------
-- ASSUMPTIONS: all keys are Strings and all values are Doubles, keys do not repeat in inputs ---------
-------------------------------------------------------------------------------------------------------
-- Concepts/Functions used: 
-- Fold, filter, zip, explicit recursion, pattern-matching, Function composition, conditionals,
-- lambda expressions; I enjoy using them in Python, and I wanted to practice them in Haskell)
-------------------------------------------------------------------------------------------------------

module MyDictionary (
    
    ----------------------------------
    -- BASIC Dictionary ADT operations:

    -- insert a new element
    insertInDictionary,
    -- find an element
    findInDictionary,
    -- remove from dictionary
    removeFromDictionary,
    
    -----------------------
    -- EXTENDED OPERATIONS:
    
    -- find the length of the dictionary
    vectorLength,
    -- Sum of all the values
    vectorSum,
    -- Values below: returns a list of keys whose value is below a provided treshold
    valuesBelow

) where

    -- Insert key-value pairs. 
    -- Params: [existing dictionary] [liist of new keys] [list of new values]
    insertInDictionary :: [(a,b)] -> [a] -> [b] -> [(a,b)]
    insertInDictionary [] [] [] = []                            -- when nothing is being added to nothing
    insertInDictionary [] keys values = zip keys values         -- When new record is created
    insertInDictionary xs keys values = (zip keys values) ++ xs -- When adding new student to existing record


    findInDictionary :: (Eq b) => (Num b) => (Eq a) => a -> [(a,b)] -> (a,b) 
    findInDictionary name ((n,grade):xs)
      | name == n = (name, grade)   -- If found
      | xs == [] = (name,-1)        -- If not found, then return -1 as an error code to be processed by the user interface module
      | otherwise = findInDictionary name xs -- if not found but there is still some elements remain unsearched, then recurse
      

    -- Remove an element from the dictionary using the filter function using some sweet Function composition action
    removeFromDictionary :: String -> [(String,Double)] -> [(String,Double)]
    removeFromDictionary y xs = filter (not . ((==) y) . fst) xs -- name extracted from tuple and is fed into equality "function" 
                                                                 -- which decides whether the filter filters the tuple out of the list


    -- Subroutine to find how many elements in the dictonary
    vectorLength :: (Num b) => [a] -> b
    vectorLength [] = 0
    vectorLength (_:xs) = 1 + vectorLength xs
    
    -- Calculate the sum of all values of the dictionary's Key-Value pairs using a fold and a lambda expression
    vectorSum :: [(String,Double)] -> Double
    vectorSum xs = foldl (\a (name,grade) -> a+grade ) 0 xs -- fold using anonymous function that extracts the grades and combines them
    

    --Returns a list of keys whose value is below a provided treshold number
    valuesBelow :: Double -> [(String,Double)] -> [String] 
    valuesBelow treshold ((n,grade):xs)
      | grade < treshold = n : valuesBelow treshold xs  -- return students with conforming grades and recurse
      | xs == [] = []                                   -- if no students left, return empty list (base case)
      | otherwise = valuesBelow treshold xs             -- otherwise recurse
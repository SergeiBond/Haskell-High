import MyDictionary
   
    ---------------------------------------------------------------
    ---------- Student Grade-Management Driver Program ------------
    -----------  to Test my Dictionary Data Structure -------------
    ---------------------------------------------------------------


    {-*********************************
    ***********************************
    LIST OF AVAILABLE COMMANDS (COPY-PASTE in terminal, for your convenience):

    enterGrades

    addGrades

    withdrawStudent

    checkGrade

    isFailing

    numOfStudents

    classGPA


    ***********************************
    *********************************-}



-- Create a dictionary of Student-Grade key-value pairs by inputting a list of students and a list of grades
enterGrades = insertInDictionary [] ["Sarah", "Alex", "Nick", "Mark", "Dan", "John", "Sergei"] [4.0, 0.0, 2.0, 0.0, 2.9, 4.0, 3.95]

-- Add Students and their corresponding grades to an existing dictionary
addGrades = insertInDictionary enterGrades ["Lee"] [2.0]

-- Withdraw a student from the class
-- (also, use this test function instead of 'enterGrades' for the rest of the test sequences, for narrative consistency)
withdrawStudent = removeFromDictionary "Sarah" addGrades
    
-- Check the grade of student John (if student not found, it will return -1 as the grade)
checkGrade = findInDictionary "John" (withdrawStudent)

-- Find all students who are failing the course 
-- (assumption: failing grade is anything below 1 ('D' per Amherst scale))
isFailing = valuesBelow 1 (withdrawStudent) 

-- Returns how many students in class
numOfStudents = vectorLength (withdrawStudent) 

-- class GPA
classGPA = (vectorSum withdrawStudent) / (vectorLength withdrawStudent)


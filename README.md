
# Puzzlefest
## Live URL link
https://puzzle-fest-swetha.herokuapp.com/
## Sonarcloud link
https://sonarcloud.io/project/overview?id=Swetha-saravanan_Puzzle_fest
## Features
* Register
* Login
* Creating assessments
* Adding questions
* Edit questions
* Delete questions
* Set timer
* Generating random number and displaying on board
* Hosting quiz
* Answers
* Dashboard
## Register
- All inputs are required.
- User name must contain minimum 3 characters and never be empty.
- Emailid is not be the exist one.
- Phone number must contain 10 numbers.
- Password and Confirm Password must in 8 to 15 characters.
- Password will be stored as bcrypt .
- If everything is validated correctly , redirect to Login page.

## Login
- All inputs are required .
- Emailid and Password must be in the register table .
- If everything is validated , redirect to main page.

## Creating assessments
- All inputs are required .
- Then It will be create an assessment .
- It will redirect you to question adding page .

## Adding questions
- You can add three type of question while adding .
- It will be stored in database .
- By storing the type of question , it will render the templates of questions .
- All inputs are required .
- Question and options needs to be unique .
- You can add how many seconds needs to be display while writing the test .
- It will be stored in database .

## Edit questions
- By clicking the edit icon it will redirect you to Edit page of that question .
- You can change the things whatever you want and store it in database .
- Changed values will be updated according to that table .

## Delete questions
- By clicking the delete icon it will delete that specific question .
- That question will be removed on database .

## Set timer
- While adding question , there will be one input field called timer .
- It will set timing for that question .
- The game will be stored in library page .

## Generating random number and displaying on board
- In library , you can see the assessments that you have created .
- By clicking on start button it will generate random number .
- It will redirect you to next page called displaying gamepin .
- Other users need to copy that generated random number and have to insert it to their gamepin page .
- After they inserted gamepin , that user name will be display on the board who hosted the game .

## Answers
- After the host starts the game , By refresing the page you can see the question displayed on the board .
- By clicking the answer , it will be store the user answer
- Assessment has completed , it will redirect you to dashboard page .

## Dashboard
- Here , You can see your correct answer and wrong answer.
- There will be pie chart , it will display your correct and wrongs as chart .
- By clicking your name , you can see the list of questions that you have taken for the test .


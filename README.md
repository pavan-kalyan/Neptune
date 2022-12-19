# Neptune App 

Unis:

pd2720 - Pavan Kalyan Damalapati

sj3132 - Siddharth Jain

us2187 - Utkarsh Sinha

tj2481 - Twisha Jain

## Running the app

`rails server`

## Running the cucumber tests

`bundle exec cucumber`

## Running the rspec tests

`bundle exec rspec`

Heroku Link: https://stormy-eyrie-03532.herokuapp.com/

GitHub Link: https://github.com/pavan-kalyan/Neptune

## Using the Application

To sign up - users can sign up either as an Employee or an Executive. Employees have rights to view their stakes in various companies. Executives are special privilege users who can create new companies. They are able to view the stakes of all employees in their company. 

To sign in - users enter their credentials and depending on their role during sign up, they view stakes. 

example input to login as Employee: email(abc3@gmail.com) and password(password).
example input to login as Executive: email(abc2@gmail.com) and password(password).
Other example inputs to login as Employee are email(abc6@gmail.com) and password(password), email(abc5@gmail.com) and password(password), email(abc4@gmail.com) and password(password), email(abc1@gmail.com) and password(password). 

Upon sign in, employees can view their stake in a company. If they try to edit their stake by clicking on their name they receive an error message.
Upon sign in, executives can edit the stake of all employees in their company. These stakes are then saved and the changes are visible to both the employee and the executive.

As an additional feature, we allow users to view their profiles. In their profile, they can choose whether they want to enrol in the standard plan or the premium plan. In the premium plan, users do not see an advertisement banner whereas standard plan users see advertisements. All accounts are enrolled in the standard plan by default. 

We also allow users to view the percentage of tokens they contain in the company. 

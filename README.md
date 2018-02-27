# When I Work - Sample API Project

This project was a lot of fun and I wish I could of completed more within the time frame! 😃

This repo is a simple API written with Ruby On Rails that demonstrates basic functionality of a user being able to see shifts assigned to them, creating shifts, and seeing related information about users who have either created the shift or have been assigned the shift.

I chose Ruby on Rails as that technology is what I'm most familiar with when creating an application like this but I'm always up for learning new and different technologies! 👍

----------------------
# Setup and Installing 💻

Make sure you have the latest version of Ruby and Ruby on Rails.

`ruby -v`<br/>

`rails -v`

If either of those show up as not being installed or not on Ruby version 2.3.1 and Rails version 5.1.5. follow the instructions [here](http://installrails.com/steps/choose_os).

Next, clone repo:<br>

`git clone git@github.com:gsaarinen/wiw_api_only_project.git`

Then `cd` into project directory and run `rails db:seed` to seed the database with some sample data.

Finally, run `rails s` as this will start the rails server and is available at the URL `localhost:3000`.

To run tests run the command `rails test`. 

----------------------
## HTTP Routes

The basic configuration is setup in the `./config/routes.rb` file where both `users` and `shifts` are set to be resources for HTTP routing.

To view all routes when they are defined via the resources method, run `rails routes` in the command while in the project's root directory and you should see all available options:

```
Prefix Verb   URI Pattern           Controller#Action
shifts GET    /shifts(.:format)     shifts#index
       POST   /shifts(.:format)     shifts#create
 shift GET    /shifts/:id(.:format) shifts#show
       PATCH  /shifts/:id(.:format) shifts#update
       PUT    /shifts/:id(.:format) shifts#update
       DELETE /shifts/:id(.:format) shifts#destroy
 users GET    /users(.:format)      users#index
       POST   /users(.:format)      users#create
  user GET    /users/:id(.:format)  users#show
       PATCH  /users/:id(.:format)  users#update
       PUT    /users/:id(.:format)  users#update
       DELETE /users/:id(.:format)  users#destroy
```

----------------------
## Data Modeling

The schema for the user table can be found in the `./db/schema.rb` file. In order to do some testing I did seed the db with some fake data which is in the `./db/seeds.rb` file.

### Users 👤

The model is available in the `./app/models/user.rb` file where the association to shifts is defined by the `has_many :shifts` method. You can also find the validations there requiring `:name`, `:email`, and `role` which is limited to the value of "employee" or "manager".

Current association is set to where a user `has_many` shifts. The association was something that I originally struggled with as I don't have separate models for a Manager or Employee, both of which would be considered a User in the system. This functionality would definitely need to be fleshed out more to restrict users who have the role of `employee` giving them only read access to data.

##### User Tests

Tests for this model can be found in `./test/models/user_test.rb`. These could definitely be expanded upon but currently test the basic validations are being met. Testing out how the `role` attribute works would be the next thing I focus on.

As of now there are not any controller tests but this is where having limitations on who can create users should be determined by the `role` attribute of the current user logged into a session. Essentially, something like:
```ruby
if @current_user.role == 'manager'
  can :edit
end
```

##### User Controller
The primary business logic is located in the `.app/controllers/users_controller.rb` file. Right now the two methods in this file `index` and `show` give the functionality within the API to display all users at the `/users` or `/users/id`. This is where I would put in logic for summing up hours given to a specific employee which is outlined in one of the user stories.

Also, this would be where I would setup logic for showing all the shifts associated with a specific user with a URL `/users/:id/shifts`.


### Shift ⏱
The model is available in the `./app/models/shift.rb` file where the association to user is defined by the `belongs_to :user` method. You can also find the validations there requiring `:start_time` and `:end_time`.

The association was a little tricky as I was unsure of where the _ownership_ of the object fall into - manager or employee. I feel like the default association needs to be with the user who created the shift (ie the manager) since they are the only ones that can create the data. Also, with my experience in the scheduling domain there are times where you might want to create a shift with no `employee_id` filled in as that could be a shift available for any employee

##### Shift Tests
Currently, there is only one test for the model in the `./test/models/shift_test.rb` file but it's commented out as I was not getting a valid object in my setup. This is where I last left off as I was investigating why `assert @shift.valid?` came back false in my test. Definitely more can be fleshed in these test concerning validation of the shift object.

##### Shift Controller
The primary business logic for shifts is located in the `.app/controllers/shifts_controller.rb` file. Right now the three methods in this file `index`, `create`, and `show` give the functionality within the API to display all shifts at the `/shifts` or `/shifts/:id`. I was still in the progress of getting the `create` method up and running so the application could take on `POST` requests and create shifts.



---------------------

## User Stories
 - [x] As a manager, I want to contact an employee, by seeing employee details.

Hitting the `localhost:3000/users/` URL will list out all the users with their associated contact info in a JSON formatted response. If you know the specific user id you are looking for the `localhost:3000/users/[id]` will return just the specific user associated with that ID.

##### Proposed Next Step
The next step I would take in the user story would be to serialize the JSON responses. This would allow only defined attributes to be exposed rather than the entire object which could be dangerous if sensitive information like passwords or employee details were to be stored.

-----------------------

## In progress

The following user stories were not quite yet implemented but I would love to have a further discussion about how I would implement them! 😎

- [ ] As an employee, I want to know when I am working, by being able to see all of the shifts assigned to me.
- [ ] As an employee, I want to know who I am working with, by being able to see the employees that are working during the same time period as me.
- [ ] As an employee, I want to know how much I worked, by being able to get a summary of hours worked for each week.
- [ ] As an employee, I want to be able to contact my managers, by seeing manager contact information for my shifts.

- [ ] As a manager, I want to schedule my employees, by creating shifts for any employee.
- [ ] As a manager, I want to see the schedule, by listing shifts within a specific time period.
- [ ] As a manager, I want to be able to change a shift, by updating the time details.
- [ ] As a manager, I want to be able to assign a shift, by changing the employee that will work a shift.
- [x] As a manager, I want to contact an employee, by seeing employee details.

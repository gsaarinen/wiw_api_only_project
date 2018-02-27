# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {
    name:  'Bob Smith',
    role:  'employee',
    email: 'bob.smith@example.com',
    phone: '1235552943'
  },
  {
    name:  'Lisa Simpson',
    role:  'employee',
    email: 'lisa.simpson@example.com',
    phone: '3215552862'
  },
  {
    name:  'Yassin Omar',
    role:  'manager',
    email: 'yassin.omar@example.com',
    phone: '6643451234'
  }
])


shifts = Shift.create([
  {
    manager_id: 3,
    employee_id: 1,
    break: 30.0,
    start_time: DateTime.new(2018,3,1,8,30),
    end_time: DateTime.new(2018,3,1,14),
  },
  {
    manager_id: 3,
    employee_id: 1,
    break: 30.0,
    start_time: DateTime.new(2018,3,2,8,30),
    end_time: DateTime.new(2018,3,2,14),
  },
  {
    manager_id: 3,
    employee_id: 2,
    break: 30.0,
    start_time: DateTime.new(2018,3,1,9,30),
    end_time: DateTime.new(2018,3,1,15),
  },
  {
    manager_id: 3,
    employee_id: 2,
    break: 30.0,
    start_time: DateTime.new(2018,3,2,9,30),
    end_time: DateTime.new(2018,3,2,15),
  },
  {
    manager_id: 3,
    employee_id: 2,
    break: 30.0,
    start_time: DateTime.new(2018,3,1,9,30),
    end_time: DateTime.new(2018,3,1,15),
  },
  {
    manager_id: 3,
    employee_id: 2,
    break: 30.0,
    start_time: DateTime.new(2018,3,3,8,30),
    end_time: DateTime.new(2018,3,3,15),
  },
])

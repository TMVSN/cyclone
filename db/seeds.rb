def random_address
  ["1 Rue Cremieux 75012 Paris", "5 Avenue Montaigne 75008 Paris",  "40 Avenue des Champs Elysées 75008", "1 Avenue de la Republique 75011 Paris", "56 rue la Boetie 75008 Paris", "8 Passage Desgrais 75019 Paris", "14 Rue du Départ 75014 Paris", "10 Rue des Petites Ecuries 75010 Paris", "9 Rue de la Pierre Levée 75011 Paris", "56 Rue de la Fontaine au Roi 75011 Paris", "116 Avenue Kleber 75016 Paris", "12 Rue Gasnier Guy 75020 Paris", "70 Rue de Belleville 75020 Paris", "6 Place Leon Blum 75011 Paris", "13 Avenue de France 75013 Paris", "12 Rue de Cotte 75012 Paris", "48 Rue Croix des Petits Champs 75001 Paris", "50 Rue Lecourbe 75015 Paris", "5 Rue Linois 75015 Paris", "30 Rue Didot 75014 Paris", "2 Place d'Italie 75013 Paris"].sample
end

def random_name
  "#{Faker::Name.first_name} #{Faker::Name.last_name }"
end

def manager_id
  User.where(manager: true).where(fixer: false).ids.last
end

def fixer_id
  User.where(manager: false).where(fixer: true).ids.sample
end

def customer_id
  User.where(manager: false).where(fixer: false).ids.sample
end

puts "Burning orders"
Order.destroy_all
puts "Killing users"
User.destroy_all

puts "creating manager"
manager = User.new(
  email: "manager@manager.com",
  password: "password",
  first_name: "Manager",
  last_name: "Reganam",
  address: random_address,
  manager: true,
  fixer: false,
)
manager.save!
puts "Manager is born !"

puts "creating fixer"
fixer = User.new(
  email: "fixer@fixer.com",
  password: "password",
  first_name: "Fixer",
  last_name: "Rexif",
  address: random_address,
  manager: false,
  fixer: true,
)
fixer.save!
puts "fixer is born !"

puts "creating customer"
customer = User.new(
  email: "customer@customer.com",
  password: "password",
  first_name: "Customer",
  last_name: "Remotsuc",
  address: random_address,
  manager: false,
  fixer: false,
)
customer.save!
puts "customer is born !"

puts "creating 10 fixers"
10.times do
  fixer = User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: random_address,
    manager: false,
    fixer: true,
  )
  fixer.save!
end
puts "fixers are ready !"

puts "creating 10 customers"
10.times do
  customer = User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: random_address,
    manager: false,
    fixer: false,
  )
  customer.save!
end
puts "customers are ready !"

puts "Creating orders to fix"
10.times do
  date = "2021-01-#{rand(01..31)} 09:00:00"
  order = Order.new(
    address: random_address,
    date: date,
    fixed: false,
    customer_id: customer_id,
  )
  order.save!
end
puts "Orders to fix are ready !"

puts "Creating fixed orders"
10.times do
  date = "2020-11-#{rand(01..30)} 09:00:00"
  order = Order.new(
    address: random_address,
    date: date,
    fixed: true,
    customer_id: customer_id,
    fixer_id: fixer_id,
  )
  order.save!
end
puts "Fixed orders are ready !"

puts "Let's get to work !"
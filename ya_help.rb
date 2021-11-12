# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }
user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}



# access user1 name through user1
def get_name(user)
  return user[:name]
end

get_name(user1)

# access user1 name through res2 (user1 data is in reviews)
@users = [user1,user2]
def get_nested_name(restaraunt)
  user_id = restaraunt[:reviews][0][:user_id]
  user_id.class
  user = @users.find { |users| users[:id] == user_id }
  user[:name]
end

get_nested_name(res1) 


# access res1 reviews
def access_reviews(restaraunt)
  restaraunt[:reviews]
end

p access_reviews(res1)

# what does this output res1[:dishes]

# this will output an array of hashes where each hash is a dish the restaraunt serves including the name, the price, and an array of ingredients

# print out just the name or res1 dishes (each loop)
def restaraunt_menu(restaraunt)
  menu = []
  restaraunt[:dishes].each do |dish|
    menu<<(dish[:name])
  end
  menu
end

restaraunt_menu(res1)

# print out just the name or res1 dishes along with ingredients (nested each loop)

def menu_with_ingredients(restaraunt)
  menu = []
  restaraunt[:dishes].each do |dish|
    menu.push("#{dish[:name]} contains ")
    dish[:ingredients].each do |ingredient|
      menu.push("#{ingredient} ")
    end
  end
  menu.join
end

menu_with_ingredients(res1)

# create a function that takes a user and return a string with the users name and id
# create a method that takes a res and returns the menu of that res
# create that takes a res and returns average review
# create an array of restaurants and do CRUD actions
# a simple that takes a restaurants and adds to your array
#      a simple that takes restaurants and updates that to your array
# loop through your restaurants and return those with likes > 500 (select/filter)
# I want to think of ideas simple/hard and through them in slack
# more to come
# No interaction with terminal
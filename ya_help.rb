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

@users = [user1,user2]
@restaurants = [res1,res2]

# access user1 name through user1
def get_name(user)
  return user[:name]
end

get_name(user1)

# access user1 name through res2 (user1 data is in reviews)
def get_nested_name(restaurant)
  user_id = restaurant[:reviews][0][:user_id]
  user_id.class
  user = @users.find { |users| users[:id] == user_id }
  user[:name]
end

get_nested_name(res2) 


# access res1 reviews
def access_reviews(restaurant)
  reviews = []
  restaurant[:reviews].each do |review|
    reviews.push("User #{review[:user_id]} gave this restaurant #{review[:rating]} stars")
  end
  reviews.join("\n")
end

access_reviews(res1)

# what does this output res1[:dishes]

# this will output an array of hashes where each hash is a dish the restaraunt serves including the name, the price, and an array of ingredients

# print out just the name or res1 dishes (each loop)
def restaurant_menu(restaurant)
  menu = []
  restaurant[:dishes].each do |dish|
    menu<<(" #{dish[:name]}: #{dish[:price]}")
  end
  menu.join("\n")
end

restaurant_menu(res1)

# print out just the name or res1 dishes along with ingredients (nested each loop)

def menu_with_ingredients(restaurant)
  menu = []
  restaurant[:dishes].each do |dish|
    menu.push("#{dish[:name]} contains ")
    dish[:ingredients].each do |ingredient|
      menu.push("#{ingredient} ")
    end
  end
  menu.join
end

menu_with_ingredients(res1)

# create a function that takes a user and return a string with the users name and id

def print_user(user)
  if @users.include?(user)
    "#{user[:name]} has the id #{user[:id]}"
  end 
end

print_user(user2)

# create a method that takes a res and returns the menu of that res

def print_menu (res)
menu = []
res[:dishes].each do |dish|
  ingredient_list = []
  dish[:ingredients].each do |ingredient|
    ingredient_list.push("#{ingredient}")
    end
  ingredients_string = ingredient_list.join(' and ')
  menu.push("#{dish[:name]}:\n    contains #{ingredients_string}\n    Price: $#{dish[:price]}\n")
  end
  menu.join
end

print_menu(res1)

# create a function that takes a res and returns average review

def average_review(res)
  ratings = []
  res[:reviews].each do |review|
    ratings.push(review[:rating])
  end
  ratings
  ratings_total = ratings.reduce(:+)
  num_ratings = ratings.length
  average_review = ratings_total / num_ratings
end

average_review(res2)

# create an array of restaurants and do CRUD actions

# array created above

# Create method  that takes a restaurant and adds to your array

new_res = {
  id: 3,
  name: "Tony's",
  location: {
    city: "Kodiak",
    state: "AK",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 12,
  dishes: [
    { name: "Burger", price: 16.85, ingredients: ["Burger", "Bun", "Lettuce"] },
    { name: "Salad", price: 12.95, ingredients: ["lettuce", "Cheese", "Dressing"] },
    { name: "King Crab", price: 52.95, ingredients: ["Crab", "Lemon-Butter", "Fries"] },

  ],
  reviews: [
    {user_id: 1, rating: 2},
    {user_id: 2, rating: 1},
  ]
}

def add_res(new_res)
  @restaurants.push(new_res)
  @restaurants
end

add_res(new_res)

# Read: a method that displays all res info

def disp_res(res)
index = @restaurants.find_index(res)
menu = print_menu(res)
ave_review = average_review(res)
"#{@restaurants[index][:name]} is located in #{@restaurants[index][:location][:city]}, #{@restaurants[index][:location][:state]} and is open #{@restaurants[index][:days_open]}. \n number of likes: #{@restaurants[index][:likes]}\nAverage Review: #{ave_review} stars\nMenu:#{menu}" 
end

p disp_res(res1)
#      Update: a  method that takes restaurants and updates that to your array

def update_res(res, change, new_val)
  index = @restaurants.find_index(res)
  @restaurants[index][change] = new_val
  @restaurants
end

update_res(res1, :name, "Angelo's cantina")

#      Deletes a method that deletes res from arr

def delete_res(res)
  index = @restaurants.find_index(res)
  @restaurants.delete_at(index)
  @restaurants
end

delete_res(res1)

# loop through your restaurants and return those with likes > 500 (select/filter)

def highly_rated (restaurants)
  highly_rated_restaraunts = restaurants.select {|res| res[:likes] > 500}
end

highly_rated(@restaurants)


# I want to think of ideas simple/hard and add them in slack
# more to come
# No interaction with terminal 
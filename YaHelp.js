// a resturuant looks like this
// res_data = {
//   id: INTEGER *MUST BE UNIQUE,
//   name: STRING,
//   location: {
//     city: STRING,
//     state: STRING,
//   },
//   delivery: BOOLEAN,
//   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
//   likes: INTEGER,
//   dishes: ARRAY OF OBJECTS/HASHES
//     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
//   ],
//   reviews: ARRAY OF HASHES [
//     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
//   ]
// }
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

// access user1 name through user1




// access user1 name through res2 (user1 data is in reviews)




// access res1 reviews




// what does this output: res1[:dishes]



// print out just the name on res1 dishes (each loop)



// print out just the name on res1 dishes along with ingredients (nested each loop)



// create a function that takes a user and returns a string with the users name and id




// create a method that takes a res and returns the menu of that res




// create a function that takes a res and returns average review




// create an array of restaurants and do CRUD (Create, Read, Update, Destroy) actions on that array




// Create: a method  that takes a restaurant and adds to your array




// Read: a method that display all res info



//      Update: a  method that takes restaurants and updates that to your array



//      Delete: a method that deletes res from arr



// loop through your restaurants and return those with likes > 500 (select/filter)



// I want you to think of ideas simple/hard and try implementing them



// more to come
// No interaction with the terminal need for this assignment

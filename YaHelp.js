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
let user1 = {
  id: 1,
  name: "Tony",
};
let user2 = {
  id: 2,
  name: "Sally",
};
let res1 = {
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
};
let res2 = {
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
};

let users = [user1,user2];
let restaurants = [res1,res2];

// access user1 name through user1
const getName = (user)=> {
  return user.name;
};

console.log(getName(user1));

// access user1 name through res2 (user1 data is in reviews)
const getNestedName = (restaurant) => {
  let userID = restaurant.reviews[0].user_id
  let user = users.find((users) => { return users.id === userID });
  return user.name;
};

console.log(getNestedName(res2));



// access res1 reviews
const accessReviews = (restaurant) => {
  let reviews =[];
  restaurant.reviews.forEach((review) => { 
    reviews.push(`User ${review.user_id} gave this restaurant ${review.rating} stars`) }
  );
  return reviews.join('\n')
};

console.log(accessReviews(res1));

// what does this output: res1[:dishes]

// this will output an array of hashes where each hash is a dish the restaraunt serves including the name, the price, and an array of ingredients

// print out just the name on res1 dishes (each loop)
const restaurantMenu =(restaurant) => {
  menu =[];
  restaurant.dishes.forEach((dish) => {
    menu.push(`${dish.name}: ${dish.price}`)
  });
  return menu.join('\n');
};

console.log(restaurantMenu(res1));

// print out just the name on res1 dishes along with ingredients (nested each loop)

const menuWithIngredients = (restaurant) => {
  let menu = [];
  restaurant.dishes.forEach((dish)=> {
    menu.push(`${dish.name} contains `)
    dish.ingredients.forEach((ingredient)=>{
      menu.push(`${ingredient} `)
    });
  });
  return menu.join('')
};

console.log(menuWithIngredients(res1));

// create a function that takes a user and returns a string with the users name and id


const printUser = (user) => {
  if(users.includes(user)){
  return `${user.name} has the id ${user.id}`};
};

console.log(printUser(user2));

// create a method that takes a res and returns the menu of that res

const printMenu = (res) => {
  let menu = [];
  res.dishes.forEach((dish)=>{
    let ingredientList = [];
    dish.ingredients.forEach((ingredient)=>{
      ingredientList.push(`${ingredient}`)
    });
    let ingredientString = ingredientList.join(' and ');
    menu.push(`${dish.name}:\n contains ${ingredientString}\n Price: $${dish.price}\n`)
  });
  return menu.join('')
};

console.log(printMenu(res1));

// create a function that takes a res and returns average review

const averageReview = (res) => {
  let ratings = [];
  res.reviews.forEach((review)=>{ratings.push(review.rating)});
  let ratingsTotal = ratings.reduce((total, num) => { return total + num }, 0);
  let numRatings = ratings.length;
  let averageReview = ratingsTotal/numRatings;
  return averageReview;
};

console.log(averageReview(res2));



// create an array of restaurants and do CRUD (Create, Read, Update, Destroy) actions on that array

// array created above

// Create: a method  that takes a restaurant and adds to your array

let newRes = {
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

const addRes = (newRes) => {
  restaurants.push(newRes);
  return restaurants;
};

console.log(addRes(newRes));

// Read: a method that display all res info



//      Update: a  method that takes restaurants and updates that to your array



//      Delete: a method that deletes res from arr



// loop through your restaurants and return those with likes > 500 (select/filter)



// I want you to think of ideas simple/hard and try implementing them



// more to come
// No interaction with the terminal need for this assignment

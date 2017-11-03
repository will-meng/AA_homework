function titleize(array, cb) {
  let titleized_names = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  cb(titleized_names);
}

titleize(["Mary", "Brian", "Leo"], names => {
  names.forEach(name => console.log(name));
});
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt
// undefined

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let idx = getRandomInt(0, this.tricks.length);
  console.log(`${this.name} is ${this.tricks[idx]}!`);
};

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

herd.forEach(name => Elephant.paradeHelper(name));

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please";

  return function(food) {
    order = order.slice(0, order.length - 8);
    console.log(`${order} and ${food} please`);
  };
}

 let bfastOrder = dinerBreakfast();
 bfastOrder("chocolate chip pancakes");

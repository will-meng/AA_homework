function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x); // in block
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x); // out of block
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  // error
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x); // out of block
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x); // error
}

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ` +
    `${noun.toUpperCase()}.`;
}
madLib('make', 'best', 'guac');

function isSubstring(searchString, subString) {
  return searchString.indexOf(subString) > -1;
}

isSubstring("time to program", "time") // true
isSubstring("Jump for joy", "joys") // false


function fizzBuzz(array) {
  const result = [];
  array.forEach(function(el) {
    if ((el % 3 === 0) ^ (el % 5 === 0))
      result.push(el);
  });
  return result;
}

fizzBuzz([1, 3, 5, 6, 10, 12, 15])

function isPrime(n) {
  if (n < 2) return false;
  let i = 2;
  let sqrt = Math.floor(Math.sqrt(n))
  while (i <= sqrt) {
    if (n % i == 0)
      return false;
    i++;
  }
  return true;
}

isPrime(2)
// true

isPrime(10)
// false

isPrime(15485863)
// true

isPrime(3548563)
// false

function sumOfNPrimes(n) {
  let sum = 0;
  let num_primes = 0;
  let i = 2;
  while (num_primes < n) {
    if (isPrime(i)) {
      sum += i;
      num_primes++;
    }
    i++;
  }
  return sum;
}

sumOfNPrimes(0)
// 0

sumOfNPrimes(1)
// 2

sumOfNPrimes(4)
// 17

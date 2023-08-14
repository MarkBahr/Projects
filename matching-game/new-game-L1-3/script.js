"use strict";

// Variables for different elements, accessed by class.
const button = document.querySelectorAll(".button");
const reset = document.querySelector(".reset");
let scorePlayer1 = document.querySelector(".score--0");
// let scorePlayer2 = document.querySelector(".score--1");
const nextLevel = document.getElementById("next-level");
const newGame = document.querySelector(".new-game");
const checkMatch = document.querySelector(".check-match");
const results = document.querySelector('.results');

// Variable for each image, accessed by id.
let image_1 = document.getElementById("img-1");
let image_2 = document.getElementById("img-2");
let image_3 = document.getElementById("img-3");
let image_4 = document.getElementById("img-4");
let image_5 = document.getElementById("img-5");
let image_6 = document.getElementById("img-6");
let image_7 = document.getElementById("img-7");
let image_8 = document.getElementById("img-8");
let image_9 = document.getElementById("img-9");
let image_10 = document.getElementById("img-10");
let image_11 = document.getElementById("img-11");
let image_12 = document.getElementById("img-12");

// Variable for each button, for accessing by id.
const button1 = document.getElementById("btn-1");
const button2 = document.getElementById("btn-2");
const button3 = document.getElementById("btn-3");
const button4 = document.getElementById("btn-4");
const button5 = document.getElementById("btn-5");
const button6 = document.getElementById("btn-6");
const button7 = document.getElementById("btn-7");
const button8 = document.getElementById("btn-8");
const button9 = document.getElementById("btn-9");
const button10 = document.getElementById("btn-10");
const button11 = document.getElementById("btn-11");
const button12 = document.getElementById("btn-12");

let score = 0;

// Makes the card flip.
const flipCard = function () {
  for (let i = 1; i < button.length + 1; i++) {
    // Assign each button a picture.
    let btn = document.getElementById(`btn-${i}`);
    let img = document.getElementById(`img-${i}`);

    /* When a button is clicked, flip the card. The first part of the if statement reveals the card, 
        the else if only hides it if the card's match has not been found. */
    btn.addEventListener("click", function () {
      if (img.classList.contains("hidden")) {
        img.classList.remove("hidden");
      } else if (!img.classList.contains("found")) {
        img.classList.add("hidden");
      };
    });
  };
};

flipCard();

// Message that a match is correct!
const isCorrect = function () {
  results.textContent = 'Correct!';
  results.classList.remove("results");
  results.classList.remove("incorrect");
  results.classList.add("correct");
};

// Message that a match is inccorrect!
const notCorrect = function() {
  results.textContent = 'Not a Match!';
  results.classList.remove("results");
  results.classList.remove("correct");
  results.classList.add("incorrect");
};

// Check for a match that has not already been found. If it has the found class, then it has already been found.
const findMatch = function () {
  if (
    !image_1.classList.contains("found") &&
    !image_1.classList.contains("hidden") &&
    !image_6.classList.contains("hidden")
  ) {
    image_1.classList.add("match");
    image_6.classList.add("match");
    isCorrect();
  } else if (
    !image_11.classList.contains("found") &&
    !image_11.classList.contains("hidden") &&
    !image_7.classList.contains("hidden")
  ) {
    image_11.classList.add("match");
    image_7.classList.add("match");
    isCorrect();
  } else if (
    !image_4.classList.contains("found") &&
    !image_4.classList.contains("hidden") &&
    !image_5.classList.contains("hidden")
  ) {
    image_4.classList.add("match");
    image_5.classList.add("match");
    isCorrect();
  } else if (
    !image_2.classList.contains("found") &&
    !image_2.classList.contains("hidden") &&
    !image_12.classList.contains("hidden")
  ) {
    image_2.classList.add("match");
    image_12.classList.add("match");
    isCorrect();
  } else if (
    !image_8.classList.contains("found") &&
    !image_8.classList.contains("hidden") &&
    !image_3.classList.contains("hidden")
  ) {
    image_8.classList.add("match");
    image_3.classList.add("match");
    isCorrect();
  } else if (
    !image_10.classList.contains("found") &&
    !image_10.classList.contains("hidden") &&
    !image_9.classList.contains("hidden")
  ) {
    image_10.classList.add("match");
    image_9.classList.add("match");
    isCorrect();
  } else {
    notCorrect();
  }
};

// Function for showing yellow color on button if match is found.
const showMatch = function () {
  if (
    image_1.classList.contains("found") &&
    !button1.classList.contains("found")
  ) {
    button1.classList.add("found");
    button6.classList.add("found");
  };
  if (
    image_3.classList.contains("found") &&
    !button3.classList.contains("found")
  ) {
    button3.classList.add("found");
    button8.classList.add("found");
  };
  if (
    image_5.classList.contains("found") &&
    !button5.classList.contains("found")
  ) {
    button5.classList.add("found");
    button4.classList.add("found");
  };
  if (
    image_9.classList.contains("found") &&
    !button9.classList.contains("found")
  ) {
    button9.classList.add("found");
    button10.classList.add("found");
  };
  if (
    image_2.classList.contains("found") &&
    !button2.classList.contains("found")
  ) {
    button2.classList.add("found");
    button12.classList.add("found");
  };
  if (
    image_7.classList.contains("found") &&
    !button7.classList.contains("found")
  ) {
    button7.classList.add("found");
    button11.classList.add("found");
  };
};

// Check for a match. If a match, add 1 point to current player's score.
checkMatch.addEventListener("click", function () {
  findMatch();

  // If pair of cards shown are a match, execute the showMatch function and add a point to the current player's score.
  for (let i = 1; i < button.length + 1; i++) {
    let img = document.getElementById(`img-${i}`);
    if (!img.classList.contains("hidden") && img.classList.contains("match")) {
      
      // Add 1 point to the score for each match
      score += 0.5;
      scorePlayer1.textContent = score;
      
      // Show Next Level button if score = 6. 
      if (score === 6) {
        nextLevel.classList.remove("hidden");
        console.log(score);
      };
      

      // Show that it's a match
      img.classList.add("found");
      showMatch();

      // Remove the match class
      img.classList.remove("match");
    };
  };
});



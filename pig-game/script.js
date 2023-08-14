'use strict';

// Uusually he likes to use query selector
// Define them at the top of your file instead of having to select them multiple times.
// Selecting elements
const player0El = document.querySelector('.player--0');
const player1El = document.querySelector('.player--1');

const score0El = document.querySelector('#score--0');

// By ID is a little faster. 
const score1El = document.getElementById('score--1'); 
const current0El = document.getElementById('current--0');
const current1El = document.getElementById('current--1');

const diceEl = document.querySelector('.dice');
const btnNew = document.querySelector('.btn--new');
const btnRoll = document.querySelector('.btn--roll');
const btnHold = document.querySelector('.btn--hold');

// Conditions when the game starts.
score0El.textContent = 0;
score1El.textContent = 0;
diceEl.classList.add('hidden');

const scores = [0,0];
let currentScore = 0;
let activePlayer = 0;

// State variable when playing, i.e. no winner.
let playing = true;

// Switces whose turn it is. 
const switchPlayer = function() {
    document.getElementById(`current--${activePlayer}`).textContent = 0;
    activePlayer = activePlayer === 0 ? 1 : 0;
    currentScore = 0;
    
    // Toggle adds the class if it is not present, and takes it away if it is.
    player0El.classList.toggle('player--active');
    player1El.classList.toggle('player--active');
};

// Rolling Dice Functionality.
btnRoll.addEventListener('click', function() {
    // if(playing) is equivalent to if(playing === true)
    if (playing) {
        // 1. Generate a randum dice roll
        const dice = Math.trunc(Math.random() * 6) + 1;
        
        // 2. Display the dice.
        diceEl.classList.remove('hidden');
        diceEl.src = `dice-${dice}.png`; // This dynamically adds diff img for rolled dice.

        // 3. Check for a rolled 1
        if(dice !== 1) {
            // Add dice to current score
            currentScore += dice;
            document.getElementById(`current--${activePlayer}`).textContent = currentScore;
            
        } else {
        // switch to next player.
            switchPlayer();
        }
    }
});

btnHold.addEventListener('click', function() {
    if (playing) {
        // 1. Add current score to active player's score
        scores[activePlayer] += currentScore; 
        // above line says: scores[1] = scores[1] + currentScore
        document.getElementById(`score--${activePlayer}`).textContent = scores[activePlayer];
        
        // 2. Check if players' score is >= 100
        if(scores[activePlayer] >= 100) {
            // Finish the game, select class
            playing = false;
            document.querySelector(`.player--${activePlayer}`).classList.add('player--winner');
            document.querySelector(`.player--${activePlayer}`).classList.remove('player--active');
            diceEl.classList.add('hidden');
        } else {
            // Switch to the next player.
            switchPlayer();
        }
    }
});

const init = function() {
    // Remove the player--winner class so there is no longer a winner
    document.querySelector(`.player--${activePlayer}`).classList.remove('player--winner');
    
    // Reset variables back to 0
    currentScore = 0;
    activePlayer = 0;
    scores[0] = 0;
    scores[1] = 0;
    
    // Set text content of scores and current scores to 0
    score0El.textContent = 0;
    score1El.textContent = 0;
    current0El.textContent = 0;
    current1El.textContent = 0;
    
    // Playing reset to true for new game
    playing = true;
    
    // Set active player back to player--0 (player 1)
    player0El.classList.add('player--active');
    player1El.classList.remove('player--active');
        
    // Take away dice if still present
    if (!diceEl.classList.contains('hidden')) {
        diceEl.classList.add('hidden');
    }
};

// When the new game button is pressed, reset the game
// The function init is not called here, but JS will when button is clicked.
btnNew.addEventListener('click', init);

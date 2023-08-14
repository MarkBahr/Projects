# Plans for Matching Game

Once the display of 12 buttons looks good

1. DONE Format images
   a. Get 12 images of presidents of the U.S. - Level 1: Washington, Adams, Jefferson, Madison, Monroe, Buchanan (6th pres) - Level 2:
   b. Crop them for square size.
   c. Make labels for each one and format to square size.
   d. Make sure named correctly.

2. DONE Insert images and make the appear and disappear when clicked.
   a. Make hidden class, and all have hidden class to begin with in html.
   b. Use for loop to both assign the images to buttons, and to hide / reveal when clicked.

3. DONE List the score
   DONE a. Make just one column player 1 & rename it score and get rid of player 2.
   DONE b. Display each player's name (Find out how to undo columns to get rid of player 2.)
   DONE c. Display (calculate) their current score.
   DONE d. The score updates each time they get a match.
   DONE e. This means you have to have a way for the JS to tell if it's a match.

4. Make it so that when the reset/new game button is pressed, that the
   images are re-assigned to different cards, but not randomely (only works once).  (img id)

- listen for button pressed
- when it's pressed, the src for image has to be changed
- Use a random # from 1-12 for a certain card, and have the rest
  given that plus one till you get to 12, and then the remainder added
  as well. It could be a variable assigned to math.random(\* 12) and the others + 1, and then once
  to 12, have the others be the numbers lower than that random variable.

5. Make a next level.
   a. Images / cards
      i. Insert all the images of the presidents
      ii. resize each of the 12 images so that it looks perfect, like level 1.
   b. Scramble where the matches are located & listen for those instead when pressing match
   c. Finishing touches, all done, and submit on my website.

6. Make the New Game button restore all of the original conditions at the beginning of the game. (no scrambling of cards)

7. Managing matches
    a. Make opacity of matched (yellow) cards blurry
    b. Make so when you press on cards whose matched have been found, that they no longer flip the card over.
    c. (optional) If you press check match, have a way of saying it's not a match and automatically turning back over the cards that haven't been yellowed.

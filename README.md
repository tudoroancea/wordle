# Wordle

A Flutter implementation of the popular game [Wordle](https://www.powerlanguage.co.uk/wordle/) (english version).

## The game
Everyday, a unique word is chosen and you have to guess it in a Mastermind fashion.
You have 6 attempts to guess it and each time the letters that appear in the word but are not correctly placed are indicated in yellow, and those correctly placed in green.

## How to play

This game is coded using the [Dart language](https://dart.dev) and the [Flutter framework](https://flutter.dev).
They offer possibilities to develop cross-platform applications for mobile, web and desktop. 
If you want to try the game on your mobile device, you can install the Flutter SDK and run the game on your favorite device following these steps : https://docs.flutter.dev/get-started/install  

## ⚠️ Disclaimer
The word list is currently hardcoded in a JSON file you can find in the folder `assets` (and in the Python script in the `scripts` folder used to geenrate it).
In the future (see roadmap section), the list would stored remotely (eg with Firebase) and retrieved via API calls.

So don't spoil yourselves ! 🙃

## Roadmap

Some features I would like to implement :

[ ] Improve UI  (type directly in the grid and not in a text field, add animations for colors, add celebration animation for winning)
[ ] Store statistics on device to see score evolution  
[ ] Add state restoration to make sure one cannot quit the app and start over to get a better score the same day  
[ ] Add light and dark themes  
[ ] Add a remote database for storing the dictionary and generating the day's word. Eg a Firebase database could be used and users could also create an account to sync their scores and preferences accross devices.


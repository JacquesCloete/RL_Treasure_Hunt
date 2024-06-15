
# Reinforcement Learning as a Treasure Hunt 🏝️

![](resources/example.gif)

## Introduction

Ahoy there, adventurer! 🏴‍☠️

In *Reinforcement Learning as a Treasure Hunt*, you are tasked with collecting as many coins as you can within a limited number of turns. The coins are buried on a desert island, hidden beneath the sand. However, they seem to follow a pattern in how they are buried, related to the many landmarks scattered around the island. Can you figure out the pattern, and use this to your advantage?

This game seeks to teach players about the [Exploration/Exploitation Dilemma](https://en.wikipedia.org/wiki/Exploration-exploitation_dilemma), a key concept in reinforcement learning. The idea is that an agent should try to explore the unknown environment to learn which actions will give it the highest expected reward (in this case, the number of coins it collects), but it must also take the opportunity to extract this reward; since the agent has a limited number of actions, it must strike a balance between these goals!

The game was originally designed to be played by children aged 5-13, but we've found that it was enjoyed by players of all ages.

The game can also be run as an interactive activity perfect for family-friendly events. We ran the game as an activity at the [Oxford Maths Festival 2024](https://mathsfest.web.ox.ac.uk/home) to great success.

## Installation

**NOTE:** You must have [MATLAB](https://uk.mathworks.com/products/matlab.html) installed on your machine to run this game.

To install the game, simply clone this repo into a directory accessible by MATLAB.

Note that this game uses the [Papyrus](https://en.wikipedia.org/wiki/Papyrus_(typeface)) font, but if you do not have this font installed on your machine, it will use the default MATLAB font instead.

## Starting a Game

In the MATLAB Editor, make sure you are in this repo's directory on your machine, open the file [Game.m](Game.m) and press the green 'Run' button to start. This should load up the game window.

You can make the game appear larger on the screen by maximizing the game window.

## How to Play

To play the game, simply click on the tiles in the grid. Once the player has run out of turns, close the game window to exit the game. Currently there is no 'restart' button, and you must run the game again to play another round.

## Tips for Getting a Good Score

The coins spawn within 3x3 boxes centred on a certain type of landmark on the map (selected at random each game). To get a good score, the player should figure out which type of landmark marks the treasure. Note that you can select tiles with landmarks in them, and the correct landmark always gives a coin when selected.

The coins also spawn in the same pattern within the 3x3 boxes (again, randomly generated each game); if the player figures out how the treasure is buried around one landmark, they also know how it's buried around other landmarks of the same type.

Note that, even when knowing exactly how the game works and playing optimally, it is very unlikely that you will get the maximum possible score!

## Changing Game Parameters

The top of the file [Game.m](Game.m) contains some parameters that can be tuned to make the game easier or harder, such as increasing the number of landmarks or decreasing the number of turns.

We found the current setup to work well for an audience of children aged 5-13.

The same file also defines the size and placement of all the graphical elements. If you encounter graphical issues with certain elements, such as the row and column labels for the grid (as I did when running the game on a different laptop), we suggest changing their size and location until you're happy with the result.

## Running as an Interactive Activity at an Event

We recommend using a projector and screen to present the game. this helps the activity stand out from a distance and means that participants don't need to crowd around a small screen.

The activity runs more smoothly if the participant calls out their chosen tile (using the row and column labels) for a dedicated game operator to select, rather than giving the participant direct control. This is especially the case for younger participants.

The game benefits from having two game operators at a time; one to operate the game from a laptop while the other interacts with the participant (perhaps giving them hints if they are stuck).

We also suggest that you reward participants with a prize after playing; we offered chocolate gold coins as well as plastic coins and gems.

## Pre/Post Game Script

We provide an [example script](Script.md), for introducing the game to new players as well as discussing what they've learned after playing. The idea is that we want to introduce the rules of the game in an engaging and approachable way, as well as giving some hints to point them in the right direction. After the player has completed the game, we take the opportunity to draw a relation to reinforcement learning (again, in a way that is approachable to children).

## Credits

Lead Game Designers: Jacques Cloete, Harry Mead

Software Developers: Jacques Cloete, Harry Mead

Maintainer: Jacques Cloete

Documentation Author: Jacques Cloete

Pre/Post-Game Script Writer: Darius Muglich

Credit to Luisa Kurth, Shozen Dan, Paula Cordero Encinar, Marcel Hedman and Rafael Brutti for helping to design the game.

## Attributions for Graphics

The island background graphic was designed by Jacques Cloete, with the use of <a href="https://deepai.org/">DeepAI</a> for a first draft.

The shadow and grid graphics were made by Jacques Cloete.

All other graphics were designed by [FreePik](https://www.freepik.com/):
- Coin: <a href="https://www.freepik.com/icon/coin_1428267#fromView=search&page=1&position=33&uuid=d8e35e39-c38b-4d3b-a257-344846315b96">Icon by Nikita Golubev</a>
- Anchor: <a href="https://www.freepik.com/icon/anchor_1044565#fromView=search&page=1&position=47&uuid=ba67422a-3a99-4198-8ee7-87f41acf09c9">Icon by Freepik</a>
- Barrel: <a href="https://www.freepik.com/icon/barrel_8583563#fromView=search&page=2&position=33&uuid=17dae03a-a9bd-49d0-88b5-d0375ffbce29">Icon by Freepik</a>
- Palm Tree: <a href="https://www.freepik.com/icon/palm-tree_2918760#fromView=search&page=3&position=16&uuid=ff8c8baf-58a6-4bab-ba02-b89b6890078c">Icon by Freepik</a>
- Rock: <a href="https://www.freepik.com/icon/nature_14923031#fromView=search&page=2&position=8&uuid=858e30b5-b4ff-4daf-86ff-48d1d3555df2">Icon by dreamicons</a>
- Shovel: <a href="https://www.freepik.com/icon/shovel_914148#fromView=search&page=4&position=59&uuid=49e1a739-af1c-4396-8df1-a64de96e0cf3">Icon by cubydesign</a>
- Bush: <a href="https://www.freepik.com/icon/bush_7053612#fromView=search&page=1&position=32&uuid=87f2188e-3928-402e-b19b-ee11dcd53dc5">Icon by Dreamcreateicons</a>
- Pirate Ship: <a href="https://www.freepik.com/free-vector/isolated-cartoon-illustration-wooden-ship_73411831.htm#fromView=search&page=4&position=38&uuid=2d125f62-0b0b-458a-beef-7a92f35867fa">Image by brgfx on Freepik</a>
- Whale Tail: <a href="https://www.freepik.com/free-vector/tail-whale-water_30770243.htm#fromView=search&page=8&position=23&uuid=443bf472-6729-4ca5-8990-e51ef58c73f0">Image by brgfx on Freepik</a>
- Pirate Boy: <a href="https://www.freepik.com/free-vector/cartoon-pirate-boy-costume_198559803.htm#fromView=search&page=1&position=52&uuid=443bf472-6729-4ca5-8990-e51ef58c73f0">Image by brgfx on Freepik</a>
- Pirate Girl: <a href="https://www.freepik.com/free-vector/cute-cartoon-pirate-girl-illustration_198556691.htm#fromView=search&page=1&position=8&uuid=1068e8cd-665b-479b-80ad-d06e4a479b30">Image by brgfx on Freepik</a>

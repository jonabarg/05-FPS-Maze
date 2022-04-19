# Project 05—FPS Maze

Project for MSCH-C220 4-18-22

A basic maze game

## Implementation

Built using Godot 3.4.2

Game includes 3 procedually generated levels of moderate complexity (each is functionally the same, but 3 must be beaten to 'win' the game). 
All models featured were created by myself.
Simple ambience and sound effects.
Interactable panels must be interacted with to proceed in game; every 2 seconds, one is chosen at random to be hazardous. There are a total of five panels, but only three are needed to progress.
Lighting effects are used sparingly to increase difficulty and to indicate players progress in level, as well as to indicate hazardous panels.
Pause menu is dependent on state of game; at start of game, menu displays instructions; in-game, menu displays progress; between levels, menu encourages player to keep going; at end of game, the menu notifys the player that they have won and prompts them to play again. Additionally, unique menu is displayed on player death.
Player is given a flashlight to help them. This has a battery that drains whenever it is used and is recharged when entering a new level.

## References

This project uses procedual generation adapted from the tutorial from [KidsCanCode](https://kidscancode.org/blog/2018/08/godot3_procgen1/)

The material assets are from this tutorial [Godot 3 Tutorial: PBR Materials](https://www.youtube.com/watch?v=pM5j8x71HcE)

Featured models were created by myself

All sounds used were recorded by myself and are of my personal Playstation 2 console. They were edited to various degrees by myself as well.

## Future Development

Fix glitch that causes player to pass through walls. Caused by rapidly turning camera while walking into wall.

## Created by 

Jonathan Barger
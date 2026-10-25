# PikoBox

> ## 🎮 Inspired by \*\*Pico Park\*\*
> \*\*PikoBox is inspired by \*Pico Park\* by TECOPARK.\*\* The idea of pushing, stacking and climbing blocks to get a tiny character through small, tight puzzle levels comes straight from that game. This is an unofficial fan project, made for a game jam. It is not affiliated with or endorsed by TECOPARK, and it uses none of Pico Park's assets.

A small 2D pixel-art platformer made with **Godot 4**, built around one idea: you are a little guy, and your size changes what you can do.

**Play it:** \[add your itch.io link here]

!\[Screenshot](screenshots/screenshot.png)

<!-- Add a screenshot at screenshots/screenshot.png, or delete this line. -->

## About

You can change your size on the fly. Each size has its own speed, jump height and push strength, and the world is built so that every size is useful somewhere. Squeeze through a tight tunnel as a tiny guy, then grow to reach higher ground. Place boxes to build your own platforms. Each level limits what you're allowed to do, so you have to think about when to use each ability.

Reach the flag to finish a level. Fall out of the world and you try again. The game counts your attempts and your time for every level.

## Inspiration: Pico Park

**This game was inspired by Pico Park.** Pico Park is a puzzle platformer by TECOPARK where tiny characters push, carry and climb blocks to reach the goal. PikoBox takes that feeling (small characters, heavy blocks, and levels that are really puzzles) and builds on it with a size-changing mechanic and boxes you place yourself. The name is a nod to it too.

If you like this, go play the real thing: **Pico Park** by TECOPARK.

## Controls

|Action|Keys|
|-|-|
|Move|**A / D** or **← / →**|
|Jump|**Space**|
|Small size|**1**|
|Medium size (default)|**2**|
|Large size|**3**|
|Place a box|**E**|
|Pause|*esc*|

## Mechanics

* **Three sizes.** Smaller is faster with a lower jump. Larger is slower with a higher jump and a stronger push.
* **Size limits.** You can't grow where there isn't room, and the character glows yellow when a size change is refused. Some levels also limit how many times you can change size.
* **Boxes.** At the medium size you can place boxes in front of you. They can be pushed and climbed. Each level picks its own box size, and bigger boxes give a slightly stronger jump to match.
* **Level limits.** Every level can set which sizes are allowed, how many size changes you get, and how many boxes you can place. A counter in the bottom-left corner shows what's left.
* **Stats.** The completion screen shows how many attempts the level took and how long it took.

## Built with

* [Godot Engine](https://godotengine.org/) 4.7 and GDScript
* Art drawn in [Piskel](https://www.piskelapp.com/), using the **JAME GAM** palette
* Font: [Pixelify Sans](https://fonts.google.com/specimen/Pixelify+Sans) (SIL Open Font License)

## Running the project

1. Install [Godot 4.7](https://godotengine.org/download).
2. Clone this repository:

```
   git clone https://github.com/Blazerumer/\[repository-name].git
   ```

3. Open Godot, click **Import**, and select the `project.godot` file.
4. Press **F5** to play.

## Project layout

```
scene/      levels, menus and the player scene
scripts/    GDScript files (player, box, level goal, world border, stats)
jame gam/   sprites and tile sheets
fonts/       Pixelify Sans
```

## Credits

* Game design, art and levels: **Blazerumer**
* Inspired by **Pico Park** by TECOPARK
* Music: "Chill" by leberch, from [Pixabay](https://pixabay.com/) (Pixabay Content License)
* Font: Pixelify Sans (SIL Open Font License 1.1)

## AI disclosure

All art, levels and game design are my own. Less than 20 percent of the game code was written with help from Claude (an AI assistant).
Help was taken for the player movement script logic.



\[Choose a license, for example MIT, and add a LICENSE file. Remove this section if you'd rather not.]


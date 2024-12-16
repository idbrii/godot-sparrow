<img src="asset-lib/icon.svg" alt="Godot Sparrow Icon" align="right" title="Godot Sparrow Icon" width=128 height=128>

# godot_sparrow

A [Godot](https://godotengine.org) addon that adds a ResourceImporter for the [Sparrow Texture Atlas XML Format](https://wiki.sparrow-framework.org/manual/textures_and_images).

## Usage

Just add the .xml file relative to your image into your project and it should be imported automatically as SpriteFrames that are usable in any AnimatedSprite (2D or 3D).

### Import Properties

![Screenshot showing different importer properties.](https://github.com/user-attachments/assets/42576b10-bdfe-40d0-b4b2-d1f18ee22708)

- use_offsets
    * Simply toggles whether or not `frameX`, `frameY`, `frameWidth`, and `frameHeight` are used in generating the SpriteFrames.
- animation_framerate
    * Framerate (or FPS) all animations are exported in by default.
- animations_looped
    * Whether or not animations are looped by default.
- loop_suffix
    * Override `animations_looped` for any animations ending with this string and make them loop.
- oneshot_suffix
    * Override `animations_looped` for any animations ending with this string and make them play once (not loop).
- store_external_spriteframes
    * Allows you to store the generated SpriteFrames in project with your .xml to change certain things like adding individual animation framerate differences.


### Exporting from Adobe Animate

Each animations needs a unique symbol and the symbol name will be the animation name.

If your Godot project uses `oneshot_suffix` set to `_once` and `animations_looped` to true, then all your animations will loop except for ones ending in `_once`. So use `jump_once` for a single shot animation and `walk` for a looping animation.

If your Godot project uses `loop_suffix` set to `_loop` and `animations_looped` to false, then none of your animations will loop unless their names end in `_loop`. So use `walk_loop` for a single shot animation and `jump` for a looping animation.

1. In Animate, open the **Library**.
2. Select all of the symbols that you want to export:
![image](https://github.com/user-attachments/assets/2aec7c1e-c722-4075-b91f-495b1e58d595)
3. Right click on any of them and select "Generate Sprite Sheet..."
![image](https://github.com/user-attachments/assets/1155f45b-c6c3-4bcc-8b35-6a3a65646e7f)
4. Make sure to set your data format to "Sparrow v2", enable "Trim" and "Stack frames" checkboxes, and set "Border padding" to at least 2 px.
![image](https://github.com/user-attachments/assets/3157d136-8e0b-47d7-840f-925d1c2ed244)
5. Click Export.
6. You must add both the output .png and .xml to Godot.

Enabling "Trim" and "Stack frames" checkboxes isn't required, but it reduces the size of your atlas and is handled correctly in Godot.

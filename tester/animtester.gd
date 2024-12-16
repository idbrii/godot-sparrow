extends Node2D

# Your project doesn't need this file! It's just a simple tester to show your
# your animations will import.

@onready var sprite := $AnimatedSprite2D
@onready var template := $"%ButtonTemplate"


func _ready():
    _build_anims()


func _build_anims():
    # Remove old buttons.
    var root = template.get_parent()
    for child in root.get_children():
        if child != template:
            child.queue_free()

    var anims = sprite.sprite_frames.get_animation_names()
    for anim_name in anims:
        var btn = template.duplicate()
        root.add_child(btn)
        btn.visible = true
        btn.text = anim_name
        btn.pressed.connect(_on_pressed_anim_btn.bind(anim_name))


func _on_pressed_anim_btn(anim_name):
    sprite.play(anim_name)

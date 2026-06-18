extends Node

class_name Programme

enum programme_types {
	HEAD,
	TORSO,
	LEG,
}

@export var programme_type:programme_types

@export var speed:int = 0
@export var jump_speed:int = 0
@export var health:int = 0

var stats = {"speed":speed,"jump_speed":jump_speed,"health":health}

extends CharacterBody2D

enum{
	DOWN,
	UP,
	LEFT_RIGHT,
	DEATH,
	STATE

}

var speed = 100
@onready var animation = $AnimatedSuslick2D
var player = null	
	
func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if direction != Vector2.ZERO:
		move_and_collide(direction.normalized() * speed * delta)

func _on_detector_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player = body


func _on_detector_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player = null

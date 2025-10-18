extends CharacterBody2D

enum{
	DOWN,
	UP,
	LEFT_RIGHT,
}

var speed = 300
var  player_dir = DOWN
@onready var animation = $AnimatedSprite2D


func moveUP():
	animation.play("UP") # для анимации
	velocity.x = 0
	velocity.y = -speed
	player_dir = UP
	
func moveDOWN():
	animation.play("DOWN") # для анимации 
	velocity.x = 0
	velocity.y = speed
	player_dir = DOWN

func moveLEFT():
	animation.flip_h = true
	animation.play("LEFT_RIGHT") # для анимации
	velocity.x = -speed
	velocity.y = 0
	player_dir = LEFT_RIGHT

func moveRIGHT():
	animation.flip_h = false
	animation.play("LEFT_RIGHT") # для анимации
	velocity.x = speed
	velocity.y = 0
	player_dir = LEFT_RIGHT
	
func state():
	velocity.x = 0
	velocity.y = 0
	if velocity.x == 0 and velocity.y == 0:
		match player_dir:
			DOWN: # херня для анимаций
				animation.play("DOWN")
				#animation.play("STATE")
			UP: # херня для анимаций
				animation.play("UP")
				#animation.play("STATE")
			LEFT_RIGHT: # херня для анимаций
				animation.play("STATE")
				


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		moveUP()
	elif  Input.is_action_pressed("down"):
		moveDOWN()
	elif  Input.is_action_pressed("left"):
		moveLEFT()
	elif  Input.is_action_pressed("right"):
		moveRIGHT()
	elif  Input.is_action_pressed("interaction"):
		pass
	elif  Input.is_action_pressed("attack"):
		pass
	else:
		state()
	move_and_slide()

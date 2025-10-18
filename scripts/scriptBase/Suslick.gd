extends CharacterBody2D

enum{
	DOWN,
	UP,
	LEFT_RIGHT,
	DEATH,
	STATE

}

var speed = 100
var  suslick_dir = DOWN
@onready var animation = $AnimatedSuslick2D


func moveUP():
	animation.play("UP") # для анимации
	velocity.x = 0
	velocity.y = -speed
	suslick_dir = UP 
	
func moveDOWN():
	animation.play("DOWN") # для анимации 
	velocity.x = 0
	velocity.y = speed
	suslick_dir = DOWN

func moveLEFT():
	animation.flip_h = true
	animation.play("LEFT_RIGHT") # для анимации
	velocity.x = -speed
	velocity.y = 0
	suslick_dir = LEFT_RIGHT

func moveRIGHT():
	animation.flip_h = false
	animation.play("LEFT_RIGHT") # для анимации
	velocity.x = speed
	velocity.y = 0
	suslick_dir = LEFT_RIGHT

func death():
	animation.flip_h = false
	velocity.x = 0
	velocity.y = 0
	animation.flip_h("DEATH")
	suslick_dir = DEATH



func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("interaction"):
		death()
	else:
		pass	
	

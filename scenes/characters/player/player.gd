extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var notification:Label = $notify
@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D
const SPEED = 200.0


func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down").normalized()
	velocity = SPEED * direction; move_and_slide()
	if direction.y <0:
		sprite.play("up")
	elif direction.y > 0:
		sprite.play("down")
	else:
		if direction.x>0:
			sprite.play("right")
		elif direction.x<0:
			sprite.play("left")
		else:
			sprite.play("idle")

func notify(type:String)->void:
	if type=="encounter":
		notification.text = "!"
		audio.stream = load("res://assets/audio/encounter.mp3")
		audio.play()
		await audio.finished
		notification.text = ""

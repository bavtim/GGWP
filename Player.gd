extends KinematicBody
#Перемещение в единицу времени
export var speed = 14
#Ускорение падения
export var fall_acceleration = 75
#Вектор перемещения
var velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO
	#Обработчик нажатий
	if Input.is_action_pressed("move_right"):
		direction.x+=1
	if Input.is_action_pressed("move_left"):
		direction.x-=1
	if Input.is_action_pressed("move_back"):
		direction.z+=1
	if Input.is_action_pressed("move_forward"):
		direction.z-=1
	#Стабилизация
	if direction!=Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation+direction,Vector3.UP)
	#Применение скорости
	velocity.x = direction.x*speed
	velocity.z = direction.z*speed
	velocity.y -= fall_acceleration *delta
	velocity = move_and_slide(velocity,Vector3.UP)

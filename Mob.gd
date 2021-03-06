extends KinematicBody
#Сигнал о смерти моба
signal squashed
#Минимальная скорость
export var min_speed = 10
#Максимальная скорость
export var max_speed = 18

var velocity = Vector3.ZERO

func _physics_process(delta):
	move_and_slide(velocity)
	
#Вызываем с главной сцены 
func initialize(start_position,player_position):
	
	translation = start_position
	
	#Моб смотрит по направлению игрока
	look_at(player_position,Vector3.UP)
	#Рандомный поворот
	rotate_y(rand_range(-PI/4,PI/4))
	
	
	#Рандомно выбираем скорость
	var random_speed = rand_range(min_speed,max_speed)
	#Расчет скорости моба
	velocity= Vector3.FORWARD * random_speed
	#Перемещение по взгляду
	velocity = velocity.rotated(Vector3.UP,rotation.y)
	
func squash():
	emit_signal("squashed")
	queue_free()
#При пропадании с экрана моба - он удаляется
func _on_VisibilityNotifier_screen_exited():
	queue_free()

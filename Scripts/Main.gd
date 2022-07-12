extends Node
export(PackedScene) var mob_scene

var score
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	new_game();


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()


func _on_ScoreTimer_timeout():
	score += 1


func _on_MobTimer_timeout():
	var mob = mob_scene.instance()

	var mob_spawn_location = get_node("Mob Path/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	var direction = mob_spawn_location + PI / 2

	mob.position = mob_spawn_location.position

	direction += rand_range(-PI /4, PI /4)
	mob.rotation = direction

	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	add_child(mob)
 

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

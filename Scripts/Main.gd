extends Node
export(PackedScene) var mob_scene

var score
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();


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


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

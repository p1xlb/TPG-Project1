extends Node

var player_health: int = 3
var bananas_collected: int = 0

func update_banana():
	get_tree().call_group("hud", "update_banana_count", bananas_collected)
	
func spawn_tablet():
	get_tree().call_group("stage2", "spawn_tablet")

var van_gone: bool = false

var chest_interact: bool = false
var chest_unlocked: bool = false
var fg_interact: bool = false
var npc2_5_interact: bool = false

var papers: int = 0
var tablet_found: bool = false
var quest1: bool = false
var quest2: bool = false
#var apple: bool = false
#var meat: bool = false
#var carrot: bool = false
#var potion: bool = false

var quiz1: bool = false
var quiz2: bool = false

var worker_hungry = true

var sequence: Array = []

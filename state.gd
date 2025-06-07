extends Node

func update_banana():
	get_tree().call_group("hud", "update_banana_count", bananas_collected)
	
func spawn_tablet():
	get_tree().call_group("stage2", "spawn_tablet")
	
func spawn_canting():
	get_tree().call_group("stage3", "spawn_canting")

var stage_banana: int = 0

func reset_stage_banana():
	stage_banana = 0

func reset_banana():
	bananas_collected = bananas_collected - stage_banana
	get_tree().call_group("hud", "update_banana_count", bananas_collected)
	
func die_reset():
	player_health = 3
	bananas_collected = 0
	
	van_gone = false
	
	chest_interact = false
	chest_unlocked = false
	
	fg_interact = false
	npc2_5_interact = false
	npc3_1_interact = false
	
	dialog1_1 = false
	dialog1_2 = false
	#dialog2_1 = false
	dialog2_2 = false
	dialog3_2 = false
	dialog3_4 = false
	dialog3_5 = false
	dialog3_6 = false
	
	papers = 0
	tablet_found = false
	canting_found = false
	quest1 = false
	quest2 = false
	quest3 = false
	#apple = false
	#meat = false
	#carrot = false
	#potion = false
	
	quiz1 = false
	quiz2 = false
	
	worker_hungry = true
	
	sequence = []


var player_health: int = 3
var bananas_collected: int = 0

var van_gone: bool = false

var chest_interact: bool = false
var chest_unlocked: bool = false

var fg_interact: bool = false
var npc2_5_interact: bool = false
var npc3_1_interact: bool = false

var dialog1_1: bool = false
var dialog1_2: bool = false
#var dialog2_1: bool = false
var dialog2_2: bool = false
var dialog3_2: bool = false
var dialog3_4: bool = false
var dialog3_5: bool = false
var dialog3_6: bool = false

var papers: int = 0
var tablet_found: bool = false
var canting_found: bool = false
var quest1: bool = false
var quest2: bool = false
var quest3: bool = false
#var apple: bool = false
#var meat: bool = false
#var carrot: bool = false
#var potion: bool = false

var quiz1: bool = false
var quiz2: bool = false

var worker_hungry = true

var sequence: Array = []

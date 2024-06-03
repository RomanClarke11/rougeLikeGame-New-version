extends Node2D
var health = 5
var gold = 0 
var mobKills = 0
var roomKills = 0
var floorNum = 1
var killDoors = false
var playerSpeed = 450
var bootsON = false 
var shopItems = ["boot", "heart", "sword"]
var pressedYes = false 
var fairyBottle = false
var person1Free = false
var person2Free = false
var daveInMainLevel = false
var giveDaveGold = false
var daveShopOpen = false
var highestFloor = 1
var startFloor = 1
var inDungeon = false 
var inventoryOpen = false
var playerHit = false 
var savePressed = false
var loadGame = false
var json = JSON.new()
var path = "user://data"
var data = {}




func save(content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(content))
	file.close()
	file = null

func create_new_save():
	var file = FileAccess.open("res://Deftult_data.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	data = content
	save(content)

func load_game():
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		gold = content.gold
		return content
	else:
		create_new_save()

func _on_button_pressed():
	if inDungeon == false:
		var content = {"gold":gold, "health":health, "playerSpeed":playerSpeed, "bootsON":bootsON, "highestFloor":highestFloor, "startFloor":startFloor, "daveInMainLevel":daveInMainLevel }
		print(content)
		save(content)



func _physics_process(_delta):
	pass
			

func _process(_delta):
	if %CanvasLayer.visible == true:
		get_tree().paused = true
		inventoryOpen = true
	elif %CanvasLayer.visible == false:
		get_tree().paused = false
		inventoryOpen = false
		
		

	if inventoryOpen == false:
		if Input.is_action_just_pressed("E"):
			%CanvasLayer.visible = true
		
	if inventoryOpen == true:
		if Input.is_action_just_pressed("E"):
			%CanvasLayer.visible = false
			


	if gold > 0:
		%CanvasLayer/Gold.visible = true
		%CanvasLayer/Gold/goldCount.text = str(gold)
	else:
		%CanvasLayer/Gold.visible = false
	if fairyBottle == true:
		%CanvasLayer/FairyBottle.visible = true
	else:
		%CanvasLayer/FairyBottle.visible = false
		
		
	if health == 0:
		pass
	
	if bootsON == true:
		%CanvasLayer/Boot.visible = true 
		
	if loadGame == true:
		pass
		#load_data()

func pickUpGold():
	gold += 1


func _on_area_2d_mouse_entered():
	if bootsON == true:
		%CanvasLayer/Boot/bootDiscription.visible = true 


func _on_area_2d_mouse_exited():
	if bootsON == true:
		%CanvasLayer/Boot/bootDiscription.visible = false
		
		




	

extends Node2D

var save_path = "C:/Users/fjror/Desktop/rpgGameSave/sample1.json"

var health = 5
var gold = 30
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
var daveInMainLevel = true
var giveDaveGold = false
var daveShopOpen = false
var highestFloor = 1
var startFloor = 1
var inDungeon = false 
var inventoryOpen = false
var playerHit = false 
var savePressed = false
var loadGame = false


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
		load_data()

func pickUpGold():
	gold += 1


func _on_area_2d_mouse_entered():
	if bootsON == true:
		%CanvasLayer/Boot/bootDiscription.visible = true 


func _on_area_2d_mouse_exited():
	if bootsON == true:
		%CanvasLayer/Boot/bootDiscription.visible = false
		
		

		
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file == null:
		var error_num = FileAccess.get_open_error()
		push_error("Couldn't open with error #%d" % error_num)
		return
	file.store_var(gold)
	file.store_var(health)
	file.store_var(highestFloor)
	file.store_var(giveDaveGold)
	file.store_var(daveInMainLevel)
	file.store_var(daveShopOpen)
	file.store_var(playerSpeed)
	file.store_var(bootsON)
	file.store_var(fairyBottle)
	file.store_var(shopItems)
	file.store_var(startFloor)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		gold = file.get_var(gold)
		health = file.get_var(health)
		highestFloor = file.get_var(highestFloor)
		giveDaveGold = file.get_var(giveDaveGold)
		daveInMainLevel = file.get_var(daveInMainLevel)
		daveShopOpen = file.get_var(daveShopOpen)
		playerSpeed = file.get_var(playerSpeed)
	else:
		print_debug("no save")

func _on_button_pressed():
	if inDungeon == false:
		save()





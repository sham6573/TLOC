extends Control

var isOpen: bool = false
# checks if inventory is open
@onready var inv: Inventory = preload("res://items/player_inventory.tres")
# loads the player inventory to manipulate
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
# loads all the slots (9 of them)

func _ready():
	inv.update.connect(update_slots)
	#update_slots()
	close()
# closes inventory when game starts

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
		# updates every slot if an item is collected 
	
func _process(_delta) -> void:
	if (Input.is_action_just_pressed("openInventory")):
		if (isOpen):
			close()
		else: 
			open()
# opens inventory if isOpen is false or closes inventory if isOpen is true

func close():
	visible = false
	isOpen = false
# process function 

func open():
	self.visible = true
	isOpen = true
# process function 

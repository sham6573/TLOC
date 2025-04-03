extends Control

var isOpen: bool = false
# checks if inventory is open

func _ready():
	close()

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

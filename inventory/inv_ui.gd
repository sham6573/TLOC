extends Control

@onready var inv: Inv = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

@onready var line1 = $NinePatchRect/GridContainer/Inv_UI_slot/Sprite2D2
@onready var line2 = $NinePatchRect/GridContainer/Inv_UI_slot2/Sprite2D3
@onready var line3 = $NinePatchRect/GridContainer/Inv_UI_slot3/Sprite2D4
@onready var line4 = $NinePatchRect/GridContainer/Inv_UI_slot4/Sprite2D5
@onready var line5 = $NinePatchRect/GridContainer/Inv_UI_slot5/Sprite2D6
@onready var line6 = $NinePatchRect/GridContainer/Inv_UI_slot6/Sprite2D7
@onready var line7 = $NinePatchRect/GridContainer/Inv_UI_slot7/Sprite2D8
@onready var line8 = $NinePatchRect/GridContainer/Inv_UI_slot8/Sprite2D9
@onready var line9 = $NinePatchRect/GridContainer/Inv_UI_slot9/Sprite2D10
# lazy solution but don't mind it, it works

var is_open: bool = false

signal selected_item(num)
# a signal to communicate with player.gd 

func _ready() -> void:
	update_slots()
	close()
	
func _input(event):
	#await get_tree().create_timer(2.0).timeout
	select_slot(event)
	
func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("openInventory"):
		if is_open:
			close()
		else:
			open()
			
func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
	
func select_slot(event):
	if is_open and event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8:
				var num_pressed = event.keycode - KEY_0
				if num_pressed < slots.size():
					selected_item.emit(num_pressed)
					if (num_pressed == 0):
						line1.visible = true
						line2.visible = false
						line3.visible = false
						line4.visible = false
						line5.visible = false
						line6.visible = false
						line7.visible = false
						line8.visible = false
						line9.visible = false
					elif (num_pressed == 1):
						line2.visible = true
						line1.visible = false;
						line3.visible = false
						line4.visible = false
						line5.visible = false
						line6.visible = false
						line7.visible = false
						line8.visible = false
						line9.visible = false
					elif (num_pressed == 2):
						line3.visible = true
						line4.visible = false
						line5.visible = false
						line6.visible = false
						line7.visible = false
						line8.visible = false
						line9.visible = false
						line1.visible = false
						line2.visible = false
					elif (num_pressed == 3):
						line4.visible = true
						line3.visible = false
						line5.visible = false
						line6.visible = false
						line7.visible = false
						line8.visible = false
						line9.visible = false
						line1.visible = false
						line2.visible = false
					elif (num_pressed == 4):
						line5.visible = true
						line3.visible = false
						line4.visible = false
						line6.visible = false
						line7.visible = false
						line8.visible = false
						line9.visible = false
						line1.visible = false
						line2.visible = false
					elif (num_pressed == 5):
						line6.visible = true
						line3.visible = false
						line4.visible = false
						line5.visible = false
						line7.visible = false
						line8.visible = false
						line9.visible = false
						line1.visible = false
						line2.visible = false
					elif (num_pressed == 6):
						line7.visible = true
						line3.visible = false
						line4.visible = false
						line5.visible = false
						line6.visible = false
						line8.visible = false
						line9.visible = false
						line1.visible = false
						line2.visible = false
					elif (num_pressed == 7):
						line8.visible = true
						line3.visible = false
						line4.visible = false
						line5.visible = false
						line6.visible = false
						line7.visible = false
						line9.visible = false
						line1.visible = false
						line2.visible = false
					elif (num_pressed == 8):
						line9.visible = true
						line3.visible = false
						line4.visible = false
						line5.visible = false
						line6.visible = false
						line7.visible = false
						line8.visible = false
						line1.visible = false
						line2.visible = false
# gets the number the user typed when the inv is open
		

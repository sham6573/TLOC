extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
# the resource sprite of the item when ready
@onready var amount_text: Label = $CenterContainer/Panel/Label

func update(slot: InventoryItem) -> void:
	if !slot.item:
		item_visual.visible = false # if no item exists then it will not be displayed 
		amount_text.visible = false
	else:
		item_visual.visible = true # 
		item_visual.texture = slot.item.texture # updates the texture of the item_display to be the item collected\
		amount_text.visible = true
		amount_text.text = str(slot.amount)
# updates the slot of the inventory 

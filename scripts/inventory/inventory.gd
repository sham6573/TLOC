extends Resource

class_name Inventory
 
signal update 
# an signal used to update

@export var slots: Array[InvSlot]
# class utlizied to store instances of InventoryItem (aka the items) in an array

func insert(item: InventoryItem):
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if !item_slots.is_empty():
		item_slots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
			
	update.emit()
# adds items onto the slots if anything is present 

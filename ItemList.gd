extends ItemList


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_item("Social")
	add_item("Physics")

func _process(delta):
	if is_anything_selected():
		print(get_selected_items())
		unselect_all()



func _on_IzberiPredmet_prati_ime_na_folder(ime):
	print(ime)

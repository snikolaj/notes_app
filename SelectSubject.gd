extends OptionButton

var fajlovi
signal prati_ime_na_folder(ime)


func _ready():
	fajlovi = list_files_in_directory("user://predmeti")
	print(fajlovi)
	for fajl in fajlovi:
		add_item(fajl)
	

func list_files_in_directory(path):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file)

	dir.list_dir_end()

	return files


func _on_IzberiPredmet_item_selected(index):
	emit_signal("prati_ime_na_folder", fajlovi[index])

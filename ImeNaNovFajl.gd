extends LineEdit



func _on_NovFajl_pressed():
	if text != "":
		var ime = get_node("../IzberiFajl").izberen_predmet_ime()
		write_file("predmeti/" + ime + "/" + text)


func write_file(file_name):
	var file = File.new()
	file.open("user://" + file_name, File.WRITE)
	file.close()


func _on_IzbrisiFajl_pressed():
	if text != "":
		var ime = get_node("../IzberiFajl").izberen_predmet_ime()
		var dir = Directory.new()
		dir.remove("user://predmeti/" + ime + "/" + text)

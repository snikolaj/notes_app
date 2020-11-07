extends TextEdit

var otvoren_fajl = false
var ime_na_otvoren_fajl


func _on_IzberiFajl_prati_tekst(tekst, ime_na_fajl):
	ime_na_otvoren_fajl = ime_na_fajl
	text = tekst
	otvoren_fajl = true

func write_file(file_name, string):
	var file = File.new()
	var dir = Directory.new()
	print(dir.remove(file_name))
	
	file.open(file_name, File.WRITE)
	print(file_name, string)
	file.store_string(string)

	file.close()


func _on_SnimiTimer_timeout():
	print("AAA")
	if otvoren_fajl and text != "":
		write_file(ime_na_otvoren_fajl, text)

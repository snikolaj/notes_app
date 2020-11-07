extends ItemList


var fajlovi
var izbereno_ime
signal prati_tekst(tekst, ime_na_fajl)

func _process(delta):
	if is_anything_selected():
		var fajl_za_isprakjanje = "predmeti/" + izbereno_ime + "/" + fajlovi[get_selected_items()[0]]
		var tekst_za_isprakjanje = load_file(fajl_za_isprakjanje)
		#predmeti e prv folder kude sto su svi folderi za predmeti
		#izbereno ime e ime na predmet koj smo ga odbrale
		#fajlovi e niza sas svi iminja na fajlovi u izbereno ime
		#get_selected_items()[0] ga vrakja prvo izbereno ime na fajl
		emit_signal("prati_tekst", tekst_za_isprakjanje, fajl_za_isprakjanje)
		unselect_all()
		
		#zasto imamo unselect_all, uvek kje imamo samo 1 izbereno ime na fajl



func _on_IzberiPredmet_prati_ime_na_folder(ime):
	izbereno_ime = ime
	fajlovi = list_files_in_directory("predmeti/" + ime)
	clear()
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

func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var line = ""
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		line += f.get_line()
		line += " "
	f.close()
	return line

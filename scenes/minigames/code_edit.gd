extends CodeEdit

func _ready() -> void:
	var codehighlighter := CodeHighlighter.new()
	codehighlighter.number_color = Color("a1ffe0")
	codehighlighter.symbol_color = Color("abc9ff")
	codehighlighter.function_color = Color("57b3ff")
	codehighlighter.member_variable_color = Color("bce0ff")
	for word in ["func", "var", "const", "signal", "extends", "class_name", "true", "false", "null", "and", "or", "not"]:
		codehighlighter.add_keyword_color(word, Color("ff7085"))
	for word in ["if", "elif", "else", "for", "return"]:
		codehighlighter.add_keyword_color(word, Color("ff8ccc"))
	for word in ["int", "float", "String", "bool", "Array", "Dictionary", "Vector2", "Node", "CharacterBody2D"]:
		codehighlighter.add_keyword_color(word, Color("42ffc2"))
	codehighlighter.add_color_region('"', '"', Color("ffeda1"))
	codehighlighter.add_color_region("#", "", Color("cdcfd2", 0.5))
	syntax_highlighter = codehighlighter
	add_theme_color_override("background_color", Color("1e232d"))
	add_theme_color_override("font_readonly_color", Color("cdcfd2"))
	add_theme_font_size_override("font_size", 20)
	var mono := SystemFont.new()
	mono.font_names = ["Consolas", "Menlo", "Courier New", "monospace"]
	add_theme_font_override("font", mono)

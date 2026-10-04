extends CanvasLayer

@onready var textbox: RichTextLabel = $MarginContainer/MarginContainer/HBoxContainer/MarginContainer2/HBoxContainer/RichTextLabel
@onready var start: Label = $MarginContainer/MarginContainer/HBoxContainer/MarginContainer2/HBoxContainer/start
@onready var end: Label = $MarginContainer/MarginContainer/HBoxContainer/MarginContainer2/HBoxContainer/end
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var cont: Panel = $MarginContainer/Panel
@onready var label: Label = $name
@onready var sprite2d: Sprite2D = $MarginContainer/MarginContainer/HBoxContainer/MarginContainer/Sprite2D

var queue: Array = []
var choices: Array = []
var callback: Callable
var index: int = 0
var tween: Tween

enum STATE{
	READY,
	READING,
	CHOOSING,
	DONE
}
var current = STATE.READY

func _ready() -> void:
	hide_box()
	print("ready")
	process_mode = Node.PROCESS_MODE_ALWAYS
	queue_text("LOTFY, I BEG U, PLZ LEARN WEB", "res://assets/cat/angry_talking.png", "angry cat", "res://assets/cat/cat_soundbeeps.wav")
	queue_choice(["learn web", "learn web dev", "die"], "res://assets/cat/playful_talking.png", "cat")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match current:
		STATE.READY:
			if !queue.is_empty():
				var entry = queue.pop_front()
				match entry.type:
					"text": add_text(entry)
					"choice": add_choice(entry)
		STATE.READING:
			if Input.is_action_just_pressed("ui_accept"):
				textbox.visible_ratio = 1.0
				if tween and tween.is_running():
					tween.stop()
				audio.stop()
				end.text = "v"
				change_state(STATE.DONE)
		STATE.CHOOSING:
			if Input.is_action_just_pressed("down"):
				index = (index+1) % choices.size()
				render_choices()
			if Input.is_action_just_pressed("up"):
				index = (index - 1 + choices.size()) % choices.size()
				render_choices()
			if Input.is_action_just_pressed("ui_accept"):
				confirm_choice()
		STATE.DONE:
			if Input.is_action_just_pressed("ui_accept"):
				hide_box()
				change_state(STATE.READY)

func hide_box():
	cont.hide()
	start.text = ""
	label.text = ""
	end.text = ""
	textbox.text = ""
	sprite2d.hide()
	get_tree().paused = false
	
func show_box():
	cont.show()
	start.text = "*"
	sprite2d.show()
	
func queue_text(text: String, sp: String, talker: String, sound: String):
	queue.push_back({
		"type": "text",
		"text": text,
		"sp": sp,
		"audio": sound,
		"talker": talker
	})
	
func queue_choice(options: Array, sp: String, talker: String, callback: Callable = Callable()):
	queue.push_back({
		"type": "choice",
		"options": options,
		"callback": callback,
		"sp": sp,
		"talker": talker
	})
	
func add_text(entry: Dictionary):
	var text = entry.text
	show_box()
	textbox.text = text
	tween = create_tween()
	textbox.visible_ratio = 0.0
	var d = 0.05 * text.length()
	tween.tween_property(textbox, "visible_ratio", 1.0, d)\
		.from(0.0)\
		.set_trans(Tween.TRANS_LINEAR)\
		.set_ease(Tween.EASE_IN)
	tween.finished.connect(_on_tween_finished)
	change_state(STATE.READING)
	play_audio()
	sprite2d.set_tex(load(entry.sp))
	label.text = entry.talker
	audio.stream = load(entry.audio)
	
func add_choice(entry: Dictionary):
	choices = entry.options
	callback = entry.callback
	index = 0
	show_box()
	change_state(STATE.CHOOSING)
	sprite2d.set_tex(load(entry.sp))
	label.text = entry.talker
	render_choices()

func render_choices():
	var lines: Array = []
	for i in choices.size():
		var pre
		if i == index:
			pre = " >"
		else:
			pre = " "
		lines.append(pre + str(choices[i]))
	textbox.text = "\n".join(lines)
	textbox.visible_ratio = 1.0
	
func confirm_choice():
	end.text = "v"
	change_state(STATE.DONE)
	if callback.is_valid():
		callback.call(index)
	return index
	
func _on_tween_finished():
	end.text = "v"
	audio.stop()
	change_state(STATE.DONE)

func change_state(next):
	current = next
	match current:
		STATE.READY:
			print("ready")
		STATE.READING:
			print("reading")
		STATE.CHOOSING:
			print("choosing")
		STATE.DONE:
			print("done")

func play_audio():
	while current == STATE.READING:
		if not audio.playing:
			audio.play()
		var t = pow(randf(), 5)
		var random = lerp(0.05, 0.3, t)
		await get_tree().create_timer(random).timeout
		
	
			

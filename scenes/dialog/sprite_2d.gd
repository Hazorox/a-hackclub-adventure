extends Sprite2D

var area = get_parent() as Control 
func _ready() -> void:
	area = get_parent() as Control 
	if area:
		area.resized.connect(apply)
	apply()

func set_tex(tex: Texture2D):
	texture = tex
	apply()

func apply():
	if not texture:
		return
	var box
	if area:
		box = area.size
	else:
		box = Vector2(170,170)
		
	var tex_size = texture.get_size()
	if tex_size.x==0 or tex_size.y==0:
		return
		
	var s = min(box.x/tex_size.x, box.y/tex_size.y)
	scale = Vector2(s,s)
	
	centered = true
	position = box/2

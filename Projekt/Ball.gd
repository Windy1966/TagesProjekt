extends Area2D


# Parameter
var geschwindigkeit = 3

var richtung_vec = Vector2(0,2)


func _ready():
	pass # Replace with function body.


func _process(delta):
	position += richtung_vec * geschwindigkeit


func _on_Ball_area_entered(area):
	var diverernz = (area.position.x - position.x) / 40
	richtung_vec = richtung_vec.rotated(PI - diverernz)


func _on_Ball_body_entered(body):
	printt("vor",richtung_vec)
	if body.is_in_group("Seite"):
		richtung_vec.x = richtung_vec.x *-1
	else:
		richtung_vec.y = richtung_vec.y *-1
	printt("nach",richtung_vec)	

extends Area2D


# Parameter
var geschwindigkeit = 3

var richtung_vec = Vector2(0,1)


func _ready():
	pass # Replace with function body.


func _process(delta):
	position += richtung_vec * geschwindigkeit


func _on_Ball_area_entered(area):
	var diverernz = (area.position.x - position.x) / 40
	var oben = Vector2.UP * geschwindigkeit
	richtung_vec = oben.rotated(-diverernz)


func _on_Ball_body_entered(body):
	if body.is_in_group("Seite"):
		richtung_vec.x = richtung_vec.x *-1
	elif body.is_in_group("oben"):
		richtung_vec.y = richtung_vec.y *-1
	elif body.is_in_group("Block"):
		richtung_vec.y = richtung_vec.y *-1
		body.queue_free()

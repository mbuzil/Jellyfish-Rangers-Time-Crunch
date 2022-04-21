extends KinematicBody2D

var health = 1


func damage(d):
	health -= d
	if health <= 0:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if body.has_method("damage"):
			body.damage(1)

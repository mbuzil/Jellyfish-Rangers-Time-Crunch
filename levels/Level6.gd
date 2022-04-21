extends Node2D

var nmbr = 0
onready var bottom = get_node_or_null("Bottom/Area2D/B")

func _on_Timer_timeout():
	if(nmbr == 0):
		$TopLeft.show()
		nmbr=nmbr+1
		$Timer2.start()
		$TopLeft/Area2D/TL.set_deferred("disabled", false)
		$Timer2.paused = false
	elif(nmbr == 1):
		$TopRight.show()
		nmbr=nmbr+1
		$Timer2.start()
		$TopRight/Area2D/TR.set_deferred("disabled", false)
		$Timer2.paused = false
	elif nmbr == 2:
		$Bottom.show()
		$Timer2.start()
		bottom.set_deferred("disabled", false)
		nmbr=0
		$Timer2.paused = false
		


func _on_Timer2_timeout():
	if nmbr == 1:
		$TopLeft/Area2D/TL.set_deferred("disabled", true)
		$TopLeft.hide()
		$Timer2.paused = true
	elif nmbr == 2:
		$TopRight/Area2D/TR.set_deferred("disabled", true)
		$TopRight.hide()
		$Timer2.paused = true
	elif nmbr == 0:
		bottom.set_deferred("disabled", true)
		$Bottom.hide()
		$Timer2.paused = true


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.damage(5)

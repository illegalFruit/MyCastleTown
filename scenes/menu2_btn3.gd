extends Button


func _pressed():
	get_node("/root/Menu Container/Menu1").show()
	get_node("/root/Menu Container/Menu2").hide()

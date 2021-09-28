extends Button


func _pressed():
	get_node("/root/Menu Container/Net_Lobby").create_server()
	get_node("/root/Menu Container/Menu2").hide()
	get_node("/root/Menu Container/Menu3").show()

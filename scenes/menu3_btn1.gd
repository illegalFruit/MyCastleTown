extends Button

onready var net_ref = get_node("/root/Menu Container/Net_Lobby")

func _pressed():
#	if get_tree().is_network_server():
#		net_ref.upnp.delete_port_mapping(17655)
	get_tree().get_network_peer().close_connection()
	get_tree().network_peer = null

	get_node("/root/Menu Container/Menu3").hide()
	get_node("/root/Menu Container/Menu2").show()

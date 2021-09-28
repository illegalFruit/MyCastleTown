extends Label

# For whatever reason referencing the VAR actually doesnt update the hud 
# despite the value actually changing. 
onready var net_lobby = get_node("/root/Menu Container/Net_Lobby")

func _process(_delta):
	self.text = "Players: " + str(net_lobby.players)



extends Node

# Networking Variables 
var peer = NetworkedMultiplayerENet.new()
var port = 17655
var ip_remote = "127.0.0.1"
# Lobby Variables 
remotesync var players = []
# Attempt UPNP 
#var upnp = UPNP.new()

func _ready():
	get_tree().connect("connection_failed", self, "_connected_fail")

func create_server():
	peer.create_server(40069, 8)
	get_tree().network_peer = peer
	players.append(get_tree().get_network_unique_id())
	#var results = upnp.discover()
	get_tree().connect("network_peer_connected", self, "_server_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_server_player_disconnected")
#	if results == UPNP.UPNP_RESULT_SUCCESS:
#		var gateway = upnp.get_gateway()
		#gateway.add_port_mapping(40069)


func create_client():
	var client_ip = get_node("/root/Menu Container/Menu2/VBoxContainer/Input")
	# peer.create_client("104.175.111.180", 40069)
	# peer.create_client("127.0.0.1", 40069)
	#peer.create_client("2603:8000:5903:ee8f:a991:5117:ef57:37f2", 40069)
	peer.create_client("127.0.0.1", 40069)
	get_tree().network_peer = peer
	players.append(get_tree().get_network_unique_id())
	get_tree().connect("network_peer_connected", self, "_client_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_client_player_disconnected")

# warning-ignore:unused_argument
func _server_player_connected(id):
	players.append(id)
	rset("players", players)

func _server_player_disconnected(id):
	players.erase(id)
	rset("players", players)

func _client_player_connected(test):
	pass
	
func _client_player_disconnected():
	pass

func _connected_fail():
	print("FAILED TO CONNECT TO SERVER")

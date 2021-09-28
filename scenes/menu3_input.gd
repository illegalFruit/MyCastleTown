extends LineEdit

var chat = []
var chat_container = null

func _ready():
	chat_container = get_node("/root/Menu Container/Menu3/VBoxContainer/HBoxContainer/VBoxContainer/MarginContainer/VBoxContainer3/ScrollContainer/VBoxContainer")

func _text_entered(text):
	# do something different for server/client
	if get_tree().is_network_server():
		rpc("chat_update", text)
		self.text = ""
	else:
		rpc_id(1, "chat_update", text)
		self.text = ""
	
master func chat_update(text):
	# construct node, add to code, then visually
	# send update to clients 
	var new_text = Label.new()
	var text_msg = "{" + str(get_tree().get_rpc_sender_id()) + "}" + " : " + text
	chat.append(text_msg)
	new_text.text = text_msg
	chat_container.add_child(new_text)
	rpc("client_chat_update", text_msg)
	
puppet func client_chat_update(text_msg):
	var new_text = Label.new()
	new_text.text = text_msg
	chat_container.add_child(new_text)

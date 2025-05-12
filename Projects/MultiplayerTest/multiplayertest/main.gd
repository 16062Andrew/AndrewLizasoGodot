extends Node2D

@onready var multiplayer_ui = $UI/Multiplayer
@onready var IPTextEdit = $UI/Multiplayer/VBoxContainer/TextEdit

const PLAYER = preload("res://player.tscn")

var IPText = ""
var peer = ENetMultiplayerPeer.new()

func _ready() -> void:
	var ip_adress :String
	
	if OS.has_feature("windows"):
		ip_adress =  IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	elif OS.has_feature("x11"):
		ip_adress =  IP.resolve_hostname(str(OS.get_environment("HOSTNAME")),1)
	elif OS.has_feature("OSX"):
		ip_adress =  IP.resolve_hostname(str(OS.get_environment("HOSTNAME")),1)
	print(str(ip_adress))
	
	$UI/IP.text = ip_adress

func _on_host_pressed() -> void:
	peer.create_server(25565)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(
		func(pid):
			print("Peer " + str(pid) + " has joined the game!")
			add_player(pid)
	)
	
	add_player(multiplayer.get_unique_id())
	multiplayer_ui.hide()


func _on_join_pressed() -> void:
	peer.create_client(IPText, 25565)
	multiplayer.multiplayer_peer = peer
	multiplayer_ui.hide()


func add_player(pid):
	var player = PLAYER.instantiate()
	player.name = str(pid)
	add_child(player)


func _on_text_edit_text_changed() -> void:
	IPText = IPTextEdit.text

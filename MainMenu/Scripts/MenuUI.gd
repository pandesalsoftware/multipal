extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass


func _on_quit_pressed():
	#Closes the game
	print("See you soon!")
	get_tree().quit()


func _on_options_pressed():
	#Takes player(s) to the Options Menu
	get_tree().change_scene_to_file("res://Scenes/Game/Options/options.tscn")

func _on_pals_pressed():
	#Takes player(s) to the Pals Menu
	get_tree().change_scene_to_file("res://Scenes/Game/PalMenu/pal_menu_root.tscn")


func _on_credits_pressed():
	#Opens Credits Panel
	$Credits/CreditsControl.visible = true
	$Credits/CreditsControl/Panel.visible = true


func _on_quit_2_pressed():
	#Closes Credits Panel
	$Credits/CreditsControl/Panel.visible = false

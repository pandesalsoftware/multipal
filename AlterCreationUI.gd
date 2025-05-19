extends Control


#Scene Navigation--------BEGIN---------------------------------------------------------------------------------------------------------------

func _on_main_menu_pressed():
	#Takes Player(s) to Main Menu (Main Scene)
	get_tree().change_scene_to_file("res://Scenes/Game/MainMenu/MainMenu.tscn")

func _on_reset_pressed():
	#Resets the scene to it's original state.
	get_tree().reload_current_scene()

func _on_pal_menu_pressed():
	#Takes Player(s) to Pal Menu (Previous Scene)
	get_tree().change_scene_to_file("res://Scenes/Game/PalMenu/pal_menu_root.tscn")

# Quit Section --------------------------------------
func _on_quit_pressed():
	#Opens Quit Dialogue
	$SceneNavigation/Quit/PinkPanel.visible = true

func _on_yes_pressed():
	#Quits Game
	get_tree().quit()


func _on_no_pressed():
	#Closes Quit Panel
	$SceneNavigation/Quit/PinkPanel.visible = false

#Scene Navigation--------END---------------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------- VARIABLES ------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

#Whole Body
@onready var baseAngel = $"../../../../Base_Angel"
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

#Skin
var skinTones: Array = ["res://Meshes/Angels/SkinTones/Dark/Dark1.tres", "res://Meshes/Angels/SkinTones/Dark/Dark2.tres", "res://Meshes/Angels/SkinTones/Dark/Dark3.tres","res://Meshes/Angels/SkinTones/Light/Light1.tres", "res://Meshes/Angels/SkinTones/Light/Light2.tres","res://Meshes/Angels/SkinTones/Light/Light3.tres", "res://Meshes/Angels/SkinTones/Light/Light4.tres", "res://Meshes/Angels/SkinTones/Tan/Tan1.tres", "res://Meshes/Angels/SkinTones/Tan/Tan2.tres", "res://Meshes/Angels/SkinTones/Tan/Tan3.tres","res://Meshes/Angels/SkinTones/Tan/Tan4.tres"]
var skinToneIndex: int = 0

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#Hair 

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#Body

@onready var Head = $"../../../../Base_Angel/Armature/Skeleton3D/Head"
@onready var Ears = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/Ears"
@onready var LeftArm = $"../../../../Base_Angel/Armature/Skeleton3D/LeftArm"
@onready var LeftFoot = $"../../../../Base_Angel/Armature/Skeleton3D/LeftLeg"
@onready var LeftHand = $"../../../../Base_Angel/Armature/Skeleton3D/LeftHand"
@onready var LeftLeg = $"../../../../Base_Angel/Armature/Skeleton3D/LeftLeg"
@onready var RightArm = $"../../../../Base_Angel/Armature/Skeleton3D/RightArm"
@onready var RightFoot = $"../../../../Base_Angel/Armature/Skeleton3D/RightLeg"
@onready var RightHand = $"../../../../Base_Angel/Armature/Skeleton3D/RightHand"
@onready var RightLeg = $"../../../../Base_Angel/Armature/Skeleton3D/RightLeg"
#@onready var Wings = $"../../../../Base_Angel/Armature/Skeleton3D/Wings"

#AnimationPlayer
@onready var AP =  $"../../../../Base_Angel/AnimationPlayer"

#Armature 
@onready var Skeleton = $"../../../../Base_Angel/Armature/Skeleton3D"
@onready var NeckBone = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone"
#----------------------------------------------------------------------------------------------------------------------------

# Called when the node enters the scene tree for the first time.

func _ready():
#Skin - Loads the fisrt skin tone in the array
	update_skin_tone()

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------- VARIABLES ------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------SKIN TONE SECTION----- 
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

func update_skin_tone():
	var currentSkinToneFile = skinTones[skinToneIndex]
	var currentSkinTone = load(currentSkinToneFile)

#Changing skin tones via Surface Material Overrride 
	Head.material_override = currentSkinTone
	Ears.material_override = currentSkinTone
	LeftFoot.material_override = currentSkinTone
	LeftHand.material_override = currentSkinTone
	LeftLeg.material_override = currentSkinTone
	RightFoot.material_override = currentSkinTone
	RightHand.material_override = currentSkinTone
	RightLeg.material_override = currentSkinTone


#----------------------------------------------------------------------------------------------------------------------------

#Function called when player presses the “Skin” Button
func _on_skin_tone_pressed():
	skinToneIndex = (skinToneIndex +1) % skinTones.size()

	update_skin_tone()

#Playing Animation
	AP.play("Posing001")

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#--------------------END---------------------------------------------------------------------SKIN TONE SECTION----- 
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#---------------------BEGIN---------------------------------------------------------------------- HAIR SECTION ------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

#YORK--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func yorkhair_inst():
	var YorkHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/YorkHair.tscn")
	var YHinst = YorkHairScene.instantiate()
	var YorkHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in YorkHPos.get_children():
		child.queue_free()
	#Add Child 
	YorkHPos.add_child(YHinst)
		#Checking for Instance
	if is_instance_valid(YHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_york_hair_btn_pressed():
	#Runs the York Hair Instance func 
	yorkhair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------YORK------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ZACH---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func zachhair_inst():
	var ZachHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/ZachHair.tscn")
	var ZHinst = ZachHairScene.instantiate()
	var ZachHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in ZachHPos.get_children():
		child.queue_free()
	#Add Child 
	ZachHPos.add_child(ZHinst)
	if is_instance_valid(ZHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_zach_hair_btn_pressed():
	#Runs the Zach Hair Instance func 
	zachhair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ZACH------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MARS-------HAIR----------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func marshair_inst():
	var MarsHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/MarsHair.tscn")
	var MHinst = MarsHairScene.instantiate()
	var MarsHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in MarsHPos.get_children():
		child.queue_free()
	#Add Child 
	MarsHPos.add_child(MHinst)
	if is_instance_valid(MHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_mars_hair_btn_pressed():
	#Runs the Mars Hair Instance func 
	marshair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------MARS------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ROGER-------HAIR----------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func rogerhair_inst():
	var RogerHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/RogerHair.tscn")
	var RHinst = RogerHairScene.instantiate()
	var RogerHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in RogerHPos.get_children():
		child.queue_free()
	#Add Child 
	RogerHPos.add_child(RHinst)
	#Checking for Instance
	if is_instance_valid(RHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_roger_hair_btn_pressed():
	#Runs the Roger Hair Instance func 
	rogerhair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ROGER------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#STATIA--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
func statiahair_inst():
	var StatiaHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/StatiaHair.tscn")
	var SHinst = StatiaHairScene.instantiate()
	var StatiaHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in StatiaHPos.get_children():
		child.queue_free()
	#Add Child 
	StatiaHPos.add_child(SHinst)
	#Checking for Instance
	if is_instance_valid(SHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_statia_hair_btn_pressed():
	#Runs the Statia Hair Instance func 
	statiahair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------STATIA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DONNY--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
func donnyhair_inst():
	var DonnyHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/DonnyHair.tscn")
	var DHinst = DonnyHairScene.instantiate()
	var DonnyHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in DonnyHPos.get_children():
		child.queue_free()
	#Add Child 
	DonnyHPos.add_child(DHinst)
	#Checking for Instance
	if is_instance_valid(DHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_donny_hair_btn_pressed():
	#Runs the Donny Hair Instance func 
	donnyhair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------DONNY------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MANDA--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
func mandaHair_inst():
	var mandaHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/MandaHair.tscn")
	var MHinst = mandaHairScene.instantiate()
	var MandaHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in MandaHPos.get_children():
		child.queue_free()
	#Add Child 
	MandaHPos.add_child(MHinst)
	#Checking for Instance
	if is_instance_valid(MHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_manda_hair_btn_pressed():
	#Runs the Manda Hair Instance func 
	mandaHair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------MANDA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DAVID--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
func davidHair_inst():
	var davidHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/DavidHair.tscn")
	var DHinst = davidHairScene.instantiate()
	var davidHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in davidHPos.get_children():
		child.queue_free()
	#Add Child 
	davidHPos.add_child(DHinst)
	#Checking for Instance
	if is_instance_valid(DHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_david_hair_btn_pressed():
	#Runs the David Hair Instance func 
	davidHair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------DAVID-----------HAIR---------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ISABELLE--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
func isabellehair_inst():
	var IsabelleHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/isabelle_hair.tscn")
	var IHinst = IsabelleHairScene.instantiate()
	var IsabelleHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in IsabelleHPos.get_children():
		child.queue_free()
	#Add Child 
	IsabelleHPos.add_child(IHinst)
	#Checking for Instance
	if is_instance_valid(IHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_isabelle_hair_btn_pressed():
	#Runs the Isabelle Hair Instance func 
	isabellehair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ISABELLE------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#NORMAN--------HAIR---------BEGIN-------------------------------------------------------------------------------------------
func normanhair_inst():
	var NormanHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/Norman_hair.tscn")
	var NHinst = NormanHairScene.instantiate()
	var NormanHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in NormanHPos.get_children():
		child.queue_free()
	#Add Child 
	NormanHPos.add_child(NHinst)
	#Checking for Instance
	if is_instance_valid(NHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_norman_hair_btn_pressed():
	#Runs the Norman Hair Instance func 
	normanhair_inst()
#Playing Animation
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ISABELLE------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ANGELO---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func angelohair_inst():
	var angeloHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/Angelo_hair.tscn")
	var AHinst = angeloHairScene.instantiate()
	var AngeloHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in AngeloHPos.get_children():
		child.queue_free()
	#Add Child 
	AngeloHPos.add_child(AHinst)
	if is_instance_valid(AHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_angelo_hair_btn_pressed():
	#Runs the Angelo Hair Instance func 
	angelohair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------ANGELO---------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ETHAN---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func ethanhair_inst():
	var ethanHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/Ethan_hair.tscn")
	var EHinst = ethanHairScene.instantiate()
	var EthanHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in EthanHPos.get_children():
		child.queue_free()
	#Add Child 
	EthanHPos.add_child(EHinst)
	if is_instance_valid(EHinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_ethan_hair_btn_pressed():
	#Runs the Ethan Hair Instance func 
	ethanhair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------ETHAN---------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#HANA---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func hanahair_inst():
	var hanaHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/hans_hair.tscn")
	var HAinst = hanaHairScene.instantiate()
	var hanaHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in hanaHPos.get_children():
		child.queue_free()
	#Add Child 
	hanaHPos.add_child(HAinst)
	if is_instance_valid(HAinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_hana_hair_btn_pressed():
	#Runs the Hana Hair Instance func 
	hanahair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------HANA---------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#CASEY---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func caseyhair_inst():
	var caseyHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/CaseyHair.tscn")
	var CYinst = caseyHairScene.instantiate()
	var caseyHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in caseyHPos.get_children():
		child.queue_free()
	#Add Child 
	caseyHPos.add_child(CYinst)
	if is_instance_valid(CYinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_casey_hair_btn_pressed():
	#Runs the Casey Hair Instance func 
	caseyhair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------CASEY---------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ADA---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func adahair_inst():
	var adaHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/ada_hair.tscn")
	var AAinst = adaHairScene.instantiate()
	var adaHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in adaHPos.get_children():
		child.queue_free()
	#Add Child 
	adaHPos.add_child(AAinst)
	if is_instance_valid(AAinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_ada_hair_btn_pressed():
	#Runs the Ada Hair Instance func 
	adahair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------ADA---------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#VITO---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func vitohair_inst():
	var vitoHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/Vito_hair.tscn")
	var VOinst = vitoHairScene.instantiate()
	var vitoHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in vitoHPos.get_children():
		child.queue_free()
	#Add Child 
	vitoHPos.add_child(VOinst)
	if is_instance_valid(VOinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_vito_hair_btn_pressed():
	#Runs the Vito Hair Instance func 
	vitohair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------VITO---------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#AGNA---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func agnahair_inst():
	var agnaHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/Agna_hair.tscn")
	var AAinst = agnaHairScene.instantiate()
	var agnaHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in agnaHPos.get_children():
		child.queue_free()
	#Add Child 
	agnaHPos.add_child(AAinst)
	if is_instance_valid(AAinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_agna_hair_btn_pressed():
	#Runs the Agna Hair Instance func 
	agnahair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------AGNA--------HAIR--------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MERYL---------HAIR--------BEGIN-------------------------------------------------------------------------------------------
#INST FUNCTIONS
func merylhair_inst():
	var merylHairScene = preload("res://Meshes/Angels/Hair/HairInstScenes/meryl_hair.tscn")
	var MLinst = merylHairScene.instantiate()
	var merylHPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	#Remove Existing Children 
	for child in merylHPos.get_children():
		child.queue_free()
	#Add Child 
	merylHPos.add_child(MLinst)
	if is_instance_valid(MLinst):
		pass
#----------------------------------------------------------------------------------------------------------------------------
func _on_meryl_hair_btn_pressed():
	#Runs the Meryl Hair Instance func 
	merylhair_inst()
#Playing Animation
	AP.play("Posing001")

#----------------------------------------------------------------------------MERYL--------HAIR--------END

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
# QF HAIR HERE......................................................................................................................................

func _on_remove_hair_pressed():
	var HairPos1 = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
	var HairPosChild1 = HairPos1.get_children
	for child in HairPos1.get_children():
		child.queue_free()

#-----------------END---------------------------------------------------------------------------- HAIR SECTION ------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#---------------------------------------------------------------------------------------------------------------------------
#------------BEGIN--------------------------------------------------------------------------- HAIR COLOR SECTION ------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{HAIR COLOR SECTION}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

@onready var HairPos1 = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/HairPos1"
var H_mat3D = StandardMaterial3D.new()

func _on_color_picker_color_changed(color):
	print("Hairstyle Color Picker changed!")
	#Check if HairPos1 has any children to avoid out-of-bounds errors
	if HairPos1.get_child_count() > 0:
		print("Hair instance ready to change!")
		var HairPosChild = HairPos1.get_child(0)
		if HairPosChild is MeshInstance3D:
			print("MeshInstance3D Detected.")
			#Ensure mat3D is a new instance of StandardMaterial3D 
			H_mat3D.albedo_color = (color)
			HairPosChild.material_override = H_mat3D
			H_mat3D.cull_mode = BaseMaterial3D.CULL_DISABLED
			print("Hair color changed!")
		else : 
			print("Nothing to change!")

	#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{HAIR COLOR SECTION}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
	#---------------------------------------------------------------------------------------------------------------------------
	#------------END--------------------------------------------------------------------------- HAIR COLOR SECTION ------
	#----------------------------------------------------------------------------------------------------------------------------
	#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#---------------------------------------------------------------------------------------------------------------------------
#------------FACE------------------------------------------------------------------------------ BEGIN ------
#----------------------------------------------------------------------------------------------------------------------------

#AGNA---------FACIAL HAIR--------BEGIN---------------------------------------------------------------------------

func agnaFace_inst():
	var agnaFaceScene = preload("res://Meshes/Angels/Face/FaceScenes/agna_freckles.tscn")
	var agnaFEinst = agnaFaceScene.instantiate()
	var agnaFEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	#Remove Existing Children 
	for child in agnaFEpos.get_children():
		child.queue_free()
	#Add Child 
	agnaFEpos.add_child(agnaFEinst)
	#Checking for Instance 
	if is_instance_valid(agnaFEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_agna_face_btn_pressed():
	agnaFace_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------AGNA----------FACE----------END
#RICKY---------FACIAL HAIR--------BEGIN---------------------------------------------------------------------------

func rickyface_inst():
	var rickyFaceScene = preload("res://Meshes/Angels/Face/FaceScenes/ricky_moles.tscn")
	var rickyFEinst = rickyFaceScene.instantiate()
	var rickyFEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	#Remove Existing Children 
	for child in rickyFEpos.get_children():
		child.queue_free()
	#Add Child 
	rickyFEpos.add_child(rickyFEinst)
	#Checking for Instance 
	if is_instance_valid(rickyFEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_ricky_face_btn_pressed():
	rickyface_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------RICKY----------FACE----------END
#WILHELM---------FACE--------BEGIN---------------------------------------------------------------------------

func wilhelmFace_inst():
	var wilhelmFaceScene = preload("res://Meshes/Angels/Face/FaceScenes/wilhelm_mole.tscn")
	var wilhelmFEinst = wilhelmFaceScene.instantiate()
	var wilhelmFEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	#Remove Existing Children 
	for child in wilhelmFEpos.get_children():
		child.queue_free()
	#Add Child 
	wilhelmFEpos.add_child(wilhelmFEinst)
	#Checking for Instance 
	if is_instance_valid(wilhelmFEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_wilhelm_face_btn_pressed():
	wilhelmFace_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------WILHELM----------FACE----------END
#YORK---------FACE--------BEGIN---------------------------------------------------------------------------

func yorkFace_inst():
	var yorkFaceScene = preload("res://Meshes/Angels/Face/FaceScenes/york_mole.tscn")
	var yorkFEinst = yorkFaceScene.instantiate()
	var yorkFEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	#Remove Existing Children 
	for child in yorkFEpos.get_children():
		child.queue_free()
	#Add Child 
	yorkFEpos.add_child(yorkFEinst)
	#Checking for Instance 
	if is_instance_valid(yorkFEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_york_face_btn_pressed():
	yorkFace_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------YORK----------FACE----------END
#EDDIE---------FACE--------BEGIN---------------------------------------------------------------------------

func eddieFace_inst():
	var eddieFaceScene = preload("res://Meshes/Angels/Face/FaceScenes/eddie_beak.tscn")
	var eddieFEinst = eddieFaceScene.instantiate()
	var eddieFEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	#Remove Existing Children 
	for child in eddieFEpos.get_children():
		child.queue_free()
	#Add Child 
	eddieFEpos.add_child(eddieFEinst)
	#Checking for Instance 
	if is_instance_valid(eddieFEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_eddie_face_btn_pressed():
	eddieFace_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------EDDIE----------FACE----------END
#REMY---------FACE--------BEGIN---------------------------------------------------------------------------

func remyFace_inst():
	var remyFaceScene = preload("res://Meshes/Angels/Face/FaceScenes/remy_snout.tscn")
	var remyFEinst = remyFaceScene.instantiate()
	var remyFEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	#Remove Existing Children 
	for child in remyFEpos.get_children():
		child.queue_free()
	#Add Child 
	remyFEpos.add_child(remyFEinst)
	#Checking for Instance 
	if is_instance_valid(remyFEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_remy_face_btn_pressed():
	remyFace_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------REMY----------FACE----------END

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
# QF FACE HERE......................................................................................................................................

func _on_remove_face_pressed():
	var FacePos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
	var FacePosChild = FacePos.get_children
	for child in FacePos.get_children():
		child.queue_free()
#-----------------------------------------
#FACE COLOR CHANGE HERE.................................................................................................................
@onready var FacePos1 = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacePos"
var FE_mat3D = StandardMaterial3D.new()

func _on_face_color_picker_color_changed(color):
	print("Face Color Picker changed!")
	#Check if FacePos1 has any children to avoid out-of-bounds errors
	if FacePos1.get_child_count() > 0:
		print("Face instance ready to change!")
		var FacePosChild = FacePos1.get_child(0)
		if FacePosChild is MeshInstance3D:
			print("MeshInstance3D Detected.")
			#Ensure mat3D is a new instance of StandardMaterial3D 
			FE_mat3D.albedo_color = (color)
			FacePosChild.set_surface_override_material(0,FE_mat3D)
			FE_mat3D.cull_mode = BaseMaterial3D.CULL_DISABLED
			print("Face color changed!")
		else : 
			print("Nothing to change!")
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{FACE SECTION}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#---------------------------------------------------------------------------------------------------------------------------
#------------END--------------------------------------------------------------------------- FACE--------------
#---------------------------------------------------------------------------------------------------------------------------
#------------FACIAL HAIR------------------------------------------------------------------------------ BEGIN ------
#----------------------------------------------------------------------------------------------------------------------------

#DAVID---------FACIAL HAIR--------BEGIN---------------------------------------------------------------------------

func davidFacialHair_inst():
	var davidFacialHairScene = preload("res://Meshes/Angels/FacialHair/FacialHairInstScenes/DavidFacialHair.tscn")
	var davidFinst = davidFacialHairScene.instantiate()
	var davidFpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacialHairPos"
	#Remove Existing Children 
	for child in davidFpos.get_children():
		child.queue_free()
	#Add Child 
	davidFpos.add_child(davidFinst)
	#Checking for Instance 
	if is_instance_valid(davidFinst):
		pass

#AWAITING BUTTON PRESS...
func _on_david_facial_hair_btn_pressed():
	davidFacialHair_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------DAVID----------FACIAL HAIR----------END
#ZACHARIAH---------FACIAL HAIR--------BEGIN---------------------------------------------------------------------------

func zachariahFacialHair_inst():
	var zachariahFacialHairScene = preload("res://Meshes/Angels/FacialHair/FacialHairInstScenes/ZachariahFacialHairtscn.tscn")
	var zachariahFinst = zachariahFacialHairScene.instantiate()
	var zachariahFpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacialHairPos"
	#Remove Existing Children 
	for child in zachariahFpos.get_children():
		child.queue_free()
	#Add Child 
	zachariahFpos.add_child(zachariahFinst)
	#Checking for Instance 
	if is_instance_valid(zachariahFinst):
		pass

#AWAITING BUTTON PRESS...
func _on_zachariah_facial_hair_btn_pressed():
	zachariahFacialHair_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------ZACHARIAH----------FACIAL HAIR----------END
#SCOTTS---------FACIAL HAIR--------BEGIN---------------------------------------------------------------------------

func scottsFacialHair_inst():
	var scottsFacialHairScene = preload("res://Meshes/Angels/FacialHair/FacialHairInstScenes/ScottsFacialHair.tscn")
	var scottsFinst = scottsFacialHairScene.instantiate()
	var scottsFpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacialHairPos"
	#Remove Existing Children 
	for child in scottsFpos.get_children():
		child.queue_free()
	#Add Child 
	scottsFpos.add_child(scottsFinst)
	#Checking for Instance 
	if is_instance_valid(scottsFinst):
		pass

#AWAITING BUTTON PRESS...
func _on_scotts_facial_hair_btn_pressed():
	scottsFacialHair_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------SCOTTS----------FACIAL HAIR----------END
#MARS---------FACIAL HAIR--------BEGIN---------------------------------------------------------------------------

func marsFacialHair_inst():
	var marsFacialHairScene = preload("res://Meshes/Angels/FacialHair/FacialHairInstScenes/Mars_beard.tscn")
	var marsFinst = marsFacialHairScene.instantiate()
	var marsFpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacialHairPos"
	#Remove Existing Children 
	for child in marsFpos.get_children():
		child.queue_free()
	#Add Child 
	marsFpos.add_child(marsFinst)
	#Checking for Instance 
	if is_instance_valid(marsFinst):
		pass

#AWAITING BUTTON PRESS...
func _on_mars_facial_hair_btn_pressed():
	marsFacialHair_inst()
	#Playing Animation 
	AP.play("Posing001")

#------------------------------------------------------------------------SCOTTS----------FACIAL HAIR----------END

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
# QF FACIAL HAIR HERE......................................................................................................................................

func _on_remove_facial_hair_pressed():
	var FacialHairPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacialHairPos"
	var FacialHairPosChild = FacialHairPos.get_children
	for child in FacialHairPos.get_children():
		child.queue_free()
#-----------------------------------------
#FACIAL HAIR COLOR CHANGE HERE.................................................................................................................
@onready var FacialHairPos1 = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/FacialHairPos"
var FH_mat3D = StandardMaterial3D.new()

func _on_facial_hair_color_picker_color_changed(color):
	print("Facial Hair Color Picker changed!")
	#Check if FacialHairPos1 has any children to avoid out-of-bounds errors
	if FacialHairPos1.get_child_count() > 0:
		print("Facial Hair instance ready to change!")
		var FacialHairPosChild = FacialHairPos1.get_child(0)
		if FacialHairPosChild is MeshInstance3D:
			print("MeshInstance3D Detected.")
			#Ensure mat3D is a new instance of StandardMaterial3D 
			FH_mat3D.albedo_color = (color)
			FacialHairPosChild.material_override = FH_mat3D
			print("Facial Hair color changed!")
		else : 
			print("Nothing to change!")
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{FACE SECTION}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#---------------------------------------------------------------------------------------------------------------------------
#------------END--------------------------------------------------------------------------- FACE---------------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{BROWS SECTION}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}
#Brows Instances -------------------------------------------------------------------------------------------------------
#ROGER--------BROWS------------------BEGIN---------------------------------------------------------------------------

func rogerBrows_inst():
	var rogerBrowsScene = preload("res://Meshes/Angels/Brows/TSCN/roger_brows.tscn")
	var rogerBinst = rogerBrowsScene.instantiate()
	var rogerBpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	#Remove Existing Children 
	for child in rogerBpos.get_children():
		child.queue_free()
	#Add Child 
	rogerBpos.add_child(rogerBinst)
	#Checking for Instance 
	if is_instance_valid(rogerBinst):
		pass

#AWAITING BUTTON PRESS...
func _on_roger_brows_btn_pressed():
	rogerBrows_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------ROGER----------BROWS----------END
#SHAUN--------BROWS------------------BEGIN---------------------------------------------------------------------------

func shaunBrows_inst():
	var shaunBrowsScene = preload("res://Meshes/Angels/Brows/TSCN/shaun_brows.tscn")
	var shaunBinst = shaunBrowsScene.instantiate()
	var shaunBpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	#Remove Existing Children 
	for child in shaunBpos.get_children():
		child.queue_free()
	#Add Child 
	shaunBpos.add_child(shaunBinst)
	#Checking for Instance 
	if is_instance_valid(shaunBinst):
		pass

#AWAITING BUTTON PRESS...
func _on_shaun_brows_btn_pressed():
	shaunBrows_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------SHAUN----------BROWS----------END
#STATIA--------BROWS------------------BEGIN---------------------------------------------------------------------------

func statiaBrows_inst():
	var statiaBrowsScene = preload("res://Meshes/Angels/Brows/TSCN/statia_brows.tscn")
	var statiaBinst = statiaBrowsScene.instantiate()
	var statiaBpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	#Remove Existing Children 
	for child in statiaBpos.get_children():
		child.queue_free()
	#Add Child 
	statiaBpos.add_child(statiaBinst)
	#Checking for Instance 
	if is_instance_valid(statiaBinst):
		pass

#AWAITING BUTTON PRESS...
func _on_statia_brows_btn_pressed():
	statiaBrows_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------STATIA----------BROWS----------END
#YORK--------BROWS------------------BEGIN---------------------------------------------------------------------------

func yorkBrows_inst():
	var yorkBrowsScene = preload("res://Meshes/Angels/Brows/TSCN/york_brows.tscn")
	var yorkBinst = yorkBrowsScene.instantiate()
	var yorkBpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	#Remove Existing Children 
	for child in yorkBpos.get_children():
		child.queue_free()
	#Add Child 
	yorkBpos.add_child(yorkBinst)
	#Checking for Instance 
	if is_instance_valid(yorkBinst):
		pass

#AWAITING BUTTON PRESS...
func _on_york_brows_btn_pressed():
	yorkBrows_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------YORK----------BROWS----------END
#JAMIE--------BROWS------------------BEGIN---------------------------------------------------------------------------

func jamieBrows_inst():
	var jamieBrowsScene = preload("res://Meshes/Angels/Brows/TSCN/jamie_brows.tscn")
	var jamieBinst = jamieBrowsScene.instantiate()
	var jamieBpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	#Remove Existing Children 
	for child in jamieBpos.get_children():
		child.queue_free()
	#Add Child 
	jamieBpos.add_child(jamieBinst)
	#Checking for Instance 
	if is_instance_valid(jamieBinst):
		pass

#AWAITING BUTTON PRESS...
func _on_jamie_brows_btn_pressed():
	jamieBrows_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------JAMIE----------BROWS----------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DAVID--------BROWS------------------BEGIN---------------------------------------------------------------------------

func davidBrows_inst():
	var davidBrowsScene = preload("res://Meshes/Angels/Brows/TSCN/david_brows.tscn")
	var davidBinst = davidBrowsScene.instantiate()
	var davidBpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	#Remove Existing Children 
	for child in davidBpos.get_children():
		child.queue_free()
	#Add Child 
	davidBpos.add_child(davidBinst)
	#Checking for Instance 
	if is_instance_valid(davidBinst):
		pass

#AWAITING BUTTON PRESS...
func _on_david_brows_btn_pressed():
	davidBrows_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------DAVID----------BROWS----------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
# QF BROWS HERE......................................................................................................................................

func _on_remove_brows_pressed():
	var BrowsPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
	var BrowsPosChild = BrowsPos.get_children
	for child in BrowsPos.get_children():
		child.queue_free()
	
	#-----------------------------------------
#BROWS COLOR CHANGE HERE.................................................................................................................
@onready var BrowsPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/BrowsPos"
var B_mat3D = StandardMaterial3D.new()

func _on_brows_color_picker_color_changed(color):
	print("Brows Color Picker changed!")
	#Check if Brows has any children to avoid out-of-bounds errors
	if BrowsPos.get_child_count() > 0:
		print("Brows instance ready to change!")
		var BrowsPosChild = BrowsPos.get_child(0)
		if BrowsPosChild is MeshInstance3D:
			print("MeshInstance3D Detected.")
			#Ensure mat3D is a new instance of StandardMaterial3D 
			B_mat3D.albedo_color = (color)
			BrowsPosChild.material_override = B_mat3D
			print("Brows color changed!")
		else : 
			print("Nothing to change!")

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{BROWS SECTION END}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{



#---------------------------------------------------------------------------------------------------------------------------
#-----------------BEGIN--------------------------------------------------------------------------- EYE SECTION ------
#---------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{


#YORK-------EYES----------BEGIN-------------------------------------------------------------------------------------------

#INST FUNCTIONS
func yorkEyesinst():
	var yorkEyesScene = preload("res://Meshes/Angels/Eyes/YorkEyes.glb")
	var YEinst = yorkEyesScene.instantiate()
	var YorkEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in YorkEpos.get_children():
		child.queue_free()
	#Add Child 
	YorkEpos.add_child(YEinst)
	#Checking for Instance
	if is_instance_valid(YEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_york_eyes_btn_pressed():
	yorkEyesinst()
#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------YORK------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ZACH--------EYES---------BEGIN-------------------------------------------------------------------------------------------

#INST FUNCTIONS
func zachEyesinst():
	var zachEyesScene = preload("res://Meshes/Angels/Eyes/ZachEyes.glb")
	var zachEinst = zachEyesScene.instantiate()
	var zachEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in zachEpos.get_children():
		child.queue_free()
	#Add Child 
	zachEpos.add_child(zachEinst)
	#Checking for Instance
	if is_instance_valid(zachEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_zach_eyes_btn_pressed():
	zachEyesinst()
	#Playing Animation 
	AP.play("Posing001")
#Playing Animation 
	#AP.play("Posing001")

#-------------------------------------------------------------------------------------------ZACH------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MARS--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func marsEyes_inst():
	var marsEyesScene = preload("res://Meshes/Angels/Eyes/MarsEyes.glb")
	var marsEinst = marsEyesScene.instantiate()
	var marsEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in marsEpos.get_children():
		child.queue_free()
	#Add Child 
	marsEpos.add_child(marsEinst)
	#Checking for Instance 
	if is_instance_valid(marsEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_mars_eyes_btn_pressed():
	marsEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------MARS------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ROGER---------EYES--------BEGIN-------------------------------------------------------------------------------------------

func rogerEyes_inst():
	var rogerEyesScene = preload("res://Meshes/Angels/Eyes/RogerEyes.glb")
	var rogerEinst = rogerEyesScene.instantiate()
	var RogerEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in RogerEpos.get_children():
		child.queue_free()
	#Add Child 
	RogerEpos.add_child(rogerEinst)
	#Checking for Instance 
	if is_instance_valid(rogerEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_roger_eyes_btn_pressed():
	rogerEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ROGER------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DONNY--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func donnyEyes_inst():
	var donnyEyesScene = preload("res://Meshes/Angels/Eyes/DonnyEyes.glb")
	var donnyEinst = donnyEyesScene.instantiate()
	var DonnyEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in DonnyEpos.get_children():
		child.queue_free()
	#Add Child 
	DonnyEpos.add_child(donnyEinst)
	#Checking for Instance 
	if is_instance_valid(donnyEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_donny_eyes_btn_pressed():
	donnyEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------DONNY------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#STATIA--------EYES---------BEGIN------------------------------------------------------------------------------------------

func statiaEyes_inst():
	var statiaEyesScene = preload("res://Meshes/Angels/Eyes/StatiaEyes.glb")
	var statiaEinst = statiaEyesScene.instantiate()
	var statiaEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in statiaEpos.get_children():
		child.queue_free()
	#Add Child 
	statiaEpos.add_child(statiaEinst)
	#Checking for Instance 
	if is_instance_valid(statiaEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_statia_eyes_btn_pressed():
	statiaEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------STATIA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MANDA---------EYES--------BEGIN------------------------------------------------------------------------------------------

func mandaEyes_inst():
	var mandaEyesScene = preload("res://Meshes/Angels/Eyes/MandaEyes.glb")
	var mandaEinst = mandaEyesScene.instantiate()
	var mandaEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in mandaEpos.get_children():
		child.queue_free()
	#Add Child 
	mandaEpos.add_child(mandaEinst)
	#Checking for Instance 
	if is_instance_valid(mandaEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_manda_eyes_btn_pressed():
	mandaEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------MANDA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DAVID--------EYES---------BEGIN------------------------------------------------------------------------------------------

func davidEyes_inst():
	var davidEyesScene = preload("res://Meshes/Angels/Eyes/DavidEyes.glb")
	var davidEinst = davidEyesScene.instantiate()
	var davidEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in davidEpos.get_children():
		child.queue_free()
	#Add Child 
	davidEpos.add_child(davidEinst)
	#Checking for Instance 
	if is_instance_valid(davidEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_david_eyes_btn_pressed():
	davidEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------MANDA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#NORMAN--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func normanEyes_inst():
	var normanEyesScene = preload("res://Meshes/Angels/Eyes/NormanEyes.glb")
	var normanEinst = normanEyesScene.instantiate()
	var normanEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in normanEpos.get_children():
		child.queue_free()
	#Add Child 
	normanEpos.add_child(normanEinst)
	#Checking for Instance 
	if is_instance_valid(normanEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_norman_eyes_btn_pressed():
	normanEyes_inst()
	#Playing Animation 
	AP.play("Posing001")
	
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ANGELO--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func angeloEyes_inst():
	var angeloEyesScene = preload("res://Meshes/Angels/Eyes/AngeloEyes.glb")
	var angeloEinst = angeloEyesScene.instantiate()
	var angeloEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in angeloEpos.get_children():
		child.queue_free()
	#Add Child 
	angeloEpos.add_child(angeloEinst)
	#Checking for Instance 
	if is_instance_valid(angeloEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_angelo_eyes_btn_pressed():
	angeloEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ANGELO------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ETHAN--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func ethanEyes_inst():
	var ethanEyesScene = preload("res://Meshes/Angels/Eyes/EthanEyes.glb")
	var ethanEinst = ethanEyesScene.instantiate()
	var ethanEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in ethanEpos.get_children():
		child.queue_free()
	#Add Child 
	ethanEpos.add_child(ethanEinst)
	#Checking for Instance 
	if is_instance_valid(ethanEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_ethan_eyes_btn_pressed():
	ethanEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ETHAN------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#JAMIE--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func jamieEyes_inst():
	var jamieEyesScene = preload("res://Meshes/Angels/Eyes/JamieEyes.glb")
	var jamieEinst = jamieEyesScene.instantiate()
	var jamieEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in jamieEpos.get_children():
		child.queue_free()
	#Add Child 
	jamieEpos.add_child(jamieEinst)
	#Checking for Instance 
	if is_instance_valid(jamieEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_jamie_eyes_btn_pressed():
	jamieEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------JAMIE------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#AGNA--------EYES---------BEGIN-------------------------------------------------------------------------------------------

func agnaEyes_inst():
	var agnaEyesScene = preload("res://Meshes/Angels/Eyes/AgnaEyes.glb")
	var agnaEinst = agnaEyesScene.instantiate()
	var agnaEpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	#Remove Existing Children 
	for child in agnaEpos.get_children():
		child.queue_free()
	#Add Child 
	agnaEpos.add_child(agnaEinst)
	#Checking for Instance 
	if is_instance_valid(agnaEinst):
		pass

#AWAITING BUTTON PRESS...
func _on_agna_eyes_btn_pressed():
	agnaEyes_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------JAMIE------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

# QF EYES HERE......................................................................................................................................

func _on_remove_eyes_pressed():
	var EyePos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	var EyePosChild = EyePos.get_children
	for child in EyePos.get_children():
		child.queue_free()

#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

# MOVE EYES HERE......................................................................................................................................

func _move_eyes_horizontally():
	var Hslider = $TabContainer/Eyes/HSlider
	var EyePos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	var EyePosAP = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos/AnimationPlayer"

func _on_h_slider_changed():
	var Hslider = $TabContainer/Eyes/HSlider
	var EyePos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/EyePos"
	var EyePosChild = EyePos.get_children
	
	EyePosChild.position = Hslider.value

#---------------------------------------------------------------------------------------------------------------------------
#------------END---------------------------------------------------------------------------------- EYE SECTION ------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#---------------------------------------------------------------------------------------------------------------------------
#------------ MOUTH SECTION --------------------------------------------------------------------------BEGIN ------
#----------------------------------------------------------------------------------------------------------------------------

#STATIA---------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func statiaMouth_inst():
	var statiaMouthScene = preload("res://Meshes/Angels/Mouths/StatiaMouth.glb")
	var statiaMinst = statiaMouthScene.instantiate()
	var statiaMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in statiaMpos.get_children():
		child.queue_free()
	#Add Child 
	statiaMpos.add_child(statiaMinst)
	#Checking for Instance 
	if is_instance_valid(statiaMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_statia_mouth_btn_pressed():
	statiaMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------STATIA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MANDA----------MOUTH--------BEGIN------------------------------------------------------------------------------------------

func mandaMouth_inst():
	var mandaMouthScene = preload("res://Meshes/Angels/Mouths/MandaMouth.glb")
	var mandaMinst = mandaMouthScene.instantiate()
	var mandaMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in mandaMpos.get_children():
		child.queue_free()
	#Add Child 
	mandaMpos.add_child(mandaMinst)
	#Checking for Instance 
	if is_instance_valid(mandaMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_manda_mouth_btn_pressed():
	mandaMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------STATIA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DONNY--------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func donnyMouth_inst():
	var donnyMouthScene = preload("res://Meshes/Angels/Mouths/DonnyMouth.glb")
	var donnyMinst = donnyMouthScene.instantiate()
	var donnyMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in donnyMpos.get_children():
		child.queue_free()
	#Add Child 
	donnyMpos.add_child(donnyMinst)
	#Checking for Instance 
	if is_instance_valid(donnyMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_donny_mouth_btn_pressed():
	donnyMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------DONNY------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#MARS--------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func marsMouth_inst():
	var marsMouthScene = preload("res://Meshes/Angels/Mouths/MarsMouth.glb")
	var marsMinst = marsMouthScene.instantiate()
	var marsMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in marsMpos.get_children():
		child.queue_free()
	#Add Child 
	marsMpos.add_child(marsMinst)
	#Checking for Instance 
	if is_instance_valid(marsMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_mars_mouth_btn_pressed():
	marsMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------MARS------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#DAVID---------MOUTH--------BEGIN------------------------------------------------------------------------------------------

func davidMouth_inst():
	var davidMouthScene = preload("res://Meshes/Angels/Mouths/DavidMouth.glb")
	var davidMinst = davidMouthScene.instantiate()
	var davidMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in davidMpos.get_children():
		child.queue_free()
	#Add Child 
	davidMpos.add_child(davidMinst)
	#Checking for Instance 
	if is_instance_valid(davidMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_david_mouth_btn_pressed():
	davidMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#---------------------------------------------------------------------------------DAVID----------MOUTH----------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#NORMAN---------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func normanMouth_inst():
	var normanMouthScene = preload("res://Meshes/Angels/Mouths/NormanMouth.glb")
	var normanMinst = normanMouthScene.instantiate()
	var normanMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in normanMpos.get_children():
		child.queue_free()
	#Add Child 
	normanMpos.add_child(normanMinst)
	#Checking for Instance 
	if is_instance_valid(normanMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_norman_mouth_btn_pressed():
	normanMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------NORMAN------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ANGELO---------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func angeloMouth_inst():
	var angeloMouthScene = preload("res://Meshes/Angels/Mouths/AngeloMouth.glb")
	var angeloMinst = angeloMouthScene.instantiate()
	var angeloMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in angeloMpos.get_children():
		child.queue_free()
	#Add Child 
	angeloMpos.add_child(angeloMinst)
	#Checking for Instance 
	if is_instance_valid(angeloMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_angelo_mouth_btn_pressed():
	angeloMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ANGELO------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#ETHAN---------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func ethanMouth_inst():
	var ethanMouthScene = preload("res://Meshes/Angels/Mouths/EthanMouth.glb")
	var ethanMinst = ethanMouthScene.instantiate()
	var ethanMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in ethanMpos.get_children():
		child.queue_free()
	#Add Child 
	ethanMpos.add_child(ethanMinst)
	#Checking for Instance 
	if is_instance_valid(ethanMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_ethan_mouth_btn_pressed():
	ethanMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------ETHAN------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#AGNA---------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func agnaMouth_inst():
	var agnaMouthScene = preload("res://Meshes/Angels/Mouths/AgnaMouth.glb")
	var agnaMinst = agnaMouthScene.instantiate()
	var agnaMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in agnaMpos.get_children():
		child.queue_free()
	#Add Child 
	agnaMpos.add_child(agnaMinst)
	#Checking for Instance 
	if is_instance_valid(agnaMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_agna_mouth_btn_pressed():
	agnaMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------AGNA------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{
#JASON---------MOUTH---------BEGIN------------------------------------------------------------------------------------------

func jasonMouth_inst():
	var jasonMouthScene = preload("res://Meshes/Angels/Mouths/JasonMouth.glb")
	var jasonMinst = jasonMouthScene.instantiate()
	var jasonMpos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	#Remove Existing Children 
	for child in jasonMpos.get_children():
		child.queue_free()
	#Add Child 
	jasonMpos.add_child(jasonMinst)
	#Checking for Instance 
	if is_instance_valid(jasonMinst):
		pass

#AWAITING BUTTON PRESS...
func _on_jason_mouth_btn_pressed():
	jasonMouth_inst()
	#Playing Animation 
	AP.play("Posing001")

#-------------------------------------------------------------------------------------------JASON------------------END
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{


#---------------------------------------------------------------------------------------------------------------------------
# QF MOUTHS HERE......................................................................................................................................

func _on_remove_mouths_pressed():
	var MouthPos = $"../../../../Base_Angel/Armature/Skeleton3D/NeckBone/MouthPos"
	var MouthPosChild = MouthPos.get_children
	for child in MouthPos.get_children():
		child.queue_free()

#------------END------------------------------------------------------------------------------ MOUTHS ----------------
#----------------------------------------------------------------------------------------------------------------------------
#}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{

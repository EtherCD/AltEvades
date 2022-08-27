extends ColorRect

export(String) var HeroName = "";
export(String) var A1 = "";
export(String) var A2 = "";
export(String) var HeroLink = ""
export(String) var LevelToComplite = "";
export(Color) var HeroColor = Color(0,0,0,0);
export(int) var CurrentLevel = 40;

func _ready():
	if HeroName in Singletone.hero_info:
		HeroColor = Color(Singletone.hero_info[HeroName]["HeroColor"]["r"],
							Singletone.hero_info[HeroName]["HeroColor"]["g"],
							Singletone.hero_info[HeroName]["HeroColor"]["b"])
		A1 = Singletone.hero_info[HeroName]["A1"]
		A2 = Singletone.hero_info[HeroName]["A2"]
		HeroLink = Singletone.hero_info[HeroName]["HeroLink"]
		LevelToComplite = Singletone.hero_info[HeroName]["LevelToComplite"]
		CurrentLevel = Singletone.hero_info[HeroName]["CurrentLevel"]
	if not HeroName in Singletone.current_herous:
		$Unloked.visible=true
		$Button.disabled=true;
		$Unloked/Unlock.text='Complete "'+LevelToComplite+': Area '+str(CurrentLevel)+'" to unlock it.'
		$HeroSprite.modulate = Color(0.3,0.3,0.3,0.3)
	get_node("Hero Name").text = HeroName
	get_node("A1").text = A1
	get_node("A2").text = A2
	$HeroSprite.modulate = HeroColor;

func _on_Button_pressed():
	var game = preload("res://Main.tscn").instance()
	game.chLink = HeroLink
	get_tree().get_root().add_child(game)
	hide()

extends Node2D

var bons = []
var mals = []
var bonzin_pack = preload("res://missil_bom.tscn")

func _on_area_2d_area_entered(body: Area2D) -> void:
	if body.is_in_group("maligno"):
		if not is_instance_valid(body): return
		var bonzin = gerar_bonzin(body)
		var call_mal = func(mal):
			#body.name = "malzado"
			#print("um bom morreu, mas ainda tem um de pé")
			if is_instance_valid(mal):
				gerar_bonzin(mal)
		bonzin.morri.connect(call_mal)

func gerar_bonzin(malzin):
	var bonzin
	if not is_instance_valid(malzin): return
	bonzin = bons.pop_front()

	if not is_instance_valid(bonzin):
		bonzin = bonzin_pack.instantiate()
		bonzin.global_position = global_position + Vector2(randi_range(-120,120),0)
		bonzin.rotation = Vector2.UP.angle()
		get_parent().call_deferred("add_child", bonzin)
	bonzin.alvo = malzin

	var call_bom = func(o_bom):
		#print("MORREU")
		if o_bom and is_instance_valid(o_bom):
			#print("bonzin vivasso")
			bons.append(o_bom)
	
	malzin.morri.connect(call_bom.bind(bonzin))
	return bonzin

extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grow = false


func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantselected
		


func _on_area_2d_area_entered(area):
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$carrotgwotimer.start()
			$plant.play("carrotgrowing")
		if plant == 2:
			plantgrowing = true
			$oniogrowtimer.start()
			$plant.play("oniogrowing")
	else:
		print("Já existe uma planta aqui")


func _on_carrotgwotimer_timeout():
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotgwotimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grow = true


func _on_oniogrowtimer_timeout():
	var onion_plant = $plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$oniogrowtimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grow = true


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grow:
			if plant == 1:
				Global.numofcarrots += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			if plant == 2:
				Global.numofonions += 1
				plantgrowing = false
				plant_grow = false
				$plant.play("none")
			else:
				pass
		print("Número de cenouras: " + str(Global.numofcarrots))
		print("Número de cebolas: " + str(Global.numofonions))

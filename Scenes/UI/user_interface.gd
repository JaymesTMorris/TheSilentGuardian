extends Control


func _on_heal_button_down() -> void:
	StatsManager.heal()


func _on_heal_amount_button_down() -> void:
	StatsManager.incrementHealAmount()


func _on_max_health_button_down() -> void:
	StatsManager.incrementMaxHealth()


func _on_mana_regen_button_down() -> void:
	StatsManager.incrementManaRegen()


func _on_max_mana_button_down() -> void:
	StatsManager.incrementMaxMana()


func _on_tower_range_button_down() -> void:
	StatsManager.incrementTowerRange()


func _on_tower_damage_button_down() -> void:
	StatsManager.incrementTowerDamage()


func _on_tower_atk_spd_button_down() -> void:
	StatsManager.incrementTowerAtkSpd()

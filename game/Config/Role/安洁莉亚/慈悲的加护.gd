extends Spell

func _get_spell_info() -> Dictionary:
	return {
		"name": "慈悲的加护",
		"desc": "向太阳祈祷，替我方全体叠盾（65）。并赋予减伤。"
	}

func _get_target_selection_type() -> DuaEnum.TargetSelectionType:
	return DuaEnum.TargetSelectionType.AllTeammate

func can_use() -> bool:
	return mana_points >= 2
	
func use() -> void:
	mana_points -= 1
	for victim in victims:
		victim.apply_attr_change(65, DuaEnum.DamageType.ArmorBoost)

extends Spell

func _get_spell_info() -> Dictionary:
	return {
		"name": "纯洁之心",
		"desc": "发射弓箭，攻击敌方指定角色(81)，有25%机会改成(163)。"
	}

func _get_target_selection_type() -> DuaEnum.TargetSelectionType:
	return DuaEnum.TargetSelectionType.OneEnemy

func can_use() -> bool:
	return mana_points >= 1
	
func use() -> void:
	mana_points -= 1

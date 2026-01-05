extends Spell

func _get_spell_info() -> Dictionary:
	return {
		"name": "纯洁之心",
		"desc": "向太阳祈祷，替我方指定角色叠盾（54）。并触发其一技能。"
	}

func _get_target_selection_type() -> DuaEnum.TargetSelectionType:
	return DuaEnum.TargetSelectionType.OneEnemy

func can_use() -> bool:
	return FightBlackboard.mana_points >= 1
	
func use() -> void:
	FightBlackboard.mana_points -= 1

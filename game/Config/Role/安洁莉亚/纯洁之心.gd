extends Spell

func _get_spell_info() -> Dictionary:
	return {
		"name": "纯洁之心",
		"desc": "向太阳祈祷，替我方指定角色叠盾（54）。并触发其一技能。"
	}

func _get_target_selection_type() -> DuaEnum.TargetSelectionType:
	return DuaEnum.TargetSelectionType.OneTeammate

func can_use() -> bool:
	return mana_points >= 1
	
func use() -> void:
	FightBlackboard.mana_points -= 1
	for victim in victims:
		victim.apply_attr_change(54, DuaEnum.DamageType.ArmorBoost)
	

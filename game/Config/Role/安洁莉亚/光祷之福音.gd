extends Spell

func _get_spell_info() -> Dictionary:
	return {
		"name": "光祷之福音",
		"desc": "向太阳祈祷，治愈我方首位（163），赋予其弱化。并触发其四魂技能。"
	}

func _get_target_selection_type() -> DuaEnum.TargetSelectionType:
	return DuaEnum.TargetSelectionType.FirstTeammate

func can_use() -> bool:
	return true

func use() -> void:
	pass

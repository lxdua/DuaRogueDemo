extends Spell

func _get_spell_info() -> Dictionary:
	return {
		"name": "瞬发一箭",
		"desc": "发射弓箭，攻击敌方指定角色(40)，并赋予其2回合的易伤。"
	}

func _get_target_selection_type() -> DuaEnum.TargetSelectionType:
	return DuaEnum.TargetSelectionType.OneEnemy

func can_use() -> bool:
	return mana_points >= 1
	
func use() -> void:
	mana_points -= 1
	for victim in victims:
		victim.apply_attr_change(40, DuaEnum.DamageType.ArmorBoost)
		victim.add_buff("易伤")

@abstract
class_name Spell extends RefCounted

var mana_points: int:
	get:
		return FightBlackboard.mana_points

var victims: Array[Role]:
	get:
		return FightBlackboard.cur_victim_arr

var spell_info: Dictionary:
	get:
		return _get_spell_info()

var target_selection_type: DuaEnum.TargetSelectionType:
	get:
		return _get_target_selection_type()

@abstract func _get_spell_info() -> Dictionary
@abstract func _get_target_selection_type() -> DuaEnum.TargetSelectionType
@abstract func can_use() -> bool
@abstract func use() -> void

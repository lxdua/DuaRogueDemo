class_name Attribute extends RefCounted

var base_value: int

var modifier_dict: Dictionary[DuaEnum.ModifierType, Array]

var current_value: int
var immutable_change: int
var is_dirty: bool = true

static func create(value: int) -> Attribute:
	var attr := Attribute.new()
	attr.base_value = value
	return attr

func get_value() -> int:
	if is_dirty:
		current_value = _compute_value(
			base_value,
			modifier_dict[DuaEnum.ModifierType.SET],
			modifier_dict[DuaEnum.ModifierType.ADD],
			modifier_dict[DuaEnum.ModifierType.MUL],
			) + immutable_change
		is_dirty = false
	return current_value

func add(value: int):
	immutable_change += value

#region 可自定义部分

func add_modifier(modifier: Modifier):
	is_dirty = true
	modifier_dict[modifier.modifier_type].append(modifier)

func remove_modifier(modifier: Modifier):
	is_dirty = true
	modifier_dict[modifier.modifier_type].erase(modifier)

func _compute_value(ori_value: int, type_set: Array[Modifier], type_add: Array[Modifier], type_mul: Array[Modifier]) -> int:
	var cur_value := ori_value
	for m_set in type_set:
		var res := m_set.apply(cur_value)
		if res[0] == true:
			cur_value = res[1]
			return cur_value
	for m_mul in type_mul:
		cur_value = m_mul.apply(cur_value)[1]
	for m_add in type_add:
		cur_value = m_add.apply(cur_value)[1]
	return cur_value

#endregion

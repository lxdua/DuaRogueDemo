class_name Modifier extends RefCounted

var modifier_type: DuaEnum.ModifierType
var modifier_value: int
var modifier_apply_flag: Callable

static func create(type: DuaEnum.ModifierType, value: int, apply_flag: Callable) -> Modifier:
	var modifier := Modifier.new()
	modifier.modifier_type = type
	modifier.modifier_value = value
	modifier.modifier_apply_flag = apply_flag
	return modifier

func apply(ori_value: int) -> Array:
	var final_value := ori_value
	if not modifier_apply_flag.call():
		return [false, final_value]
	match modifier_type:
		DuaEnum.ModifierType.ADD:
			final_value = ori_value + modifier_value
		DuaEnum.ModifierType.MUL:
			final_value = ori_value + int(float(modifier_value) / 100.0)
		DuaEnum.ModifierType.SET:
			final_value = modifier_value
	return [true, final_value]

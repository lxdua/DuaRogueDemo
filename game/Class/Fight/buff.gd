@abstract class_name Buff extends Node

var buff_name: String
var buff_desc: String
var hide_ui: bool = false

var holder: Role
var lifetime: int = 1
var extra_info: Dictionary = {}

func _init_attr():
	pass

func _enter():
	pass

func _exit():
	pass

func _enter_tree() -> void:
	_init_attr()
	_enter()
	DuaEvent.buff_enter.emit(self)

func _exit_tree() -> void:
	_exit()
	DuaEvent.buff_exit.emit(self)

func add_lifetime(value: int = -1):
	lifetime += value
	if lifetime <= 0:
		holder.remove_buff(self)

@warning_ignore("shadowed_variable")
static func cast_buff(buff_name: String, holder: Role, lifetime: int):
	var buff_node: Buff = holder.get_node(buff_name)
	if buff_node == null:
		buff_node.add_lifetime(lifetime)
	else:
		var new_buff := create(buff_name, holder, lifetime)
		holder.add_child(new_buff)

@warning_ignore("shadowed_variable")
static func create(buff_name: String, holder: Role, lifetime: int) -> Buff:
	var buff: Buff = GameConfig.buff_dict[buff_name].new()
	buff.name = buff_name
	buff.holder = holder
	buff.lifetime = lifetime
	return buff

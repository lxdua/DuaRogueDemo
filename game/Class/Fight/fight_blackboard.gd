extends Node


@export var max_mana_points: int = 3

var mana_points: int = 3

var total_amount: int = 1
var surviving_amount: int = 1


var cur_caster: Role
var cur_victim_arr: Array[Role]

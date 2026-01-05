class_name RoleInfo extends Resource


@export var role_type: DuaEnum.RoleType
@export var max_health: int
@export var max_armor: int
@export var strength: int
@export var dodge: int

@export var advisor_skill: String
@export var passive_skill: String
@export var skill_1: String
@export var skill_2: String
@export var skill_3: String

@export var ex_attr_dict: Dictionary[String, int]

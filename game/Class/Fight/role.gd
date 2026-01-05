class_name Role extends Node


var role_info: RoleInfo

var attrs: Dictionary[String, Attribute]

func _init_attrs():
	
	attrs[DuaEnum.RoleAttr.Health] = Attribute.create(role_info.max_health)
	attrs[DuaEnum.RoleAttr.MaxHealth] = Attribute.create(role_info.max_health)
	attrs[DuaEnum.RoleAttr.HealthFactor] = Attribute.create(100)
	
	attrs[DuaEnum.RoleAttr.Armor] = Attribute.create(0)
	attrs[DuaEnum.RoleAttr.MaxArmor] = Attribute.create(role_info.max_armor)
	attrs[DuaEnum.RoleAttr.ArmorFactor] = Attribute.create(100)
	
	attrs[DuaEnum.RoleAttr.Strength] = Attribute.create(role_info.strength)
	
	attrs[DuaEnum.RoleAttr.Dodge] = Attribute.create(role_info.dodge)
	
	var ex_attr_dict := role_info.ex_attr_dict
	for ex_attr in ex_attr_dict:
		attrs[ex_attr] = Attribute.create(ex_attr_dict[ex_attr])

# 伤害结算顺序： 攻击 -> 闪避 -> 命中 -> 护盾 -> 

func apply_attr_change(value: int, type: DuaEnum.DamageType):
	match type:
		DuaEnum.DamageType.PhysicalAttack:
			pass
		DuaEnum.DamageType.ArmorBreak:
			pass
		DuaEnum.DamageType.MagicAttack:
			pass
		DuaEnum.DamageType.Healing:
			pass
		DuaEnum.DamageType.ArmorBoost:
			var armor := attrs[DuaEnum.RoleAttr.Armor]
			var armor_factor := attrs[DuaEnum.RoleAttr.ArmorFactor]
			armor.add(value * armor_factor.get_value())

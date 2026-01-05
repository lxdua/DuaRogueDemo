class_name DuaEnum extends RefCounted

enum ModifierType { SET, ADD, MUL }

enum RoleType {
	None    = 0,
	Attack  = 1 << 0,
	Defence = 1 << 1,
	Support = 1 << 2,
}

enum DamageType {
	PhysicalAttack,
	ArmorBreak,
	MagicAttack,
	Healing,
	ArmorBoost,
}

enum TargetSelectionType {
	OneEnemy,
	OneTeammate,
	AllEnemy,
	AllTeammate,
	FirstEnemy,
	FirstTeammate,
	LastEnemy,
	LastTeammate,
}

class RoleAttr:
	
	static var Health := "Health"
	static var MaxHealth := "MaxHealth"
	static var HealthFactor := "HealthFactor"
	
	static var Armor := "Armor"
	static var MaxArmor := "MaxArmor"
	static var ArmorFactor := "ArmorFactor"
	
	static var Strength := "Strength"
	static var Dodge := "Dodge"

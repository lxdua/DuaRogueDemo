extends PanelContainer

@onready var name_label: Label = $MarginContainer/VBoxContainer/NameLabel
@onready var desc_label: Label = $MarginContainer/VBoxContainer/DescLabel

var spell: Spell:
	set(v):
		spell = v
		update_ui()

func update_ui():
	if not spell:
		return
	var spell_info := spell.spell_info
	name_label.text = spell_info["name"]
	desc_label.text = spell_info["desc"]


func _on_spell_ui_button_pressed() -> void:
	FightBlackboard.selected_spell = spell

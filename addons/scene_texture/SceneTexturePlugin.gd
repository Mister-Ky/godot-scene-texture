@tool
extends EditorPlugin


var scene_texture_inspector = preload("res://addons/scene_texture/editor/SceneTextureInspector.gd").new()


func _enter_tree() -> void:
	add_setting("scene_texture/auto_bake_delay", 0.25)
	add_setting("scene_texture/default_world_3d", "", TYPE_STRING, PROPERTY_HINT_FILE)
	
	add_inspector_plugin(scene_texture_inspector)


func _exit_tree() -> void:
	remove_inspector_plugin(scene_texture_inspector)


func add_setting(property_name: String, default: Variant, type = -1, hint = -1, hint_string = ""):
	if not ProjectSettings.has_setting(property_name):
		ProjectSettings.set_setting(property_name, default)
	ProjectSettings.set_initial_value(property_name, default)
	
	if type != -1:
		var property_info = {
			"name": property_name,
			"type": type,
		}
		if hint != -1:
			property_info["hint"] = hint
			property_info["hint_string"] = hint_string
		
		ProjectSettings.add_property_info(property_info)

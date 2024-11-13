extends TileMapLayer

@export var highlight_tile_id: int = 0  # ID of the tile used for both static and dynamic highlighting
var highlighted_cell: Vector2i = Vector2i(-1, -1)  # Track the currently highlighted cell

func _process(delta: float) -> void:
	# Ensure the tile set is valid
	if not tile_set:
		print("Error: No TileSet assigned to HighlightLayer.")
		return

	var mouse_position: Vector2 = get_global_mouse_position()
	var cell_position: Vector2i = local_to_map(mouse_position)

	# If the hovered cell changes, update the highlight
	if cell_position != highlighted_cell:
		# Clear the previous highlight
		if highlighted_cell != Vector2i(-1, -1):
			set_cell(highlighted_cell, 0, Vector2i(-1, 0))  # Clear by setting tile ID to -1 wrapped in Vector2i

		# Highlight the new cell
		highlighted_cell = cell_position
		set_cell(highlighted_cell, 0, Vector2i(highlight_tile_id, 0))

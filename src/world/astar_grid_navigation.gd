class_name TileMapNavigation
extends TileMapLayer

@export_group("Navigation Tile", "nav_tile")
@export var nav_tile_source_id: int = 0
@export var nav_tile_atlas_coords: Vector2i
@export var nav_tile_alternative_tile: int = 0

func _ready() -> void:
	var rect: Rect2i = get_used_rect()
	for i in range(rect.position.x, rect.end.x):
		for j in range(rect.position.y, rect.end.y):
			var coords: Vector2i = Vector2i(i, j)
			if get_cell_atlas_coords(coords) == Vector2i(-1, -1):
				set_cell(coords, nav_tile_source_id, nav_tile_atlas_coords, nav_tile_alternative_tile)
	update_internals()

extends TileMapLayer

var astar_grid: AStarGrid2D
var line: Line2D
var entity: Entity2D

func _ready() -> void:
	astar_grid = AStarGrid2D.new()
	astar_grid.region = get_used_rect()
	astar_grid.cell_size = tile_set.tile_size
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	astar_grid.update()
	
	for coords: Vector2i in get_used_cells():
		astar_grid.set_point_solid(coords)
	
	line = get_child(0)
	entity = get_parent().find_child("Player")

func _physics_process(delta: float) -> void:
	var from_id: Vector2i = get_global_mouse_position() / tile_set.tile_size.x
	var to_id: Vector2i = entity.position / tile_set.tile_size.x
	var path: PackedVector2Array = astar_grid.get_point_path(from_id, to_id)
	line.clear_points()
	for p in path:
		line.add_point(p + tile_set.tile_size / 2.0)

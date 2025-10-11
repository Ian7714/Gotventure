if (instance_exists(target))
{
	viewx = lerp(viewx, target.x, 0.08);
	viewy = lerp(viewy, target.y, 0.08);
	vm = matrix_build_lookat(viewx, viewy, -10, viewx, viewy, 0, 0, 1, 0)
	camera_set_view_mat(camera, vm)
}
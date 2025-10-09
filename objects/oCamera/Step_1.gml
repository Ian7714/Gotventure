if(!view_enabled)
{
	view_set_wport(0, 640);
	view_set_hport(0, 360);
	view_set_visible(0, true);
	camera_set_view_mat(camera, vm);
	camera_set_proj_mat(camera, pm);
	view_camera[0] = camera;
	view_enabled = true;
}

if(window_get_width() != 1280 && window_get_height() != 720)
{
	window_set_size(1280, 720);
	surface_resize(application_surface, 640, 360);
}
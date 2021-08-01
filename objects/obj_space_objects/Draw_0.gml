orientation += rot_speed;

if (!surface_exists(instance_surf_id)){
	instance_surf_id = surface_create(canvas_size,canvas_size);
}

surface_set_target(instance_surf_id);
draw_clear_alpha(c_white,0);

switch(object_type){
	default:
		draw_clear(c_blue)
		break;
	case 1:
		draw_nstar_outline(canvas_size/2, canvas_size/2, star_n, star_br, star_lr, 0 , orientation, main_col, stroke_w);
		draw_gravity_border(canvas_size/2, canvas_size/2, 15, gravity_r, 64, orientation, main_col ,stroke_w);
		break;
	case 2:
		draw_nstar_outline(canvas_size/2, canvas_size/2, 32, r, r, 0 , orientation, main_col, stroke_w);
		draw_gravity_border(canvas_size/2, canvas_size/2, 15, gravity_r, 64, orientation, main_col ,stroke_w);
		break;
}
surface_reset_target()
draw_surface(instance_surf_id,x - canvas_size/2, y - canvas_size/2);
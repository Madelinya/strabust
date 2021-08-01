//These are PURELY draw function, do not deal with anything concerning surfaces. Assumes existence of surface

//legacy
function draw_ngon_r(x_pos, y_pos, n, r, orientation, col, alpha, outline){
	
	//simple input check
	n = abs(round(n));
	n = clamp(n, 3, 64);
	
	alpha = abs(alpha);
	
	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	r = abs(r);
	//
	var tri_angle = 360 / n;
	
	draw_set_color(col);
	draw_set_alpha(alpha);
	
	
	for (i = 0; i < n; i++){
		var c1x = lengthdir_x(r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c1y = lengthdir_y(r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c2x = lengthdir_x(r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		var c2y = lengthdir_y(r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		
		draw_triangle(x_pos,y_pos,x_pos + c1x,y_pos + c1y,x_pos + c2x,y_pos + c2y,outline);
	}
}

function draw_ngon_h(x_pos, y_pos, n, h, orientation, col, alpha, outline){
		//simple input check
	n = abs(round(n));
	n = clamp(n, 3, 64);
	
	alpha = abs(alpha);
	
	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	h = abs(h);
	//
	var tri_angle = 360 / n;
	
	var temp_r = h / dcos(tri_angle/2)
	
	draw_set_color(col);
	draw_set_alpha(alpha);
	
	
	for (i = 0; i < n; i++){
		var c1x = lengthdir_x(temp_r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c1y = lengthdir_y(temp_r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c2x = lengthdir_x(temp_r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		var c2y = lengthdir_y(temp_r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		
		draw_triangle(x_pos,y_pos,x_pos + c1x,y_pos + c1y,x_pos + c2x,y_pos + c2y,outline);
	}
}

function draw_nstar(x_pos, y_pos, n, r1, r2, tip_angle, orientation, col, alpha, outline, draw_inner_part){
		//simple input check
	n = abs(round(n));
	n = clamp(n, 3, 64);
	
	alpha = abs(alpha);
	
	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	r1 = abs(r1);
	r2 = abs(r2);
	
	if (r2 > r1){
		var r3 = r1;
		r1 = r2;
		r2 = r3;
	}
	
	var max_tip_angle = darccos(r2/r1);
	tip_angle = clamp(tip_angle, -max_tip_angle, max_tip_angle);
	//
	var tri_angle = 360 / n;
	
	draw_set_color(col);
	draw_set_alpha(alpha);
	if(draw_inner_part){draw_ngon_r(x_pos, y_pos, n, r2 , orientation, col, alpha,outline);}
	
	for (i = 0; i < n; i++){
		var c1x = lengthdir_x(r2,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c1y = lengthdir_y(r2,-90 + tri_angle/2 -orientation + i * tri_angle);
		
		var c2x = lengthdir_x(r2,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		var c2y = lengthdir_y(r2,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		
		var tip_x = lengthdir_x(r1,-90 + tri_angle/2 -orientation + (i+0.5) * tri_angle - tip_angle);
		var tip_y = lengthdir_y(r1,-90 + tri_angle/2 -orientation + (i+0.5) * tri_angle - tip_angle);
		
		draw_triangle(x_pos + tip_x,y_pos + tip_y,x_pos + c1x,y_pos + c1y,x_pos + c2x,y_pos + c2y,outline);
	}
}

function draw_triangle_by_base(x_pos, y_pos, h, w, orientation,col, alpha, outline){
	var b1x = lengthdir_x(w/2, -orientation) + x_pos;
	var b1y	= lengthdir_y(w/2, -orientation) + y_pos;
	var b2x = lengthdir_x(w/2, -orientation + 180) + x_pos;
	var b2y = lengthdir_y(w/2, -orientation + 180) + y_pos;
	var tx = lengthdir_y(h, -orientation) + x_pos;
	var ty = -lengthdir_x(h, -orientation ) + y_pos;
	
	draw_set_color(col);
	draw_set_alpha(alpha);
	draw_triangle(b1x,b1y ,b2x,b2y ,tx,ty ,outline);
	draw_circle(x_pos,y_pos,3,true)
}


//current
function draw_ngon_r_outline(x_pos, y_pos, n, r, orientation, col, outline_width){
	
	//simple input check
	n = abs(round(n));
	n = clamp(n, 3, 64);
	
	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	r = abs(r);
	//
	var tri_angle = 360 / n;
	
	draw_set_color(col);
	
	
	for (i = 0; i < n; i++){
		var c1x = lengthdir_x(r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c1y = lengthdir_y(r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c2x = lengthdir_x(r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		var c2y = lengthdir_y(r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		
		draw_circle(c1x + x_pos,c1y + y_pos, outline_width/2, false);
		draw_line_width(c1x + x_pos,c1y + y_pos,c2x + x_pos,c2y + y_pos,outline_width);
	}
}

function draw_ngon_h_outline(x_pos, y_pos, n, h, orientation, col, outline_width){
		//simple input check
	n = abs(round(n));
	n = clamp(n, 3, 64);

	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	h = abs(h);
	//
	var tri_angle = 360 / n;
	
	var temp_r = h / dcos(tri_angle/2)
	
	draw_set_color(col);
	
	
	for (i = 0; i < n; i++){
		var c1x = lengthdir_x(temp_r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c1y = lengthdir_y(temp_r,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c2x = lengthdir_x(temp_r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		var c2y = lengthdir_y(temp_r,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		
		draw_circle(c1x + x_pos,c1y + y_pos, outline_width/2, false);
		draw_line_width(c1x + x_pos,c1y + y_pos,c2x + x_pos,c2y + y_pos,outline_width);
	}
}

function draw_nstar_outline(x_pos, y_pos, n, r1, r2, tip_angle, orientation, col, outline_width){
		//simple input check
	n = abs(round(n));
	n = clamp(n, 3, 64);
	outline_width = round(outline_width);
	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	r1 = abs(r1);
	r2 = abs(r2);
	
	if (r2 > r1){
		var r3 = r1;
		r1 = r2;
		r2 = r3;
	}
	
	var max_tip_angle = darccos(r2/r1);
	tip_angle = clamp(tip_angle, -max_tip_angle, max_tip_angle);
	//
	var tri_angle = 360 / n;
	
	draw_set_color(col);
	
	for (i = 0; i < n; i++){
		var c1x = lengthdir_x(r2,-90 + tri_angle/2 -orientation + i * tri_angle);
		var c1y = lengthdir_y(r2,-90 + tri_angle/2 -orientation + i * tri_angle);
		
		var c2x = lengthdir_x(r2,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		var c2y = lengthdir_y(r2,-90 + tri_angle/2 -orientation + (i+1) * tri_angle);
		
		var tip_x = lengthdir_x(r1,-90 + tri_angle/2 -orientation + (i+0.5) * tri_angle - tip_angle);
		var tip_y = lengthdir_y(r1,-90 + tri_angle/2 -orientation + (i+0.5) * tri_angle - tip_angle);
		
		draw_line_width(c1x + x_pos, c1y + y_pos, tip_x + x_pos, tip_y + y_pos, outline_width);
		draw_line_width(c2x + x_pos, c2y + y_pos, tip_x + x_pos, tip_y + y_pos, outline_width);
		
		draw_circle(c1x + x_pos, c1y + y_pos, outline_width/2, false);
		draw_circle(tip_x + x_pos, tip_y + y_pos, outline_width/2, false);
		
	}
}

//function draw_gravity_border

function draw_gravity_border(x_pos, y_pos, n, r, res, orientation, col, outline_width){
	n = round(n);
	
	res = round(res)
	
	if( abs(orientation) > 360/n){
		orientation = orientation - sign(orientation)*360/n;
	}
	
	
	var funcres = res div (2*n);
	var angle_sec = 360 / (2 * n);
	
	draw_set_color(col);
	
	var i = 0;
	for (i = 0; i < n; i++){
		
	var p1x = lengthdir_x(r, -orientation + 2*i*angle_sec);
	var p1y = lengthdir_y(r, -orientation + 2*i*angle_sec);
	
	var p2x = lengthdir_x(r, -orientation + (2*i+1)*angle_sec);
	var p2y = lengthdir_y(r, -orientation + (2*i+1)*angle_sec);
	
	draw_line_width(p1x + x_pos, p1y + y_pos, p2x + x_pos, p2y + y_pos, outline_width);
	
	}
	
}

//function draw UFO


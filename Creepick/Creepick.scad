XY_scale = 0.13;
Z_height = 5;

difference() {

import(file = "guitar-pick-1709.stl", convexity = 12);

translate([(-7.3/0.15)*XY_scale,(-4/0.15)*XY_scale,0])
	rotate([0,0,0])
		scale(XY_scale)
			linear_extrude (height=Z_height/XY_scale, convexity=2, center=true) import (file="creeper_face.dxf");

%cube([20,20,10]);//For size reference

translate([-10,-28,0.8])
	cube([20,20,10]);

}
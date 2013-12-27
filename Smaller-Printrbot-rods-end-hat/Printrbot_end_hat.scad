
// Parameters
$fn=50;//geometric resolution
D=8+0.2;//rod diameter + margin
height=3;//cylinder part height
wall_thickness=1;
topClearance=4;



width=D/2+wall_thickness;
drill_lenght=height+width-topClearance;
R=D/2;

module end_hat()
{
  difference() {
        	union() {
		// Main
		translate([0, 0, 0])  cylinder(h = height, r1 = width, r2 = width, center = false);

		// Rounding
		translate([0, 0, height])  sphere(r = width);
		}
		
        //cylinder(h = 2*drill_lenght, r1 = R, r2 = R, center = true);

		union() {
		// Main
		translate([0, 0, 0])  cylinder(h = height*2, r1 = R, r2 = R, center = true);

		// Rounding
		translate([0, 0, height])  sphere(r = R);
		}

		translate([0,0,-20])
			cube([40,40,40],center=true);
  }
}

end_hat();

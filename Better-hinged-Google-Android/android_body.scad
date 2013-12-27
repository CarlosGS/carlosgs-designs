$fn=20;

module android_body() 
{
	difference() {

		import(file = "android_body.stl", convexity = 12);

		cylinder(r=3.4/2,h=20,center=true);

		rotate([0,90,0])
			translate([-7,0,20])
				cylinder(r=3.4/2,h=10);
		
		rotate([0,-90,0])
			translate([+7,0,20])
				cylinder(r=3.4/2,h=10);
	}
}

android_body();

$fn=20;

module android_arm() 
{
	difference() {
		import_stl("android_body_arm.stl");

		translate([0,9,3.6]) {
			cube([3,5,5],true);
			cylinder(r=3.4/2,h=20,center=true);
		}
	}
}

android_arm();
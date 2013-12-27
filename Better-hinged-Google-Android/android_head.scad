$fn=20;

module androidhead() 
{
	difference() {

		import_stl("android_head.stl");

		cylinder(r=3.4/2,h=10);
	}
}

androidhead();

module chop() {
	//translate([ -14, 0, 0 ])
	import(file = "horsehead.STL", convexity = 12);
}

module cuerno() {
	rotate ([97.3,45,250]) translate ([-2.55,2.5,16]) cylinder (r1=3, r2=1, h=15,$fn=4, center=false);
}

union() {
	chop();
	cuerno();
}


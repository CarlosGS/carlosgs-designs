// Vector-9000 - fast line follower robot (version 1.0)
// by Carlosgs (http://carlosgs.es) and Víctor Uceda
// CC-BY-SA license (http://creativecommons.org/licenses/by-sa/3.0/)
// Check http://www.thingiverse.com/thing:65012 for more information

resolucion_taladros = 40;
diametro_taladros = 3.5;

anchoLDR = 6;
altoLDR = 5;

alturaPieza = 12;

intersection() {
difference() {

//cylinder(r=25/2,h=alturaPieza,$fn=50);
translate([0,0,alturaPieza/2])
  roundedRect2D([25,25,alturaPieza], 9);

//cylinder(r=8/2,h=200,center=true,$fn=resolucion_taladros);
cube([anchoLDR,anchoLDR,100],center=true);

for (i = [0:2])
  rotate([0,0,i*360/3+90]) translate([8,0,0])
	cylinder(r=diametro_taladros/2,h=10,center=true,$fn=resolucion_taladros);

translate([0,0,alturaPieza])
  cube([13.5,13.5,4*2],center=true);

translate([0,0,2+altoLDR/2]) {
  cube([anchoLDR,100,altoLDR],center=true);
  cube([100,anchoLDR,altoLDR],center=true);
}


}

sphere(r=15,$fn=50);

}//intersection

// http://www.thingiverse.com/thing:9347
module roundedRect2D(size, radius)
{
$fn=20;
x = size[0]-radius*2;
y = size[1]-radius*2;
z = size[2];

minkowski()
{
cube(size=[x,y,z],center=true);
cylinder(r=radius,h=0.00001);
}
}


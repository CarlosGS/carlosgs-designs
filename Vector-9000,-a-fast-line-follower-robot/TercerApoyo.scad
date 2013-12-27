// Vector-9000 - fast line follower robot (version 1.0)
// by Carlosgs (http://carlosgs.es) and Víctor Uceda
// CC-BY-SA license (http://creativecommons.org/licenses/by-sa/3.0/)
// Check http://www.thingiverse.com/thing:65012 for more information

difference() {
union() {
hull() {
  roundedRect2D([18-1,13-1,0.0001], 2);
  translate([0,0,0.8]) roundedRect2D([18,13,0.0001], 2);
}
translate([5,0,0.8+1.5/2]) roundedRect2D([18/3,13*0.9,1.5], 2);
}
translate([-7,0,0.8+1.5/2]) {
translate([0,2,0]) cylinder(r=2/2,h=100,center=true,$fn=20);
translate([0,-2,0]) cylinder(r=2/2,h=100,center=true,$fn=20);
}
}
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


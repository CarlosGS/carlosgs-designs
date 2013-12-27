// Vector-9000 - fast line follower robot (version 1.0)
// by Carlosgs (http://carlosgs.es) and Víctor Uceda
// CC-BY-SA license (http://creativecommons.org/licenses/by-sa/3.0/)
// Check http://www.thingiverse.com/thing:65012 for more information


sizeX = 90;
sizeY = 29;
sizeZ = 0.4*4;

difference() {
  roundedRect2D([50,40,0.8], 1);
  translate([0,10,0])
    roundedRect2D([26,26,20], 9);
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


// Vector-9000 - fast line follower robot (version 1.0)
// by Carlosgs (http://carlosgs.es) and Víctor Uceda
// CC-BY-SA license (http://creativecommons.org/licenses/by-sa/3.0/)
// Check http://www.thingiverse.com/thing:65012 for more information

sizeX = 90;
sizeY = 29;
sizeZ = 0.4*4;

difference() {
  translate([sizeX/2,sizeY/2,sizeZ/2])
    scale([0.95,0.85,1]) {
      difference() {
        roundedRect2D([sizeX,sizeY,sizeZ], 5);
        translate([0,0,0.8]) roundedRect2D([sizeX-2,sizeY-2,sizeZ], 5);
      }
    }
  translate([26,9,-1])
    cube([31,5,10*sizeZ]);
  translate([26,9,-1])
    scale([1,-1,1])
      cube([5,10,10*sizeZ]);
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


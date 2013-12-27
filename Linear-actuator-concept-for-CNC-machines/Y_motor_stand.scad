use <obiscad/bcube.scad>
use <build_plate.scad>

//for display only, doesn't contribute to final object
build_plate(3,200,200);

motor_width = 43;
motor_length = 49; // not used
motor_screw_distance = 31.3;
motor_center_diameter = 23;

motor_screw_diameter = 3.5;
motor_screw_head_diameter = 8;

bearing_diameter = 22.4;
M8_rod_diameter = 9;

axis_distance = 32;

wall_thickness = 5;
wall_height = motor_width;
wall_width = 66;

idler_width = 25;

module motor_stand() {
difference() {
  translate([wall_height/2,wall_width/2,wall_thickness/2])
    bcube([wall_height,wall_width,wall_thickness],cr=4,cres=10);

  // Position relative to motor shaft
  translate([wall_height - motor_width/2,motor_width/2,wall_thickness/2]) {
    // Hole for the motor shaft
    translate([0,-wall_width/2,0])
      cube([20,wall_width,10*wall_thickness],cr=4,cres=10,center=true);
    cylinder(r=motor_center_diameter/2,h=10*wall_thickness,center=true,$fn=40);

    // Screws for holding the motor
    for(i=[-1,1]) for(j=[-1,1])
    translate([i*motor_screw_distance/2,j*motor_screw_distance/2,0]) {
      cylinder(r=motor_screw_diameter/2,h=10*wall_thickness,center=true,$fn=40);
      cylinder(r=motor_screw_head_diameter/2,h=10*wall_thickness,center=false,$fn=40);
    }

    // Bearing holes
    translate([0,axis_distance,0]) {
      cylinder(r=M8_rod_diameter/2,h=10*wall_thickness,center=true,$fn=40);
      cylinder(r=bearing_diameter/2,h=10*wall_thickness,center=false,$fn=60);

      translate([-motor_screw_distance/2,0,0]) cylinder(r=motor_screw_diameter/2,h=10*wall_thickness,center=true,$fn=40);
      translate([motor_screw_distance/2,0,0]) cylinder(r=motor_screw_diameter/2,h=10*wall_thickness,center=true,$fn=40);
    }

  }
}
}

module bearing_idler() {
difference() {
  translate([wall_height/2,idler_width/2,wall_thickness/2])
    bcube([wall_height,idler_width,wall_thickness],cr=4,cres=10);

    // Bearing holes
    translate([wall_height/2,idler_width/2,wall_thickness/2]) {
      cylinder(r=M8_rod_diameter/2,h=10*wall_thickness,center=true,$fn=40);
      cylinder(r=bearing_diameter/2,h=10*wall_thickness,center=false,$fn=60);

      translate([-motor_screw_distance/2,0,0]) cylinder(r=motor_screw_diameter/2,h=10*wall_thickness,center=true,$fn=40);
      translate([motor_screw_distance/2,0,0]) cylinder(r=motor_screw_diameter/2,h=10*wall_thickness,center=true,$fn=40);
    }
}
}

bearing_idler();
//motor_stand();
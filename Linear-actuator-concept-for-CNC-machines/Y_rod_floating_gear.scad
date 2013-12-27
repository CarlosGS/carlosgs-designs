// Basado en http://www.thingiverse.com/thing:12789

include <MCAD/teardrop.scad>
include <MCAD/involute_gears.scad>

M8_nut_diameter = 15.3;
nut_separation = 3;

/* Herringbone gear module, adapted from MCAD/involute_gears */
module herringbone_gear( teeth=12, circles=0, shaft=5 ) {
  twist=200;
  height=10;
  pressure_angle=30;

  gear(
    number_of_teeth=teeth,
    circular_pitch=320,
		pressure_angle=pressure_angle,
		clearance = 0.2,
		gear_thickness = height/2,
		rim_thickness = height/2,
		rim_width = 1,
		hub_thickness = height/2,
		hub_diameter=1,
		bore_diameter=shaft,
		circles=circles,
		twist=twist/teeth
  );

	mirror( [0,0,1] )
	  gear(
      number_of_teeth=teeth,
		  circular_pitch=320,
		  pressure_angle=pressure_angle,
		  clearance = 0.2,
		  gear_thickness = height/2,
		  rim_thickness = height/2,
		  rim_width = 1,
		  hub_thickness = height/2,
		  hub_diameter=1,
		  bore_diameter=shaft,
		  circles=circles,
		  twist=twist/teeth
    );
}

// Extruder Gear
difference() {
  union() {
    //gear
    herringbone_gear( teeth=12, circles=0, shaft=0, $fn=40 );

    //M8 hobbed bolt head fit washer
    /*difference() {
      translate( [0, 0, 5] ) cylinder( r=8, h=3, $fn=60 );
      translate( [0, 0, 5-0.01] ) cylinder( r=M8_nut_diameter/2, h=7, $fn=6 );
    }*/
    /*rotate([180,0,0]) difference() {
      translate( [0, 0, 5] ) cylinder( r=13, h=3, $fn=60 );
      translate( [0, 0, 5+0.4] ) cylinder( r=M8_nut_diameter/2, h=7, $fn=6 );
    }*/
  }

  translate( [0, 0, (nut_separation/2)] ) cylinder( r=M8_nut_diameter/2, h=7, $fn=6 );
  translate( [0, 0, -(nut_separation/2)-7] ) cylinder( r=M8_nut_diameter/2, h=7, $fn=6 );
  translate( [0, 0, -(nut_separation/2)+0.4] ) cylinder( r=8.5/2, h=10, $fn=60 );
}

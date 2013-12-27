// Vector-9000 - fast line follower robot (version 1.0)
// by Carlosgs (http://carlosgs.es) and Víctor Uceda
// CC-BY-SA license (http://creativecommons.org/licenses/by-sa/3.0/)
// Check http://www.thingiverse.com/thing:65012 for more information


longitudPlaca=130;
anchoPlaca=longitudPlaca/1.5;
grosorPlaca=5;
separacionTornilloMotores=16.8;
offsetRueda=5;
diametroRueda=42;
drill_M3=3;

resolucion_taladros=20;

taladro_arduino=3.5;

diametroBolaLoca=28.7;
alturaBolaLoca=26;

corner_radius = 3/2;

margen_motores = 5-corner_radius;
margenY_motores = 5;

margenPCBsensores=1;

grosorPCB=1.56;
alturaSensorCNY70=5.9;
grosorPegamento=1;

anchoSoporteMotores=15;

longitudBateria = 55;

ancho_placaCNY70 = 60;

separacion_tornillos_frontal = 26;

longitud_zona_motores = anchoSoporteMotores+2*margenY_motores;

// From MiniSkyBot v2
module arduinoDrills(taladro_arduino=3.5, center=true, h = grosorPlaca+10) {
    translate([-51/2,48.4/2,0]) {
	//-- Arduino drill 1 (top-left)
    cylinder(r=taladro_arduino/2, h=h,center=center, $fn=resolucion_taladros);

    //-- Arduino drill 2 (bottom-left)
    translate([-1.1,-48.4,0])
    cylinder(r=taladro_arduino/2, h=h,center=center, $fn=resolucion_taladros);

    //-- Arduino drill 3 (top-right)
    translate([51,-15.3,0])
    cylinder(r=taladro_arduino/2, h=h,center=center, $fn=resolucion_taladros);

    //-- Arduino drill 3 (top-right)
    translate([51,-15.3-28,0])
    cylinder(r=taladro_arduino/2, h=h,center=center, $fn=resolucion_taladros);
	}
}

module placaBaseSinBola(nomotors=0) {
	minkowski() {
   union() {
	  hull() {
		cube([anchoPlaca,longitud_zona_motores,grosorPlaca/2]);
		translate([anchoPlaca/2,longitudPlaca-anchoPlaca/2,grosorPlaca/4])
			//cylinder(r=anchoPlaca/3, h=grosorPlaca, $fn=150);
         cube([ancho_placaCNY70,longitudPlaca-anchoPlaca/2,grosorPlaca/2],center=true);
	  }
     if(nomotors) {//hueco para la batería en la carcasa
       translate([anchoPlaca/4,-10,0])
         cube([anchoPlaca/2,longitud_zona_motores,grosorPlaca/2+10]);
     }
     if(nomotors==0) {
       translate([anchoPlaca/2,longitud_zona_motores/2,grosorPlaca/2]) {
         difference() {
           cube([anchoPlaca+15,20,grosorPlaca],center=true);
           translate([0,0,grosorPlaca/4]) cube([anchoPlaca-10,20,grosorPlaca/2],center=true);
         }
       }
     }
   }
   cylinder(r=corner_radius, h=grosorPlaca/2, $fn=10);
   }
}

module placaBase() {
	difference() {
		placaBaseSinBola();

		//Hueco en chasis
			translate([anchoPlaca/2,5,0])
				cube([longitudBateria,18,100],center=true);
			translate([anchoPlaca/2,longitud_zona_motores+25,-5])
				cube([anchoPlaca/1.5,40,100],center=true);
hull(){
			translate([anchoPlaca/2-ancho_placaCNY70/2,longitud_zona_motores+57,-5])
				cube([ancho_placaCNY70,0.0001,100]);
			translate([anchoPlaca/2-ancho_placaCNY70/3-10/2,longitud_zona_motores+75+20,-5])
				cube([ancho_placaCNY70/1.5+10,0.0001,100]);
}
	}
}

module taladrosMotores(margenX,margenY) {
	//Motor derecho
margenX=-5.5;
margenY=4;
	translate([margenX,margenY,-5])
			cylinder(r=drill_M3/2, h=100, $fn=resolucion_taladros);
	translate([margenX,margenY+separacionTornilloMotores,-5])
			cylinder(r=drill_M3/2, h=100, $fn=resolucion_taladros);

	//Motor izquierdo
	translate([anchoPlaca-margenX,margenY,-5])
			cylinder(r=drill_M3/2, h=100, $fn=resolucion_taladros);
	translate([anchoPlaca-margenX,margenY+separacionTornilloMotores,-5])
			cylinder(r=drill_M3/2, h=100, $fn=resolucion_taladros);
}

module taladrosSoporteSensores() {
  translate([anchoPlaca/2,longitudPlaca-4,0]) {
    translate([-separacion_tornillos_frontal/2,0,0])
      cylinder(r=taladro_arduino/2, h=grosorPlaca+10,center=true, $fn=resolucion_taladros);
    translate([separacion_tornillos_frontal/2,0,0])
      cylinder(r=taladro_arduino/2, h=grosorPlaca+10,center=true, $fn=resolucion_taladros);
  }
}

module taladrosBateria() {
  translate([anchoPlaca/2,3,0]) {
    translate([-longitudBateria/2-4,0,0])
      cylinder(r=taladro_arduino/2, h=grosorPlaca+10,center=true, $fn=resolucion_taladros);
    translate([longitudBateria/2+4,0,0])
      cylinder(r=taladro_arduino/2, h=grosorPlaca+10,center=true, $fn=resolucion_taladros);
  }
}

module taladrosCarcasa(diam=3) {
  translate([anchoPlaca/2,0,0]) {
    // Zona trasera
    translate([-38,-10,grosorPlaca/2])
      rotate([90,0,0])
        cylinder(r=diam/2, h=grosorPlaca*2+20,center=true, $fn=resolucion_taladros);
    translate([38,-10,grosorPlaca/2])
      rotate([90,0,0])
        cylinder(r=diam/2, h=grosorPlaca*2+20,center=true, $fn=resolucion_taladros);

    // Zona frontal
    translate([-25,longitudPlaca,grosorPlaca/2])
      rotate([90,0,0])
        cylinder(r=diam/2, h=grosorPlaca*2,center=true, $fn=resolucion_taladros);
    translate([25,longitudPlaca,grosorPlaca/2])
      rotate([90,0,0])
        cylinder(r=diam/2, h=grosorPlaca*2,center=true, $fn=resolucion_taladros);

    // Zona lateral-frontal
    translate([-ancho_placaCNY70/2,longitudPlaca-5,grosorPlaca/2])
      rotate([0,90,0])
        cylinder(r=diam/2, h=grosorPlaca*2,center=true, $fn=resolucion_taladros);
    translate([ancho_placaCNY70/2,longitudPlaca-5,grosorPlaca/2])
      rotate([0,-90,0])
        cylinder(r=diam/2, h=grosorPlaca*2,center=true, $fn=resolucion_taladros);
  }
}

module CRM_BOT_chassis_placa() {
	difference() {
		placaBase();
		translate([anchoPlaca/2,50,0])
			rotate([0,0,270]) {
				arduinoDrills();
               translate([0,0,grosorPlaca])
                 cube([65,65,grosorPlaca],center=true);
         }
		taladrosMotores(margen_motores, margenY_motores);
      taladrosSoporteSensores();
      taladrosBateria();
      taladrosCarcasa(2.5);
	}
}

module CRM_BOT_chassis() {
	union() {
		CRM_BOT_chassis_placa();
		translate([anchoPlaca/2,50,0])
			rotate([0,0,270]) {
           difference() {
             arduinoDrills(7,center=false,h=5);
             arduinoDrills();
           }
         }
	}
}

module cover_solid() {
  hull() {
    placaBaseSinBola(nomotors=1);
    translate([anchoPlaca/2,longitudPlaca/3-40/2,30+10])
        cube([50,40,0.0001],center=true);
  }
}

module cover_solid_motors() {
  hull() {
    	minkowski() {
	  cube([anchoPlaca,longitud_zona_motores,grosorPlaca/2]);
     cylinder(r=corner_radius, h=grosorPlaca/2, $fn=10);
   }
    translate([anchoPlaca/2,longitudPlaca/3-40/2,30])
        cube([50,40,0.0001],center=true);
  }
}

module cover(thickness = 2) {
//rotate([180+21.4,0,0])
	difference() {
	  minkowski() {
	    cover_solid();
	    sphere(r=thickness, $fn=5);
	    //cube([1,1,1],center=true);
	  }
	  translate([0,0,-0.05]) cover_solid();
	  translate([0,0,-10]) cube([1000,1000,20],center=true);
     taladrosCarcasa(diam=3);
	}
}

module cover_front() {
	//translate([0,0,grosorPlaca])
	difference() {
	cover();
		difference() {
		  minkowski() {
		    cover_solid_motors();
		    sphere(r=2, $fn=5);
		    //cube([1,1,1],center=true);
		  }
		  translate([0,0,-0.05]) cover_solid_motors();
		  translate([0,0,-10]) cube([1000,1000,20],center=true);
		}
	}
}

module cover_back() {
	difference() {
		difference() {
		  minkowski() {
		    cover_solid_motors();
		    sphere(r=2, $fn=5);
		    //cube([1,1,1],center=true);
		  }
		  translate([0,0,-0.05]) cover_solid_motors();
		  translate([0,0,-10]) cube([1000,1000,20],center=true);
		}
	cover();
	}
}

module robotFullBase(quitarHuecoFrontal=0) {
	distancia_adicional = 10;
	difference() {
	union() {
	  CRM_BOT_chassis();
	  translate([anchoPlaca/2,longitudPlaca,0]) {
	    translate([0,distancia_adicional,0])
	      import("LineSensorV2_new.stl");
	    translate([0,distancia_adicional/2+2,grosorPlaca/2])
	      cube([30,distancia_adicional+2,grosorPlaca],center=true);
	    // Ensanchar sujección frontal para el hueco de la carcasa
	    if(quitarHuecoFrontal) translate([0,distancia_adicional/2+2,grosorPlaca/2])
	      cube([30+5,distancia_adicional+2,grosorPlaca],center=true);
	  }
	}
	
	if(!quitarHuecoFrontal) translate([anchoPlaca/2,longitudPlaca,0])
	  translate([0,distancia_adicional/2-2,0]) {
	    cube([15,distancia_adicional+10,2*2],center=true);
	    translate([0,-6,2+0.4]) cylinder(r=3.5/2, h=grosorPlaca*2, $fn=resolucion_taladros);
	  }
	
	}
}

module robotCover() {
	difference() {
	rotate([180+21.65,0])
	difference() {
	cover();
	robotFullBase(quitarHuecoFrontal=1);
	translate([anchoPlaca/2,longitud_zona_motores/2-1,grosorPlaca/2])
		rotate([0,90,0])
	     roundedRect2D([longitud_zona_motores+10,longitud_zona_motores,300], 8);
	translate([anchoPlaca/2,longitud_zona_motores/2-3,grosorPlaca/2])
		rotate([0,90,0])
	     roundedRect2D([longitud_zona_motores-10,longitud_zona_motores,300], 8);
	
	// Recortes de las esquinas de la zona de los motores
	translate([-5,0,0])
	  cube([14,20,40],center=true);
	translate([anchoPlaca+5,0,0])
	  cube([14,20,40],center=true);
	
	translate([anchoPlaca/2,longitud_zona_motores/2,0]) {
	cylinder(r=8/2,h=300,center=true,$fn=resolucion_taladros);
	for (i = [0:2])
	  rotate([0,0,i*360/3+90]) translate([8,0,0])
		cylinder(r=3.5/2,h=300,center=true,$fn=resolucion_taladros);
	}
	}
	
	translate([anchoPlaca/2,-70,0])
	  //cylinder(r=50/2,h=300,center=true);
	  roundedRect2D([40,50,300], 5);
	}
}




robotFullBase();
//robotCover();
























// http://www.thingiverse.com/thing:9347
module roundedRect2D(size, radius)
{
$fn=8;
x = size[0]-radius*2;
y = size[1]-radius*2;
z = size[2];

minkowski()
{
cube(size=[x,y,z],center=true);
cylinder(r=radius,h=0.00001);
}
}



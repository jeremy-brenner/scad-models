pr=6.5;
ph=535;
spd=80;
sph=400;
lph=210;

td=15.950;

renderarm=true;

$fn=32;


startA=10;
endA=73;
range=endA-startA;

// p=sin(360*$t)/2+0.5;

p=0.5;
a=range*p+startA;



tr=15;

zoffset = cos(a)*ph-sph;

// if(renderarm) {
// translate([0,0,-zoffset/2]) {
//   armature();
//   mirror([1,0,0]) armature();
// }
// }

translate([0,-30,-70]) armRig();

module armRig() {
  ah=270;
  sl=ah-80;
  mirror([0,1,0]) difference() {
    union() {
      hull() {
        rotate([90,0,0]) cylinder(r=tr,h=8);
        translate([0,0,ah]) rotate([90,0,0]) cylinder(r=tr,h=8);
      }
      hull() {
        rotate([90,0,0]) cylinder(r=7,h=12+td);
        translate([0,0,sl]) rotate([90,0,0]) cylinder(r=7,h=12+td);
      }
      translate([0,0,ah]) rotate([90,0,0]) cylinder(r=8,h=12);

      translate([0,-4,170]) rotate([0,-90,0]) rotate([90,0,0]) {
        difference() {
          intersection () {
            hull() {
              armBarPath(4);
              mirror([0,1,0]) armBarPath(4);  
            }
            translate([50,-50,-10]) cube([40,100,20]);
          }
          armBarPath(1.7);
          mirror([0,1,0]) armBarPath(1.7);
      }
      }
    }
      translate([0,-20,-50]) cylinder(r=2.5,h=300);

    translate([0, -12-td+5,0]) hull() {
      rotate([90,0,0]) cylinder(r=5,h=5.1);
      translate([0,0,sl]) rotate([90,0,0]) cylinder(r=5,h=5.6);
    }

    translate([0,0.1,0]) hull() {
      rotate([90,0,0]) cylinder(r=5,h=5.1);
      translate([0,0,sl]) rotate([90,0,0]) cylinder(r=5,h=5.6);
    }

    hull() {
      translate([0,1,0]) rotate([90,0,0]) cylinder(r=2.5,h=32);
      translate([0,1,sl]) rotate([90,0,0]) cylinder(r=2.5,h=32);
    }

    translate([0,1,ah]) rotate([90,0,0]) cylinder(r=2,h=70);
    translate([0,0.1,ah]) rotate([90,0,0]) cylinder(r=5,h=5.6);

  }
}





module armature() {
  translate([10,0,0]) rotate([0,a,0]) {
    pole();
    translate([0,0,ph]) rotate([0,180-a*2,0]) {
      pole();
      translate([0,0,spd]) rotate([0,a*2,0]) {
         pole(sph);
         translate([0,-13,sph]) rotate([0,180-a*2,0]) pole(lph);
      }
    }
  }
}

module pole(h=ph) {
  cylinder(r=pr,h=h);
}

module armBarPath(r) {
  hull() {
    translate([0,20,0]) sphere(r=r);
    translate([90,45,0]) sphere(r=r);
  }
}
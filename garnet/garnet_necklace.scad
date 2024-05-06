$fn=128;


scale(1.666) main();

module crystal() {
  color([1,1,1,0.5]) hull() {
    cube([50,21,2.5],center=true);
    cube([21,50,2.5],center=true);
    cube([9.2,9.2,22],center=true);
  }
}

module crossBit() {
  translate([-1,-2,-0.5]) linear_extrude( height = 1 ) polygon( points = [ [0,0],[2,0],[1.5,1], [0.5,1] ] );
}

module cross() {
  scale([2,2,1.5]) union() {
    crossBit();
    rotate([0,0,90]) crossBit();
    rotate([0,0,180]) crossBit();
    rotate([0,0,270]) crossBit();
    cube([1,2,1], center = true);
    cube([2,1,1], center = true);
  }
}

module diamondBump() {
  union() {
    diamond(1.25);
    translate([-1.25,-1.25,-0.5]) cube([2.5,2.5,0.5]);
  }
}

module main() {


difference() {
   union() {
    centerHump();
    render() {
      difference() {
        cylinder(r=15, h=10);
        translate([0,0,-0.1]) cylinder(r=13.5, h=10.2);
        cutouts();
      }
    }
  
    difference() {
      cylinder(r=15, h=1);
      cylinder(r=12, h=1);
    }
    translate([14.125,0,8]) rotate([0,90,0]) cross();
    bumps();
     outerRing();
   }
     translate([0,11,0]) notch();
  translate([0,-11,0]) notch();
}


}

module topRing() {
  difference() {
    translate([0,0,3.5]) rotate([0,90,0]) torus(r2=1,r1=14);
   translate([0,0,-100]) cylinder(r=100,h=100);
  }
}
module notch() {
  sphere(r=3);
}

module outerRing() {
  translate([0,0,0.75]) torus(r2=0.75, r1=15);
}

module bump() {
  translate([0,0,3.25]) rotate([0,90,0]) rotate([0,0,45]) diamondBump();
}

module bumps() {
  for( i = [0:8]) {
    rotate([0,0,i*360/8]) translate([15,0,0]) bump();
  }
}

module topBit() {  
  translate([0,0,15.5]) cylinder(r=3, h=3);
  translate([0,0,18.5]) cylinder(r=2.5, h=0.5);
  translate([0,0,19]) cylinder(r=3,h=3);
}

module humpRings() {
  for( i = [0:4] ) {
    translate([0,0,4]) rotate([i*360/8+360/16,90,0]) humpRing();
  }
}

module cutouts() {
  for( i = [0:8] ) {
    rotate([0,0,i*360/8+360/16]) translate([12,0,0]) cutoutf();
  }
}

module humpRing() {
  torus(r1=12,r2=0.5);
}

module centerHump() {
  difference() {
    union() {
      hump(12);
      humpRings();
      topBit();
      topRing();
    }
    hump(11);
    cylinder(r=2, h=30);
    translate([0,0,-99.998]) cylinder(r=13,h=100);
  }

}


module nub() {
  translate([0,-9,0]) scale([1,1.63,1.63]) difference() {
    cube([2,11,5.5]);
    translate([-0.1,0,-4.5]) cutoutf();
    translate([-0.1,11,-4.5]) cutoutf();
  }
}

module cutoutf() {
    union() {
        translate([0,3.25,6]) rotate([0,90,0]) cylinder(r=1.5, h=3); 
        translate([0,-3.25,6]) rotate([0,90,0]) cylinder(r=1.5, h=3); 
        translate([0,2.95,7]) rotate([30,0,0]) translate([0,-1.25,-1.25]) cube([3,2.5,2.5]);
        translate([0,-2.95,7]) rotate([-30,0,0]) translate([0,-1.25,-1.25]) cube([3,2.5,2.5]);
        translate([0,3.5,10]) rotate([-45,0,0]) translate([0,-1.25,-1.25]) cube([3,2.5,2.5]);
        translate([0,-3.5,10]) rotate([45,0,0]) translate([0,-1.25,-1.25]) cube([3,2.5,2.5]);

        translate([0,-3.25,5]) cube([3,6.5,8]);
        intersection() {
          translate([0,0,22.17]) rotate([0,90,0]) cylinder(r=18, h=3);  
          translate([0,-3.75,0]) cube([12,7.5,8]);
        }
    }
}

module diamond(size) {
  polyhedron(     
    points = [ 
        [size,size,0],
        [size,-size,0],
        [-size,-size,0],
        [-size,size,0], 
        [0,0,size] 
      ],                         
    faces = [ 
        [0,1,4],
        [1,2,4],
        [2,3,4],
        [3,0,4],
        [1,0,3],
        [2,1,3] 
      ]                 
  );
}



module hump(r) {
  union() {
    translate([0,0,4]) sphere(r=r); 
    cylinder(r=r, h=4);
  }
}

module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}
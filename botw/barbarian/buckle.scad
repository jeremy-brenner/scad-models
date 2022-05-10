$fn=32;

buckleL=80;
buckleW=140;
buckleT=4;
decoW=11;
decoTMult=0.4;

scaleFactor=0.625;

module buckle() {
  scale(scaleFactor) difference() {
    color("gray") translate([decoW/2,decoW/2,0]) minkowski() {
      cylinder(r=decoW/2,h=buckleT/2);
      cube([buckleL-decoW,buckleW-decoW,buckleT/2]);
    }
    translate([decoW,buckleW/2,-1]) cylinder(r=10-decoW*0.7/2,h=10);
    translate([0,0,buckleT-1]) linear_extrude(height = 1.1) offset(r = 0.5) projection(cut = false) deco();
  }
  color("silver")   scale(scaleFactor)  {
    deco();
    translate([0,0,buckleT-1]) linear_extrude(height = 1) projection(cut = false) deco();
  }
}



module deco() {

difference() {
    translate([0,0,buckleT]) {
      translate([decoW/2,decoW/2,0]) decoRect(buckleL,buckleW,decoW);
      

      translate([decoW*1.6,decoW*2,0]) decoSide(buckleL-decoW*2.75,buckleW/7,decoW/2);

      translate([decoW*1.6+buckleL-decoW*3.2,buckleW-decoW*2,0]) rotate([0,0,180]) decoSide(buckleL-decoW*2.75,buckleW/7,decoW/2);

      translate([buckleL-decoW/2,buckleW/2,0]) scale([1,1,decoTMult/2]) rotate([0,-90,0]) cylinder(r=decoW,h=decoW);

      translate([buckleL/2,buckleW/2,0]) {
        difference() {
          decoCircle(22, decoW);
          translate([-buckleL/2.8,0,-1]) cylinder(r=10,h=20);
        }
        translate([-buckleL/2.8,0,0]) scale([1,1,1.45]) difference() {
          decoCircle(10, decoW*0.7);
          translate([-1006,-500,-1]) cube([1000,1000,1000]);
        }
      }
      

      translate([buckleL/2,buckleW/2,0]) scale([1,1,decoTMult]) sphere(r=8);
    }
    translate([decoW,buckleW/2,-1]) cylinder(r=10-decoW*0.7/2,h=10);
    translate([-200,-200,-100+buckleT]) cube([10000,10000,100]);
  }
}

module decoSide(l,w,dw) {
  tr=40;
  scale([1,1,decoTMult+0.2]) rotate([0,90,0]) {
    sphere(r=dw/2);
    cylinder(r=dw/2,h=l-dw);
    translate([0,0,l-dw]) sphere(r=dw/2);

    rotate([-90,0,0]) cylinder(r=dw/2,h=w-dw);
    translate([0,w-dw,0]) sphere(r=dw/2);
      
    translate([0,0,l-dw]) rotate([-90,0,0]) cylinder(r=dw/2,h=w-dw);
    translate([0,w-dw,l-dw]) sphere(r=dw/2);

    ctm=2.2;

    translate([-dw/2,0,0]) difference() {
      cube([dw,w-dw,l-dw]);
      translate([dw+0.5,(tr-dw*ctm)+(w),(l-dw)/2]) rotate([0,-90,0]) cylinder(r=tr,h=dw+1);
    }

    ca=56;
    translate([0,(tr-dw*ctm)+(w),(l-dw)/2]) rotate([0,90,0]) difference() {
      torus(tr,dw/2);
      rotate([0,0,ca]) translate([-500,0,-500]) cube([1000,1000,1000]);
      rotate([0,0,-ca]) translate([-500,0,-500]) cube([1000,1000,1000]);
    }
  }
}

module decoCircle(r,dw) {
  scale([1,1,decoTMult]) torus(r,dw/2);
}

module decoRect(l,w,dw) {
  scale([1,1,decoTMult]) rotate([0,90,0]) {
    sphere(r=dw/2);
    cylinder(r=dw/2,h=l-dw);
    translate([0,0,l-dw]) sphere(r=dw/2);
    
    translate([0,w-dw,0]) {
      sphere(r=dw/2);
      cylinder(r=dw/2,h=l-dw);
      translate([0,0,l-dw]) sphere(r=dw/2);
    }

    rotate([-90,0,0]) cylinder(r=dw/2,h=w-dw);
    translate([0,0,l-dw]) rotate([-90,0,0]) cylinder(r=dw/2,h=w-dw);
  }
}



module torus(r1,r2) {
  rotate_extrude(convexity = 10, $fn=$fn)
    translate([r1, 0, 0])
    circle(r = r2, $fn=$fn);
}


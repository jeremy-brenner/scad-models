$fn=64;

// use <./helix_extrude.scad>


screwR=3.5/2;
screwHeadR=6/2;

screwD=117;

pt=2;

pa=25;


// color("blue") cube([150,300,0.1]);

// translate([0,50,120]) rotate([0,90+pa,90]) pipeSectionWithConnectors(200,27);

// startPlate();
// startPipe();
//bend();

shield();

module shield() {
intersection() {
translate([0,-30,0]) cube([30,30,20]);
difference() {
  cylinder(r=27,h=30);
  translate([0,0,-0.1]) cylinder(r=25,h=30.2);
}
}
translate([25,0,0]) cube([2,30,20]);

}

module bend() {

difference() {

union() {
translate([0,-30,2.5]) rotate([0,90+pa,0]) translate([0,0,-30]) pipeSectionWithConnectors(50,27,false);
translate([30,0,2.5]) rotate([0,0,90]) rotate([0,90+pa,0]) pipeSectionWithConnectors(30,27,true,false);
}

translate([0,-400,-200]) cube([400,400,400]);

}


rotate([0,0,-90]) rotate_extrude(angle=90)
      translate([30,0,0]) rotate(-90) pipe2d(27);
}

module pipeSectionWithConnectors(sectionLen,r,topConnector=true,bottomConnector=true) {
  pipeSection(sectionLen,r);
  if(topConnector) {
    translate([0,0,sectionLen-2]) groove(1,r);
  }
  if(bottomConnector) {
    translate([0,0,-5]) difference() {
      pipeSection(10,r+2);
      translate([0,0,2]) groove(1.2,r);
    }
    translate([-2,r-2,-5]) cube([2,4,10]);
    mirror([0,1,0]) translate([-2,r-2,-5]) cube([2,4,10]);
  }
}

// translate([70,60,130]) rotate([-90-pa,0,0]) rotate([0,0,90]) pipeSection(200,27);

module startPlate() {
  translate([0,0,140]) rotate([0,-90,0]) screwPlate();
  translate([29,8,140]) rotate([0,90+pa,90]) startPipe();
}

module startPipe() {
    pipeSection(50,27);
    translate([0,0,50-2]) groove(1,27);

    difference() {
      intersection() {
        sphere(r=27);
        translate([0,-30,-30]) cube([30,60,30]);
      }
      sphere(r=25);
    }

    translate([0,25,0]) cube([8,4,20]);
  
}

module pipeSection(sectionLen,r) {
  difference() {
    intersection() {
      cylinder(r=r,h=sectionLen);
      translate([0,-30,0]) cube([60,60,sectionLen]);
    }
    translate([0,0,-1]) cylinder(r=r-pt,h=sectionLen+2);
  }
}

module pipe2d(r) {
  difference() {
    intersection() {
      circle(r=r);
      translate([0,-30]) square([60,60]);
    }
    circle(r=r-pt);
  }
}

module groove(r1,r2) {
  ga=175;
  gd=180-ga;

  rotate([0,0,-90+gd/2]) {  
    rotate_extrude(angle=ga)
      translate([r2,0,0])
      circle(r=r1);
    translate([r2,0,0]) sphere(r=r1);
    rotate([0,0,ga]) translate([r2,0,0]) sphere(r=r1);
  }
}

module screwPlate() {
  po=12;
  difference() {
    union() {
      linear_extrude(height=2) translate([-po,0]) minkowski() {
        square([screwD+po,50]);
        circle(r=4); 
      }
      translate([0,25,2]) {
        cylinder(r1=7.2/2,r2=6.2/2,h=1.2);
        translate([screwD,0,0]) cylinder(r1=7.2/2,r2=6.2/2,h=1.2);
      }
    }
    translate([screwHeadR+1,0,-1]) cube([screwD-screwHeadR*2-2,50,10]);

    translate([0,25,-3]) {
      screw();
      translate([screwD,0,0]) screw();
    }
  }
}

module screw() {
  translate([0,0,4.9]) cylinder(r=screwR,h=10);
  cylinder(r=screwHeadR,h=5);
}
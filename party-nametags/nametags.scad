$fn=128;

include <../mario-star/mario-star.scad>


// color("white") translate([29,-22,0]) rotate([0,0,-10]) cube([17,16,2.1]);


translate([-42,19,0]) scale(0.1) rotate([0,0,100]) {
  
  translate([0,0,20]) {
    // star(5,28,12,95,false);
   eye(7);
   mirror([0,1,0]) eye(7);
  }

  // linear_extrude(height=20) projection() star(5,28,12,95,false);
}

name="Danielle"; // [Danielle, Elizabeth, Violet, Julie, Corey, Amber, Debra, Emily, Jennie, Lauren, Erin, Cindy, Mandy, Zi, Maudie, Christine, Lily]
magnetDist=30;
fs=30;

// color("red") translate([-87/2,0,0]) cube([87,2,10]);
// front(name,fs);
// translate([0,-35,4]) mirror([0,0,1]) back();
// scale([0.75,0.75,1]) dogTag();
//heart();

module dogTag() {
    collarW=26;
    collarT=8;
    fs=38;
    s=1.4;
    scale([s,s,1]) {
      nametag("Spencer",fs);
      // color("white") translate([0,10,0]) difference() {
      //   cylinder(r=4,h=2);
      //   translate([0,0,-0.1]) cylinder(r=2,h=3.2);

      // }
      translate([10,10,0])  rotate([0,0,5]) heartExt();
      translate([-25,11,0])  rotate([0,0,-10]) heartExt();

      translate([-5,-12,0])  rotate([0,0,10]) heartExt();
      translate([46,-3,0])  rotate([0,0,-10]) heartExt();
    }
    ld=24;
    translate([ld,-1,0]) loop();
    translate([-ld,-1,0]) loop();

}

module loop() {
  color("white") translate([0,-18,0]) {
    translate([-2,34,0]) cube([8,2,3]);
    cube([4,36,3]);
    translate([-2,0,0]) cube([8,2,3]);

  }
      
}

module heartExt() {
 color("white") linear_extrude(height=4) scale(1.5) heart();
 color("pink") linear_extrude(height=5) scale(1) heart();
}

module heart() {
  translate([-1.42,1,0]) rotate(-135) {
    circle(r=2);
    translate([-2,2,0]) circle(r=2);
    translate([-2,0,0]) square([4,4]);
  }
}

module front(name,fs) {
  difference() {
    nametag(name,fs);
    translate([magnetDist/2,0,-0.1]) cylinder(r=3,h=3);
    translate([-magnetDist/2,0,-0.1]) cylinder(r=3,h=3);
  }
}

module back() {
  difference() {
    hull() {
      translate([magnetDist/2,0,0]) cylinder(r=5,h=4);
      translate([-magnetDist/2,0,0]) cylinder(r=5,h=4);  
    }
    translate([magnetDist/2,0,-0.1]) cylinder(r=3,h=3);
    translate([-magnetDist/2,0,-0.1]) cylinder(r=3,h=3); 
  }
  
}

module nametag(name,fs) {
 // color("blue") linear_extrude(height=3.99) fill() offset(3) text(name,size=fs,font="Kiss Boom",halign="center",valign="center");
  // color("white") linear_extrude(height=4) fill() offset(2) text(name,size=fs,font="Kiss Boom",halign="center",valign="center");
  color("lightblue") translate([0,0,4]) linear_extrude(height=2) text(name,size=fs,font="Kiss Boom",halign="center",valign="center");
}

color("lightblue") {
  translate([160,0,0]) bowl();
  translate([-160,0,0]) bowl();
}

translate([0,50,1]) board();
mirror([0,1,0]) translate([0,50,1]) board();

color("#303030")  {
translate([-320,0,0]) foot();
mirror([1,0,0]) translate([-320,0,0]) foot();
}


// printableFoot();


module printableFoot() {
  intersection() {
    foot();
    translate([-50,0,-1000]) cube([1000, 1000, 1000]);
  }
}

module foot() {
  sr=89;
  h=40;
  t=12;
  translate([0,sr*2-t/2,-t]) screwTab(h,t);
  translate([h*2,sr-h/2,-t]) screwTab(h,t);

  mirror([0,1,0]) {
    translate([0,sr*2-t/2,-t]) screwTab(h,t);
    translate([h*2,sr-h/2,-t]) screwTab(h,t);
  }

  translate([0,-sr*2+t/2,-t]) cube([h*2,sr*4-t,t]);
  translate([0,-sr*2+t/2,-300]) cube([h,sr*4-t,t]);

  intersection() {
    translate([0,-250,-300]) cube([700,500,300]);
      union() {
      difference() {
        union() {
          translate([0,sr-t/2,0]) hexBit(sr,h*2,t);
          mirror([0,1,0]) translate([0,sr-t/2,0]) hexBit(sr,h*2,t);
        }
        translate([h,-300,-hexCircumradius(sr)]) rotate([0,30,0]) cube([100,600,300]);
      }

      translate([0,0,-hexCircumradius(sr*1.5)+t*0.8]) hexBit(sr,h,t);

      translate([0,0,-hexCircumradius(sr*3)+t*1.67]) {
        translate([0,sr-t/2,0]) hexBit(sr,h,t);
        mirror([0,1,0]) translate([0,sr-t/2,0]) hexBit(sr,h,t);
      }
    }
  }
}

module screwTab(h,t) {
  difference() {
    cube([h,h,t]);
    translate([h/2,h/2,-1]) cylinder(r=2.5,h=100,$fn=32);
  }
}

module hexBit(sr,h,t) {
  rotate([0,90,0]) difference() {
    cylinder(r=hexCircumradius(sr),h=h,$fn=6);
    translate([0,0,-1]) cylinder(r=hexCircumradius(sr-t),h=h+2,$fn=6);
  }
}

module bowl() {
  translate([0,0,19]) hull() {
    translate([0,115,0]) cylinder(r1=140, r2=110,h=100);
    translate([0,-115,0]) cylinder(r1=140, r2=110,h=100);
  }
}

module board() {
  translate([-350,0,0]) cube([700,182,19]);
}

function hexCircumradius(hexInradius) = hexInradius/sqrt(3)*2;
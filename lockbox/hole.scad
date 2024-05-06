// topw=149;
// topr=20;

topw=149;
topr=21;

bottomw=147;
bottomr=21;


$fn=64;

difference() {
union() {
  difference() {
    block();
    translate([0,0,-0.1]) cylinder(r=70,h=20.2);
  
  }
  translate([-9.5,6,6]) cube([19,65,14]);
  hull() {
    translate([0,0,19.9]) linear_extrude(height=0.1) circle(r=18); 
    translate([0,0,-7]) linear_extrude(height=0.1) circle(r=7);
  }
}
translate([-7.5,0,8]) cube([15,100,12.1]);
  hull() {
    translate([0,0,20]) linear_extrude(height=0.1) circle(r=16); 
    translate([0,0,-7.1]) linear_extrude(height=0.1) circle(r=5);
  }}

translate([0,0,20-0.84]) {
  cylinder(r=18,h=0.84);
  translate([-9.5,0,0]) cube([19,topw/2,0.84]);
}
// difference() { 
//   circle(r=7);
//   circle(r=5);
// }


// translate([0,0,1]) difference() { 
//   circle(r=15);
//   circle(r=13);
// }


module block() {
  hull() {
    translate([0,0,19.9]) linear_extrude(height=0.1) plane(topw,topr);
    linear_extrude(height=0.1) plane(bottomw,bottomr);
  }
}



// difference() {
//   hull() {
//     translate([0,0,19.9]) linear_extrude(height=0.1) plane(topw,topr);
//     linear_extrude(height=0.1) plane(bottomw,bottomr);
//   }
//   hull() {
//     translate([0,0,20]) linear_extrude(height=0.1) plane(topw-5,topr-2.5);
//     translate([0,0,-0.1]) linear_extrude(height=0.1) plane(bottomw-5,bottomr-2.5);
//   }
// }

// difference() {
  
//   w=bottomw;
//   r=bottomr;

//   linear_extrude(height=1.5) plane(w,r);
  
//   dd=5;
//   dw=w-dd;
//   dr=r-dd/2;

//   translate([0,0,-0.1]) linear_extrude(height=2.2) plane(dw,dr);
// }


module plane(w,r) {
  d=w/2-r;
  hull() {
    translate([d,d]) circle(r=r);
    translate([d,-d]) circle(r=r);
    translate([-d,d]) circle(r=r);
    translate([-d,-d]) circle(r=r);
  }
}

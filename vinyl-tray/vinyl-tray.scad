use <./magnet-hole.scad>;

$fn=128;
t=15;
l=200;
sr=6.6;
br=7.5;
w=(sr+1)*2+2;


// difference() {
//   cylinder(r=w/2,h=t);
//   translate([0,0,-1]) cylinder(r=sr+0.2,h=t+2);
// }


// difference() {

//   union() { 
//     bar(l-w*2,w,t);
//     magnetBar();
//     translate([l-w*2,0,0]) magnetBar();
//   }
//   translate([0,0,-1]) cylinder(r=sr+0.2,h=t+2);
//   translate([l-w*2,0,-1]) cylinder(r=sr+0.2,h=t+2);
//   translate([0,-20,t/2]) rotate([-90,0,0]) cylinder(r=2,h=100);
//   translate([l-w*2,-20,t/2]) rotate([-90,0,0]) cylinder(r=2,h=100);
// }



// magnetHole();
// difference() {
//   translate([-w/2,-t/2,0]) cube([w,t,4.5]);
//   translate([0,0,-1]) cylinder(r=9,h=6.5);
// }


// module magnetBar() {
//   rotate([0,0,90]) difference() {
//     bar(w/2+24.5,w,t,false);
//     translate([0,0,-1]) cylinder(r=sr,h=t+2);
//   }
// }

difference() {
    cylinder(r=w/2,h=t);
    translate([0,0,-1]) cylinder(r=sr,h=t);
}

// difference() {
//   bar(l,w,t);
//   translate([0,0,-1]) cylinder(r=sr,h=t);
//   translate([w,0,-1]) cylinder(r=br,h=t+2);

//   translate([l,0,-1]) cylinder(r=sr,h=t);
//   translate([l-w,0,-1]) cylinder(r=br,h=t+2);
// }

// translate([0,-20,0]) difference() {
//   bar(l,w,t);
//   translate([0,0,-1]) cylinder(r=sr,h=t);

//   translate([l,0,-1]) cylinder(r=sr,h=t);  
// }

// translate([0,20,0]) difference() {
//   bar(l,w,t);
//   translate([w,0,-1]) cylinder(r=sr,h=t);
//   translate([0,0,-1]) cylinder(r=br,h=t+2);

//   translate([l-w,0,-1]) cylinder(r=sr,h=t);
//   translate([l,0,-1]) cylinder(r=br,h=t+2);
// }

module bar(l,w,t,second_end=true) {
  cylinder(r=w/2,h=t);
  translate([0,-w/2,0]) cube([l,w,t]);
  if( second_end ) {
    translate([l,0,0]) cylinder(r=w/2,h=t);
  }
}
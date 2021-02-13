

// difference() {
//   intersection() {
//     import("MainBody1_fixed.stl");
//     //translate([0,-10,-80]) cube([45,16.5,80]);
//    //   translate([0,-10,-65]) cube([45,16.5,50]);
//   }
//   translate([33,-2.5,-60]) cube([10,5,28]);
//   translate([20,-3.5,-42]) cube([15,5,10]);
//   translate([18,-3.5,-43]) rotate([0,30,0]) cube([20,5,10]);
//   translate([6.5,-1,-38]) {
//     cube([15.5,20,12]);
//     translate([7.75,0,0]) rotate([-90,0,0]) cylinder(r=7.75,h=20);
//   }
// }
// translate([13.7,0,-31.2]) rotate([-90,0,0]) translate([11.6,12,0]) cylinder(r=1.4,h=5,$fn=64);
// translate([26,0,-44]) rotate([-90,0,0]) translate([11.6,12,0]) cylinder(r=1.4,h=5,$fn=64);
// translate([24,0,-35]) rotate([-90,0,0]) translate([11.6,12,0]) cylinder(r=1.4,h=5,$fn=64);


cylinder(r=1.4,h=2.5,$fn=64);
//translate([13.7,-2.5,-31.2]) rotate([-90,0,0]) trigger();
  //trigger();
 // translate([10,0,0]) cube([20,50,10]);
 // translate([20,-5,-48]) cube([30,10,40]);
// ;

module trigger() {
  
  color("red") 
  translate([11.6,12,0]) 
 // rotate([0,0,25])
  //rotate([0,0,-8]) 
  translate([-11.6,-12,0]) difference() {
    translate([1.6,-1,0]) {
      cylinder(r=12,h=2.5,$fn=64);
      translate([1,4.5,0]) cube([22,6,2.5]);
      translate([10,13,0]) {
        difference() {
          union() {
            cylinder(r=3,h=2.5,$fn=64);
            translate([-3,-3,0]) cube([6,3,2.5]);
          }
          translate([0,0,-1]) cylinder(r=1.5,h=10,$fn=64);
        }
      }
      translate([23,7.5,0]) cylinder(r=3,h=2.5,$fn=64);
    }
    translate([0,0,-1]) cylinder(r=8,h=10,$fn=64);
    
    translate([25,6.6,-1]) cylinder(r=1.5,h=10,$fn=64);
    translate([22,3,0.75]) cube([10,7,1]);


    rotate([0,0,-45]) translate([-11,-19.2,-1]) cube([30,20,10]);
    translate([-15,-16.5,-1]) cube([30,20,10]);

  }
}
$fn=32;

clip();
//cap();

module clip() {
  difference() {
    union() {
      cube([60,25,2]);
      cube([2,25,8]);
      translate([58,0,0]) cube([2,25,8]);
      
      translate([30,0,6]) cube([30,25,2]);
      translate([0,0,6]) cube([10,25,2]);
    }  
    
    
    translate([-1,25-8,2.01]) cube([20,2,10]);
  }
}

module cap() {
  
  difference() {
    translate([-2.5,-.98,0]) cube([5,1.96,2]);
    translate([0,0.01,0.5]) cylinder(r=1,h=2);
  }
}
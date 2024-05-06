$fn=64;

translate([0,0,-1.2]) cube([10,20,1.2]);
cube([10,5,1.2]);
translate([0,15,0]) cube([10,5,1.2]);
translate([1,6,0]) {
  for(x = [0:4]) {
    for( y = [0:4]) {
      translate([x*2,y*2,0]) cylinder(r1=1,r2=0.1,h=1.2);
    }
  }
}
cubeW = 12.25;
lw=0.4;
wt=lw*3;

difference() {
  crystal();
  scale(0.975) crystal();
  rotate([0,0,45]) translate([cubeW/-2,cubeW/-2,-37]) cube([cubeW,cubeW,10]);

 //  translate([0,0,-100]) cube([100,100,100]);
}

rotate([0,0,45]) translate([cubeW/-2,cubeW/-2,-36]) difference() {
  cube([cubeW,cubeW,6.5]);
  translate([wt,wt,wt]) cube([cubeW-wt*2,cubeW-wt*2,8]);
  translate([cubeW/2,cubeW/2,-100]) cylinder(r=5,h=200);

}


module crystal() {
  
  rotate([0,-70,0]) translate([-273.7,0,110]) import("./diamond.stl");
  
}
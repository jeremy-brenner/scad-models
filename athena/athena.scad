//translate([-34.9,8.5,0]) linear_extrude(height = 5) scale([0.5,0.5]) import("athena.svg");

color("black") difference() {
  translate([-35,0,-3]) union() {
    cube([70,90,4]);
    cube([70,4,10]);
  }
  translate([-34.9,8.5,0]) linear_extrude(height = 5) offset(r=0.1) scale([0.5,0.5]) import("athena.svg");

}
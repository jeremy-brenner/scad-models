$fn=32;

br=17;
ml=16;

cr=7;

bit();



module bit() {
translate([br-3,ml*1.1,0]) rotate([90,0,0]) linear_extrude(height=ml*2.2) strapShape();

translate([br-2,ml,0]) rotate([90,0,0]) linear_extrude(height=ml*2) strapShape();


translate([0,-1,0]) {
    rotate([0,0,60]) translate([-cr,0,0]) rotate([90,0,0]) linear_extrude(height=br+3) strapShape();
mirror([0,1,0]) translate([0,-cr,0]) rotate([0,0,90]) rotate([90,0,0]) linear_extrude(height=br) strapShape();

rotate_extrude(convexity = 10, angle = 360)
    translate([cr, 0, 0])
    strapShape();
}


translate([0,ml/2,0]) strapEnd();
mirror([0,1,0]) translate([0,ml/2,0]) strapEnd();

translate([br,ml/2,0]) rotate([90,0,0]) linear_extrude(height=ml) strapShape();
translate([-br,ml/2,0]) rotate([90,0,0]) linear_extrude(height=ml) strapShape();

}

module strapShape() {
  scale([1,1.25]) hull() {
    translate([-1,0]) circle(r=1);
    translate([1,0]) circle(r=1);  
  }
}

module strapEnd() {
  rotate_extrude(convexity = 10, angle = 180)
    translate([br, 0, 0])
    strapShape();
}
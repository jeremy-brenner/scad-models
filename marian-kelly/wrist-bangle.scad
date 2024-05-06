use <../modules/torus.scad>;

$fn=32;

innerD=67;
ir=innerD/2;




scale([1,1,1.3]) torus(ir+5,5);
translate([0,0,20]) scale([1,1,2]) torus(ir+7,7);

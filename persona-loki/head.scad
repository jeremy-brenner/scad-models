use <./cowl.scad>;
use <./dome.scad>;
use <./mask.scad>;

r1=210/2;
r2=160/2;
r3=250/2;

ys=r2/r1;
zs=r3/r1;



translate([0,-10,-20]) {
  color("red") translate([0,0,60]) scale([ys,1,zs]) sphere(r=r1);
  color("blue") translate([0,0,-120]) cylinder(r=30,h=300);
  color("green") translate([0,80,60]) {
    translate([-40,0,0]) sphere(r=10);
    translate([40,0,0]) sphere(r=10);
  }
}

mask();
cowl();
dome();

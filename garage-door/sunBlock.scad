t=1.6;
cr=20;
ch=40;
cw=18;

$fn=128;

translate([20-t,0,-8]) cube([t,cw,8]);
bh=t*2+2;
translate([20-bh,0,-8-t]) cube([bh,cw,t]);
translate([20-bh+t/2,0,-8]) rotate([-90,0,0]) cylinder(r=t/2, h=cw);

difference() {
  union() {
    cylinder(r=cr,h=ch);
    cube([20,cw,t]);
  }
  translate([0,0,-0.1]) cylinder(r=cr-t,h=ch + 0.2);
  translate([-250,-500,-1]) cube([500,500,50]);
}
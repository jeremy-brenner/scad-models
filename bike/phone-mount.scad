stemR=18;
stemH=60;

hndlbNeckR1=18.5;
hndlbNeckR2=16.5;

//color("grey") neck();

difference() {
translate([0,-19,15]) cube([19,70,46]);
neck();
}

module neck() {
  cylinder(r=stemR,h=stemH);
  translate([0,0,stemH-hndlbNeckR1-5.5]) rotate([-90+7,0,0]) scale([hndlbNeckR2/hndlbNeckR1,1,1]) cylinder(r=hndlbNeckR1,h=70);
  translate([-stemR,-25,14]) cube([stemR*2,25,44]);
}
$fn=32;
lineWidth=0.4;
w=lineWidth*6;
h=lineWidth*2;

lineLength=20;

bar();
rotate([0,0,110]) bar();

module bar() {
  cylinder(r=w/2,h=h);
  translate([-w/2,0,0]) cube([w,lineLength,h]);
  translate([0,lineLength,0])  cylinder(r=w/2,h=h);

}
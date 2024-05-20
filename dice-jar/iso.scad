phi = (1 + sqrt(5)) / 2;
x=100;
y=sqrt(3)/2*x;

face();
translate([0,y*(1/3),0]) rotate([-138.2,0,0]) translate([0,-y*(1/3),0]) face();
rotate([0,0,360/3]) translate([0,y*(1/3),0]) rotate([-138.2,0,0]) translate([0,-y*(1/3),0]) face();
rotate([0,0,360/3*2]) translate([0,y*(1/3),0]) rotate([-138.2,0,0]) translate([0,-y*(1/3),0]) face();

module face() {
  points=[
    [0,-y*(2/3)],
    [x/2,y*(1/3)],
    [-x/2,y*(1/3)]
  ];
  translate([0,0,-0.5]) linear_extrude(height=1) polygon(points);
}

translate([200,0,0]) icosahedron();

module icosahedron() {
  hull() {
    plane(); 
    rotate([90,0,90]) plane();
    rotate([0,90,90]) plane();
  }
}

module plane() {
  y=x*phi;
  cube([x,y,0.00001], true);
}

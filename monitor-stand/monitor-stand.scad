include <../modules/hex-grid.scad>;


hexInradius = 7.77;
supportWidth = 20;
supportThickness = 1.6;

xCells = 25;
yCells = 8;

gridW=260;
gridH=70;

skipCells = [ 
  [1,0], [1,1], [1,2], [1,3], [1,4],
  [2,1], [2,2], [2,3], [2,4],
  [3,1], [3,2], [3,3],
  [4,2], [4,3],


  [8,2], [8,3],
  [9,1], [9,2], [9,3], 
  [10,1], [10,2], [10,3], [10,4], 
  [11,0], [11,1], [11,2], [11,3], [11,4],
  [12,1], [12,2], [12,3], [12,4], 
  [13,0], [13,1], [13,2], [13,3], [13,4],
  [14,1], [14,2], [14,3], [14,4],
  [15,1], [15,2], [15,3],
  [16,2], [16,3],

  [20,2], [20,3],
  [21,1], [21,2], [21,3],
  [22,1], [22,2], [22,3], [22,4],
  [23,0], [23,1], [23,2], [23,3], [23,4], [23,5]
];

cappedCells = [
  [3,0], [9,0], [15,0], [21,0]
];

color("black") difference() {
  union() {
  
  translate([0,-supportThickness/2,0]) cube([gridW,supportThickness,supportWidth]);
  translate([0,gridH-supportThickness/2,0]) cube([gridW,supportThickness,supportWidth]);

  intersection() {
    cube([gridW,gridH,supportWidth]);
    translate([-15,0,0]) hexGrid(hexInradius,supportWidth,supportThickness,xCells,yCells,skipCells,cappedCells);
  }
  }
translate([-10,gridH/2,22]) rotate([0,90,0]) scale([0.35,1,1]) cylinder(r=45,h=300);
}


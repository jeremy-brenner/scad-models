/* [Reg] */

nameI=0; // [0: DrShoggoth, 1:Jeremy, 2:Ben, 3:Jake, 4: Ronnie]

part="preview"; // ["preview", "name", "base", "baseBase"]

/* [Adv] */

charWidth=61;
runeScale=0.23045;
runeZ=2.5;
runeY=30;
baseMargin=5;
baseZ=2.5;
baseOffset=0.25;

baseBaseX=20;
baseBaseA=10;
baseBaseT=5;

/* [Hidden] */

names = [  
  ["do", "c", "tor", " ", "shaw", "go", "th"],
  ["jer", "em", "y", " ", "b", "re", "nner"],
  ["be", "n", " ", "pa", "tter", "so", "n"],
  ["ja", "ke", " ", "bi", "sho", "p"],
  ["ro", "nnie", " ", "lee", " ", "co", "b"],
];


name = names[nameI];

if(part=="name") name();
if(part=="base") base();
if(part=="baseBase") baseBase();

if(part=="preview") {
  baseBase();
  translate([0,6,2.5]) rotate([90-baseBaseA,0,0]) translate([baseMargin,baseMargin,0]) {
    color("black") base();
    name();
  }
}


module baseBase() {
  bw=width()*runeScale+baseMargin*2;
  
  difference() {
    union() {
      difference() {
        cube([bw,baseBaseX,baseBaseT]);
        rotate([-baseBaseA,0,0]) translate([-1,-5,-1]) cube([bw+2,5,10]);
        translate([0,baseBaseX,0]) mirror([0,1,0]) rotate([-baseBaseA,0,0]) translate([-1,-5,-1]) cube([bw+2,5,10]);
      }
      baseBasePillar();
      translate([bw,0,0]) baseBasePillar();
    }

    rotate([-baseBaseA,0,0]) translate([-1,2.5,2.5]) cube([bw+2,baseZ+0.25,20]);  
    
  }
}

module baseBasePillar() {
  translate([0,5,0]) rotate([0,0,90]) {
    cylinder(r=8,h=8,$fn=6);
    translate([0,0,8]) cylinder(r1=8,r2=0,h=4,$fn=6);
  }
}

module name() {
  translate([0,0,baseZ]) linear_extrude(height=runeZ) scale([runeScale,runeScale]) runes();
}

module base() {
  difference() {
    translate([-baseMargin, -baseMargin, 0]) cube([width()*runeScale+baseMargin*2,runeY+baseMargin*2,baseZ]);
    translate([0,0,baseZ-0.5]) linear_extrude(height=0.6) offset(r=baseOffset) scale([runeScale,runeScale]) runes();
  }
}

module runes() {
  for (i = [ 0 : len(name) - 1 ] ) {
    dist = sum([ for (x = [ 0 : len(name)-1 ] ) if(x < i) distance(name[x]) ]);
    if(name[i] != " ") {
      translate([dist,0,0]) import(str("./", name[i] ,".svg"));
    }
  }
}

function width() = sum([ for (x = [ 0 : len(name)-1 ] ) distance(name[x]) ]) + 8.57;
function distance(c) = c == " " ? charWidth/2 : charWidth;
function sum(v, i = 0, r = 0) = i < len(v) ? sum(v, i + 1, r + v[i]) : r;
function join(v, i = 0, r = "") = i < len(v) ? join(v, i + 1, str(r, v[i])) : r;

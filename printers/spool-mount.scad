

chunk=1; // [1,2,3]

h=900;
line_width=0.4;
wall_lines=4;
wall_width=wall_lines*line_width;


$fn=32;


hr=12;
hh=60;


//barMount(10);

intersection() {
  arm();
  if(chunk==1){
    chunk(-1,11);
  }
  if(chunk==2) {
    chunk(12,23);
  }
  if(chunk==3) {
    chunk(24,36);
  }
}

if($preview) {

  mirror([0,0,1]) arm();


  color("blue") translate([-30,0,0]) {
    translate([0,0,0]) printBed();
    translate([0,320,0]) printBed();
    translate([0,320*2,0]) printBed();
    translate([0,320*3,0]) printBed();
    translate([320,0,0]) printBed();
    translate([320,320,0]) printBed();
    translate([320,320*2,0]) printBed();
    translate([320,320*3,0]) printBed();

  }


  color("black") {
    translate([200,900,-65/2]) difference() {
      union() {
        cylinder(r=100,h=5);      
        cylinder(r=26,h=65);
        translate([0,0,60]) cylinder(r=100,h=5);
      }
      translate([0,0,-0.1]) cylinder(r=25,h=65.2);
    }
  }

  color("black") {
    translate([0,0,-540/2]) cube([540,20,540]);
  }

  color("green") {
    translate([540/2,0,0]) rotate([-90,0,0]) cylinder(r=1,h=900);
  }
}

module arm() {
  translate([0,0,25]) intersection() {
    
    difference() {
      union() {
        barMount(hh);
        translate([-4.5,20,0]) cube([4.5,wall_width,hh]);
        intersection() {
          hexes();
          linear_extrude(height=60) curve();
        }
        linear_extrude(height=60) difference() {
          offset(r=wall_width) curve();
          curve();
        }
      }
      translate([20-3,10,hh/2]) screwHole();
      mirror([1,0,0]) translate([-3,10,hh/2]) screwHole();
      translate([30,10,hh/2]) rotate([0,90,0]) cylinder(r=3,h=200);
    }
    intersection() {
      difference() {
        union() { 
          translate([215,0,20]) scale([1,1,0.15]) rotate([-90,0,0]) cylinder(r=250,h=1000,$fn=128);
          translate([215-250,0,-4]) cube([500,1000,24]);
        }
        translate([215,-1,-4]) scale([1,1,0.15]) rotate([-90,0,0]) cylinder(r=250,h=1002,$fn=128);
      }
    }    
    
  }
}

module chunk(start,end) {
  translate([-15,hr+wall_width,0]) {
    for (x = [ -1 : 10] ) {
      hexPositioned(hr+wall_width/2,0,100,x,start);
      hexPositioned(hr+wall_width/2,0,100,x,end);
    }
    translate([-(hr+wall_width/2)*3,(hr+wall_width/2)*start*2,0]) cube([300,(hr+wall_width/2)*(end-start)*2,100]);
  }
}

module curve() translate([0,wall_width,0]) {
  cr=2600;
  intersection() {
    translate([cr-hr*2,0]) difference() {
      circle(r=cr,$fn=128);
      circle(r=cr-hr*5,$fn=128);
    }
    translate([-100,0]) difference() {
      square([300,908]);
      square([121.75,20]);
    }
  }
}

module screwHole() {
  rotate([0,90,0]) {
    cylinder(r=6,h=3);
    cylinder(r=2,h=6);
  }
}

module printBed() {
  translate([-0.25,-0.25,0]) {
    cube([0.5,320,1.1]);
    cube([320,0.5,1.1]);
  }
}

module hexes() {
  translate([-15,hr+wall_width,0]){
    renderCells=[
      [0,1], [0,2], [0,3], [0,4],[0,5],[0,6],[0,7],[0,8],[0,9],
      [1,0],[1,1], [1,2],[1,3],[1,4],[1,5],[1,6],[1,7],[1,8],[1,9],[1,10],[1,11],[1,12],[1,13],[1,14],[1,15],
      [2,0],[2,1], [2,2],[2,3],[2,4],[2,5],[2,6],[2,7],[2,8],[2,9],[2,10],[2,11],[2,12],[2,13],[2,14],[2,15],[2,16],[2,17],[2,18],[2,19],[2,20],
      [3,8],[3,9],[3,10],[3,11],[3,12],[3,13],[3,14],[3,15],[3,16],[3,17],[3,18],[3,19],[3,20],[3,21],[3,22],[3,23],
      [4,16],[4,17],[4,18],[4,19],[4,20],[4,21],[4,22],[4,23],[4,24],[4,25],[4,26],[4,27],
      [5,20],[5,21],[5,22],[5,23],[5,24],[5,25],[5,26],[5,27],[5,28],[5,29],
      [6,24],[6,25],[6,26],[6,27],[6,28],[6,29],[6,30],[6,31],[6,32],
      [7,27],[7,28],[7,29],[7,30],[7,31],[7,32],[7,33],[7,34],
      [8,30],[8,31],[8,32],[8,33],[8,34],[8,35],
      [9,32],[9,33],[9,34],[9,35],
      [10,34],[10,35],
    ];
    hexGrid(hr,wall_width,hh,renderCells);
  }
}

module barMount(length) {
  difference() {
    translate([-wall_width,0,0])  cube([20+wall_width*2,20+wall_width,length]);
    translate([0,-0.1,-0.1]) cube([20,20.1,length+0.2]);
  }

  translate([7.25,18,0]) cube([5.5,2,length]);

  translate([0,7.25,0]) {
    beveledStrip(length);
    translate([20,0,0]) mirror([1,0,0]) beveledStrip(length);
  }
}

module beveledStrip(length) {
  difference() {
    cube([2,5.5,length]);
    rotate([0,0,-45]) translate([0,0,-1]) cube([2,5.5,length+2]);
  }
}

module hexGrid(hr,d,h,renderCells) {
  for (i = [ 0 : len(renderCells) - 1 ] ) {
    x = renderCells[i][0];
    y = renderCells[i][1];
    difference() {
      hexPositioned(hr+d,-d,h,x,y);
      translate([0,0,-0.1]) hexPositioned(hr,d,h+0.2,x,y);
    }
  }
}

module hexPositioned(hr,d,h,ix,iy) {
  cr=circumradius(hr);
  even=abs(ix%2);
  translate([(hr+d/2)*sqrt(3)*ix,(hr+d/2)*even,0]) translate([0,(hr*2+d)*iy,0]) cylinder(r=cr,h=h,$fn=6);
}

function circumradius(hr) = hr/(sqrt(3)/2);
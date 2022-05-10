lh=0.28;
h=lh*3;

x=112.3;
y=298.395;



shoe();
 

module shoe() {
  difference() {
    union() {
      linear_extrude(height=h) shoeSole();
      translate([0,0,h]) shoeSpikes(); 
    }

    translate([0,0,-1]) {
      translate([-x/2+41,y/2-53,0]) hole();
      translate([-24.5,-y/2+79,0]) rotate([0,0,90]) hole();
      translate([29.5,-y/2+81,0]) rotate([0,0,-90]) hole();

    }  
  }
}


module hole() {
  cylinder(r=5,h=h+2);
  translate([-0.5,0,0]) cube([1,100,h+2]);
}

module shoeSpikes() {
  dx=4;
  dy=5;
  intersection() {
    union() {
      spikeGrid(dx,dy,gx=8,gy=55);
      translate([dx*22,0,0]) spikeGrid(dx=dx,dy=dy,gx=6,gy=55);
      translate([dx*8,0,0]) spikeGrid(dx=dx,dy=dy,gx=14,gy=5);
  
    }
    difference() {
      linear_extrude(height=10) shoeSole();
      translate([0,0,-0.1]) linear_extrude(height=10.2) offset(r=-10) shoeSole();
    }
  }
}


module spikeGrid(dx,dy,gx,gy) {
  translate([x/-2+2,y/-2,0]) for ( ix = [0 : gx-1] ){ 
    even=ix%2;
    for ( iy = [0 : gy-1] ){ 
      translate([ix*dx,iy*dy+dy/2*even,0]) cylinder(r1=1,r2=0.16,h=h*2,$fn=16);
    }
  }
}

module shoeSole() {
  translate([x/-2,y/-2]) import("shoe-outline.dxf");
}

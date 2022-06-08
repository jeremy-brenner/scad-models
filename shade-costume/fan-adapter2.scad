t=2;
$fn=32;

w=80;
hd=71.5;
o=(80-71.5)/2;


fanR=39;


tbt=0.5;

th=12;
tr=38.5;
itb=1;

opr=125;

//beltClip();
//fanAdapter();

threads(h=th*3);


module output(m,h) {
  $fn=64;
  opw=24-m*2;
  opww=115-m*2;
  opa=25;

  // intersection() {
   // translate([-opww/2,0,-0.1]) cube([opww,100,h+0.2]);
    translate([0,opr+m,0]) union() {
      difference() {
        cylinder(r=opr,h=h);
        translate([0,0,-0.1]) cylinder(r=opr-opw,h=h+0.2);
        rotate([0,0,opa]) translate([0,-500,-0.1]) cube([1000,1000,1000]);
        rotate([0,0,-opa]) translate([-1000,-500,-0.1]) cube([1000,1000,1000]);
      }
      rotate([0,0,opa]) translate([0,-opr+opw/2,0]) cylinder(r=opw/2,h=h);
      rotate([0,0,-opa]) translate([0,-opr+opw/2,0]) cylinder(r=opw/2,h=h);
    }
  
  // }
}


translate([0,0,th*3]) {
  difference() {  
    difference() {
      hull() {
        cylinder(h=0.1,r=tr);
        translate([0,15,50]) output(0,1);
      }
      translate([0,opr+15,0]) cylinder(r=opr-24,h=100, $fn=64);
    }
    
    difference() {  
      hull() {
        translate([0,0,-0.1]) cylinder(h=0.1,r=tr-6.5);
        translate([0,15,50.1]) output(t,1);
      }
      translate([0,opr+13,0]) cylinder(r=opr-24,h=100, $fn=64);
    }
  }
  translate([0,0,50])difference() {
    translate([0,15,0]) output(0,40);
    translate([0,15,-0.1]) output(t,40.2);
  }
}

module fanAdapter() {
  difference() {
    translate([0,0,24]) threads(h=th*3);
    beltClip();
  }
    
  translate([0,0,3]) difference() {
    airChaimber(fanR+t,tr,20);
    translate([0,0,-0.1]) airChaimber(fanR,tr-6.5,20.2);
  }

  fanMount();
}

module threads(h) {
  n=floor(h/th)+1;
  intersection() {
    union() {
      for ( i = [-1 : n]  ) {
        translate([0,0,th*i]) threadPiece();
      }
    }
    cylinder(r=tr,h=h);
  }
}

module threadPiece() {
  tfn=64;
  
  for ( i = [0 : tfn-1]  ) {
    a=-360/tfn;
    h=th/tfn;
    n=i+1;
    hull() {
      translate([0,0,i*h]) rotate([0,0,i*a]) threadBit(th);
      translate([0,0,n*h]) rotate([0,0,n*a]) threadBit(th);
    }
  }
}


module threadBit(th) {
  rotate([90,0,0]) translate([tr,0,0]) scale([1,1,1]) mirror([itb,0,0]) {
    translate([tbt,0,0]) intersection() {
      cylinder(r=th/2,h=0.1);
      translate([0,-th/2,0]) cube([th,th,1]);
    }
    translate([0,-th/2,0]) cube([tbt,th,0.1]);
  }
}

module beltClip() {
  difference() {
    translate([tr-7,-20,14]) difference() {
      cube([13,40,46.1]);
      translate([-0.1,-0.1,2]) cube([11.1,40.2,40]);
      translate([2.5,-0.1,-5]) rotate([0,-30,0]) cube([9.1,50.2,20]);
    }
    cylinder(r=tr-1,h=100);
  }
}

module airChaimber(bigR,littleR,h) {
  hull() {
    translate([0,0,h]) cylinder(r=littleR,h=1);
    cylinder(r=bigR,h=1);
  }
}


module fanMount() {
  h=3;
  screwHoleR=2.1;
  difference() {
    m=hd/2;
    hull() {
      r=5.5;
      translate([m,m,0]) cylinder(r=r,h=h);
      translate([-m,m,0]) cylinder(r=r,h=h);
      translate([m,-m,0]) cylinder(r=r,h=h);
      translate([-m,-m,0]) cylinder(r=r,h=h);
    }
    translate([m,m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([-m,m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([m,-m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([-m,-m,-0.1]) cylinder(r=screwHoleR,h=h+0.2);
    translate([0,0,-0.1]) cylinder(r=w/2-1,h=h+0.2);
  }
}

module hoseHole(h) {
  difference() {
    cylinder(r=hoseR+t,h=h);
    translate([0,0,-0.1]) cylinder(r=hoseR,h=h+0.2);
  }
}
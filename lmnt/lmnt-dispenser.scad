t=1.2;
packet=[38,103,5];

rotate([-30,0,0]) {
  translate([0,0,25]) bracket();
  //  base();
  //  main();
}

module screw() {
  translate([0,8,0]) rotate([90,0,0]) {
    translate([0,0,4]) cylinder(r1=2.1, r2=4.7, h=4);
    cylinder(r=2.1,h=5);
  }
}

module bracket() {
  bt=5;
  bh=60;
  bm=t*bt*2;
  sm=t*2;
  md=bm-sm;

  difference() {
    union() {
      sheath(false,bt,true,bh);
      translate([packet[0]+t*bt*2,0,0]) sheath(false,bt,true,bh);
      translate([-md/2,(packet[1]+bm)*(sqrt(3)/2)-md/2,(packet[1]+bm)/2]) cube([(packet[0]+t*bt*2)*2,2,bh]);
    }
    translate([packet[0]/2,(packet[1]+md/2)*(sqrt(3)/2)-md/2+1,(packet[1]+md/2)/2]) {
      translate([0,0,bh*0.3]) screw();
      translate([0,0,bh*0.8]) screw();
      translate([packet[0]+t*bt*2,0,bh*0.3]) screw();
      translate([packet[0]+t*bt*2,0,bh*0.8]) screw();

    }
  }
}

module base() {
  translate([0,0,-t-packet[2]]) difference() {
    translate([-t,-t,0]) trapezoid(packet[0]+t*4,packet[1]+t*4,t+packet[2],30);
    translate([t,-t*2,t]) trapezoid(packet[0],packet[1]+t*3+0.1,t+packet[2],30);
    rotate([30,0,0]) translate([(packet[0]+t*2)/2,7,0]) {
      cylinder(r=11,h=5);
      translate([-11,-10,0]) cube([22,10,5]);
      translate([-packet[0]/2,-10,0]) cube([packet[0],5,5]);
    }

  }

  difference() {
    sheath(false);
    translate([(packet[0]+t*2)/2,5,7]) rotate([90,0,0]) union() {
        cylinder(r=11,h=10);
        translate([-11,-10,0]) cube([22,10,10]);
    }
  }
}


module main() {
  difference() {
    trapezoid(packet[0]+t*2,packet[1]+t*2,100,30);
    translate([t,t,-1]) trapezoid(packet[0],packet[1],102,30);
    translate([(packet[0]+t*2)/2,5,7]) rotate([90,0,0]) union() {
      cylinder(r=11,h=10);
      translate([-11,-10,0]) cube([22,10,10]);
    }
  }

  translate([0,0,97]) sheath();
}

module sheath(bevel=true,m=2, bracket=false,h=20) {
  bm=t*m*2;
  sm=t*2;
  md=bm-sm;
  translate([-md/2,-md/2,0]) difference() {
    hull() {
      translate([0,0,t]) trapezoid(packet[0]+bm,packet[1]+bm,h,30);
      if( bevel ){
        translate([m/2,m/2,0]) trapezoid(packet[0]+sm,packet[1]+sm,t,30);
      }else{
        trapezoid(packet[0]+bm,packet[1]+bm,t,30);
      }

    }
    translate([md/2,md/2,-1]) trapezoid(packet[0]+sm,packet[1]+sm,h+5,30);
    if( bracket ) {
      lw=packet[0]+sm;
      sw=packet[0]-t*3;
      wd=lw-sw;
      translate([md/2,0,-1]) hull() {
        translate([0,-0.01,0]) cube([lw,.001,h+5]);
        translate([wd/2,md/2+0.01,0]) cube([sw,.001,h+5]);
      }
    }
  }
} 

module trapezoid(x,y,z,a) {
  hull() {
    rotate([a,0,0]) cube([x,y,0.001]);
    translate([0,0,z]) rotate([a,0,0]) cube([x,y,0.001]);
  }
}

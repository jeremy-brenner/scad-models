r1=110/2;
r2=129/2;
t=2;

$fn=128;

// eyeCap();
//translate([0,0,-t]) color("gray") ledMount();
//translate([0,0,-17]) back();
 eyeBrace();

//eyeScrewHole();



module eyeScrewHole() {
  intersection() {
    difference() {
      cylinder(r=5,h=10);  
      translate([0,0,-1]) cylinder(r=1.5,h=100);
    }
    hull() {
      translate([-10,-11,0]) cube([20,1,2]);
      translate([-10,10,0]) cube([20,1,10]);
    }
  }
}



module eyeBrace() {
  cw=10;
  os=7;
  t=8;
  bl=170;
  bw=20;
  difference() {
  union() {
  difference() {
    translate([-bl/2+bw/2,-bw/2,0]) {
      translate([bl-bw,bw/2,0]) cylinder(r=bw/2,h=t);
      cube([bl-bw,bw,t]);
      translate([0,bw/2,0]) cylinder(r=bw/2,h=t);
    }
    translate([0,0,-1]) oval([r1+os+2,r2+os+2,t-1]); 
  }
  translate([-bl/2+bw/2,-bw/2,t-4]) intersection() {
    cube([bl-bw,bw,t]);
    translate([-10,0,0]) union() {
      for ( i = [0 : 13] ){
        translate([i*10,-10,0]) rotate([0,0,45]) cube([100,1.5,2]);
      }
      for ( i = [0 : 13] ){
        translate([i*10,27.1,0]) rotate([0,0,-45]) cube([100,1.5,2]);
      }
    }
  }
  }
  union() {
      translate([-bl/2+bw/2,0,0]) translate([0,0,-5]) cylinder(r=1.75,h=100);
    translate([bl/2-bw/2,0,0]) translate([0,0,-5]) cylinder(r=1.75,h=100);
    translate([-bl/2+bw/2,0,0]) translate([0,0,-10+6]) cylinder(r=8,h=10);
    translate([bl/2-bw/2,0,0]) translate([0,0,-10+6]) cylinder(r=8,h=10);
  }
  }
}


module back() {
  cw=10;
  os=6.125;
  oval([r1+os+t,r2+os+t,t]); 
  difference() {
    oval([r1+os+t,r2+os+t,16]);
    translate([0,0,-0.1]) oval([r1+os,r2+os,16.2]);
    rotate([0,0,40]) translate([cw/-2,0,t*2]) cube([cw,10000,16]);
  }

}

module ledMount() {
  cw=20;
  difference() {
    ledRingsTogether();
    rotate([0,0,10]) translate([cw/-2,-5000,-11-t-0.1]) cube([cw,10000,11+t+0.2]);
    rotate([0,0,40]) translate([cw/-2,-5000,-11-t-0.1]) cube([cw,10000,11+t+0.2]);
    rotate([0,0,70]) translate([cw/-2,-5000,-11-t-0.1]) cube([cw,10000,11+t+0.2]);
    rotate([0,0,100]) translate([cw/-2,-5000,-11-t-0.1]) cube([cw,10000,11+t+0.2]);
    rotate([0,0,130]) translate([cw/-2,-5000,-11-t-0.1]) cube([cw,10000,11+t+0.2]);
    rotate([0,0,160]) translate([cw/-2,-5000,-11-t-0.1]) cube([cw,10000,11+t+0.2]);
  }
  difference() {
    oval([r1+6,r2+6,t]);
    translate([0,0,-0.1]) oval([r1-1,r2-1,t+0.2]);
  }
  translate([0,0,t]) difference() {
    oval([r1+6,r2+6,1.5]);
    translate([0,0,-0.1]) oval([r1+2.25,r2+2.25,t+0.2]);
  }
}

module ledRingsTogether() {
  translate([0,0,-t]) ledRings();
  translate([0,0,-11]) ledRings();

  translate([0,0,-11-t]) difference() {
    oval([r1+4,r2+4,t]);
    translate([0,0,-0.1]) oval([r1+1,r2+1,t+0.2]);
  }

  translate([0,0,-11-t]) difference() {
    oval([r1+6,r2+6,t+11]);
    translate([0,0,-0.1]) oval([r1+4,r2+4,t+11+0.2]);
  }
}


module ledRings() {
  union() {
    difference() {
      oval([r1+4,r2+4,t]);
      translate([0,0,-0.1]) oval([r1+3,r2+3,t+0.2]);
    }

    difference() {
      oval([r1+2,r2+2,t]);
      translate([0,0,-0.1]) oval([r1+1,r2+1,t+0.2]);
    }
  }
}

module eyeCap() {
  translate([0,0,6]) {
    difference() {
      scale([r1,r2,10]) sphere(r=1);
      scale([r1-2,r2-2,10-2]) sphere(r=1);
      translate([-500,-500,-1000]) cube([1000,1000,1000]);
    }
  }

  difference() {
    union() {
      oval([r1+2,r2+2,t]);
      translate([0,0,t]) oval([r1,r2,t*2]);
    }
    translate([0,0,-0.1]) oval([r1-2,r2-2,t*3+0.2]);
  }
}

module oval(d) {
  ratio=d[0]/d[1];
  scale([ratio,1,1]) cylinder(r=d[1],h=d[2]);
}
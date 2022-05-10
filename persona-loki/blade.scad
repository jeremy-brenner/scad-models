blade_len=740;
blade_thickness=8;
blade_width=36.5;

curve_ratio=0.04;
c=2;

curves=14;


// translate([0,-blade_width/2-3,-5]) color("red") rotate([0,-90,0]) {
//   blade();
//   mirror([0,0,1]) blade();
// }

// handleCut();
// color("red") translate([-2,-2,-230]) cube([5,5,240]);
// translate([-2,-70/2,-2]) color("red") cube([5,70,5]);
difference() {
  scale([0.8,0.8,0.6]) handleCut();
  translate([-1000,-500,-500]) cube([1000,1000,1000]);
  translate([0.5-blade_thickness/2,-1-blade_width/2-3,-15]) cube([blade_thickness,blade_width+1,50]);
}

  
// blade();

// intersection() {
//   cube([blade_len/c,100,100]);
//   blade();
// }

// intersection() {
//   translate([blade_len/c,0,0])
//   cube([blade_len/c,100,100]);
//   blade();
// }

// intersection() { 
//   translate([blade_len/c*2,0,0])
//   cube([blade_len/c,100,100]);
//   blade();
// }

module handleCut() {
  color("gray") difference() {
    handle();
    translate([0,-15,40]) rotate([70,0,0]) cuttingPlane();
    translate([0,-10,-20]) rotate([70,0,0]) cuttingPlane();
    translate([0,0,-60]) rotate([55,0,0]) cuttingPlane();
    translate([0,0,-100]) rotate([55,0,0]) cuttingPlane();
    translate([0,0,-140]) rotate([50,0,0]) cuttingPlane();
    translate([0,0,-177]) rotate([55,0,0]) cuttingPlane();
    translate([0,0,-210]) rotate([50,0,0]) cuttingPlane();
    translate([0,0,-240]) rotate([40,0,0]) cuttingPlane();
    translate([0,0,-280]) rotate([40,0,0]) cuttingPlane();
    translate([0,0,-350]) rotate([45,0,0]) cuttingPlane();
  }
  color("black") translate([0,0,-1]) scale([0.95,0.95,0.99]) handle();
}

module cuttingPlane() {
  color("red") translate([-250,-250,0]) cube([500,500,2]);
}

module handle() {
  $fn=64;
  hull() {
    handle0();
    handle1();
  }
  hull() {
    handle1();
    handle2();
  }
  hull() {
    handle2();
    handle3();
  }
  hull() {
    handle3();
    handle4();
  }
  hull() {
    handle4();
    handle5();
  }
  hull() {
    handle5();
    handle6();
  }
  hull() {
    handle6();
    handle7();
  }
  hull() {
    handle7();
    handle8();
  }
  hull() {
    handle8();
    handle9();
  }
  hull() {
    handle9();
    handle10();
  }
}

module handle0() {
  translate([0,-5,8]) rotate([-15,0,0]) scale([0.6,1,1]) cylinder(r=30,h=1);
}

module handle1() {
  translate([0,-5,0]) rotate([-15,0,0]) scale([0.6,1,1]) cylinder(r=60,h=1);
}

module handle2() {
  translate([0,-5,-40]) rotate([-10,0,0]) scale([0.6,1,1]) cylinder(r=30,h=1);
}

module handle3() {
  translate([0,5,-60]) rotate([-10,0,0]) scale([0.6,1,1]) cylinder(r=32,h=1);
}

module handle4() {
  translate([0,5,-90]) rotate([-10,0,0]) scale([0.6,1,1]) cylinder(r=26,h=1);
}
module handle5() {
  translate([0,5,-120]) rotate([-10,0,0]) scale([0.6,1,1]) cylinder(r=23,h=1);
}
module handle6() {
  translate([0,5,-200]) rotate([-10,0,0]) scale([0.6,1,1]) cylinder(r=25,h=1);
}
module handle7() {
  translate([0,5,-250]) rotate([-16,0,0]) scale([0.6,1,1]) cylinder(r=27,h=1);
}
module handle8() {
  translate([0,4.5,-260]) rotate([-20,0,0]) scale([0.6,1,1]) cylinder(r=29,h=1);
}
module handle9() {
  translate([0,2,-310]) rotate([-28,0,0]) scale([0.6,1,1]) cylinder(r=35,h=1);
}

module handle10() {
  translate([0,-5,-360]) rotate([-20,0,0]) scale([0.6,1,1]) difference() {
    difference() {
      cylinder(r=33,h=1,$fn=4);
      translate([-50,-100,-1]) cube([100,100,3]);
    }
  }
}

module blade() {

  difference() {
    difference() {
      cube([blade_len,blade_width,blade_thickness/2]);
      rotate([-60,0,0]) translate([-1,-blade_width*2,-10]) cube([blade_len+2,blade_width*2,100]);
      translate([45,-2,0])
      scale(2.15) {
        for ( i = [0 : curves-1] ){
          translate([20*i,0,0]) curve();
        }
      }

    }

    translate([blade_len-122,44,-43]) scale([3,1,1]) difference() {
      translate([0,-60,0]) cube([60,60,60]);
      intersection() {
        sphere(r=60);
        translate([-0.1,-59.9,-0.1]) cube([60,60,60]);
      } 
      
    }
    translate([-1,blade_width-blade_width/3-3,-0.1]) cube([blade_len-60,blade_width/3,blade_thickness/4]);
  }
}

module curve() {
  scale([1,0.8,0.25])
  rotate([0,12,-10])
  rotate([-38,0,0]) 
  translate([0,0,-10]) 
  linear_extrude(height=100) 
  translate([-306,-168.3,0]) 
  import("./curve.svg");
}
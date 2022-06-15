$fn=64;
t=1.6;
r=20;
ct=17;

baseWidth=300;
baseHeight=130;

positions=[
  [-baseWidth/2,-baseHeight/2,0],
  [0,baseHeight/2,0],
  [baseWidth/2,-baseHeight/2,0]
];

a=20;
angles=[a,0,-a];
masks=["./Monomon_-_Mask_centered.stl", "./Lurien_-_Mask_centered.stl", "./Herrah_-_Mask_centered.stl"];

postBaseR=6;

holeFudge=0.2;
nutR=3.2;
screwR=1.75;

powerPlitterBox_ix=21;
powerPlitterBox_iy=21;
powerPlitterBox_iz=15;

// color("blue") translate([0,-236,-2]) cube([10,150,2]);
// color("blue") translate([0,84,-2]) cube([10,80,2]);
// color("blue") translate([170,-70,-2]) cube([80,10,2]);

// translate([0,0,25]) color("white") masks();

// translate([-250,-236,0]) canvas();
// translate([0,0,5]) color("gray") backMount();
// translate([0,0,15]) holes() connector();


  // color("black") post();
// lightHolder();

// color("white") postLight();
// color("black") postMaskConnection();
// glueCross();


// translate([0,0,10]) difference() {
//    mask();
//   cube([1000,1000,1000]);
//  }

// translate([0,0,10]) mountHelper();

//canvasBracket();
//  powerSplitterBox();
 color("green") translate([powerPlitterBox_ix+t*2,0,powerPlitterBox_iz+t*2]) rotate([0,180,0]) powerSplitterBoxLid();

module powerSplitterBox() {
  ix=powerPlitterBox_ix;
  iy=powerPlitterBox_iy;
  iz=powerPlitterBox_iz;
  difference() {
    cube([ix+t*2,iy+t*2,iz+t]);
    translate([t,t,t]) cube([ix,iy,iz+1]);
    translate([t+3,-1,t+4]) cube([10,10,20]);
    translate([9.7,iy-3,t+10]) cube([5,7,12.2]);
  }
}

module powerSplitterBoxLid() {
  ix=powerPlitterBox_ix;
  iy=powerPlitterBox_iy;
  difference() {
    union() {
      cube([ix+t*2,iy+t*2,t]);
      translate([ix-10+t-3,0,t]) cube([10,t,5]);
      translate([t,t,t]) difference() {
          cube([ix,iy,10]);
          translate([t,t,-0.1]) cube([ix-t*2,iy-t*2,10.2]);
          translate([8,-1,0]) cube([10,5,20]);
      }
    }
    translate([9.5,iy-3,-0.1]) cube([5,7,12.2]);
  }
}

module canvasBracket() {
  difference() {
    union() {
      cube([90,40,t]);
      translate([0,7,0]) bracketBracket();
      translate([0,33-t,0]) bracketBracket();
      translate([-t,-5,0]) cube([t,50,10]);
      translate([-t,-5,5]) rotate([0,90,0]) cylinder(r=5,h=t+3);
      translate([-t,45,5]) rotate([0,90,0]) cylinder(r=5,h=t+3);
    }
    translate([60,20,-0.1]) cylinder(r=5,h=t+0.2);
    translate([60,15,-0.1]) cube([30.1,10,t+0.2]);
    translate([30,20,-0.1]) cylinder(r=5,h=t+0.2);
    translate([-0.1,15,-0.1]) cube([30.1,10,t+0.2]);

    translate([-t-0.1,-5,5]) rotate([0,90,0]) cylinder(r=2,h=10);
    translate([-t-0.1,45,5]) rotate([0,90,0]) cylinder(r=2,h=10);
    translate([0,-5,5]) rotate([0,90,0]) cylinder(r1=2, r2=3.5, h=3.1);
    translate([0,45,5]) rotate([0,90,0]) cylinder(r1=2, r2=3.5,h=3.1);
  }
}

module bracketBracket() {
  cube([30,t,5]);
  translate([30,0,0]) rotate([-90,0,0]) difference() {
    cylinder(r=5,h=t);
    translate([-5,-0.1,-0.1]) cube([10,10,t+0.2]);
  }
}

module glueCross() {
  difference() {
    union() {
      linear_extrude(t) projection() hull() mask();
      cylinder(r=postBaseR-holeFudge,h=5, $fn=4);
    }
    translate([5,5,-1]) cube([1000,1000,10]);
    translate([-1005,-1005,-1]) cube([1000,1000,10]);
    translate([-1005,5,-1]) cube([1000,1000,10]);
    translate([5,-1005,-1]) cube([1000,1000,10]);
  }
  color("blue") difference() {
    scale([1.02,1.02,1]) linear_extrude(5) projection() hull() mask();
    translate([0,0,-0.1]) linear_extrude(5.2) projection() hull() mask(); 
  }
}

module connector() {
  color("black") post();
  color("white") postLight();
  color("black") postMaskConnection();
}

module backMount() {
  difference() {
    triangle() cylinder(r=r,h=10);
    translate([0,0,-0.1]) holes()  cylinder(r=postBaseR+holeFudge,h=100,$fn=4);
  }
}

module mountHelper() {
  or=postBaseR+t; 
  ir=postBaseR; 
  difference() {
    cylinder(r=or,h=38+t, $fn=4);
    translate([0,0,-1]) cylinder(r=ir,h=40+t, $fn=4);
  }
}

module postLight() {
  or=postBaseR+t; 
  ir=postBaseR; 
  translate([0,0,46]) difference() {
      union() {
      difference() {
        cylinder(r=or,h=t*2);
        translate([0,0,t]) cylinder(r=ir,h=t+0.1, $fn=4);
        translate([0,0,-0.1]) cylinder(r=screwR,h=10);
      }
      translate([0,0,-18]) difference() {
        cylinder(r=or,h=18);
        translate([0,0,10]) cylinder(r=ir,h=40);
        translate([0,0,-0.1]) cylinder(r=ir,h=10.2, $fn=4);
      }
      translate([0,0,t-11]) difference() {
        union() {
          translate([0,0,t]) cylinder(r=9+t,h=t);
          translate([0,0,-t]) cylinder(r1=or, r2=9+t, h=t*2);
        }
        translate([0,0,t]) cylinder(r=9,h=t+0.1);
        translate([0,0,-t-0.1]) cylinder(r=ir,h=10.2);
      }
    }
    translate([-3,-2,-8]) cube([6,10,8]);
  }
}

module postMaskConnection() {
  or=postBaseR-holeFudge;
  // translate([0,0,t]) color("silver") difference() {
  //    cylinder(r=nutR,h=2.5,$fn=6);
  //    translate([0,0,-0.1]) cylinder(r=screwR,h=3);
  // }
  translate([0,0,48]) difference() {
    union() {
      cylinder(r=or,h=t, $fn=4);
      translate([0,0,t]) cylinder(r=10,h=t*3);
      translate([0,0,0]) difference() {
        cylinder(r=20,h=5);
        translate([0,0,-0.1]) cylinder(r=10,h=40);
        translate([-20,-40,-1]) cube([40,40,40]);
      }
    }
    translate([0,0,t]) cylinder(r=nutR,h=50, $fn=6);
    translate([0,0,-1]) cylinder(r=screwR,h=50);
    translate([0,0,-38]) mask();
  }
  //translate([0,0,-40]) mask();
}


module lightHolder() {
  br=(postBaseR-holeFudge)*sqrt(2)/2;
  sr=(postBaseR-t-holeFudge)*sqrt(2)/2;
  difference() {
    union() {
      cylinder(r=br,h=t);
      translate([0,0,-t]) cylinder(r=sr,h=t);
    }
    translate([-1.25,-2,-5]) cube([2.5,10,20]);
  }
}

module post() {
  or=postBaseR-holeFudge;
  ir=postBaseR-t-holeFudge;
  postH=48;
  translate([0,0,-10]) difference() {
    union() {
      cylinder(r=or,h=postH,$fn=4);
      translate([0,0,10]) cylinder(r=or,h=postH-20);
    }
    translate([0,0,-0.1]) cylinder(r=ir,h=postH+0.2,$fn=4);
  }
}


module holes() {
  for(pos1=[0:len(positions)-1]) {
    translate(positions[pos1]) rotate(angles[pos1]) children();
  }
}

module canvas() {

    color("black") {
      difference() {
        cube([500,400,ct]);
        translate([1,1,-1]) cube([500-2,400-2,ct]);
      }
    }
    translate([1,1,0]) {
      cube([500-2,40,ct-1]);
      translate([0,400-40-2,0]) cube([500-2,40,ct-1]);
      cube([40,400-2,ct-1]);
      translate([500-40-2,0,0]) cube([40,400-2,ct-1]);
    }

}

module masks() {
  translate(positions[0]) rotate([0,0,angles[0]]) mask(0);
  translate(positions[1]) rotate([0,0,angles[1]]) mask(1);
  translate(positions[2]) rotate([0,0,angles[2]]) mask(2);
}

module mask(num=1) {
  translate([0,-45,0]) scale([2,2,2]) import(masks[num]);
}

module triangle() {
  for(pos1=[0:len(positions)-1]) {
    pos2=(pos1+1)%len(positions);
    hull() {
      translate(positions[pos1]) children();
      translate(positions[pos2]) children();
    }
  }
}
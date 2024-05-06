//A 19x19 board should measure 454.5 mm from top to bottom by 424.2 mm from left to right. It should be 151.5 mm thick.

// The lines are typically 1 mm thick. They should be spaced 22 mm apart left to right and 23.7 mm apart top to bottom.

// Star point markers are typically 4 mm in diameter.
//svg fix https://www.svgminify.com/

xSpacing=23.7;
ySpacing=22;
lThickness=1;
starR=2;
borderW=14;
thickness=4;
lineDepth=0.2;
stoneR=11.05;

$fn=128;

// color("black")
// scale(0.7) stone(7.5);

stoneConnector();

module stoneConnector() {
scale(0.7) {
  translate([0,0,3]) cylinder(r1=2.4, r2=2,h=1);
  cylinder(r=2.4,h=3);
  translate([0,0,-1]) cylinder(r2=2.4, r1=2,h=1);
}
}
// scale(0.7) halfStone();

// stlGoClubBoard();

// scale(1.7) {
  // bowl();
 // translate([0,0,17.8]) lid();
// }
// cherryBlossomBoard();
//dragonPhoenixBoard();

// board9x9();

module halfStone() {
  difference() {
    stone(100);
    translate([0,0,-100]) cylinder(r=100,h=100);
    translate([0,0,-0.1]) cylinder(r=2.5,h=3.1);
   // translate([0,-1000,0]) cube([1000,2000,1000]);
  }
}

module dragonPhoenixBoard() {
  scale([0.7,0.7,1]) difference() {
    board13x13();
    // phoenix();
    // dragon();
    dragonOutline();
    phoenixOutline();
  }
}

module dragonShape() {
  render() translate([-4,20]) mirror([1,0,0]) scale(0.22) rotate([0,0,90]) difference() {
    translate([300,1]) square([260,740]);
    import("dragon-phoenix-simplified.svg");
  }
}

module phoenixShape() {
  render() translate([0,-157]) scale(0.22) rotate([0,0,85]) difference() {
    translate([0,1]) square([300,740]);
    import("dragon-phoenix-simplified.svg");
  }
}

module dragonOutline() {
  color("black")
  translate([0,0,-0.01]) 
  linear_extrude(height=0.02)
  difference() {
    offset(r=1) dragonShape();
    dragonShape();
  }
}

module dragon() {
  color("#00918d")
  // translate([0,0,-0.01]) 
  linear_extrude(height=0.02) dragonShape();
}
module phoenixOutline() {
  color("black")
  translate([0,0,-0.01]) 
  linear_extrude(height=0.02)
  difference() {
    offset(r=1) phoenixShape();
    phoenixShape();
  }
}

module phoenix() {
  color("#8c2f12") 
  // translate([0,0,-0.01]) 
  linear_extrude(height=0.02) phoenixShape();
}

module cherryBlossomBoard() {
  difference() {
    scale([0.7,0.7,1]) board13x13();
    translate([-128,-128,-0.1]) color("pink") linear_extrude(height=0.2) projection()  import("cherryblossom.stl");
  }
}

module cherryBlossoms() {
  translate([0,0,-0.01]) linear_extrude(height=0.02) projection() linear_extrude(height=1) {
      translate([48,-100,0]) scale(0.35) import("cherryblossombutterfly_Layer 1.svg");
      translate([-105,45,0]) scale(0.35) import("cherryblossombutterfly_Layer 2.svg");
  }
}

module lid() {
  $fn=128;

  scale([1,1,0.3]) difference() {
    union() {
      sphere(r=21);
      cylinder(r=21.1,h=2.5);
    }
    translate([-25,-25,-50]) cube([50,50,50]);
    translate([0,0,-2]) sphere(r=20.5);
  }
  translate([0,0,-2]) difference() {
    union() {
      intersection() {
        cylinder(r=17.9,h=10);
        translate([0,0,2]) scale([1,1,0.3]) sphere(r=21);
      }
      nubR=0.75;
      nubD=17.7;
      nubZ=0.75;

      translate([nubD,0,nubZ]) sphere(r=nubR);
      rotate([0,0,360/3]) translate([nubD,0,nubZ]) sphere(r=nubR);
      rotate([0,0,360/3*2]) translate([nubD,0,nubZ]) sphere(r=nubR);
    }
    translate([0,0,0]) scale([1,1,0.3]) sphere(r=17.4);
  }

}

module bowl() {
  $fn=128;

  nubR=0.9;
  nubD=17.7;
  difference() {
    bowlShape();
    cylinder(r=18,h=50);
    scale(0.92) bowlShape();
    translate([nubD,0,10]) cylinder(r=nubR,h=5);
    rotate([0,0,360/3]) translate([nubD,0,10]) cylinder(r=nubR,h=5);
    rotate([0,0,360/3*2]) translate([nubD,0,10]) cylinder(r=nubR,h=5);
  }
}

module bowlShape() {
 hull() rotate_extrude(angle=360) 
  translate([14,0,0])  
    {
      intersection() {
        scale([1,1.6]) circle(r=10);
        translate([-10,0]) square([20,14]);
      }
      intersection() {
        circle(r=10);
        translate([-10,-10]) square([20,10]);
      }
    }
}


module clubName() {
  translate([103,-95,0]) mirror([1,0,0]) linear_extrude(1) {
    translate([0,9]) text("St. Louis Go Club", font = "Arial Black:Bold", size = 6.5);
    text("https://baduk.club/club/stl", font = "Arial Black:Bold", size = 4);
  }
}

module clubText() {
  render()
    translate([87,81,0]) qrCode();
    rotate([0,0,180]) translate([87,81,0]) qrCode();
    translate([0,0,0]) clubName();
    translate([0,0,0]) rotate([0,0,180]) clubName();
}

module stlGoClubBoard() {
  difference() {
    scale([0.7,0.7,1]) board13x13(); 
    color("black") translate([0,0,-0.99]) clubText();
  }
}

module qrCode() {
  linear_extrude(height = 1) scale(0.1) import("stlgoclub-mono.svg", center=true);
}

module qrBox() {
  hull() {
    translate([13,13,0]) cylinder(r=4,h=1);
    translate([13,-13,0]) cylinder(r=4,h=1);
    translate([-13,-13,0]) cylinder(r=4,h=1);
    translate([-13,13,0]) cylinder(r=4,h=1);
  }
}

module stone(sh) {
  intersection() {
    scale([1,1,0.4]) sphere(r=11.05,$fn=64);
    translate([0,0,-sh/2]) cylinder(r=12,h=sh);
  }
}


module board9x9() {
  size=[9,9];
  starPoints=[
    [2,2],
    [2,6],
    [4,4],
    [6,2],
    [6,6]
  ];
  board(size,starPoints);
}

module board13x13() {
  size=[13,13];
  starPoints=[
    [3,3],
    [3,9],
    [6,6],
    [9,3],
    [9,9]
  ];
  difference() {
  board(size,starPoints);

      color("black") translate([0,0,-0.8]) grid(  
      size=[9,9],
      starPoints=[
        [2,2],
        [2,6],
        [4,4],
        [6,2],
        [6,6]
      ]);
  }
}

module board(size,starPoints) {
  boardXW=(size[0]-1)*xSpacing+lThickness+borderW*2;
  boardYW=(size[1]-1)*ySpacing+lThickness+borderW*2;
  
  difference() {
    translate([boardXW/-2,boardYW/-2,0]) color("#bda070") cube([boardXW,boardYW,thickness]);
    color("black") translate([0,0,thickness-lineDepth]) grid(size,starPoints);
  }
}

module grid(size,starPoints) {
  translate([lThickness/2-(size[0]-1)*xSpacing/2,lThickness/2-(size[1]-1)*ySpacing/2,0]) {
    for (p = [ 0 : len(starPoints) - 1 ]) {
      translate([starPoints[p][0]*xSpacing,starPoints[p][1]*ySpacing,0]) cylinder(r=starR,h=1);
    }

    for ( y = [0 : size[1]-1] ) {
      hull() {
        translate([0,y*ySpacing,0]) cylinder(r=lThickness/2,h=1);
        translate([(size[0]-1)*xSpacing,y*ySpacing,0]) cylinder(r=lThickness/2,h=1);
      }
    }

    for ( x = [0 : size[0]-1] ) {
      hull() {
        translate([x*xSpacing,0,0]) cylinder(r=lThickness/2,h=1);
        translate([x*xSpacing,(size[0]-1)*ySpacing,0]) cylinder(r=lThickness/2,h=1);
      }
    }
  }
}

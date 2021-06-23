
piece=-1; // [-1:whole, 0:hilt, 1:blade1, 2:blade2, 3:blade3]

if(piece==-1) {
  main(10000000,-1000);
}

if(piece==0) {
  main(215,592.695);
}

if(piece==1) {
  main(256,326.695);
}

if(piece==2) {
  main(255,71.695);
}

if(piece==3) {
  main(255,-183.305);
}

module main(w,p) {

  intersection() {
    difference() {
      translate([-6,0,0]) rotate([0,0,0.25]) scale([18,18,18]) translate([0,0,2.1]) import("Pure_Nail_Front_FDM_bfix.stl");          
      translate([5,550,0]) rotate([-90,0,0]) cylinder(r=15,h=200, $fn=64);
      translate([-1,0,-1]) rotate([2.1,0,0]) translate([0,-170,-200]) rotate([-90,0,0]) cylinder(r=200,h=720, $fn=64);
    }
    translate([-30000,p,0]) cube([60000,w,10000]);
    
 //   translate([0,p,0]) cube([60000,w,10000]);
  }
}
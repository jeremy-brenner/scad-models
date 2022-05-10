$fn=32;

l=15;
//l=0;

screwHoleR=1.49;


medalClip(l);

module medalClip(l) {
  r=3;
  
  color("silver") {
    difference() {
      scale([1,1,0.5]) rotate([0,90,0]) {
        sphere(r=r);
        cylinder(r=r,h=l);
        rotate([0,90,0]) cylinder(r=r,h=r+1);
        translate([4,0,0]) rotate([0,90,0]) cylinder(r1=r,r2=r-0.75,h=2);

        translate([0,-r,0]) cube([r+1,r*2,l]);
        
        translate([0,0,l]) {
          sphere(r=r);
          rotate([0,90,0]) cylinder(r=r,h=r+1);
          translate([4,0,0]) rotate([0,90,0]) cylinder(r1=r,r2=r-0.75,h=2);
        }
      }
      translate([0,0,-r-5.5]) cylinder(r=screwHoleR,h=r+6);
      translate([l,0,-r-5.5]) cylinder(r=screwHoleR,h=r+6);
    }
  }
}
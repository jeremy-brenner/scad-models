$fn=32;

strapW=25;
strapT=2;

clipW=15;
clipT=2;

clipL=strapW+clipT*2;
clipH=strapT+clipT*2;

medalStrapClip();

module medalStrapClip() {
  color("silver") {
    translate([0,61,0]) difference() {
      cube([clipL,clipW,clipH]);
      translate([0,-1,0]) strap();
      translate([clipL/2,clipW/2,-1]) cylinder(r=3,h=100, $fn=32);
    }
  }
}


module strap() {
  color("#502D16") translate([clipT,0,clipT]) cube([strapW,150,strapT]);
}
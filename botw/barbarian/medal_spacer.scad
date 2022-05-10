color("silver") {
  // spacers for belt medals
  // spacer(8,4);
  // spacer(5,1);

  // spacers for strap medals
  //spacer(4.5,1);
  spacer(7.5,4);

}

module spacer(totalH,spacerH) {
  difference() {
    union() {
      cylinder(r=2.8, h=totalH, $fn=32);
      cylinder(r=3.2, h=spacerH, $fn=32);
    }
    translate([0,0,-0.1]) cylinder(r=1.75, h=totalH+0.2, $fn=32);
  }
}
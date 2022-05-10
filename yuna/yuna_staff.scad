
scaleValue=1.2;

difference() {
  staffTop();
  head();
}

module head() {
  translate([0,0,-8.7201]) import("./Head_1.stl");
}

module staffTop() {
  translate([190,0,0]) rotate([0,-90,0]) scale([scaleValue,scaleValue,scaleValue]) import("./Yuna_Staff_-_CONNECTOR.stl");
}

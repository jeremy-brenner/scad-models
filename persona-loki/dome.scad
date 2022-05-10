w=130;
h=88.5;


difference() {
intersection () {
  dome();
  chopper();
}
// translate([-w/2,0,0]) cube([w,500,h-5]); 
}


module chopper() {
  difference() {
    translate([-w/2,0,0]) cube([w,500,h]); 
    rotate([-30,0,0]) translate([-(w+10)/2,-50,0]) cube([w+10,500,h]); 
  }
}

module dome() {
  scale(0.9) {
    import("./persona-loki-dome.stl");
  }
}
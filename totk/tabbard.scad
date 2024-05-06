// translate([0,-21,0]) linear_extrude(height = 5) scale(0.9) import("zonai zelda tabard vectors.svg");
// color("blue") cube([10,840,10]);


scale(0.9) {
  // stuff() import("zonai zelda tabard vectors_path574.svg");
// stuff() import("zonai zelda tabard vectors_polygon568.svg");
// stuff() import("zonai zelda tabard vectors_path572.svg");
// stuff() import("zonai zelda tabard vectors_path570.svg");

// stuff() import("zonai zelda tabard vectors_path550.svg");
// stuff() import("zonai zelda tabard vectors_path552.svg");

// stuff() import("zonai zelda tabard vectors_path554.svg");
// stuff() import("zonai zelda tabard vectors_path556.svg");

// stuff() import("zonai zelda tabard vectors_path558.svg");
// stuff() import("zonai zelda tabard vectors_path560.svg");
stuff() import("zonai zelda tabard vectors_path566.svg");




}


module stuff() {
  step = 0.1;
  end=1.1;
  // end=1.4;
    linear_extrude(height=4) children();
    translate([0,0,4]) for(i = [0:step:end]) {
      translate([0,0,i]) linear_extrude(height=step) offset(delta=-i) children();
    }

}
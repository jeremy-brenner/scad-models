//$fn=32;
$fn=128;


//staff();
// part1();
// part2();
part3();


module part1() {
  intersection() {
    translate([-150,-150,0]) cube([300,300,500]);
    staff();
  }
}
module part2() {
  intersection() {
    translate([-150,-150,500]) cube([300,300,346.7]);
    staff();
  }
}
module part3() {
  intersection() {
    translate([-150,-150,846.7]) cube([300,300,500]);
    staff();
  }
}

module staff() {
    rotate_extrude()    rotate([0,0,90]) import("path502.svg");


    translate([0,0,940]) color("red")  intersection() {
    heart_ring();
    translate([0,0,-20]) cylinder(r=40,h=40);
    }


    color("white") translate([0,0,1205]) 
    difference() {
        sphere(r=126);
        translate([0,0,-70]) zag(48);
        translate([0,0,-130]) zag(150);

    }

}

module zag(h) {
    zig(h);
    rotate([0,0,90]) zig(h);
    rotate([0,0,180]) zig(h);
    rotate([0,0,270]) zig(h);

}

module zig(h) {
    translate([-1,0,0]) intersection() {
        difference() {
            rotate([45,0,0]) translate([0,-100,-100]) cube([200,200,200]);
            translate([0,0,-h]) rotate([45,0,0]) translate([0,-100,-100]) cube([202,200,200]);
        }
        translate([0,0,-25]) rotate([0,0,-45]) cube([250,250,200]);
    }
}

module heart_ring() {
    ra=51.5;

    heart_outline();
    rotate([0,0,ra]) heart_outline();
    rotate([0,0,ra*2]) heart_outline();
    rotate([0,0,ra*3])  heart_outline();
    rotate([0,0,ra*4])  heart_outline();
    rotate([0,0,ra*5]) heart_outline();
    rotate([0,0,ra*6])  heart_outline();
}

module heart_sub_component(radius) {
    rotated_angle = 45;
    diameter = radius * 2;
    $fn = 48;

    translate([-radius * cos(rotated_angle), 0, 0]) 
        rotate(-rotated_angle) union() {
            circle(radius);
            translate([0, -radius, 0]) 
                square(diameter);
        }
}

module heart(radius, center = false) {
    offsetX = center ? 0 : radius + radius * cos(45);
    offsetY = center ? 1.5 * radius * sin(45) - 0.5 * radius : 3 * radius * sin(45);

    translate([offsetX, offsetY, 0]) union() {
        heart_sub_component(radius);
        mirror([1, 0, 0]) heart_sub_component(radius);
    }

}

module heart_outline() {
    radius = 11;
   translate([0,40,0]) rotate([90,0,0]) linear_extrude(height=9) difference() {
    heart(radius,true);
    heart(radius*0.7,true);
    }
}
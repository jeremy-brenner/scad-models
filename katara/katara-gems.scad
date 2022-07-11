
$fn=128;

bigGem();
translate([11,11,0]) smallGem();
translate([-11,11,0]) smallGem();

module smallGem() {
    scaledHalfSphere(3,3,2);
}
module bigGem() {   
    y=25/2;
    x=y*0.70;
    z=3;
    difference() {
      scaledHalfSphere(x,y,z);
      translate([0,0,-0.1]) scaledHalfSphere(x-1,y-1,z-1);
    }
}

module scaledHalfSphere(x,y,z) {
    scale([x,y,z]) intersection() { 
        sphere(r=1);
        translate([-1,-1,0]) cube([2,2,1]);
    }
}
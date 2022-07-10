
$fn=128;

bigGem();
translate([18,18,0]) smallGem();
translate([-18,18,0]) smallGem();

module smallGem() {
    scaledHalfSphere(4,4,3);
}
module bigGem() {   
    scaledHalfSphere(15,20,5);
}

module scaledHalfSphere(x,y,z) {
    scale([x,y,z]) intersection() { 
        sphere(r=1);
        translate([-1,-1,0]) cube([2,2,1]);
    }
}
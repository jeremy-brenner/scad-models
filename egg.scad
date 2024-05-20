// $fn=128;

// egg();

// module egg() {
// union() {
// intersection() {
//     scale([1,1.6]) circle(r=20);
//     translate([-20,0]) square([40,40]);
// }

// intersection() {
//     scale([1,1.1]) circle(r=20);
//     translate([-20,-40]) square([40,40]);
// }
// }
// }


module egg(diameter,height,ratioUpDown){
$fn = 120;
ray = diameter/2;
hDown = height/(ratioUpDown + 1) ;
hUp = height - hDown;
ratD = hDown / ray;
ratU = hUp / ray;
echo (hDown,hUp,ratD,ratU);
translate([0,0,hDown]){
difference(){scale([1,1,ratU]) sphere(ray);
translate([0,0,-height])
cylinder(d = height, h = height);
}
difference(){scale([1,1,ratD]) sphere(ray);
translate([0,0,0])
cylinder(d = height, h = height);
}
}
}
egg(45,60,1.55);

$fn=128;

egg();

module egg() {
union() {
intersection() {
    scale([1,1.6]) circle(r=20);
    translate([-20,0]) square([40,40]);
}

intersection() {
    scale([1,1.1]) circle(r=20);
    translate([-20,-40]) square([40,40]);
}
}
}
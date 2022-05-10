$fn=32;

strapPip();

module strapPip() {
  intersection() {
    sphere(r=5);
    cylinder(r=5,h=5);
  }
}
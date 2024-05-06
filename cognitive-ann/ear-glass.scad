
$fn=256;
h=30;
t=1.6;


module earGlass() {
  render() difference() {
    linear_extrude(height = t) difference() {
      fill() earProjection();
      offset(0.2) earProjection();
    }
    translate([-75,-100,-5]) import("Ear.L.Velcro.stl");
  }
}

module earProjection() {
  projection(cut = true) translate([-75,-100,-4]) import("Ear.L.Velcro.stl");
}


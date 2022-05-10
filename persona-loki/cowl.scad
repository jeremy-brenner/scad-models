cowl();

module cowl() {
  scale(0.9) {
    difference() {
      import("./persona-loki-cowl.stl");
      import("./persona-loki-ear.stl");
    }
  }
}

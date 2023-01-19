crystal();

module crystal() {
  color([1,1,1,0.5]) hull() {
    cube([50,21,2.5],center=true);
    cube([21,50,2.5],center=true);
    cube([9.2,9.2,22],center=true);
  }
}
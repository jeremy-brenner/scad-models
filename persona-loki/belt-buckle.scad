$fn=64;
t=4;

difference() {
  s=0.8;
  scale([s,1,1]) cylinder(r=22,h=t);
  translate([-1.5,0,-1]) scale([s,1,1]) cylinder(r=17.5,h=t+2);
  translate([-100,-50,-1]) cube([100,100,100]);
}

leg();
mirror([0,1,0]) leg();

translate([-16,-18.5,0]) cube([5,37,2]);


  
  
difference() {
  rotate([0,-8.4,0]) translate([-5,-2,0]) cube([18.8,4,2]);
  translate([-10,-5,-10]) cube([10,10,10]);
}


module leg() {
  ll=18;
  lcw=7;
  translate([-ll,24.4,0])
  difference() {
    translate([0,-lcw,0]) cube([ll,lcw,t]);
    translate([0,0,-1]) rotate([0,0,-7.5]) cube([ll*2,10,10]);
  }
}
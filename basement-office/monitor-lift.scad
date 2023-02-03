use <./monitors.scad>


//p = $t*2 < 1 ? $t*2 : 1-($t*2-1);
$fn=32;

p=0;

lift(p);

// cube([50,50,700]);

function angleFor(a,l1,l2) = asin((sin(a)*l1)/l2); 

module lift(p) {
  
  zh=12.5;

  lal=160;
  sal=lal*0.5;
  lhl=lal*0.5625;
  tal=lal*0.375;


  minSA=7;
  maxSA=66;
  sa=(maxSA-minSA)*p+minSA;

  la=angleFor(sa,sal,lhl);

  taMinA=angleFor(minSA,sal,lhl);
  // saOpp = sin(sa)*sal;
  // la=asin(saOpp/lhl);
  
  

  //taMinA=asin(sin(minA)*lal/tal);


  // minLA=7;
  // maxLA=55;
  // la=(maxLA-minLA)*p+minLA;




  translate([35,0,zh]) {
    arm(sal,sa);
    da=cos(la)*lhl;
    db=cos(sa)*sal;
    translate([da+db,0,0]) mirror([1,0,0]) arm(lal,la,lhl);

    arm(tal,0);
  }

  // da=cos(la)*lhl;
  // db=cos(sa)*sal;
  // translate([35+da+db,0,zh]) 
  //mirror([1,0,0]) 
  

//  translate([35+cos(la)*sal*2,5,zh]) mirror([1,0,0]) arm(lal,la);

//  translate([35,0,zh]) cube([10,10,sin(sa)*lal]);
  
  // taMinA=asin(sin(minA)*lal/tal);
  // taMaxA=70;
  // ta=(taMaxA-taMinA)*p+taMinA;

  // wal=140;

  // newA = asin( (sin(sa)*lal - sin(ta)*tal)/wal );

  // translate([12.5,0,zh]) {
  //   arm(tal,180-ta);
  //   translate([cos(ta)*-tal,0,sin(ta)*tal]) arm(140,newA);
  // }

  //translate([0,-75,0]) cube([430,150,50]);
  // cube([])
}

module arm(l,a,eh=0) {
  or=6;
  hr=3;
  color("blue") rotate([0,-a,0]) {
    difference() {
      union() {
        rotate([-90,0,0]) cylinder(r=or,h=5);
        translate([0,0,-or]) cube([l,5,or*2]);
        translate([l,0,0]) rotate([-90,0,0]) cylinder(r=or,h=5);
      }
      rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
      translate([l,0,0]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
      translate([eh,0,0]) rotate([-90,0,0]) translate([0,0,-0.1]) cylinder(r=hr,h=5.2);
    }
  }
}

module omen() {
  translate([0,0,300]) mirror([1,0,0]) rotate([0,0,90]) omenMonitor();
}
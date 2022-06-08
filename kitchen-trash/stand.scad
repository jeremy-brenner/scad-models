outerPoleD=190;
innerPoleD=75;
totalW=23;
poleR=6.9;
bottomR=20;

poleL=530;

t=1.6;
h=30;
view=true;
$fn=64;

//testPoleHole();

mount();

if(view==true) {
  poles();
  translate([0,0,poleL+10*2]) mirror([0,0,1]) mount();
  translate([0,poleR+t,140]) rotate([-90,-90,0]) can();
}

module mount() {
  color("gray") difference() {
    translate([-outerPoleD/2,-bottomR+poleR+t,0]) difference() {
      baseCyl(bottomR,outerPoleD,h);
      translate([0,0,-0.1]) baseCyl(bottomR-(poleR+t)*2,outerPoleD,h+0.2);
    }
    poles();
  }
}

module poles() {
  translate([-outerPoleD/2,0,10]) pole();
  translate([outerPoleD/2,0,10]) pole();

  translate([-innerPoleD/2,0,10]) pole();
  translate([innerPoleD/2,0,10]) pole();
}

module pole() {
  color("lightgray") cylinder(r=poleR, h=poleL);
}

module testPoleHole() {
  difference() {
    cylinder(r=poleR+1.6, h=10);
    translate([0,0,-0.1]) cylinder(r=poleR, h=10.2);
  }
}

module baseCyl(br,bd,h) {  
  cylinder(r=br,h=h);
  translate([0,-br,0]) cube([bd,br*2,h]);
  translate([bd,0,0]) cylinder(r=br,h=h);
}

module can() { 
  color("silver") {
    baseCyl(120,460-240,600-80);
    translate([280,0,15]) intersection() {
      cylinder(r=120,h=25);
      translate([120-90,-170/2,0]) cube([90,170,25]);
    }
  }
  translate([0,0,600-80]) color("gray") baseCyl(125,460-240,80);

}
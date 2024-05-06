spikeW=20;
spikeSideD=9;
spikeH=11;
postH=5;
$fn=32;

spikes();
// translate([0,0,-1]) color("black") cube([600,65,1]);

// translate([20,0,0]) spikes();
// translate([70,0,0]) spikes();
// translate([120,0,0]) spikes();
// post();

module spikes() {
  translate([0,spikeSideD,0]) spike();
  translate([0,65-spikeW-spikeSideD,0]) spike();
}

module spike() {
  // color("silver") rotate([0,0,45]) cylinder(r1=spikeR, r2=0.1,h=spikeH, $fn=4);
  color("silver") 
  difference() {
    hull() {
      cube([spikeW,spikeW,2]);
      translate([spikeW/2-0.25,spikeW/2-0.25,0]) cube([0.5,0.5,spikeH]);
    }
    translate([spikeW/2,spikeW/2,0]) post();
  }
}

module post() {
  hull() {
    translate([0,2,-0.1]) cylinder(r=2.5, h=postH);
    translate([0,-2,-0.1]) cylinder(r=2.5, h=postH);
  }
}
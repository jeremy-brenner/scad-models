use <./medal.scad>;
use <./medal_clip.scad>;
use <./medal_strap_clip.scad>;
use <./chest_ring.scad>;
use <./strap_pip.scad>;

$fn=64;

strapW=25;
clipT=2;
clipL=strapW+clipT*2;


rotate([0,0,45]) translate([-clipL/2,24,3.5]) {
  strap();
  translate([15,40,4]) strapPip();
}
rotate([0,0,135]) translate([-clipL/2,24,3.5]) {
  strap();
  translate([15,40,4]) strapPip();
}
rotate([0,0,225]) translate([-clipL/2,24,3.5]) {
  strap();
  medalStrapClip();
  translate([15,40,4]) strapPip();
}
rotate([0,0,315]) translate([-clipL/2,24,3.5]) {
  strap();
  medalStrapClip();
  translate([15,40,4]) strapPip();
}
chestRing();

translate([28,-66,9]) rotate([0,0,-90]) medal();
translate([32,66,9]) rotate([0,0,-90]) medal();

translate([50,-66,15]) medalClip(15);



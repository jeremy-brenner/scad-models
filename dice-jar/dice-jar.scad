use <voronoi_polygon.scad>

// border1 = [[362.13, 35.7], [388.01, 47.59], [409.81, 58.66], [427.16, 68.73],
//            [439.78, 77.62], [447.43, 85.19], [450.0, 91.29], [447.43, 95.84],
//            [439.78, 98.75], [427.16, 99.96], [409.81, 99.47], [388.01, 97.27],
//            [362.13, 93.41], [350.0, 60.5]];
// color([1,0,0]) linear_extrude(height = 1)
//     voronoi_polygon(border1);

// // negative blue box with no edging and some settings
// border2 = [[0,0], [-20,0], [-20,-20], [0,-20]];
// color([0,0,1]) linear_extrude(height = 2)
//     voronoi_polygon(border2, thickness=0.2, round=0.5, edging=0, seed=42);

// longer green shape


h=sqrt(3) *100;
w=2*100;

z=190.3;
// 37.4 + 100.8 = 138.2



 scale(0.35) {
 translate([0,0,z]) half(true);
 rotate([0,180,0]) translate([0,0,z]) half(false);
 }

module half(top) {
a1=37.4;
a2=41.8;
if(!top) {
  rotate([0,a1,0]) triangle();
} 
rotate([0,0,360/5]) rotate([0,a1,0]) triangle();
rotate([0,0,360/5*2]) rotate([0,a1,0]) triangle();
rotate([0,0,360/5*3]) rotate([0,a1,0]) triangle();
rotate([0,0,360/5*4]) rotate([0,a1,0]) triangle();


rotate([0,a1,0]) translate([h,0,0]) rotate([0,a2,0]) translate([h,0,0]) rotate([0,0,180]) triangle();
rotate([0,0,360/5]) rotate([0,a1,0]) translate([h,0,0]) rotate([0,a2,0]) translate([h,0,0]) rotate([0,0,180]) triangle();
 rotate([0,0,360/5*2]) rotate([0,a1,0]) translate([h,0,0]) rotate([0,a2,0]) translate([h,0,0]) rotate([0,0,180]) triangle();
 rotate([0,0,360/5*3]) rotate([0,a1,0]) translate([h,0,0]) rotate([0,a2,0]) translate([h,0,0]) rotate([0,0,180]) triangle();
 rotate([0,0,360/5*4])  rotate([0,a1,0]) translate([h,0,0]) rotate([0,a2,0]) translate([h,0,0]) rotate([0,0,180]) triangle();
}
// rotate([da,0,0]) triangle();


module triangle() {

border3=[[0,0],[h,w/2],[h,-w/2]];

translate([0,0,-4]) linear_extrude(height = 4)
    voronoi_polygon(border3, thickness=2.5, edging=5, round=2.5, n=45);
}
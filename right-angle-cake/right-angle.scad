/* [Graphics] */
graphicInfo=[["heart-panda.svg",0.25], ["cute-fox.svg",0.30]];

/* [Params] */

width=77;
height=178;
t=2;

graphic=0; // [0:"heart-panda", 1:"cute-fox"]

svgFile=graphicInfo[graphic][0];
svgScale=graphicInfo[graphic][1];


main(svgFile,svgScale);

module main(svgFile,svgScale) {
  translate([0,0,-t/2]) triangle([width,height,t]);
  translate([12,5,0]) color("orange") graphic(svgFile, svgScale);
  translate([0,0,-10]) cube([width,t,20]);
}


module graphic(image,_scale) {
  scale([_scale,_scale,1]) translate([0,0,-2]) linear_extrude(height = 4) import(image);
}

module triangle(d) {
  linear_extrude(height = d[2]) polygon(points=[[0,0],[d[0],0],[0,d[1]]], paths=[[0,1,2]],convexity=10);
}

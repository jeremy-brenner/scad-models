xDist=10000;
yDist=50;
yScale=50;

function map(x,m) = [ x, sin(x)*yScale+m ];
function reverse(list) = [ for (i = [len(list)-1:-1:0]) list[i] ];

wave1 = [ for (x = [0 : xDist] ) map(x,yDist/2) ];
wave2 = [ for (x = [0 : xDist] ) map(x,-yDist/2) ];

wave = concat(wave1,reverse(wave2));

for (x = [0 :floor(xDist/360) ]) translate([x*360+90,-33]) circle(r=yDist*0.75);
for (x = [0 :floor(xDist/360) ]) translate([x*360+270,33]) circle(r=yDist*0.75);

color("blue") translate([0,-yScale-yDist,-1]) square([xDist,(yScale+yDist)*2]);

translate([0,yScale+yDist-yDist/2]) square([xDist,yDist]);
translate([0,-yScale-yDist-yDist/2]) square([xDist,yDist]);
polygon( points=wave );

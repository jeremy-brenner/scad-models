//  linear_extrude(height = 10, center = true, convexity = 10, scale=[1,5], $fn=100)
//  translate([2, 0, 0])
//  circle(r = 1);


  linear_extrude(height = 10, center = true, convexity = 10, scale=3)
 translate([2, 0, 0])
 circle(r = 1);


  linear_extrude(height=1, scale=[0.1,0.1])
   translate([1,0,0]) circle(r=1, $fn=32);
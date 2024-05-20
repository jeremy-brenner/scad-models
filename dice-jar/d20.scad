phi = (1 + sqrt(5)) / 2;
x=10;
// 37.4 + 100.8 = 138.2
d20();
module d20() {
difference() {
rotate([31.7,0,0]) icosahedron();
halfNumbers([1,13,19,"9.",3,16,7,15,17,10]);
rotate([180,0,0]) halfNumbers([20,8,14,"6.",4,11,2,12,18,5]);
}
}
module halfNumbers(nums) {
rotate([-37,0,0]) rotate([0,0,180]) num(nums[0]);
rotate([-79.5,0,0]) num(nums[1]);
rotate([0,0,360/5]) {
rotate([-37,0,0]) rotate([0,0,180]) num(nums[2]);
rotate([-79.5,0,0]) num(nums[3]);
}
rotate([0,0,360/5*2]) {
rotate([-37,0,0]) rotate([0,0,180]) num(nums[4]);
rotate([-79.5,0,0]) num(nums[5]);
}
rotate([0,0,360/-5]) {
rotate([-37,0,0]) rotate([0,0,180]) num(nums[6]);
rotate([-79.5,0,0]) num(nums[7]);
}
rotate([0,0,360/-5*2]) {
rotate([-37,0,0]) rotate([0,0,180]) num(nums[8]);
rotate([-79.5,0,0]) num(nums[9]);
}
}
module num(n) {
translate([0,0,x*phi/2-1]) linear_extrude(height=1) text(text=str(n),size=3 ,valign = "center",halign = "center");
}
module icosahedron() {
hull() {
plane();
rotate([90,0,90]) plane();
rotate([0,90,90]) plane();
}
}
module plane() {
y=x*phi;
translate([-x/2,-y/2,-0.01]) cube([x,y,0.02]);
}

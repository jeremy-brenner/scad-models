outer($t) circle(5,$fn=6);

for ( i = [ 0.001 : 0.001 : 1 ] ) 
  color("black") 
    hull() {
      outer(i) 
        circle(1); 
      outer(i-0.001) 
        circle(1, $fn=3); 
    }

  

module outer(i) { 
  rotate(i*720) 
    translate([60,0]) 
      inner(i) 
        children();

}

module inner(i){
	rotate(i*720)
		translate([50,0])
			children();
}

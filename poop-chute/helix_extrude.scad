/*************************************************
/ Written by Simon Löffler 2020					 /
/												 /
/ This module lets you sweep a custom 2D Profile /
/ along a helical path.							 /
/ The profile is an array of points just like a	 /
/ polygon() [[x0,z0],[x1,z1],[x2,z2],...] where	 /
/ x=0 is at the radius of the helix.			 /
/ You can select out of 5 different modes to	 /
/ describe the helix.							 /
/												 /
/ +------+--------+--------+					 /
/ | mode | param1 | param2 |					 /
/ +------+--------+--------+					 /
/ | 1    | pitch  | height |					 /
/ | 2    | pitch  | turns  |					 /
/ | 3    | alpha  | height |					 /
/ | 4    | alpha  | turns  |					 /
/ | 5    | turns  | height |					 /
/ +------+--------+--------+					 /
/ |  alpha is helix angle  |					 /
/ +------------------------+					 /
*************************************************/

module helix_extrude(
	profile,
	radius,
	param1,
	param2,
	mode=1,
	fn=($fn==0?36:$fn)
){
    if(mode<0||mode>5)
		echo(str(
			"ERROR: There is no mode ",mode,"!"
		));

    if(profile==undef||len(profile)<3)
		echo(str(
			"ERROR: profile is missing!"
		));

    if(param1==undef)
		echo(str(
			"ERROR: param1 is missing!"
		));

    if(param2==undef)
		echo(str(
			"ERROR: param2 is missing!"
		));

    pitch=(
        mode==1?param1:(
            mode==2?param1:(
                mode==3?radius*2*tan(param1):(
                    mode==4?radius*2*tan(param1):(
                        mode==5?param2/param1:(
							undef
						)
                    )
                )
            )
        )
    );

    height=(
        mode==1?param2:(
            mode==2?pitch*param2:(
                mode==3?param2:(
                    mode==4?pitch*param2:(
                        mode==5?param2:(
							undef
						)
                    )
                )
            )
        )
    );

    points=[
        for(a=[0:360/fn:height/pitch*360])(
            for(p=[0:len(profile)-1])(
                let(x=0,y=x,z=1)[
                    (profile[p][x]+radius)*cos(a),
                    (profile[p][y]+radius)*sin(a),
                    profile[p][z]+a/360*pitch
                ]
            )
        )   
    ];

	n=len(profile);
	p=len(points);
	faces=[
        [for(point=[0:1:n-1])
            point
        ],
        for(point=[0:n:p-n-1])(
            for(side=[0:n-1])(
                let(offset1=point+side,offset2=n)[
                    offset1,
                    offset1+offset2,
                    (side==n-1?
                        offset1+1
                    :
                        offset1+offset2+1
                    ),
                    (side==n-1?
                        offset1-offset2+1
                    :
                        offset1+1
                    )
                ]
                
            )
        ),
        [for(point=[p-1:-1:p-n])
            point,
        ]
    ];

    polyhedron(points,faces,10);
}

// Example, please remove before use!
helix_extrude([[0,0],[sin(60),tan(30)],[0,1]],5,2,3.5);
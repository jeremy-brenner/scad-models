// https://blog.tommy.sh/posts/animation-easing-in-openscad/

// no easing, no acceleration
function linear(t) = (
    t
);

// accelerating from zero velocity
function ease_in_quad(t) = (
    pow(t, 2)
);

// decelerating to zero velocity
function ease_out_quad(t) = (
    t * (2 - t)
);

// acceleration until halfway, then deceleration
function ease_in_out_quad(t) = (
    t < .5
        ? 2 * pow(t, 2)
        : -1 + (4 - 2 * t) * t
);

// accelerating from zero velocity
function ease_in_cubic(t) = (
    pow(t, 3)
);

// decelerating to zero velocity
function ease_out_cubic(t) = (
    pow(t - 1, 3) + 1
);

// acceleration until halfway, then deceleration
function ease_in_out_cubic(t) = (
    t < .5
        ? 4 * pow(t, 3)
        : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1
);

// accelerating from zero velocity
function ease_in_quart(t) = (
    pow(t, 4)
);

// decelerating to zero velocity
function ease_out_quart(t) = (
    1 - (t - 1) * pow(t - 1, 3)
);

// acceleration until halfway, then deceleration
function ease_in_out_quart(t) = (
	t < .5
        ? .5 * pow(t / .5, 4)
	    : -.5 * (pow(t / .5 - 2, 4) - 2)
);

// accelerating from zero velocity
function ease_in_quint(t) = (
    pow(t, 5)
);

// decelerating to zero velocity
function ease_out_quint(t) = (
	pow((t - 1), 5) + 1
);

// acceleration until halfway, then deceleration
function ease_in_out_quint(t) = (
    t < .5
        ? .5 * pow(t / .5, 5)
        : .5 * (pow(t / .5 - 2, 5) + 2)
);
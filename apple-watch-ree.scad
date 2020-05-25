//module for body's skeleton
module corn(n, m){
polygon(points = [[7.18+n, 0+m], [6.65+n, 0.03+m], [6.13+n, 0.08+m], [5.62+n, 0.14+m], [5.11+n, 0.23+m], [4.61+n, 0.35+m], [4.13+n, 0.49+m], [3.67+n, 0.67+m], [3.23+n, 0.88+m], [2.81+n, 1.12+m], [2.42+n, 1.4+m], [2.05+n, 1.71+m], [1.71+n, 2.05+m], [1.4+n, 2.42+m], [1.12+n, 2.81+m], [0.88+n, 3.23+m], [0.67+n, 3.67+m], [0.5+n, 4.13+m], [0.35+n, 4.61+m], [0.23+n, 5.11+m], [0.13+n, 5.62+m], [0.08+n, 6.13+m], [0.03+n, 6.66+m], [0+n, 7.18+m], [7.18+n, 7.18+m]]);
}

//body
minkowski(){
    hull(){
    //[-y, -x] corner
    translate([-11.04, -14.07, 0]){
        rotate([0, 0, 0]){
            scale([0.268802, 0.268802, 1]) {
                linear_extrude(height = 0.001, center = true, convexity = 10, twist = 0){
                    corn(-7.18, -7.18);
                }
            }
        }
    }
    //[-y, +x] corner
    translate([11.04, -14.07, 0]){
        rotate([0, 0, 90]){
            scale([0.268802, 0.268802, 1]) {
                linear_extrude(height = 0.001, center = true, convexity = 10, twist = 0){
                    corn(-7.18, -7.18);
                }
            }
        }
    }
    //[+y, +x] corner
    translate([11.04, 14.07, 0]){
        rotate([0, 0, 180]){
            scale([0.268802, 0.268802, 1]) {
                linear_extrude(height = 0.001, center = true, convexity = 10, twist = 0){
                    corn(-7.18, -7.18);
                }
            }
        }
    }
    //[+y, -x] corner
    translate([-11.04, 14.07, 0]){
        rotate([0, 0, 270]){
            scale([0.268802, 0.268802, 1]) {
                linear_extrude(height = 0.001, center = true, convexity = 10, twist = 0){
                    corn(-7.18, -7.18);
                }
            }
        }
    }
    }
sphere(r = 10.5/2, $fn = 250);
}

//cube([36.44, 42.50, 10.5], center = true);
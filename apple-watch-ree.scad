//module for body's skeleton
module corn(n, m){
polygon(points = [[7.18+n, 0+m], [6.65+n, 0.06-0.04+m], [6.13+n, 0.10-0.03+m], [5.62+n, 0.16-0.02+m], [5.11+n, 0.24-0.01+m], [4.61+n, 0.35+m], [4.13+n, 0.49+m], [3.67+n, 0.67+m], [3.23+n, 0.88+m], [2.81+n, 1.12+m], [2.42+n, 1.4+m], [2.05+n, 1.71+m], [1.71+n, 2.05+m], [1.4+n, 2.42+m], [1.12+n, 2.81+m], [0.88+n, 3.23+m], [0.67+n, 3.67+m], [0.5+n, 4.13+m], [0.35+n, 4.61+m], [0.24-0.01+n, 5.11+m], [0.16-0.02+n, 5.62+m], [0.11-0.03+n, 6.13+m], [0.07-0.04+n, 6.66+m], [0+n, 7.18+m], [7.18+n, 7.18+m]]);
}

//body
module body(){
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
}

difference(){
    difference(){
        difference(){
            difference(){
                difference(){
                    body();
                    translate([0, 0, 3.86]){
                        cube([50, 50, 0.17], center = true);
                    }
                }
                translate([-36.44/2, -7.78, 0.55]){
                    rotate([0, 90, 0]){
                        scale([1.04, 1.04, 1.04]){
                            minkowski(){
                                cylinder(r = 2.5, h = 0.716619, $fn = 150, center = true);
                                sphere(r = 1.2, $fn = 150);
                            }
                        }
                    }
                }
            }
            speaker_bottom(0.2);
        }
        speaker_top(0.2);
    }
    mic(0.6);
}

//#cube([36.44, 42.50, 10.5], center = true);

//crown
translate([-36.44/2, -7.78, 0.55]){
    rotate([0, 90, 0]){
        minkowski(){
            cylinder(r = 2.45, h = 0.716619, $fn = 150, center = true);
            sphere(r = 1.2, $fn = 150);
        }
    }
}

//filling between the screen and body
translate([0, 0, 3.85202]){
    scale([0.90204, 0.916009, 1.1]){
        intersection(){
            body();
            cube([50, 50, 0.17], center = true);
        }
    }
}

//button on the side
module button_outline(){
    translate([-17.72, 6.49, 0]){
        cube([15, 6.8, 4.4], center = true);
    }
    translate([-17.72, 3.09, 0]){
        rotate([0, 90, 0]){
            cylinder(r = 2.2, h = 15, $fn = 300, center = true);
        }
    }
    translate([-17.72, 9.89, 0]){
        rotate([0, 90, 0]){
            cylinder(r = 2.2, h = 15, $fn = 300, center = true);
        }
    }
}

translate([-0.125, 0, 0]){
    intersection(){
        body();
        button_outline();
    }
}

//bottom speaker
module speaker_bottom(H){
    translate([16.17264, -9.375, -4.16]){
        rotate([0, -37.59142, 0]){
            cube([0.85, 3.2, H], center = true);
            translate([0, 1.605, 0]){
                cylinder(r = 0.425, center = true, h = H, $fn = 300);
            }
            translate([0, -1.605, 0]){
                cylinder(r = 0.425, center = true, h = H, $fn = 300);
            }
        }
    }
    translate([16.17264, -9.375, -4.16]){
        rotate([0, -37.59142, 0]){
            scale([0.6/0.85, 0.9, 2]){
                cube([0.85, 3.2, H + 0.4], center = true);
            }
            scale([0.6/0.85, 0.9, 2]){
                translate([0, 1.605, 0]){
                    cylinder(r = 0.425, center = true, h = H + 0.4, $fn = 300);
                }
            }
            scale([0.6/0.85, 0.9, 2]){
                translate([0, -1.605, 0]){        
                    cylinder(r = 0.425, center = true, h = H + 0.4, $fn = 300);
                }
            }
        }
    }
}

//top speaker
module speaker_top(H){
    translate([17.97818, -9.375, -1.575]){
        rotate([0, -72.5422, 0]){
            cube([0.85, 3.2, H], center = true);
            translate([0, 1.605, 0]){          
                cylinder(r = 0.425, center = true, h = H, $fn = 300);
            }
            translate([0, -1.605, 0]){
                cylinder(r = 0.425, center = true, h = H, $fn = 300);
            }
        }
    }
    translate([17.97818, -9.375, -1.575]){
        rotate([0, -72.5422, 0]){
            scale([0.6/0.85, 0.9, 2]){
                cube([0.85, 3.2, H + 0.4], center = true);
            }
            scale([0.6/0.85, 0.9, 2]){
                translate([0, 1.605, 0]){
                    cylinder(r = 0.425, center = true, h = H + 0.4, $fn = 300);
                }
            }
            scale([0.6/0.85, 0.9, 2]){
                translate([0, -1.605, 0]){
                    cylinder(r = 0.425, center = true, h = H + 0.4, $fn = 300);
                }
            }
        }
    }
}

//mic
module mic(H){
    translate([17.278, 0, -3]){
        rotate([0, -55.15, 0]){
            translate([0, 9.05, 0]){                    
                    cylinder(r = 1.3/2, center = true, h = H, $fn = 300);
            }
        }
    }
    translate([17.278, 0, -3]){
        rotate([0, -55.15, 0]){
            translate([0, 9.05, 0]){
                scale([1/1.3, 1/1.3, 1.3]){
                    cylinder(r = 1.3/2, center = true, h = H + 1.2, $fn = 300);
                }
            }
        }
    }
}
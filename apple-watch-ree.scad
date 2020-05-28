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
                    difference(){
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
                        translate([0, 0, -0.001]){
                            plus_y_band_release_button();
                        }
                    }
                    translate([0, 0, -0.001]){
                        minus_y_band_release_button();
                    }
                }
                plus_y_bandslot();
            }
            minus_y_bandslot();
        }
        plus_y_bandslot_gap(0.5);
    }
    minus_y_bandslot_gap(0.3);
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

translate([-0.42, 0, 0]){
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

//band release buttons
module band_release_button(){
    translate([2.88, 0, 0]){
        cylinder(r = 1.02, h = 1, center = true, $fn = 100);
    }
    translate([-2.88, 0, 0]){
        cylinder(r = 1.02, h = 1, center = true, $fn = 100);
    }
    cube([5.76, 2.04, 1], center = true);
}

//-y band release button
module minus_y_band_release_button(){
    intersection(){
        body();
        translate([0, -17.72, -4.9607]){
            rotate([-19.124, 0, 0]){
                band_release_button();
            }
        }
    }
}

intersection(){
    body();
    translate([0, -17.72, -4.9607]){
        rotate([-19.124, 0, 0]){
            scale([0.97, 0.94, 0.94]){
                band_release_button();
            }
        }
    }
}

//+y band release button
module plus_y_band_release_button(){
    intersection(){
        body();
        translate([0, 17.72, -4.9607]){
            rotate([19.124, 0, 0]){
                band_release_button();
            }
        }
    }
}

intersection(){
    body();
    translate([0, 17.72, -4.9607]){
        rotate([19.124, 0, 0]){
            scale([0.97, 0.94, 0.94]){
                band_release_button();
            }
        }
    }
}

//sensor
rotate([180, 0, 0]){
    difference(){
        difference(){
            translate([0, 0, -5.68]){
                sphere(r = 17.46095, $fn = 400);
            }
            translate([0, 0, 152.959021829]){
                sphere(r = 147.379846641, $fn = 100);
            }
        }
        translate([0, 0, -9.7504]){
            cube([50, 50, 30], center = true);
        }
    }
}
//layer_1
rotate([180, 0, 0]){
	difference(){
        difference(){
            translate([0, 0, -5.68]){
                sphere(r = 17.50095, $fn = 400);
            }
            translate([0, 0, 152.959021829]){
                sphere(r = 147.779846641, $fn = 100);
            }
        }
        translate([0, 0, -9.7504]){
            cube([50, 50, 30], center = true);
        }
    }
}
//layer_2
rotate([180, 0, 0]){
    difference(){
        difference(){
            translate([0, 0, -5.68]){
                sphere(r = 17.52095, $fn = 400);
            }
            translate([0, 0, 152.959021829]){
                sphere(r = 148.179846641, $fn = 100);
            }
        }
        translate([0, 0, -9.7504]){
            cube([50, 50, 30], center = true);
        }
    }
}
intersection(){
    translate([0, 0, 70.42501168]){
        sphere(r = 77.6350166, $fn = 800);
    }
    translate([0, 0, -6]){
        cylinder(r = 12.84, h = 10, $fn = 100, center = true);
    }
}
//fill
translate([0, 0, -3]){
	cylinder(r = 13.6932, h = 4.5, $fn = 300, center = true);
}

//-y bandslot
module minus_y_bandslot(){
    translate([0, -20.86, -1.99]){
        rotate([-60, 0, 0]){
            cube([40, 3.2, 4.81], center = true);
        }
    }
    translate([0, -20.86+2.083, -1.99+1.2025]){
        rotate([0, 90, 0]){
            cylinder(r = 3.2/2, h = 40, $fn = 150, center = true);
        }
    }
}

//+y bandslot
module plus_y_bandslot(){
    rotate([0, 0, 180]){
        translate([0, -20.86, -1.99]){
            rotate([-60, 0, 0]){
                cube([40, 3.2, 4.81], center = true);
            }
        }
        translate([0, -20.86+2.083, -1.99+1.2025]){
            rotate([0, 90, 0]){
                cylinder(r = 3.2/2, h = 40, $fn = 150, center = true);
            }
        }
    }
}

//-y bandslot gap
module minus_y_bandslot_gap(H){
    rotate([0, 0, 180]){
        intersection(){
            translate([0, 17, -4.9607]){
                rotate([-30, 0, 0]){
                    scale([0.67945, 1.17945, 25]){
                        band_release_button();
                    }
                }
            }
            translate([0, 16, -H]){
                rotate([-20, 0, 0]){
                    cube([20, 20, 3.2], center = true);
                }   
            }
        }
    }
}

//+y bandslot gap
module plus_y_bandslot_gap(H){
    intersection(){
        translate([0, 17, -4.9607]){
            rotate([-30, 0, 0]){
                scale([0.67945, 1.17945, 25]){
                    band_release_button();
                }
            }
        }
        translate([0, 16, -H]){
            rotate([-20, 0, 0]){
                cube([20, 20, 3.2], center = true);
            }
        }
    }
}
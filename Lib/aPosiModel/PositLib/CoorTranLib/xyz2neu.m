%void commonmodel::wgs2stnxyz(double refxyz[],double dwgsxyz[],double stnxyz[])
function [neu,R] = xyz2neu(refxyz, xx)
    r =  xx - refxyz;
	%blh=xyz2blh(refxyz);
    [lat,lon,h] = xyz2ell(refxyz(1),refxyz(2),refxyz(3));
    blh(1)=lat;
    blh(2)=lon;
    blh(3)=h;
% 	    r[0]=wgsxyz[0]-refxyz[0];
% 	    r[1]=wgsxyz[1]-refxyz[1];
% 		r[2]=wgsxyz[2]-refxyz[2];
    R = [-sin(blh(1))*cos(blh(2))   -sin(blh(1))*sin(blh(2))      cos(blh(1))
        -sin(blh(2))                  cos(blh(2))                      0                       
        cos(blh(1))*cos(blh(2))   cos(blh(1))*sin(blh(2))        sin(blh(1))];
    neu = R * r';
    neu = neu';
	%neu(1) = -sin(blh(1))*cos(blh(2))*r(1)  -sin(blh(1))*sin(blh(2)) *r(2)  +cos(blh(1))  *r(3);
	%neu(2) = -sin(blh(2))            *r(1)  + cos(blh(2))            *r(2)                     ;
	%neu(3) = cos(blh(1))*cos(blh(2)) *r(1)  + cos(blh(1))*sin(blh(2))*r(2)  +sin(blh(1))  *r(3);
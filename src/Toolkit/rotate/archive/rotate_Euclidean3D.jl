"""
Rotate a vector around X, Y, and Z axes by angles A1, A2, and A3 in radian.
Note: the number of dimensions of the input point array must be the same 
as that of the center.
For example, if input `point` is a vector, then the `center` must also be a vector.
If input `point` is a matrix, then the `center` must be a matrix with a single row.
The implementation of `rotate()` takes advantage Julia's broadcasting arithmetic feature.

Arguments
----------
:Euclidean3D
    first argument must be Euclidean3D

point::Array
    coordinate of a point 

angles::Array
    rotation angles around X, Y, and Z

center::Array
    (optional) keyword arguments. If not set, the the zero vector (same length as the input)
    is assumed.
"""
function rotate(::Type{Euclidean3D}, point::Array, angles::Array; center::Array=[])
    if length(center) == 0
        center = zeros(length(point))
    end

    if issubtype(typeof(point[1]),Array)
        return [rotate(Euclidean3D, item, angles; center=center) for item in point]
    end 

    @debug @assert length(size(point)) == length(size(center))

    a, b, c = angles # shorthand aliases

    # rotation matrix around the X axis
    R_x = [1.     0.     0.;
           0. cos(a) -sin(a);
           0. sin(a)  cos(a)]

    # rotation matrix around the Y axis
    R_y = [ cos(b)   0. sin(b);
                0.   1.     0.;
           -sin(b)   0. cos(b);]

    # rotation matrix around the Z axis
    R_z = [cos(c) -sin(c) 0.;
           sin(c)  cos(c) 0.;
               0.      0. 1.;]
    if length(center) == 0
        return R_z * R_y * R_x * point
    else 
        println("points ", point)
        println("points shifted ", point .- center)
        println("angles deg. ", rad2deg(angles))
        return (R_z * R_y * R_x * (point .- center)) .+ center
    end
end
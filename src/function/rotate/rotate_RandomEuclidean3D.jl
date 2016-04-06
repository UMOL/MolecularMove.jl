"""
Rotate a vector around X, Y, and Z axes by random angles A1, A2, and A3 in radian.

Arguments
----------
:Euclidean3D
    first argument must be RandomEuclidean3D

point::Array
    coordinate of a point 

center::Array
    (optional) keyword arguments. If not set, the the zero vector (same length as the input)
    is assumed.

seed=0::Integer
    (keyword) seed for the random number generator. If not set, 
    the default seed of the random number generator will be used.
"""
function rotate(::Type{RandomEuclidean3D}, point::Array; center::Array=[], seed::Integer=0)
    if seed != 0
        srand(seed)
    end

    angles = 2 * pi * rand(3)
    return rotate(Euclidean3D, point, angles; center=center)
end

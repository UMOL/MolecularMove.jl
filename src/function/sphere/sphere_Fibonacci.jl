"""
Create a spherical grid using the Fibonacci algorithm
and return an `iterator` object that returns a function 
each time which will transform the input coordinate
to a Fibonacci point on the sphere.

Note that the input coordinate 
can be one of the three cases:
(1) 1D vector; 
(2) 2D matrix; 
(3) 1D array of vectors.

Arguments
-------------
:Type{Fibonacci}
    must be type ``Fibonacci``

count:Integer
    number of grid points on the sphere

radius:AbstractFloat
    radius of the sphere

center=Float64[]:Array{Real,1}
    (keyword) center of the sphere
"""
function sphere(::Type{Fibonacci}, count::Integer, radius::Real; center::AbstractArray=Float64[])
    delta_phi = pi * (3. - sqrt(5.)) # incremental Fibonacci angle
    delta_z = 2./count * radius # increment along Z
    z_start = radius - delta_z/2.

    function Fibonacci_point(i::Integer)
        # note: Julia's has one-based indexing
        z = z_start - (i - 1) * delta_z
        r = sqrt(radius * radius - z * z)
        phi = (i - 1) * delta_phi 
        return [r*cos(phi), r*sin(phi), z]
    end

    return make_spherical_move_iterator(Fibonacci_point, count, center)
end

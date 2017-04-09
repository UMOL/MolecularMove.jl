"""
Create a partial spherical grid using the Fibonacci algorithm
and return an `iterator` object that returns a function 
each time which will transform the input coordinate
to a Fibonacci point on the sphere.
The partial sphere is bounded by ``zmax`` and ``zmin``.

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
    number of points on the partial sphere

radius:Real
    radius of the sphere

zmin:Real
    lower bound along Z

zmax:Real
    upper bound along Z

center=Float64[]:Array{Real,1}
    (keyword) center of the sphere
"""
function sphere(::Type{PartialFibonacci}, count::Integer, radius::Real,
    zmin::Real, zmax::Real;
    center::AbstractArray=Float64[])
    Zmax = min(radius, zmax)
    Zmin = max(-radius, zmin)
    N = round(Int, count*2*radius/(Zmax - Zmin)) # total number of points
    delta_phi = pi * (3. - sqrt(5.)) # incremental Fibonacci angle
    delta_z = (2. * radius)/N # increment along Z
    z_start = radius - delta_z/2.
    i_offset = floor(Int, (radius - Zmax)/delta_z)

    function Fibonacci_point(i::Integer)
        # note: Julia's has one-based indexing
        id = i + i_offset
        z = z_start - (id - 1) * delta_z
        r = sqrt(radius * radius - z * z)
        phi = (id - 1) * delta_phi 
        return [r*cos(phi), r*sin(phi), z]
    end

    return make_move_iterator(Fibonacci_point, count, center)
end

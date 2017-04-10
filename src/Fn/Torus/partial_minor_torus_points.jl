import ...Toolkit: @debug, make_move_iterator
import ...Types: PartialFibonacci
using Base.Test

"""
Create a partial torus-shaped grid using the Fibonacci algorithm
and return an `iterator` object that returns a function 
each time which will transform the input coordinate
to a Fibonacci point on the torus.
The partial torus is bounded by ``zmax`` and ``zmin``.

Note that the input coordinate 
can be one of the three cases:
(1) 1D vector; 
(2) 2D matrix; 
(3) 1D array of vectors.

Arguments
-------------
:Type{Fibonacci}
    must be type ``Fibonacci``

number:Integer
    number of points on the partial torus

radius:Real
    radius of the torus

a:Real
    major radius of the ellipse

b:Real
    minor radius of the ellipse

zmin:Real
    lower bound along Z

zmax:Real
    upper bound along Z

center=Float64[]:Array{AbstractFloat,1}
    (keyword) center of the torus
"""
function torus{T<:AbstractFloat}(
    ::Type{PartialFibonacci};
    number::Integer=0,
    radius::Real=0,
    a::Real=0.0,
    b::Real=0.0,
    zmin::Real=0.0,
    zmax::Real=0.0,
    center::Array{T,1}=Float64[]
    )
    Zmax = min(b, zmax)
    Zmin = max(-b, zmin)
    N = round(Int, number*2*b/(Zmax - Zmin)) # total number of points
    delta_phi = pi * (3. - sqrt(5.)) # incremental Fibonacci angle
    delta_z = (2.0 * b)/N # increment along Z
    z_start = b - delta_z/2.
    i_offset = floor(Int, (b - Zmax)/delta_z)

    function point(i::Integer)
        # note: Julia's has one-based indexing
        id = i + i_offset
        z = z_start - (id - 1) * delta_z
        r = a * sqrt(1.0 - (float(z)/b)^2) + radius
        phi = (id - 1) * delta_phi 
        return [r*cos(phi), r*sin(phi), z]
    end

    return make_move_iterator(point, number, center)
end

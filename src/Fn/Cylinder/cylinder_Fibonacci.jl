import ...Types: Fibonacci
import ...Toolkit: make_move_iterator


"""
Make a cylinder.

Arguments
-------------
:Type{Fibonacci}
    must be type ``Fibonacci``

number:Integer
    number of points on the cylinder

radius:Real
    radius of the cylinder

zmin:Real
    lower bound along Z

zmax:Real
    upper bound along Z

center=Float64[]:Array{Real,1}
    (keyword) center of the cylinder
"""
function cylinder{T<:AbstractFloat}(
    ::Type{Fibonacci};
    number::Integer=0,
    radius::Real=0.0,
    zmin::Real=0.0,
    zmax::Real=0.0,
    center::Array{T,1}=Float64[]
    )
    Zmax = min(radius, zmax)
    Zmin = max(-radius, zmin)
    N = round(Int, number*2*radius/(Zmax - Zmin)) # total number of points
    delta_phi = pi * (3. - sqrt(5.)) # incremental Fibonacci angle
    delta_z = (2. * radius)/N # increment along Z
    z_start = radius - delta_z/2.
    i_offset = floor(Int, (radius - Zmax)/delta_z)

    function Fibonacci_cylinder_point(i::Integer)
        # note: Julia's has one-based indexing
        id = i + i_offset
        z = z_start - (id - 1) * delta_z
        r = radius
        phi = (id - 1) * delta_phi 
        return [r*cos(phi), r*sin(phi), z]
    end

    return make_move_iterator(Fibonacci_cylinder_point, number, center)
end

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
    number of grid points

radius:AbstractFloat
    radius of the sphere
"""
function sphere(::Type{Fibonacci}, count::Integer, radius::AbstractFloat)
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

    function transform(index::Integer, coordinate::Array)
        #=
            developer's note:
            `coordinate` will be used as the center of the
            Fibonacci sphere. (Yuhang Wang 04/10/2015) 
        =#
        if length(coordinate) == 0
            @debug print_with_color(:red, "WARNING! input coordinate is an empty array\n\n")
            return coordinate
        end 

        if issubtype(typeof(coordinate[1]), Array)
            return [transform(index, item) for item in coordinate]
        else
            if length(size(coordinate)) == 1 
                @debug @assert length(coordinate) == 3 # must be 3D
                return Fibonacci_point(index) + coordinate
            else # 2D matrix
                @debug @assert length(size(coordinate)) == 2
                @debug @assert size(coordinate)[2] == 3
                return transpose(Fibonacci_point(index)) .+ coordinate
            end
        end
    end

    return FunctionalMoveIterator(generator=transform, length=count) 
end
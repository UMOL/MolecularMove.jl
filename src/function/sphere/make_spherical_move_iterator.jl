"""
Return an iterator of functions that move a point or array of points to the surface of a sphere.

Arguments
------------
fn_sphere_point:Function
    a function that returns the point on the sphere

count:Integer
    number of grid points on the sphere
center:Array{Real,1}
    center of the sphere 
"""
function make_spherical_move_iterator{T<:Real}(fn_sphere_point::Function, count::Integer, center::Array{T})

    function transform(index::Integer, coordinate::Array)
        if length(coordinate) == 0
            @debug print_with_color(:red, "WARNING! input coordinate is an empty array\n\n")
            return coordinate
        end 

        # translate the target point in space to a new location on the sphere
        if issubtype(typeof(coordinate[1]), Array)
            return [transform(index, item) for item in coordinate]
        else
            if length(size(coordinate)) == 1 # 1D array
                @debug @assert length(coordinate) == 3 # must be 3D
                if length(center) > 0
                    @debug @assert length(coordinate) == length(center)
                    return fn_sphere_point(index) + coordinate + center
                else
                    return fn_sphere_point(index) + coordinate
                end
            else # 2D matrix
                shape = size(coordinate)
                @debug @assert length(shape) == 2
                @debug @assert shape[2] == 3
                if length(center) > 0
                    print("center", center)
                    @debug @assert length(coordinate[1,:]) == length(center)
                    return transpose(fn_sphere_point(index)) .+ coordinate .+ transpose(center)
                else
                    return transpose(fn_sphere_point(index)) .+ coordinate
                end
            end
        end
    end

    return FunctionalMoveIterator(generator=transform, length=count) 
end
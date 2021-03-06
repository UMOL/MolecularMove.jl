import ...Types: Euclidean1D, FunctionalMoveIterator
import ...Toolkit: @debug


"""
Make a 1D grid of points.

Arguments
-----------
direction:Array{AbstractFloat,1}
    direction of the grid

spacing:Number  
    spacing between two neighboring grid points

number:Integer
    number of grid points
"""
function grid{T<:AbstractFloat}(
    ::Type{Euclidean1D};
    direction::Array{T,1}=[1.0, 0, 0],
    spacing::Number=1.0,
    number::Integer=0
    )
    motion_vector = direction / norm(direction,2) * spacing

    function transform(index::Integer, coordinate::Array)
        if length(coordinate) == 0
            @debug print_with_color(:red, "WARNING! input coordinate is an empty array\n\n")
            return coordinate
        end 

        if issubtype(typeof(coordinate[1]), Array)
            return [transform(index, item) for item in coordinate]
        else
            @debug @assert length(motion_vector) == length(coordinate)
            return motion_vector * (index - 1) + coordinate
        end
    end 
    
    return FunctionalMoveIterator(generator=transform, length=number)
end

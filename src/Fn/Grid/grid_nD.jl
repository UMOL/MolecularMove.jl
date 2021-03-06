import ...Types: Euclidean
import ...Toolkit: @debug

"""
Make a n-dimensional grid of points.

Arguments
-----------
:Type{Euclidean}
    Euclidean

directions:Array{Array,1}
    directions of the grid for each dimension 

spacings:Array{AbstractFloat,1}
    spacings between two neighboring grid points for each dimension

numbers:Array{Int,1}
    number of grid points for each dimension

center:Array{AbstractFloat,1}
    center of the final grid
"""
function grid{T<:AbstractFloat}(
    ::Type{Euclidean};
    directions::Array{Array{T,1},1}=[],
    spacings::Array{T,1}=[1.0, 1.0, 1.0],
    numbers::Array{Int,1}=[0, 0, 0],
    center::Array{T,1}=[0.0, 0.0, 0.0])
    @debug @assert length(numbers) == length(spacings)
    @debug @assert length(numbers) == length(directions)
    @debug @assert length(numbers) == length(center)

    # get offset
    grid_sizes = spacings .* (numbers - 1)
    grid_center = grid_sizes / 2.0
    center_offset = center - grid_center

    if length(numbers) == 0
        @debug print_with_color(:red, "WARNING! length(numbers) must > 0 [from grid()]\n\n")
        return FunctionalMoveIterator(length=0)
    elseif length(numbers) == 1
        return grid(Euclidean1D, directions[1], spacings[1], numbers[1])
    end

    dimension_count = length(numbers)
    motion_vectors = [directions[i] / norm(directions[i],2) * spacings[i] for i = 1 : dimension_count]

    counts_tuple = tuple(numbers...)
    function transform(index::Integer, coordinate::Array)
        if length(coordinate) == 0
            @debug print_with_color(:red, "WARNING! input coordinate is an empty array\n\n")
            return coordinate
        end 

        if issubtype(typeof(coordinate[1]), Array)
            return [transform(index, item) for item in coordinate]
        else
            # must use tuple form of numbers
            # otherwise ind2sub will return wrong results
            tuple_index = ind2sub(counts_tuple, index)
            for i = 1 : dimension_count
                @debug @assert length(motion_vectors[i]) == length(coordinate)
                coordinate += motion_vectors[i] * (tuple_index[i] - 1)
            end
            return coordinate + center_offset
        end
    end 
    
    return FunctionalMoveIterator(generator=transform, length=prod(numbers))
end

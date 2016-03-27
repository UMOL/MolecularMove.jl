"""
Make a n-dimensional grid of points.

Arguments
-----------
directions:Array{Array,1}
    directions of the grid for each dimension 

spacings:Tuple
    spacings between two neighboring grid points for each dimension

counts:Tuple
    number of grid points for each dimension 
"""
function grid(directions::Array, spacings::Tuple, counts::Tuple)
    @debug @assert length(counts) == length(spacings)
    @debug @assert length(counts) == length(directions)

    if length(counts) == 0
        @debug print_with_color(:red, "WARNING! length(counts) must > 0 [from grid()]\n\n")
        return FunctionalMoveIterator(length=0)
    elseif length(counts) == 1
        return grid(Euclidean1D, directions[1], spacings[1], counts[1])
    end

    dimension_count = length(counts)
    motion_vectors = [directions[i] / norm(directions[i],2) * spacings[i] for i = 1 : dimension_count]

    function transform(index::Integer, coordinate::Array)
        if length(coordinate) == 0
            @debug print_with_color(:red, "WARNING! input coordinate is an empty array\n\n")
            return coordinate
        end 

        if issubtype(typeof(coordinate[1]), Array)
            return [transform(index, item) for item in coordinate]
        else
            tuple_index = ind2sub(counts, index)
            for i = 1 : dimension_count
                @debug @assert length(motion_vectors[i]) == length(coordinate)
                coordinate += motion_vectors[i] * (tuple_index[i] - 1)
            end
            return coordinate
        end
    end 
    
    return FunctionalMoveIterator(generator=transform, length=prod(counts))
end

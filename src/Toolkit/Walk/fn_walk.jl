import ..Debug: @debug
import ...Types: Euclidean


"""
Translate a point or many points to a new location.

Arguments
---------
::Type{Euclidean}
    Euclidean

point::Array
    an n-dimensional point, or array of points

by:Array
    a vector representing the translation 
"""
function walk(::Type{Euclidean}, point::Array, by::Array)
    if length(point) == 0
        @debug println("WARNING! input point is empty array (from walk())")
        return point
    end

    if issubtype(typeof(point[1]), Array)
        return [walk(Euclidean, item, by) for item in point]
    else
        if length(point) == length(by)
            return point + by
        else
            @debug println("ERROR HINT: walk(point, by) two argument vectors must have the same length\n\n")
            @debug println(string(string(length(point)), " != ", string(length(by))))
            return point
        end
    end
end
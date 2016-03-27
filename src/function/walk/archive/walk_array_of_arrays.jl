"""
This version of ``walk()`` will work with
array of arrays.

Arguments
-----------
point_array::Array{Array{AbstractFloat,1}}
    an n-dimensional point 

by:Array
    a vector representing the translation 
"""
function walk(point_array::Array{Array,1},by::Array)
    return [walk(point,by) for point in point_array]
end
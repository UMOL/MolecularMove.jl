"""
Return the element type of the output.

Arguments
------------
:FunctionalMoveIterator 
    data type 
"""
function Base.eltype(::Type{FunctionalMoveIterator })
    return Function
end

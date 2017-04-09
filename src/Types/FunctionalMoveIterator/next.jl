"""
Returns the current item and the next state (index of the next output)

Arguments
-----------
iter:FunctionalMoveIterator
    target object 

index::Integer 
    index of the current output 
"""
function Base.next(iter::FunctionalMoveIterator, index::Integer)
    generator = obtain(iter, :generator)
    return (coordinate)->generator(index, coordinate), index + 1
end

"""
Check whether the iteration is done.

Arguments
--------------
iter:FunctionalMoveIterator
    target object

index:Integer
    current state
"""
function Base.done(iter::FunctionalMoveIterator, index::Integer)
    return index > obtain(iter, :length)
end

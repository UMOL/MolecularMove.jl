"""
Return the initial state, which is the starting index (i.e., 1)

Arguments
---------
iter:FunctionalMoveIterator
    target object
"""
function Base.start(iter::FunctionalMoveIterator)
    return 1
end

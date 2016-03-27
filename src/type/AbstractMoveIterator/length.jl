"""
Define length() for ``AbstractMoveIterator``.
"""
function Base.length(iter::AbstractMoveIterator)
    return obtain(iter, :length)
end

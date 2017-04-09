"""
A getter function for type ``AbstractMoveIterator``.
See the definition of ``AbstractMoveIterator`` for 
available fields.

Arguments
----------
obj:AbstractMoveIterator
    input 

field:Symbol 
    target field name 
"""
function obtain(obj::AbstractMoveIterator, field::Symbol)
    if field in fieldnames(obj)
        return getfield(obj, field)
    end
end


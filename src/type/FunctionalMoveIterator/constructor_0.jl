"""
Constructor for ``FunctionalMoveIterator`` with keyword arguments.

Arguments
-------------
generator:Function
    generator function for the next item 

length:Integer
    total number of items to be generated
"""
function FunctionalMoveIterator(;generator::Function=()->nothing, length::Integer=0)
    return FunctionalMoveIterator(generator, length)
end

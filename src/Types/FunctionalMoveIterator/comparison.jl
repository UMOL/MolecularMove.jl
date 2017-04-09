import Base.==

"""
Define the meaning of "==" operator for type FunctionalMoveIterator 

Arguments 
----------
obj1:FunctionalMoveIterator 
    An instance of type FunctionalMoveIterator.

obj2:FunctionalMoveIterator 
    Another instance of type FunctionalMoveIterator.
"""
function ==(obj1::FunctionalMoveIterator, obj2::FunctionalMoveIterator)
    for field in fieldnames(obj1)
        value1 = getfield(obj1, field)
        value2 = getfield(obj2, field)

        if value1 != value2
            return false
        end

    end
    return true
end

"""
``FunctionalMoveIterator`` yields a series of functions that transform the input coordinate.
It has the following fields:

+------------------------+-------------------------------------+-------------------------------------------------+
| name                   | type                                | note                                            |
+========================+=====================================+=================================================+
| generator              | Function                            | a function that generates the transform-function|
+------------------------+-------------------------------------+-------------------------------------------------+
| length                 | Integer                             | length of the series of points to be generated  |
+------------------------+-------------------------------------+-------------------------------------------------+
"""
immutable FunctionalMoveIterator <: AbstractMoveIterator
    generator::Function
    length::Integer
end
include("constructor_0.jl")
include("start.jl")
include("next.jl")
include("done.jl")
include("eltype.jl")
"""
``Move`` module provides tools for moving
(translating, rotating, ...) molecules
"""
module MolecularMove

using MolecularDataType

export AbstractPointIterator
export Euclidean1D, Euclidean2D, Euclidean3D
export RandomEuclidean3D
export walk, rotate, grid

macro debug(expression)
    return :($expression)
    # return nothing
end

include(joinpath("type", "Euclidean", "all.jl"))   
include(joinpath("type", "AbstractMoveIterator", "AbstractMoveIterator.jl"))   
include(joinpath("type", "FunctionalMoveIterator", "FunctionalMoveIterator.jl"))   

include(joinpath("function", "walk", "all.jl"))
include(joinpath("function", "rotate", "all.jl"))
include(joinpath("function", "grid", "all.jl"))
end
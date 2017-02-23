"""
``Move`` module provides tools for moving
(translating, rotating, ...) molecules
"""
module MolecularMove

using MolecularDataType

export AbstractMoveIterator
export Euclidean1D, Euclidean2D, Euclidean3D
export RandomEuclidean3D
export Fibonacci, PartialFibonacci
export walk, rotate, grid, sphere, cylinder

macro debug(expression)
    return :($expression)
    # return nothing
end

include(joinpath("type","all.jl"))
include(joinpath("function","all.jl"))
end
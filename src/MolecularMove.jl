"""
``Move`` module provides tools for moving
(translating, rotating, ...) molecules
"""
module MolecularMove

using MolecularDataType

export AbstractPointIterator
export Euclidean1D, Euclidean2D, Euclidean3D
export RandomEuclidean3D
export Fibonacci
export walk, rotate, grid, sphere

macro debug(expression)
    return :($expression)
    # return nothing
end

include(joinpath("type","all.jl"))
include(joinpath("function","all.jl"))
end
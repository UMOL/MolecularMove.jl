"""
``AbstractMoveIterator`` is the
parent type for all iterators that yield
a series of points.
"""
abstract AbstractMoveIterator

include("obtain.jl")
include("length.jl")

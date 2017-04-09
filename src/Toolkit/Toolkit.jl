module Toolkit

include("debug.jl")
include("move", "all.jl")
include("rotate", "all.jl")
include("walk", "all.jl")

export @debug
export walk, rotate, make_move_iterator
end
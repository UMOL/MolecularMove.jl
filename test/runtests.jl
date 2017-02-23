using Base.Test
include("params.jl")
include("print_dashed_line.jl")

if !isdefined(:MolecularMove)
    include(joinpath("..", "src", "MolecularMove.jl"))
end
using MolecularMove


# include(joinpath("function", "walk", "runtests.jl"))
# include(joinpath("function", "rotate", "runtests.jl"))
# include(joinpath("function", "grid", "runtests.jl"))
# include(joinpath("function","sphere","runtests.jl"))
include(joinpath("function","cylinder","runtests.jl"))

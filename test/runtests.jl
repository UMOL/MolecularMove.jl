using Base.Test

if !isdefined(:MolecularMove)
    include(joinpath("..", "src", "MolecularMove.jl"))
end
using MolecularMove


# include(joinpath("function", "walk", "runtests.jl"))
# include(joinpath("function", "rotate", "runtests.jl"))
include(joinpath("function", "grid", "runtests.jl"))

using Base.Test
include(joinpath("Common", "Common.jl"))
include(joinpath("TestTorus", "TestTorus.jl"))
include(joinpath("TestCylinder", "TestCylinder.jl"))
include(joinpath("TestGrid", "TestGrid.jl"))

if !isdefined(:MolecularMove)
    include(joinpath("..", "src", "MolecularMove.jl"))
end


import .TestTorus
import .TestCylinder
import .TestGrid


TestTorus.test()
TestCylinder.test()
TestGrid.test()
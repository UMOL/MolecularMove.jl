using Base.Test
include(joinpath("Common", "Common.jl"))
include(joinpath("TestTorus", "TestTorus.jl"))
include(joinpath("TestCylinder", "TestCylinder.jl"))

if !isdefined(:MolecularMove)
    include(joinpath("..", "src", "MolecularMove.jl"))
end


import .TestTorus
import .TestCylinder


TestTorus.test()
TestCylinder.test()

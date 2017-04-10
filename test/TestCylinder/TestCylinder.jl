module TestCylinder
include("Test1.jl")

import .Test1

function test()
    Test1.test()
end

export test
end
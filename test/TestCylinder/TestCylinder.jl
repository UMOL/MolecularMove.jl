module TestCylinder
include("Test1.jl")
include("Test2.jl")
include("Test3.jl")

import .Test1
import .Test2
import .Test3

function test()
    Test1.test()
    Test2.test()
    Test3.test()
end

export test
end
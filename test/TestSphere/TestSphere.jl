module TestSphere
include("Test1.jl")
include("Test2.jl")
include("Test3.jl")
include("Test4.jl")
include("Test5.jl")
include("Test6.jl")

import .Test1
import .Test2
import .Test3
import .Test4
import .Test5
import .Test6

function test()
    Test1.test()
    Test2.test()
    Test3.test()
    Test4.test()
    Test5.test()
    Test6.test()
end

export test
end
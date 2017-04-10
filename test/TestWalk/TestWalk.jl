module TestWalk
include("Test1.jl")
include("Test2.jl")
include("Test3.jl")

function test()
    Test1.test()
    Test2.test()
    Test3.test()
end

export test
end
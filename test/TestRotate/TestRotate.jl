module TestRotate
include("Test1.jl")
include("Test2.jl")
include("Test3.jl")
include("Test4.jl")
include("Test5.jl")
include("Test6.jl")
include("Test7.jl")

function test()
    Test1.test()
    Test2.test()
    Test3.test()
    Test4.test()
    Test5.test()
    Test6.test()
    Test7.test()
end

export test
end
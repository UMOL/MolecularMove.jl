"""
A test for sphere(Fibonacci,...).

Arguments
----------
test_vector:Array 
     a 3D test vector 

count:Integer
    number of grid points

radius:AbstractFloat
    radius of the sphere 

solution:Array
    answer key

msg="":AbstractString
  (optional) test message

center=[]:Array
  (keyword) center of the sphere 
"""
function test_sphere_Fibonacci(test_vector::Array, count::Integer, radius::AbstractFloat, solution::Array, msg::AbstractString=""; center::Array=[])
    println("-------------------------------------")
    print_with_color(:blue, "Test sphere(Fibonacci, $(count))\n\n")

    if msg != ""
      print_with_color(:blue, "$(msg)\n\n")
    end

    if length(center) == 0
      @time answer = vcat([transform(test_vector) for transform in sphere(Fibonacci, count, radius)]...)
    else
      @time answer = vcat([transform(test_vector) for transform in sphere(Fibonacci, count, radius; center=center)]...)
    end

    for i in length(solution) 
        @test_approx_eq answer[i] solution[i]
    end
    print_with_color(:green, "VERIFIED!\n\n")
    println("-------------------------------------")
end

include("unit_test_1_sphere_Fibonacci.jl")
include("unit_test_2_sphere_Fibonacci.jl")
include("unit_test_3_sphere_Fibonacci.jl")


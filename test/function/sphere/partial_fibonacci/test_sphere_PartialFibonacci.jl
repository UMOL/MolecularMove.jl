"""
A test for sphere(PartialFibonacci,...).

Arguments
----------
test_vector:AbstractArray 
     a 3D test vector 

count:Integer
    number of grid points

radius:AbstractFloat
    radius of the sphere 

zmin:Real
  lower bound along Z

zmax:Real
  upper bound along Z

solution:Array
    answer key

msg="":AbstractString
  (optional) test message

center=[]:Array
  (keyword) center of the sphere 
"""
function test_sphere_PartialFibonacci(test_vector::AbstractArray, 
  count::Integer, radius::AbstractFloat, 
  zmin::Real, zmax::Real,
  solution::Array, msg::AbstractString=""; center::Array=[])
    println("-------------------------------------")
    print_with_color(:blue, "Test sphere(PartialFibonacci, $(count))\n\n")

    if msg != ""
      print_with_color(:blue, "$(msg)\n\n")
    end

    if length(center) == 0
      @time answer = vcat([transform(test_vector) for transform in sphere(PartialFibonacci, count, radius, zmin, zmax)]...)
    else
      @time answer = vcat([transform(test_vector) for transform in sphere(PartialFibonacci, count, radius, zmin, zmax; center=center)]...)
    end

    for i in length(solution) 
        @test_approx_eq answer[i] solution[i]
    end
    print_with_color(:green, "VERIFIED!\n\n")
    println("-------------------------------------")
end

include("unit_test_1_sphere.jl")
include("unit_test_2_sphere.jl")
include("unit_test_3_sphere.jl")


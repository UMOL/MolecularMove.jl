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
"""
function test_Fibonacci_sphere(test_vector::Array, count::Integer, radius::AbstractFloat, solution::Array)
    println("-------------------------------------")
    print_with_color(:blue, "Test sphere(Fibonacci, $(count))\n\n")
    answer = [transform(test_vector) for transform in sphere(Fibonacci, count, radius)]
    for i in length(solution) 
        @test_approx_eq answer[i] solution[i]
    end
    print_with_color(:green, "VERIFIED!\n\n")
    println("-------------------------------------")
end

test_Fibonacci_sphere([0.,0.,0.], 5, 10.,
    Array[[ 6.,                 0.,               8.],
        [-6.758097397797128,  6.190970809322855,  4.],
        [ 0.874257247169599, -9.961710408648278,  0.],
        [ 5.576434272376702,  7.27347102873604,  -4.],
        [-5.908280911892572, -1.04509170227587,  -8.]])
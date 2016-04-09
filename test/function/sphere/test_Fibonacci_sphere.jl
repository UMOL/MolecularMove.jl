"""
A test for sphere(Fibonacci,...).

Arguments
----------
count:Integer
    number of grid points

solution:Array
    answer key
"""
function test_Fibonacci_sphere(count::Integer, solution::Array)
    println("-------------------------------------")
    print_with_color(:blue, "Test sphere(Fibonacci, $(count))\n\n")
    answer = sphere(Fibonacci, count)
    @test_approxe_eq answer solution
    print_with_color(:green, "VERIFIED!\n\n")
    println("-------------------------------------")
end

test_Fibonacci_sphere(2,[(3.883222077450933,0.0),(7.766444154901866,1.5707963267948966)])
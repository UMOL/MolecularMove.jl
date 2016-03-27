"""
A test for grid(Euclidean1D, direction, spacing, count).

Arguments
----------
test_vector:Array 
    a test vector or array of vectors

direction:Array
    direction of the grid

spacing:Number 
    spacing between two neighboring grid points

count:Integer
    number of grid points

solution:Array
    answer key
"""
function test_grid_1D(test_vector::Array, direction::Array, spacing::Number, count::Integer, solution::Array)
    println("----------------------------------")
    print_with_color(:blue, "Test grid(Euclidean1D, ...)\n\n")

    answer = [transform(test_vector) for transform in grid(Euclidean1D, direction, spacing, count)]

    @test answer == solution

    print_with_color(:green, "VERIFIED! grid(Euclidean1D, ...)\n\n")
    println("----------------------------------")

    return true
end 

test_grid_1D([0., 0., 0.], [1., 1., 1.], sqrt(3), 3, Array[[0., 0., 0],[1., 1., 1.], [2., 2., 2.]])
test_grid_1D(Array[[0., 0., 0.],[0., 0., 0.]], [1., 1., 1.], sqrt(3), 3, 
        Array[
            Array[[0., 0., 0.],[0., 0., 0.]],
            Array[[1., 1., 1.],[1., 1., 1.]],
            Array[[2., 2., 2.],[2., 2., 2.]],
        ]
)

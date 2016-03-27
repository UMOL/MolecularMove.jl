"""
A test for grid(directions, spacings, counts).

Arguments
----------
test_vector:Array 
    a test vector or array of vectors

directions:Array
    directions of the grid for each dimension

spacings:Tuple
    spacings between two neighboring grid points for each dimension

counts:Tuple
    number of grid points along the two dimensions

solution:Array
    answer key
"""
function test_grid_nD(test_vector::Array, directions::Array, spacings::Tuple, counts::Tuple, solution::Array)
    println("----------------------------------")
    print_with_color(:blue, "Test n-D grid(...)\n\n")

    answer = [transform(test_vector) for transform in grid(directions, spacings, counts)]

    @test answer == solution

    print_with_color(:green, "VERIFIED! n-D grid(...)\n\n")
    println("----------------------------------")

    return true
end 

test_grid_nD([0., 0., 0.], 
    Array[[1., 0., 0.], [0., 1., 0.], [0., 0., 1.]], 
    (1., 1., 1.), 
    (2,2,2), 
    Array[
        [0., 0., 0.],
        [1., 0., 0.], 
        [0., 1., 0.], 
        [1., 1., 0.], 
        [0., 0., 1.], 
        [1., 0., 1.], 
        [0., 1., 1.], 
        [1., 1., 1.], 
    ])

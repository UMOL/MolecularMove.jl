"""
A test for translate an array of points.

Arguments
---------
point:Array{Array{AbstractFloat,1},1}
    the coordinate of a point

by:Array{AbstractFloat,1}
    translation vector

solution:Array{AbstractFloat,1}
    answer key

msg="":AbstractString
    optional test message
"""
function test_walk_array_of_arrays(
    point_array::Array{Array,1},
    by::Array,
    solution::Array{Array,1},
    msg::AbstractString="")

    println("------------------------------------------")
    print_with_color(:blue, "Test walk() for array of arrays\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    answer = walk(point_array, by)

    @test answer == solution


    println("------------------------------------------")
    print_with_color(:green, "VERIFIED! walk() for array of arrays\n")

end

test_walk_array_of_arrays(Array[[1., 0., 0.]], [1., 0., 0.], Array[[2., 0., 0.]], "test 1-array")
test_walk_array_of_arrays(Array[[1., 0., 0.],[0.,1.,1.]], [1., 0., 0.], Array[[2., 0., 0.],[1.,1.,1.]], "test 2-array")

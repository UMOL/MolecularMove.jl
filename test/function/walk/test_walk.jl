"""
A test for ``walk()``.

Arguments
---------
point:Array{AbstractFloat,1}
    the coordinate of a point

by:Array{AbstractFloat,1}
    translation vector

solution:Array{AbstractFloat,1}
    answer key

msg="":AbstractString
    optional test message
"""
function test_walk(
    point::Array,
    by::Array,
    solution::Array,
    msg::AbstractString="")

    println("------------------------------------------")
    print_with_color(:blue, "Test walk()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    answer = walk(point, by)

    @test answer == solution


    println("------------------------------------------")
    print_with_color(:green, "VERIFIED! walk()\n")

end

test_walk([1., 0., 0.], [1., 0., 0.], [2., 0., 0.], "test 1")
test_walk([1., 1., 0.], [1., 1., 0.], [2., 2., 0.], "test 2")
test_walk([1., 1., 1.], [1., 1., 1.], [2., 2., 2.], "test 3")
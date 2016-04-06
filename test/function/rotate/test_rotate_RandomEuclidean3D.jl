"""
A test for rotate(:RandomEuclidean3D,...).

Arguments
----------
point::Array
    the coordinate of a point

seed::Integer
    seed to the random number generator 

solution::Array
    answer key

msg:AbstractString
    optional test message

args:
    optional arguments 
"""
function test_rotate_RandomEuclidean3D(
    point::Array,
    seed::Integer,
    solution::Array,
    msg::AbstractString="",
    args...)

    println("------------------------------------------")
    print_with_color(:blue, "Test rotate_3D_Euclidean()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    if length(args) == 0
        answer = rotate(RandomEuclidean3D, point;seed=seed)
    else
        answer = rotate(RandomEuclidean3D, point; seed=seed, center=args[1])
    end

    @test_approx_eq answer solution

    println("------------------------------------------")
    print_with_color(:green, "VERIFIED! rotate_3D_Euclidean()\n")

    return true
end

test_rotate_RandomEuclidean3D([1., 0., 0.], 123, [0., 1., 0.], "test 1")
test_rotate_RandomEuclidean3D([0., 1., 0.], 123, [0., 0., 1.], "test 2")
test_rotate_RandomEuclidean3D([0., 0., 1.], 123, [1., 0., 0.], "test 3")
test_rotate_RandomEuclidean3D([1., 0., 0.], 123, [1., 0., 0.], "test 4 change center", [1., 0., 0])

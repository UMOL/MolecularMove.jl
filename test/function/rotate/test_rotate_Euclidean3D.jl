"""
A test for rotate(:Euclidean3D).

Arguments
----------
point::Array
    the coordinate of a point

angles::Array
    the rotation angles in radian (a 3-element-vector)

solution::Array
    answer key

msg:AbstractString
    optional test message

args:
    optional arguments 
"""
function test_rotate_Euclidean3D(
    point::Array,
    angles::Array,
    solution::Array,
    msg::AbstractString="",
    args...)

    println("------------------------------------------")
    print_with_color(:blue, "Test rotate(Euclidean3D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    if length(args) == 0
        answer = rotate(Euclidean3D, point, angles)
    else
        answer = rotate(Euclidean3D, point, angles; center=args[1])
    end

    @test_approx_eq answer solution

    println("------------------------------------------")
    print_with_color(:green, "VERIFIED! rotate(Euclidean3D,...)\n")

    return true
end

test_rotate_Euclidean3D([1., 0., 0.], [0., 0., pi/2.],  [0., 1., 0.], "test 1")
test_rotate_Euclidean3D([0., 1., 0.], [pi/2., 0., 0.],  [0., 0., 1.], "test 2")
test_rotate_Euclidean3D([0., 0., 1.], [0., pi/2., 0.],  [1., 0., 0.], "test 3")
test_rotate_Euclidean3D([1., 0., 0.], [0., 0., pi/2.],  [1., 0., 0.], "test 4 change center", [1., 0., 0])

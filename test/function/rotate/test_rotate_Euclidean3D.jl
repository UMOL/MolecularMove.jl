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

    print_dashed_line(80)
    print_with_color(:blue, "Test rotate(Euclidean3D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    if length(args) == 0
        answer = rotate(Euclidean3D, point, angles)
    else
        answer = rotate(Euclidean3D, point, angles; center=args[1])
    end

    for i in 1:length(solution)
        @test_approx_eq_eps answer[i] solution[i] 1e-16
    end

    print_dashed_line(80)
    print_with_color(:green, "VERIFIED! rotate(Euclidean3D,...)\n")

    return true
end

include("unit_tests_rotate.jl")
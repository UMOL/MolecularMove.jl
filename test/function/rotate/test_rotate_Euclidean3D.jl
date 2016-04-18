"""
A test for rotate(Euclidean3D, ...).

Arguments
----------
:Euclidean3D
    first argument must be Euclidean3D

input:AbstractArray
    coordinate of the input vector

ref_axis:AbstractArray 
    a vector around which the input vector will be rotated

theta::AbstractFloat
    rotation angle with respect to the ``ref_axis``

solution::AbstractArray
    answer key

msg:AbstractString
    (optional) test message

center::AbstractArray
    (keyword) If not set, the the zero vector (same length as the input)
    is assumed.
"""
function test_rotate(::Type{Euclidean3D},
    input::AbstractArray,
    ref_axis::AbstractArray,
    angle::AbstractFloat,
    solution::AbstractArray,
    msg::AbstractString="";
    center::AbstractArray=[])

    print_dashed_line(80)
    print_with_color(:blue, "Test rotate(Euclidean3D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    if length(center) == 0
        answer = rotate(Euclidean3D, input, ref_axis, angle)
    else
        answer = rotate(Euclidean3D, input, ref_axis, angle; center=center)
    end

    for i in 1:length(solution)
        @test_approx_eq_eps answer[i] solution[i] 1e-16
    end

    print_dashed_line(80)
    print_with_color(:green, "VERIFIED! rotate(Euclidean3D,...)\n")

    return true
end

include("unit_tests_rotate.jl")
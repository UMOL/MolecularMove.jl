"""
A test for rotate(:RandomEuclidean3D,...).

Arguments
----------
Arguments
----------
:RandomEuclidean3D
    first argument must be RandomEuclidean3D

input::AbstractArray
    input vector

solution::Array
    answer key

tol_near_zero=1e-7:AbstractFloat
    (optional) tolerance for being close to zero

max_iteration=1000:Integer
    (optional) maximum number of iterations for generating a non-zero reference axis vector 

center::AbstractArray
    (keyword) If not set, the the zero vector (same length as the input)
    is assumed.

seed=0::Integer
    (keyword) seed for the random number generator. If not set, 
    the default seed of the random number generator will be used.

msg:AbstractString
    (keyword) test message
"""
function test_rotate(::Type{RandomEuclidean3D},
    input::AbstractArray, solution::AbstractArray,
    tol_near_zero::AbstractFloat=1e-7, max_iteration::Integer=1000; 
    center::AbstractArray=[], seed::Integer=0,
    msg::AbstractString="")

    print_dashed_line(80)
    print_with_color(:blue, "Test rotate(RandomEuclidean3D,...)\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n")
    end

    @time answer = rotate(RandomEuclidean3D, input, tol_near_zero, max_iteration; seed=seed, center=center)

    for i = 1:length(solution)
        @test_approx_eq answer[i] solution[i]
    end
    println("typeof(answer) ", typeof(answer)) ##
    print_dashed_line(80)
    print_with_color(:green, "VERIFIED! rotate(RandomEuclidean3D,...)\n")

    return true
end

test_rotate(RandomEuclidean3D, [1., 0., 0.], 
    [0.6388464155251986,0.053677073000939435,0.7674594642094507],
    seed=123, center=[], msg="test 1")

test_rotate(RandomEuclidean3D, Array[[1., 0., 0.]], 
    Array[[0.6388464155251986,0.053677073000939435,0.7674594642094507]],
    seed=123, center=[], msg="test 2")

test_rotate(RandomEuclidean3D, Array[[1., 0., 0.],[-1.,0.,0.]], 
    Array[
        [0.6388464155251986,0.053677073000939435,0.7674594642094507],
        -[0.6388464155251986,0.053677073000939435,0.7674594642094507],
        ],
    seed=123, center=[0.,0.,0.], msg="test 3")

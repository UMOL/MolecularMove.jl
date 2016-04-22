"""
Rotate a vector around a random reference vector by a random angle.

Arguments
----------
:RandomEuclidean3D
    first argument must be RandomEuclidean3D

input::AbstractArray
    input vector

tol_near_zero=1e-7:AbstractArray
    tolerance for being close to zero

max_iteration=1000:Integer
    maximum number of iterations for generating a non-zero reference axis vector 

center::AbstractArray
    (keyword) If not set, the the zero vector (same length as the input)
    is assumed.

seed=0::Integer
    (keyword) seed for the random number generator. If not set, 
    the default seed of the random number generator will be used.
"""
function rotate(::Type{RandomEuclidean3D}, 
    input::AbstractArray,
    tol_near_zero::AbstractFloat=1e-7, max_iteration::Integer=1000; 
    center::AbstractArray=[], seed::Integer=0)
    
    if seed != 0
        rotate(RandomEuclidean3D, seed)
    end

    theta = 2 * pi * rand() # rotation angle

    ref_axis = zeros(3)
    for i = 1:max_iteration
        ref_axis = rand(3)
        if norm(ref_axis, 2) > tol_near_zero
            break
        end
    end

    if length(input) == 0
        return Array{AbstractFloat,1}()
    else
        data_type = typeof(input[1])
    end
    return Array{data_type,1}(rotate(Euclidean3D, input, ref_axis, theta; center=center))
end

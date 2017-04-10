import ...Types: RandomEuclidean3D

"""
Rotate a vector around a random reference vector by a random angle.

Arguments
----------
:RandomEuclidean3D
    first argument must be RandomEuclidean3D

input::AbstractArray
    input vector

tol=1e-7:AbstractFloat
    (keyword) tolerance for being close to zero

max_iter=1000:Integer
    (keyword) maximum number of iterations for generating a non-zero reference axis vector 

center=[]::Array{AbstractFloat, 1}
    (keyword) If not set, the the zero vector (same length as the input)
    is assumed.
"""
function rotate{T<:AbstractFloat}(
    ::Type{RandomEuclidean3D}, 
    input::AbstractArray;
    tol::T=1e-7,
    max_iter::Integer=1000,
    center::Array{T,1}=[]
    )


    theta = 2 * pi * rand() # rotation angle

    ref_axis = zeros(3)
    for i = 1:max_iter
        ref_axis = rand(3)
        if norm(ref_axis, 2) > tol
            break
        end
    end

    if length(input) == 0
        return Array{AbstractFloat,1}()
    else
        data_type = typeof(input[1])
    end
    return Array{data_type,1}(rotate(Euclidean3D, input;
        ref=ref_axis, theta=theta, center=center))
end

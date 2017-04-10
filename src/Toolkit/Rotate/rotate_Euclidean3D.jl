import ...Types: Euclidean3D
import ..Debug: @debug

"""
Rotate a vector around X, Y, and Z axes by angles A1, A2, and A3 in radian.
Note: the number of dimensions of the input input array must be the same 
as that of the center.
For example, if input is a vector, then the `center` must also be a vector.

This implementation uses 
``Rodrigues formula`` for rotation around an arbitrary axis::
     
    Reference:
    James M.van Verth & Lars M. Bishop 
    "Essentital mathematics for games & interactive applications"
    Morgan Kaufmann (2008) chapter 4. page 148

Arguments
----------
:Euclidean3D
    first argument must be Euclidean3D

input:AbstractArray
    coordinate of the input vector

ref=[]:Array{AbstractFloat,1}
    (keyword) a vector around which the input vector will be rotated

theta=0.0::AbstractFloat
    (keyword) rotation angle with respect to the ``ref``

center=[]::Array{AbstractFloat,1}
    (keyword) If not set, the the zero vector (same length as the input)
    is assumed.
"""
function rotate{T1<:AbstractFloat, T2<:AbstractFloat}(
    ::Type{Euclidean3D},
    input::AbstractArray;
    ref::Array{T1,1}=[], 
    theta::AbstractFloat=0.0,
    center::Array{T2,1}=[]
    )

    if length(input) == 0
        return input 
    end

    if issubtype(typeof(input[1]), AbstractArray)
        return [
            rotate(Euclidean3D, item;
                ref=ref, theta=theta, center=center) for item in input]
    end 

    # make unit length ref. axis vector
    length_of_ref_axis = norm(ref, 2)
    @debug assert(length_of_ref_axis > 0)
    ref = ref ./ length_of_ref_axis 

    @debug @assert length(input) == 3 
    @debug @assert length(ref) == 3 

    #---------------------------------------
    # shorthand aliases
    #---------------------------------------
    x, y, z = ref
    c = cos(theta) 
    s = sin(theta)
    t = 1 - c
    #---------------------------------------

    R = [(t*x*x + c) (t*x*y - s*z) (t*x*z + s*y);
         (t*x*y + s*z) (t*y*y + c) (t*y*z - s*x);
         (t*x*z - s*y) (t*y*z + s*x) (t*z*z + c)]

    if length(center) == 0
        return R * input
    else 
        @debug @assert length(center) == 3
        return (R * (input - center)) + center
    end
end
import ...Types: RandomEuclidean3D


"""
Set the seed for rotate(RandomEuclidean3D,...).

Arguments
---------
seed:Integer
    seed
"""
function rotate(::Type{RandomEuclidean3D}, seed::Integer)
    srand(seed)
end
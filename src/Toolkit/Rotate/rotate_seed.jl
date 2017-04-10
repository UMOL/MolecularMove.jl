"""
Set the seed for rotate(RandomEuclidean3D,...).

Arguments
---------
seed:Integer
    seed
"""
function rotate_seed(seed::Integer)
    srand(seed)
end
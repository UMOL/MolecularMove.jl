module Test8
import MolecularMove: rotate, rotate_seed, RandomEuclidean3D
import ...Common: test_operation

function test()
    rotate_seed(1000)
    test_operation(
        rotate,
        RandomEuclidean3D,
        [[[1.0, 0.0, 0.0]]],
        Dict(
            :tol => 1e-7,
            :max_iter => 1000,
            :center => [0.0, 0.0, 0.0],
        ),
        [[[0.135158,-0.0214758,0.990591]]],
        "Rotate Test8: random rotation for nested arrays")
end

end
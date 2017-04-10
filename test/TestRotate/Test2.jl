module Test2
import MolecularMove: rotate, Euclidean3D
import ...Common: test_operation

function test()
    test_operation(
        rotate,
        Euclidean3D,
        [0.0, 1.0, 0.0],
        Dict(
            :ref => [1.0, 0.0, 0.0],
            :theta => pi/2,
            :center => [0.0, 0.0, 0.0],
        ),
        [0.0, 0.0, 1.0],
        "Rotate Test2")
end

end
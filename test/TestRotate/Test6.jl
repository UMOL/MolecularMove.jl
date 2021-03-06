module Test6
import MolecularMove: rotate, Euclidean3D
import ...Common: test_operation

function test()
    test_operation(
        rotate,
        Euclidean3D,
        [1.0, 0.0, 0.0],
        Dict(
            :ref => [0.0, 0.0, 1.0],
            :theta => pi/2,
            :center => [1.0, 0.0, 0.0],
        ),
        [1.0, 0.0, 0.0],
        "Rotate Test6: change center")
end

end
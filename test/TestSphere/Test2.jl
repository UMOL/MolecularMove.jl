module Test2
import MolecularMove: sphere, Fibonacci
import ...Common: test_assemble_points

function test()
    test_assemble_points(
        sphere,
        Fibonacci,
        [[0., 0., 0.]],
        Dict(
            :number => 5,
            :radius => 10.0,
        ),
        [
         [6.                , 0.               , 8.],
         [-6.758097397797128,  6.190970809322855,  4.],
         [ 0.874257247169599, -9.961710408648278,  0.],
         [ 5.576434272376702,  7.27347102873604 , -4.],
         [-5.908280911892572, -1.04509170227587 , -8.],
        ],
        "Sphere test 2")
end

end
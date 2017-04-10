module Test3
import MolecularMove: grid, Euclidean
import ...Common: test_assemble_points

function test()
    test_assemble_points(
        grid,
        Euclidean,
        [[0., 0., 0.]],
        Dict(
            :directions => [[1., 0., 0.], [0., 1., 0.], [0., 0., 1.]],
            :spacings => [1.0, 1.0, 1.0],
            :numbers => [2, 2, 2],
        ),
        [
            [0., 0., 0.],
            [1., 0., 0.], 
            [0., 1., 0.], 
            [1., 1., 0.], 
            [0., 0., 1.], 
            [1., 0., 1.], 
            [0., 1., 1.], 
            [1., 1., 1.], 
        ]-0.5,
        "Grid1D test 3")
end

end
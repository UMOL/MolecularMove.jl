module Test1
import MolecularMove: grid, Euclidean1D
import ...Common: test_assemble_points

function test()
    test_assemble_points(
        grid,
        Euclidean1D,
        [[0., 0., 0.]],
        Dict(
            :direction => [1.0, 1.0, 1.0],
            :spacing => sqrt(3),
            :number => 3,
        ),
        Array[[0., 0., 0],[1., 1., 1.], [2., 2., 2.]],
        "Grid1D test 1")
end

end
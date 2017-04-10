module Test5
import MolecularMove: sphere, PartialFibonacci
import ...Common: test_assemble_points

function test()
    test_assemble_points(
        sphere,
        PartialFibonacci,
        [[0.0, 0.0, 0.0]],
        Dict(
            :number => 5,
            :radius => 10.0,
            :zmin => -5.0,
            :zmax => 5.0,
        ),
        [
            [ 0.757128985491524, -8.627094279033271,  5.],
            [ 5.804136811532121,  7.570468669310885,  3.],
            [-9.797775470383256, -1.733088523981437,  1.],
            [ 8.395259183305276, -5.340376695058919, -1.],
            [-2.476467233021272,  9.212334668463361, -3.],
        ],
        "Sphere test 5")
end

end
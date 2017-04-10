module Test3
import MolecularMove: walk, Euclidean
import ...Common: test_fn

function test()
    test_fn(
        walk,
        Euclidean,
        [[1.0, 0.0, 0.0], [0, 0, 1.0]],
        [[1.0, 0.0, 0.0]],
        [[2.0, 0.0, 0.0], [1.0, 0, 1.0]],
        "Walk Test3")
end

end
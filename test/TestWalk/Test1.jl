module Test1
import MolecularMove: walk, Euclidean
import ...Common: test_fn

function test()
    test_fn(
        walk,
        Euclidean,
        [1.0, 0.0, 0.0],
        [[1.0, 0.0, 0.0]],
        [2.0, 0.0, 0.0],
        "Walk Test1")
end

end
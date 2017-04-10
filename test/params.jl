"""
TestParams module contains all the parameters
"""
module TestParams
export data_dir

"""
Define the data directory.
"""
function data_dir()
    return joinpath(pwd(),"..", "data")
end

end
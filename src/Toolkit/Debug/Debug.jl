module Debug
macro debug(expression)
    # return eval(:($expression))
    return nothing
end
export @debug
end

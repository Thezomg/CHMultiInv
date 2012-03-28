proc(_multiinv_add_group, @world, @group,
    assign(@id, concat('thezomg.multiinv.worlds.', to_lower(@world)))
    store_value(@id, to_lower(@group))
)

proc(_multiinv_remove_group, @world,
    assign(@id, concat('thezomg.multiinv.worlds.', to_lower(@world)))
    clear_value(@id)
)

proc(_multiinv_get_group, @world,
    assign(@id, concat('thezomg.multiinv.worlds.', to_lower(@world)))
    return(get_value(@id))
)

proc(_multiinv_is_same_group, @from, @to,
    assign(@gfrom, _multiinv_get_group(@from))
    assign(@gto, _multiinv_get_group(@to))
    return(@gfrom != null && @gto != null && @gfrom == @gto)
)
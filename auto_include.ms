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

proc(_multiinv_store_data, @enabled, @key,
    if(@enabled['inv'], assign(@data['inv'], pinv()))
    if(@enabled['food'], assign(@data['food'], pfood()))
    if(@enabled['health'], assign(@data['health'], pinfo()[5]))
    if(@enabled['exp'], assign(@data['exp'], ptexp()))
    if(@enabled['mode'], assign(@data['mode'], pmode()))
    if(@enabled['onfire'], assign(@data['onfire'], ponfire()))
    
    store_value(@key, @data)
)

proc(_multiinv_set_data, @enabled, @key,
    assign(@data, get_value(@key))
    
    if(is_array(@data),
        if(@enabled['inv'] && 
        array_index_exists(@data, 'inv') &&
        !has_permission(player(), 'thezomg.multiinv.bypass.inv'), 
            set_pinv(@data['inv'])
        )
        
        if(@enabled['food'] && 
        array_index_exists(@data, 'food') &&
        !has_permission(player(), 'thezomg.multiinv.bypass.food'), 
            set_pfood(@data['food'])
        )
        
        if(@enabled['health'] && 
        array_index_exists(@data, 'health') &&
        !has_permission(player(), 'thezomg.multiinv.bypass.health'), 
            set_phealth(@data['health'])
        )
        
        if(@enabled['exp'] && 
        array_index_exists(@data, 'exp') &&
        !has_permission(player(), 'thezomg.multiinv.bypass.exp'), 
            set_ptexp(@data['exp'])
        )
        
        if(@enabled['mode'] && 
        array_index_exists(@data, 'mode') &&
        !has_permission(player(), 'thezomg.multiinv.bypass.mode'), 
            if(@data['mode'] != pmode(),
                msg(color(blue), 'Switching to' to_lower(@data['mode']) 'mode.')
            )
            
            set_pmode(@data['mode'])
        )
        
        if(@enabled['onfire'] && 
        array_index_exists(@data, 'onfire') &&
        !has_permission(player(), 'thezomg.multiinv.bypass.onfire'),
            set_ponfire(@data['onfire'])
        )
    , # else
        if(@enabled['inv'],
            foreach(array_keys(pinv()), @k, 
                assign(@inv[@k], null)
            )
            
            set_pinv(@inv)
        )
    )
)

    
    
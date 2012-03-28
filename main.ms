bind('world_changed', null, null, @event,
    if(!_multiinv_is_same_group(@event['to'], @event['from']) &&
    !has_permission(@event['player'], 'thezomg.multiinv.bypass'),
        assign(@keyto, concat('thezomg.multiinv.players.', @event['player'], '.', @event['to']))
        assign(@keyfrom, concat('thezomg.multiinv.players.', @event['player'], '.', @event['from']))
        
        assign(@inv, get_value(@keyto))
        store_value(@keyfrom, pinv())
        
        if(!is_null(@inv),
            set_pinv(@inv)
        , # else
            assign(@inv, pinv())
            
            foreach(array_keys(@inv), @key, 
                assign(@inv[@key], null)
            )
            
            set_pinv(@inv)
        )
    )
)
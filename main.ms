bind('world_changed', null, null, @event,
    assign(@defaults, array(
        'inv': true,
        'food': false,
        'health': false,
        'exp': false,
        'mode': false,
        'onfire': false
    ))
    
    if(!_multiinv_is_same_group(@event['to'], @event['from']) &&
    !has_permission(@event['player'], 'thezomg.multiinv.bypass.all'),
        assign(@basekey, concat('thezomg.multiinv.players.', @event['player'], '.'))
        
        assign(@keyto, concat(@basekey, @event['to']))
        assign(@keyfrom, concat(@basekey, @event['from']))

        _multiinv_store_data(@defaults, @keyfrom)
        _multiinv_set_data(@defaults, @keyto)
    )
)
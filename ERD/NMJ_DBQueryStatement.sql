 select store_name, store_lat, store_long, ( 6371000 * acos( cos( radians(37.500023) ) * cos( radians( store_lat ) ) * cos( radians( store_long ) - radians(127.036613) ) + sin( radians(37.500023) ) * sin( radians(store_lat ) ) ) ) as dist
 from nmj_store ns ;


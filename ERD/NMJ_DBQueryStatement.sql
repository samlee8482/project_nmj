select *,ST_DISTANCE_SPHERE(POINT(127.036613, 37.500023), POINT(store_long, store_lat) ) as dis from nmj_store;
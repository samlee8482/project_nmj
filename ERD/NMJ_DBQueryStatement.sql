 select store_name, store_lat, store_long, ( 6371000 * acos( cos( radians(37.500023) ) * cos( radians( store_lat ) ) * cos( radians( store_long ) - radians(127.036613) ) + sin( radians(37.500023) ) * sin( radians(store_lat ) ) ) ) as dist
 from nmj_store ns ;

describe nmj_review ;

SELECT
			store_uid,
			store_img_sav,
			store_name,
			store_dname
		FROM NMJ_store NATURAL JOIN NMJ_storeDType
		WHERE store_type =1 order by store_uid asc limit 0, 6;
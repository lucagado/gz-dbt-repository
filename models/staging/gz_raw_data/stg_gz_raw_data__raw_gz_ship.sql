with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,  -- Keep this column
        logcost,
        CAST(ship_cost AS FLOAT64) AS ship_cost  -- Cast to FLOAT64

    from source
    where shipping_fee <> shipping_fee_1  -- Filter based on the difference

)

select * from renamed;


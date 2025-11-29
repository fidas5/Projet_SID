with source as (
    select * from {{ ref('order_details') }}
),
renamed as (
    select
        id as order_detail_id,
        order_id,
        product_id,
        quantity,
        unit_price,
        discount,
        status_id,
        purchase_order_id,
        inventory_id
    from source
)
select * from renamed

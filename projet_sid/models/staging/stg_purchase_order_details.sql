with source as (
    select * from {{ ref('purchase_order_details') }}
),
renamed as (
    select
        id as purchase_order_detail_id,
        purchase_order_id,
        product_id,
        quantity,
        unit_cost,
        date_received,
        posted_to_inventory,
        inventory_id
    from source
)
select * from renamed
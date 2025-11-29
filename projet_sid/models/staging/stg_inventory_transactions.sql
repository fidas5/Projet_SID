with source as (
    select * from {{ ref('inventory_transactions') }}
),
renamed as (
    select
        id as inventory_transaction_id,
        transaction_type,
        transaction_created_date,
        transaction_modified_date,
        product_id,
        quantity,
        purchase_order_id,
        customer_order_id,
        comments
    from source
)
select * from renamed

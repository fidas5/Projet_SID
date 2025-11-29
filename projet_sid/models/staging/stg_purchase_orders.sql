with source as (
    select * from {{ ref('purchase_orders') }}
),
renamed as (
    select
        id as purchase_order_id,
        supplier_id,
        created_by,
        submitted_date,
        creation_date,
        status_id,
        expected_date,
        shipping_fee,
        taxes,
        payment_date,
        payment_amount,
        payment_method,
        notes,
        approved_by,
        approved_date,
        submitted_by
    from source
)
select * from renamed

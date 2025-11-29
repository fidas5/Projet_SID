with source as (
    select * from {{ ref('purchase_orders') }}
),
renamed as (
    select
        id as purchase_order_id,
        supplier_id,
        created_by as created_by_employee_id,
        submitted_date,
        creation_date,
        status_id as purchase_order_status_id,
        expected_date,
        shipping_fee,
        taxes,
        payment_date,
        payment_amount,
        payment_method,
        notes,
        approved_by as approved_by_employee_id,
        approved_date,
        submitted_by as submitted_by_employee_id
    from source
)
select * from renamed
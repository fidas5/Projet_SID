with source as (
    select * from {{ ref('invoices') }}
),
renamed as (
    select
        id as invoice_id,
        order_id,
        invoice_date,
        due_date,
        tax,
        shipping,
        amount_due
    from source
)
select * from renamed
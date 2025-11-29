with source as (
    select * from {{ ref('orders_tax_status') }}
),
renamed as (
    select
        id as orders_tax_status_id,
        tax_status_name
    from source
)
select * from renamed

with source as (
    select * from {{ ref('purchase_order_status') }}
),
renamed as (
    select
        id as purchase_order_status_id,
        status
    from source
)
select * from renamed

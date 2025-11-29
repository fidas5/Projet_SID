with source as (
    select * from {{ ref('orders_status') }}
),
renamed as (
    select
        id,
        status_name
    from source
)
select * from renamed

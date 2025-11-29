with source as (
    select * from {{ ref('orders_status') }}
),
renamed as (
    select
        id as orders_status_id,
        status_name
    from source
)
select * from renamed

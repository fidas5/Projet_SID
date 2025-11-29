with source as (
    select * from {{ ref('order_details_status') }}
),
renamed as (
    select
        id as order_details_status_id,
        status
    from source
)
select * from renamed

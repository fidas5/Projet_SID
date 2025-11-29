with source as (
    select * from {{ ref('privileges') }}
),
renamed as (
    select
        id as privilege_id,
        privilege_name
    from source
)
select * from renamed

with source as (
    select * from {{ ref('strings') }}
),
renamed as (
    select
        string_id,
        string_data
    from source
)
select * from renamed
with source as (
    select * from {{ ref('shippers') }}
),
renamed as (
    select
        id as shipper_id,
        company,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region
    from source
)
select * from renamed

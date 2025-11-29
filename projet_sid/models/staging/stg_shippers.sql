with source as (
    select * from {{ ref('shippers') }}
),
renamed as (
    select
        id as shipper_id,
        company as shipper_company,
        address as shipper_address,
        city as shipper_city,
        state_province as shipper_state_province,
        zip_postal_code as shipper_zip_postal_code,
        country_region as shipper_country_region
    from source
)
select * from renamed
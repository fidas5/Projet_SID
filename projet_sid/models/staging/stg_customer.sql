with source as (
    select * from {{ ref('customer') }}
),
renamed as (
    select
        id as customer_id,
        company as company_name,
        last_name,
        first_name,
        email_address,
        job_title,
        business_phone,
        fax_number,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region
    from source
)
select * from renamed

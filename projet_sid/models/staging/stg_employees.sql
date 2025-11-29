with source as (
    select * from {{ ref('employees') }}
),
renamed as (
    select
        id as employee_id,
        company as company_name,
        last_name,
        first_name,
        email_address,
        job_title,
        business_phone,
        home_phone,
        fax_number,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region,
        web_page,
        notes    from source
)
select * from renamed

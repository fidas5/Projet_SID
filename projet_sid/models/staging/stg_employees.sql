with source as (
    select * from {{ ref('employees') }}
),
renamed as (
    select
        id as employee_id,
        company as company_name,
        last_name as employee_last_name,
        first_name as employee_first_name,
        email_address as employee_email,
        job_title as employee_job_title,
        business_phone,
        fax_number,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region,
        notes
    from source
)
select * from renamed
with source as (
    select * from {{ ref('suppliers') }}
),
renamed as (
    select
        id as supplier_id,
        company as supplier_company,
        last_name as supplier_last_name,
        first_name as supplier_first_name,
        email_address as supplier_email,
        job_title as supplier_job_title
    from source
)
select * from renamed
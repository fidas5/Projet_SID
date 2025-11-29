with source as (
    select * from {{ ref('suppliers') }}
),
renamed as (
    select
        id as supplier_id,
        company,
        last_name,
        first_name,
        email_address,
        job_title
    from source
)
select * from renamed

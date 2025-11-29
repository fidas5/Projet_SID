with source as (
    select * from {{ ref('employee_privileges') }}
),
renamed as (
    select
        employee_id,
        privilege_id
    from source
)
select * from renamed
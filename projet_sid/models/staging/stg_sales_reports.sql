with source as (
    select * from {{ ref('sales_reports') }}
),
renamed as (
    select
        group_by,
        display,
        title,
        filter_row_source,
        `default` as is_default
    from source
)
select * from renamed

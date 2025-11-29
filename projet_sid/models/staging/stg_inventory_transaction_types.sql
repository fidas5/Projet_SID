with source as (
    select * from {{ ref('inventory_transaction_types') }}
),
renamed as (
    select
        id as inventory_transaction_type_id,
        type_name as inventory_transaction_type_name
    from source
)
select * from renamed

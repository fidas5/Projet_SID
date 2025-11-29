# Staging Models - Relationship Guide

## Overview
All staging models are created in the `ProjetSID_staging` schema with proper foreign key naming for Power BI relationships.

## Primary Keys (Dimension Tables)

### stg_customer
- **Primary Key**: `customer_id`
- Columns: customer_id, company_name, last_name, first_name, email_address, job_title, business_phone, fax_number, address, city, state_province, zip_postal_code, country_region

### stg_employees
- **Primary Key**: `employee_id`
- Columns: employee_id, company_name, last_name, first_name, email_address, job_title, business_phone, fax_number, address, city, state_province, zip_postal_code, country_region, notes

### stg_products
- **Primary Key**: `product_id`
- Columns: supplier_ids, product_id, product_code, product_name, description, standard_cost, list_price, reorder_level, target_level, quantity_per_unit, discontinued, minimum_reorder_quantity, category

### stg_suppliers
- **Primary Key**: `supplier_id`
- Columns: supplier_id, company, last_name, first_name, email_address, job_title

### stg_shippers
- **Primary Key**: `shipper_id`
- Columns: shipper_id, company, address, city, state_province, zip_postal_code, country_region

### stg_privileges
- **Primary Key**: `privilege_id`
- Columns: privilege_id, privilege_name

## Status/Lookup Tables

### stg_orders_status
- **Primary Key**: `orders_status_id`
- Columns: orders_status_id, status_name

### stg_orders_tax_status
- **Primary Key**: `orders_tax_status_id`
- Columns: orders_tax_status_id, tax_status_name

### stg_order_details_status
- **Primary Key**: `order_details_status_id`
- Columns: order_details_status_id, status

### stg_purchase_order_status
- **Primary Key**: `purchase_order_status_id`
- Columns: purchase_order_status_id, status

### stg_inventory_transaction_types
- **Primary Key**: `inventory_transaction_type_id`
- Columns: inventory_transaction_type_id, inventory_transaction_type_name

## Fact Tables

### stg_orders
- **Primary Key**: `order_id`
- **Foreign Keys**:
  - `employee_id` → stg_employees.employee_id
  - `customer_id` → stg_customer.customer_id
  - `shipper_id` → stg_shippers.shipper_id
  - `orders_tax_status_id` → stg_orders_tax_status.orders_tax_status_id
  - `orders_status_id` → stg_orders_status.orders_status_id

### stg_order_details
- **Primary Key**: `order_detail_id`
- **Foreign Keys**:
  - `order_id` → stg_orders.order_id
  - `product_id` → stg_products.product_id
  - `order_details_status_id` → stg_order_details_status.order_details_status_id
  - `purchase_order_id` → stg_purchase_orders.purchase_order_id
  - `inventory_id` → stg_inventory_transactions.inventory_transaction_id

### stg_purchase_orders
- **Primary Key**: `purchase_order_id`
- **Foreign Keys**:
  - `supplier_id` → stg_suppliers.supplier_id
  - `created_by_employee_id` → stg_employees.employee_id
  - `approved_by_employee_id` → stg_employees.employee_id
  - `submitted_by_employee_id` → stg_employees.employee_id
  - `purchase_order_status_id` → stg_purchase_order_status.purchase_order_status_id

### stg_purchase_order_details
- **Primary Key**: `purchase_order_detail_id`
- **Foreign Keys**:
  - `purchase_order_id` → stg_purchase_orders.purchase_order_id
  - `product_id` → stg_products.product_id
  - `inventory_id` → stg_inventory_transactions.inventory_transaction_id

### stg_inventory_transactions
- **Primary Key**: `inventory_transaction_id`
- **Foreign Keys**:
  - `inventory_transaction_type_id` → stg_inventory_transaction_types.inventory_transaction_type_id
  - `product_id` → stg_products.product_id
  - `purchase_order_id` → stg_purchase_orders.purchase_order_id
  - `order_id` → stg_orders.order_id

### stg_invoices
- **Primary Key**: `invoice_id`
- **Foreign Keys**:
  - `order_id` → stg_orders.order_id

## Bridge Tables

### stg_employee_privileges
- **Foreign Keys**:
  - `employee_id` → stg_employees.employee_id
  - `privilege_id` → stg_privileges.privilege_id

## Other Tables

### stg_sales_reports
- Columns: group_by, display, title, filter_row_source, is_default

### stg_strings
- **Primary Key**: `string_id`
- Columns: string_id, string_data

## Power BI Relationship Setup

Power BI should automatically detect these relationships based on matching column names. If not, you can manually create them:

1. **One-to-Many Relationships** (most common):
   - stg_customer[customer_id] → stg_orders[customer_id]
   - stg_employees[employee_id] → stg_orders[employee_id]
   - stg_products[product_id] → stg_order_details[product_id]
   - stg_orders[order_id] → stg_order_details[order_id]
   - etc.

2. **Many-to-Many Relationships**:
   - stg_employees ↔ stg_employee_privileges ↔ stg_privileges

All relationships should use the **Many-to-One** cardinality with **Single** cross-filter direction (except for many-to-many).

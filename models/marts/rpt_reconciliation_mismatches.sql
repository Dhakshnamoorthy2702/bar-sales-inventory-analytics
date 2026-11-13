select
    drink_name,
    date,
    stock_difference,
    new_stock_difference,
    cost_difference,
    sales_difference,
    profit_difference,
    mismatch_status
from {{ ref('int_drink_sales_calculated') }}
where mismatch_status = 'mismatch'

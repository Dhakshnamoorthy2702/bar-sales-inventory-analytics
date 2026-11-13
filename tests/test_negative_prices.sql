select *
from {{ ref('int_drink_sales_calculated') }}
where (purchased_price < 0 or selling_price < 0)
  and data_quality_status = 'valid'
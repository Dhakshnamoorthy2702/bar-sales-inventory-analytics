select *
from {{ ref('int_drink_sales_calculated') }}
where sold < 0
  and data_quality_status = 'valid'
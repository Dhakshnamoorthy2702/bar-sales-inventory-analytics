select distinct
    md5(upper(trim(drink_name))) as drink_key,
   upper(trim(drink_name)) as drink_name

from {{ ref('int_drink_sales_calculated') }}

where drink_name is not null

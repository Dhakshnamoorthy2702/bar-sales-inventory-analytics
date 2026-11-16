
select
    nullif(trim(`DRINKS`), '') as drink_name,
    cast(`DATE` as date) as date,

    cast(`OLD STOCK` as bigint) as old_stock,
    cast(`SUPPLY ` as bigint) as supply,
    cast(`TOTAL OLD STOCK` as bigint) as total_old_stock,
    cast(`NEW STOCK` as bigint) as new_stock,
    cast(`SOLD` as bigint) as sold,

    cast(`PURCHASED PRICE` as decimal(18,2)) as purchased_price,
    cast(`SELLING PRICE` as decimal(18,2)) as selling_price,

    cast(`TOTAL AMOUNT  P.P` as decimal(18,2)) as total_amount_pp,
    cast(`TOTAL AMOUNT S.P` as decimal(18,2)) as total_sales_amount,
    cast(`PROFIT` as decimal(18,2)) as profit

from {{ source('barlist', 'bottles') }}

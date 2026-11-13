# Bar Sales & Inventory Analytics | End-to-End Data Engineering Project

An end-to-end data engineering and analytics project built using **SQL, dbt Cloud, Databricks, and GitHub**.

This project transforms raw bar sales and inventory data into clean, validated, and analytics-ready datasets to support business reporting and decision-making.

## Project Overview

The goal of this project is to build a reliable data transformation pipeline that analyzes:

- Drink sales performance
- Inventory and stock movement
- Revenue and costs
- Gross profit and profit margins
- Daily business performance
- Data quality and reconciliation mismatches

The project follows a **Bronze → Silver → Gold** data architecture.

## Technology Stack

| Technology | Purpose |
|---|---|
| SQL | Data transformation and business calculations |
| Databricks | Data storage and SQL processing |
| dbt Cloud | Data modeling, transformation, and testing |
| GitHub | Version control and project documentation |
| Git | Source code management |

## Data Pipeline Architecture

```text
             GitHub Repository
                    |
                    v
                 dbt Cloud
                    |
                    v
               Databricks
                    |
                    v
          Bronze Layer (Raw Data)
                    |
                    v
        Silver Layer (Staging Models)
                    |
                    v
       Silver Layer (Business Logic)
                    |
                    v
       Gold Layer (Fact & Dimension)
                    |
                    v
        Gold Layer (Analytics Marts)
                    |
                    v
           Business Reporting
```

### Bronze Layer

Stores raw sales and inventory data in Databricks.

**Source table:** `raw.barlist.bottles`

The source dataset contains **978 records**.

### Silver Layer

Cleans and transforms raw data by:

- Standardizing column names
- Cleaning drink names
- Calculating stock movements
- Calculating revenue, costs, and profit
- Identifying invalid records
- Preparing validated data for downstream models

### Gold Layer

Creates business-ready datasets, including:

- Drink dimension
- Sales fact table
- Daily bar performance mart
- Drink performance mart
- Reconciliation mismatch report

## dbt Models

| Model | Description |
|---|---|
| `stg_bar_drinks_sales` | Cleans and standardizes raw sales and inventory data |
| `int_drink_sales_calculated` | Calculates inventory, revenue, cost, profit, and data quality status |
| `dim_drink` | Creates the drink dimension |
| `fct_drink_sales` | Creates the sales fact table |
| `mart_daily_bar_performance` | Produces daily business performance metrics |
| `mart_drink_performance` | Analyzes individual drink performance and profitability |
| `rpt_reconciliation_mismatches` | Reports records with data quality or reconciliation issues |

## Business Calculations

The project implements the following business rules:

**Total Stock**

```text
Total Stock = Old Stock + Supply
```

**Remaining Stock**

```text
Remaining Stock = Total Stock - Sold
```

**Cost**

```text
Cost = Sold × Purchase Price
```

**Revenue**

```text
Revenue = Sold × Selling Price
```

**Profit**

```text
Profit = Revenue - Cost
```

**Profit Margin**

```text
Profit Margin (%) = (Profit / Revenue) × 100
```

These calculations support inventory monitoring and profitability analysis.

## Data Quality & Validation

Data quality checks identify issues such as:

- Negative stock quantities
- Negative prices
- Missing drink names
- Missing dates
- Incorrect stock calculations
- Revenue, cost, and profit mismatches

Invalid records are retained for auditing and reconciliation rather than silently discarded.

### Data Validation Results

| Metric | Result |
|---|---:|
| Total source records | 978 |
| Valid records | 976 |
| Invalid records | 2 |

The two identified invalid records include:

- **STAR:** Negative quantity sold
- **TROPHY STOUT:** Missing supply value

This demonstrates how the pipeline identifies problematic source records while preserving them for investigation.

## dbt Testing

The project uses dbt data quality tests to validate transformed datasets.

Test configurations are maintained in:

```text
models/marts/schema.yml
```

The tests are executed alongside the transformations using:

```bash
dbt build
```

### Build Results

**16/16 successful — 0 failures**

The successful build confirms that the configured dbt transformations and tests completed successfully.

## Deployment Pipeline

A deployment environment and job were configured in dbt Cloud.

| Configuration | Value |
|---|---|
| Deployment environment | Bar Sales Deployment |
| Deployment job | Bar Sales Analytics Pipeline |
| Git branch | `main` |
| Execution command | `dbt build` |
| Execution mode | Manual |
| Deployment result | Successful |

The deployment job was manually executed successfully with **100% success and 0 failures**.

Automatic scheduling is intentionally disabled.

## Analytics Outputs

### Daily Bar Performance

The `mart_daily_bar_performance` model supports analysis of:

- Daily sales quantities
- Daily revenue
- Daily costs
- Daily profit
- Business performance over time

### Drink Performance

The `mart_drink_performance` model supports analysis of:

- Sales performance by drink
- Revenue contribution
- Costs and profitability
- Profit margins
- Product-level performance comparisons

### Inventory & Reconciliation

The transformation and reconciliation models help identify:

- Expected inventory balances
- Inventory inconsistencies
- Missing source values
- Records requiring investigation

## Project Structure

```text
bar-sales-inventory-analytics/
|
|-- models/
|   |-- staging/
|   |-- intermediate/
|   |-- marts/
|
|-- tests/
|
|-- dbt_project.yml
|-- .gitignore
|-- README.md
```

The dbt project includes staging, intermediate, dimension, fact, reporting, and reconciliation models.

## Key Project Achievements

- Built an end-to-end analytics transformation pipeline using dbt Cloud and Databricks.
- Processed 978 raw inventory and sales records.
- Identified 976 valid records and 2 invalid records.
- Implemented SQL business logic for revenue, cost, profit, and stock calculations.
- Created dimensional and reporting models for business analysis.
- Implemented data quality validation and reconciliation reporting.
- Integrated the dbt project with GitHub version control.
- Successfully executed `dbt build` with 16/16 successful results.
- Configured and successfully ran a dbt Cloud deployment job.

## Skills Demonstrated

**Data Engineering:** Data transformation, data modeling, data validation, and layered data architecture.

**SQL:** Data cleaning, business calculations, aggregations, and reconciliation.

**dbt:** Staging models, intermediate models, dimensional models, marts, testing, and deployment.

**Databricks:** Data storage, SQL processing, and analytics datasets.

**GitHub:** Version control, repository management, and technical documentation.

## Future Enhancements

Potential improvements include:

- Creating an interactive business intelligence dashboard
- Adding pipeline architecture diagrams and deployment screenshots
- Introducing automated deployment scheduling when required
- Expanding source data coverage
- Implementing additional data quality monitoring

## Conclusion

This project demonstrates an end-to-end data engineering workflow that transforms raw business data into validated, analytics-ready datasets.

By combining **SQL, dbt Cloud, Databricks, and GitHub**, the project showcases practical experience in data transformation, dimensional modeling, data quality testing, and deployment management.

The resulting datasets provide a foundation for analyzing bar sales, inventory, revenue, costs, and profitability.

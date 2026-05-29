# Gold Aggregation — Fabric Lakehouse
# Business-level aggregations and metrics for reporting and AI consumption

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, count, avg, current_timestamp

spark = SparkSession.builder.getOrCreate()

# Read from silver
silver_df = spark.read.format("delta").table("silver.cleaned_source")

# Business aggregations (example: metrics by category)
gold_df = (
    silver_df
    .groupBy("category")
    .agg(
        count("id").alias("total_records"),
        sum("amount").alias("total_amount"),
        avg("amount").alias("avg_amount"),
    )
    .withColumn("_aggregated_at", current_timestamp())
)

# Write to gold (overwrite — always reflects latest state)
gold_df.write.mode("overwrite").format("delta").saveAsTable("gold.metrics_by_category")

print(f"Gold aggregation complete: {gold_df.count()} rows")

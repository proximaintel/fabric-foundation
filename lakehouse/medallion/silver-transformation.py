# Silver Transformation — Fabric Lakehouse
# Clean, deduplicate, and type-cast bronze data into silver layer

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, current_timestamp

spark = SparkSession.builder.getOrCreate()

# Read from bronze
bronze_df = spark.read.format("delta").table("bronze.raw_source")

# Transformations: deduplicate, null handling, type casting
silver_df = (
    bronze_df
    .dropDuplicates(["id"])
    .filter(col("id").isNotNull())
    .withColumn("_processed_at", current_timestamp())
)

# Write to silver (merge/upsert pattern)
silver_df.write.mode("overwrite").format("delta").saveAsTable("silver.cleaned_source")

print(f"Silver transformation complete: {silver_df.count()} rows")

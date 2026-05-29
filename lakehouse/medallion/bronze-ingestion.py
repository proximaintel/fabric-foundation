# Bronze Ingestion — Fabric Lakehouse
# Ingest raw data from external sources into the bronze layer

from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

# Example: Read from external ADLS Gen2 via shortcut
bronze_df = spark.read.format("parquet").load("abfss://raw@<storage>.dfs.core.windows.net/source/")

# Write to bronze lakehouse table (append-only, no transformations)
bronze_df.write.mode("append").format("delta").saveAsTable("bronze.raw_source")

print(f"Bronze ingestion complete: {bronze_df.count()} rows")

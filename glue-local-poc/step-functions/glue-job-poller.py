import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.utils import getResolvedOptions

args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Read CSV from local file system
df = glueContext.spark_session.read.csv('/home/hadoop/workspace/data/input.csv', header=True, inferSchema=True)
df.show()

# Optionally, save as parquet or temp CSV for next job
df.write.mode('overwrite').parquet('/home/hadoop/workspace/data/output.parquet')

job.commit()

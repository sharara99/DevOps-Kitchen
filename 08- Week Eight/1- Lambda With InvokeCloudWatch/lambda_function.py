import boto3
import os

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    source_bucket = os.environ['EXTERNAL_BUCKET']
    destination_bucket = os.environ['INTERNAL_BUCKET']
    
    # List objects in the source bucket
    response = s3_client.list_objects_v2(Bucket=source_bucket)
    
    if 'Contents' in response:
        for obj in response['Contents']:
            copy_source = {'Bucket': source_bucket, 'Key': obj['Key']}
            s3_client.copy_object(CopySource=copy_source, Bucket=destination_bucket, Key=obj['Key'])
            s3_client.delete_object(Bucket=source_bucket, Key=obj['Key'])
            
    return {
        'statusCode': 200,
        'body': 'Files moved successfully'
    }

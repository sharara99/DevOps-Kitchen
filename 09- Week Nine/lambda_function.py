import boto3

def lambda_handler(event, context):
    # Initialize SSM client
    ssm_client = boto3.client('ssm')

    # The ID of the EC2 instance where the SSM document will run
    instance_id = event['InstanceId']

    # SSM document name
    document_name = 'RestartSSHService'

    # Run the SSM command
    response = ssm_client.send_command(
        InstanceIds=[instance_id],
        DocumentName=document_name
    )

    return response

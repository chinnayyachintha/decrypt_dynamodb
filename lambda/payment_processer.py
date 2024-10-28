import boto3
import os
import json
import base64

# Initialize AWS services
kms_client = boto3.client('kms')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['DYNAMODB_TABLE_NAME'])

def lambda_handler(event, context):
    # Parse the incoming request from API Gateway
    body = json.loads(event.get('body', '{}'))
    encrypted_data = base64.b64decode(body['encrypted_data'])

    # Decrypt the data using AWS KMS
    decrypted_response = kms_client.decrypt(
        CiphertextBlob=encrypted_data,
        KeyId=os.environ['KMS_KEY_ID']
    )
    decrypted_data = decrypted_response['Plaintext']
    
    # Store decrypted data in DynamoDB
    store_to_dynamodb(decrypted_data)

    return {
        'statusCode': 200,
        'body': json.dumps({'message': 'Data decrypted and stored successfully'})
    }

def store_to_dynamodb(data):
    # Format data as needed
    table.put_item(Item=json.loads(data))

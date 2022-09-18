credentials=$(aws sts assume-role --role-arn arn:aws:iam::651325599829:role/DevPowerUser --role-session-name test | jq -r '.Credentials' )
export AWS_ACCESS_KEY_ID=$(echo $credentials | jq -r ".AccessKeyId") 
export AWS_SECRET_ACCESS_KEY=$(echo $credentials | jq -r ".SecretAccessKey") 
export AWS_SESSION_TOKEN=$(echo $credentials | jq -r ".SessionToken") 

echo $credentials | jq -r ".Expiration"

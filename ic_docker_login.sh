echo "Get credentionals from Amazon ECR"
DCRED=$(docker-compose -f docker-compose.aws.yml run --rm aws-cli ecr get-login --region us-west-1 --no-include-email)
echo "Login Docker"
echo "--------------- RUN IT IN CONSOLE ---------------------"
echo $DCRED
echo "----------------------- END ---------------------------"

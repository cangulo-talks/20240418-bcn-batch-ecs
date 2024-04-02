const AWS = require('aws-sdk');
const ecs = new AWS.ECS();

exports.handler = async (event) => {
  console.log(JSON.stringify(event, null, 2));

  const params = {
    cluster: 'your-cluster-name', // replace with your cluster name
    taskDefinition: 'your-task-definition', // replace with your task definition
    count: 1,
    launchType: 'FARGATE',
    networkConfiguration: { // replace with your network configuration
      awsvpcConfiguration: {
        subnets: ['subnet-xxxxxx'], // replace with your subnet id
        assignPublicIp: 'ENABLED'
      }
    }
  };

  try {
    const data = await ecs.runTask(params).promise();
    console.log('Task started: ', data);
  } catch (error) {
    console.error('Error starting task: ', error);
  }
};
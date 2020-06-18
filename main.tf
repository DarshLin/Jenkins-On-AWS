#Security Group to be Created for Jenkins Server
module "SecurityGroup" {
  source ="./securityGroup"
  VpcId = "${var.VpcId}"
  AccessKey = "${var.AccessKey}"
  SecretKey = "${var.SecretKey}"
  SgName = "JenkinsEc2Sg"
  LocalIp = "${var.LocalIp}"
}

#Jenkins Server to be Created
module "jenkinsServer" {
  source = "./ec2"
  VpcId = "${var.VpcId}"
  AccessKey = "${var.AccessKey}"
  SecretKey = "${var.SecretKey}"
  Ec2Name = "JenkinsServer"
  Ec2Type = "t2.micro"
  KeyName = "${var.KeyName}"
  SubnetId = "subnet-d4ba869f"
  SecurityGroupCreated = "${module.SecurityGroup.SecurityGroupCreated}"
}




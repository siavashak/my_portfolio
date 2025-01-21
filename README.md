How to create your Static website with custom domain on AWS: 

Step1: Route 53:
	Register your domain, yoursitename.com for example.

step2: AWS Certificate Manager:
	request a certificate
	Request a public certificate, click on "Next"
	for Domain name enter yoursitename.com (add any other names like www.yoursitename, support.yoursitename, developrs, etc.)
	Validation: DNS validation - recommended
	Key algorithm: RSA 2048
	Click on "Request"
	The status will be "Pending validation", for some minutes (10 to 20)
	Click on "Create records in Route 53", then "Create records".

Step3: Route53:
	Verify that an "CNAME" is created for *.yoursitename.com with value like xxx.validations.aws.

Step4: S3: 
	Create two buckets, yoursitename.com and www.yoursitename.com 
	[Either use an existing bucket to copy the settings from, or follow the steps below]
	Turn off "Block all public access"
	Create the bucket
	
	Upload the site content to both S3 buckets. (Perhaps we could use only one bucket?)
	Enable static website hosting and set the Index document to index.html.
	Set the bucket policy to the following or use AWS policy Generator (https://awspolicygen.s3.amazonaws.com/policygen.html)
	{
		"Version": "2012-10-17",
		"Statement": [
			{
				"Sid": "PublicReadGetObject",
				"Effect": "Allow",
				"Principal": "*",
				"Action": "s3:GetObject",
				"Resource": "arn:aws:s3:::www.yoursitename.com/*"
			}
		]
	}
	Under permisson tab, ACL, make sure the Owner can read and write on the bucket ACL, and Everyone can only read from the bucket ACL.	
	
Step5: CloudFront:
	Create two distributions, one for each site name. (perhaps we could use only one distribution for both sites using aliases?)
	Set the origin to your bucket
	Continue to Default cache behavior
	On Viewer protocol policy, set it to "Redirect HTTP to HTTPS"
	Continue to set WAF to disabled.
	Continue to Settings
	Set Custom SSL certificate to *.yoursitename.com which was created earlier.
	Leave the rest unchanged and click "Create distribution".
	Repeat the steps above for the other bucket.
		
Step6: CloudFront:
	Open the newly created distributions
	Click on origin tab, select the origin, Edit
	Under Settings, make sure it's set to "Use website endpoint"
	Also set the Alternate domain names to the endpoint ( ex yoursitename.com)
	Save changes.
	Withinthe distribution, under General tab, make a note of "Distribution domain name", we will need to add this as an A record to DNS records under Route 53. 

Step7: Route53:
	Open Route 53, DNS Management
	Open the hosted Zone for your site name
	Create record
	record name should be black for .sitename.com and should be set to www for www.sitename.com
	Record Type = A 
	Enable Alias
	Select Alias to CloudFront Distribution
	The value copied from CF distro should be found in the dropdown, but if not, go ahead and paste it here and Click Create/Save.
	Verify that an "A Record" is created for yoursitename.com and www.yoursitename.com with values like xxx.cloudfront.net.
	
Step8: CloudFront:
	We might need to disable and re-enable the distributions to invalidate the cached contents. The changes might take some hours to reflect. 

At this point your content sould be displayed on both S3 url and your sitename.com 

Step9: Install "Aws ToolKit" and "Github Actions" plugins for VSCode.

step10: Create an IAM user with S3 access, then create an access key for it and save it somewhere safe.

step11: On Github, go to the current repo, the last tab is Settings
	Go to Secrets and Variable, Actions, new repository secret and for each of the three items below, add their corresponding values:
	AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION

Step12: Add deploy.yml workflow under a new directory at .github/workflows/deploy.yml
	this file contains the trigger and action for Continous Deployment. 
	make sure the AWS_SECRET_ACCESS_KEY variable name exactly matches the variable defined in the previous step. 
	ex: aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

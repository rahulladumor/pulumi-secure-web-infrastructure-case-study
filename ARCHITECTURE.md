# 🏗️ Architecture - Secure Web Infrastructure

## Design Principles

1. **Security First** - Encryption everywhere, no public buckets
2. **High Availability** - Multi-AZ deployment
3. **Scalability** - Auto Scaling 2-10 instances
4. **Cost Optimized** - Right-sized resources (~$119/month)
5. **Pulumi TypeScript** - Type-safe IaC

## Architecture Layers

### Layer 1: CDN & Security
- **CloudFront**: Global CDN with edge locations
- **WAF**: Protection against OWASP Top 10, DDoS
- **SSL/TLS**: HTTPS only, TLS 1.2+

### Layer 2: Load Balancing
- **ALB**: Application Load Balancer across 2 AZs
- **Health Checks**: Automated instance monitoring
- **Access Logs**: Encrypted S3 bucket

### Layer 3: Compute
- **EC2**: Auto Scaling Group (2-10 instances)
- **AMI**: Amazon Linux 2
- **Instance Type**: t3.small (2 vCPU, 2GB RAM)
- **Placement**: Private subnets across 2 AZs

### Layer 4: Data
- **DynamoDB**: NoSQL with KMS encryption
- **PITR**: Point-in-Time Recovery enabled
- **Provisioned**: 5 RCU, 5 WCU (scalable)

### Layer 5: Security
- **KMS**: Customer-managed keys for encryption
- **Secrets Manager**: Secure credential storage
- **IAM Roles**: EC2 → DynamoDB, S3, CloudWatch
- **Security Groups**: Minimal port access

### Layer 6: Networking
- **VPC**: 10.0.0.0/16
- **Public Subnets**: 2 (us-west-2a, us-west-2b)
- **Private Subnets**: 2 (us-west-2a, us-west-2b)
- **NAT Gateway**: Outbound internet for private subnets
- **Internet Gateway**: Public subnet internet access

### Layer 7: Monitoring
- **CloudWatch Logs**: Encrypted with KMS
- **ALB Logs**: S3 bucket (encrypted)
- **Metrics**: All AWS service metrics
- **Alarms**: Ready for custom alerts

## Key Design Decisions

### Why DynamoDB vs RDS?
- **Scale**: Unlimited throughput
- **Performance**: Single-digit ms latency
- **Cost**: Pay per request (cheaper at scale)
- **HA**: Built-in Multi-AZ

### Why CloudFront + WAF?
- **Global**: Edge locations worldwide
- **DDoS**: AWS Shield Standard included
- **WAF**: Protection against attacks
- **Performance**: CDN caching

### Why Pulumi TypeScript?
- **Type Safety**: Compile-time error checking
- **Modern**: Familiar JavaScript ecosystem
- **Testable**: Unit tests with standard tools
- **Flexible**: Use any npm package

## Security Architecture

- All data encrypted at rest (KMS)
- All data encrypted in transit (TLS 1.2+)
- No public S3 buckets (Block Public Access)
- IAM roles (no access keys)
- Private subnets for compute
- Security groups with minimal ports
- Secrets Manager for credentials

## Scalability

- **Horizontal**: Auto Scaling 2-10 instances
- **Vertical**: Upgrade instance types
- **Database**: DynamoDB auto-scaling
- **CDN**: CloudFront global scale

## Cost Breakdown

- Compute: ~$30/month (2× t3.small)
- Load Balancer: ~$20/month
- NAT Gateway: ~$35/month
- DynamoDB: ~$3/month (light usage)
- CloudFront: ~$10/month (100GB)
- Other: ~$21/month

**Total**: ~$119/month (production)

See [README](README.md) for details.

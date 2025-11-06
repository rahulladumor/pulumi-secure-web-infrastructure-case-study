# 💰 Cost Analysis

## Monthly Breakdown (Production)

| Service | Configuration | Cost |
|---------|--------------|------|
| EC2 (Auto Scaling) | 2× t3.small | $30 |
| ALB | Application Load Balancer | $20 |
| NAT Gateway | 1× + data processing | $35 |
| DynamoDB | 5 RCU, 5 WCU | $3 |
| CloudFront | 100GB transfer | $10 |
| WAF | WebACL + rules | $6 |
| S3 | 50GB + requests | $2 |
| KMS | 2 keys | $2 |
| Secrets Manager | 2 secrets | $1 |
| CloudWatch | Logs + metrics | $10 |
| **TOTAL** | | **$119** |

## Cost Optimization

1. **Use Fargate Spot** - Save 70%
2. **Reserved Instances** - Save 30%
3. **S3 Intelligent-Tiering** - Auto-optimize
4. **CloudFront caching** - Reduce origin requests

## Scaling Costs

- Light: $80-100/month (1-2 instances)
- Medium: $119/month (current)
- Heavy: $200-300/month (5-10 instances)

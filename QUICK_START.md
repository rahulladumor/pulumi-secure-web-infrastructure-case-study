# 🚀 Quick Start - 5 Minute Deploy

## Prerequisites
- Pulumi CLI installed (`curl -fsSL https://get.pulumi.com | sh`)
- AWS CLI configured
- Node.js 18+ installed

## Deploy (5 minutes)

```bash
# Install dependencies
npm install

# Configure
pulumi config set aws:region us-west-2

# Deploy
pulumi up --yes
```

## Outputs

You'll get:
- ✅ VPC ID
- ✅ ALB DNS name
- ✅ CloudFront URL
- ✅ DynamoDB table name

## Verify

```bash
# Check stack
pulumi stack output

# Test ALB
curl $(pulumi stack output albDns)
```

## Cleanup

```bash
pulumi destroy --yes
```

**Cost**: ~$119/month
**Deploy Time**: 15-20 minutes

See [README](README.md) for full details.

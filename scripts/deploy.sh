#!/bin/bash
set -e

echo "🚀 Deploying Pulumi Infrastructure"
echo "===================================="

# Check prerequisites
if ! command -v pulumi &> /dev/null; then
    echo "❌ Pulumi CLI not found. Install: curl -fsSL https://get.pulumi.com | sh"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Configure
echo "⚙️  Configuring stack..."
pulumi config set aws:region us-west-2

# Deploy
echo "🚀 Deploying infrastructure..."
pulumi up --yes

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📊 Stack outputs:"
pulumi stack output

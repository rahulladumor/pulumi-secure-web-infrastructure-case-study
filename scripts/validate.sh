#!/bin/bash
echo "🔍 Validating Pulumi code..."
npm run build
pulumi preview
echo "✅ Validation complete"

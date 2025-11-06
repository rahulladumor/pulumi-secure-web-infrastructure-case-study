#!/bin/bash
echo "🗑️  Destroying infrastructure..."
pulumi destroy --yes
echo "✅ Cleanup complete"

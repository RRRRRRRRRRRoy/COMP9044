#!/bin/dash


counter_bp=$1;

./snapshot-save.sh

echo "Restoring snapshot $counter_bp";



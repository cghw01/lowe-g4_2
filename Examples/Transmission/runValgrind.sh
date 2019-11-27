#!/bin/sh
job=results
for material in Alumina Silicon
do
	echo Starting job for ${material}
	sed "s/MATERIAL/${material}/g" YieldCurve.mac > Yield${material}.mac
	valgrind --leak-check=yes ../../SEM/SEM_4.10.00 YieldCurve.gdml Yield${material}.mac
	echo Done with job ${job} for ${material}
done

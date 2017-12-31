#!/user/bin/bash

##########Yesterday Time###########
dt=`date -d "now 1 days ago" "+%Y%m%d"`
echo "Now 1 days ago is ${dt}"
#######spark job###################
spark-submit --master yarn --deploy-mode cluster --num-executors 16 --executor-cores 1 --executor-memory 1g \
--class $1 \
--conf spark.default.parallelism=256 \
--conf spark.sql.shuffle.partitions=400 \
--conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
--driver-memory 2g \
--jars $2 $3 $4

##################Result#############
rc=$?
if [[ $rc != 0 ]] ; then
	echo "`date "+%Y-%m-%d %H:%M:%S"` Spark job run failed......"
	echo 1
else
	echo "`date "+%Y-%m-%d %H:%M:%S"` Spark job run successfully!!!!!!!!!!"
fi



#!/usr/bin/awk -f

{
	# boxing data line by line
	cmd=sprintf("test -f %s",$2);
	f=system(cmd);
	n++;
	if(0==f)
	{
		data[n]=sprintf("%32s%s,%s",$1,$2,$1);
	}
}
END{
	# sort data in decreasing order line by line
	m=asort(data);
	for(i=m;i>=1;i--)
	{
		# unboxing data line by line
		print substr(data[i],33);
	}
}

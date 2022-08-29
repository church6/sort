#A001:
dd if=/dev/random  of=./rootfs/file0.txt bs=512 count=11
dd if=/dev/random  of=./rootfs/file1.txt bs=512 count=101
dd if=/dev/random  of=./rootfs/file2.txt bs=512 count=102
dd if=/dev/random  of=./rootfs/file3.txt bs=512 count=103
dd if=/dev/zero  of=./rootfs/file4.txt bs=512 count=204

du -a -b ./rootfs > output_R001.txt
./sort_md5sum.awk output_R001.txt > report_R001.txt


#A002:
dd if=/dev/random  of=./rootfs/file0.txt bs=512 count=21
dd if=/dev/random  of=./rootfs/file1.txt bs=512 count=201
dd if=/dev/random  of=./rootfs/file2.txt bs=512 count=202
dd if=/dev/random  of=./rootfs/file3.txt bs=512 count=203
dd if=/dev/zero  of=./rootfs/file4.txt bs=512 count=204

du -a -b ./rootfs > output_R002.txt
./sort_md5sum.awk output_R002.txt > report_R002.txt

/usr/bin/bcompare report_R001.txt report_R002.txt


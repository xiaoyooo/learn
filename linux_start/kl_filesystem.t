/dev/sd[a-p][1-15] : SCSI,SATA,USB,Flash disk
/dev/hd[a-d][1-63] : IDE disk

filesystem: 
Ext2

inode: record file property and file blocks no.
block: real file content, 1 or more block.
block group: has indepdent inode/block/superblock

folder:inode and at least 1 block(record file names and inodes)

inode : 12 direct + 1 link + 1 double link + 1 triple link
link : a block record inode blocks no.

Ext3:
more flexible Ext2

mount point must be folder, folder as a enter point.

link file:
symbol link: short cut,remove source file will disable the symbollink file.
hard link: inode link. two or more file name in dir respond to same inode no.

monut&unmount


swap(memory exchange space):


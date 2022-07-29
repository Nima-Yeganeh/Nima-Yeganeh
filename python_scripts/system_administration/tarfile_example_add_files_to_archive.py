import tarfile

tar_file = tarfile.open("test_student_info.tar.gz", "w:gz")
for name in ["student1.csv", "student2.csv"]:
	tar_file.add(name)
tar_file.close()

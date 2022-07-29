import subprocess

subprocess.call(["touch", "sample_file.txt"])
subprocess.call(["ls"])
print("Sample file created")
subprocess.call(["rm", "sample_file.txt"])
subprocess.call(["ls"])
print("Sample file deleted")

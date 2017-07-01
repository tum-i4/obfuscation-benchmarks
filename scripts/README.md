#Scripts for Obfuscation and Deobfuscation via Symbolic Execution

These scripts have been developed over the course of writing a series of
academic papers. The following presents the steps to perform in order
to use these scripts:

1. Write one or more C programs that you want to obfuscate. Or you can use the programs from the various obfuscation benchmark directories on this repository.

2. Copy these programs inside a dedicated working directory.

3. Copy the `generate-obfuscated.sh` and `obfuscate-all-files.sh` scripts to the working directory.These files use the Tigress obfuscation tool to automatically obfuscate all the C files using various combinations of obfuscation transformations. Note that Tigress should be installed and available in your PATH.

4. Check the function names parameter of Tigress in the `generate-obfuscated.sh` script. Fix it accordingly to the function name that you want to obfuscate inside of your C files.

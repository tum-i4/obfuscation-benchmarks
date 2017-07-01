# Scripts for Obfuscation and Deobfuscation via Symbolic Execution

These scripts have been developed over the course of writing a series of
academic papers [1,2,3]. The following presents the steps to perform in order
to use these scripts:

1. Write one or more C programs that you want to obfuscate. Or you can use the programs from the various obfuscation benchmark directories on this repository.

2. Copy these programs inside a dedicated working directory.

3. Copy the `generate-obfuscated.sh` and `obfuscate-all-files.sh` scripts to the working directory.These files use the Tigress obfuscation tool to automatically obfuscate all the C files using various combinations of obfuscation transformations. Note that Tigress should be installed and available in your PATH.

4. Check the function names parameter of Tigress in the `generate-obfuscated.sh` script. Fix it accordingly to the function name that you want to obfuscate inside of your C files.

5. In a terminal run the following script without any arguments: `$./obfuscate-all-files.sh`. This script calls the `generate-obfuscated.sh` script, which results in 30 different variants of obfuscated programs, as described in [2].

## References

1. Banescu, S., Ochoa, M., & Pretschner, A. (2015, May). _A framework for measuring software obfuscation resilience against automated attacks_. In Proceedings of the 1st International Workshop on Software Protection (SPRO).
2. Banescu, S., Collberg, C., Ganesh, V., Newsham, Z., & Pretschner, A. (2016, December). _Code obfuscation against symbolic execution attacks_. In Proceedings of the 32nd Annual Conference on Computer Security Applications (ACSAC).
3. Banescu, S., Collberg, C., & Pretschner, A. (2017, August)._Predicting the Resilience      of Obfuscated Code Against Symbolic Execution Attacks via Machine Learning_. In Proceedings of the 26th USENIX Security Symposium.

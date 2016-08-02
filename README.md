# ATLAS-Runtime Benchmarks
This project contains benchmarks and measurement data conducted on an ODROID XU3. Most of the folders contain files created by Hannes Weisbach, which were used to build the ATLAS-Runtime. To run the benchmarks you will have to download his project and install the libraries.

The matrixcalc folder contains the matrix multiplication benchmark used to measure energy consumption of the device. In the root folder two scripts are contained, which were used for measurements, namely suite.sh and testansensors.sh. The latter script accepts two parameters, one being a parameter for naming and the other being a number, which acts as the relative deadline in milliseconds for the benchmarks.

The parsecfiles folder contains the makefile created by Michael Roitzsch. As these had been run from a different folder one has to reconfigure the path to the script in parsecscript.sh in the root folder.

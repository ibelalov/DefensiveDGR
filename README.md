# DefensiveDGR
Bash script DefensiveDGR.sh downloads the data required, performs the analyses, and draws figures. It works in Ubuntu 18.04.6 LTS. Figure 9 was created manually with clinker 0.0.21. If all the dependencies are installed simply type in terminal:
```sh
  bash DefensiveDGR.sh
  ```
and wait. The analyses completed in seven days on our desktop computer

List of dependencies:

python 3.8.5
* numpy 1.20.3
* matplotlib 3.4.3
* upsetplot 0.5.0
* Biopython 1.78
* scipy 1.6.2
* pandas 1.3.2
* argparse 1.4.0

R version 4.1.2 (2022-03-10)
* data.table 1.14.0
* dplyr 1.0.6
* tidyr 1.1.3
* rhmmer 0.1.0

This programs should be installed system-wide:

* prodigal 2.6.3
* chips from EMBOSS:6.6.0.0
* hmmsearch from HMMER 3.3.2
* MMseqs2 635911ecf4ca5a2615e42931d7c0c04fe39a55cf
* psiblast 2.6.0+
* blastdbcmd: 2.6.0+
* muscle 3.8.31
* mafft 7.310


# nextflow-ratt

nextflow-ratt is written to run with docker based ratt for a convenience on cloud service or climb [http://climb.ac.uk] system.

RATT - Rapid Annotation Transfer Tool is developed at Wellcome Trust Sanger Institute [http://ratt.sourceforge.net/documentation.html]. However, the version I used to build the docker image was obtained from https://gitlab.com/LPCDRP/RATT.git

Example data run along with this nextflow script was obtained from http://ratt.sourceforge.net/example.html

# How to run

1. Get docker image

```
docker pull thanhleviet/ratt
```

2. Run nextflow-ratt with example

```
nextflow thanhleviet/nextflow-ratt
```

3. Run nextflow-ratt with your own data

```
nextflow thanhleviet/nextflow-ratt --help
```

The parameters are similar to the native **ratt** command.

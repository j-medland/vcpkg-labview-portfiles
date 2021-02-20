# vcpkg Port Files for NI's Software Libraries

Portfiles to support adding LabVIEW's C/C++ libraries into vcpkg.

This repository doesn't hold any NI or other party owned code, it simply provides port files which copy files from your local LabVIEW installation place them into vcpkg's ecosystem.

Some portfiles may also download and extract components from .vip files. Use of these files would be need to comply with the licences obtained from the code owners.

To use custom port files 
 ```powershell
    .\vcpkg.exe install PACKAGE_NAME --overlay-ports=PATH_TO_THIS_REPOSITORY
```

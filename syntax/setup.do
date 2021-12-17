//Set base directory: change the base directory here
global projdir 	""


//Make empty folders for output and cleaned data (comment out if these folders already exist) 

mkdir "${projdir}/cleandata"
mkdir "${projdir}/cleandata/Figure3"
mkdir "${projdir}/cleandata/Table1"
mkdir "${projdir}/output"
mkdir "${projdir}/output/appendix_figure"
mkdir "${projdir}/output/Figure1"
mkdir "${projdir}/output/Figure2"
mkdir "${projdir}/output/Figure3"
mkdir "${projdir}/output/Figure4"
mkdir "${projdir}/output/Table1" 

local ssc_packages dataout 

    if !missing("`ssc_packages'") {
        foreach pkg in "`ssc_packages'" {
            capture which `pkg'
            if _rc == 111 {                 
               dis "Installing `pkg'"
               quietly ssc install `pkg', replace
               }
        }
    }
	
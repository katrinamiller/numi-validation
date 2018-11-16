CXX=g++

CXXFLAGS=-std=c++17 -Wall -g

CPPFLAGS=-I $(BOOST_INC) \
	 -I $(CANVAS_ROOT_IO_INC) \
         -I $(CANVAS_INC) \
         -I $(CETLIB_INC) \
	 -I $(CETLIB_EXCEPT_INC) \
         -I $(FHICLCPP_INC) \
         -I $(GALLERY_INC) \
         -I $(LARCOREOBJ_INC) \
         -I $(LARDATAOBJ_INC) \
         -I $(NUSIMDATA_INC) \
	 -I $(LARSIM_INC) \
         -I $(ROOT_INC)

LDFLAGS=$(shell root-config --libs) \
	-L $(CANVAS_ROOT_IO_LIB) -l canvas_root_io\
	-L $(CANVAS_LIB) -l canvas\
        -L $(CETLIB_LIB) -l cetlib \
	-L $(CETLIB_EXCEPT_LIB) -l cetlib_except \
        -L $(GALLERY_LIB) -l gallery \
        -L $(NUSIMDATA_LIB) -l nusimdata_SimulationBase \
        -L $(LARCOREOBJ_LIB) -l larcoreobj_SummaryData \
        -L $(LARDATAOBJ_LIB) -l lardataobj_RecoBase \
	-L $(LARSIM_LIB) -l larsim_EventWeight_Base


UNAME := $(shell uname -s)

EXEC=bin/makehist

$(EXEC): src/geo/GeoVector.cxx src/geo/GeoAABox.cxx src/geo/GeoHalfLine.cxx src/geo/GeoLine.cxx src/geo/GeoLineSegment.cxx src/geo/GeoCone.cxx src/geo/GeoSphere.cxx src/geo/GeoTrajectory.cxx src/geo/GeoAlgo.cxx src/makehist.cpp 
	@echo Building $(EXEC)
	@mkdir -p bin
	@$(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) -o $@ $^


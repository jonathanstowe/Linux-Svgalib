use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'		=> 'Linux::Svgalib',
    'VERSION_FROM'	=> 'Svgalib.pm',
    'PREREQ_PM'		=> {},
    ($] >= 5.005 ?   
      (ABSTRACT_FROM => 'Svgalib.pm',
       AUTHOR     => 'Jonathan Stowe <jns@gellyfish.com>') : ()),
    'LIBS'		=> ['-lvga'],
    'DEFINE'		=> '',
    'INC'		=> '', 
     'OBJECT'		=> '$(O_FILES)',
     'XSPROTOARG'       => '-noprototypes',
);

class AMOS < FPM::Cookery::Recipe
  description 'AMOS is a collection of tools for genome assembly.'
  name 'amos'
  version '3.1.0' 
  revision 0
  homepage 'http://sourceforge.net/projects/amos/'
  source "http://sourceforge.net/projects/amos/files/amos/#{version}/amos-#{version}.tar.gz"
  md5 '51ebe835c93eef9acd39101738b2048c'
  
  # Let's install build dependencies first:
  build_depends ['curl', 'make', 'g++', 'libboost-all-dev', 'libqt4-dev', 'libxml-perl', 'libdbi-perl', 'libstatistics-descriptive-perl', 'gcc', 'libexpat1-dev']
  depends ['libqtcore4', 'libqtgui4', 'libqt3support4-perl']

  # Build:
  def build
    # Extra Prepare:
    safesystem 'sed -i "1i#include <getopt.h>" src/Align/find-tandem.cc'

    # Configure:
    configure :prefix => prefix,
      :enable_minimus => 'no'

    # Compile and Build:
    make
  end

  # Install:
  def install
    make :install, 'DESTDIR' => destdir
  end
end

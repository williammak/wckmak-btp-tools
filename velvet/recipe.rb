class Velvet < FPM::Cookery::Recipe
  description 'Sequence assembler for very short reads.'
  name 'velvet'
  version '1.2.10' 
  revision 0
  homepage 'https://www.ebi.ac.uk/~zerbino/velvet/'
  source "https://swift.rc.nectar.org.au:8888/v1/AUTH_809/Tools/velvet_#{version}.tgz"
  md5 '6e28c4b9bedc5f7ab2b947e7266a02f6'

  def build
    safesystem "make 'MAXKMERLENGTH=59' 'LONGSEQUENCES=1' 'OPENMP=1'"
    safesystem "make 'MAXKMERLENGTH=59' 'LONGSEQUENCES=1' 'OPENMP=1' color"
  end

  def install
    bin.install ['velvetg', 'velveth', 'velvetg_de', 'velveth_de']
  end
end
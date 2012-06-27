# coding: utf-8
class HtmlWithPygments < Redcarpet::Render::HTML

  #------------#
  # block_code #
  #------------#
  # コードハイライト
  def block_code( code, language )
    RubyPython.configure :python_exe => 'python2.7'
    Pygments.highlight( code, lexer: language, options: { encoding: 'utf-8' } )
  end

end

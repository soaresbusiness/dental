Hiodonto - Sistema para Dentistas
**Baixa e instala o Lazarus
https://www.lazarus-ide.org/

**Componentes a serem instalados no Lazarus encontrados no Gerenciador Online do Lazarus:

Emmet pascal;
Fortes Reports CE;
Indy10;
jvclaz;
PowerPDF
Rx;
SpkToolbar;
ZeosDBO.


**Instalar Tortoise SVN (https://tortoisesvn.net/) para baixar os componentes Acbr;

Crie uma pasta C:\acbr; (componentes da associação comercial do Brasil)
Dentro da pasta acbr criadada clique com o botão direito do mouse e escolha a opção SVN Checkout;
no Campo Url repository adicione o link https://svn.code.sf.net/p/acbr/code/trunk2;
no campo checkout directory adicione o caminho da pasta onde serão baixados o camponentes acbr;
Exemplo ("C:\acbr\trunk2").
clique no botão Ok

**Componentes ACBr (Associação Comercial do Brasil)

No Lazaraus no Menu Pacote, Na opção abrir arquivo de pacote(.lpk), no caminho C:\acbr\Pacotes\Lazarus\synapse, vai clicar no arquivo laz_synapse.lpk, compila e não instala
No Lazaraus no Menu Pacote; Na opção abrir arquivo de pacote(.lpk), no caminho C:\acbr\Pacotes\Lazarus\ACBrComum, vai clicar no arquivo ACBrComum.lpk, compila e instala
No Lazaraus no Menu Pacote; Na opção abrir arquivo de pacote(.lpk), no caminho C:\acbr\Pacotes\Lazarus\ACBrDiversos, vai clicar no arquivo ACBrDiversos.lpk, compila e instala
No Lazaraus no Menu Pacote; Na opção abrir arquivo de pacote(.lpk) no caminho C:\acbr\Pacotes\Lazarus\ACBrTCP, vai clicar no arquivo ACBrTCP.lpk, compila e instala
Reinicie o Lazarus e tente instalar somente o Zeusdbo
 
Instalação do Banco :

1- Intalar o mariadb 64bits;
2- Executar o script que está na pasta banco para criar o banco de dados;
3- Criar um usuário chamado Admin com as mesmas permissões de root no mariadb e senha #123;
4- Copiar o conteúdo da Pasta Unidade_C_Hiodonto para C: que está na pasta do projeto;
5- Copiar a pasta lib com a DLL do mariadb para C:\lib
6 - Clique no executável Hiodonto.exe 
7- Acesse com o Login Admin e a senha #123;
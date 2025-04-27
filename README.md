# Projeto Flutter 05 - Buscador de Gifs
Construindo um buscador de gifs
- Na página inicial, são exibidos os GIFs em alta. O usuário pode clicar nos GIFs, sendo direcionado para uma página que oferece uma visualização mais detalhada. Além disso, é possível compartilhar o link do GIF com outras pessoas. Por fim, há um campo de busca (TextField) que permite ao usuário inserir palavras-chave para encontrar GIFs relacionados a essas palavras, atualizando automaticamente a lista de GIFs.

<div align="center">

![Flutter_app5](https://github.com/user-attachments/assets/bc21b657-d66c-48b6-9347-689883bc4b20)

</div>

## Objetivos 
Projeto com o objetivo de aprofundar os conhecimentos na estrutura de consumo de APIs externas.

### Conceitos aprendidos 
- GridView
- GestureDetector (onTap |  onLongPress)
- Navigator
- Share

### Conceitos reforçados
- Future | FutureBuilder
- Http Reponse/Get

### Rodar o projeto 
1. **SDK do Flutter:**
   - Certifique-se de ter o SDK do Flutter instalado e configurado corretamente em seu ambiente de desenvolvimento.

2. **Variáveis de Ambiente:**
    - Crie a pasta `assets` na raiz do projeto e adicione o arquivo `.env`.
    - Dentro do arquivo `.env`, declare a variável `API_KEY` com a Chave da sua API de Gifs. Você pode encontrá-la e gerá-la em: [https://developers.giphy.com/](https://developers.giphy.com/).

   <br>

<b>Comandos:</b> 

Instalar dependências do projeto:

``` 

flutter pub get 

``` 

Conectar com o dispositivo e rodar o projeto:

``` 

flutter run

```

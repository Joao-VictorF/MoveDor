import 'package:fisio_app/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:fisio_app/custom_icons_icons.dart';

class Terms extends StatefulWidget {
  Terms({Key key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppController>(context); 
    
    return 
    Observer(
      builder: (_) {
        return 
        Scaffold(
          backgroundColor: appState.isDarkMode ? Colors.black87 : Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appState.isDarkMode ? Colors.black87 : Colors.white,
            leading: IconButton(
              tooltip: 'Voltar',
              icon: Icon(Icons.arrow_back, color: appState.isDarkMode ? Colors.white : Colors.black54),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: 
          Container (
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(bottom: 20),
            child:
             ListView(
                children: <Widget>[
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 3,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Termo de Consentimento Livre e Esclarecido', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                // POLÍTICA DE PRIVACIDADE
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'POLÍTICA DE PRIVACIDADE', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'A sua privacidade é importante para nós. O app '),
                        new TextSpan(text: 'MoveDor ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'respeita a sua privacidade e coleta o mínimo de informações possíveis, necessárias apenas para FAVORECER UMA PESQUISA CIENTÍFICA, com os dados sobre faixa etária, nível de escolaridade, gênero, prática de exercício físico, dor, incapacidade e das informações inseridas no '),
                        new TextSpan(text: 'DIÁRIO DE ATIVIDADE FÍSICA', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: ', recurso do app MOVEDOR. '),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'As informações são coletadas, porém sem vínculo com o SEU NOME, que é utilizado apenas no app, sem registro em nenhum banco de dados.'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Aceitando o termo em questão, você se disponibiliza, de maneira VOLUNTÁRIA, a ceder as informações supracitadas para documentação, análise e estudo pelos membros do '),
                        new TextSpan(text: 'PROJETO MOVIMENTO ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'o qual pretende articular ações para mapear a população acima de 18 anos, residente no município de Fortaleza – CE, com dores crônicas de origem musculoesquelética que interfiram no movimento, de maneira a caracterizar a saúde funcional dos indivíduos cadastrados, propondo ações que promovam a melhora da funcionalidade destes, com apoio da Universidade Federal do Ceará '),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei. O aplicativo pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade.'),
                      ],
                    ),
                  ),
                ),

                // TERMOS DE USO
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'TERMOS DE USO', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Ao baixar e instalar o aplicativo '),
                        new TextSpan(text: 'MOVEDOR ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'você concorda em cumprir esses termos de serviço, todas a leis e regulamentos aplicáveis e concorda que é responsável pelo cumprimento de todas a leis locais aplicáveis'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Mesmo baixando os arquivos presentes no aplicativo '),
                        new TextSpan(text: 'MOVEDOR', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: ', é proibido:'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: '1 – Modificar ou copiar os materiais, sem consentimento da equipe;'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: '2 – Tentar descompilar ou fazer engenharia reversa de qualquer sistema contido no aplicativo '),
                        new TextSpan(text: 'MOVEDOR ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: '3 – Usar os materiais para qualquer finalidade comercial ou não-comercial, essa sem autorização do projeto '),
                        new TextSpan(text: 'MOVIMENTO ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: '4 – Transferir os materiais para outra pessoa ou “espelhar” os materiais em qualquer outro servidor sem a autorização do projeto '),
                        new TextSpan(text: 'MOVIMENTO ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Sua participação na pesquisa é voluntária e ocorrerá pelo preenchimento questionários de avaliação no próprio aplicativo; a presente pesquisa não prevê nenhum dano a sua saúde.'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Entretanto, como os questionários solicitam sua opinião pessoal, poderá haver algum constrangimento durante a resposta.'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'O aplicativo '),
                        new TextSpan(text: 'MOVEDOR ', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: 'busca orientar e fornecer medidas de EDUCAÇÃO EM SAÚDE com o tema DOR LOMBAR CRÔNICA, não sendo recomendado para outras queixas.'),
                      ],
                    ),
                  ),
                ),

                // DIREITOS AUTORAIS
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'DIREITOS AUTORAIS', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'O aplicativo '),
                        new TextSpan(text: 'MOVEDOR', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                        new TextSpan(text: ', é uma proposta de educação em saúde multimídia, dispondo de diferentes formas de informar sobre o tema proposto: vídeos narrados, textos educativos, quiz, infográfico e um diário de atividades. '),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Para a criação das diferentes mídias utilizadas, utilizou-se da junção de desenhos, trilhas sonora, narração, texto e layouts dos próprios desenvolvedores com consulta e uso de recursos de bibliotecas gratuitas para uso não comercial.'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Replicar ou utilizar os recursos resultados do trabalho de desenvolvimento do aplicativo MOVEDOR sem autorização do projeto MOVIMENTO é proibido! Os autores responsáveis pelos recursos originais foram: Ana Carla Lima Nunes, Fabianna Resende de Jesus Moraleida, Ana Ellen Nascimento, Anna Larissa Sena Gonçalves, Ana Eloise Ferreira Neves, Andreza Deyse Leal de Sousa, Alice Fortes Pereira, Arthur Anthunes Rangel da Silva, Isaac Santos Félix, Mardeson Herculano Acácio, Narciso Ferreira de Menezes Filho, Anna Larissa Sena Gonçalves, Johnnie Brian Santos da Costa, João Victor Freitas R. De Sousa, Isaac Gondim Geraldo, César Olavo e Vanessa Soares Mota Vieira.'),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Os demais recursos foram retirados do site freepik ('),
                        new TextSpan(text: 'www.freepik.com', style: TextStyle(color: Colors.blue)),
                        new TextSpan(text: ') , utilizando do direito de reprodução não comercial com citação de autoria; além da trilha sonora, baixada gratuitamente pelo site'),
                        new TextSpan(text: ' www.bensound.com', style: TextStyle(color: Colors.blue)),
                        new TextSpan(text: ', também com uso não comercial autorizado.'),

                      ],
                    ),
                  ),
                ),
                
                // CONSIDERAÇÕES FINAIS
                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'CONSIDERAÇÕES FINAIS', style: new TextStyle(fontWeight: FontWeight.bold, fontFamily: 'MontserratBold')),
                      ],
                    ),
                  ),
                ),

                Container (
                  margin: EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: 
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: TextStyle(
                        fontFamily: 'MontserratRegular',
                        color: Color(0xFF36a9b0),
                        fontSize: appState.fontSize.toDouble() >= 30.0 ? 30.0 : appState.fontSize.toDouble() + 2,

                      ),
                      children: <TextSpan>[
                        new TextSpan(text: 'Se você tiver alguma consideração ou dúvida, sobre a sua participação na pesquisa, entre em contato com o Comitê de Ética em Pesquisa da UFC/PROPESQ – Rua Coronel Nunes de Melo, 1000 - Rodolfo Teófilo, fone: 3366-8344. (Horário: 08:00-12:00 horas de segunda a sexta-feira). O CEP/UFC/PROPESQ é a instância da Universidade Federal do Ceará responsável pela avaliação e acompanhamento dos aspectos éticos de todas as pesquisas envolvendo seres humanos'),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ), 

          floatingActionButton: 
            appState.isDarkMode ?
              SpeedDial (
                closeManually: true,
                marginRight: 10,
                marginBottom: 10,
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 22.0),
                curve: Curves.bounceIn,
                overlayOpacity: 0,
                tooltip: 'Preferências',
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 5,
                shape: CircleBorder(),
                children: [
                  SpeedDialChild(
                    labelWidget: 
                    Container(
                      width: 180,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(25)
                      ),
                      padding: EdgeInsets.all(10),
                      // color: Colors.white,
                      child: Text(
                        'Ativar modo claro',
                        textAlign: TextAlign.center,
                        style: 
                        TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    onTap: () {
                      appState.changeTheme();
                    }, 
                    child: 
                    Icon(
                      CustomIcons.sun,
                      color: Colors.black54,
                    )
                  ),
                  
                  SpeedDialChild(
                    labelWidget: 
                    Container(
                      width: 180,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(25)
                      ),
                      padding: EdgeInsets.all(10),
                      // color: Colors.white,
                      child: Text(
                        'Diminuir fonte',
                        textAlign: TextAlign.center,
                        style: 
                        TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    child: Icon(CustomIcons.remove, color: Colors.black54),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () =>  appState.decreaseFontSize(),
                  ),
                  
                  SpeedDialChild(
                    labelWidget: 
                    Container(
                      width: 180,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(25)
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Aumentar fonte',
                        textAlign: TextAlign.center,
                        style: 
                        TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    child: Icon(CustomIcons.plus, color: Colors.black45,),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => appState.increaseFontSize()
                  )
                ],
              )
            :
              SpeedDial (
                closeManually: true,
                marginRight: 10,
                marginBottom: 10,
                animatedIcon: AnimatedIcons.menu_close,
                animatedIconTheme: IconThemeData(size: 22.0),
                curve: Curves.bounceIn,
                overlayOpacity: 0,
                tooltip: 'Preferências',
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white70,
                elevation: 5,
                shape: CircleBorder(),
                children: [
                  SpeedDialChild(
                    labelWidget: 
                    Container(
                      width: 180,
                      decoration: new BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(25) 
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Ativar modo escuro',
                        textAlign: TextAlign.center,
                        style: 
                        TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    backgroundColor: Colors.black87,
                    onTap: () {
                      appState.changeTheme();
                    }, 
                    child: 
                      Icon(
                        CustomIcons.moon_1,
                        color: Colors.white70,
                      )
                  ),
                  
                  SpeedDialChild(
                    labelWidget: 
                    Container(
                      width: 180,
                      decoration: new BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(25) 
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Diminuir fonte',
                        textAlign: TextAlign.center,
                        style: 
                        TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    
                    child: Icon(CustomIcons.remove, color: Colors.white70),
                    backgroundColor: Colors.black87,
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () =>  appState.decreaseFontSize(),
                  ),

                  SpeedDialChild(
                    labelWidget: 
                    Container(
                      width: 180,
                      decoration: new BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.rectangle,
                        borderRadius: new BorderRadius.circular(25) 
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Aumentar fonte',
                        textAlign: TextAlign.center,
                        style: 
                        TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                    child: Icon(CustomIcons.plus, color: Colors.white70,),
                    backgroundColor: Colors.black87,
                    labelStyle: TextStyle(fontSize: 18.0),
                    onTap: () => appState.increaseFontSize()
                  ),
                ],
              ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        );
      }
    );
  }
}
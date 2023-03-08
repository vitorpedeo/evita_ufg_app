// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/widgets/body_text.dart';
import 'package:evita_ufg_app/app/widgets/heading_text.dart';
import 'package:evita_ufg_app/core/theme/custom.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.keyboard_backspace_outlined,
                      size: 24,
                    ),
                    label: const BodyText(
                      'Voltar',
                      color: CustomTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const HeadingText('Termos de Uso'),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    HeadingText(
                      'Política de Privacidade',
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    BodyText(
                        'A sua privacidade é importante para nós. É política do Evita UFG respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no app.'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'O nosso site pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade.'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'O uso continuado de nosso app será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contato conosco.'),
                    SizedBox(
                      height: 12,
                    ),
                    HeadingText(
                      'Compromisso do Usuário',
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    BodyText(
                        'O usuário se compromete a fazer uso adequado dos conteúdos e da informação que o Evita UFG oferece no site e com caráter enunciativo, mas não limitativo:'),
                    SizedBox(
                      height: 4,
                    ),
                    BodyText(
                        'A) Não se envolver em atividades que sejam ilegais ou contrárias à boa fé a à ordem pública;'),
                    BodyText(
                        'B) Não difundir propaganda ou conteúdo de natureza racista, xenofóbica, ou casas de apostas online, jogos de sorte e azar, qualquer tipo de pornografia ilegal, de apologia ao terrorismo ou contra os direitos humanos;'),
                    BodyText(
                        'C) Não causar danos aos sistemas físicos (hardwares) e lógicos (softwares) do Evita UFG, de seus fornecedores ou terceiros, para introduzir ou disseminar vírus informáticos ou quaisquer outros sistemas de hardware ou software que sejam capazes de causar danos anteriormente mencionados.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

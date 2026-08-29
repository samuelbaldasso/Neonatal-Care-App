import 'package:flutter/material.dart';

import '../../domain/entities/topic.dart';

class TopicsLocalDataSource {
  const TopicsLocalDataSource();

  List<Topic> getTopics() => const [
        Topic(
          index: 1,
          title: 'Boas-vindas',
          subtitle: 'Um começo com informação e acolhimento',
          imageLabel: 'Família + bebê',
          icon: Icons.waving_hand_rounded,
          body:
              'Este guia foi criado para aproximar pais, familiares e profissionais dos cuidados neonatais humanizados. A unidade neonatal reúne tecnologia, segurança e equipe especializada para cuidar de recém-nascidos que precisam de atenção diferenciada.',
          bullets: [
            'Informação clara para a família',
            'Cuidado individualizado',
            'Participação dos pais sempre que segura e possível',
          ],
        ),
        Topic(
          index: 2,
          title: 'O que são Unidades Neonatais?',
          subtitle: 'Ambientes preparados para necessidades específicas',
          imageLabel: 'Incubadora + equipe',
          icon: Icons.local_hospital_rounded,
          body:
              'Unidades neonatais são serviços hospitalares estruturados para observar, tratar e acompanhar recém-nascidos que necessitam de cuidados especiais. O nível de suporte varia conforme a condição clínica do bebê.',
          bullets: [
            'Monitorização contínua quando necessária',
            'Suporte respiratório e outros tratamentos',
            'Profissionais capacitados e trabalho multiprofissional',
          ],
        ),
        Topic(
          index: 3,
          title: 'Parto vaginal e cuidado neonatal',
          subtitle: 'A via de parto deve ser individualizada',
          imageLabel: 'Parto seguro',
          icon: Icons.pregnant_woman_rounded,
          body:
              'A via de parto não é definida pela existência de uma unidade neonatal. Quando o parto vaginal é clinicamente indicado e seguro, ele pode ser uma opção adequada; em outras situações, a cesárea pode ser necessária. O foco é segurança materna e neonatal, com decisões compartilhadas com a equipe.',
          bullets: [
            'Não existe uma única via de parto ideal para todas as pessoas',
            'Condições maternas e fetais orientam a decisão',
            'A unidade neonatal oferece suporte quando o recém-nascido precisa',
          ],
        ),
        Topic(
          index: 4,
          title: 'Benefícios do contato pele a pele',
          subtitle: 'Vínculo, estabilidade e participação da família',
          imageLabel: 'Pele a pele',
          icon: Icons.favorite_rounded,
          body:
              'Quando mãe e bebê estão clinicamente estáveis, o contato pele a pele precoce pode favorecer vínculo, amamentação e regulação térmica. Em recém-nascidos prematuros ou de baixo peso, o Método Canguru é uma estratégia de cuidado humanizado que pode ser realizada com orientação profissional.',
          bullets: [
            'Favorece o vínculo',
            'Ajuda no controle térmico',
            'Apoia o aleitamento',
            'Pode reduzir estresse e separação',
          ],
        ),
        Topic(
          index: 5,
          title: 'O papel dos pais',
          subtitle: 'Família também faz parte do cuidado',
          imageLabel: 'Pais participando',
          icon: Icons.family_restroom_rounded,
          body:
              'O cuidado neonatal humanizado procura envolver mãe, pai e família de forma segura. Perguntar, tocar, conversar com o bebê e participar de cuidados autorizados pela equipe pode fortalecer confiança e vínculo.',
          bullets: [
            'Pergunte como participar',
            'Respeite as orientações de higiene e segurança',
            'Comunique dúvidas e mudanças no estado do bebê',
          ],
        ),
        Topic(
          index: 6,
          title: 'Evidências e recomendações',
          subtitle: 'Informação baseada em fontes públicas de saúde',
          imageLabel: 'Diretrizes',
          icon: Icons.fact_check_rounded,
          body:
              'O Ministério da Saúde do Brasil destaca o Método Canguru como uma abordagem de atenção humanizada para recém-nascidos pré-termo ou de baixo peso, especialmente quando há internação em unidade neonatal. A OMS também apoia contato pele a pele/KMC para bebês prematuros ou doentes quando clinicamente apropriado.',
          bullets: [
            'Ministério da Saúde — Método Canguru',
            'OMS — cuidados neonatais e contato pele a pele',
            'Condutas devem considerar a condição clínica individual',
          ],
        ),
        Topic(
          index: 7,
          title: 'Segurança e estrutura',
          subtitle: 'Tecnologia e humanização caminham juntas',
          imageLabel: 'Monitor + cuidado',
          icon: Icons.health_and_safety_rounded,
          body:
              'Humanizar não significa abrir mão da tecnologia. Monitores, incubadoras, oxigenoterapia e outros recursos existem para responder às necessidades do bebê. O cuidado ideal combina segurança clínica, ambiente adequado e presença familiar quando possível.',
          bullets: [
            'Higienização das mãos é essencial',
            'Equipamentos devem ser usados conforme indicação',
            'A equipe orienta a família sobre participação segura',
          ],
        ),
        Topic(
          index: 8,
          title: 'Perguntas frequentes',
          subtitle: 'Respostas para dúvidas comuns',
          imageLabel: 'Perguntas',
          icon: Icons.help_rounded,
          body:
              'Nem todo recém-nascido precisa de unidade neonatal. Nem toda internação significa um quadro grave. A necessidade depende da idade gestacional, peso, adaptação após o nascimento e outras condições clínicas avaliadas pela equipe.',
          bullets: [
            'Peça explicações sobre o plano de cuidado',
            'Pergunte quais visitas e contatos são permitidos',
            'Confirme quais sinais exigem comunicação imediata',
          ],
        ),
      ];
}

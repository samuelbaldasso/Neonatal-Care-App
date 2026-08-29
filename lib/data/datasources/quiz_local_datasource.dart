import '../../domain/entities/quiz_question.dart';

class QuizLocalDataSource {
  const QuizLocalDataSource();

  List<QuizQuestion> getQuestions() => const [
        QuizQuestion(
          question: 'Qual é uma das funções de uma unidade neonatal?',
          options: [
            'Fazer todo parto vaginal',
            'Oferecer cuidado especializado a recém-nascidos que precisam',
            'Substituir o pré-natal',
            'Impedir a participação dos pais',
          ],
          correctOptionIndex: 1,
        ),
        QuizQuestion(
          question: 'Sobre a via de parto, qual afirmação está correta?',
          options: [
            'Há uma via ideal para todas as gestantes',
            'A unidade neonatal determina a via de parto',
            'A decisão deve considerar as condições maternas e fetais',
            'Cesárea nunca é necessária',
          ],
          correctOptionIndex: 2,
        ),
        QuizQuestion(
          question: 'Quando indicado e com segurança, o contato pele a pele pode:',
          options: [
            'Favorecer vínculo e controle térmico',
            'Substituir todos os tratamentos',
            'Ser feito sem orientação em qualquer situação',
            'Eliminar a necessidade de monitorização',
          ],
          correctOptionIndex: 0,
        ),
        QuizQuestion(
          question: 'O Método Canguru enfatiza:',
          options: [
            'Separação máxima entre família e bebê',
            'Cuidado humanizado, contato pele a pele e participação da família',
            'Apenas tecnologia',
            'Apenas amamentação',
          ],
          correctOptionIndex: 1,
        ),
        QuizQuestion(
          question: 'Quem define se um cuidado é seguro para o bebê internado?',
          options: [
            'Somente a internet',
            'Somente outros pais',
            'A equipe de saúde, considerando a condição clínica do bebê',
            'Qualquer aplicativo',
          ],
          correctOptionIndex: 2,
        ),
      ];
}

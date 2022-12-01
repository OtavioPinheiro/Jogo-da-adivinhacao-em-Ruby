def da_boas_vindas
    puts "Bem vindo ao jogo de adivinhação"
    puts "Qual o seu nome?"
    nome = gets.strip
    puts "\n"
    puts "Começaremos o jogo para você, #{nome}"
    return nome
end

def pede_a_dificuldade
    puts "Qual a dificuldade que deseja?"
    puts "1-Fácil\t2-Médio\t3-Difícil"
    return dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 50
    when 2
        maximo = 100
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    return sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    puts "\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Informe um número"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"
    return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute.to_i

    if acertou
        puts "Acertou!"
        return true
    end

    maior = numero_secreto > chute.to_i
    if maior
        puts "O número secreto é maior"
    else
        puts "O número secreto é menor"
    end

    return false
end

def verifica_se_perdeu(tentativa, limite_de_tentativas, numero_secreto)
    if tentativa >= limite_de_tentativas
        puts "\nQue pena! Você perdeu! =("
        puts "O número sorteado era: #{numero_secreto}\n"
    end
end

def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto(dificuldade)

    pontos = 1000
    limite_de_tentativas = 5
    chutes = []

    for tentativa in 1..limite_de_tentativas
        chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
        chutes << chute

        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos -= pontos_a_perder

        if verifica_se_acertou(numero_secreto, chute)
            break
        else
            verifica_se_perdeu(tentativa, limite_de_tentativas, numero_secreto)
        end
    end

    puts "\nVocê ganhou #{pontos} pontos.\n"
end

nome = da_boas_vindas()
dificuldade = pede_a_dificuldade()

def quer_jogar?
    puts "\nDeseja jogar novamente? \n(S-Sim | N-Não)"
    quer_jogar = gets.strip
    quer_jogar.upcase == "S"
end

loop do
    joga(nome, dificuldade)
    if !quer_jogar?
        break
    end
end

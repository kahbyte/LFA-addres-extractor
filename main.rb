#Esse projeto implementa uma RegEx para reconhecer endereços em textos. 
#O formato dos endereços devem seguir o padrão dos correios.
# TIPO, NOME, NUMERO, COMPLEMENTO (opcional), BAIRRO, CIDADE - (HÍFEN) - ESTADO, CEP

class Address
  def start
    puts("insira sua string")
    text = gets.chomp
    
    #A regex é dividida em grupos de captura para ajudar a conseguir separar os valores.
    common_adress_regex = /(Rua|R\.|rua|r\.|Avenida|Av\.|av\.|avenida|Alameda|alameda|Estrada|estrada)((\s\w[A-Za-záâãéêíóôõúçÁÂÃÉÍÓÔÕÚÇ]+){1,10}),(\s\d+),((\s\w+){1,10},)?((\s\w[A-Za-záâãéêíóôõúçÁÂÃÉÍÓÔÕÚÇ]+){1,10}),((\s\w[A-Za-záâãéêíóôõúçÁÂÃÉÍÓÔÕÚÇ]+){1,10})\s-\s([A-Za-z]{2}),(\s\d{5}-\d{3})/

    # se achar algum endereço dentro do texto inserido, entra no if
    if adresses = text.scan(common_adress_regex)
      count = 1
      adresses.map do |i|
        #Grupos de captura contém alguns subgrupos. Eles são excluidos do vetor de retorno. 
        i.delete_at 2
        i.delete_at 4
        i.delete_at 5
        i.delete_at 6

        puts "ENDEREÇO #{count}"
        puts "TIPO: #{i[0]}"
        puts "LOGRADOURO:#{i[1]}"
        puts "NÚMERO:#{i[2]}"
        if i[3].nil? then puts "COMPLEMENTO: #{i[3]}" else puts "COMPLEMENTO: #{i[3].upcase}" end
        puts "BAIRRO:#{i[4]}"
        puts "CIDADE:#{i[5]}"
        puts "ESTADO: #{i[6].upcase}"
        puts "CEP: #{i[7]}"
        puts "---------------------------------------------------------------"
        count += 1
      end
    end
  end
end

a = Address.new
a.start


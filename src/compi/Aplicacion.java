package compi;

import java.io.*;



public class Aplicacion {

	public static void main(String[] args) {
		

        
        try {
            
            AnalizadorLexico lexer = new AnalizadorLexico( new FileReader("entrada.txt") );
            AnalizadorSintantico p = new AnalizadorSintantico(lexer);
            p.parse();
            System.out.println("Ejecutado");
            
        } catch (Exception e) {
            // TODO: Add catch code
            e.printStackTrace();
        }
		
	}

}

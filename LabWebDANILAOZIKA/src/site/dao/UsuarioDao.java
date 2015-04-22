package site.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import site.vo.PerfilUsuario;
import site.vo.Usuario;

import com.mysql.jdbc.Statement;

public class UsuarioDao extends Dao {
	
	public Usuario getUsarioCompleto(int idUsuario)
	{
		Connection conn = null;
		
		
		try{
			
			conn = getConnection();
		String sql = "SELECT id_usuario, nome, telefone, email, password FROM usuarios where id_usuario=?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, idUsuario);
		ResultSet result = stmt.executeQuery();
		
		if(result.next())
		{
			Usuario usuario = new Usuario();
			
			usuario.setId_usuario(result.getInt("id_usuario"));
			usuario.setNome(result.getString("nome"));
			usuario.setTelefone(result.getString("telefone"));
			usuario.setEmail(result.getString("email"));
			usuario.setPassword(result.getString("password"));
			
			return usuario;
		}
		else
	      {
	        return null;
	      }
		}
	    catch (Exception ex)
	    {
	      ex.printStackTrace();
	      return null;
	    }
	    finally
	    {
	      if (conn != null)
	      {
	        try
	        {
	          conn.close();
	        }
	        catch(Exception closeEx)
	        {
	          //do nothing
	        }
	      }
	    }
	}
	
	
	
	
	public Usuario getUsuario(String nome, String password)
	{
	    Connection conn = null;
	    
	    try
	    {
	      conn = getConnection();

	      String sql = "SELECT id_usuario, nome, telefone, email, password, perfil_usuario FROM usuarios where nome=? AND password=SHA1(?)";        

	      PreparedStatement stmt = conn.prepareStatement(sql);
	      stmt.setString(1, nome);
		  stmt.setString(2, password);
	      ResultSet result = stmt.executeQuery();

	      if (result.next())
	      {
	        Usuario usuario = new Usuario();
	     
	        usuario.setId_usuario(result.getInt("id_usuario"));
	        usuario.setNome(result.getString("nome"));
	        usuario.setTelefone(result.getString("telefone"));
	        usuario.setEmail(result.getString("email"));	              

	        short perfil = result.getShort("perfil_usuario");
			usuario.setPerfil(PerfilUsuario.fromValue(perfil));
			
	        return usuario;
	      }
	      else
	      {
	        return null;
	      }
	    }
	    catch (Exception ex)
	    {
	      ex.printStackTrace();
	      return null;
	    }
	    finally
	    {
	      if (conn != null)
	      {
	        try
	        {
	          conn.close();
	        }
	        catch(Exception closeEx)
	        {
	          //do nothing
	        }
	      }
	    }
	}

	
	
	public List<Usuario> getUsuarios()
	{
		Connection conn = null;
		List<Usuario> usuarios = new ArrayList<Usuario>();

		try
		{
			conn = getConnection();

			String sql = "SELECT id_usuario, nome, telefone, email, password FROM usuarios";        

			PreparedStatement stmt = conn.prepareStatement(sql);      
			ResultSet result = stmt.executeQuery();

			while (result.next())
			{
				Usuario usuario = new Usuario();
				usuario.setId_usuario(result.getInt("id_usuario"));
				usuario.setNome(result.getString("nome"));
				usuario.setTelefone(result.getString("telefone"));
				usuario.setEmail(result.getString("email"));
				usuario.setPassword(result.getString("password"));
			
				usuarios.add(usuario);
			}

			return usuarios;
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		finally
		{
			if (conn != null)
			{
				try
				{
					conn.close();
				}
				catch(Exception closeEx)
				{
					//do nothing
				}
			}
		}
	}


public boolean insertUsuario(Usuario usuario)
{
	Connection conn = null;

	try
	{
		//obtem conexao com o banco de dados
		conn = getConnection();
		conn.setAutoCommit(false);

		//define SQL para inser��o
		String sql = "insert into usuarios (nome, telefone, email, password, perfil_usuario) values (?, ?, ?, SHA1(?), 2);";
			
				       

		//instance Prepared statement especificando os par�metros do SQL
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, usuario.getNome());
		stmt.setString(2, usuario.getTelefone());
		stmt.setString(3, usuario.getEmail());
		stmt.setString(4, usuario.getPassword());

		//executa a opera��o no banco de dados
		int affectedRows = stmt.executeUpdate();

		//verifica se deu certo. Se sim, obtem a chave id_aluno gerada 
		if (affectedRows > 0)
		{  
			ResultSet rs = stmt.getGeneratedKeys();
			rs.next();

			//obtem a chave id_aluno no resultado da inser��o
			//1 indica primeira coluna no resultado vindo do banco de dados
			usuario.setId_usuario(rs.getInt(1));

		}
		else
		{
			//cancela as modifica��es no banco de dados
			conn.rollback();
			return false;
		}
			//confirma as modifica��es no banco de dados
			conn.commit();        
			return true;    
	
	}  
	catch (Exception ex)
	{
		ex.printStackTrace();
		return false;
	}
	finally
	{
		if (conn != null)
		{
			try
			{
				conn.close();
			}
			catch(Exception closeEx)
			{
				//do nothing
			}
		}
	}
}

public boolean updateUsuario(Usuario usuario)
{
	Connection conn = null;

	try
	{
		//obtem conexao com o banco de dados
		conn = getConnection();
		conn.setAutoCommit(false);

		//define SQL para atualiza��o
		String sql = "UPDATE usuarios SET nome=?, telefone=?, email=?, password=SHA1(?)  WHERE id_usuario=?";        

		//instance Prepared statement especificando os par�metros do SQL
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, usuario.getNome());
		stmt.setString(2, usuario.getTelefone());
		stmt.setString(3, usuario.getEmail());
		stmt.setString(4,  usuario.getPassword());
		stmt.setInt(5, usuario.getId_usuario());

		//executa a opera��o no banco de dados
		int affectedRows = stmt.executeUpdate();

		//verifica se deu certo. Se sim, atualiza a nota 
		if (affectedRows > 0)
		{  
				//confirma as modifica��es no banco de dados
				conn.commit();        
				return true;
			}
			else
			{
				//cancela as modifica��es no banco de dados
				conn.rollback();
				return false;
			}				      

	}
	catch (Exception ex)
	{
		ex.printStackTrace();
		return false;
	}
	finally
	{
		if (conn != null)
		{
			try
			{
				conn.close();
			}
			catch(Exception closeEx)
			{
				//do nothing
			}
		}
	}    
}

public boolean deleteUsuario(int idUsuario)
{
	Connection conn = null;

	try
	{
		//obtem conexao com o banco de dados
		conn = getConnection();

		//define SQL para atualiza��o
					
		String sql= "DELETE FROM usuarios WHERE id_usuario=? ";
	     

		//instance Prepared statement especificando os par�metros do SQL
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, idUsuario);

		//executa a opera��o no banco de dados
		return stmt.executeUpdate() > 0;
	}
	catch (Exception ex)
	{
		ex.printStackTrace();
		return false;
	}
	finally
	{
		if (conn != null)
		{
			try
			{
				conn.close();
			}
			catch(Exception closeEx)
			{
				//do nothing
			}
		}
	}    
}

}
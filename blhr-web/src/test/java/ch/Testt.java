package ch;

import java.io.File;
import java.io.IOException;

import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.exceptions.CannotReadException;
import org.jaudiotagger.audio.exceptions.InvalidAudioFrameException;
import org.jaudiotagger.audio.exceptions.ReadOnlyFileException;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;

public class Testt {
	
	
	public static void main(String[] args) throws Exception{
		
		  MP3File f = (MP3File) AudioFileIO.read(new File("d:/dddd.mp3"));  
		  MP3AudioHeader audioHeader = (MP3AudioHeader)f.getAudioHeader();  
		  System.out.println(audioHeader.getTrackLength());  
		
		
	}
	
	

}

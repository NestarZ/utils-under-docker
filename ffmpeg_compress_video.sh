docker run -v "${pwd}:/temp/" jrottenberg/ffmpeg -i /temp/${inputName} -vcodec libx264 -crf 20 /temp/${outputName}

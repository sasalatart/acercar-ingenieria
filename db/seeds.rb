def create_uploaded_image(asset_dir, name, extension)
  path = "#{Rails.root}/app/assets/images/#{asset_dir}/#{name}.#{extension}"
  image_file = File.new(path)
  ActionDispatch::Http::UploadedFile.new(
    filename: File.basename(image_file),
    tempfile: image_file,
    type: MIME::Types.type_for(path).first.content_type
  )
end

puts('Creating Photos...')

%w(initial majors articles questions contact).each do |name|
  LandingPhoto.create!(image: create_uploaded_image('landing_page_images', name, 'jpg'), pinned: true)
end

puts('Creating Categories...')

%w(Investigaciones Alumnos Profesores Ex-Alumnos Industria Otros).each do |name|
  Category.create!(name: name)
end

puts('Creating Majors...')

ciencias_ambientales = Major.create!(
  name: 'Ciencias Ambientales',
  description: '<div class="colspan8 content-page gridbox major-en-ciencias-ambientales"><h2>Major en Ciencias Ambientales</h2><p>El Major en Ciencias Ambientales desarrolla la capacidad de evaluar la sustentabilidad y predecir el impacto de las actividades antropogénicas, proponiendo soluciones a las problemáticas ambientales que afectan el bienestar presente y futuro de las personas y nuestro entorno natural, con base en la ecología, geología, calidad del agua, suelo y aire.<p>Además, permite desarrollar competencias con mayor profundización en ciencias requeridas para el desarrollo de soluciones y evaluación de riesgos ambientales.<p><strong>Exploratorios Recomendados</strong><p>• ICH2304 Ingeniería Ambiental<br>• ICH1005 Desafíos en Recursos Hídricos y Medio Ambiente<p>Estos cursos permiten a los estudiantes obtener una visión general del Major en Ciencias Ambientales y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Hidrogeoquímica<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ciencias Ambientales podrán desempeñarse en áreas que incluyen: Instituciones públicas, centros de innovación, investigación y desarrollo, consultorías y<br>área ambiental de empresas.<p><strong>Jefe de Major</strong><p>“El futuro nos depara desafíos insospechados de sustentabilidad a nivel local y global. El Major en Ciencias Ambientales te prepara para cumplir tu rol en la sociedad a través de una formación interdisciplinaria, orientada a identificar, proponer, y modelar soluciones a problemas actuales y futuros en este ámbito”.<p style=text-align:right>Pablo Pastén González<p style=text-align:right>mca@ing.puc.cl<p><strong>Malla Curricular Major en Ciencias Ambientales</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ciencias-ambientales1.png><img alt="Ciencias Ambientales"class="aligncenter size-large wp-image-27785"height=790 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ciencias-ambientales1-1024x790.png width=1024></a></div>',
  short_description: 'El Major en Ciencias Ambientales desarrolla la capacidad '\
                     'de evaluar la sustentabilidad y predecir el impacto de las '\
                     'actividades antropogénicas, proponiendo soluciones a las '\
                     'problemáticas ambientales.',
  video_url_code: 'p4F2LEFXpQ8',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ciencias_ambientales', 'png')
)

computacion = Major.create!(
  name: 'Computación',
  description: '<div class="colspan8 content-page gridbox major-en-computacion"><h2>Major en Computación</h2><p>El Major en Computación desarrolla la capacidad de aplicar soluciones a problemas complejos de la industria, desarrollando proyectos innovadores mediante el diseño y modelación de procesos computacionales.<p>Este Major busca posicionar a sus graduados como protagonistas de los más importantes desafíos del siglo XXI, tales como redes sociales, salud, educación, urbanismo, robótica, astronomía, redes de empresas, finanzas, marketing, optimización y muchos otros.  En todos estos ámbitos la componente computacional se ha convertido en fundamental y, muchas veces, en la única posibilitadora de grandes avances y soluciones radicales. Nuestra sólida formación los habilita como investigadores, desarrolladores o gestores, capaces de aportar e innovar en diversas áreas.<p><strong>Exploratorio Recomendado</strong><p>IIC1005 Computación: Ciencia y Tecnología para un mundo digital<p>Este curso permite a los estudiantes obtener una visión general del Major en Computación y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Fundamentos Científicos y Tecnológicos de la Computación<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Computación es- tarán capacitados para modelar problemas complejos y diseñar e implemen- tar sistemas, procesos, componentes y programas computacionales para de- sempeñarse en diversos campos industriales y de investigación.<p><strong>Jefe de Major</strong><p>“Este Major te da las herramientas para convertirte en desarrollador, investigador o gestor de la tecnología computacional moderna”.<p style=text-align:right>Yadran Eterovic Solano<br>majorcomputacion@ing.puc.cl<p><strong>Malla Curricular Major en Computación</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/computacion1.png><img alt=Computación class="aligncenter size-large wp-image-27783"height=641 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/computacion1-1024x641.png width=1024></a></div>',
  short_description: 'El Major en Computación desarrolla la capacidad de aplicar '\
                     'soluciones a problemas complejos de la industria, '\
                     'desarrollando proyectos innovadores mediante el diseño y '\
                     'modelación de procesos computacionales.',
  video_url_code: 'NFUkXwYSgPA',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'computacion', 'png')
)

geociencias = Major.create!(
  name: 'Geociencias',
  description: '<div class="colspan8 content-page gridbox major-en-geociencias-2"><h2>Major en Geociencias</h2><p>El Major en Geociencias desarrolla la capacidad de implementar proyectos tradicionales del área, proponiendo soluciones para resolver los problemas derivados de la interacción humana con los fenómenos naturales y del crecimiento humano en un planeta finito. Proyectos tradicionales de esta área son la exploración geológica de yacimientos en el área de la minería y la evaluación de peligros geológicos para las obras civiles.<p>La interacción de las Geociencias con otras disciplinas queda de manifiesto en proyectos multidisciplinarios que utilizan herramientas y conocimientos propios de la geología y la geofísica, que pueden ser aplicados en las ciencias naturales, las ciencias de la ingeniería y las ciencias sociales.<p><strong>Exploratorios Recomendados</strong><p>ICE2623 Introducción a la Geología Física<br>IMM2003 Geología Minera<p>Estos cursos permiten a los estudiantes obtener una visión general del Major en Geociencias y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Recursos Geológicos<br>Peligros Geológicos<br>Geología Ambiental<br>Articulación Ingeniería Civil<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Geociencias estarán capacitados para trabajar en equipos multidisciplinarios con interacción entre las Geociencias y las áreas de Ingeniería. Proyectos de este tipo pueden estar relacionados con el tratamiento de la contaminación ambiental, el ordenamiento territorial, la evaluación del peligro geológico, la evaluación y exploración de recursos minerales, la exploración de recursos energéticos, entre otros.<p><strong>Jefe de Major</strong><p>“El Major de Geociencias de la UC, te permitirá descubrir el mundo de la Geología y la Geofísica, y su interacción con otras disciplinas”.<p style=text-align:right>Gloria Arancibia Hernández<br>majorgeociencias@ing.puc.cl<p><span style=font-size:small><strong>Malla curricular Major en Geociencias</strong></span><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/geociencias3.png><img alt=Geociencias class="aligncenter size-large wp-image-27818"height=769 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/geociencias3-1024x769.png width=1024></a></div>',
  short_description: 'Los Licenciados en Ciencias de la Ingeniería con Major en '\
                     'Geociencias estarán capacitados para trabajar en equipos '\
                     'multidisciplinarios con interacción entre las Geociencias '\
                     'y las áreas de Ingeniería.',
  video_url_code: 'tJNrrxo4FW4',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'geociencias', 'png')
)

ing_ambiental = Major.create!(
  name: 'Ingeniería Ambiental',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-ambiental"><h2>Major en Ingeniería Ambiental</h2><p>El Major en Ingeniería Ambiental desarrolla la capacidad de proteger y administrar nuestros recursos naturales, incluyendo el aire, el agua y las fuentes de energía, además de entender los sistemas naturales, cuantificando y diseñando estrategias para minimizar el impacto de las actividades humanas, creando sistemas de infraestructura sustentables.<p>Este Major combina diversas especialidades, incluyendo geología, ecología, física, química, hidrología, biología y políticas públicas, entre otras. Los graduados aplican los principios fundamentales de estas disciplinas, junto a métodos analíticos, cuantitativos y experimentales, para identificar y desarrollar soluciones sustentables y eficaces a problemas ambientales complejos.<p><strong>Exploratorios Recomendados</strong><p>ICH2304 Ingeniería Ambiental<br>ICH1005 Desafíos en Recursos Hídricos y Medio Ambiente<p>Estos cursos permiten a los estudiantes obtener una visión general del Major en Ingeniería Ambiental y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Innovación en Sistemas de Tratamientos de Agua Hidrogeoquímica<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Ambiental podrán desempeñarse en algunas de las múltiples opciones laborales que incluyen: sector de minería, empresas sanitarias, centros de innovación, investigación y desarrollo, sector público, consultorías.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Civil de la UC desarrolla en ti competencias amplias y a la vez enfocadas en el diseño y materialización de las obras de infraestructura. Da una formación amplia de ingeniería civil que te permite un discernimiento más gradual de tu área, especialización que se concretiza siguiendo uno de sus tracks. Esta mirada amplia es vital para resolver los problemas y articular los proyectos de infraestructura que necesita Chile“.<p style=text-align:right>Mauricio López Casanova<p style=text-align:right><a href=mailto:mic@ing.puc.cl>mic@ing.puc.cl</a><p><strong>Malla curricular Major en Ingeniería Ambiental</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--ambiental1.png><img alt="Ing. Ambiental"class="aligncenter size-large wp-image-27788"height=842 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--ambiental1-1024x842.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Ambiental desarrolla la capacidad '\
                     'de proteger y administrar nuestros recursos naturales, '\
                     'incluyendo el aire, el agua y las fuentes de energía.',
  video_url_code: 'pwv8CtOpN_8',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_ambiental', 'png')
)

ing_arquitectura = Major.create!(
  name: 'Ingeniería y Arquitectura',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-y-arquitectura"><h2>Major en Ingeniería y Arquitectura</h2><p>El Major en Ingeniería y Arquitectura desarrolla la capacidad de diseñar e implementar procesos de diseño y construcción más fluidos, factibles y sustentables. Es de carácter interdisciplinario y busca incrementar la empatía técnica de los profesionales de ambas disciplinas. Los estudiantes tienen una combinación de una formación ingenieril con una sensibilidad hacia la forma y el entorno, además de una comprensión y manejo de las necesidades y flujos de información entre estas disciplinas.<p>Este Major tiene un número limitado de vacantes por lo que se debe participar de un proceso de selección.<p>El Major en Ingeniería y Arquitectura permite la articulación con los títulos tradicionales de la Escuela de Ingeniería UC o con el título de Arquitecto UC, previo cumplimiento de los requisitos establecidos.<p><strong>Exploratorio Recomendado</strong><p>AQH0000 Introducción a la Arquitectura<p>Este curso permite a los estudiantes obtener una visión general del Major en<br>Ingeniería y Arquitectura y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Articulación Arquitectura<br>Articulación Ingeniería Civil (Ing. y Arquitectura)<br>Ingeniería y Arquitectura<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería y Arquitectura podrán desempeñarse en áreas como sistemas de construcción, ingeniería estructural, talleres arquitectónicos, construcciones sustentables, ingeniería de materiales, fundamentos del diseño y bellas artes.<p><strong>Jefe de Major</strong><p>“El Major de Ingeniería y Arquitectura es la base para la formación de profesionales con un perfil equilibrado e interdisciplinario de arquitectura, estructuras y construcción”.<p style=text-align:right>Claudio Mourgues Álvarez<br>mia@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería y Arquitectura</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--y-arquitectura.png><img alt="Ing. y Arquitectura"class="aligncenter size-large wp-image-27827"height=622 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--y-arquitectura-1024x622.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería y Arquitectura desarrolla la '\
                     'capacidad de diseñar e implementar procesos de diseño y '\
                     'construcción más fluidos, factibles y sustentables.',
  video_url_code: 'nS2r7bE2qt8',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_arquitectura', 'png')
)

ing_biologica = Major.create!(
  name: 'Ingeniería Biológica',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-biologica"><h2>Major en Ingeniería Biológica</h2><p>La Ingeniería Biológica es una nueva disciplina que integra la ingeniería con las Ciencias de la Vida. El Major en Ingeniería Biológica desarrolla la capacidad de entender cómo funcionan los sistemas biológicos y aplicar este conocimiento, tanto a la solución de problemas, como al desarrollo de tecnologías eficientes inspiradas en la biología.<p>Estas biotecnologías contribuyen a resolver un amplio espectro de necesidades, desde herramientas de diagnóstico, tratamiento y prevención de enfermedades, síntesis de compuestos de valor para la industria, diseño de materiales, desarrollo de nuevos dispositivos y procesos, y sustentabilidad ambiental.Este Major interdisciplinario combina de forma innovadora la enseñanza de las biociencias a nivel molecular y celular, con el análisis cuantitativo y sistémico de la ingeniería para el diseño y síntesis de soluciones biotecnológicas.<p><strong>Exploratorio Recomendado</strong><p>IIQ2663  Fundamentos de Biotecnología<p>Este curso permite a los estudiantes obtener una visión general del Major en Ingeniería Biológica y las áreas del conocimientos que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Bioingeniería<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Biológica podrán desempeñarse en diversas áreas productivas como la industria minera, alimentaria, medioambiental, química, energética, de materiales, farmacéutica, biomédica, entre otras orientadas a la resolución de un amplio espectro de necesidades como tratamiento y prevención de enfermedades, síntesis de compuestos de valor para la industria y sustentabilidad ambiental.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Biológica te entregará las competencias que requieres para aplicar los conceptos de diseño, análisis y síntesis de la ingeniería a las ciencias de la vida. Atrévete a ser parte de esta revolución de la biología, cambiar el curso de las circunstancias y rediseñar el futuro”.<p style=text-align:right>Eduardo Agosín Trumper<br>majoringenieriabiologica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Biológica</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-biologica1.png><img alt=Ing.Biológica class="aligncenter size-large wp-image-27820"height=628 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-biologica1-1024x628.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Biológica desarrolla la capacidad '\
                     'de entender cómo funcionan los sistemas biológicos y '\
                     'aplicar este conocimiento, tanto a la solución de '\
                     'problemas, como al desarrollo de tecnologías eficientes '\
                     'inspiradas en la biología.',
  video_url_code: 'GxExEaTPVoA',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_biologica', 'png')
)

ing_biomedica = Major.create!(
  name: 'Ingeniería Biomédica',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-biomedica"><h2>Major en Ingeniería Biomédica</h2><p>La Ingeniería Biomédica aplica conocimiento y enfoques de la Ingeniería a la Medicina y Biología para contribuir a la salud humana.El Major en Ingeniería Biomédica desarrolla la capacidad de aplicar soluciones innovadoras a los problemas de la salud humana, con un enfoque interdisciplinario. Además, les permite articular sus conocimientos para desempeñarse en diversos proyectos, pudiendo así abordar y solucionar problemas de alta complejidad a través de la formulación y aplicación de modelos matemáticos.Este Major tiene un número limitado de vacantes por lo que se debe participar de un proceso de selección.El Major en Ingeniería Biomédica permite articular con los títulos tradicionales de la Escuela de Ingeniería UC, o bien obtener el título de Médico Cirujano UC, previo cumplimiento de los requisitos establecidos.<p><strong>Exploratorio Recomendado</strong><p>IBM1005 Introducción a la Ingeniería Biomédica<p>Este curso permite a los estudiantes obtener una visión general del Major en Ingeniería Biomédica y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Imágenes Médicas<br>Biomecánica<br>Biomateriales<br>Articulación Pre-Medicina<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Biomédica son capaces de articular sus conocimientos interdisciplinarios para desempeñarse y desarrollar soluciones innovadoras en lo académico, las redes de salud públicas y privadas, la industria biomédica y el emprendimiento.<p><strong>Jefe de Major</strong><p>“El Mayor de Biomédica de la UC, te permitirá aplicar y desarrollar soluciones innovadoras a los problemas de la salud humana, con un enfoque interdisciplinario”.<p style=text-align:right>Diego Celentano<br>majoringenieriabiomedica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Biomédica (Track general)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--biomedica_track-general.png><img alt="Ing. Biomédica_track general"class="aligncenter size-large wp-image-27822"height=618 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--biomedica_track-general-1024x618.png width=1024></a><p><p><strong>Malla curricular Major en Ingeniería Biomédica (Track Prmedicina con Minor en Premedicina)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-biomedica_track-premedicina-con-minor-en-premedicina.png><img alt="Ing.Biomédica_track premedicina con minor en premedicina"class="aligncenter size-large wp-image-27823"height=627 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-biomedica_track-premedicina-con-minor-en-premedicina-1024x627.png width=1024></a><p><p></div>',
  short_description: 'Este Major desarrolla la capacidad de aplicar soluciones '\
                     'innovadoras a problemas de la salud humana. Además, les '\
                     'permite articular sus conocimientos para desempeñarse en '\
                     'diversos proyectos, pudiendo así solucionar problemas de '\
                     'complejos a través de la formulación y aplicación de '\
                     'modelos matemáticos.',
  video_url_code: 'AjfGBVzbmA0',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_biomedica', 'png')
)

ing_civil = Major.create!(
  name: 'Ingeniería Civil',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-civil"><h2>Major en Ingeniería Civil</h2><p>El Major en Ingeniería Civil desarrolla la capacidad de aplicar específicamente fundamentos de Ingeniería Civil a la determinación de oportunidades y problemáticas actuales de diseño y ejecución que impactan el desarrollo de proyectos y obras de infraestructura (obras civiles, industriales, edificación, hidráulicas, mineras, de transporte, entre otras), elaborando soluciones innovadoras, sustentables y que cumplen con restricciones técnicas, sociales y económicas.<p>La Licenciatura en Ciencias de la Ingeniería con Major en Ingeniería Civil tiene una componente generalista y una específica (tracks) que le permite desempeñarse en profundidad en una las diversas áreas de la Ingeniería Civil.<p><strong>Exploratorio Exigido</strong><p>ING1024 Propiedades y Resistencia de Materiales<p>Este curso permite a los estudiantes obtener una visión general del Major en<br>Ingeniería Civil y las áreas del conocimiento que estudia.<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Civil podrán trabajar en oficinas de ingeniería y consultoras apoyando labores de diseño, revisión y evaluación de proyectos y obras de infraestructura. Algunos de ellos podrán también realizar trabajo en terreno asociado a las áreas de construcción, minería, ambiental, geotécnica entre otras. Adicionalmente se podrán desempeñar en el área experimental realizando mediciones en terreno y laboratorios. Finalmente podrán participar en instituciones relacionas a las obras públicas.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Civil de la UC desarrolla en ti competencias amplias y a la vez enfocadas en el diseño y materialización de las obras de infraestructura. Otorga la visión amplia de ingeniería necesaria para resolver los problemas y articular los proyectos de infraestructura que necesita Chile“.<p style=text-align:right>Mauricio López Casanova<br>mic@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Civil (Track de Ingeniería Estructural)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ing--estructural.png><img alt="Ing.Civil_track de Ing. Estructural"class="aligncenter size-large wp-image-27792"height=713 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ing--estructural-1024x713.png width=1024></a><p><strong>Malla curricular Major en Ingeniería Civil (Track de Ingeniería Hidráulica)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ing-hidraulica.png><img alt="Ing.Civil_track de Ing.Hidráulica"class="aligncenter size-large wp-image-27793"height=651 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ing-hidraulica-1024x651.png width=1024></a><strong>Malla curricular Major en Ingeniería Civil (Track de Ingeniería Ambiental e Ingeniería de Minería)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ingenieria-ambiental-e-ingenieria-de-mineria.png><img alt="Ing.Civil_track de Ingeniería Ambiental e Ingeniería de Minería"class="aligncenter size-large wp-image-27794"height=707 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ingenieria-ambiental-e-ingenieria-de-mineria-1024x707.png width=1024></a><strong></strong><p><strong>Malla curricular Major en Ingeniería Civil (Track de Ingeniería y Gestión de la Construcción, Diseño y Construcción de Obras, Ingeniería Geotécnica e Ingeniería de Transporte)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ing--y-gestion-de-la-construccion2c-diseno-y-construccion-de-obras2c-ingenieria-geotecnica-e-ingenieria-de-transporte-.png><img alt="Ing.Civil_track de Ing. y Gestión de la Construcción%2c Diseño y Construcción de Obras%2c Ingeniería Geotécnica e Ingeniería de Transporte"class="aligncenter size-large wp-image-27795"height=714 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-civil_track-de-ing--y-gestion-de-la-construccion2c-diseno-y-construccion-de-obras2c-ingenieria-geotecnica-e-ingenieria-de-transporte--1024x714.png width=1024></a><p></div>',
  short_description: 'El Major en Ingeniería Civil desarrolla la capacidad de '\
                     'aplicar específicamente fundamentos de Ingeniería Civil a '\
                     'la determinación de oportunidades y problemáticas actuales '\
                     'de diseño y ejecución que impactan el desarrollo de '\
                     'proyectos y obras de infraestructura.',
  video_url_code: 'F4IigtLR1Ag',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_civil', 'png')
)

ing_construccion = Major.create!(
  name: 'Ingeniería de Construcción',
  description: '<div class="colspan8 content-page gridbox major-en-diseno-de-sistemas-de-construccion"><h2>Major en Diseño de Sistemas de Construcción</h2><p>El Major en Diseño de Sistemas de Construcción (Ingeniería y Gestión de la Construcción), desarrolla la capacidad para diseñar, planificar y administrar las fases del desarrollo de obras de construcción, incluyendo proyectos de edificación, infraestructura pública y privada, y obras civiles e industriales. Se da especial énfasis a la planificación estratégica de proyectos así como al diseño de los sistemas constructivos, control de calidad y coordinación de las diferentes especialidades que concurren en un proyecto de ingeniería.<p>Este Major combina una sólida formación en distintas especialidades de ingeniería en obras civiles, con una visión global de la planificación y administración de proyectos de construcción de gran envergadura, junto con potenciar la tecnología, innovación, emprendimiento y sustentabilidad en las obras.<p><strong style=line-height:1.5em>Exploratorio Recomendado</strong><p>ICC2304 Ingeniería de Construcción<p>Este curso permite a los estudiantes obtener una visión general del Major en Diseño de Sistemas de Construcción y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Obras Civiles<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Diseño de Sistemas de Construcción, podrán desempeñarse en variadas y múltiples áreas (diseño, desarrollo, planificación, administración y ejecución de obras civiles). El trabajo en los distintos tipos de obras de construcción tiene características especiales por la magnitud, complejidad y diversidad de este tipo de proyectos, lo que demanda una gran competencia en el diseño de soluciones altamente eficientes y eficaces para enfrentar estas características.<p><strong style=line-height:1.5em>Jefe de Major</strong><p>“El Major en Diseño de Sistemas de Construcción de INGENIERIA UC, además de la capacidad para participar en las distintas fases del proceso constructivo, abre una puerta a diversas áreas de especialización de la Ingeniería y Gestión de la Construcción, proponiendo nuevos desafíos a los futuros ingenieros”.<p style=text-align:right>Hernán de Solminihac<p style=text-align:right><a href=mailto:majoricc@ing.puc.cl>majoricc@ing.puc.cl</a><p style=text-align:left><strong style=line-height:1.5em>Malla curricular Major en Diseño de Sistemas de Construcción</strong><p style=text-align:left><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--de-construccion.png><img alt="Ing. de Construcción"class="aligncenter size-large wp-image-27837"height=704 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--de-construccion-1024x704.png width=1024></a></div>',
  short_description: 'El Major en Diseño de Sistemas de Construcción desarrolla '\
                     'la capacidad de planificar y administrar las fases del '\
                     'desarrollo de obras de construcción.',
  video_url_code: 'ytfexTyTCwA',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_construccion', 'png')
)

ing_diseno_innovacion = Major.create!(
  name: 'Ingeniería, Diseño e Innovación',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-diseno-e-innovacion"><h2>Major en Ingeniería, Diseño e Innovación</h2><p>El Major en Ingeniería, Diseño e Innovación prepara a sus alumnos para identificar y enfrentar los problemas reales que afectan a la sociedad, detectando oportunidades para diseñar e implementar propuestas centradas en el usuario bajo el alero de la innovación y el emprendimiento.<p>Capitalizamos la creatividad con iteraciones en procesos orquestados de trabajo y negociación de equipos. El proceso se materializa en propuestas innovadoras, éticas y responsables con la sociedad y el medio ambiente. Estas se cimentan sobre la base de procesos factibles de realizar, y se hacen tangibles en productos, sistemas o servicios que respondan a requerimientos específicos basados en ideación y evidencia.<p>El Major es multidisciplinario, combinando ingeniería con diseño. Los graduados están preparados, dependiendo de las áreas de profundización, para generar oportunidades y gestionar proyectos en ingeniería y áreas relacionadas. Asimismo, para aplicar metodologías de diseño para crear, desarrollar y plasmar sus proyectos por medio de la visualización y producción de prototipos.<p><strong>Malla curricular Major en Ingeniería, Diseño e Innovasción (Track Ingeniería y Diseño)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/idi_track-ingenieria-y-diseno.png><img alt="IDI_track Ingeniería y Diseño"class="aligncenter size-large wp-image-27830"height=736 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/idi_track-ingenieria-y-diseno-1024x736.png width=1024></a><p><p><strong>Malla curricular Major en Ingeniería, Diseño e Innovasción (Track Diseño)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/idi_track-diseno.png><img alt="IDI_track diseño"class="aligncenter size-large wp-image-27831"height=726 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/idi_track-diseno-1024x726.png width=1024></a><p><p><strong>Malla curricular Major en Ingeniería, Diseño e Innovasción (Track Ingeniería)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/idi_track-ingenieria.png><img alt="IDI_track ingeniería"class="aligncenter size-large wp-image-27832"height=738 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/idi_track-ingenieria-1024x738.png width=1024></a><p>Este Major tiene un número limitado de vacantes por lo que se debe participar de un proceso de selección.<br>El Major en Ingeniería, Diseño e Innovación permite la articulación con los títulos tradicionales de la Escuela de Ingeniería UC o bien obtener el título de Diseñador UC previo cumplimiento de los requisitos exigidos.<p><strong>Exploratorio Recomendado</strong><br>• ING1015 Pensamiento Visual.<br>Este curso permite a los estudiantes obtener una visión general del Major en Ingeniería, Diseño e Innovación y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><br>• Articulación Proyectos de Diseño<br>• Articulación Ingeniería Civil<p><strong>Campo Laboral</strong><br>El diseño entrega una capacidad procesual de asociación de información, creación y síntesis en lo concreto. Esta capacidad es requerida en ambientes de rápidos ciclos de creación o adaptación como lo son las Startups, industrias abocadas a la tecnología u organizaciones, que se interesen por innovar a través de sus productos o servicios. Así mismo el alumno podrá emprender con sus propios proyectos.<p><strong>Jefe de Major</strong><br>“El Major IDI te entregará herramientas estratégicas y un proceso claro para detectar oportunidades y desarrollar productos, sistemas o servicios basados en las personas, el emprendimiento y la tecnología.”<br>Constanza Miranda Mendoza<br>majoridi@ing.puc.cl<br>www.di-lab.cl</div>',
  short_description: 'El Major en Ingeniería, Diseño e Innovación prepara a sus '\
                     'alumnos para identificar y enfrentar los problemas que '\
                     'afectan a la sociedad, detectando oportunidades para '\
                     'diseñar e implementar propuestas centradas en el usuario '\
                     'bajo el alero de la innovación y el emprendimiento.',
  video_url_code: 'cl6JsUoEkLc',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_diseno_innovacion', 'png')
)

ing_electrica = Major.create!(
  name: 'Ingeniería Eléctrica',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-electrica"><h2>Major en Ingeniería Eléctrica</h2><p>El Major en Ingeniería Eléctrica desarrolla la capacidad de analizar los problemas de la Ingeniería Eléctrica y/o Electrónica como sistemas complejos, estudiando no sólo sus partes individuales, sino también sus interacciones, aplicando un análisis científico que incorpora, además, los impactos sociales, ambientales y económicos.<p>Este Major combina una sólida formación en ciencias básicas físicas y matemáticas, como también aquellas necesarias para la práctica profesional de la Ingeniería Eléctrica y/o Electrónica, con una fuerte especialización en alguna de las siguientes áreas: Automática y Robótica, Energía Eléctrica, Ingeniería Biomédica, Microelectrónica y Comunicaciones e Instrumentación Astronómica.<p><strong>Exploratorio Recomendado</strong><p>IEE1100 Introducción a la Ingeniería Eléctrica<p>Este curso permite a los estudiantes el obtener una visión general de lo que es la Ingeniería Eléctrica y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Energía Eléctrica<br>Automática y Robótica<br>Telecomunicaciones<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Eléctrica podrán desempeñarse con éxito en la mayor parte de las áreas de actividad que se desarrollan en el país (minería, forestal, servicios, etc.). Entre los 20 logros más relevantes del siglo pasado, se han destacado varios relacionados directamente con el campo de la Ingeniería Eléctrica: la electrificación, la electrónica, la radio y la televisión, los computadores, los servicios telefónicos, la internet, el procesamiento de imágenes, los artefactos caseros eléctricos, las tecnologías en la salud, y el láser y la fibra óptica. Sin embargo, el resto de los logros que aparecen en la lista: los automóviles, los aviones, el suministro y distribución de agua potable, la mecanización de la agricultura, el aire acondicionado y la refrigeración, las carreteras, las naves espaciales, las tecnologías del petróleo/petroquímica, las tecnologías nucleares, y los materiales de alto desempeño – también usan o requieren, en diversos grados, los conocimientos de la Ingeniería Eléctrica.<p><strong>Jefe de Major</strong><p>“La Ingeniería Eléctrica ha sido y seguirá siendo una disciplina fundamental para el desarrollo de nuestra sociedad. Ven y comparte con nosotros este camino hacia el futuro que nos aguarda”.<p style=text-align:right>Dani Guzmán<br>majoringenieriaelectrica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Eléctrica</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--electrica.png><img alt="Ing. Eléctrica"class="aligncenter size-large wp-image-27797"height=680 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--electrica-1024x680.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Eléctrica desarrolla la capacidad '\
                     'de analizar los problemas de la Ingeniería Eléctrica y/o '\
                     'Electrónica como sistemas complejos, estudiando no sólo '\
                     'sus partes individuales, sino también sus interacciones.',
  video_url_code: 'bh8btllzGZU',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_electrica', 'png')
)

ing_estructural = Major.create!(
  name: 'Ingeniería Estructural',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-estructural"><h2>Major en Ingeniería Estructural</h2><p>El Major en Ingeniería Estructural desarrolla la capacidad de participar en el análisis y diseño estructural de obras civiles, tales como edificios, puentes, puertos, instalaciones industriales, entre otras, propiciando la interacción para generar un ambiente multidisciplinario con profesionales  de diversas áreas tales como: ambiental, construcción, geotécnica y económica, entre otras.<p>Este Major combina la formación en obras civiles junto con materias propias de la especialidad, como ingeniería antisísmica, análisis computacional y experimental de estructuras, diseño de estructuras de hormigón armado y acero. Esta combinación les permitirá desempeñarse en las áreas tradicionales de la Ingeniería Estructural, como también en la creación de sistemas innovadores de prevención y mitigación de riesgos, y así proteger tanto las estructuras como sus contenidos.<p><strong>Exploratorio Recomendado</strong><p>ICE2005 Mecánica Estructural<p>Este curso permite a los estudiantes obtener una visión general del Major en<br>Ingeniería Estructural y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Articulación Ingeniería Civil.<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Estructuraltendrán oportunidades laborales en diversas áreas de la Ingeniería Civil.<br>Los principales campos laborales son consultoras de ingeniería estructural, consultoras multidisciplinarias de ingeniería civil, empresas constructoras, empresas mineras y entidades públicas.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Estructural te permitirá descubrir y aplicar herramientas innovadoras para modelar y diseñar obras civiles”.<p style=text-align:right>Matías Hube Ginestar<br>majorestructural@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Estructural</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--estructural.png><img alt="Ing. Estructural"class="aligncenter size-large wp-image-27799"height=644 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--estructural-1024x644.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Estructural desarrolla la capacidad '\
                     'de participar en el análisis y diseño estructural de obras '\
                     'civiles.',
  video_url_code: 'jpbxuxlXwis',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_estructural', 'png')
)

ing_geotecnica = Major.create!(
  name: 'Ingeniería Geotécnica',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-geotecnica"><h2>Major en Ingeniería Geotécnica</h2><p>Los graduados en Ingeniería Geotécnica trabajan en un amplio espectro de problemas relacionados con el comportamiento de suelos y rocas, y con la interacción que existe entre estos materiales y distintas obras de infraestructura. Aplican sus conocimientos a la mitigación y solución de fenómenos como deslizamientos de masas de suelo, asentamientos excesivos de estructuras, y daños inducidos por terremotos, entre otros, así como en el diseño, construcción y operación de proyectos de ingeniería civil.<p>Esto permite a los graduados, además de desempeñarse en las áreas tradicionales de la ingeniería geotécnica, especializarse en problemas ambientales actuales como la contaminación en aguas subterráneas y la extracción de energía geotérmicas.<p><strong>Exploratorio Recomendado</strong><p>ICE2623 Introducción a la Geología Física<p>Este curso permite a los estudiantes obtener una visión general del Major en Ingeniería Geotécnica y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Articulación Ingeniería Civil.<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Geotécnica tendrán oportunidades laborales en diversas áreas de la Ingeniería Civil. Los principales campos laborales son consultoras de ingeniería geotécnicas, consultoras multidisciplinarias de ingeniería civil, empresas constructoras, empresas mineras y entidades públicas.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Geotécnica de la UC te entrega las herramientas necesarias para aplicar los fundamentos de la mecánica de suelos y rocas al análisis y diseño de distintas obras de Ingeniería Civil, y para integrar este conocimiento al trabajo con otras disciplinas”.<p style=text-align:right>Christian Ledezma Araya<br>majorgeotecnica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Geotécnica</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--geotecnica.png><img alt="Ing. Geotécnica"class="aligncenter size-large wp-image-27802"height=714 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--geotecnica-1024x714.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Geotécnica desarrolla la capacidad '\
                     'de solucionar problemas relacionados con el comportamiento '\
                     'de suelos y rocas, y con la interacción que existe entre '\
                     'estos materiales y distintas obras de infraestructura.',
  video_url_code: 'JOSrqwek3jg',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_geotecnica', 'png')
)

ing_hidraulica = Major.create!(
  name: 'Ingeniería Hidráulica',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-hidraulica"><h2>Major en Ingeniería Hidráulica</h2><p>El Major en Ingeniería Hidráulica desarrolla la capacidad de caracterizar y modelar el comportamiento del agua y otros fluidos en sistemas naturales y artificiales, considerándose las interacciones con el territorio, el ambiente, la sociedad y su bienestar.<p>Este Major está estructurado en torno a tres ejes principales: los fundamentos teóricos de ciencias básicas y de la tierra, el análisis y evaluación de los recursos hídricos y el entendimiento y diseño aplicado a sistemas hidráulicos<p><strong>Exploratorios Recomendados</strong><p>ICH1005 Desafíos en Recursos Hídricos y Medio Ambiente<br>ICH1104 Mecánica de Fluidos<p>Estos cursos permiten a los estudiantes obtener una visión general del Major en Ingeniería Hidráulica y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Hidrogeología.<p>Articulación Ingeniería Civil.<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Hidráulica podrán desempeñarse en áreas que incluyen sectores productivos donde el agua es un insumo o elemento fundamental: minería, agricultura, generación eléctrica, industria, etc. Divisiones técnicas de organismos públicos como los Ministerios de Obras Públicas, de Vivienda y Urbanismo, Medio Ambiente, Energía, municipalidades, oficinas consultoras de proyectos hidráulicos, de construcción, sanitarios, ingeniería ambiental, entre otros.<p><strong>Jefe de Major</strong><p>“Con el Major de Ingeniería Hidráulica podrás conocer la relevancia que tiene el agua y su uso en el desarrollo económico y social del país, a través de infraestructura y tecnologías que incorporan fuertemente la proteccion ambiental”.<p style=text-align:right>Jorge Gironás León<br>majorhidraulica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Hidráulica (Track Ingeniería Hidráulica)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--hidraulica_track-ing-hidraulica.png><img alt="Ing. Hidráulica_track Ing.Hidráulica"class="aligncenter size-large wp-image-27805"height=714 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--hidraulica_track-ing-hidraulica-1024x714.png width=1024></a><strong></strong><p><strong>Malla curricular Major en Ingeniería Hidráulica (Track Recursos Hídricos)</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--hidraulica_track-recursos-hidricos.png><img alt="Ing. Hidráulica_track recursos hídricos"class="aligncenter size-large wp-image-27807"height=725 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--hidraulica_track-recursos-hidricos-1024x725.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Hidráulica desarrolla la capacidad '\
                     'de caracterizar y modelar el comportamiento del agua y '\
                     'otros fluidos en sistemas naturales y artificiales.',
  video_url_code: 'FgKtmUTbLvM',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_hidraulica', 'png')
)

ing_matematica = Major.create!(
  name: 'Ingeniería Matemática',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-matematica"><h2>Major en Ingeniería Matemática</h2><p>El Major en Ingeniería Matemática desarrolla la capacidad de solucionar problemas complejos mediante el uso de matemáticas de alto nivel.<p>Este Major es de carácter fundamentalmente interdisciplinario, el cual permite a sus graduados interactuar con múltiples especialistas para desempeñarse en diversos proyectos de Ingeniería y Ciencias, pudiendo así abordar y solucionar problemas de alta complejidad a través de la formulación y aplicación de modelos matemáticos.<p><strong>Exploratorio Recomendado</strong><p>IMT1001 Introducción a la Ingeniería Matemática<p>Este curso permite a los estudiantes obtener una visión general del Major en<br>Ingeniería Matemática y las áreas del conocimiento que estudia.<p><strong>Minor de Profundidad Asociado</strong><p>Teoría y Aplicación de Ingeniería Matemática<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Matemática son capaces de articular sus conocimientos interdisciplinarios para desempeñarse en diversos proyectos, pudiendo así abordar y solucionar problemas de alta complejidad a través de la formulación y aplicación de modelos matemáticos realizando significativos aportes en todas las áreas que requieren matemáticas avanzadas.<p><strong>Jefe de Major</strong><p>“Un Ingeniero Matemático busca respuestas a problemas extremadamente complejos gracias a sus capacidades de modelación, análisis y simulación en un constante diálogo interdisciplinario”.<p style=text-align:right>Carlos Jerez Hanckes<br>majoringenieriamatematica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Matemática</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-matematica2.png><img alt=Ing.Matemática class="aligncenter size-large wp-image-27825"height=637 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing-matematica2-1024x637.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Matemática desarrolla la capacidad '\
                     'de solucionar problemas complejos mediante el uso de '\
                     'matemáticas de alto nivel.',
  video_url_code: 'mbXFnRepnss',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_matematica', 'png')
)

ing_mecanica = Major.create!(
  name: 'Ingeniería Mecánica',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-mecanica"><h2>Major en Ingeniería Mecánica</h2><p>El Major en Ingeniería Mecánica desarrolla la capacidad de diseñar, fabricar y mantener diversos sistemas mecánicos como, por ejemplo, productos de consumo, dispositivos, vehículos, máquinas, sistemas de fabricación, de transporte y de generación de energía.<p>Este Major combina una formación en ciencias básicas físicas y principios de ingeniería, junto con áreas de especialización que incluyen diseño, sistemas mecánicos y de energía, comportamiento de materiales, y procesos de manufactura.<p><strong>Exploratorio Recomendado</strong><p>ICM1001 Introducción a la Ingeniería Mecánica<br>ICM2313 Diseño Gráfico<p>Estos cursos permiten a los estudiantes obtener una visión general del Major en Ingeniería Mecánica y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Biomateriales<br>Mecatrónica<br>Materiales<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Mecánica serán capaces de desarrollar soluciones en un amplio espectro de campos como manufactura, sistemas de transporte, energía, productos de consumo y compatibilidad medioambiental.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Mecánica transformará tu creatividad, conocimiento y pasión por la tecnología en oportunidades de concretar tus ideas de manera “fabricable” y eficiente”.<p style=text-align:right>Luciano Chiang<br>majoringenieriamecanica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Mecánica</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--mecanica.png><img alt="Ing. Mecánica"class="aligncenter size-large wp-image-27809"height=632 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--mecanica-1024x632.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Mecánica desarrolla la capacidad de '\
                     'diseñar, fabricar y mantener diversos sistemas mecánicos.',
  video_url_code: 'y3J264gptEg',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_mecanica', 'png')
)

ing_quimica = Major.create!(
  name: 'Ingeniería Química',
  description: '<div class="colspan8 content-page gridbox major-en-ingenieria-quimica"><h2>Major en Ingeniería Química</h2><p>El Major de Ingeniería Química desarrolla la capacidad de diseñar procesos para la producción, transformación y transporte de químicos, bioquímicos, energía y materiales, además, les permite a sus licenciados la elaboración de nuevos productos y procesos utilizando técnicas experimentales de laboratorio e implementar estas tecnologías a nivel industrial.<p>Este Major profundiza en tópicos como termodinámica química, mecánica de fluidos y transferencia de masa y calor. Esta formación permite a sus alumnos especializarse en diversas áreas, como por ejemplo, alimentos, biotecnología, industria farmacéutica, industria química, materiales, medio ambiente, petroquímica, procesamiento de minerales y productos naturales.<p><strong>Exploratorio Recomendado</strong><p>IIQ1001 Introducción a la Ingeniería Química<p>Este curso permite a los estudiantes obtener una visión general del Major en Ingeniería Química y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Tecnología Ambiental<br>Ingeniería de Procesos<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Ingeniería Química podrán desempeñarse en la concepción y diseño de procesos para la producción, transformación y transporte de materiales, en diversas<br>áreas de la industria. Además estarán preparados para el diseño de nuevos productos de alto rendimiento, fomentando la innovación tecnológica en la industria nacional.<p><strong>Jefe de Major</strong><p>“El Major en Ingeniería Química de la UC, te permitirá dominar los principios de la disciplina y aprender a utilizarlos para generar soluciones en áreas de tu interés como alimentos, biotecnología, productos naturales, contaminación ambiental, tratamiento de residuos, nuevos materiales, procesamiento de minerales y muchas otras”.<p style=text-align:right>Ricardo Pérez Correa<br>majoringenieriaquimica@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Química</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--quimica.png><img alt="Ing. Química"class="aligncenter size-large wp-image-27814"height=704 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--quimica-1024x704.png width=1024></a></div>',
  short_description: 'El Major en Ingeniería Química desarrolla la capacidad de '\
                     'diseñar procesos para la producción, transformación y '\
                     'transporte de químicos, bioquímicos, energía y '\
                     'materiales.',
  video_url_code: 'tXiJ_uzXfXk',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'ing_quimica', 'png')
)

investigacion_operativa = Major.create!(
  name: 'Investigación Operativa',
  description: '<div class="colspan8 content-page gridbox major-en-investigacion-operativa"><h2>Major en Investigación Operativa</h2><p>El Major en Investigación Operativa desarrolla la capacidad de modelar y resolver problemas de asignación de recursos (humanos, financieros y materiales) desde una perspectiva crítica y sistémica, que le permitirá enfrentar diversos problemas prácticos en distintas organizaciones utilizando principios fundamentales de ingeniería.<p>Este Major combina una sólida formación técnica en optimización, modelación estocástica, microeconomía, estadística, y otras disciplinas, preparando a sus estudiantes para abordar, con un enfoque analítico y de modelación matemática, la planificación, diseño e implementación de sistemas de administración económicos y tecnológicos complejos.<p><strong>Exploratorio Recomendado</strong><p>ICS1113 Optimización<p>Este curso permite a los estudiantes obtener una visión general del Major en Investigación Operativa y las áreas del conocimiento que estudia.<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Investigación Operativa podrán         desempeñarse en diversas áreas, como por ejemplo, administración de empresas, banca de inversiones, economía, finanzas, tanto en organizaciones públicas como privadas,         elaborando modelos analíticos que apoyen la toma de decisiones y el análisis de riesgo e         incertidumbres.<p><strong style=line-height:1.5em>Jefe de Major</strong><p>“La Investigación Operativa te permite abordar, de manera analítica, problemas en organizaciones complejas que van desde la industria manufacturera a los sistemas de salud pública”.<p style=text-align:right>Jorge Vera Andreo<br>investigacionoperativa@ing.puc.cl<p><strong>Malla curricular Major en Investigación Operativa</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/investigacion-operativa.png><img alt="Investigación Operativa"class="aligncenter size-large wp-image-27816"height=721 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/investigacion-operativa-1024x721.png width=1024></a></div>',
  short_description: 'El Major en Investigación Operativa desarrolla la '\
                     'capacidad de modelar y resolver problemas de asignación de '\
                     'recursos (humanos, financieros y materiales) desde una '\
                     'perspectiva crítica y sistémica.',
  video_url_code: 'syAglylSd7c',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'investigacion_operativa', 'png')
)

mineria = Major.create!(
  name: 'Minería',
  description: '<div class="colspan8 content-page gridbox major-en-mineria"><h2>Major en Ingeniería Minera</h2><p>El  Major en Ingeniería Minera desarrolla la capacidad de desempeñarse de manera efectiva en el ámbito de la explotación y operaciones mineras, sobre la base de una sólida formación en ciencias químicas,  físicas y termodinámica, un conocimiento técnico de las operaciones unitarias de una mina, una visión de sustentabilidad respecto al impacto económico, social y ambiental de un proyecto minero y una mirada reflexiva en torno a la prácticas actuales.<p>Los graduados de este Major se desempeñan en la Industria de mayor relevancia para Chile, con una serie de desafíos en la planificación, diseño y operación de una mina a cielo abierto y subterránea; combinando aspectos propios de la formación industrial con una base técnica que fomenta la tecnología e innovación aplicada a problemática minera.<p><strong>Exploratorio Recomendado</strong><p>IMM1003 Introducción a la Minería<p>Este curso permite a los estudiantes obtener una visión general del Major en<br>Minería y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Procesos Mineros<br>Gestión Minera<br>Logística Minera (para Minería)<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Minería tienen la posibilidad de ingresar a compañías mineras en Chile y el extranjero, desempeñándose en diferentes procesos de extracción y procesamiento, aportando una visión sistémica y de negocios al trabajo diario que se realiza.<p><strong>Jefe de Major</strong><p>“Formando los agentes de cambio para la minería del futuro”.<p style=text-align:right>Rodrigo Pascual<br>majormineria@ing.puc.cl<p><strong>Malla curricular Major en Ingeniería Minera</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--minera.png><img alt="Ing. Minera"class="aligncenter size-large wp-image-27812"height=707 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/ing--minera-1024x707.png width=1024></a></div>',
  short_description: 'El Major en Minería desarrolla la capacidad de '\
                     'desempeñarse de manera efectiva en el ámbito de la '\
                     'explotación y operaciones mineras.',
  video_url_code: '6Mmrb8ZqDGY',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'mineria', 'png')
)

sistemas_autonomos_roboticos = Major.create!(
  name: 'Sistemas Autónomos y Robóticos',
  description: '<div class="colspan8 content-page gridbox major-en-sistemas-autonomos-y-roboticos"><h2>Major en Sistemas Autónomos y Robóticos</h2><p>El Major en Sistemas Autónomos y Robóticos desarrolla la capacidad de construir y aplicar dispositivos y software en la automatización avanzada de instrumentos, máquinas y procesos productivos complejos, integrando conocimientos de ingeniería mecánica, eléctrica y computacional. Los sistemas autónomos son sistemas capaces de operar en forma automática por periodos prolongados sin intervención humana, evitando, reaccionando o adaptándose a situaciones imprevistas y cambiantes del entorno. Para esto miden información del entorno que los rodea, procesan dicha información y actúan de manera acorde a pesar de las incertidumbres y perturbaciones. Por su parte, la robótica se caracteriza hoy en día no sólo por tener aplicaciones en la realización de tareas industriales repetitivas de manufactura, sino también aplicaciones médicas, científicas o militares. El desarrollo y uso de robots es especialmente útil en la resolución de trabajos o tareas peligrosas y costosas de realizar manualmente, o que combinan ambos aspectos.<p><strong>Exploratorios Recomendados</strong><p>IRB1001 Introducción a la Robótica<br>IRB2001 Fundamentos de Robótica<p>Este curso permite a los estudiantes obtener una visión general del Major en<br>Sistemas Autónomos y Robóticos y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Automatización e Inteligencia Computacional<br>Automática y Robótica<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Sistemas Autónomos y Robóticos podrán participar en proyectos de automatización y robótica diseñando sistemas que combinan la percepción, el cálculo y la actuación en el mundo real aplicando los fundamentos de la Ingeniería en computación, mecánica y eléctrica.<p><strong>Jefe de Major</strong><p>“El Major de Sistemas Autónomos y Robóticos de la UC, te proporcionará la capacidad para resolver desafíos tecnológicos y crear soluciones que integran computación, electrónica y mecánica en su diseño e implementación. Los alumnos del Major se destacarán por su talento, pasión y rigor en el desarrollo de sistemas autónomos y robóticos que respondan a las necesidades actuales de la industria y la sociedad”.<p style=text-align:right>Miguel Torres Torriti<br>majorsar@ing.puc.cl<p><strong>Malla curricular Major en Sistemas Autónomos y Robóticos</strong><p><a href=http://www.ing.uc.cl/wp-content/uploads/2014/05/sistemas-autonomos-y-roboticos.png><img alt="Sistemas Autónomos y Robóticos"class="aligncenter size-large wp-image-27834"height=628 src=http://www.ing.uc.cl/wp-content/uploads/2014/05/sistemas-autonomos-y-roboticos-1024x628.png width=1024></a></div>',
  short_description: 'El Major en Sistemas Autónomos y Robóticos desarrolla la '\
                     'capacidad de construir y aplicar dispositivos y software '\
                     'en la automatización avanzada de instrumentos, máquinas y '\
                     'procesos productivos complejos, integrando conocimientos '\
                     'de ingeniería mecánica, eléctrica y computacional.',
  video_url_code: 'QBdDwVH8s3g',
  category: 'Interdisciplinario',
  logo: create_uploaded_image('logos_majors', 'sistemas_autonomos_roboticos', 'png')
)

sistemas_transporte = Major.create!(
  name: 'Sistemas de Transporte',
  description: '<div class="colspan8 content-page gridbox major-en-sistemas-de-transporte"><h2>Major en Sistemas de Transporte</h2><p>El Major en Sistemas de Transporte desarrolla la capacidad de desempeñarse en los ámbitos específicos del diseño, operación y gestión de sistemas de transporte sobre la base de un profundo conocimiento de sus fundamentos, principios, comportamiento e interacción de los diversos actores que lo componen.<p>La Ingeniería de Sistemas de Transporte es una disciplina diver- sa que incluye tópicos como modelos de tráfico, flujo en redes de transporte, economía, modelos econométricos, entre otros. Este Major combina una formación en ciencias básicas físicas y matemáticas con un área de especialización a escoger: (i) Exter- nalidades e impacto ambiental; (ii) Herramientas de análisis y modelación; (iii) Manejo de bases de datos; y (iv) Profundización en Ingeniería de Transporte.<p><strong>Exploratorio Recomendado</strong><p>ICT2904 Ingeniería de Sistemas de Transporte<p>Este curso permite a los estudiantes obtener una visión general del Major en Sistemas de Transporte y las áreas del conocimiento que estudia.<p><strong>Minors de Profundidad Asociados</strong><p>Logística Minera (para Transporte)<br>Articulación Ingeniería de Transporte<br>Articulación Ingeniería Civil<p><strong>Campo Laboral</strong><p>Los Licenciados en Ciencias de la Ingeniería con Major en Sistemas de Transporte podrán desempeñarse en ámbitos del diseño, operación y gestión de sistemas de transporte, sobre la base del conocimiento de los fundamentos y principios de la Ingeniería de Sistemas de Transporte.<p><strong>Jefe de Major</strong><p style=text-align:left>“El Major de Sistemas de Transporte te permitirá conocer una disciplina que es cada vez más importante por los enormes y crecientes volúmenes que se mueven en el mundo tanto de carga como de personas. La congestión y las distintas preferencias individuales le agregan gran complejidad. Los problemas que nos interesan exigen una aproximación multidisciplinar, por lo que se valora la formación en otras disciplinas como el urbanismo o las ciencias sociales”.<p style=text-align:right>Juan Carlos Muñoz Abogabir<br>majorsistemastransporte@ing.puc.cl<p><strong>Malla Curricular</strong><p><a href=http://www.ing.puc.cl/wp-content/uploads/2014/05/sist-de-transportes.png><img alt=sist-de-transportes class="aligncenter size-full wp-image-22137"height=770 src=http://www.ing.puc.cl/wp-content/uploads/2014/05/sist-de-transportes.png width=1024></a></div>',
  short_description: 'El Major en Sistemas de Transporte desarrolla la capacidad '\
                     'de desempeñarse en los ámbitos específicos del diseño, '\
                     'operación y gestión de sistemas de transporte.',
  video_url_code: 'erXWL6zBJ30',
  category: 'Disciplinario',
  logo: create_uploaded_image('logos_majors', 'sistemas_transporte', 'png')
)

puts('Creating FAQs...')

Faq.create!(
  [
    { question: '¿Cómo funciona la página de Preguntas Frecuentes?',
      answer: 'Aquí podrás ver las preguntas frecuentes de la Nueva Malla. Puedes '\
              'enviar una pregunta haciendo click en el botón "Crear pregunta". '\
              'Un administrador se encargará luego de responderlas en la sección '\
               '"Otras preguntas".',
      frequent: true },
    { question: '¿Qué es un major? ¿Cuál es la diferencia entre major '\
                'disciplinario e interdisciplinario?',
      answer: 'Un major es una concentración de cursos que equivale a 100 '\
              'créditos, por lo general son grupos de 10 ramos.'\
              "\r\nHay majors disciplinarios, o sea que tienen relación directa "\
              'con áreas que son conocidas como propias de Ingeniería, como'\
              'Ingeniería en minería, química, mecánica, eléctrica, etc. Son 14 al '\
              'año 2014.'\
              "\r\nHay majors interdisciplinarios, estos son los que plantean una "\
              'aplicación de la Ingeniería en otros ámbitos como la arquitectura, '\
              'medicina, diseño, entre otros. Son 8 los major que se clasifican de '\
              'esta forma.'\
              "\r\n\r\nDebes tener en cuenta de que si articulas con un título "\
              'profesional de la Escuela, el major que escojas no es la mención de '\
              'tu título. Tienes que elegir major como una herramienta para '\
              'desempeñarte en tu futuro, más allá del título.'\
              "\r\n\r\n\"Un elemento crucial del perfil de egreso del Licenciado "\
              'en Ciencias de la Ingeniería, según competencias disciplinares y '\
              'competencias transversales."'\
              "\r\nDesafiando Límites, Majors y Minors."\
              "\r\nhttp://www.desafiandolimites.cl/majors-minors",
      frequent: true },
    { question: '¿El major tiene que ver con mi especialidad?',
      answer: 'Esto depende solo de ti. La malla apunta a que puedas usarla como '\
              'tú sientas que más aportará a tu futuro profesional y personal. Por '\
              'lo que el major puede o no tener que ver con tu especialidad. OJO! '\
              'ten cuidado que si tienes como visión terminar la carrera en un '\
              'tiempo determinado una combinación de major, minor y título que no '\
              'tengan relación entre sí es casi seguro que sumarán semestres en la '\
              'universidad.',
      frequent: true },
    { question: '¿Cómo sé cuáles ramos tomar y así articular con mi especialidad?',
      answer: 'Para esto debes consultar en esta página, en Desafiando Límites, en '\
              'tu SidIng, donde aparece información sobre los majors y qué '\
              'temáticas abordan. Luego, si tu prioridad es articular con el '\
              'título, puedes "jugar" en el planner que es lo que más se adecua '\
              'y adapta a tus intereses sobre el tiempo y conocimiento adquirido. '\
              'Además recuerda que solo a modo de ORIENTACIÓN está la Orientadora '\
              'Académica en Dirección de Pregrado, a quién puedes acudir si tienes '\
              'dudas sobre articulaciones, pero ten claro que su objetivo no es '\
              'armarte la malla cada',
      frequent: true }
  ]
)

MajorFaq.create!(
  [
    { major: sistemas_transporte,
      question: '¿Qué perfil de alumno se busca en este major?',
      answer: 'Los problemas de transporte son de gran tamaño y complejidad por lo '\
              'que los alumnos deben ser capaces de lidear con problemas '\
              'complejos. Para poder modelar estos problemas son importantes las '\
              'habilidades computacionales y la capacidad de modelamiento.'\
              "\r\n\r\nPor otro lado, los problemas de transporte son "\
              'multidisciplinarios, por lo que se espera que los alumnos sean '\
              'capaces de trabajar con personas de distintos contextos y '\
              'disciplinas con seguridad. Los alumnos también deben ser fuertes en '\
              'estadísticas, investigación operativa, optimización, economía, '\
              'además de saber utilizar computador y contar con capacidades '\
              'analíticas.' },
    { major: sistemas_transporte,
      question: '¿Cuáles son las áreas de investigación asociadas al major?',
      answer: 'Las líneas con más prestigio y tradicionales son dos. Existe la '\
             'línea de modelos de de demanda, los sistemas de transporte cuentan '\
             'con unidades que deciden por sí mismos, por lo que es muy '\
             'importante comprender como las personas toman decisiones, entender '\
             'su comportamiento y predecirlo lo mejor posible. Otra línea '\
             'tradicional es el diseño de sistemas de transporte y ecuaciones de '\
             'equilibrio, esta se dedica a estudiar cómo responderán los sistemas '\
             'ante los distintos requerimientos, por ejemplo, el fenómeno de la '\
             'congestión, la capacidad en los buses, etc.'\
             "\r\nExisten otras líneas de investigación como modelos de tráfico, "\
             'comportamiento de vehículos, intersecciones, externalidades de '\
             'contaminación y accidentes, transporte aéreo, transporte público y '\
             'transporte inteligente. El departamento también tiene un área de '\
             'logística que trabaja en conjunto con el departamento de Ingeniería '\
             'Industrial y de Sistemas, se ve el transporte de carga, líneas de '\
             'producción, logística reversa, entre otros temas más.' },
    { major: ing_matematica,
      question: '¿Con qué título puedo articular si sigo este major?',
      answer: 'La más sencilla es el programa de Ingeniero Civil de Industria '\
              'con Especialidad en Ingeniería Matemática, pero también se puede '\
              'articular con otras especialidades dependiendo del minor que se '\
              'eligió. En general la articulación es bastante amplia, debido a '\
              'que las herramientas que da este major se pueden usar en '\
              'múltiples áreas de la ingeniería.' },
    { major: ing_matematica,
      question: '¿En qué áreas puedo trabajar si sigo este major?',
      answer: 'El alumno que termina este major se podrá insertar en áreas tan '\
              'distintas como mercado financiero, simulación de procesos de '\
              'transporte, dispositivos biomédicos, etc. El campo es bastante '\
              'amplio.' },
    { major: ing_matematica,
      question: '¿Qué áreas de investigación hay en este major?',
      answer: 'Las áreas de investigación son muy amplias. Van desde resultados '\
              'teóricos (como teoremas), hasta el estudio de la implementación de '\
              'técnicas y simulaciones para resolver un problema.' },
    { major: ciencias_ambientales,
      question: '¿Qué perfil de alumno se busca en este major?',
      answer: 'Una de las cosas que se espera de los alumnos de este major es que '\
              'tengan una mente abierta para aprender de distintos campos, y que '\
              'tengan en esta amplitud de conocimientos y de campos tengan la '\
              'vocación necesaria para profundizar en cosas que sean de su '\
              'interés.' },
    { major: ciencias_ambientales,
      question: '¿Cuál es la diferencia entre ingeniería ambiental y ciencias '\
                'ambientales?',
      answer: 'La diferencia entre estos majors tiene que ver con el ámbito de '\
              'aplicación y la formación que se recibe a través de los cursos. El '\
              'major de ciencias ambientales está más orientado a ver y evaluar la '\
              'sustentabilidad. No se tiene un enfoque de producir soluciones '\
              'tecnológicas, sino más bien uno de producir información que luego '\
              'permita tomar decisiones que apunten hacia la sustentabilidad.' },
    { major: ciencias_ambientales,
      question: '¿Dónde puedo trabajar con una licenciatura en ciencias '\
                'ambientales?',
      answer: 'Hay un rango bien amplio donde se puede trabajar, partiendo por el '\
              'sector público. Aquí se necesita que, en las políticas públicas, se '\
              'incorpore gente que entienda la mecánica del medio ambiente. Los '\
              'ministerios y la labor pública se presentan como lugares donde se '\
              'podría trabajar solo con la licenciatura, sin la necesidad de '\
              'obtener el título.' },
    { major: computacion,
      question: '¿Qué perfil de alumno se busca para este major?',
      answer: 'Se busca preparar alumnos a nivel de ser un investigador, '\
              'desarrollador y gestor de la tecnología computacional moderna. '\
              'Por ejemplo de la web, la robótica, las aplicaciones móviles, la '\
              'mineria, los juegos de video, etc. Se busca reforzar el aprendizaje '\
              'de los conceptos, modelos y técnicas que se les enseñan a los '\
              'alumnos con el desarrollo de proyectos prácticos reales.' },
    { major: computacion,
      question: '¿Con qué título se puede articular este major?',
      answer: 'Este major se puede articular de preferencia con los títulos '\
              'profesionales de:'\
              "\r\n\r\n- Ingeniería Civil en Computación: Está más asociado con la "\
              'ciencia y la tecnología de la computación.'\
              "\r\n- Ingeniería Civil de Industria con Diploma en Computación: "\
              'Está más orientado al desarrollo de aplicaciones y la ingeniería de '\
              'software.'\
              "\r\n- Ingeniería Civil de Industria con Diploma en Ingeniería de "\
              'Tecnologías de la Información (TI): Va orientado a las tecnologías '\
              'de la información en las organizaciones.'\
              "\r\n\r\nEl major le sirve exactamente igual a estos tres títulos "\
              'profesionales.' },
    { major: computacion,
      question: '¿Cómo es el campo laboral?',
      answer: 'Hay muchos alumnos que se han dedicado al emprendimiento, ellos '\
              'iniciaron sus propias empresas de servicios computacionales y '\
              'desarrollo de software. Después están las empresas que tienen '\
              'grandes áreas de informática como las líneas aéreas, los bancos, '\
              'retail, etc. Luego están las empresas que sí son desarrolladoras de '\
              'software, como Google, Microsoft, Amazon, etc. Estas han venido a '\
              'buscar alumnos de la universidad para emplearlos.' },
    { major: computacion,
      question: '¿Cuáles son las diferencias con el major de sistemas autónomos y '\
                'robóticos?',
      answer: 'El major de sistemas autónomos y robóticos es una mezcla entre los '\
              'major de ingeniería robótica, ingeniería mecánica y ciencias de la '\
              'computación, por lo que no se hace un énfasis en cosas como el '\
              'desarrollo de software, en la teoría detrás del desarrollo del '\
              'software o en las bases de datos. Más bien hace un énfasis en cómo '\
              'aplicar ciertos aspectos del desarrollo de software a la robótica '\
              'y a la automatización. Sin embargo, los egresados del major de '\
              'sistemas autónomos y robóticos también pueden optar a los títulos '\
              'en computación.' },
    { major: ing_diseno_innovacion,
      question: '¿Qué habilidades entrega este major?',
      answer: 'El alumno que termina este major adquirirá principalmente 2 tipos '\
              'de habilidades prácticas. Primero aprenderá Procesos, lo que '\
              'permite al estudiante lidiar con problemas actuales, asesorar y '\
              'trabajar con información que desembocan en proyectos concretos en '\
              'diferentes áreas; tales como sistemas, plataformas, procesos y '\
              'productos, además de técnicas de prototipado.'\
              "\r\nTambién adquirirá habilidades en cuanto al Emprendimiento "\
              'dentro del campo laboral, o bien inter-emprendimiento formando '\
              'nuevas áreas dentro de una empresa. Además aprenderá a trabajar con '\
              'personas para lograr innovar.' },
    { major: ing_diseno_innovacion,
      question: '¿Cómo es el campo laboral si salgo de este major?',
      answer: 'En Chile son requeridas personas que cumplan con el perfil '\
              'entregado en el major, principalmente en consultoras de innovación, '\
              'consultoras de procesos y departamentos de Resources Development '\
              'que se están creando dentro de las empresas. Actualmente en el país '\
              'no son tan requeridos como en el extranjero por lo que se '\
              'recomienda comenzar a formar redes desde los primeros años de '\
              'estudio.' },
    { major: ing_diseno_innovacion,
      question: '¿Con qué título puedo articular si sigo este major?',
      answer: 'Este major no conduce a titulación, por lo que se debe tomar un '\
              'minor que sí lo haga. El major contiene “tracks” de mecánica, TI, '\
              'diseño, y uno mixto (Ingeniería-Diseño) los cuáles facilitan el '\
              'cambio a algunas de estas áreas.' },
    { major: ing_diseno_innovacion,
      question: '¿Qué perfil de alumno busca este major?',
      answer: 'Busca alumnos con liderazgo, comprometidos y dinámicos en las '\
              'clases. Éste major cuenta con una postulación donde se evaluará si '\
              'se cumple con el perfil.' },
    { major: ing_construccion,
      question: '¿Cuál es el perfil de alumno que se busca para este major?',
      answer: 'Se busca que el alumno sea inquieto por mejorar lo que hoy día '\
              'existe en el ámbito de la construcción, por usar competencias de '\
              'diseño para hacer más profesional y más eficiente esa industria. '\
              'Al mismo tiempo también se busca que sea inquieto en '\
              'emprendimiento, que esté en busca de oportunidades y nuevos '\
              'desarrollos para emprender en un ámbito tan rico como es la '\
              'construcción.' },
    { major: ing_construccion,
      question: '¿Con qué títulos profesionales se puede articular este major?',
      answer: 'Los más directos son los títulos de Ingeniero Civil en Ingeniería y '\
              'Gestión de la Construcción o Ingeniero Industrial en Ingeniería y '\
              'Gestión de la Construcción. Sin embargo, igual se puede articular '\
              'con cualquier otra especialidad civil, solo que esto podría '\
              'significar invertir algunos cursos adicionales.' },
    { major: ing_construccion,
      question: '¿Cómo es el campo laboral?',
      answer: 'Este major les permite a los alumnos trabajar en distintos ámbitos. '\
              'Por ejemplo se puede trabajar en una constructora, ya que tienen '\
              'conocimientos en ámbitos como la planificación, materiales, '\
              'estructuras, etc. También pueden trabajar en una consultora, porque '\
              'tienen una visión amplia de distintos aspectos para el estudio de '\
              'nuevos proyectos. Tienen conocimientos de ingeniería ambiental, '\
              'planificación e ingeniería en construcción, por lo que tienen una '\
              'visión más completa para el estudio de proyectos.' },
    { major: ing_estructural,
      question: '¿Dónde puedo trabajar si sigo este major?',
      answer: 'Un estudiante que haya terminado el major puede trabajar en '\
              'Oficinas de Ingenieria que se preocupen del diseño y construcción '\
              'de obras civiles, tanto nacionales como internacionales. También '\
              'puede participar en consultoras de ingeniería, minería u obras '\
              'públicas.' },
    { major: ing_estructural,
      question: '¿Cuáles son las áreas de investigación asociadas al major?',
      answer: 'La principal preocupación de la Ing. estructural es el diseño '\
              'sísmico de las estructuras, debido a que Chile se expone '\
              'constantemente a estas situaciones, lo cual permite probar nuevas '\
              'tecnologías y verificar el comportamiento de las estructuras.' },
    { major: ing_mecanica,
      question: '¿Para qué labores quedan capacitados los alumnos que egresen de '\
                'este major?',
      answer: 'La ingeniería mecánica en Chile tiene mucho que ver con el montaje '\
              'de sistemas productivos y su mantención, con sistemas de conversión '\
              'de energía y, también, con lo que tiene que ver con materiales. El '\
              'major de mecánica cubre estas áreas en tres líneas:'\
              "\r\n\r\n- Diseño mecánico/diseño mecatrónico"\
              "\r\n- Sistemas técnicos de energía"\
              "\r\n- Manufactura y producción de productos y materiales" },
    { major: ing_mecanica,
      question: '¿Dónde se desempeñan los egresados del área de mecánica?',
      answer: 'Los egresados de este departamento se han empleado en labores '\
              'diversas dentro del ámbito de la producción. Por ejemplo: montaje '\
              'de sistemas productivos, reparación de estos sistemas, etc. Hay '\
              'muchos egresados que se emplean en áreas de mantención, producción '\
              'o de gerencia operativa.' },
    { major: ing_mecanica,
      question: '¿Cuáles son los desafíos de la Ingeniería Mecánica en Chile?',
      answer: 'Chile no es un país que no fabrica automóviles, aviones o barcos. '\
              'Aquí hay un desafío para los futuros alumnos de mecánica para que '\
              'ellos sean los futuros emprendedores en PYMEs que apunten al '\
              'desarrollo de productos de esta naturaleza.' },
    { major: sistemas_autonomos_roboticos,
      question: '¿Qué oportunidades de emprendimiento existen en esta área?',
      answer: 'En Chile la robótica está un poco atrasada con respecto a otros '\
              'países, en ese sentido hay mucho potencial para seguir creciendo. '\
              'Hay alumnos de la universidad que ya han empezado a emprender en '\
              'este tema.' },
    { major: sistemas_autonomos_roboticos,
      question: '¿Cuáles son las áreas de investigación asociadas a este major?',
      answer: 'Hay múltiples áreas de investigación en robótica debido a las '\
              'distintas aplicaciones que esta puede tener. En la PUC se están '\
              'estudiando principalmente manipuladores móviles. Hay temas de la '\
              'robótica que aún no están resueltos y todos estos presentan una '\
              'oportunidad para avanzar.' },
    { major: sistemas_autonomos_roboticos,
      question: '¿Es necesario tomar el curso exploratorio "Introduccion a la '\
                'Robótica"?',
      answer: 'Este curso es un curso de fundamentos de la robótica, el cual '\
              'establece las bases de este major, por lo que sí es necesario '\
              'hacerlo. En este caso el curso cumple un rol dual de exploratorio y '\
              'de fundamentos.' },
    { major: sistemas_autonomos_roboticos,
      question: '¿Con qué título profesional puedo articular si tomo este major?',
      answer: 'Este major está diseñado para articular de la mejor manera con los '\
              'títulos de Ingeniero Civil en Computación e Ingeniero Civil '\
              'Electricista. La idea es que en el futuro también se pueda lograr '\
              'una mejor articulación con el Ingeniero Civil Mecánico. La robótica '\
              'es un área en la cual convergen estas tres disciplinas.' },
    { major: ing_ambiental,
      question: '¿Se le da mucho énfasis a la química en este Major?',
      answer: 'Se deben integrar distintas disciplinas y, en este sentido, la '\
              'química es parte de esta necesidad. Se utiliza la química pero de '\
              'forma aplicada a distintas disciplinas.' },
    { major: ing_ambiental,
      question: '¿Cuál es el campo laboral para quienes salen de este Major?',
      answer: 'Hay campo en la industria privada, en el área de la búsqueda de '\
              'minimización de impacto ambiental en la producción, y en '\
              'consultorías, asesorando a otros en el mismo tema. En áreas de '\
              'servicios, a la hora de operar plantas de distinto tipo y '\
              'finalmente, en el sector público, trabajando en políticas públicas '\
              'en variados sectores que buscan minimizar el impacto ambiental.' },
    { major: ing_ambiental,
      question: '¿Qué áreas de investigación existen actualmente en este Major?',
      answer: 'Celdas de combustible para generar energía desde los residuos. En '\
              'geoquímica ambiental, está la geoquímica urbana, relacionada con '\
              'los riesgos ambientales a los que las personas están expuestos '\
              'según donde viven y la geoquímica de los ríos, que analiza cómo se '\
              'comportan los contaminantes y cómo llegan a las distintas fuentes '\
              'de agua.' },
    { major: ing_quimica,
      question: '¿Con qué títulos profesionales puedo articular si elijo este '\
                'Major?',
      answer: 'En primer lugar, en Ingeniería Civil en Industrias, con dos Títulos '\
              'distintos, Industrial mención Química y mención Bioprocesos. Son '\
              'posibles otras articulaciones que pueden llevar a obtener el Título '\
              'de Ingeniero Civil en Biotecnología o Ingeniero Civil Ambiental.' },
    { major: ing_quimica,
      question: '¿En qué áreas puedo trabajar al egresar con este Major?',
      answer: 'En cualquier tipo de empresas productivas, consultoras o '\
              'gubernamentales que se relacionen con la producción química, '\
              'tratamiento de residuos, producción de agua potable, problemas '\
              'relacionados con el ambiente, medicina, minería, productos '\
              'cosméticos y farmacéuticos, entre muchas otras áreas.' },
    { major: ing_quimica,
      question: '¿Cuáles son las áreas de investigación de los profesores de esta '\
                'área?',
      answer: 'Alimentos, ingeniería ambiental, biotecnología, biomateriales, '\
              'productos naturales y modelamiento.' },
    { major: ing_quimica,
      question: '¿Cómo se diferencia con otros Majors?',
      answer: 'Este Major tiene énfasis en balances de masa, balances de energía y '\
              'en procesos de equilibrio fisicoquímico y fenómenos de transporte. '\
              'En su aplicación, se centra en el diseño de procesos de separación '\
              'y reacción química.' },
    { major: ing_quimica,
      question: '¿Cuál es el perfil del alumno de este Major?',
      answer: 'Se buscan alumnos que tengan alto compromiso por la disciplina y '\
              'que busquen trabajar por mejorar la industria y el bienestar '\
              'general de la población. Pueden tener habilidades computacionales '\
              'o de laboratorio, ambos son bienvenidos mientras tengan ganas de '\
              'trabajar.' },
    { major: ing_biologica,
      question: '¿Por qué elegir este Major?',
      answer: 'En el futuro, está presente la biotecnología, el desarrollo de esta '\
              'área está en gran aumento. La proyección de lo que se viene se basa '\
              'en tecnologías de información y en biotecnología. A aquellos que '\
              'les motive, deben atreverse a ser parte de este futuro.' },
    { major: ing_biologica,
      question: '¿Con qué título puedo articular si elijo este Major?',
      answer: 'La articulación más común es el título de Ingeniero Civil en '\
              'Biotecnología, que tiene dos menciones, Ambiental y Procesos. En '\
              'segundo lugar, se puede articular con Ingeniería Civil Industrial '\
              'Química y Bioprocesos. Finalmente, con un poco más de esfuerzo, se '\
              'puede articular con Ingeniería Ambiental.' },
    { major: ing_biologica,
      question: '¿Cuáles son las aplicaciones de este Major?',
      answer: 'Desde prevención, diagnóstico y curación de enfermedades hasta '\
              'procesos de manufactura, como bioplásticos o biocombustibles e '\
              'incluso síntesis de fármacos. También se aplica a la '\
              'sustentabilidad ambiental.' },
    { major: ing_biomedica,
      question: '¿Cuál es el campo laboral para este Major?',
      answer: 'Depende mucho de la articulación con el título. Si se sigue '\
              'trabajando en el área biomédica, se puede trabajar en redes de '\
              'salud pública y privada, en empresas de comercialización de '\
              'productos médicos, en el emprendimiento propio en materia biomédica '\
              'y también en el área de investigación.' },
    { major: ing_biomedica,
      question: '¿Cuáles son las áreas de investigación?',
      answer: 'A nivel universidad, están las imágenes médicas (radiografías, '\
              'escáner, etc), los biomateriales y su uso dentro del ser humano y, '\
              'finalmente, la biomecánica, que estudia la interacción entre las '\
              'células y las fuerzas. A nivel mundial, está el control a través '\
              'del cerebro de prótesis, bioinformática, políticas de salud, '\
              'gestión operativa de hospitales, entre muchos otros temas.' },
    { major: ing_biomedica,
      question: '¿Cómo afrontar el número limitado de cupos del Major?',
      answer: 'Ser optimistas, creer en que quedarán y recordar que el Major no es '\
              'un título, por lo que pueden articular mediante otros Majors con '\
              'ramos de este, obtener un Magister o un Doctorado, entre otras '\
              'posibilidades.' },
    { major: ing_civil,
      question: '¿Qué es lo distinto de este major?',
      answer: 'El major de ingeniería civil otorga una gran amplitud y da una '\
              'visión amplia de muchas especialidades, el conocimiento entregado '\
              'es más bien vasto y no tan específico. Este modo de operar se '\
              'asemeja a la realidad y se vuelve útil en esta, ya que los '\
              'proyectos traen problemas amplios en donde se necesita tener muchas '\
              'herramientas y contar con un gran equipo para poder responder a '\
              'estos desafíos de manera innovadora.'\
              "\r\nSi comparamos al Ingeniero UC con respecto a otros ingenieros "\
              'existirán ciertas diferencias entre ellos dado al: tiempo, la '\
              'profundización de ciertos tópicos y el perfil de cada universidad. '\
              'El major tiene la tarea de conservar esta visión amplia de '\
              'ingeniería.' },
    { major: ing_civil,
      question: '¿Qué mensaje le daría a los estudiantes para elegir este major?',
      answer: 'Mauricio López considera que, por un lado, este currículo abre '\
              'muchísimos caminos y por el otro lado asusta ya que aquí las '\
              'oportunidades de elección se siguen tomando en cada momento. No '\
              'obstante esto no implica que no exista una reflexión vocacional y '\
              'que el estudiante no pueda cambiar. De hecho, es bastante fácil '\
              'cambiar el foco del major y agrega diciendo que de esa forma el '\
              'alumno puede reinventarse de manera fácil dentro de la Ingeniería '\
              'Civil.' },
    { major: ing_civil,
      question: '¿Cuáles son las posibilidades de investigación en este major?',
      answer: 'Si bien ingeniería civil es una carrera tradicional es una '\
              'disciplina en la que aún se sabe muy poco ya que los preguntas o '\
              'los desafíos de hoy no están muy claros, temas como: productividad, '\
              'seguridad, sustentabilidad, etc.'\
              "\r\nPor lo que investigar en dichos temas es totalmente necesario y "\
              'este major puede fomentar el espíritu de investigación y a tratar '\
              'de responder distintas preguntas, por ejemplo cómo compatibilizar '\
              'una cosa técnica con temas mayores y con la sociedad.' },
    { major: ing_arquitectura,
      question: '¿Cómo es la selección y postulación a este major?',
      answer: 'El postulante presenta una carta de interés donde establece las '\
              'razones por las cuáles se encuentra interesado en el major, luego a '\
              'través de los antecedentes académicos el comité seleccionará a 15 '\
              'candidatos de los cuales sólo 8 podrán acceder al major.' },
    { major: ing_arquitectura,
      question: '¿Es necesario articular Arquitectura para estudiar Planificación '\
                'Urbana?',
      answer: 'Esta área se puede desarrollar desde ambas disciplinas, ingeniería '\
              'o arquitectura, por lo que no es necesario articular pero los '\
              'enfoques de los roles pueden ser distintos.' },
    { major: ing_arquitectura,
      question: '¿Cuál es el costo en créditos de articular con Arquitectura?',
      answer: 'Aún no está estipulado esté costo, aunque puede estar cercano a 270 '\
              'créditos y 16 semestres al tratarse de un major de '\
              'interdisciplina.' },
    { major: ing_arquitectura,
      question: '¿Hay ramos de taller en este major?',
      answer: 'Sí, existe un ramo de taller y según el minor se pueden tener hasta '\
              'dos más sin incluir los Optativos que se pueden tomar.' },
    { major: ing_arquitectura,
      question: '¿Qué diferencias tiene este major con otros similares?',
      answer: 'La diferencia de éste major respecto a otros disciplinarios dentro '\
              'de ingeniería es que forma profesionales, en sus respectivos '\
              'diplomas, que aprenden a entender e interactuar con otras '\
              'disciplinas de mejor forma, gracias a la interdisciplina. Los otros '\
              'buscan una forma directa y formal para formar alumnos en sus '\
              'respectivas áreas.' },
    { major: ing_geotecnica,
      question: '¿Qué tipo de proyectos se realizan en esta disciplina?',
      answer: 'La geotécnica se puede ver en grandes proyecto, por ejemplo la '\
              'expansión de líneas de metro, tranques y depósitos grandes de '\
              'desechos, y grandes obras civiles. Últimamente se ha profundizado '\
              'en puertos al tener una componente hidráulica y de suelo '\
              'importante.' },
    { major: ing_geotecnica,
      question: '¿Cuál es el perfil de alumno que busca este major?',
      answer: 'Este major se encuentra en el área civil, por tanto se busca '\
              'interesados en obras que ayuden al desarrollo del país. El foco se '\
              'encuentra en la modelación del comportamiento de suelos y rocas '\
              'para resolver las distintas problemáticas estructurales.' },
    { major: ing_geotecnica,
      question: '¿Cuáles son las posibilidades de empleo en este major?',
      answer: 'Los egresados de este major principalmente trabajan en la operación '\
              'y desarrollo de proyectos mineros. También se puede trabajar en '\
              'oficinas consultoras de Ingeniería en geotecnia para obras de '\
              'infraestructura más tradicionales.' },
    { major: ing_geotecnica,
      question: '¿Cuáles son las diferencias con Geociencias y Geoingeniería?',
      answer: 'El major de Geociencias tiene un foco más descriptivo y '\
              'cualitativo, mientras que el de Geotecnia se preocupa de los datos '\
              'cuantitativos, los cuáles son importantes en igual medida dentro de '\
              'un proyecto.'\
              "\r\nLa diferencia con Geoingeniería es el tipo de proyecto, puesto "\
              'que en Geotecnia tiene un foco en proyectos de Ingeniería Civil, '\
              'grandes obras de infraestructura.' },
    { major: investigacion_operativa,
      question: '¿Qué tipo de formación entrega este Major?',
      answer: 'Una formación sólida y profunda en las metodologías cuantitivas '\
              'analíticas de modelación y resolución de problemas, dando una '\
              'flexibilidad para moverse dentro de diversas áreas. Todo esto '\
              'gracias a los fundamentos de la modelación que entrega este '\
              'Major.' },
    { major: investigacion_operativa,
      question: '¿En qué proyectos concretos se aplica la investigación '\
                'operativa?',
      answer: 'La Investigación operativa es un área que lleva más de medio siglo '\
              'de desarrollo aportando en diversos ámbitos, tanto en los '\
              'tradicionales industriales como en minería, líneas áreas, etc, en '\
              'donde se maneja una vasta cantidad de recursos. También se aplica '\
              'en el sector público, como el área de la salud, haciendo un buen '\
              'uso de los recursos y mejorando la planificación.' },
    { major: investigacion_operativa,
      question: '¿Cómo articula este Major con títulos profesionales?',
      answer: 'El major se puede articular con cualquier título debido a su '\
              'amplitud. Sin embargo tiene una mayor afinidad con el área de '\
              'Ingeniería Matemática y en Transportes por mencionar algunas. Es '\
              'importante la planificación para poder articular correctamente.' },
    { major: investigacion_operativa,
      question: '¿Cómo enfocar la elección de Major?',
      answer: 'Lo mejor que se puede hacer es analizar las opciones y elegir lo '\
              'que realmente les gusta y aprovechar el potencial de ser Ingeniero '\
              'UC.' },
    { major: mineria,
      question: '¿Cómo es el trabajo en minería?',
      answer: 'Se puede trabajar o no en la mina, es una decisión personal. Sin '\
              'embargo, la experiencia muestra que para poder tener un mejor '\
              'desarrollo profesional hay que estar en la mina. La minería da la '\
              'opción de desarrollarse tanto en empresas mineras como en empresas '\
              'relacionadas a ella, estas últimas pueden tener sus bases en '\
              'Santiago pero les puede tocar mucho viajar.'\
              "\r\nLa minería da la opción para que alumnos al año de egresados "\
              'sean capaces de tomar decisiones de relevancia dentro de una '\
              'empresa.' },
    { major: mineria,
      question: '¿Cuáles son las áreas de investigación en minería?',
      answer: 'A nivel mundial la industria está revisando lo que se hace '\
              'actualmente, buscando nuevas formas de explotar las minas, pensando '\
              'en diversos métodos como el uso de bacterias para poder realizar '\
              'una explotación más eficiente. La investigación está apuntando a '\
              'hacer una minería distinta, una mejora continua en los procesos y '\
              'equipos, pensando en una minera inteligente.' },
    { major: mineria,
      question: '¿Por qué elegir este Major?',
      answer: 'Porque da la opción de trabajar en una de las industrias más '\
              'relevantes del país, trabajando en CODELCO o empresas proveedoras, '\
              'lugares en los cuales se puede aportar el desarrollo económico, '\
              'social y tecnológico del país. También conduce rápidamente a tomar '\
              'decisiones de relevancia en la empresa. Si gustan de los desafíos, '\
              'quieren tener una mirada crítica y trabajar en equipo este Major '\
              'los prepara para eso.' }
  ]
)

puts('Creating Rules...')

Rule.create!(
  [
    { content: '<h1>En proceso...</h1>', category: 'Foro' },
    { content: '<h1>En proceso...</h1>', category: 'Salas Virtuales' }
  ]
)

puts('Creating Tags...')

Tag.create!(
  [
    { name: 'Académico', category: 'Tipo de Actividad' },
    { name: 'Emprendimiento', category: 'Tipo de Actividad' },
    { name: 'Eventos', category: 'Tipo de Actividad' },
    { name: 'Otros', category: 'Tipo de Actividad' },
    { name: 'Solicito', category: 'Tipo de Publicacion' },
    { name: 'Ofrezco', category: 'Tipo de Publicacion' },
    { name: 'Informo', category: 'Tipo de Publicacion' },
    { name: 'Plan Común', category: 'Departamento y Programas' },
    { name: 'College', category: 'Departamento y Programas' },
    { name: 'Ingeniería Ambiental', category: 'Majors' },
    { name: 'Ingeniería Biológica', category: 'Majors' },
    { name: 'Ingeniería Biomédica', category: 'Majors' },
    { name: 'Ingeniería Civil', category: 'Majors' },
    { name: 'Ingeniería de Construcción', category: 'Majors' },
    { name: 'Ingeniería Eléctrica', category: 'Majors' },
    { name: 'Ingeniería Estructural', category: 'Majors' },
    { name: 'Ingeniería Geotécnica', category: 'Majors' },
    { name: 'Ingeniería Hidráulica', category: 'Majors' },
    { name: 'Ingeniería Matemática', category: 'Majors' },
    { name: 'Ingeniería Mecánica', category: 'Majors' },
    { name: 'Ingeniería Minera', category: 'Majors' },
    { name: 'Ingeniería Química', category: 'Majors' },
    { name: 'Ingeniería y Arquitectura', category: 'Majors' },
    { name: 'Ingeniería, Diseño e Innovación', category: 'Majors' },
    { name: 'Ciencias Ambientales', category: 'Majors' },
    { name: 'Computación', category: 'Majors' },
    { name: 'Geociencias', category: 'Majors' },
    { name: 'Investigación Operativa', category: 'Majors' },
    { name: 'Sistemas Autónomos y Robóticos', category: 'Majors' },
    { name: 'Sistemas de Transportes', category: 'Majors' }
  ]
)

puts('Creating Distinguished Sections...')

DistinguishedSection.create!(
  [
    { name: 'SAi',
      description: "La Sala de Ayudantes de Ingeniería (SAI) entrega una atención
                    mucho más personalizada que una ayudantía tradicional, lo que
                    requiere ayudantes talentosos, diversos y hábiles para atender
                    a los alumnos." },
    { name: 'Tutores',
      description: "Los tutores son alumnos voluntarios que ayudan a un grupo de
                    novatos en su inserción, integración y adaptación a la Escuela
                    de Ingeniería, a través de orientación y actividades
                    organizadas por el Cuerpo de Tutores. El tutor acompaña
                    durante todo el primer año al novato para facilitar este
                    proceso." }
  ]
)

puts('Creating Users...')

user = User.new(
  email: 'acercaringenieria@uc.cl',
  password: 'napoleon',
  first_name: 'Administrador',
  last_name: 'Plataforma',
  generation: 2011,
  admin: true
)
user.skip_confirmation!
user.save

if ENV['FAKE_DATA']
  all_users = User.all
  all_majors = Major.all
  all_categories = Category.all
  all_tags = Tag.all
  all_distinguished_sections = DistinguishedSection.all

  statuses = [Archivable::ARCHIVED_STATUS, Archivable::UNARCHIVED_STATUS]

  200.times do |_i|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    user = User.new(
      email: I18n.transliterate("#{first_name}#{last_name}@uc.cl").gsub(/\s+/, ''),
      password: 'napoleon',
      first_name: first_name,
      last_name: last_name,
      generation: rand(2010..2016),
      admin: rand(1..100) > 97
    )
    user.skip_confirmation!
    user.save
  end

  Major.all.each do |major|
    major.users << all_users.sample(10 + rand(User.count / 10))
    major.users.sample(2).each { |user| MajorAdmin.create(major: major, user: user) }
  end

  puts('Creating Articles...')

  75.times do |index|
    article = Article.create!(
      major: all_majors.sample,
      title: "#{index}-#{Faker::Lorem.sentence(2)}",
      content: Faker::Lorem.paragraph,
      short_description: Faker::Lorem.paragraph
    )

    all_categories.sample.articles << article
  end

  puts('Creating Topics...')

  75.times do |index|
    user = all_users.sample
    major_admin = MajorAdmin.find_by(user_id: user.id)
    rank = (user.admin? ? -1 : (major_admin ? major_admin.major.id : 0))

    topic = Topic.new(
      title: "#{index}-#{Faker::Lorem.sentence(2)}",
      description: Faker::Lorem.paragraph,
      status: statuses.sample,
      user: user,
      user_admin_rank: rank
    )

    topic.tags << all_tags.sample(3)
    topic.enrolled_users << all_users.sample(5) - [user]
    topic.save
  end

  puts('Creating Virtual Rooms...')

  50.times do |index|
    user = all_users.sample

    virtual_room = VirtualRoom.new(
      title: "#{index}-#{Faker::Lorem.sentence(2)}",
      description: Faker::Lorem.paragraph,
      link: 'https://talkgadget.google.com/hangouts/_/brwg',
      date: (10 + rand(1000)).days.from_now,
      status: statuses.sample,
      user: user
    )

    virtual_room.tags << all_tags.sample(3)
    virtual_room.enrolled_users << all_users.sample(5) - [user]

    next unless virtual_room.save && rand(10) > 8

    all_distinguished_sections.sample.virtual_rooms << virtual_room
  end

  puts('Creating Comments...')

  all_articles = Article.all
  all_topics = Topic.all
  all_virtual_rooms = VirtualRoom.all
  all_commentables = all_majors + all_articles + all_topics + all_virtual_rooms

  1500.times do
    comment = Comment.new(
      content: Faker::Lorem.paragraph,
      user: all_users.sample
    )

    all_commentables.sample.comments << comment
    comment.save
  end

  puts('Creating Distinguished Section Administrators...')

  5.times do
    DistinguishedSectionAdmin.create(
      distinguished_section: DistinguishedSection.all.sample,
      user: all_users.sample
    )
  end
end

puts('Done.')

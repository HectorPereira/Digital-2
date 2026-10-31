from pathlib import Path
import xml.etree.ElementTree as E
from html import escape
r=Path.cwd(); (r/'diagramas').mkdir(exist_ok=True)
f=E.Element('mxfile',host='app.diagrams.net',pages='2')
class Page:
 def __init__(self,name):
  d=E.SubElement(f,'diagram',name=name,id=name[:2]);m=E.SubElement(d,'mxGraphModel',grid='1',gridSize='10',page='1',pageWidth='1600',pageHeight='900');self.root=E.SubElement(m,'root');E.SubElement(self.root,'mxCell',id='0');E.SubElement(self.root,'mxCell',id='1',parent='0');self.svg=['<svg xmlns="http://www.w3.org/2000/svg" width="1600" height="900" viewBox="0 0 1600 900"><defs><marker id="arr" markerWidth="9" markerHeight="9" refX="8" refY="4" orient="auto"><path d="M0,0 L8,4 L0,8" fill="none" stroke="black"/></marker></defs><rect width="1600" height="900" fill="white"/>'];self.n=0
 def node(self,x,y,w,h,text,kind='box',size=20):
  self.n+=1;cid='n'+str(self.n);style=f'html=0;whiteSpace=wrap;fontFamily=Arial;fontSize={size};fillColor=#FFFFFF;strokeColor=#222222;rounded=0;'
  if kind=='text':style+='shape=text;strokeColor=none;fillColor=none;align=left;'
  if kind=='boundary':style+='dashed=1;dashPattern=7 5;'
  c=E.SubElement(self.root,'mxCell',id=cid,parent='1',vertex='1',value=text,style=style);E.SubElement(c,'mxGeometry',x=str(x),y=str(y),width=str(w),height=str(h),attrib={'as':'geometry'})
  if kind!='text':self.svg.append(f'<rect x="{x}" y="{y}" width="{w}" height="{h}" fill="white" stroke="#222" stroke-width="2"'+(' stroke-dasharray="8 6"' if kind=='boundary' else '')+'/>')
  if text:
   lines=text.split('\n');start=y+(h-len(lines)*size*1.3)/2+size
   for i,line in enumerate(lines):self.svg.append(f'<text x="{x+8 if kind=="text" else x+w/2}" y="{start+i*size*1.3}" text-anchor="{"start" if kind=="text" else "middle"}" font-family="Arial" font-size="{size}">{escape(line)}</text>')
 def edge(self,points,label='',dash=False,labelpos=None):
  self.n+=1;c=E.SubElement(self.root,'mxCell',id='e'+str(self.n),parent='1',edge='1',style='edgeStyle=none;endArrow=block;html=0;strokeWidth=2;'+('dashed=1;' if dash else ''));g=E.SubElement(c,'mxGeometry',relative='1',attrib={'as':'geometry'});E.SubElement(g,'mxPoint',x=str(points[0][0]),y=str(points[0][1]),attrib={'as':'sourcePoint'});E.SubElement(g,'mxPoint',x=str(points[-1][0]),y=str(points[-1][1]),attrib={'as':'targetPoint'});a=E.SubElement(g,'Array',attrib={'as':'points'});
  for x,y in points[1:-1]:E.SubElement(a,'mxPoint',x=str(x),y=str(y))
  self.svg.append('<polyline points="'+' '.join(f'{x},{y}' for x,y in points)+'" fill="none" stroke="#222" stroke-width="2" marker-end="url(#arr)"'+(' stroke-dasharray="8 5"' if dash else '')+'/>')
  if label:
   x,y=labelpos or ((points[0][0]+points[-1][0])/2,points[0][1]-20);self.node(x-65,y-14,180,28,label,'text',17)
 def save(self,name): (r/'diagramas'/name).write_text(''.join(self.svg)+'</svg>',encoding='utf-8')
p=Page('01 Parte B - integración')
p.node(35,20,1500,65,'Parte B · FSM secuenciadora de operaciones','text',30)
p.node(35,90,1500,35,'Línea continua: datos/resultados · Línea discontinua: control/reloj · Cruces sin punto: sin conexión','text',17)
p.node(300,150,1000,665,'','boundary');p.node(325,160,850,40,'top_B · FPGA Spartan-7 XC7S15 · reloj único de 100 MHz','text',22)
p.node(30,230,200,90,'DIP grande\nA[3:0] · 4 entradas');p.node(30,350,200,90,'DIP grande\nB[3:0] · 4 entradas')
p.node(330,220,650,70,'A0..A3: posiciones 5, 6, 7, 8\nB0..B3: posiciones 1, 2, 3, 4','text',18)
p.node(1040,240,200,160,'Datapath\nCombinacional\nAND · OR\nXOR · ADD')
p.edge([(230,305),(1010,305),(1010,280),(1040,280)],'A[3:0] · 4',labelpos=(800,285));p.edge([(230,395),(990,395),(990,340),(1040,340)],'B[3:0] · 4',labelpos=(800,375))
p.node(380,450,180,100,'Divisor\nMAX=100 000 000');p.node(690,450,210,100,'FSM · Moore\n4 estados\nReset → AND')
p.edge([(560,500),(690,500)],'en · 1',True,labelpos=(650,475));p.edge([(900,480),(960,480),(960,425),(1140,425),(1140,400)],'op[1:0] · 2',True,labelpos=(1070,445))
p.node(1360,240,210,80,'Resultado\nLED[3:0] · 4 bits');p.edge([(1240,280),(1360,280)],'4',labelpos=(1300,255))
p.node(1360,370,210,80,'Carry\nLED[4] · 1 bit');p.edge([(1240,350),(1280,350),(1280,410),(1360,410)],'1',labelpos=(1300,385))
p.node(1360,550,210,80,'Operación actual\nLED[9:8] · 2 bits');p.edge([(900,520),(950,520),(950,590),(1360,590)],'op[1:0] · 2',True,labelpos=(1130,570))
p.node(30,620,200,75,'Reloj\n100 MHz · H4');p.edge([(230,657),(410,657),(410,550)],'clk',True,labelpos=(290,635));p.edge([(350,657),(740,657),(740,550)],'',True)
p.node(30,720,200,75,'Reset activo alto\nDIP chico 4 · D2');p.edge([(230,757),(480,757),(480,550)],'rst',True,labelpos=(285,735));p.edge([(350,757),(830,757),(830,550)],'',True)
p.node(1010,700,230,70,"Constante '0'\nAR_3V3_EN");p.node(1360,700,210,80,'Habilitación 3,3 V\nL13 · activa baja');p.edge([(1240,735),(1360,735)],'1',labelpos=(1300,710))
p.node(1010,620,260,50,'LED[7:5] = 000\nSalidas sin uso','text',18)
p.node(35,835,1500,45,'LED lógico 0 → LED1 físico · Carry → LED5 físico · op[1:0] → LED10 y LED9 físicos','text',19)
p.save('parte_b_integracion.svg')
p=Page('02 Parte A - integración');p.node(35,20,1500,65,'Parte A · Divisor y contador binario','text',30);p.node(35,90,1500,35,'Línea continua: datos/resultados · Línea discontinua: control/reloj','text',18)
p.node(300,150,1000,665,'','boundary');p.node(325,160,900,40,'top_A · FPGA Spartan-7 XC7S15 · reloj único de 100 MHz','text',22)
p.node(380,300,220,140,'Divisor\nMAX=100 000 000\nPulso de un ciclo');p.node(850,300,260,140,'Contador ascendente\nN=10 · reset síncrono\nIncremento con en=1');p.edge([(600,370),(850,370)],'en · 1',True,labelpos=(700,345));p.node(1360,325,200,90,'LED[9:0]\n10 bits');p.edge([(1110,370),(1360,370)],'q[9:0] · 10',labelpos=(1210,345))
p.node(30,510,200,80,'Reloj\n100 MHz · H4');p.edge([(230,550),(440,550),(440,440)],'clk',True,labelpos=(285,530));p.edge([(350,550),(920,550),(920,440)],'',True)
p.node(30,640,200,80,'Reset activo alto\nDIP chico 4 · D2');p.edge([(230,680),(530,680),(530,440)],'rst',True,labelpos=(285,660));p.edge([(350,680),(1030,680),(1030,440)],'',True)
p.node(1020,720,220,65,"Constante '0'\nAR_3V3_EN");p.node(1360,710,210,80,'Habilitación 3,3 V\nL13 · activa baja');p.edge([(1240,752),(1360,752)],'1',labelpos=(1300,730))
p.node(35,835,1500,45,'Cuenta: 0..1023 · Un incremento por segundo · LED lógico 0 → LED1 físico','text',19);p.save('parte_a_integracion.svg')
E.ElementTree(f).write(r/'diagramas/Laboratorio_3_Arquitectura.drawio',encoding='utf-8',xml_declaration=True)
print('Dos hojas draw.io y dos SVG creados.')

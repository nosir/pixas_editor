package utils 
{
	/**
	 * @author max
	 */
	public class CodeGenerator 
	{
		private static const N:String = '\n';
		public function CodeGenerator() 
		{
			
		}
		
		public static function generate(obj:Object):String
		{
			var str:String =
			'/**'+ N +
			'* Generated By Pixas Editor' + N +
			'* ' + new Date() + N +
			'*/' + N + 
			N +
			'import com.risonhuang.pixas.colors.*;' + N +
			'import com.risonhuang.pixas.dimensions.*;' + N +
			'import com.risonhuang.pixas.math.*;' + N +
			'import com.risonhuang.pixas.objects.*;' + N +
			'import com.risonhuang.pixas.objects.primitives.*;' + N +
			N +
			'var po:PixelObject = new PixelObject();' + N +
			'po.x = Math.floor(stage.stageWidth/2);' + N +
			'po.y = Math.floor(stage.stageHeight/4);' + N +
			'addChild(po);' + N +
			N;
			
			obj.type.forEach(function(item:uint, index:int, vector:Vector.<uint>):void
			{
				switch (item) 
				{
					case 0:
						str += 
						'var pmt_' + index + ':Brick = new Brick( new BrickDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].yDms +'), SideColor.getByInnerColor(0x' + obj.color[index].toString(16).toUpperCase()+'), ' + obj.border[index] +');' + N;
						break;
					case 1:
						str += 
						'var pmt_' + index + ':SideX = new SideX( new SideXDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].zDms +'), SideColor.getByInnerColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 2:
						str += 
						'var pmt_' + index + ':SideY = new SideY( new SideYDms(' + obj.dms[index].yDms + ', ' + obj.dms[index].zDms +'), SideColor.getByInnerColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 3:
						str += 
						'var pmt_' + index + ':Cube = new Cube( new CubeDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].yDms +', ' + obj.dms[index].zDms + '), CubeColor.getByHorizontalColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 4:
						str += 
						'var pmt_' + index + ':Pyramid = new Pyramid( new PyramidDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].tall +'), PyramidColor.getByRightColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 5:
						str += 
						'var pmt_' + index + ':SlopeEast = new SlopeEast( new SlopeDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].yDms +'), SlopeColor.getByHorizontalColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 6:
						str += 
						'var pmt_' + index + ':SlopeSouth = new SlopeSouth( new SlopeDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].yDms +'), SlopeColor.getByHorizontalColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 7:
						str += 
						'var pmt_' + index + ':SlopeWest = new SlopeWest( new SlopeDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].yDms +'), SlopeColor.getByHorizontalColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
					case 8:
						str += 
						'var pmt_' + index + ':SlopeNorth = new SlopeNorth( new SlopeDms(' + obj.dms[index].xDms + ', ' + obj.dms[index].yDms +'), SlopeColor.getByHorizontalColor(0x' + obj.color[index].toString(16).toUpperCase() +'), ' + obj.border[index] +');' + N;
						break;
				}
				
				str += 'var po_' + index + ':PixelObject = new PixelObject(pmt_' + index + ' , new Coord3D('+ obj.c3d[index].x +', '+ obj.c3d[index].y +', '+ obj.c3d[index].z +'));' + N;
				if (obj.alpha[index] < 1)
				{
					str += 'po_' + index + '.alpha = ' + obj.alpha[index] + ';' + N;
				}
				if (!obj.show[index])
				{
					str += 'po_' + index + '.visible = false;' + N;
				}
				str += 
				'po.addChild(po_' + index + ');' + N +
				N;
			});
			
			return str;
		}
		
	}

}
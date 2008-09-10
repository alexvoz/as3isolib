﻿package com.jwopitz.geom
{
	public class Pt
	{		
		///////////////////////////////////////////////
		//	CALCULATIONS
		///////////////////////////////////////////////
		
		static public function distance (ptA:Pt, ptB:Pt):Number
		{
			var tx:Number = ptB.x - ptA.x;
			var ty:Number = ptB.y - ptA.y;
			var tz:Number = ptB.z - ptA.z;
			
			return Math.sqrt(tx * tx + ty * ty + tz * tz);
		}
		
		static public function theta (ptA:Pt, ptB:Pt):Number
		{
			var tx:Number = ptB.x - ptA.x;
			var ty:Number = ptB.y - ptA.y;
			
			var radians:Number = Math.atan(ty / tx);
			if (tx < 0)
				radians += Math.PI;
			
			if (tx >= 0 && ty < 0)
				radians += Math.PI * 2;
				
			return radians;
		}
		
		static public function angle (ptA:Pt, ptB:Pt):Number
		{
			return theta(ptA, ptB) * 180 / Math.PI;
		}
		
		static public function polar (originPt:Pt, radius:Number, theta:Number):Pt
		{
			var nx:Number = originPt.x + Math.cos(theta) * radius;
			var ny:Number = originPt.y + Math.sin(theta) * radius;
			
			return new Pt(nx, ny, 0);
		}
		
		static public function interpolate (ptA:Pt, ptB:Pt, f:Number):Pt
		{
			if (f <= 0)
				return ptA;
				
			if (f >= 1)
				return ptB;
				
			var nx:Number = (ptB.x - ptA.x) * f + ptA.x;	
			var ny:Number = (ptB.y - ptA.y) * f + ptA.y;	
			var nz:Number = (ptB.z - ptA.z) * f + ptA.z;
			
			return new Pt(nx, ny, nz);
		}
		
		///////////////////////////////////////////////
		//	X, Y, Z
		///////////////////////////////////////////////
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		///////////////////////////////////////////////
		//	CONSTRUCTOR
		///////////////////////////////////////////////
		
		public function Pt (x:Number = 0, y:Number = 0, z:Number = 0)
		{
			super();
			
			this.x = x;
			this.y = y;
			this.z = z;
		}
	}
}
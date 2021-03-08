with Ada.Text_IO;
use Ada.Text_IO;

procedure Potential is
	
	--with record you can save hetrogeneous Data
	--Here, Mass, Gravity and Height are recorded as Float

	type Object is record 
		Mass  : float;
		Gravity : float;
		height : float;
	end Record;
	
	--Array which holds Objects(in this case Record)
	type BigArray is array(Integer range <>) of Object; 
	
	--Just print the Output
	procedure PrintOutput (obj : Object) is
	begin
		put_line("Mass: "& float'Image(obj.Mass));
		put_line("Gravity: "& float'Image(obj.gravity));
		put_line("Height: "& float'Image(obj.height));
	end PrintOutput;

	--this function just compare two obj and returns the biggest one
	-- if both are equal, just return the temporary Object( with every memeber having 0.0 as value)
	Function Compare (obj1 : Object; obj2 : Object ) return Object is
			-- not possible tmp:object:= NULL 
		tmp : Object :=  (Mass => 0.0, Gravity => 0.0,height => 0.0);

		energy1 : float := 0.0;
		energy2 : float := 0.0;
	begin
		energy1 := obj1.Mass * obj1.Gravity * obj1.height;
		energy2 := obj2.Mass * obj2.Gravity * Obj2.height;

		if energy1 > energy2 then
			tmp := obj1;
		elsif energy1 < energy2 then
			tmp := obj2;
		end if;

		return tmp;

	end Compare;

	-- Puts the Array in a loop and send the Object to above function (Compare )
	-- tmp value is only changed if it encounter onother Object with more Energy
	procedure MaxEnergy(arr :  in out BigArray) is
		tmp : Object :=  (Mass => 0.0, Gravity => 0.0,height => 0.0);
		begin
			for I of arr Loop
				if compare(tmp,I) /= tmp then  --not equal to sign
					tmp := I;
				end if;
			end Loop;

		put_line("Biggest Energy");
		PrintOutput(tmp);	

	end MaxEnergy;
	
	-- tmp value is only changed if it encounter onother Object with less Energy
	procedure MinEnergy(arr :  in out BigArray) is
		tmp : Object :=  (Mass => 0.0, Gravity => 0.0,height => 0.0);
		index : Integer := 0;
		begin	
			for I of arr Loop
				if index = 0 then   --cannot acess the First object directly
					tmp := I;
					index := 1;
				elsif compare(tmp,I) = tmp then
					tmp := I;
				end if;
			end Loop;

		put_line("Lowest Energy");
		PrintOutput(tmp);

	end MinEnergy;

	


	
	--creating different Objects 
	A: Object := ( Mass => 15.3, Gravity => 9.8,height => 70.0);
	B: Object := ( Mass => 20.78, Gravity => 8.8,height => 70.0);
	C: Object := ( Mass => 50.77, Gravity => 19.8,height => 50.5);
	D: Object := ( Mass => 1.78, Gravity => 1.8,height => 1.0);
	
	--putting all the newly created Object to a array
	SmallArray : BigArray := (A,B,C,D);


begin
	MaxEnergy(smallArray);
	MinEnergy(smallArray);

end Potential;

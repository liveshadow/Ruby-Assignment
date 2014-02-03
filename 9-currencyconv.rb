class Numeric

 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar'=>1.00}

 def method_missing(method_id)

   singular_currency = method_id.to_s.gsub( /s$/, '')

   if @@currencies.has_key?(singular_currency)

     self * @@currencies[singular_currency]

   else

     super

   end

 end
 def in(currency)
    new_currency = currency.to_s.gsub( /s$/, '')
 
    if @@currencies.has_key?(new_currency)
        (self) / @@currencies[new_currency]
    end
 end
end

p 1.euros.in(:rupee)

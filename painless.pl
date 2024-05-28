if(ctx._version == null) 
    {
      ctx._source = params;
    }
    else
    {
      for(key in ctx._source.keySet()) 
      {
        if(params[key] != ctx._source[key])
        {
          if( !(ctx._source[key] instanceof List) ) 
          {
            ctx._source[key] = [ctx._source[key]];
            ctx._source[key].add(params[key]);
          }
          else 
          {
            if(params[key] instanceof List)
            {
              //For the record: I fucking hate this
              Map m = new HashMap();
              ArrayList n = new ArrayList();
              
              for(i in ctx._source[key]){m.put(i,1)}
              for(i in params[key]){m.put(i,1)}
              for(i in m.keySet()){n.add(i)}
              
              ctx._source[key] = n;
            }
            else 
            {
              if( !( ctx._source[key].contains(params[key]) ) )
              {
                ctx._source[key].add(params[key])
              }
            }
          }
        }
      }
    }

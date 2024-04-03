function! BulletToList()
  ?^[^*]?+1,/^[^*]/-1s/*/\=line('.') - search('^[^[:digit:]]', 'bn') . '.'
  return 
endfunction

function maxDiff(arr, arr_size) {

  let max_diff = arr[1] - arr[0];
  let min_element = arr[0];
  let i;
  let arr_index;
  let min_index

  for (i = 0; i < arr_size; i++) {

    if (arr[i] - min_element > max_diff) {
      max_diff = arr[i] - min_element;


      arr_index = arr.indexOf( arr[i] )
      min_index = arr.indexOf(min_element)
    }

    if (arr[i] < min_element) {
      min_element = arr[i];
    }

  }

  return `${max_diff} and position [${min_index}] and [${arr_index}] and [${min_element}]`;

}
       
let arr = [ 4, 11, 3, 4, 6, 8, 11];
let size = arr.length;
    
console.log("")
console.log("Maximum difference is " + maxDiff(arr, size));
console.log("")
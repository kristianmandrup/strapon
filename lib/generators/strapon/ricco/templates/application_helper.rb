module ApplicationHelper

  def make_list(list_type, list, attribute_name, updown, nr_obj_displayed)
    html_list = ''
    list = list.sort
    if list_type == "option"
      list.each do |key, value|
        html_list += '<option id=' + attribute_name.to_s + "_" + key.to_s + ' name=' + attribute_name.to_s + "[" + key.to_s + '] value=' + key.to_s + '>' +value.to_s + '</option>'
      end
    else
      list.each do |key, value|
        if key == nr_obj_displayed - 1 and !updown
          html_list += '<li id=' + attribute_name.to_s + "_" + key.to_s + ' name=' + attribute_name.to_s + "[" + key.to_s + '] value=' + key.to_s + ' class=p-dropdown-last>
                             <div>
                               <span>' + value.to_s + '</span>
                             </div>
                           </li>'
        else
          html_list += '<li id=' + attribute_name.to_s + "_" + key.to_s + ' name=' + attribute_name.to_s + "[" + key.to_s + '] value=' + key.to_s + '>
                         <div>
                           <span>' + value.to_s + '</span>
                         </div>
                       </li>'
        end
      end
    end
    return html_list
  end

  def count_box_height(nr_obj_displayed, updown)
    one_obj_height = 30
    if nr_obj_displayed == 1
      return one_obj_height
    else

      return (nr_obj_displayed * one_obj_height) + 1
    end
  end

  def drop_down(object, title, attribute_name, option_list, nr_obj_displayed, updown)
    class_name = object.class.to_s.underscore
    html_options = '
    <div class="newsletter-signup-'+attribute_name.to_s+' form-inline">
      <select id="'+class_name+'_'+attribute_name.to_s+'" name="'+class_name+'['+attribute_name.to_s+']" class="validate" data-validation-error-message-context=".newsletter-signup-'+attribute_name.to_s+'" data-validation-error-message-element=".newsletter-country-error" data-validation-error-message="You must select a country" data-validation-type="NotEmpty" style="display: none;">
        <option value="" id="'+attribute_name.to_s+'_label" value="0" name="'+attribute_name.to_s+'[label]">' +
          title
        '
        </option>'
    html_options += make_list("option", option_list, attribute_name, updown, nr_obj_displayed)
    html_options += ' </select>'


    html_drop_up = '<div class="p-dropdown-up">
      <span><a style="left: 153px;">Up</a></span>
    </div>'
    html_drop_down = '<div class="p-dropdown-down">
      <span><a style="left: 153px;">Down</a></span>
    </div>'

    html_p_dropdown = '<div class="p-dropdown" style="width: 285px;">
                        <div>
                          <div class="p-dropdown-button" style="">
                            <span class="p-dropdown-label"><span style="" class="">' + title + '</span></span>
                          </div>
                          <div class="p-dropdown-list" style="display: none; width: 318px;">'
    html_p_dropdown += html_drop_up if updown
    fix_height = count_box_height(nr_obj_displayed, updown).to_s + "px" # to count height of the box
    html_p_dropdown += '
                            <div class="p-dropdown-wrapper ' + nr_obj_displayed.to_s + '" style="overflow: hidden; position: relative; height: ' + fix_height + ';">
                              <ul style="display: block; position: absolute; top: 0px; width: 318px; height: 7500px; background-color: #ffffff;">
                                <li style="" class="p-dropdown-first selected" value="0" id="'+attribute_name.to_s+'_label" name="'+attribute_name.to_s+'[label]">
                                  <div>
                                    <span>' + title + '</span>
                                  </div>
                                </li>'
    html_p_dropdown += make_list("li", option_list, attribute_name, updown, nr_obj_displayed)
    html_p_dropdown+= '       </ul>
                            </div>'
    html_p_dropdown += html_drop_down if updown
    html_p_dropdown+=  ' </div>
                        </div>
                      </div>
    </div>'

    html_options.html_safe + html_p_dropdown.html_safe
  end
end

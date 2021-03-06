<div id="toolbox">
  <h3>{L('admintoolboxlong')} :: {L('createnewproject')}</h3>
  <fieldset class="box">
    <legend>{L('newproject')}</legend>
    <form action="{CreateURL(array('admin', 'newproject'))}" method="post">
      <div>
        <input type="hidden" name="action" value="newproject" />
        <input type="hidden" name="area" value="newproject" />
      </div>
      <table class="box">
        <tr>
          <td><label for="projecttitle">{L('projecttitle')}</label></td>
          <td><input id="projecttitle" name="project_title" value="{Post::val('project_title')}" type="text" class="required text" size="40" maxlength="100" /></td>
        </tr>
        <tr>
          <td><label for="themestyle">{L('themestyle')}</label></td>
          <td>
            <select id="themestyle" name="theme_style">
              {!tpl_options(Flyspray::listThemes(), Post::val('theme_style', $proj->prefs['theme_style']), true)}
            </select>
          </td>
        </tr>
        <tr>
          <td><label for="langcode">{L('language')}</label></td>
          <td>
            <select id="langcode" name="lang_code">
              {!tpl_options(Flyspray::listLangs(), Post::val('lang_code', $fs->prefs['lang_code']), true)}
            </select>
          </td>
        </tr>
        <tr>
          <td><label for="intromesg">{L('intromessage')}</label></td>
          <td>
            {!$this->text->textarea('intro_message', 8, 70, array('tabindex' => 8), Post::val('intro_message', $proj->prefs['intro_message']))}
          </td>
        </tr>
        <tr>
          <td><label for="othersview">{L('othersview')}</label></td>
          <td>{!tpl_checkbox('others_view', Post::val('others_view', Post::val('action') != 'newproject'), 'othersview')}</td>
        </tr>
        <tr>
          <td><label for="anonopen">{L('allowanonopentask')}</label></td>
          <td>{!tpl_checkbox('anon_open', Post::val('anon_open'), 'anonopen')}</td>
        </tr>
        <tr>
          <td class="buttons" colspan="2"><button type="submit">{L('createthisproject')}</button></td>
        </tr>
      </table>
    </form>
  </fieldset>
</div>

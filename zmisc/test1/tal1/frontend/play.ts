import * as LOG from "@dat/lib/log";
import * as ARG from "@dat/lib/argvs";
import * as IN from "@dat/lib/input";
import * as ENV from "@dat/lib/env";
import * as GIT from "@dat/lib/git";
import * as DOCKER from "@dat/lib/docker";
import * as OS from "@dat/lib/os";
import * as TEM from "@dat/lib/template";
import * as SET from "@dat/lib/settings";
import * as path from 'path';
import * as fs from 'fs';
import { cwd } from "process";
/************************************* */
type CommandName = 'watch' | 'install' | 'make' | 'rebuild-all';
type CommandArgvName = 'non-interactive' | 'level' | 'make-component';
type ConfigVariableKey = '';
type ConfigsObject = { [k in ConfigVariableKey]: any };
interface PageConfigs {
   extends: string;
   id: string;
   css_block_name: string;
   html_block_name: string;
   js_block_name: string;
   compiled_html_name: string;
   vars_prop_name?: string;
   components?: string[];
   modules?: object;
   title?: string;
   js_scripts?: string[];
   css_styles?: string[];
   is_compile?: boolean; // for components
}
/************************************* */
const VERSION = '0.9';
let configs: ConfigsObject;

/************************************* */
export async function main(): Promise<number> {
   LOG.clear();
   LOG.success(`*** Django Frontend Compiler (DFC) - version ${VERSION} ***`);
   await SET.showStatistics();


   // =>define argvs of script
   let res = await ARG.define<CommandName, CommandArgvName>([
      {
         name: 'watch',
         description: 'watch pages & components',
         alias: 'w',
         implement: async () => await watch(),
         argvs: [
            // {
            //    name: 'non-interactive',
            //    alias: 'I',
            //    description: 'Run non-interactively',
            // },
            // {
            //    name: 'level',
            //    alias: 'l',
            //    description: 'Level of install talent (default is 1)',
            //    type: 'number',
            //    defaultValue: 1,
            // },
            // {
            //    name: 'skip-rebuild-project',
            //    alias: 's1',
            //    description: 'skip to rebuild docker of talent project',
            //    type: 'boolean',
            // },
         ],
      },
      {
         name: 'install',
         description: 'install deps',
         alias: 'i',
         implement: async () => await install(),
         argvs: [
         ],
      },
      {
         name: 'make',
         description: 'make new page',
         alias: 'm',
         implement: async () => await make(),
         argvs: [
            {
               name: 'make-component',
               alias: 'c',
               type: 'boolean',
               description: 'make a component not a page (default is false)',
            }
         ],
      },
      {
         name: 'rebuild-all',
         description: 'rebuild all components and pages',
         alias: 'ra',
         implement: async () => await rebuildAll(),
         argvs: [
            // {
            //    name: 'make-component',
            //    alias: 'c',
            //    type: 'boolean',
            //    description: 'make a component not a page (default is false)',
            // }
         ],
      },
   ]);
   if (!res) return 1;

   return 0;
}
/************************************* */
async function watch(): Promise<boolean> {
   // =>load all configs
   // configs = await loadAllConfig();
   // =>scan all folder that has '.dfc' file
   return new Promise(async (res) => {
      let appsCount = 0;
      let pagesCount = 0;
      let filesCount = 0;
      let componentCount = 0;
      // =>scan pages
      let pages = await detectAllPages();
      for (const page of pages) {
         pagesCount++;
         let pageFiles = ['.dfc.json', page.name + '.html', page.name + '.scss', page.name + '.js', 'variables.js'];
         for (const f of pageFiles) {
            // =>chekc file exist
            if (!fs.existsSync(path.join(page.path, f))) continue;
            filesCount++;
            // =>watch on each files of page
            // console.log('watch file:', pagePath)
            fs.watchFile(path.join(page.path, f), { interval: 100 }, async (curr, prev) => {
               await changedPage(page.path, page.name, f);
            });
         }
      }
      // let rootPath = path.join(await OS.cwd(), '..');
      // const filesInDirectory = fs.readdirSync(rootPath, { withFileTypes: true });
      // for (const file of filesInDirectory) {
      //    if (!file.isDirectory()) continue;
      //    let appPagesPath = path.join(rootPath, file.name, 'pages');
      //    // =>check app has tempaltes dir 
      //    if (!fs.existsSync(appPagesPath)) continue;
      //    // console.log('app path:', appTempalatesPath)
      //    appsCount++;
      //    // =>get page dirs of pages 
      //    const pageDirs = fs.readdirSync(path.join(appPagesPath), { withFileTypes: true });
      //    for (const page of pageDirs) {
      //       if (!page.isDirectory()) continue;
      //       let pagePath = path.join(appPagesPath, page.name);
      //       // =>check page dir has .dfc.json 
      //       if (!fs.existsSync(path.join(pagePath, '.dfc.json'))) continue;


      //    }
      // }
      //---------------------------------
      // =>scan components
      let components = await detectAllComponents();
      for (const com of components) {
         let componentFiles = ['.dfc.json', com.name + '.html', com.name + '.scss', com.name + '.js'];
         componentCount++;
         for (const f of componentFiles) {
            // =>check file exist
            if (!fs.existsSync(path.join(com.path, f))) continue;
            filesCount++;
            // =>watch on each files of page
            // console.log('watch file:', pagePath)
            fs.watchFile(path.join(com.path, f), { interval: 100 }, async (curr, prev) => {
               await changedPage(com.path, com.name, f, 'component');
            });
         }
      }
      // rootPath = path.join(await OS.cwd(), 'env', 'components');
      // if (fs.existsSync(rootPath)) {
      //    const componentsList = fs.readdirSync(rootPath, { withFileTypes: true });
      //    for (const com of componentsList) {
      //       if (!com.isDirectory()) continue;
      //       let componentPath = path.join(rootPath, com.name);
      //       // =>check component dir has .dfc.json 
      //       if (!fs.existsSync(path.join(componentPath, '.dfc.json'))) continue;
      //       componentCount++;
      //       let componentFiles = ['.dfc.json', com.name + '.html', com.name + '.scss', com.name + '.js'];
      //       for (const f of componentFiles) {
      //          // =>check file exist
      //          if (!fs.existsSync(path.join(componentPath, f))) continue;
      //          filesCount++;
      //          // =>watch on each files of page
      //          // console.log('watch file:', pagePath)
      //          fs.watchFile(path.join(componentPath, f), { interval: 100 }, async (curr, prev) => {
      //             await changedPage(componentPath, com.name, f, 'component');
      //          });
      //       }

      //    }
      // }
      //---------------------------------
      LOG.successStatus(`detected ${filesCount} files for ${pagesCount} pages and ${componentCount} components`);
      LOG.info(`Watching for change page files (${filesCount}) ...`);
   });


}
/************************************* */
async function rebuildAll() {
   // =>detect all components
   let components = await detectAllComponents();
   LOG.info(`${components.length} components detected...`);
   let componentIndex = 0;
   while (true) {
      let com = components[componentIndex];
      LOG.info(`building '${com.name}' component ...`);
      let res = await rebuildPageOrComponent(com.path, com.name, 'component');
      if (!res) {
         LOG.error(`failed to build component '${com.name}'`);
      } else {
         componentIndex++;
         if (componentIndex >= components.length) {
            break;
         }
      }

   }
   for (const com of components) {
   }
   // =>detect all pages
   let pages = await detectAllPages();
   LOG.info(`${pages.length} pages detected...`);
   let pageIndex = 0;
   while (true) {
      let page = pages[pageIndex];
      LOG.info(`building '${page.name}' page ...`);
      let res = await rebuildPageOrComponent(page.path, page.name, 'page');
      if (!res) {
         LOG.error(`failed to build page '${page.name}'`);
      }
      else {
         pageIndex++;
         if (pageIndex >= pages.length) {
            break;
         }
      }
   }
   for (const page of pages) {
   }
   return true;
}
/************************************* */
async function install() {
   // =>load all configs
   configs = await loadAllConfig();
   // =>scan all folder that has '.dfc' file
   LOG.info('installing dependencies ...');
   await OS.shell(`sudo chmod -R 777 /usr/lib/node_modules`);
   // await OS.shell(`sudo npm install -g typescript`);
   await OS.shell(`sudo npm install -g sass`);
   await OS.shell(`sudo npm install -g @vue/cli@4.5.15`);
   await OS.shell(`sudo npm i -g @vue/cli-service-global`);
   // await OS.shell(`sudo npm install -g node-sass sass-loader`);



   // LOG.success(`You can see project on http://127.0.0.1:${configs.nginx_port}`);
   return true;
}
/************************************* */
async function make() {
   // =>if make component
   if (ARG.hasArgv('make-component')) {
      let componentName = await IN.input('Enter component Name: (like form_builder)');
      let componentPath = path.join(await OS.cwd(), 'env', 'components', componentName);
      // =>create component dir
      fs.mkdirSync(componentPath, { recursive: true });
      // =>create component files
      let pageFiles = ['.dfc.json', componentName + '.html', componentName + '.scss', componentName + '.js', 'vue.config.js'];
      let templateFiles = ['.dfc.json', 'html.html', 'scss.scss', 'js.js', 'vue.config.js'];
      for (let i = 0; i < pageFiles.length; i++) {
         // =>render page file
         fs.writeFileSync(path.join(componentPath, pageFiles[i]), (await TEM.renderFile(path.join(await cwd(), 'env', 'page_template', templateFiles[i]), { data: { pageName: componentName } })).data);
      }

      LOG.success(`created new component '${componentName}' in ${componentPath}`);

   }
   // =>if make a page
   else {
      let appName = await IN.input('Enter app Name: (like company)');
      let pageName = await IN.input('Enter Page Name: (like job_request)');
      let pagePath = path.join(await OS.cwd(), '..', appName, 'pages', pageName);
      // =>create page dir
      fs.mkdirSync(pagePath, { recursive: true });
      // =>create page files
      let pageFiles = ['.dfc.json', pageName + '.html', pageName + '.scss', pageName + '.js', 'variables.js'];
      let templateFiles = ['.dfc.json', 'html.html', 'scss.scss', 'js.js', 'variables.js'];
      for (let i = 0; i < pageFiles.length; i++) {
         // =>render page file
         fs.writeFileSync(path.join(pagePath, pageFiles[i]), (await TEM.renderFile(path.join(await cwd(), 'env', 'page_template', templateFiles[i]), { data: { pageName } })).data);
      }

      LOG.success(`created new page '${pageName}' in ${pagePath}`);
   }
}
/************************************* */
/************************************* */
/************************************* */
async function changedPage(pagePath: string, pageName: string, filename: string, type: 'page' | 'component' = 'page') {
   LOG.warning(`file '${filename}' changed in ${pagePath} (${type})`);
   let res = await rebuildPageOrComponent(pagePath, pageName, type);
   if (res) {
      LOG.success(`${type} '${pageName}' has been build and updated`);
   }
}
/************************************* */
/************************************* */
/************************************* */
async function loadAllConfig(): Promise<ConfigsObject> {
   let configs = await ENV.loadAll() as ConfigsObject;
   let ConfigVariables: { name: ConfigVariableKey; default?: any }[] = [
      // {
      //    name: 'git_url',
      //    default: 'https://domain.local',
      // },
      // {
      //    name: 'docker_project_name',
      //    default: 'tal',
      // },
      // {
      //    name: 'project_docker_image',
      //    default: 'talent:production',
      // },
      // {
      //    name: 'nginx_port',
      //    default: 80,
      // },
      // {
      //    name: 'mysql_port',
      //    default: 3306,
      // },
      // {
      //    name: 'debug_mode',
      //    default: 'False',
      // },
   ];
   // =>set default configs, if not set
   for (const conf of ConfigVariables) {
      if (!await ENV.has(conf.name) && conf.default !== undefined) {
         await ENV.save(conf.name, conf.default);
         configs[conf.name] = conf.default;
      }
   }

   return configs;
}
/************************************* */
async function detectAllPages() {
   let pages = [];
   // =>scan pages
   let rootPath = path.join(await OS.cwd(), '..');
   const filesInDirectory = fs.readdirSync(rootPath, { withFileTypes: true });
   for (const file of filesInDirectory) {
      if (!file.isDirectory()) continue;
      let appPagesPath = path.join(rootPath, file.name, 'pages');
      // =>check app has tempaltes dir 
      if (!fs.existsSync(appPagesPath)) continue;
      // console.log('app path:', appTempalatesPath)
      // =>get page dirs of pages 
      const pageDirs = fs.readdirSync(path.join(appPagesPath), { withFileTypes: true });
      for (const page of pageDirs) {
         if (!page.isDirectory()) continue;
         let pagePath = path.join(appPagesPath, page.name);
         // =>check page dir has .dfc.json 
         if (!fs.existsSync(path.join(pagePath, '.dfc.json'))) continue;
         // =>add page
         pages.push({
            path: pagePath,
            name: page.name,
            app: file.name,
         });
      }
   }
   return pages;
}
/************************************* */
async function detectAllComponents() {
   let components = [];
   // =>scan pages
   let rootPath = path.join(await OS.cwd(), 'env', 'components');
   ;
   if (!fs.existsSync(rootPath)) {
      return components;
   }
   const componentsList = fs.readdirSync(rootPath, { withFileTypes: true });
   for (const com of componentsList) {
      if (!com.isDirectory()) continue;
      let componentPath = path.join(rootPath, com.name);
      // =>check component dir has .dfc.json 
      if (!fs.existsSync(path.join(componentPath, '.dfc.json'))) continue;
      // =>add component
      components.push({
         path: componentPath,
         name: com.name,
      });
   }
   return components;
}
/************************************* */
async function rebuildPageOrComponent(pagePath: string, pageName: string, type: 'page' | 'component' = 'page') {
   try {
      // =>read & parse .dfc.json of page
      let pageConfigs = JSON.parse(fs.readFileSync(path.join(pagePath, '.dfc.json')).toString()) as PageConfigs;
      // =>create tmp folder
      fs.mkdirSync(path.join(pagePath, '.tmp'), { recursive: true });
      // =>create page static folder
      let pageStaticDirPath = '';
      if (type === 'component') {
         pageStaticDirPath = path.join(await cwd(), '..', 'static', 'components');
      } else {
         pageStaticDirPath = path.join(pagePath, '..', '..', 'static', 'pages', pageName);
      }
      // =>create static dir, if not
      fs.mkdirSync(pageStaticDirPath, { recursive: true });
      // =>read html file
      let htmlFile = fs.readFileSync(path.join(pagePath, pageName + '.html')).toString();
      let variablesFile = '';
      // =>read variables file, if exist
      if (fs.existsSync(path.join(pagePath, 'variables.js'))) {
         let variablesFileContent = fs.readFileSync(path.join(pagePath, 'variables.js')).toString();
         variablesFile = `<script>
         ${variablesFileContent}
         </script>`;
      }
      // =>compile scss file
      await OS.shell(`sass --no-source-map ${path.join(pagePath, pageName + '.scss')} ${path.join(pagePath, '.tmp', pageName + '.css')}`);
      // =>read css file
      let cssFile = fs.readFileSync(path.join(pagePath, '.tmp', pageName + '.css')).toString();
      // =>read js file
      let jsFile = fs.readFileSync(path.join(pagePath, pageName + '.js')).toString();
      // =>import components, if exist
      let importComponents = '';
      if (pageConfigs.components && pageConfigs.components.length > 0) {
         // importComponents = '<script>\n';
         for (const com of pageConfigs.components) {
            importComponents += `import ${com} from '${type == 'page' ? '../../../../static/components' : '.'}/${com}.vue';\n`;
            // importComponents += `import '${com}' from ;\n`;
         }
         // importComponents += '</script>';
      }
      // =>import components, if exist
      let importModules = '';
      if (pageConfigs.modules && Object.keys(pageConfigs.modules).length > 0) {
         for (const key of Object.keys(pageConfigs.modules)) {
            let filename = pageConfigs.modules[key];
            let modulePath = `../../../../static/components/${filename}.min`;
            if (type === 'component') {
               modulePath = `${filename}`;
            }
            importComponents += `import ${key} from '${modulePath}'\n`;
         }
      }
      // =>create middle vue file
      fs.writeFileSync(path.join(pagePath, '.tmp', pageName + '.middle.vue'), `
      
   <template>
      <div>
         ${htmlFile}
      </div>
   </template>
   
   <script>
      ${importComponents}
      ${jsFile}
   </script>

   <style scoped>
      ${cssFile}
   </style>
    
  
   `);
      // =>compile middle vue component js
      if (type === 'page') {
         await OS.shell(`vue build -t lib -n ${pageName} -d .tmp/.dist .tmp/${pageName}.middle.vue`, pagePath);
         // =>copy umd js file of page to assets
         fs.copyFileSync(path.join(pagePath, '.tmp', '.dist', `${pageName}.umd.min.js`), path.join(pageStaticDirPath, pageName + '.min.js'));
         // =>copy css file of page to assets
         fs.copyFileSync(path.join(pagePath, '.tmp', '.dist', `${pageName}.css`), path.join(pageStaticDirPath, pageName + '.min.css'));
         // =>get extra js scripts
         let extraJsScripts = '';
         if (pageConfigs.js_scripts && pageConfigs.js_scripts.length > 0) {
            for (let jsc of pageConfigs.js_scripts) {
               if (!jsc.startsWith('http')) {
                  jsc = `{% static '${jsc}' %}`;
               }
               extraJsScripts += `<script src="${jsc}"></script>\n`;
            }
         }
         // =>get extra css styles
         let extraCssStyles = '';
         if (pageConfigs.css_styles && pageConfigs.css_styles.length > 0) {
            for (let css of pageConfigs.css_styles) {
               if (!css.startsWith('http')) {
                  css = `{% static '${css}' %}`;
               }
               extraCssStyles += `<link rel="stylesheet" type="text/css" href="${css}">\n`;
            }
         }
         // =>create compiled html file, if page
         fs.writeFileSync(path.join(pagePath, '..', '..', 'templates', pageConfigs.compiled_html_name), `
{% extends '${pageConfigs.extends}' %}
{% load static %}

{% block ${pageConfigs.css_block_name} %}
   <link rel="stylesheet" type="text/css" href="{% static  'pages/${pageName}/${pageName}.min.css' %}">
   ${extraCssStyles}
{% endblock %}

{% block ${pageConfigs.html_block_name} %}
   <div id="element_${pageConfigs.id}">
      <${pageName} ${variablesFile.length > 0 ? `:${pageConfigs.vars_prop_name}="variablesData"` : ''}></${pageName}>
   </div>
{% endblock %}

{% block ${pageConfigs.js_block_name} %}
   ${extraJsScripts}
   <script src="{% static 'pages/${pageName}/${pageName}.min.js' %}"></script>
   ${variablesFile}
   <script>
      let vue_${pageConfigs.id} = new Vue({
         el: '#element_${pageConfigs.id}',
         data: {
            variablesData: ${variablesFile.length > 0 ? pageConfigs.vars_prop_name : 'null'},
         },
         created() {
            ${pageConfigs.title ? `document.title = '${pageConfigs.title}';` : ''}
         },
         components: {
            "${pageName}": ${pageName},
         }
      });
   </script>
{% endblock %}
   `);
      }
      // =>copy middle vue component js to static
      if (type === 'component') {
         fs.copyFileSync(path.join(pagePath, '.tmp', `${pageName}.middle.vue`), path.join(pageStaticDirPath, pageName + '.vue'));
         // =>if is compile set
         if (pageConfigs.is_compile) {
            await OS.shell(`vue build -t lib -n ${pageName} -d .tmp/.dist .tmp/${pageName}.middle.vue`, pagePath);
            // =>copy umd js file of page to assets
            fs.copyFileSync(path.join(pagePath, '.tmp', '.dist', `${pageName}.umd.min.js`), path.join(pageStaticDirPath, pageName + '.min.js'));
         }
      }
      return true;
   } catch (e) {
      LOG.error(e);
      return false;
   }
}
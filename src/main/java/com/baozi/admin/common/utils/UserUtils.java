package com.baozi.admin.common.utils;

import com.baozi.admin.base.SpringUtils;
import com.baozi.admin.base.shiro.AuthRealm;
import com.baozi.admin.modules.sys.dao.AreaDao;
import com.baozi.admin.modules.sys.dao.MenuDao;
import com.baozi.admin.modules.sys.dao.RoleDao;
import com.baozi.admin.modules.sys.dao.UserDao;
import com.baozi.admin.modules.sys.entity.Area;
import com.baozi.admin.modules.sys.entity.Menu;
import com.baozi.admin.modules.sys.entity.Role;
import com.baozi.admin.modules.sys.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
public class UserUtils {

    private static UserDao userDao = SpringUtils.getBean(UserDao.class);
    private static RoleDao roleDao = SpringUtils.getBean(RoleDao.class);
    private static MenuDao menuDao = SpringUtils.getBean(MenuDao.class);
    private static AreaDao areaDao = SpringUtils.getBean(AreaDao.class);

    public static final String USER_CACHE = "userCache";
    public static final String CACHE_ROLE_LIST = "roleList";
    public static final String CACHE_MENU_LIST = "menuList";
    public static final String CACHE_AREA_LIST = "areaList";
    public static final String USER_CACHE_ID_ = "id_";
    public static final String USER_CACHE_LOGIN_NAME_ = "ln";

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    public static final int SALT_SIZE = 8;

    /**
     * 获取当前用户
     *
     * @return
     */
    public static User getUser() {
        AuthRealm.Principal principal = getPrincipal();
        if (principal != null) {
            User user = get(principal.getId());
            if (user != null) {
                return user;
            }
            return new User();
        }
        // 如果没有登录,则返回实例空的User对象
        return new User();
    }

    /**
     * 获取当前登录者对象
     *
     * @return
     */
    public static AuthRealm.Principal getPrincipal() {
        try {
            Subject subject = SecurityUtils.getSubject();
            AuthRealm.Principal principal = (AuthRealm.Principal) subject.getPrincipal();
            if (principal != null) {
                return principal;
            }
        } catch (UnavailableSecurityManagerException e) {

        } catch (InvalidSessionException e) {

        }
        return null;
    }

    /**
     * 根据ID获取用户
     *
     * @param id
     * @return 取不到返回null
     */
    public static User get(String id) {
        User user = (User) CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
        if (user == null) {
            user = userDao.get(id);
            if (user == null) {
                return null;
            }
            user.setRoleList(roleDao.findListByUserId(user.getId()));
            CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
            CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
        }
        return user;
    }

    /**
     * 根据登录名获取用户
     * @param loginName
     * @return 取不到返回null
     */
    public static User getByLoginName(String loginName){
        User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName);
        if (user == null){
            user = userDao.getByLoginName(loginName);
            if (user == null){
                return null;
            }
            user.setRoleList(roleDao.findList(new Role(user)));
            CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
            CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
        }
        return user;
    }

    /**
     * 获取授权主要对象
     */
    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    /**
     * 获取当前用户授权菜单Tree
     *
     * @return
     */
    public static List<Menu> getMenuList() {
        List<Menu> menuList = (List<Menu>) CacheUtils.get(CACHE_MENU_LIST);
        if (menuList == null) {
            User user = getUser();
            Menu menu = new Menu();
            menu.setUserId(user.getId());
            menuList = menuDao.findByUserId(menu);
            CacheUtils.put(CACHE_MENU_LIST, menuList);
        }
        return menuList;
    }

    public static Session getSession() {
        try {
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession(false);
            if (session == null) {
                session = subject.getSession();
            }
            if (session != null) {
                return session;
            }
//			subject.logout();
        } catch (InvalidSessionException e) {

        }
        return null;
    }

    /**
     * 验证密码
     * @param plainPassword 明文密码
     * @param password 密文密码
     * @return 验证成功返回true
     */
    public static boolean validatePassword(String plainPassword, String password) {
        byte[] salt = Encodes.decodeHex(password.substring(0, 16));
        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }

    /**
     * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
     */
    public static String entryptPassword(String plainPassword) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
        return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
    }

    /**
     * 清除指定用户缓存
     * @param user
     */
    public static void clearCache(User user){
        CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + user.getId());
        CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName());
    }

    /**
     * 获取当前用户角色列表 所有角色列表
     * @return
     */
    public static List<Role> getRoleList(User user){
        List<Role> roleList = (List<Role>)CacheUtils.get(CACHE_ROLE_LIST);
        if (roleList == null){
            Role role = new Role();
            role.setUser(user);
            roleList = roleDao.findList(role);
            CacheUtils.put(CACHE_ROLE_LIST, roleList);
        }
        return roleList;
    }

    /**
     * 获取区域
     * @return
     */
    public static List<Area> getAreaList(){
        @SuppressWarnings("unchecked")
        List<Area> areaList = (List<Area>)CacheUtils.get(CACHE_AREA_LIST);
        if (areaList == null){
            areaList = areaDao.findList(new Area());
            CacheUtils.put(CACHE_AREA_LIST, areaList);
        }
        return areaList;
    }

    public static boolean isAdmin(String id) {
        return id != null && Global.ADMIN_ID.equals(id);
    }
}
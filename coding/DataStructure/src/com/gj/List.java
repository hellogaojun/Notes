package com.gj;

public interface List<E> {

    static final int ELEMENT_NOT_FOUND = -1;
    
    /**
     * 返回元素个数
     * @return
     */
    int size();

    /**
     * 是否为空
     * @return
     */
    boolean isEmpty();

    /**
     * 尾部追加元素
     * @param element
     */
    void add(E element);

    /**
     * 指定位置添加元素
     * @param index
     * @param element
     */
    void add(int index ,E element);

    /**
     * 根据索引删除元素
     * @param index
     * @return
     */
    E remove(int index);

    /**
     * 清空
     */
    void clear();

    /**
     * 是否包含某元素
     * @param element
     * @return
     */
    boolean contains(E element);

    /**
     * 设置index位置元素
     * @param index
     * @param element
     * @return
     */
    E set(int index, E element);

    /**
     * 获取index位置元素
     * @param index
     * @return
     */
    E get(int index);

    /**
     * 获取元素索引
     * @param element
     * @return
     */
    int indexOf(E element);

}
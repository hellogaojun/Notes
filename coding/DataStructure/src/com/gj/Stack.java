package com.gj;

public class Stack<E> {
    /**
     * 基于现有的数据结构(动态数组)实现Stack
     */
    private List<E> list = new ArrayList<>();

    /**
     * Statck Size
     * @return
     */
    public int size() {
        return list.size();
    }

    /**
     * 是否为空
     * @return
     */
    public boolean isEmpty() {
        return list.isEmpty();
    }

    /**
     * 入栈
     * @param element
     */
    public void push(E element) {
        list.add(element);
    }

    /**
     * 出栈
     * @return
     */
    public E pop() {
        return list.remove(list.size() - 1);
    }

    /**
     * 返回栈顶元素
     * @return
     */
    public E top() {
        return list.get(list.size() - 1);
    }

    /**
     * 清空栈中元素
     */
    public void clear() {
        list.clear();
    }

}
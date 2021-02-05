package com.gj;

public class LinkList<E> extends AbstractList<E> {
    private Node<E> first;

    /**
     * 节点的数据结构（元素+next节点指针）
     */
    private static class Node<E> {
        E element;
        Node<E> next;
        Node(E element, Node<E> next) {
            this.element = element;
            this.next = next;
        }
    }

    @Override
    public void add(int index, E element) {
        if (index == 0) {
            first = new Node<>(element,first);
        } else {
            Node<E> prev = node(index - 1);
            prev.next = new Node<>(element,prev.next);
        }

        size++;
    }

    @Override
    public E remove(int index) {
        Node<E> node = first;
        if (index == 0) {
            first = node.next;
        } else {
            Node<E> prev = node(index - 1);
            node = prev.next;
            prev.next = node.next; 
        }
       
        size--;
        return node.element;
    }

    @Override
    public void clear() {
        first = null;
        size = 0;
    }

    @Override
    public E set(int index, E element) {
        Node<E> oldNode = node(index);
        E oldElement = oldNode.element;
        oldNode.element = element;
        return oldElement;
    }

    @Override
    public E get(int index) {
        Node<E> node = node(index);
        return node.element;
    }

    @Override
    public int indexOf(E element) {
        if (element == null) {//避免空指针异常
            for (int i = 0; i < size; i++) {
                if (node(i).element == null) return i;
            }
        } else {
            for (int i = 0; i < size; i++) {
                if(element.equals(node(i).element)) return i;
            }
        }

        return ELEMENT_NOT_FOUND;
    }

    /**
     * 返回index位置的node
     * @param index
     * @return
     */
    private Node<E> node(int index) {
        rangeCheck(index);

        Node<E> node = first;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node;
    }

    public String toString() {
        //size=3,[99,77,66]
        StringBuilder sb = new StringBuilder();
        sb.append("size=" + size).append(",[");
        Node<E> node = first;
        for (int i = 0; i < size; i++) {
            sb.append(node.element);
            if(i != size - 1) {
                sb.append(",");
            } 
            node = node.next;
        }
        sb.append("]");
        return sb.toString();
    }

}


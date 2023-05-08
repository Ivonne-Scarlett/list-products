//
//  ViewController.swift
//  app-list-products
//
//  Created by Ivonne on 08/05/23.
//

import UIKit

class ViewController: UIViewController {
   
    
    
    
    @IBOutlet weak var tablaProductos: UITableView!
    
    var manager = ProductosManager()
    
    var productos : [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaProductos.delegate = self
        tablaProductos.dataSource = self
        
        obtenerProductos()
    }
    
    func obtenerProductos(){
        manager.obetenerProductos { [self] listaProductos in
            self.productos = listaProductos
            self.tablaProductos.reloadData()
        }
    }


}

extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        return celda
    }
}


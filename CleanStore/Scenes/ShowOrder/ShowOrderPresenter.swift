//
//  ShowOrderPresenter.swift
//  CleanStore
//
//  Created by Raymond Law on 2/17/16.
//  Copyright (c) 2016 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ShowOrderPresentationLogic
{
  func presentOrder(response: ShowOrder.GetOrder.Response)
}

class ShowOrderPresenter: ShowOrderPresentationLogic
{
  weak var viewController: ShowOrderDisplayLogic?
  
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    return dateFormatter
  }()
  
  let currencyFormatter: NumberFormatter = {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.numberStyle = .currency
    return currencyFormatter
  }()
  
  // MARK: - Fetch order
  
  func presentOrder(response: ShowOrder.GetOrder.Response)
  {
    let order = response.order
    
    let date = dateFormatter.string(from: order.date)
    let total = currencyFormatter.string(from: order.total)!
    let displayedOrder = ShowOrder.GetOrder.ViewModel.DisplayedOrder(id: order.id!, date: date, email: order.email, name: "\(order.firstName) \(order.lastName)", total: total)
    
    let viewModel = ShowOrder.GetOrder.ViewModel(displayedOrder: displayedOrder)
    viewController?.displayOrder(viewModel: viewModel)
  }
}

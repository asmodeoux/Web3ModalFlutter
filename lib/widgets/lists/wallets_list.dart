import 'package:flutter/material.dart';

import 'package:web3modal_flutter/models/grid_item_modal.dart';
import 'package:web3modal_flutter/theme/constants.dart';
import 'package:web3modal_flutter/widgets/lists/list_items/wallet_item_chip.dart';
import 'package:web3modal_flutter/widgets/lists/list_items/wallet_list_item.dart';
import 'package:web3modal_flutter/models/w3m_wallet_info.dart';

class WalletsList extends StatelessWidget {
  const WalletsList({
    super.key,
    required this.itemList,
    this.firstItem,
    this.lastItem,
    this.onTapWallet,
  });
  final List<GridItem<W3MWalletInfo>> itemList;
  final Widget? firstItem;
  final Widget? lastItem;
  final Function(W3MWalletInfo walletInfo)? onTapWallet;

  @override
  Widget build(BuildContext context) {
    final walletsListItems = itemList.map(
      (e) => WalletListItem(
        onTap: () => onTapWallet?.call(e.data),
        imageUrl: e.image,
        title: e.title,
        trailing:
            e.data.recent ? const WalletItemChip(value: ' RECENT ') : null,
      ),
    );
    final List<Widget> items = List<Widget>.from(walletsListItems);
    if (firstItem != null) {
      items.insert(0, firstItem!);
    }
    if (lastItem != null) {
      items.add(lastItem!);
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding16,
        vertical: kPadding16,
      ),
      itemBuilder: (context, index) => items[index],
      separatorBuilder: (_, __) => const SizedBox.square(
        dimension: kListViewSeparatorHeight,
      ),
      itemCount: items.length,
    );
  }
}
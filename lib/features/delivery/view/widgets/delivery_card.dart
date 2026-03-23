import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/features/delivery/data/models/delivery_model.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

class DeliveryCard extends StatelessWidget {
  final DeliveryModel delivery;

  const DeliveryCard({super.key, required this.delivery});

  String get _initials {
    final name = delivery.deliveryName ?? '';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    if (parts.isNotEmpty && parts[0].isNotEmpty)
      return parts[0][0].toUpperCase();
    return '?';
  }

  bool get _isActive => delivery.deliveryApprove == 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withOpacity(0.15), width: 0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // ── Avatar ──────────────────────────────────
            CircleAvatar(
              radius: 24,
              backgroundColor:
                  _isActive ? const Color(0xFFE6F1FB) : const Color(0xFFFAEEDA),
              child: Text(
                _initials,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _isActive
                      ? const Color(0xFF185FA5)
                      : const Color(0xFF854F0B),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ── Info ─────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    delivery.deliveryName ?? 'Unknown Driver',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  _MetaRow(
                    icon: Icons.phone_outlined,
                    value: delivery.deliveryPhone ?? 'N/A',
                  ),
                  const SizedBox(height: 2),
                  _MetaRow(
                    icon: Icons.email_outlined,
                    value: delivery.deliveryEmail ?? 'N/A',
                  ),
                  if (delivery.deliveryCreate != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Joined ${delivery.deliveryCreate}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // ── Divider ──────────────────────────────────
            Container(
              width: 0.5,
              height: 40,
              color: Colors.grey.withOpacity(0.2),
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),

            // ── Badge ────────────────────────────────────
            _StatusBadge(isActive: _isActive),
          ],
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  final IconData icon;
  final String value;

  const _MetaRow({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 12, color: Colors.grey.shade500),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isActive;

  const _StatusBadge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFEAF3DE) : const Color(0xFFFAEEDA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? const Color(0xFFC0DD97) : const Color(0xFFFAC775),
          width: 0.5,
        ),
      ),
      child: Text(
        isActive ? 'Active' : 'Pending',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: isActive ? const Color(0xFF3B6D11) : const Color(0xFF854F0B),
        ),
      ),
    );
  }
}

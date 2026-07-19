import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suitmedia_mobile_dev_intern/core/providers/app_providers.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Memicu API data loading pertama kali
    Future.delayed(Duration.zero, () {
      context.read<AppProvider>().fetchUsers(isRefresh: true);
    });

    // Mendaftarkan deteksi scroll untuk memicu pagination otomatis saat sampai dasar halaman
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<AppProvider>().fetchUsers();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF554AF0),
            size: 18,
          ),
        ),
        title: const Text(
          'Third Screen',
          style: TextStyle(
            color: Color(0xFF04021D),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        child: _buildBody(provider),
        onRefresh: () => provider.fetchUsers(isRefresh: true),
      ),
    );
  }

  Widget _buildBody(AppProvider provider) {
    // Tampilkan oading shimmer jika list kosong
    if (provider.isLoading && provider.users.isEmpty) {
      return _buildshimmerLoading();
    }

    // Tampilkan empty state jika data kosong
    if (provider.users.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          const Center(
            child: Text(
              'No users found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      itemCount: provider.users.length + (provider.isLoading ? 1 : 0),
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: Color(0xFFE2E8F0)),
      itemBuilder: (context, index) {
        // Shimmer loading mini di baris paling bawah saat loading page berikutnya
        if (index == provider.users.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              ),
            ),
          );
        }

        final user = provider.users[index];
        final String fullname = "${user.firstName} ${user.lastName}";

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 4,
          ),
          // Penggunaan CachedNetworkImage
          leading: CachedNetworkImage(
            imageUrl: user.avatar,
            imageBuilder: (context, imageProvider) =>
                CircleAvatar(radius: 25, backgroundImage: imageProvider),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
              ),
            ),
            errorWidget: (context, url, error) => CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
          ),
          title: Text(
            fullname,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF04021D),
            ),
          ),
          subtitle: Text(
            user.email.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF686777),
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            // Set data user diilih ke Provider
            provider.setSelectedUserName(fullname);
            // Back ke SecondScreen dan perbarui UI secara instant
            Navigator.pop(context);
          },
        );
      },
    );
  }

  // Animasi loading skeleton
  Widget _buildshimmerLoading() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      itemCount: 6,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: Color(0xFFE2E3E4)),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: [
                const CircleAvatar(radius: 25, backgroundColor: Colors.white),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Container(
                        width: 100,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

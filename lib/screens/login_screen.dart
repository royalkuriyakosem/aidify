import { Button } from "@/components/ui/button";
import { motion } from "framer-motion";

export default function AidifyOpening() {
  return (
      <div className="flex flex-col items-center justify-center min-h-screen bg-gradient-to-br from-blue-600 to-purple-700 text-white text-center p-6">
      <motion.h1
      className="text-5xl font-extrabold mb-4"
      initial={{ opacity: 0, y: -20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 1 }}
      >
      Empowering Every Ability with AI
      </motion.h1>
      <motion.p
      className="text-lg mb-8 max-w-2xl"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ delay: 0.5, duration: 1 }}
      >
      Aidify leverages AI to bridge communication gaps for the Deaf, Mute, and Blind—making the world more inclusive and accessible.
      </motion.p>
      <motion.div
      initial={{ opacity: 0, scale: 0.8 }}
      animate={{ opacity: 1, scale: 1 }}
      transition={{ delay: 1, duration: 0.5 }}
      >
      <Button className="bg-white text-blue-600 font-semibold px-6 py-3 text-lg rounded-2xl shadow-lg hover:bg-gray-100">
      Get Started
      </Button>
      </motion.div>
      </div>
  );
}


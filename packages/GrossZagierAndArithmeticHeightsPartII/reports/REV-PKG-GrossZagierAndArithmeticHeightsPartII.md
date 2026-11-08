<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2441#issuecomment-6672841930 -->
Review (claude) of 6a03183

Verdict: needs_changes

1. **F01** (P1) §6.7 asserts a > 3 in the two-overlattice case; a = 3 occurs

   **Location.** `packages/GrossZagierAndArithmeticHeightsPartII/README.md` line 819 (§6.7): "In the case of two, M± ∩ (L♭ ⊗ F) = L♭, a > 3"; line 826, Check 3: "An isolated top invariant 1 or 3 never produces the two-lattice case"; line 854 (Layer 6 Examples): "The special two-overlattice case requires a > 3"; line 1840 (Source corrections): "LL2 Lemma 2.57: in the two-lattice case the isolated top invariant satisfies a > 3".

   **Claim.** When exactly two integral lattices M± ⊃ L♭ have invariants (a₁, …, a_(n−2), a−1, a−1), the isolated top invariant satisfies a > 3, so a = 3 never gives the two-lattice case.

   **Witness (counterexample, n = 4, r = 2).** Ramified F/F₀, p odd, uniformizer u with ū = −u, trace dual as in Layer 5. Take V← = ⟨e₁⟩ ⊥ ⟨e₂⟩ with unit norms β₁, β₂ and −β₁β₂ a non-square unit (V← nonsplit), V→ = ⟨e⟩ ⊥ ⟨x₀⟩ with h(e,e) = βu², h(x₀,x₀) = β, β a unit (V→ split, since −det V→ = −β²u² = β²·N(u) is a norm), V = V← ⊥ V→ (nonsplit: det V = −β₁β₂·β²N(u) is not a norm). Let L♭ = ⟨e₁, e₂, e⟩, invariants (1, 1, 3), so a = a₃ = 3 > a₂ = 1. Put M± = L♭ + O_F·(u⁻¹e ± x₀). Computed values: h(e, u⁻¹e ± x₀) = −βu (valuation 1), h(u⁻¹e ± x₀, u⁻¹e ± x₀) = −u⁻²βu² + β = 0, det of the block ⟨e, u⁻¹e ± x₀⟩ = β²u²; so both M± are integral with invariants (1, 1, 2, 2), M± ∩ (L♭ ⊗ F) = L♭ (the x₀-coordinate forces the coefficient of u⁻¹e ± x₀ to vanish), and M₊ ≠ M₋ (x₀ ∈ M₊ would need the coefficient −u⁻¹ ∉ O_F on e). Two lattices, a = 3. The source agrees once read correctly: the extracted text of LL2 renders ⩾ as ">" (at LL2 line 1791 the printed "> a_{n−1} − 2" must be "⩾ a_{n−1} − 2", since Lemma 2.23(1) gives a lower bound and the strict reading would force λ_{n−1} ∈ O_E, contradicting the next sentence); hence LL2 line 1806 states a_{n−1} ⩾ 3, as the design had it, and likewise "r > 2" at LL2 line 1753 is r ⩾ 2, which is what §6.7 states and what the induction of §6.8 needs at n = 4.

   **Repair (tested on the instance above).** In §6.7 replace "a > 3" by "a ≥ 3" and replace the route clause "the bound a > 3 gives strict positivity on the residual line used in §6.8" by "since a ≥ 3 every norm of L♭±→ has valuation at least two, so M₊ ∪ M₋ ⊂ u·V_int, the strict support used in §6.8" (for a = 3 the invariants (2,2) give norms in π₀O_F₀, so the uncertainty-principle step of §6.8 still applies: support in u·V_int against Fourier support in V_int). Replace Check 3 by: "An isolated top invariant a = 1 never produces the two-lattice case: the complement of V→ would then carry a trace-self-dual lattice, which the nonsplit space excludes. a = 3 does: with L♭ = ⟨e₁, e₂, e⟩ of unit norms β₁, β₂ (−β₁β₂ a non-square unit) and h(e,e) = βu², and x₀ ⊥ L♭ of norm β, the lattices L♭ + O_F(u⁻¹e ± x₀) both have invariants (1,1,2,2)." In the Layer 6 Examples replace "requires a > 3, so an isolated top invariant 1 or 3 is always ordinary" by "requires a ≥ 3; an isolated top invariant 1 is always ordinary". In Source corrections replace the LL2 Lemma 2.57 bullet by: "LL2 Lemma 2.57: the author copy's extracted text renders ⩾ as >; the lemma holds for r ≥ 2 (used at n = 4 in §2.7) and the two-lattice case has a_{n−1} ≥ 3, with a = 3 occurring (§6.7)." §6.8 needs no change.

2. **F02** (P2) gap:jr-afl-local-inputs asks for what an earlier roadmap states and already requests

   **Location.** README line 118 (`## Exact supplier contracts`, EndoscopicTransferAndUnitaryTraceComparison): "What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-afl-local-inputs): … Jacquet–Rallis matching …, the η-twisted orbital integrals with the variable s, smooth transfer compatible with the partial Fourier transform, and the Jacquet–Rallis fundamental lemma for the unit test functions in both versions for every residue cardinality q"; `design/plan.json` gap `jr-afl-local-inputs`; `*Needs:*` lines of §§9.3, 9.5, 9.7, 14.1.

   **Claim.** The gap is minimal: nothing earlier in the merge order provides any of it.

   **Witness.** EndoscopicTransferAndUnitaryTraceComparisonPartII is earlier in the merge order (position 166 against this roadmap's 234, moved to 246) and is a board package with an accepted design. Its `design/README.md` states, for every residue cardinality including q ≤ n, §4.4 "Spherical rank-shifted Jacquet–Rallis comparison" (line 784: ω(X)·Orb_{GL_(n−1),η}(BC_n(φ), X) = Orb_{U(V_(n−1))}(φ∗e₀, Y) for matching X, Y; Leslie25 Theorem 5.3) and §4.5 "Augmented spherical Jacquet–Rallis transfer" (line 802: the augmented comparison of gl_n(F) × F^n × (F^n)^* with Herm(V) × V); for the unit of the Hecke algebra these are the Jacquet–Rallis fundamental lemmas in the Lie-algebra and augmented forms. Its own contract on EndoscopicTransferAndUnitaryTraceComparison, gap:jr-local-comparison (line 43), already requests "regular matching across all pure forms, η(det)-twisted orbital distributions, … local smooth transfer with partial Fourier compatibility". So the present gap asks a second time for matching, twisted orbital integrals and smooth transfer with partial Fourier compatibility (two requests to one supplier for one object), and asks for fundamental lemmas that §§4.4–4.5 of the earlier roadmap state.

   **Repair.** In the EndoscopicTransferAndUnitaryTraceComparison contract, add the subsection "From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII: consume §4.4 (spherical rank-shifted Jacquet–Rallis comparison for every q, Leslie25 Theorem 5.3) and §4.5 (augmented spherical Jacquet–Rallis transfer), and, as its declared contract gap:jr-local-comparison on EndoscopicTransferAndUnitaryTraceComparison, the regular matching, η-twisted orbital distributions and smooth transfer with partial Fourier compatibility". Narrow gap:jr-afl-local-inputs (in the README sentence and in `plan.json` `gaps[].needs`, same slug) to what neither provides: "the passage from the Lie-algebra and augmented formulations of EndoscopicTransferAndUnitaryTraceComparisonPartII §§4.4–4.5 to Zhang's S_n and S_(n−1) × (F₀^(n−1) ⊕ (F₀^(n−1))^*) formulations with the transfer factors ω(γ) = η̃(det(γ)^(−⌊n/2⌋)·det(γ^i e)) and ω(γ,u′) of Z (2.16)–(2.17), and the orbital integrals with the variable s whose derivative at s = 0 the AFL compares". Cite §§4.4–4.5 of the Part II roadmap in the `*Needs:*` lines of §§9.3, 9.5, 9.7 and 14.1 next to the narrowed gap. The dependency check must be rerun after the edit (the Part II roadmap is earlier, so no UPWARD line is expected).

3. **F03** (P3) stale pin hashes in the README

   **Location.** README line 42: "The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`."

   **Claim.** These are the pins of the content repository.

   **Witness.** `lake-manifest.json` of the content checkout pins mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and TauCeti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Only one roadmap on main writes hashes into its README; hashes go stale and are process residue.

   **Repair.** Replace the sentence by "The pinned Mathlib and Tau Ceti are those of the content repository's `lake-manifest.json`." The four Mathlib declarations named there exist at the pin: `Polynomial` (Mathlib/Algebra/Polynomial/Basic.lean:69), `Polynomial.eval` (Mathlib/Algebra/Polynomial/Eval/Defs.lean:249), `Polynomial.derivative` (Mathlib/Algebra/Polynomial/Derivative.lean:46), `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean:45, a `Prop`-class on a valued topological field, as the README says).

4. **F04** (P3) locator slips

   **Location and witness, each with the repair.**

   - README line 955 (§7.6): "Definitions 4.5, 4.7 and Lemmas 4.6, 4.9, p. 29". K has Remark 4.6 and Lemmas 4.8–4.9 (K lines 1173, 1184, 1195, all on p. 29). Repair: "Definitions 4.5 and 4.7, Remark 4.6 and Lemmas 4.8–4.9, p. 29".
   - README line 886 (§7.2): "K §3.1, Propositions 3.1–3.3, pp. 16–17". K has Lemma 3.1, Proposition 3.2 and Remark 3.3 (K lines 671, 679, 697). Repair: "K §3.1, Lemma 3.1, Proposition 3.2 and Remark 3.3, pp. 16–17".
   - README line 1287 (§10.4): "LZ §13.5, p. 83; §14.4, p. 86". §14.4 begins at LZ line 3718 on p. 85 (page marker at line 3682) and continues on p. 86. Repair: "§14.4, pp. 85–86".
   - README line 831 (§6.8): "proof in §2.7, pp. 37–38". LL2 §2.7 occupies pp. 34–37 and the proof of Theorem 2.7 is on p. 37 (LL2 lines 1861–1895). Repair: "§2.7, pp. 34–37, proof of the theorem p. 37".
   - README line 618 (§4.6): "for Li–Liu's sections φ₀, φ₁". LL1 writes the sections as the indicators 1_{(Λ_{R_u})^{2r}} and 1_{(Λ⋆_u)^{2r}} (LL1 lines 1845, 2066); φ₀, φ₁ are LZ's names (LZ Remark 10.5.4). Repair: "for the lattice-indicator sections of LL1 (LZ's ϕ₀, ϕ₁)".

5. **F05** (P3) a proof input named in a route is not in the manifest

   **Location.** README line 200 (§0.5): "regularity of D(x) by Terstiege's local computation" and the induction whose base case n ≤ 3 is Terstiege's.

   **Claim.** The route's inputs are targets, supplier sections or recorded sources.

   **Witness.** LZ states both facts by citation only (LZ lines 509, 522: "[Ter13a, Lemma 3.1]", "regular by [Ter13b]"); neither Terstiege paper is in `sources.toml` or `## References`, and no section of this roadmap or of a supplier proves them.

   **Repair.** Either add the two Terstiege works to `sources.toml` (`uncertified` if only the paywalled versions are reachable) with locators (Ter13a: Intersections of special cycles on the Shimura variety for GU(1,2), Lemma 3.1 and Proposition 3.2; Ter13b: On the regularity of special difference divisors, main theorem), and cite them in §0.5 and `## References`; or reword §0.5's route to state the regularity of D(x) and the n ≤ 3 base case as parts of the target proved here, naming the method without attributing it to an unrecorded source.

6. **F06** (P3) "balloon locus" used without definition

   **Location.** README line 563 (§4.2): "étale away from the balloon locus and totally ramified along it", "the reduced inverse image of a balloon stratum"; line 576: "a balloon line"; line 1838.

   **Witness.** The term is LRZ's (closed balloon locus, LRZ Definition 14.2.2, line 2482; LRZ line 117) and appears in neither LZ nor K nor elsewhere in this README; a reader cannot tell which locus is meant.

   **Repair.** At the first use in §4.2 add: "the closed balloon locus of LRZ Definition 14.2.2, the union of the type-zero strata V(Λ) ≅ ℙ^(n−1) of the reduced locus of N_n¹".

Independent review of `packages/GrossZagierAndArithmeticHeightsPartII/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml` (round 1, no previous review). Every locator was checked against the cached line-numbered texts; every supplier citation was resolved at the supplier's current head (the open pull requests) or on main; every computed value below is my own.

## Verified sound

**Principles.** No route-specific shortcut: the two places where the published proofs fail (§8.6 hyperbolic step, §9.5(b) q = n step) are stated as targets rather than excluded. No re-planned roadmap: the RZ spaces, integral models and uniformizations are imported from PELModuliPartII by node; densities, K-theory, Weil representations, Green functions, Grothendieck–Messing, Tate modules and quasi-canonical lifts are imported by section. Supply is one-directional (dependency check below). No copied passage was found in the sampled sections (statements are restated). No algorithm. `Suggested.lean` has a single `import Mathlib`, no declaration, no `set_option`, no sorry'd data.

**Elaboration.** `lake env lean <Suggested.lean>` from the content checkout: exit 0, no output (no declaration, so no `sorry` warning). The `#check` comparison is void: there is nothing to check. The one-tactic probe is void for the same reason: no padding is possible.

**Headline theorems.** From the README summary and `## Acceptance file`: the unramified, almost self-dual, exotic smooth and Krämer Kudla–Rapoport identities (§§3.5, 4.5, 6.8, 8.7), the unramified and modified arithmetic Siegel–Weil formulas (§§13.8, 13.10), modularity of the CM intersection series over ℚ (§12.7), the strongly regular AFL over ℚ_p with p ≥ n (§14.6). Each is named in the module docstring with what it lacks. I confirmed at the pins: no formal schemes or Rapoport–Zink spaces in Mathlib (`Mathlib/AlgebraicGeometry` has no `FormalScheme`/`Spf`) or Tau Ceti (the only hit for "Rapoport" is a citation in `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Smooth.lean`), no hermitian local densities, no unitary Shimura varieties, Siegel Eisenstein series, arithmetic Chow groups or orbital integrals. The headlines are correctly declared not statable; stating nothing is right.

**Sampled locators (all read at the cited place).** 0.4: LZ §§2.5–2.7, lines 451–490, pp. 12–13 (V(Λ) ≅ Y_{Λ^∨/Λ}, dimension (t−1)/2, containment reversed, intersections by sums, Z(L)_red = ∪ V(Λ)). 0.5: LZ line 435 (Cartier, no flatness claim), Lemma 2.8.1 lines 501–536 (linear independence, induction through Z(u) and difference divisors). 1.4: LZ Theorem 5.4.1 lines 1078–1089 (mult_{L♭}(Λ) = #{L′♭ : L♭ ⊂ L′♭ ⊂ L♭_Λ}, both the cycle and the derived identity in Gr²), Corollary 5.4.6 line 1338, p. 33. 2.5: LZ Corollary 6.3.3 line 1519, p. 37, nondegenerate L♭ assumed at line 1361. 2.6: LZ Definitions 6.4.1/6.4.3 lines 1597, 1619, Lemmas 6.4.4–6.4.6 lines 1625–1699, pp. 38–40; LZ's own Chern-character line 1612 carries the sign the README corrects. 4.2: LRZ Theorem 14.6.2 lines 2622–2643 (printed pp. 60–61), Example 14.6.3 line 2644 (fat ℙ¹ of multiplicity q+1), Corollary 16.1.5 line 2938 (p. 69), Proposition 16.4.1 line 3004 (p. 70, normal bundle O(−1), self-intersection (−1)^(n−1)). 4.4: LZ Lemma 10.4.2 line 2942, Theorem 10.4.3 lines 2952–2961 (Exp(x) summed over self-dual Λ ∋ x), pp. 67–68. 4.6: LL1 Notation 2.1 (F1), (F4) lines 429–456 (p. 10), §8 line 1845 (p. 39), §9 lines 2051–2069 (pp. 44–45): b_{2r,u}(0)/log q_u · W′ in the self-dual case, (q_u^{2r}−1)/(q_u+1)·W′ − log q_u/(q_u+1)·W in the almost self-dual case. 5.5: LL2 Proposition 2.44 lines 1419–1427 (p. 28), statement with inner bound j; proof's (2.17) has the misprint l. 6.6: LL2 Corollary 2.46 line 1464 (p. 29), Lemmas 2.53–2.54 lines 1569–1618 (pp. 31–32), colength q predecessor at line 1577. 6.8: LL2 Theorem 2.7 line 484 (p. 11), proof lines 1861–1895 (p. 37). 10.2: LL1 §8 lines 1733–1746 and footnote 17 line 1766 (pp. 37–38): T-supported component of the r-fold derived tensor product, in F^r by GS87 Prop. 5.5, extended by linearity after shrinking level. 11.4: Z §7.6 lines 2047–2062 ((7.15): ᴸCM ∈ F₁K′₀), §9.1 lines 2385–2419 (pairing valued in ℝ_S, F₁K′₀ → Gr₁ ≅ Ch₁ → Z_{1,c}). 12.1: Z §8.1 Theorem 8.1 line 2196 (Chow-valued modularity for totally real F₀), constant term −φ(0)·ĉ₁(ω) at (9.9) line 2439. 14.6: Z Theorem 15.1 line 4079 ("Conjecture 3.8 holds when F₀ = ℚ_p and p ≥ n"), Conjecture 3.8 lines 812–824, Definitions 3.5–3.6 lines 798–809.

**Other locators read.** LZ: Example 2.4.3 (line 448), Corollary 2.8.2, Lemma 2.9.2, Lemma 2.10.1, Lemma 2.11.1 (lines 537–595), §3.2–3.3 (lines 614–668, interpolation and (3.3.0.2) with log q²), Theorem 3.4.1 (673), Theorem 4.2.1 (812), Corollary 4.6.1 (934), Lemma 5.3.1 (1002–1015), Theorem 6.1.3 (1385), Lemma 6.2.1/6.3.1 (1407–1515), Proposition 7.3.4 (1910), Theorem 7.4.1 (2154), Theorem 8.2.1 and proof (2531–2576), Theorem 10.3.1 (2902), Conjecture 10.4.1 (2932), Theorem 10.5.1/Example 10.5.3/Remark 10.5.4 (3086–3172), (12.3.0.2), (12.4.0.2–3) (3476–3508, pp. 79–80), §13.3 (3544, p. 81), §13.5 and Theorem 13.6.1 (3615–3633, p. 83), Theorem 14.5.1/Corollary 14.5.2 (3735–3742, p. 86), §§15.2–15.4 and Theorems 15.3.1, 15.5.1 (3762–3857, pp. 87–89). K: Definitions 1.1–1.2 and (1.1)–(1.12) (92–260, pp. 3–7), Theorem 1.3 (160), Definitions 2.3–2.4, Lemma 2.5 (497–521, p. 12), Proposition 2.12 (609, p. 15), §3.1 (655–697), Theorem 3.16, Proposition 3.17, Theorem 3.19, Proposition 3.20 (1011–1080), Definition 4.1, Lemma 4.2, Theorem 4.3, (4.4)–(4.6), Definitions 4.5, 4.7, Lemmas 4.8–4.9 (1091–1198), Definition 4.12, Lemma 4.13, Theorems 4.14–4.16 (1250–1304, pp. 31–32), Corollary 5.8 (1422), Theorem 7.1, Corollaries 7.2–7.3 (1999–2029, p. 46), Definition 8.1, Theorem 8.2 (3438–3451, p. 64), (8.6) (3599), Lemmas 9.1–9.4, Definition 9.2, Theorem 9.5 (3876–3932, pp. 73–74), Lemma 9.6 and proof (3934–3975), Theorem 9.7 and proof (3979–4000), Theorems 10.1–10.2 (4161–4185, pp. 79–80). LL2: Definitions 2.1–2.3, Lemma 2.4 (409–443), Definition 2.16, Remarks 2.17–2.18, Lemma 2.19, Definition 2.20 (640–689), Proposition 2.22, Lemma 2.23, Lemma 2.24 (711–782), Lemma 2.32 (1168), Proposition 2.33, Corollaries 2.34–2.35 (1210–1230), Lemmas 2.36–2.42, Definition 2.38 (1255–1340), Proposition 2.51, Remark 2.52 (1527–1539), Lemma 2.55 (1619–1712), Lemma 2.56 (1713), Lemmas 2.57–2.58 (1753–1858), Corollaries 2.65–2.66 (2176–2202, p. 43). Z: §2.3 (2.12)–(2.17) (546–581), Remark 3.1, Conjecture 3.2 (766–790), Proposition 3.9 (826), Cayley map (835–842), Lemma 4.4 (1017), Proposition 4.12 and proof, Remark 4.13 (1301–1329), Proposition 5.2, Theorem 5.5 (1363–1468), Definitions 7.6, 7.8, Proposition 7.9 (1874–1934), Proposition 8.2 (2255), Theorem 9.4 (2496–2505, factor 2 log q), Theorem 10.1 (2579–2588), Corollary 10.4 (2644), Lemma 13.6 (3649), Proposition 14.5 (3902), Theorem 14.6 (3988–3994). MZ: §3.6 (3.15)–(3.17) and footnote 3 (706–726, p. 13), §3.8 Theorem 3.13 (934, p. 17), §6.3 (1566, p. 29), §7.2 (7.7) and footnote 5 (1936, 1973, p. 35), footnote 4 (1507). Howard19 Corollary D (107–115).

**Adversarial table.** Values computed by hand; q = #k_{F₀}; "val" is the F₀-valuation of a norm unless stated.

| § | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| Conv. | Interpolation variables | k = 1, q = 3 | unramified X = (−q)^{−1} = −1/3; Krämer X = q^{−2} = 1/9; exotic X = q^{−s} | distinct, as stated |
| 0.1 | H(x,y) = h(y,x) | a ∈ O_F, rank one Gram ϖ^a | H(ax,y) = āH, h(ax,y) = aH; both duals ϖ^{−a}O_F x | holds |
| 0.2 | Z(L) depends on span | x vs ax; x = 0; val < 0; h(u,u) = 1 | equal; N_n; ∅; δ(N_{n−1}) | holds |
| 0.3 | Y_Ω, d = 1 | q = 3 | Fermat curve of degree 4: q³+1 = 28 points, genus q(q−1)/2 = 3 | holds |
| 0.4 | strata, incidence | t = 1, 3; Λ′ ⊂ Λ | point; curve; V(Λ) ⊂ V(Λ′) | holds (LZ line 473) |
| 0.5 | Tor independence | y = x | Tor₁(O_Z,O_Z) = O_Z(−Z) ≠ 0 | hypothesis needed, as stated |
| 0.6 | self-product of a Cartier D | — | [O_D]−[O_D(−D)] | holds |
| 0.8 | cancellation | n = 2, ⟨u⟩⊥⟨x⟩, a odd | Int₂ = Int₁ = (a+1)/2 | holds |
| 0.9 | D(X) = Σ_{i≤a}(−X)^i | a = 1, 3; overlattice sum | −D′(1) = 1, 2; (1−X)(1+X²+…+X^{a−1}) = Σ(−X)^i; types of ϖ^{−j}x are all one (one nonzero invariant) | holds |
| 1.2 | W ∩ L type ≤ 1 | I₂, W = F(1,ϖ^k) | norm 1+ϖ^{2k}, unit, type 0 | holds |
| 1.3 | horizontal degrees | n = 2, val 2 | q²(1+q⁻¹)+1 = q²+q+1; D(X) = (1−X)+X², D(−q) = 1+q+q²; vol⁻¹D((−q)⁻¹) = q²(1+q⁻¹+q⁻²) | holds |
| 1.4 | mult = interval count | length-one quotient | 2 | holds |
| 2.1 | Coxeter eigenvalues | d = 1; dual degrees | H¹_c: 1 (mult q³), −q (mult q²−q); H²_c: q²; #Y₁ = 1+q²+q(q²−q) = q³+1; H^{2j}(Y°_d)(j) carries q^{2j}, −q^{2j−1} | holds (LZ lines 1008–1013 agree) |
| 2.4 | f_Λ and f̂_Λ | on Λ; isotropic shell; anisotropic shell | −q²(1+q)+(q³+1) = 1−q²; f̂: −(1+q)/q+(q³+1)/q = q²−1, −(1+q)/q+1/q = −1, −(1+q)/q+(q+1)/q = 0 | f̂ = −f on all four regions |
| 2.5 | vertical Fourier identity | n = 2 unit L♭ | 0 = −0 | holds |
| 2.6 | ch(O_D) | degrees 1, 2 | 1−e^{−c} = c − c²/2 + … | holds; LZ line 1612 has the opposite overall sign |
| 2.7 | point stratum | P ∈ Z(x) | Tor₀ = Tor₁ = k, χ = 0 | holds |
| 3.1 | Whittaker derivative | n = 1, a = 1 | (1+q⁻¹)·log q²; D(1) = 0 from D(X) = (−X)^{val}D(1/X) at odd val | holds (LZ (3.3.0.2)) |
| 3.2 | weights m(a) | a = 0..3 | 0, 1, 1+q, (1+q)(1−q²) | holds |
| 3.5 | unramified KR identity | n = 1, a = 3 | Int = 2 = −D′(1) | holds |
| 4.1 | Int_Y rank one | a = 0, 2 | 0, 1 | holds (LZ Example 10.5.3) |
| 4.2 | exceptional self-intersection | E ≅ ℙ^{n−1}, N = O(−1) | χ((1−[O(1)])^{n−1} on ℙ^{n−1}) = (−1)^{n−1}; n = 2: −1 | holds |
| 4.3 | ∂Den_Λ rank one | a = 2: overlattices L⊥⟨ϖ⟩ (type 2), ⟨ϖ⁻¹x⟩⊥⟨ϖ⟩ (type 1) | D_Λ = (1−X)(1+qX)+X²(1−X), D′(1) = −(q+1)−1, ∂Den_Λ = q+2; a = 0: 1−X, 1 | holds; a third overlattice would need a non-integral norm |
| 4.5 | (q+1)Int_Y = ∂Den_Λ − Den | a = 0, 2; general even a | 0 = 1−1; q+1 = q+2−1; ∂Den_Λ = 1+(q+1)a/2, Den = 1 | holds |
| 4.6 | b_{n,v}(0) | n = 2r | Π L(i, η^{n−i}) = Π(1−(−1)^{n−i}q^{−i})⁻¹ = Π(1−(−q)^{−i})⁻¹ for even n; r = 1: (q²−1)/(q+1) = q−1 | holds |
| 5.2 | χ([O]−[ω]) on ℙ¹ | deg ω = q−1 | 1−(q−1+1) = 1−q | holds |
| 5.5 | rank-two formula | (0,0),(0,1),(1,1),(1,2) | 2, 4, 2(q+3), 2(2q+4); wrong inner bound at (1,1): 2(2q+3) | holds |
| 5.6 | reflection | det | −1 vs (−1)^n = 1 for full negation | holds |
| 6.1 | ∂Den terms | t = 2, 4 | 2; 2(1−q²) | holds |
| 6.3 | signs in the δ = 0 sum | t(A) ≥ 3 | sign μ(t) = (−1)^{t/2−1}: μ(t(A)±1) opposite | holds |
| 6.5 | type-four curve function | on Λ; shells | −q(1+q)+(q²+1) = 1−q; f̂ on Λ: q−1; isotropic: −1; anisotropic: 0 (q+1 isotropic lines in a 3-dim quadratic space) | holds |
| 6.7 | a in the two-lattice case | a = 3 example above | two lattices exist; "a > 3" false; a = 1 excluded (type-zero complement) | **R01** |
| 6.8 | exotic KR, n = 2 | (1,1); (1,3) | 2 = 2; Int = 4 = 2·#{(1,3),(1,1)}; a third overlattice would make the plane split | holds |
| 7.5 | primitive degrees | s = 0, 1 nonsplit | 1; 2q (two components, q each; parent §7.2 gives q^s per component) | holds |
| 7.6 | α | n = 2, 3 unimodular | 1, 0 | holds (K Def. 4.5) |
| 7.7 | cancellation | n = 3, ℓ = 1, r = 2, n(I₂,L₂) = 1 | 1·(1−0) = 1; Int(I₂) = 0, Int(I₃) = 1 | holds (K Prop. 2.12) |
| 7.8 | Fourier support | x ∈ π⁻¹Λ^♯ | N(π⁻¹) = −π₀⁻¹, norm valuation ≥ −1 | holds (K Lemma 4.13) |
| 8.1 | t_max | n even, χ = −1; n = 2 | n−2; no correction | holds (K (1.5)) |
| 8.2 | primitive density | unimodular odd/even; t = 2, 3 | 1/0; 1−χq; 1−q² | holds (K Thm 7.1) |
| 8.4 | counterexample to negative-cone vanishing | n = 3, χ(V) = χ(−det V) = χ(1) = 1, L♭ = ⟨1⟩⊥⟨π₀⟩, h(x,x) = −π₀⁻¹ | Gram of ⟨ℓ, x+αℓ⟩: (π₀, β̄; β, (N(β)−1)/π₀), det = −1; integrality ⇔ N(β) ≡ 1 mod π₀ ⇔ β ≡ ±1 mod π: 2q classes mod π₀; complement ⟨π₀⟩⊥⟨−π₀⁻¹⟩ split (ℓ+π₀x isotropic) so L♭ not horizontal; integral overlattices of L♭: L♭ and ⟨e⟩⊥⟨π⁻¹ℓ⟩ only (index q); k ≥ 1 projections need v_π(α) = −3 < −2; partial integral 2q·vol(L♭)·δ_odd(3) ≠ 0 | README's correction of K Thm 8.2 confirmed |
| 8.6 | hyperbolic step | H₁, L♭ = ⟨l₁+πl₂⟩, x = l₂ | h(l₁+πl₂) = −2π², coefficient −π/(−2π²) = 1/(2π) ∉ O_F; L♭+⟨l₂⟩ = H₁ with invariants (1,1); any line ⟨al₁+bl₂⟩ has norm π(ab̄−āb) ∈ π²O_F since ab̄−āb ∈ πO_{F₀} | K Lemma 9.6 fails here; target justified |
| 8.7 | Krämer identity | I_n; nonintegral | δ_odd(n) = δ_odd(n); 0 = 0 | holds |
| 9.3 | transfer factor | (2.16) | ω(γ) = η̃(det γ^{−⌊n/2⌋} det(γ^i e)) | matches Z line 579 |
| 9.4 | Cayley map | x = 0; g = −1 | c(0) = −1; c⁻¹(−1) = 0 | holds (Z line 836–842) |
| 9.5 | residue counts | q ≥ n+1; q = n | q+1 ≥ n+2 > n+1 excluded residues; n+1 vs n+1 | elementary count fails at q = n; target (b) justified |
| 10.2 | r factors | r = 1 | Cartier class; LL1 line 1736 has r factors | holds |
| 10.4 | residue logarithm | degree f | f log q | holds |
| 11.4 | virtual one-cycle | — | ᴸCM ∈ F₁K′₀ → Gr₁ ≅ Ch₁ → Z_{1,c} | holds (Z (7.15), §9.1) |
| 12.1 | constant term | φ(0) = 0 | 0; Z (9.9) carries −φ(0) | holds |
| 12.3 | Green at u = 0 | a = e | −log e = −1; MZ (3.17) | holds |
| 12.6 | normalization | [E:F] vs [E:F₀] | factor 2 | holds (Z (9.5)) |
| 12.8 | inert factor | residue field of F at v | q_v², log(q_v²) = 2 log q_v | holds (Z (9.18)) |
| 13.4 | c_K | n = 1, 2 | −vol K, +vol K | holds (K Thm 10.1) |
| 13.8 | Diff parity | — | #Diff odd by incoherence; F₀ = ℚ excluded by Minkowski | holds |
| 13.10 | self-dual inert v | — | correction 0, reduces to §13.5 | holds |
| 14.2 | E♭ | expansion | (2∂J + Int_{K−B}) + Int_B = 2∂J + Int_K | holds (Z Prop. 14.5, Thm 14.6) |
| 14.3 | B = ∅ | — | only the constant Fourier term; N(𝔸)- and SL₂(F₀)-invariance plus strong approximation give a constant | holds (Z Lemma 13.6) |
| 14.4 | separating logs | Σ c_p log p = 0 | each c_p = 0 (unique factorization) | holds |
| 14.6 | p = n | — | n prime; uses §9.5(b) | consistent with Z Thm 15.1 |

**Context and generality.** No Lean statements, so no `variable` block to audit. The README's standing hypotheses match the sources where I checked them: odd p throughout; F₀/ℚ_p unramified for §6.9 (LL2 §2.8, line 1898); F₀ = ℚ for §§12.7, 14.2, 14.4 (Z Theorems 8.4, 8.6, Prop. 14.5, Thm 14.6); F₀ = ℚ_p, p ≥ n for §14.6 (Z Thm 15.1); p > n for §9.7 (Z Prop. 3.9); L♭ nondegenerate for the vertical functions (LZ line 1361, K Thm 8.2); n = 2r even for the exotic layers (LL2 Notation 2.2).

**Duplication, by object.** Unitary RZ spaces, special Hom spaces, the auxiliary isogeny space, exotic strata, integral models and uniformizations: PELModuliPartII U0–U9 (board package at merge-order position 247), cited by node, not restated. Supported K-theory of formal schemes: SchemeKTheoryOperationsPartII FK.0–FK.4; schemes: SchemeKTheoryOperations §§6.12, 7.7 (headings at its head lines 2744, 2980). Hermitian lattices and unramified densities: GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9, 3.2 (head lines 707, 773, 884; §3.2 is unramified only, line 886, so the ramified gap is real). Weil representation, uncertainty principle, Siegel–Weil: MetaplecticAutomorphicForms §§2.1, 2.5, 2.7, 3.3, 3.3a, 3.3b, 4.5, 5.1, 5.8, 6.2, 6.4, 6.7 (head lines 403–1624; all seven backticked names present). Green functions and the ℝ_S-valued pairing: ArakelovGeometryAndAbelianHeights §§1.8–1.10 (head lines 378, 415, 442; no higher-codimension arithmetic Chow, so the gap is real). Grothendieck–Messing: AbelianSchemesAndArithmeticModuli §A4.CR.7.2, §A4.7 (head lines 2127, 2109). Tate modules and Dieudonné theory: FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.22, R07.2.10, R07.2.20 (head lines 989, 1859, 3390, 3699). Quasi-canonical lifting lengths: GrossZagierAndArithmeticHeights §7.2 (head line 2945; both unramified and ramified cases, with q^{s−1}(q+1) and q^s orbits). PELModuli §§M0.22, M1.3, M1.13, M3.4, M3.8, M6.1 (head lines 1310–3767). EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.13 (head lines 689, 765, 999) in Layers 2 and 4 (lines 685, 1692); it has no Jacquet–Rallis content (its only "Jacquet" hits are Jacquet functors and Jacquet–Langlands), so the gap is real. AdelicAlgebraicGroups §4.2 (head line 4283). MotivesAndAlgebraicCycles §§2.4, 2.7, 7.19 (head lines 386, 434, 1648; §7.19 states Li–Liu's theorems with the almost-principally-polarized RZ intersection as a premise, line 1658). ClassicalAdicEtaleCohomology Layer 8 (line 3903). SchemeAndStackFoundations §§5.1, 5.3, 5.4, 5.7 (lines 6568–6988). AutomorphicSpectralTheory §§1.1, 1.2, 2.4 (lines 891, 914, 1594). AutomorphicLFunctionsAndLocalFactors Layer AL.0 (line 294). Across the open pull-request heads, `roadmaps grep` finds no other roadmap mentioning Kudla–Rapoport cycles or stating the arithmetic fundamental lemma as a target (the hits are consumers: SchemeKTheoryOperationsPartII, MetaplecticAutomorphicForms, ArakelovGeometryAndAbelianHeights, AutomorphicLFunctionsAndLocalFactors, AutomorphicFormsOnReductiveGroups, SchemeKTheoryOperations). The two leads of `roadmaps resolve` (`IntegralHermitianLattice.ofCarrier`, `HermitianLatticeInvariants.ofDualQuotient`) are GeometryOfNumbersAndQuadraticArithmetic's own names, present at its head (lines 709, 731); they are not this roadmap's.

**Supplier order.** Dependency check output, verbatim:

```text
moved: GrossZagierAndArithmeticHeightsPartII moved in the merge order from #233 to #246, right after its last supplier PELModuliPartII; checked as moved (the worker moves it there when it submits)
depcheck: 241 roadmaps, 2438 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line names sections of this roadmap, suppliers listed in the contracts, or one of the four declared gaps; no later roadmap is cited.

**Declared gaps.** All four are in `design/plan.json` `gaps` with the same slugs and `needs` sentences as the README's contract paragraphs. ramified-hermitian-densities: precise (density, vanishing, two interpolation variables, overlattice expansions), minimal (GN §3.2 is unramified only). nonaffine-formal-filtration-product: precise, minimal (SchemeKTheoryOperationsPartII's product theorem is stated for affine formal schemes, as the README records). arithmetic-chow-star-products: precise, minimal (Arakelov §§1.8–1.10 stop at ĈH¹). jr-afl-local-inputs: precise and owned (EndoscopicTransferAndUnitaryTraceComparison has no Jacquet–Rallis theory, confirmed at its head), but not minimal: see R02. None of the four is unowned.

**Shape.** 103 targets in 15 layers; every target has a `*Needs:*` line and a source locator; every definition has its API bullets; every `**Checks.**` list has at least three bullets (counted mechanically: 0 targets flagged); every layer ends with `### Examples` and `### Dependencies`. No LaTeX delimiters, no process words, no paths, no pull-request numbers, no `lemma`. `metadata.toml` has `topic = "math.NT"`. `sources.toml` records the nine cited works with the service's fields; the uncertified Lusztig76 entry is cited by locator only, as allowed.

## Not verifiable

- Lusztig76 (paywalled, `uncertified`): §§2.1 and 5.4 cite 1.18, 6.1, 7.3; LZ Lemma 5.3.1 (lines 1007–1015) restates the eigenvalue, degree and semisimplicity claims used, and the README's computations agree with that restatement.
- K (8.6), p. 67: the README replaces the sign (−1)^{n₁} by χ(−1)^{n₁}; the derivation in K §§8.5–8.9 was not re-derived here.
- Z Proposition 4.12(i) at q = n: the README's Source correction says Zhang's elementary count also needs 1 − ξd to be a unit; Zhang (lines 1312–1313) derives it from the third equality of (4.5) and the integrality of det(1 − g), which I did not re-derive. The README's extra target §9.5(b) is harmless either way.
- The archimedean identity behind §13.7 (Liu; Garcia–Sankaran) and Mihatsch's maximal-order theorem behind §9.7 are cited through LZ Theorem 15.3.1 and Z Proposition 3.9; the primary texts were not fetched.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`/`show` at the heads the tool indexes.

## Source issues

- **Misprint** in LZ at §2.9, Definition 2.9.1, p. 14: the source says the horizontal part cut out by the torsion ideal is the maximal vertical closed formal subscheme; it should be the maximal horizontal (flat) one; affects nothing.
- **Error** in LZ at §6.4, after Definition 6.4.1, p. 38: the source writes the Chern character of the Cartier class as exp(c₁(O(−Z))) − 1, the class of [O(−Z)] − [O]; it should be 1 − exp(c₁(O(−Z))), the class of O_Z; affects the proof (signs in Lemmas 6.4.5–6.4.6), not the eigenvalue statement.
- **Gap** in LZ at §8.2, proof of Theorem 8.2.1, p. 59: the source transports the horizontal and vertical functions separately under L♭ + ⟨x⟩ = L′♭ + ⟨x′⟩; only the totals transport, and the difference of the vertical functions transports after Theorem 6.1.3; affects the proof.
- **Error** in K at Theorem 8.2, p. 64: the source says the vertical analytic partial integral vanishes on W_{<0}; it should assert only constancy on W_{≥0} ∖ {0} (the rank-three example above gives 2q·vol(L♭) at a vector of norm −π₀⁻¹); affects a stated result (Theorem 9.7's proof obtains the W_{≤0} vanishing from its induction instead).
- **Gap** in K at Lemma 9.6, p. 74: for a lattice whose valuation decrease comes only from a hyperbolic block, the normal basis produces an isotropic L′♭ and no nondegenerate L′♭ of smaller valuation exists (⟨l₁ + πl₂⟩ ⊂ H₁); it should add a separate step for such lattices; affects the proof (of Theorem 9.7).
- **Misprint** in LL2 at proof of Proposition 2.44, (2.17), p. 28: the source writes the conductor term as (b₂ − l)q^j; it should be (b₂ − j)q^j; affects nothing.
- **Gap** in LL2 at Lemma 2.57, pp. 34–35: the source states the lemma for r > 2 as printed in the extracted text, while the proof of Theorem 2.7 uses it, through the definition of a special lattice and Lemma 2.58, at r = 2; the proof of the lemma does not use r > 2, so it should read r ≥ 2; affects the proof. (Read as "⩾" the printed inequalities, including a_{n−1} ⩾ 3, are correct.)

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6a0318341e2f41be27b1a59e0de5a24a5f4c2628", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII", "model": "fable", "worker": "chris-x18"} -->

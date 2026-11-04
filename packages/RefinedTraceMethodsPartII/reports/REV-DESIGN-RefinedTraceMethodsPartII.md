<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2143#issuecomment-6408610043 -->
Review (claude) of c46202f

Verdict: needs changes

1. **F01** (P1) §8.2 finite-stage formula is false; Lemma 8.5 misread

   **Location.** `packages/RefinedTraceMethodsPartII/design/README.md` line 681: "If (p−1)j > pi, then `can − cφ : N^{≥j}{i}/p → N^{≥j−i}{i}/p` is an equivalence … Hence `𝔽_p(i) ≃ fib(can − cφ : N^{≥i}{i}/N^{≥j}{i} → N^{≥0}{i}/N^{≥j−i}{i})` … the printed quotient by N^{≥j} in the target … fail in the Check below"; line 689 (the Check).

   **Claim.** (a) akn-delta Lemma 8.5 says the mod-p map `can − cφ` on `N^{≥j}` is an equivalence onto `N^{≥j−i}/p`; (b) the finite-stage formula holds with target quotient `N^{≥0}/N^{≥j−i}`, and the printed target quotient `N^{≥0}/N^{≥j}` is wrong.

   **Witness.** akn-delta line 1759–1762: Lemma 8.5 states that `can − cφ` restricted to `N^{≥j}/p` factors as an automorphism of `N^{≥j}/p` followed by `can : N^{≥j}/p → N^{≥j−i}/p`; it is not an equivalence onto `N^{≥j−i}/p`. Computed instance: the Breuil–Kisin pair (ℤ_2⟦z⟧, ℤ_2), E(z) = z − 2, i = 1, p = 2, where `Δ_{R/A} = 𝔖`, `N^{≥j} = E^j𝔖`, and `ℤ_2(1)(ℤ_2/𝔖) = fib(E𝔖 → 𝔖, fE ↦ fE − φ(f))` (akn24 line 2337 with p − 1 replaced by 1). Mod 2 this is `fz ↦ fz − f²` on `k⟦z⟧`, k = 𝔽_2. Direct computation: H⁰ = k·z (the equation f² = fz has the solutions 0, z), H¹ = k² (the image is the set of series with b₁ = b₀ and b₂ = 0). Printed formula with j = 3 (which satisfies (p−1)j = 3 > pi = 2): source `zk⟦z⟧/z³ = ⟨z, z²⟩`, target `k⟦z⟧/z³`, map z ↦ 1 + z, z² ↦ 0: H⁰ = k, H¹ = k² — correct. README's formula with j = 3: target `k⟦z⟧/z²`, map z ↦ 1 + z, z² ↦ 0: H⁰ = k, H¹ = k — wrong. (The README's Check at line 689 computes `fib(2ℤ_2/8ℤ_2 → ℤ_2/4ℤ_2)` with an integral map `N^{≥3} → N^{≥2}`, `8b ↦ 4b`, that exists only because d = p in that instance; the package's map `cφ` lands in `sc_p(N)`, not in `N^{≥j−i}`, and its mod-p reduction into `N^{≥j−i}/p` is zero there, akn-delta lines 1689–1699.) What the Check does establish is that the printed bound of Proposition 8.6, (p−1)j ≥ i, is insufficient: j = 1 gives `fib(0 → 𝔽_2) = 𝔽_2[−1] ≠ 0`, and in the Breuil–Kisin instance j = 2 (allowed by the printed bound) gives H⁰ = 0, H¹ = k, also wrong.

   **Repair.** Restate the bullet: for (p−1)j > pi (the hypothesis of Lemma 8.5), `can − cφ` restricted to `N^{≥j}{i}/p` factors as an automorphism of `N^{≥j}{i}/p` followed by `can`; hence `𝔽_p(i)(H,N,c,φ) ≃ fib(N^{≥i}{i}/N^{≥j}{i} → N^{≥0}{i}/N^{≥j}{i})` mod p, the printed form of Proposition 8.6 with the strict bound replacing its printed "(p−1)j ≥ i". Replace the j = 3 computation in the Check by the Breuil–Kisin instance above (H⁰ = k, H¹ = k² on both sides), and keep j = 1 and j = 2 as negative controls for the bound. Propagate to `plan.json` 8.2 (statement and tests). Tested: the restated formula reproduces H⁰ = k, H¹ = k² in the instance that refuted the original; it reproduces 0 for the absolute package of 𝔽_2 with j = 3 (there the restricted map on `N^{≥3}/2` is an automorphism followed by the zero map `can`, and the induced map on vertical cofibres is an equivalence because both the bottom row and the top row have zero fibre).

2. **F02** (P2) §8.5 drops the defining condition of a filtered prism

   **Location.** README line 734: "A filtered prism is a filtered δ-ring with a prism structure on the underlying ring."

   **Claim.** Every filtered δ-ring whose underlying ring carries a prism structure is a filtered prism.

   **Witness.** akn-delta Definition 10.6, line 2116–2118: a filtered prism also requires each `gr^iA` to be `I ⊗_A gr⁰A`-torsion-free and `I ⊗_A gr⁰A`-complete, and Remark 10.9, line 2134–2135, says a filtered δ-ring with a prism structure is a filtered prism if and only if the flat filtration on A is strict — so the condition is not automatic. The filtered envelopes of §8.5 (Proposition 10.43) and the Breuil–Kisin example of Example 10.7 use it.

   **Repair.** Add the two graded conditions to the definition and a Check that states them on the filtered Breuil–Kisin prism (`gr^uA ≅ W(k)`, `I ⊗ gr⁰A = (p)`, akn-delta line 2121–2124); mirror in `plan.json` 8.5.

3. **F03** (P3) §2.4 Check names the wrong cyclic group

   **Location.** README line 291: "Connes' operator is multiplication by m, so the weight-m relative HC_0 vanishes."

   **Claim.** The weight-m part of `HC_0(ℚ[t]/ℚ)` is zero.

   **Witness.** `HC_0(A) = HH_0(A) = A` for every algebra, so the weight-m part of `HC_0` is `ℚ·t^m ≠ 0`. What the surjective Connes operator kills is `HC_1` (and `(ℚ ⊗ (T/C_m)_+)_{hT} = ℚ_{hC_m} = ℚ` in degree 0 only).

   **Repair.** Replace "HC_0" by "HC_1" (or "HC_q for q ≥ 1") and say that the weight-m HC is ℚ in degree 0.

4. **F04** (P3) §8.3 cites the wrong properties for uniqueness

   **Location.** README line 705: "The functor is uniquely determined by (3), (4) and (6) (akn-delta Proposition 9.15, line 2010)."

   **Witness.** akn-delta line 2010–2011: Proposition 9.15 characterizes Δ by ($), (4) and (6), or by ($), (4) and (5), where ($) (line 1991) is agreement, on relatively quasiregular semiperfectoid pairs with a chosen prism `(A′,I)`, with Bhatt–Scholze's `Δ_{R/A′}`; it is not property (3).

   **Repair.** Cite ($) (state it in one clause) in place of (3), and mention the alternative with (5).

5. **F05** (P3) §8.1 misdescribes the cosimplicial δ-ring

   **Location.** README line 666: "the p-complete Amitsur complex of `W(k) → W(k)⟦z_0⟧` with every δ(z_i) = 0".

   **Witness.** akn24 lines 501–504: the Amitsur complex is that of `W(k) → W(k)⟨z_0⟩`, each term then completed along the augmentation `z_i ↦ 0`; the Amitsur complex of `W(k)⟦z_0⟧` has second term `W(k)⟦z_0⟧ ⊗̂ W(k)⟦z_1⟧`, not `W(k)⟦z_0,z_1⟧`.

   **Repair.** Say "the Amitsur complex of `W(k) → W(k)⟨z_0⟩`, completed termwise along the augmentation ideal".

6. **F06** (P3) §8.6 Check on a ring that is not p-complete

   **Location.** README line 761: "`H¹(ℤ_p(1)(ℤ_p[z]))` is the p-completion of `ℤ_p[z]^× = ℤ_p^×`."

   **Witness.** Syntomic complexes are defined on p-complete (quasisyntomic) rings, PrismaticCohomologyPartIII §6.8 (line 321), so `ℤ_p(1)(ℤ_p[z])` means `ℤ_p(1)(ℤ_p⟨z⟩)`, and `ℤ_p⟨z⟩^×` contains `1 + pz` (its inverse `Σ(−pz)^n` converges), so H¹ is larger than the p-completion of `ℤ_p^×`.

   **Repair.** Replace `ℤ_p[z]` by `ℤ_p⟨z⟩` throughout the Check and compute H¹ as the p-completed units of `ℤ_p⟨z⟩` (the point of the Check, incompleteness of the z-adic filtration on the syntomic complex versus `ℤ_p⟦z⟧`, survives).

7. **F07** (P3) README `*Needs:*` lines and plan.json prerequisites disagree

   **Location.** README lines 287 (§2.4), 305 (§2.5), 322 (§2.6), 375 (§3.3), 456 (§4.2); `plan.json` targets 2.4, 2.5, 2.6, 3.3, 4.2, 2.1.

   **Witness.** plan 2.4 lists `target:2.2`, README §2.4 does not (it uses `B^cy(Π)` of §2.2); plan 2.5 lists `target:1.4`, README does not; README §2.6 lists §2.3 and omits §1.1 (it uses ℓ(a,b,m)), plan 2.6 lists 1.1 and omits 2.3; plan 3.3 lists KTheoryFiniteLocalFields §5.1 (used at line 372), README §3.3 does not; plan 4.2 lists `target:4.1`, README §4.2 does not. plan 2.1 carries four tests, README §2.1 three Checks.

   **Repair.** Make each `*Needs:*` line the union of what the paragraph uses and what plan.json lists (add §2.2 to §2.4; §1.4 to §2.5; §1.1 to §2.6 and §2.3 to plan 2.6; KTheoryFiniteLocalFields §5.1 to §3.3; §4.1 to §4.2), and split §2.1's first Check so the counts agree.

8. **F08** (P3) process words in Downstream consumers

   **Location.** README line 878: "No roadmap on main, in an open roadmap pull request, or among the board's packages cites these calculations."

   **Witness.** House style: no pull-request or board references in the README.

   **Repair.** "No existing roadmap cites these calculations."

9. **F09** (P3) GeneralAlgebraicKTheoryPartII cannot be resolved

   **Location.** README lines 28 and 882 (and `target.md` "KII.5", "KII.9").

   **Witness.** `roadmaps show GeneralAlgebraicKTheoryPartII` finds no roadmap on main or in an open roadmap pull request; the board index lists no such package; only the merge order (line 223) carries the name. The README cites it by name only, so nothing is checkable.

   **Repair.** Keep the deferral but phrase it as an ownership statement without implying a readable section ("height-one purity is left to GeneralAlgebraicKTheoryPartII"), or, if that roadmap never materialises, to a named future owner.

Reviewed at the pull request's current head c46202f (design README, plan.json, sources.toml under `packages/RefinedTraceMethodsPartII/`). Previous review: none. The roadmap is a Part II of RefinedTraceMethods (open pull request); its suppliers are read at their open heads (RefinedTraceMethods, KTheoryFiniteLocalFields, QWittVectors, SchemeKTheoryOperations, GeneralAlgebraicKTheory, AInfCohomology, PrismaticCohomology I–III, CrystallineCohomology, DerivedDeRhamCohomology, StableHomotopyKTheory) or on main (EnhancedDerivedSheaves, BordismFormalGroups).

## Verified sound

**Principles.** No route-specific shortcut: the axes are over regular noetherian 𝔽_p-algebras and over perfect fields of every characteristic including p = 2, the cusps over every perfect 𝔽_p-algebra, the truncated polynomials over every perfectoid ring, the chain rings for every finite K/ℚ_p and n. No re-planning: THH/TC/DGM/excision come from RefinedTraceMethods (its §2.10 is for unpointed E₁-monoids, line 871–878; the pointed-monoid splitting in the Nikolaus–Scholze framework is new), the classical pointed-monoid model from KTheoryFiniteLocalFields §5.16 (line 1143–1146), truncated-polynomial K over regular noetherian 𝔽_p-algebras and perfect fields from KTheoryFiniteLocalFields §5.17 (lines 1230–1251, correctly imported as a Check of §7.2), big Witt vectors from QWittVectors §§1.1–1.5. No copied passages, no algorithm (akn24 §7 excluded), no sorry'd data or `set_option` (no Lean at this stage). Supply is downward only.

**Gate.** Run on the candidate README against `merge-order/ORDER.txt`:

```text
candidate: RefinedTraceMethodsPartII is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier named in a `*Needs:*` line is earlier in the order (StableHomotopyKTheory 4, GeneralAlgebraicKTheory 5, EnhancedDerivedSheaves 17, DerivedDeRhamCohomology 20, CrystallineCohomology 21, SchemeKTheoryOperations 37, AInfCohomology 62, PrismaticCohomology 63/65/67, KTheoryFiniteLocalFields 79, QWittVectors 81, RefinedTraceMethods 221) or on main (BordismFormalGroups, EnhancedDerivedSheaves).

**Supplier citations resolved at the open heads (file and heading line).** RefinedTraceMethods: §1.2 (143), §1.3 (215), §1.4 (262), §1.9 (404), §2.1 (485), §2.3 (554; Tate vanishing on induced objects, p-completeness of `X^{tC_p}`, `𝕊^{tC_p} ≃ 𝕊^∧_p` all stated), §2.4 (580; `D_{BT} = Σ𝕊`, `D_{BG} = 𝕊`), §2.5 (600), §2.6 (639), §2.8 (796), §2.9 (845), §2.10 (871), §2.13 (1035), §2.16 (1219), §4.12 (1980; `K^inv = fib(IK → TC)`), §4.17 (2195; DGM for connective E₁-rings with π₀-surjective nilpotent kernel; Goodwillie `K_n(R,I)⊗ℚ ≅ HC_{n−1}`; KQinf), §4.18 (2258; `K^inv` truncating, excision for Milnor squares, continuity mod p), §8.7 (3816). KTheoryFiniteLocalFields: §§1.1–1.6 (198–287), §2.1 (365), §4.0 (605), §4.4 (667), §5.1 (767), §5.16 (1143; cofibre sequences `S^{λ_d} ∧ (T/C_{s/e})_+ → S^{λ_d} ∧ (T/C_s)_+ → N^cy(Π_e;s)`, d = ⌊(s−1)/e⌋), §5.16a (1171; `γ_N`, `γ_1(a) = 1 + at`, `(1,0)+(1,0) = (2,−1) ↦ 1+2t+3t²`), §5.17 (1189; `TR^n_{q−λ}(A;p) ≃ ⊕_{r=1}^n ⊕_{ℓ_{n−r} ≤ m < ℓ_{n−1−r}} W_rΩ^{q−2m}_A`, exactly as quoted at README line 93; `K_{2m−1}(k[x]/x^n,(x)) ≃ 𝕎_{mn}(k)/V_n𝕎_m(k)` for perfect k). QWittVectors §1.1 (113), §1.3 (154; `x = Σ V_dτ(x_d)` at 1.4), §1.4 (178), §1.4a (204), §1.5 (234; p-power truncation sets only, so gap `bigwitt-ptypical-decomposition` is honest; §1.6 line 252 has only the coprime decomposition `W_Div(ab) ≅ W_Div(a)(W_Div(b))`, §2.2 line 394 only the P-typical comonad). SchemeKTheoryOperations §5.2 (1446; `NK_n(X) = 0` for regular noetherian X, every n); its §4.10 (1336) is v-descent of Perf on perfect schemes, not homotopy invariance of K, so gap `perfect-homotopy-invariance` is honest and minimal (amm-perfectoid Proposition 5.1, line 558, is the cited source). GeneralAlgebraicKTheory §8.1 (1728), §10.5 (2385), §10.13 (2550). AInfCohomology AI.0 (513), §AI.7.2 (3816; `completedTateComparison`, Bökstedt periodicity, perfectoid trace coefficients). PrismaticCohomology §§0.55–0.56, 0.73–0.76, 0.93, 1.2–1.4, 2.1, 2.13. PrismaticCohomologyPartII §§3.6, 3.9, 3.10, 3.19 (595), 3.20, 3.24 (690), 4.4–4.10, 4.17–4.19, 4.22 (1303), 4.23 (1332), 4.25, 4.29, 4.31. PrismaticCohomologyPartIII §6.8 (319; `ℤ_p(n) = fib(φ_n − can)` on quasisyntomic rings), §6.9, §6.28, §6.31, §7.0 (863; `gr^nTC(R;ℤ_p) ≃ ℤ_p(n)(R)[2n]`). CrystallineCohomology CR.2 (1602), CR.4 (3546). DerivedDeRhamCohomology Layer 2 (2883), Layer 5 (4092). StableHomotopyKTheory §§7.9–7.10, 7.14–7.18. EnhancedDerivedSheaves E5 (1437–2030). BordismFormalGroups §F6.5 (1527). Total: 61 cross-roadmap citations resolved, 0 missing (the `roadmaps resolve` lead list was empty and this agrees).

**Ownership.** `roadmaps grep` over main and the 367 open heads for "coordinate axes", "cuspidal curve|planar cusp", "truncated polynomial", "finite chain ring|O_K/ϖ^n|ℤ/p^n", "δ-pair|relative to a δ-ring", "filtered prism", "pointed monoid", "Angeltveit", "big Witt", "even vanishing", "homotopy invariance … perfect|K ≃ KH": the only hits that plan the same objects are the cited suppliers (KTheoryFiniteLocalFields §5.16/5.16a/5.17, QWittVectors Layer 1, RefinedTraceMethods §4.18–4.19). The board index (8 packages: AnalyticNumberTheory, AutomorphicCongruences, CrystallineCohomologyPartII, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory, PadicLocalLanglandsForGL2QpPartII, VStackSheavesAndLisseCategoriesPartII) contains nothing overlapping. This roadmap is the owner of Layers 1–9 as claimed.

**Declared gaps.** Both have a named supplier and section, the same slug in plan.json and the README (lines 127–128), a one-sentence `needs` with hypotheses (ℤ_(p)-algebra and truncation set; perfect 𝔽_p-algebra), and ask for nothing a supplier provides (checked above). Both precise and minimal.

**Sources (seeded sample, 15 targets, every locator opened).** 1.2: hesselholt-cusp-polytopes Corollary 1.7 and proof, lines 395–400 (length of `W_T(k)` = card T) ✓. 1.4: speirs-axes Definition 8 (357), t_ev/t_od definitions (23–25), Lemma 33 (1250, `A_d(m) = (d−1)^m + (−1)^m(d−1)`), Möbius formula (1264–1278), table (1282–1294: cyc_3(2..6) = 3,2,3,6,9), equation (34) (1301) ✓. 2.3: hn-cusp line 105–113 (unpointed form), speirs-axes Lemma 4 (272–285, pointed form, Frobenius as tensor product), speirs-trunc 319–346 (factorization through the lax Tate map) ✓. 2.5: speirs-axes Lemma 6 (334), Lemma 9 (360), Lemma 11 (426, three cell types as quoted), Proposition 12 (456, homology `R`, `R/2`, `R[2]`, Connes operator i or 0) ✓. 3.6: speirs-axes Corollary 17 (603, iso in degrees ≥ m), speirs-trunc Corollary 9 (377, ≥ 2d+1 / ≥ 2d+2) ✓. 5.1: hesselholt-axes Theorem B (70–81), stabilization `q < dim_ℝ λ_{p^{r−1}d} = 2p^{r−1}d` (82–85), Proposition 1.2 (131–137, with the desuspension) ✓. 5.2: Theorem A (21–30, "regular 𝔽_p-algebra", Hesselholt's regular rings are noetherian), p-typical decomposition with `s(m,d)` (36–41), `K_4` and exponent remarks (107–111) ✓. 6.2: hn-cusp Theorem A (27–30), length `½(2r+1)(a−1)(b−1)` (36–37), p-typical form with h (43–57) ✓. 7.2: riggenbach-trunc Theorem 1.1 (67–69), Corollary 6.5 (1279–1283), s-function (74–79); sulyma-slopes Theorem 1.1 (43–44) and standing hypothesis "k a perfect 𝔽_p-algebra" (31) ✓. 8.1: akn-delta line 121–125 (bounded, finitely presented free), Definitions 9.1–9.2 (1838–1850), Proposition 9.14 (1974); akn24 501–507 ✓. 8.2: Definition 1.1 (89), Definition 8.1 (1701), Proposition 8.3 (1745), Definition 8.4 (1753), Lemma 8.5 (1759), Proposition 8.6 (1770), Corollary 8.7 (1787) — see R01. 8.5: Definitions 10.2–10.10 (2105–2139) — see R02; Definition 10.29 (2301), Proposition 10.31 (2309), Corollary 10.34 (2386), Proposition 10.37 (2415), Proposition 10.43 (2489), Construction 10.44 (2530), Proposition 10.46 (2583), Corollary 10.47 (2588) ✓. 8.6: akn24 Proposition 2.6 (325), Proposition 2.11 (357), Lemma 2.12 (381), Theorem 2.20 (457) ✓. 9.5: Theorem 5.2 (2074, bound `(p/(p−1))(p[j]_p − p^j j + p^j n/e)` equal to the README's `B(p,e,n)`), Remark 5.4 (2078), Corollary 5.5 (2084), Corollary 5.6 (2091), Lemmas 5.7–5.9 (2105–2135), Corollary 5.10 (2157), Theorem 5.12 (2169), Lemma 5.15 (2197), Lemma 5.16 (2219), Theorem 1.4 (156), Example 1.7 (172) ✓. 9.6: Proposition 6.2 (2321, v = d^p), Theorem 6.3 (2330, `v₁ ∈ H⁰(𝔽_p(p−1)(ℤ_p))`), Theorem 1.8 (197), Remark 1.10 (206) ✓. Also opened for targets touched by findings or by the headline table: hn-cusp Theorem 1 (131–142), Lemma 2 (162–178), Proposition 3 (179–184), lines 290–349 (tower and staircase); hesselholt-cusp-polytopes Lemma 1.4 (329–372), Remark 1.5 (373–382), Corollary 1.6 (386–394), Proposition 3.1 (792), Theorem 4.1 (839); riggenbach-double Proposition 4.2 (296), Corollary 4.4 (341), Proposition 5.7 (507), Corollary 5.8 (517), Lemma 5.13 (668); riggenbach-trunc Theorem 5.1 (846), Lemma 5.2 (889), Lemma 4.1 (575), staircase (1266–1272); speirs-axes Lemma 15 (506), Proposition 16 (532), Lemma 21 (709), Proposition 26 (857), Proposition 28 (976), §5–5.1 (993–1117), Lemma 29 (1128), Theorems 30–31 (1163, 1228); akn24 Proposition 2.1 (274), Corollaries 2.3, 2.5 (279, 295), Lemma 2.8 (344), Corollaries 2.13–2.16 (388–409), Proposition 2.18 (419, ε at 443), Theorem 2.22 (515), Propositions 2.23–2.24 (532, 537), Theorem 2.27 (576), Lemma 3.6 (670), Proposition 3.30 (984), Corollary 3.31 (1008), Propositions 3.33–3.34 (1037, 1070), Lemma 4.6 (1204), Proposition 4.24 (1399), Lemma 4.43 and Corollary 4.44 (1644, 1664), Theorem 1.1 (108), Proposition 1.5 (162), table (144–154); akn-delta Theorem 1.2 (126), Corollaries 1.3–1.4 (171, 177), Proposition 1.6 (200), Theorem 1.7 (211), Definitions 7.7–7.8 (1597–1603), Remark 7.9 (1604), Corollary 7.10 (1607), Corollaries 8.9–8.10 (1812, 1824), Proposition 9.15 (2010); amm-perfectoid Proposition 5.1 (558). Hypotheses agree with the README's statements in every case except R01/R02.

**Adversarial pass (computed values).**

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 ℓ, S(a,b,r), T(a,b,r) | (2,3,0), (2,3,1), (2,3,2), (2,5,0) | S(2,3,0)={1,2,3,4,6}, #=5=½·3·4−1; S(2,3,1)={1..10,12}, #=11; ℓ(2,3,11)=2, ℓ(2,3,12)=1; T(2,3,1)={1,5,7}, T(2,3,2)={1,5,7,11,13}; S(2,5,0)={1,2,3,4,5,6,8,10}, T={1,3}; #T=½(2r+1)(a−1)(b−1) in all four | sound |
| §1.3 index functions | (2,3,0,2), (2,3,1,5), S={1..4}, p=2 | h(2,3,0,2,·): m′=1: s=3 (ℓ(8)=1), h=min{3,1}=1; m′=3: 0; m′=5: s=0; total 1=#T. p=5, r=1: h(1)=2=s_T(1)=#{1,5}, h(7)=1, h(11)=0; s_S(1)=3, s_S(3)=1, sum 4=#S | sound (identity h = s_T(m′) holds on all instances) |
| §1.4 counts | d=2,3 | A_3(2..6)=6,6,18,66; cyc_3(6)=(66−6−6+0)/6=9; cyc_2(4)=0; t_od(2,1,3)=1, t_ev(2,1,3)=0 | sound |
| §1.5 B(p,e,n) | ℤ/4; 𝔽_2[z]/z³ as e=3 | B=2(2·3−4·0)=12; B=4·3/3=4; p²/(p−1)≥4 never covers i=2 | sound |
| §2.3 splitting | Π_0; k=𝔽_p, Π_2 weight 1 | identity; 𝔽_p[u]⊗H_*(T_+) one-dimensional in each degree ≥0 | sound |
| §2.4 Check 1 | ℚ[t], weight m | HC_0 = ℚt^m ≠ 0, HC_1 = 0 | R03 |
| §2.6 cusp square | (2,3), m=1 and m=6 | m=1: ℤ⊗T_+, H=ℤ,ℤ; m=6: H₁-level square ℤ→3→ℤ over ℤ→3→ℤ with verticals ×2: cofib(ℤ/3 →2 ℤ/3)=0 | sound |
| §3.1 Tate comparison | T=𝕊, Z=S⁰ | π₀ source ℤ_p⊗ℤ_p ≠ ℤ_p; p-completed source ≃ 𝕊^∧_p | sound (and refutes speirs-axes Lemma 15 as printed) |
| §3.4 tower | R=𝔽_p, n=1,2; n=0 | π₀THH^{tC_p}=𝔽_p; π₋₂THH^{hC_p}=ℤ/p; π₀THH^{hC_p}=ℤ/p² (from p·uv = p² = 0), transfer ×p; n=0: R[u] | sound |
| §3.5 staircase | s=0; s=2 with W_{v+1}/W_v; all maps 0 | kernel A_0; kernel A_1 = W_2(k); δ=0 with kernel ∏ℤ/p | sound |
| §5.2 Hesselholt | k=𝔽_3, q=1..6; p odd/2 at q=4 | 0, 𝔽_3, 0, 𝔽_3², 0, ℤ/9⊕𝔽_3 (s(3,1)=2, s(3,2)=1); q=4: Ω²⊕k⊕k (p odd), Ω²⊕W_2(k) (p=2) | sound, matches hesselholt-axes 107–111 |
| §5.3 Speirs, p=2 odd degrees | family m even, s odd, tower v≥0 for fixed odd m′ | v=0: A_0=k iff 2r+1≥m′, B_0=0; v≥1: A_v=B_v=k (Tate E³=k[t^{±1}]{z}, hT E³=(k[t,x]/tx){z}); φ_v iso for 2^v m′ ≤ 2r+1, can_v iso for 2^v m′ > 2r+1; staircase with s=t_od gives one copy of k^{cyc_d(s′)} iff m′ ≤ 2r+1 | README's corrected formula confirmed; printed ∏_{0≤v≤t_ev} gives t_ev+1 copies for every odd m′ (infinite, K_1≠0 for d=3) |
| §5.3 Checks | d=3, q=3,5; d=2 | q=5: p=2: cyc_3(3)+cyc_3(5)=2+6=8; p=3: m′=1,u=1: k², m′=5: k⁶; q=3: all primes k²; d=2, p=2: t_ev−1 = s(r,m′) | sound |
| §5.4 char 0 | d=2, k=ℚ, q=4; d=2, q=2 | Ω²_ℚ⊕Ω⁰=ℚ; c_1(2)=1 ⇒ K_2=k | sound |
| §6.1–6.2 cusps | (2,3), k=𝔽_2, 𝔽_5; (2,5), 𝔽_3 | K_2=W_{{1,5,7}}(𝔽_2)=𝔽_2³; K_4 over 𝔽_5: s_T(1)=2 ⇒ ℤ/25⊕𝔽_5³, length 5; W_{{1,3}}(𝔽_3)=ℤ/9 | sound |
| §7.1–7.2 truncated | e=1; 𝔽_3, e=2, r=2; 𝔽_p, e=p, r=1; e=p, V_{p,1} | 0; T={1,3} ⇒ ℤ/9; 𝔽_p^{p−1} (exponent p since (1+x)^p=1); 𝔽_p→ℤ/p² is ×p, cofibre ℤ/p | sound |
| §7.2 index identity | e=p^v e′, u∈J_p | s_T(u) = s if e′∤u, min(s,v) if e′|u | sound |
| §8.2 finite-stage formula | (ℤ_2⟦z⟧,ℤ_2), i=1, j=1,2,3; absolute 𝔽_2 | truth H⁰=k, H¹=k²; printed j=3: (k,k²); README j=3: (k,k); printed j=2: (0,k); printed j=1: (0,k) | R01 |
| §8.4 ℤ_p(1) and i<0 | R=ℤ/4; R=𝔽_p, i≥1 | H¹=(ℤ/4)^×=ℤ/2; p^i a ↦ (p^i−1)a iso ⇒ ℤ_p(i)(𝔽_p)=0 | sound |
| §8.5 filtered prism | Definition 10.6 vs README | README omits torsion-free/complete graded condition | R02 |
| §8.6 Check 1 | ℤ/4 vs 𝔽_2[z]/z², i=1 and K_3 | H¹ orders 2 and 2; K_3: ℤ/8 vs W_{{1,3}}(𝔽_2)=𝔽_2² | sound |
| §9.2–9.3 chain rings | ℤ/4, ℤ/8, 𝔽_2[z]/z³ from akn24 table | ratios 8/2=4=2^{2·1}, 32/2=16=2^{2·2}, 128/2=64=2^{3·2}, 64/1=64; ε-count {1,3} for i=2,n=2 | sound |
| §9.5 even vanishing | ℤ/4; n≤e | i≥13; j=1 ⇒ B=p²n/((p−1)e)→0; `|K_5(ℤ/4)|=56=7·8` | sound |
| §9.6 v₁ | n=1; ℤ/4; e=2,n=3 | [1]_p=1 and 𝔽_p(p−1)(𝔽_q)=0; [2]_2=3 with e|n; j=2, e∤n so only ≤ | sound |
| Examples §9 | 𝔽_2[z]/z³ | K_3 2-part W_{{1,2,4,5}}(𝔽_2)=W_3⊕W_1=ℤ/8⊕ℤ/2; K_1=ℤ/4; K_5 2-part W_{{1,2,4,5,7,8}}=ℤ/16⊕ℤ/2⊕ℤ/2 | sound, matches akn24 line 144–149 |
| Conventions witnesses | Witt sign, V_1, Tate grading, circle cells, syntomic degree | (2,−1)↦1+2t+3t²; W_2(𝔽_2)/V_2W_1=ℤ/2; π_{2r}(Hℤ)^{tC_p}=ℤ/p; (Hℤ⊗T_+)^{hT}=ΣHℤ; H¹(ℤ_2(1)(ℤ/4))=ℤ/2 | sound |

**Headline theorems (README).** Hesselholt's axes formula (§5.2), Speirs' affine-space formulas in characteristic p and 0 (§§5.3–5.4), Hesselholt–Nikolaus cusps (§6.2), Riggenbach's truncated polynomials over perfectoid rings (§7.2), Antieau–Krause–Nikolaus finite chain rings: structure (§9.2), Angeltveit's quotient (§9.3), even vanishing (§9.5), v₁-nilpotence (§9.6). None is statable at the pins (no K-theory, TC, THH, syntomic complexes or big Witt vectors in Mathlib or Tau Ceti at the pinned commits, as the README's supplier contract says, line 65); the design stage has no `Suggested.lean`, so padding and elaboration do not apply yet. Lean elaboration: not available (this lane does not elaborate).

**Shape and completeness.** 41 targets, each with a `*Needs:*` line (41 counted), a locator at the claim and at least three Checks (counts above); every layer ends with Examples and Dependencies; Summary, Scope and ownership (with deferrals: F-smooth extension, rational cusps, purity, K of O_K), Conventions with five pinned witnesses, Exact supplier contracts, How to read the build, Downstream consumers, References present. No LaTeX delimiters, no `lemma` keyword, no target tables. plan.json: 9 layers, 41 targets, prerequisites downward only, gaps list = README gaps.

## Not verifiable

- bach-hypersurfaces and larsen-mixed: uncertified (paywalled); §2.6 relies on their restatement as hn-cusp Theorem 1, which was read.
- The published AGT version of speirs-axes was not read; the p = 2 odd-degree correction in §5.3 is checked against the arXiv v2 proof (Propositions 26 and 28, §5.1), not against the journal text.
- The printed journal pagination of hesselholt-axes (Nagoya Math. J.) and of sulyma-slopes (Ann. K-Theory) was not checked; locators were verified on the arXiv extractions.
- Lean elaboration and the `#check` comparison: not available at the design stage (no `Suggested.lean`).

## Source issues

- **Error** in speirs-axes at Theorem 1 and Theorem 2 (p = 2, odd degrees, printed pp. 2 and 4) and the final display of §5.1 (p. 28): the source says the odd-degree p = 2 answer is a product over 0 ≤ v ≤ t_ev of k^{⊕cyc_d(s′)} for every odd m′; it should be one copy of k^{⊕cyc_d(s′)} for each odd m′ ≤ 2r+1 (the staircase kernel is A_{t_od−1} = k), the printed form being an infinite product that gives K_1 ≠ 0 for d = 3; affects a stated result.
- **Misprint** in speirs-axes at Proposition 26(2), p. 22: the source says the homotopy fixed points in degree 2r+1 are W_{v−u+1}(k) when 2r ≥ m; it should be 2r+1 ≥ m, as the definition of t_od and the proof of Proposition 28 use; affects nothing.
- **Error** in speirs-axes at Lemma 15, p. 13: the source says the lax map T^{tC_p} ⊗ (Σ^∞X)^{tC_p} → (T ⊗ Σ^∞X)^{tC_p} is an equivalence for every bounded-below T; it should be after p-completion of the source (T = 𝕊, X = S⁰ has source π₀ = ℤ_p ⊗ ℤ_p), or for T^{tC_p} an H𝔽_p-module as in the paper's use; affects the proof.
- **Error** in akn-delta at Proposition 8.6, p. 43: the source says the finite-stage formula holds when (p−1)j ≥ i; it should require (p−1)j > pi, the hypothesis of Lemma 8.5 (for the Breuil–Kisin pair (ℤ_2⟦z⟧, ℤ_2), i = 1, j ∈ {1,2} the displayed fibre has the wrong H¹); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c46202f", "job": "REV-DESIGN-RefinedTraceMethodsPartII", "model": "fable", "worker": "fable-rev193"} -->

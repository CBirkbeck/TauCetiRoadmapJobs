# Review of HeightsRationalPointsAndObstructionsPartII (pull request #1821 at ac9e370)

**Verdict:** needs changes

Two findings, one P2 (a declared gap that the supplier already provides at its open head) and one P3 (a corrupted character in a normalization). The gate passes; the dependency check reports no UPWARD or CYCLE line; the three Lean headlines elaborate and are sound; the seeded source sample verified at every locator, with six source errata recorded below (all already handled by the README).

## R01 (P2) — `gap:moriwaki-silverman-tate-nef` asks for what ArakelovGeometryAndAbelianHeightsPartII §6.4(1) already provides

**Location.** `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` line 107 ("§6.4 is stated for big polarizations, and its comparison part is extended to nef polarizations by the Moriwaki Silverman–Tate nef contract"), the contract paragraph at line 109, §8.5 line 1440 ("ArakelovGeometryAndAbelianHeightsPartII §6.4(1) with the Moriwaki Silverman–Tate nef contract") and its Check at line 1445 ("it lies outside the big-polarization comparison of the supplier"); `design/plan.json` gap `moriwaki-silverman-tate-nef`.

**Claim.** The supplier's §6.4 comparison |ĥ^B − h^B| ≤ C·max{1, h^B_S̄(π(P))} holds only for big Moriwaki polarizations, so the nef case must be declared as a gap.

**Witness.** ArakelovGeometryAndAbelianHeightsPartII at its open head, `README.md` §6.4 line 1046: part (1) is stated for a polarization "whose H̄ᵢ are nef", for an abelian scheme over a regular quasi-projective k₀-variety (a curve included), with the §§0.26–0.28 embedding and symmetric L = O(1,1)|_𝒜, "for every such polarization B, big or not"; its route (line 1048) says bigness enters only through Northcott and the specialization limit (2); its third Check (line 1056) ends "(2) therefore keeps the big hypothesis and (1) does not". Every hypothesis of the gap's `needs` sentence is in that statement.

**Repair.** In §8.5 cite ArakelovGeometryAndAbelianHeightsPartII §6.4(1) directly for nef B and delete the words "with the Moriwaki Silverman–Tate nef contract"; rewrite line 107 to "§6.4(1) holds for every nef polarization and §6.4(2) keeps bigness"; delete the contract paragraph at line 109 and the parenthetical "(the Moriwaki Silverman–Tate nef contract)" in §8.5's Needs, Layer 8 Dependencies (line 1470) and §8.6's route; reword the Check at line 1445 to say the zero polarization is covered by §6.4(1) and excluded from §6.4(2); remove `moriwaki-silverman-tate-nef` from the `gaps` list of `design/plan.json` (or, if the board keeps declared gaps immutable, state in the README that §6.4(1) already supplies it so the intake does not announce it). Tested on the instance that refuted the original: the zero polarization over ℚ(t) (nef, not big) is exactly the supplier's own Check for (1).

## R02 (P3) — `[K:â]` in §7.1 is a corrupted `[K:ℚ]`

**Location.** `TauCetiRoadmap/HeightsRationalPointsAndObstructionsPartII/README.md` line 1263: "with a_K = [K:â] for a number field and a_K = 1 for a function field".

**Claim.** The normalizing constant of the subvariety height is the degree of the number field.

**Witness.** The bytes at that position are `C3 A2 C2 84 C2 9A`, the double-encoded UTF-8 of `ℚ` (`E2 84 9A`); every other `ℚ` in the file (114 occurrences) is encoded correctly, and the quantity meant is the [K:ℚ] of HeightsRationalPointsAndObstructions §5.9b's cycle height (its line 2438 divides by [K:ℚ]).

**Repair.** Replace `[K:â]` by `[K:ℚ]`.

## Verified sound

**Gate and build.** The worker's gate at ac9e370 passes every check (set_option=0, sorry-data=0, imports=0, depcheck=0, outside-folder=0, build=0). The diff outside the roadmap folder is empty. Dependency check run by me:

```
depcheck: 240 roadmaps, 2309 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line for this roadmap; it sits at line 325 of the merge order, after its last supplier ArakelovGeometryAndAbelianHeightsPartII (324). Suppliers on main: SchemeAndStackFoundations, ClassicalArithmeticCompletion, AlgebraicCurves, JacobianChallenge. The other 14 suppliers are earlier in the order and were read at their open heads.

**Lean.** `Suggested.lean` has one module docstring, `import Mathlib` plus the single Tau Ceti module `TauCeti.AlgebraicGeometry.AbelianVariety.Albanese`, no definitions, three sorried theorems, no `set_option`, no `lemma`. The worker's elaborated signatures (3 declarations, 0 dropped binders) were compared with §§3.6, 6.8 and 6.12: each theorem carries `IsAlgClosed`/`CharZero` or `NumberField`, `Smooth`, `IsProper`, `GeometricallyIntegral`, Krull dimension one, the Albanese hypothesis and `J.dim = g` in its own signature; B is chosen before F, so the bounds are uniform in the field and the translate. Library objects opened at the pin: `AbelianVariety` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95, bundling `grpObj`, `isProper`, `geometricallyIntegral`, all instances), `dim` (Basic.lean:117, `WithBot ℕ∞`, so `J.dim = ↑g` is well typed), `IsAlbanese` (Albanese.lean:84: `x₀ ≫ a = η` and unique factorization of pointed morphisms through homomorphisms), the point group `MonObj.Hom.group` (Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58) induced by the bundled `GrpObj`, so `(x ≫ a) * c` is addition in the abelian variety and `IsOfFinOrder` is torsion. Only elliptic canonical heights exist at the pin (TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight), so the docstring's list of non-statable headlines (canonical heights on abelian varieties, degrees for polarizations, Betti maps, adelic bundles, function-field heights) is accurate. One-tactic probe on a scratch copy with `simp` in place of each `sorry`: all three fail with the full goal unsolved, so none is padding; no `example`, no Check mirrored. The three names appear in the README (§§3.6, 6.8, 6.12) and nowhere else among the open roadmaps or main (`roadmaps grep`).

**Headlines.** Kühne Theorem 2 (kuhne-2021 line 242, p. 6, over ℂ) and Theorem 4 with the remark #C(K) ≤ c₁₀(g)^{1+ρ} (lines 322–333, p. 8) match `uniform_maninMumford_curves`, `uniform_mordellLang_curves` and `uniform_rationalPoints_curves`; the extension from ℂ to every algebraically closed characteristic-zero field is GGK Theorem 1.1′ (ggk-2026 line 121) with its Lemma 7.3 specialization (line 1580). The rank encoding (Γ inside the division hull of a subgroup generated by at most ρ points) is equivalent to rk Γ ≤ ρ: a maximal ℤ-independent subset of Γ has rk Γ elements and Γ/⟨s⟩ is torsion; conversely the division hull of a ρ-generated group has rank ≤ ρ.

**Ownership.** `roadmaps grep` for "uniform Mordell", "uniform Manin", "Gao–Ge–Kühne", "Xie–Yuan", "geometric Bogomolov", "Equidistribution in families", "Hyp pack", "Rémond": outside this roadmap every hit is a bibliography entry (AlgebraicModuliForArithmeticGeometry, HeightsRationalPointsAndObstructions, AbelianSchemesAndArithmeticModuli(PartII), ArakelovGeometryAndAbelianHeights(PartII), InverseGaloisAndArithmeticFundamentalGroups) or DeMarco–Krieger–Ye's dynamical inputs in ArithmeticDynamics §§6.93, 6.110–6.112 and TropicalAndBerkovichArithmetic, which this roadmap cites rather than restates. No other roadmap plans uniform Bogomolov, the gap principle, Rémond's counting, uniform Mordell–Lang, Xie–Yuan or Yuan's uniform curve theorem. Ownership against open pull requests without files in the brief was not checked beyond the grep index.

**Supplier citations resolved (every heading found at the cited roadmap, on main or at its open head).** HeightsRationalPointsAndObstructions §§0.10, 0.12, 0.16–0.19, 0.21, 0.25–0.26, 0.28–0.35, 1.7–1.11, 5.1–5.8, 5.9a–f, 5.10–5.13, 5.13a–c, 5.14–5.17, 5.17a–b, 5.17f–g, 5.18–5.19 (57 headings; §5.9b at line 2436 defines the Fubini–Study cycle height divided by [K:ℚ] with arithmetic Bézout and coefficient comparison and its Check gives [1:2] height ½ log 5, matching the README's Check; §0.31–0.33 give the polarized function-field cycle height, its laws and base/constant extension; §1.11 the trace-plus-torsion kernel; §5.8 Scanlon's uniform torsion closure; §5.17 the essential minimum). ArakelovGeometryAndAbelianHeights §§2.7, 3.4, 4.2–4.4, 5.5–5.8, 6.3, 6.5. ArakelovGeometryAndAbelianHeightsPartII §§0.3 (its clause (2′) is the geometric Siu inequality vol(L−M) ≥ L^d − d·L^{d−1}M for nef L, M on a d-fold over a field, d ≥ 1, with the d = 0 case separated), 3.1–3.3, 4.6–4.8, 5.1–5.4 (§5.2 identifies adelic non-degeneracy with full Betti rank for abelian schemes over ℂ; §5.3(2) is the generic-sequence equidistribution), 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6 (§12.4 is Yuan's Lemma 4.3 product-grid bound with exponent 1/codim; §12.5(3)–(4) the theta potential bigness used in §11.3; §12.6 restriction across characteristics), 13.1, 13.7 (Bost's bound with c = (g/2)log(2π²)+1, matching §11.4). AbelianSchemesAndArithmeticModuli A1–A3, A6, A2.3, A2.7–A2.10. AbelianSchemesAndArithmeticModuliPartII B0.1–B0.2, B1.1–B1.5, B2.3 (stated over a curve field only, so §8.1's extension to a higher-dimensional base is a genuine target), B2.13, B2.21–B2.23, B3.7–B3.9, B4.2–B4.6. StableReductionPartII §§4.2, 4.4, 4.8, 6.3, 6.6–6.7, 7.13 (fine level, universal curve, section-free Abel and difference maps for DGH), 7.15 (stable/level/Picard export for Yuan). JacobianChallengePartII §§0.2–0.4, 1.1–1.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2. PELModuli M5.1–M5.3, M6.9–M6.10. NeronModelsAndSemistableAbelianVarieties §§1.1–1.10, 3.10, 3.13–3.14, 5.1–5.2. TropicalAndBerkovichArithmetic §§6.2–6.4, 7.0 (rank-one Raynaud uniformization with trop: E^an → N_ℝ and the full lattice; the quotient valuation map on A^an, its functoriality and products are what `gap:abelian-valuation-map` adds). ClassicalArithmeticCompletion §3.19 (existence of P with PA in reduced row echelon form and uniqueness under invertible left factors). InverseGaloisAndArithmeticFundamentalGroups Layer IG.2 (Hilbert irreducibility, IG.2.4) and IG.3.1's bold subtarget "Finitely many covers of bounded degree" (line 2585, citing Gao–Habegger Lemma B.2). AlgebraicCurves Layers 10–11 (hyperelliptic models; automorphisms and the Hurwitz bound). JacobianChallenge Layer F (Abel–Jacobi universal property). ArithmeticDynamics §§6.57, 6.64, 6.93, 6.110–6.112. SchemeAndStackFoundations §§0.3, 0.8, 4.11, 4.13–4.14, 5.1–5.6, 5.12. ComplexComparisonPartII C5.1–C5.4. AlgebraicModuliForArithmeticGeometry §§1.5–1.6, 2.1. In total 126 section citations resolved; `roadmaps resolve` reports none missing.

**Declared gaps.** All eight slugs of `design/plan.json` appear in the README under the supplier's contract paragraph with a one-sentence `needs`. Minimality checked against the suppliers: HeightsRationalPointsAndObstructions has no arithmetic interpolation lemma (only "native polynomial interpolation" among §5.9b's needs); ArakelovGeometryAndAbelianHeights has no c_NT/addition-polynomial bounds; SchemeAndStackFoundations §§5.5, 5.12 have no non-proper intersection inequality; TropicalAndBerkovichArithmetic §7.0 stops at trop on E^an. The exception is R01.

**Mathlib declarations opened at the pin (file:line as cited).** `Metric.coveringNumber` (CoveringNumbers.lean:74, ℕ∞-valued, centres in the set), `coveringNumber_le_packingNumber` (:351), `maximalSeparatedSet` (:288), `Metric.IsSeparated` (MetricSeparated.lean:43), `EuclideanSpace` (PiL2.lean:111), `Metric.closedBall` (Pseudo/Defs.lean:418), `addHaar_closedBall` (EqHaar.lean:500, hypothesis 0 ≤ r), `Module.finrank` (Finrank.lean:61), `IntermediateField` (:52), `Algebra.trdeg` (:45), `Submodule.span` (:46), `Matrix.IsReducedRowEchelon` (Echelon/Basic.lean:87), `Projectivization.logHeight` (Height/Projectivization.lean:51); Tau Ceti `baseChange` (Basic.lean:281), `IsIsogeny` (Isogeny.lean:61). All 18 line references are exact.

**Source sample (every target verified at its locator).**

| Target | Source, locator | Result |
|---|---|---|
| 1.7 | ggk-2026 line 646–655, Lemma 3.5, (3.9), p. 203 | S_gen = finite stabilizer and generation; components of the closure satisfy (i)–(iii): as stated |
| 2.1 | dgh-2021 line 194, (Hyp), p. 5; line 625–637, Remark 3.1, p. 13 | principal polarization + level ℓ ≥ 3; projectively normal generic fibre from L^{⊗l}, l ≥ 4, base twist by π^*M: as stated |
| 2.4 | dgh-2021 line 767–911, Prop 4.2, pp. 17–19 | (F^{·d}) ≥ κN^{2d}, κ = κ′/C^d, all N ∈ ℕ: as stated |
| 2.5 | dgh-2021 line 917–1052, Prop 4.3, pp. 19–21 | d ≥ 1, N a power of 2, (M·F^{d−1}) ≤ cN^{2(d−1)}: as stated; (4.13) needs max{1, D′} (errata) |
| 4.5 | ggk-2026 line 871–936, Prop 4.4, pp. 208–210 | (4.10) 8^r d, (4.11) Faltings comparison, (4.12) factor 4, deg_L X′ < deg_{L|A} X′: as stated |
| 5.4 | ggk-2026 line 1755–1768, Thm A.1, p. 227; remond-2000-vojta line 187–190, Thm 1.1, p. 105 | cone and growth hypotheses, bound c₅ max{1, h(X), h_Fal} via (A.1): as stated |
| 5.6 | ggk-2026 line 1790–1821, Prop A.3, pp. 228–229 | alternatives (i)/(ii); source bound strict <, README ≤ (weaker); proof gap in the source (errata), README's repair checked below |
| 5.9 | ggk-2026 line 1455–1459, (7.1), p. 220 | c₀ = c₀(g, deg_L X), every P₀ ∈ X(ℚ̄), threshold c₀^{−1} max{1, h_Fal}, count c₀^{rk Γ+1}: as stated |
| 6.2 | ggk-2026 line 1609–1621, proof of Lemma 7.3, p. 224; masser-1996 line 127–139, Theorem, p. 459 | Θ dense by Masser 1989 Main Theorem/Scholium 1 and Masser 1996 Theorem; ω bounds C(max{d,h})^λ versus exp(ch): as stated |
| 8.2 | gh-2019 line 512–523, Prop 3.1, pp. 12–13; line 2730–2740, Prop B.3, p. 59 | product form (W₀ ⊗ K̄) × (P + B), finitely many maximal, dim S = 1 used only through (3.2), removed by Prop B.1: as stated |
| 9.8 | xy-2022 line 626–645, Lemma 3.7, pp. 16–17; proof line 681–706, p. 18 | ĥ^M_L(X) ≥ ĥ^{M_{k′}|H}_L(X) via naive heights on an ample model; nonnegativity step uses nef π^*M (errata) |
| 9.9 | xy-2022 line 462–468, Prop 3.1, p. 12; proof line 708–726, pp. 18–19 | two pencil fields, k_{A,X} ⊆ k₁ ∩ k₂ = k: as stated |
| 11.3 | yuan-2026 line 2585–2602, §4.4.1, pp. 76–77; line 2668–2680, §4.4.2, pp. 79–80 | fibre count c₂ for h_L̄ ≤ c₁h_M̄(y) by Theorem 4.2 and 4.5(4) with noetherian induction on J: as stated |
| 11.6 | yuan-2026 line 2791–2830, §4.4.3, pp. 83–84 | integral Theorem 4.10 on the universal shift, exceptional set written as Z ⊊ S, positive-characteristic case omitted (errata); README supplies both |
| 12.2 | dky-2020 line 41–44, Thm 1.1, p. 950; line 2046–2053, §9.3, p. 996 | bound 16·B over common torsion images, Weierstrass base points differ by 2-torsion: as stated; Remark 1.2 (line 53–54) gives Stoll's 34 |

Also checked: kuhne-2021 Theorems 2–4 (pp. 6–8); yuan-2026 Theorem 1.1 (line 141–157, p. 5), Theorem 4.7 (line 2372, p. 70), §4.3.1 normalization (line 2417–2424: function-field heights divided by [K′:K] with weights [k(v):k]); david-philippon-2002 Théorèmes 1.2–1.4 (line 106–136, p. 641: q(X) ≤ (2^{16g}h₀(A)^{2/g} deg X)^{(4g²)^{dim X}}, count q(5aq)^{r/2}) and Rémond's theorem (line 183–195, p. 643: (2^{34}h₀(A)deg X)^{(r+1)g^{5(dim X+1)²}}), matching §5.12; yamaki-strict-support Theorem E (line 104, p. 3) and the §§3–6 locators of the four Tropical gaps; masser-1989 Main Theorem and Scholium 1 (line 45–53, p. 414); dky-2020 §9.5 Prop 9.2 (line 2075–2091, p. 997).

**Adversarial pass (one row per statement checked; values computed on each side).**

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Lean `uniform_maninMumford_curves` | g = 1 excluded by hg; D = [Q]: c = −a(Q); D = [x₀]: c = 0 | a(Q)+c = 0 torsion; a(x₀) = η; quantifier order ∃B ∀F ∀c | sound, uniform in F and c |
| Lean `uniform_mordellLang_curves` | ρ = 0, s = ∅; Γ = torsion; Γ = ⟨P⟩ with s = {P} | closure ∅ = {1}, p^n = 1 ⇒ torsion allowed, bound B^1; rank(div hull ⟨s⟩) ≤ |s| | encoding equals rk Γ ≤ ρ |
| Lean `uniform_rationalPoints_curves` | X(F) = ∅ (no x₀, statement void), J(F) finite (ρ = 0) | #X(F) ≤ #(X(F̄) ∩ Γ) ≤ c(g)^{1+ρ}; injectivity of X(F) → J(F̄) via a | sound |
| §0.1 total degree | line ∪ exterior point; line ∪ point on it; Spec k[ε]/ε² in ℙ¹ | 1+1 = 2; 1 < 2 (contained component); 1 versus cycle degree 2 | consistent with the "contained" clause |
| §0.4 packing | ρ = 0; ρ = 1, S = [−r, r], R = r; r = 0 | (1+2R/r)^0 = 1; covering number 1 ≤ 3; division excluded | bound, not equality |
| §1.2 level-4 count and degrees | g = 1 generic E; g = 2 Abel curve | |SL₂(ℤ/4)| = 4³·(3/4) = 48, /|{±1}| = 24; 8^1·2 = 16; ĥ factor 8/2 = 4 | agrees with (4.10), (4.12) |
| §1.6 (iii) necessary | X_s = A_s, dim S > 0 | dim_ℂ = mg + dim S versus real torus 2mg | degenerate for all m |
| §2.6 Siu witness | E with degree-4 embedding, S point, N = 2 | deg F = 4·2² = 16, M = 0, vol ≥ 16 − 0 | positive without ampleness of M |
| §3.5 induction | parallelogram law | ĥ(P−P₀) ≤ 2ĥ(P)+2ĥ(P₀); threshold c/4 ⇒ ≤ c | correct |
| §4.2 base-point bound | g = 1, C = E₀ + P₀ | counted set empty, 84(g−1) = 0 | 0 ≤ 0 |
| §4.6 isogeny rescaling | n = l/g! = 2, exceptional component of dim k = 1 | u^*L ≡ n²L₀ ⇒ degree factor n^{2k} = 4 | matches c′₂ rescaling |
| §4.7 two ranges | c′₁ = c′₃ = c″₃ = 1 | B = 2; H > 2 ⇒ H − 1 ≥ H/2; H ≤ 2 ⇒ c₁ = 1/2 | c₂ = max, not sum |
| §5.6 repaired Prop A.3 | r = 1; r = 2 with i = 0, 1; X = [3]^{−1}Θ, L = 3Θ in a genus-2 Jacobian, Ξ = {0}, x = 0 | D²; D², D⁴ = D^{2r}; i+3 ≤ 2r iff r ≥ 2; Stab = J[3] of degree 81 > D = 27·2 = 54 while X ∩ (X − c) has degree ≤ 54² | the source's per-E_j bound fails, the README's X′ bound holds |
| §5.8 cone count | cos θ = 1 − 1/c₄ | sin(θ/2) = (2c₄)^{−1/2}; (1 + 2/sin(θ/2))^ρ = (1+√(8c₄))^ρ | as stated |
| §5.9 enlarging Γ | Weierstrass Abel curve, Γ = {0} then Γ = ⟨w_i − w⟩ | 1 difference; 2 zero-height differences > 1 | translation-safe, enlargement not |
| §5.10 Step 4 | radii (2c₉H)^{1/2}, (H/c₀)^{1/2} | R/r = (2c₉c₀)^{1/2} | as stated |
| §5.12 David–Philippon constant | genus 2, Weierstrass base point, L = M^{16} | D = 16·2 = 32, (4g²)^1 = 16, Q = (2^{32}h₀·32)^{16} = 2^{592}h₀^{16}; six 2-torsion points ≤ Q; r = 0, a = 2 gives Q | matches Thm 1.4 and (b) |
| §6.2 Legendre section | P = (2, μ), μ² = 2(2−λ) | at λ = 2: (2, 0) of order 2; generically non-torsion | specialization non-injective |
| §6.9 ball count | radii (c₀H)^{1/2}, (H/c₃)^{1/2}, rank ρ+1 | (1+2(c₀c₃)^{1/2})^{ρ+1} | as stated |
| §7.2 minima | d = 1 | e₁ ≥ ĥ(X) ≥ e₁/2 | both directions |
| §8.1 𝔾_m | D given | covers z ↦ zⁿ, n ≤ D; K_D = k(z^{1/lcm(1..D)}) | finite compositum |
| §8.3 naive height | E × ℙ¹, Segre, point (0, [T:1]) | h_ι = 2 log T versus Weil height log T + O(1) | only the two inequalities |
| §9.4 defect induction | d₁, d₂, e, a | trdeg(b,τb,c) = 2e − d₁; δ′ = 2δ − d₁ + a ≤ δ since a ≤ d₁ − δ | as stated |
| §9.3 RREF | span (2, 2a) over ℚ(a) | reduced row (1, a) | descends iff a in the subfield |
| §9.11 class | elliptic scheme, rigidified O(2·0) | deg ℒ_η = 2, deg 𝒯 = 1, class 2[0] | as stated |
| §9.15 index | elliptic subgroup; genus-2 curve through 0 | r = 1; C + C = J, r = 2 | as stated |
| §9.17 nef difference | E × E, L = H₁+H₂, M = H₂, ε = ½ | H₁H₂ = 1, L² = 2, M·L = 1, (M+εL)² = 1 + ½ = 3/2 > 0 = M² | direction and limit allowed |
| §10.1 grid exponent | Z = {a,b,c} × C ⊂ C² | codim 1, degree 3, |Σ| = 3 ≤ 3^{1/1}; 3 ≰ 3^{1/2} | codimension exponent |
| §10.7 threshold | m = 2 | 2·ε/4 = ε/2 < ε | as stated |
| §10.8 m = 1 | genus 2, difference image | C − C = J, torsion dense | m ≥ 2 needed |
| §11.4 Bost constant | c = (g/2)log(2π²)+1 | h_Fal + c ≥ 1 and ≥ h_Fal | as stated |
| §11.7 counterexample to the printed constant | constant genus-2 C₀/k, K = k(C₀), α_N = w + Q_N, NQ_N = η − w | ĥ(Q) = (Θ·C₀)/… = 2 (Poincaré, g = 2); ĥ(Q_N) = 2/N²; ĥ(2Q_N) = 8/N²; h_Fal = 0; d_α·ĥ(Q_N) ∈ ℤ_{>0} ⇒ d_α ≥ N²/2; with ε_α: c₁(2/N² + 8/N²) < 2/N² iff c₁ < 1/5 | the printed constant 1 fails for infinitely many constant points; the README's 1/d_α form holds |
| §12.2/12.3 | lifts and isogeny | 4 × 4 = 16; ĥ_{L_D} = ½(ĥ_{t₁}∘π + ĥ_{t₂}∘π) | matches dky-2020 line 2070–2071 |
| R01 instance | zero polarization over ℚ(t) | nef, vol 0; both sides of §6.4(1) are 0 | covered by the supplier's (1) |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–12 each ending in Examples and Dependencies, Downstream consumers, References. Every definition (0.1, 1.1–1.3, 1.7, 2.1–2.3, 3.1, 5.1–5.2, 5.9, 7.3–7.4, 9.1, 9.10, 9.14, 10.2, 10.6, 11.1) has an API list and at least three Checks; every theorem has hypotheses in the sentence and a locator; every target has a `*Needs:*` line.

## Not verifiable

- remond-2000-vojta Théorème 1.2 (p. 106): the explicit constants c₁, c₂, c₃ quoted in §5.4 are display formulas that the Numdam extraction lost (line 223–226 are empty of symbols); the statement's shape and Théorème 1.1 were checked, the numerical exponents were not.
- remond-2000-decompte (Lemma 3.1, Propositions 3.3–3.4) and david-philippon-2007 (Theorem 6.8, (6.41)): settled as uncertified; checked through their restatements in ggk-2026 Appendix A (lines 1749–1833) and david-philippon-2002 p. 643.

## Source issues

- **Gap** in ggk-2026 at Proposition A.3, proof, printed p. 229 (line 1817–1819): the source says each ⋂_{c∈C_j}(X − c) is an intersection of at most dim X translates, so has degree ≤ (deg X)^{dim X}; it should be bounded through X ∩ (X − c_j) of degree ≤ (deg X)², since for X = [3]^{−1}Θ in a genus-2 Jacobian the intersection is J[3] of degree 81 > 54 = deg X; affects the proof (the stated bound survives with the README's §5.6 argument).
- **Error** in ggk-2026 at proof of Theorem 1.1′ for arbitrary F, printed p. 224 (line 1631): the source says a finitely generated Γ₀ of rank ρ with Γ ⊆ div hull(Γ₀) may be chosen End(A)-stable; it should drop that clause, since for E with CM by ℤ[i] and Γ = ℤP every End-stable Γ₀ containing a multiple of P has rank 2; affects nothing (the clause is unused).
- **Misprint** in dgh-2021 at (4.13), p. 21 (line 1034–1045): the source says the mixed intersection is at most (4^l D′)^{d−1} times a sum; it should read (4^l max{1, D′})^{d−1}, since the terms with p″ = 0 carry D_l^{i″} = 4^{l i″} and no factor D′; affects nothing (D′ ≥ 1 may be assumed).
- **Error** in yuan-2026 at Theorem 1.1, p. 5, and Theorem 4.7, p. 70, with the step at §4.4.2, p. 81 (line 2734–2735): the source says the function-field bound with max{h_Fal(C), 1} holds for every α ∈ Pic¹(C_K̄) "by extending K"; it should use 1/[K(α):K] in place of 1, since passing to K(α) rescales every height but not the constant, and a constant genus-2 curve with α_N = w + Q_N, NQ_N = η − w, has infinitely many constant points of height 2/N² below c₁(1 + 8/N²); affects a stated result (the number-field case and α ∈ Pic¹(C) are unaffected).
- **Gap** in yuan-2026 at §4.4.3, pp. 83–84 (line 2806–2809 and 2825–2830): the source says Theorem 4.10 applied to q₁ : X_J → J yields an exceptional closed Z ⊊ S, and omits the characteristics dividing N′; it should run the noetherian induction on closed subsets of J as in §4.4.1 and supply a uniformity argument over all constant fields of each exceptional characteristic; affects the proof (the README's §11.6 supplies both).
- **Gap** in xy-2022 at proof of Lemma 3.7, p. 18 (line 703–705): the source says the residual effective cycle contributes nonnegatively "as L and M are ample"; it should say π_H^*M_H is base-point free, hence nef, and cut by general members before using ampleness of L, since the pulled-back base bundle is not ample on 𝒜_H; affects the proof (minor; the README's §9.8 route does this).

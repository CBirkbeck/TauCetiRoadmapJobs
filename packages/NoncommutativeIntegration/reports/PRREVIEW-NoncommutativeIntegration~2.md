# Review of NoncommutativeIntegration (pull request #864 at bb121b3)

**Verdict:** accepted

The gate passes at this head (every check OK; `lake env lean` on `TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean` gives the five intended `sorry` warnings and nothing else). The dependency check reports `depcheck: 200 roadmaps, 1320 edges, 0 problem(s)` with no UPWARD or CYCLE line for NoncommutativeIntegration (line 276 of the merge order, after VonNeumannAlgebras at line 4). The folder is a full rewrite since the previous review (1554 insertions, 778 deletions), so every section was reviewed. The previous review's four findings are repaired (see "Repair of the previous findings"). The five findings below are P3: wrong computed values in Checks, locators into the wrong theorem or section, and a mis-stated negative control. None changes a statement, a hypothesis or an owner.

## Repair of the previous findings

- R01 (P2, absent headline theorems): repaired. `Suggested.lean` now states `matrix_khintchine_low` (1 ≤ p < 2, lines 88–95), `matrix_khintchine_one` (p = 1 with the constant `(Real.sqrt 3)⁻¹`, lines 97–101), `matrix_ball_carlen_lieb_low` (1 < p ≤ 2, lines 104–109) and `matrix_ball_carlen_lieb_high` (2 ≤ p, lines 112–117), on the same matrix carriers, with `rowColumnSumGauge` the `sInf` over decompositions `a = b + c` (lines 69–71). The module docstring (lines 7–25) names Haagerup's reduction theorem, the duality and interpolation isomorphisms, the Haagerup construction, Kosaki's theorem, Burkholder–Gundy, Stein, UMD and H¹–BMO as not statable and says which carrier is missing.
- R02 (P3, padding): repaired. The ten declarations named there (`CompatibleCouple`, `sumCarrier`, `kFunctional` and its two lemmas, `matrixLpGauge_two`, `randomSumGauge_two`, the two sequence projections and their lemma) are gone; the file has five definitions and five theorems.
- R03 (P3, README shape): repaired. 38 `### k.n` subsections, each with a `*Needs:*` line (38) and a `**Checks.**` list (38, every definition with at least three); `## Exact supplier contracts` per supplier; `### Examples` and `### Dependencies` in every layer; `## Downstream consumers`; namespace `TauCetiRoadmap.NoncommutativeIntegration` (Suggested.lean line 32); the docstring in the "target signatures" form; all ten Lean names appear in the README (Conventions, §5.5, §6.1, §6.2, §6.3, §7.5).
- R04 (P3, locators and attributions): repaired. The Haagerup–Musat Invent. Math. paper is gone (`grep -i effros README.md` finds nothing); the p = 1 constant is attributed to Haagerup–Musat 2007, Theorem 2.11 and Proposition 2.12, and the fourth-moment lemma to Pisier 1978 and Haagerup 1985 (§6.3, References). Fack–Kosaki Lemma 4.1, Lemma 4.3, Theorem 4.4, the K-functional formula after 4.4, Theorem 4.7(i) and the proof of Theorem 4.9(iii) are now cited at the claims (§1.4, §2.2, §2.5, §3.3). Haagerup 1978 II is cited as Theorem 3.1(b),(d) for the operator-valued weight (§3.2) and the characterization as Hiai, Lemma 11.2(3). Tau Ceti's Marcinkiewicz declarations are named in the supplier contract and PDE item 9 is cited for Riesz–Thorin only. BanachSpaceTheory B2 is cited for Milman–Pettis with the scalar estimates, and §5.5 says it proves the noncommutative ones.

## R01 (P3) — Wrong value in the §2.4 real-interpolation Check

Location: `TauCetiRoadmap/NoncommutativeIntegration/README.md` line 509, "`∫ t^(−1)min(t,1)² dt/t=∫₀¹ t dt+∫₁^∞ t^(−2) dt=1/2+1=3/2`".

Claim: for f = 1_(0,1), the `(1/2,2)` gauge squared is 3/2.

Witness: the integrand is `t^(−1)·min(t,1)²·t^(−1) = t^(−2)min(t,1)²`; on (0,1) this is `t^(−2)·t² = 1`, so the first integral is `∫₀¹ 1 dt = 1`, not `∫₀¹ t dt = 1/2`; on (1,∞) it is `t^(−2)` with integral 1. The value is 2.

Repair: replace the display by `∫ t^(−1)min(t,1)² dt/t=∫₀¹ 1 dt+∫₁^∞ t^(−2) dt=1+1=2`, finite, matching `‖f‖₂=1` up to the equivalence constant. The conclusion of the Check (finiteness, equivalence with L²) is unchanged.

## R02 (P3) — Locators for the tracial subunit range point at the Haagerup-space theorem and at p ≥ 1

Location: `README.md` line 281, "(Fack–Kosaki, Theorem 4.9(iii); Hiai, Lemma 5.3 and Theorem 5.10)" for the p-triangle inequality and completeness of `d(x,y)=‖x−y‖_p^p`, 0 < p < 1, on Lp(M,τ); and Layer 1 `### Examples` line 391, "M̃ is the algebra of measurable functions finite outside sets of finite measure".

Claim: the cited theorems state the tracial subunit facts.

Witness: Fack–Kosaki §4 after Lemma 4.8 (fk86 lines 853–857) proves "norm inequalities of the Haagerup Lp(M)", with μ_t relative to the canonical trace on the crossed product; Theorem 4.9(iii) (line 871) is the p-triangle inequality for Haagerup Lp, which §3.3 correctly consumes. Hiai Theorem 5.10 (hiai line 2221) is "for every p ∈ [1,∞]"; Lemma 5.3 (line 1939) gives only the linear-subspace and bounded-multiplier laws for 0 < p ≤ ∞. Neither source cited at the claim states completeness of the tracial p-metric below 1. For the example: `f = n` on (n, n+1) is finite everywhere yet `μ(|f| > λ) = ∞` for every λ, so f is not τ-measurable; the right phrase is "bounded outside a set of finite measure" (Hiai Definition 4.6, line 1462).

Repair: in §1.3 cite Fack–Kosaki, Theorem 4.7(i) with g(s) = s^p and t → ∞ (the direct route; the r ↑ p limit is needed only in §3.3) for the tracial p-triangle inequality, and give completeness its own route (Cauchy in the p-metric implies Cauchy in measure by the comparison stated in the same section, then Fatou for μ_t, Fack–Kosaki Lemma 3.4(i)) with that locator; in the Layer 1 example write "bounded outside a set of finite measure".

## R03 (P3) — The §1.2 negative controls do not refute what they say they refute

Location: `README.md` line 265, "a definition allowing `τ(1−e)<δ` with δ=1 would admit rank-one cuts and give a strictly coarser topology on M₂(ℂ)"; lines 271–272, "the product law ... a law with `max(δ₁,δ₂)` in place of the sum is false ... x=1_(0,1)·n and y=1_(1,2)·n ... with x+y∉V(ε,1)".

Claim: the strict inequality admits rank-one cuts; the witness refutes the product law with max.

Witness: a rank-one cut in M₂(ℂ) with the unnormalized trace has `τ(1−e) = 1`, which satisfies `≤ 1` and fails `< 1`: it is the stated definition at δ = 1 that admits it, and the strict variant that excludes it. Either way the topology generated by all `V(ε,δ)`, δ > 0, is the norm topology (δ < 1 forces e = 1), so no variant of the endpoint gives a coarser topology. The second witness computes `x + y`, so it refutes `max` in the sum law `V(ε₁,δ₁)+V(ε₂,δ₂)⊆V(ε₁+ε₂,δ₁+δ₂)`; for the product law `xy = 0` and nothing is refuted.

Repair: replace the first control by one that is wrong for a different reason, for instance "a definition using a single fixed δ (say `V(ε,1)` alone) would be strictly coarser on M₂(ℂ), since `e₁₁ ∉ V(ε,1)` fails for no ε", or drop it; label the second witness as the sum law's negative control and, for the product law, note that with `max(δ₁,δ₂)` the same x = n·1_(0,1) and y = n·1_(1,2) give no counterexample because xy = 0, so the sum of the δ's is forced by sums, not products.

## R04 (P3) — Check values in §7.2 and §8.4 use the unnormalized trace under the layer's τ(1) = 1 convention; one wording in §4.3

Location: `README.md` line 1180, "`‖x‖_(H_C^p)=‖x‖_(H_R^p)=1=sup_n‖x_n‖_p`" for x = e₁₂ in the filtration of §7.1 (M₂(ℂ) with tr/2, line 1159); line 1391, "`‖a‖₁=1≤√2·‖a‖_(H¹)=√2·1`"; line 821, "adjoint to each other but not inverse".

Claim: the stated values 1.

Witness: with τ = tr/2, `‖e₁₂‖_p = τ(e₂₂)^(1/p) = (1/2)^(1/p)`, `‖dx₂‖_(H_C^p) = ‖e₂₂‖_p = (1/2)^(1/p)` and `‖a‖₁ = τ(e₂₂) = 1/2`; the equalities and the endpoint bound hold with these values (`1/2 ≤ √2·(1/2)`), so only the numbers are off. In §4.3 the two maps are the preadjoints of the inclusion N → M and of E respectively; `ι_*∘E_* = id` on N_* (on the example, `c ↦ (c/2,c/2) ↦ c`), so they are one-sided inverses, and "adjoint to each other" is not the relation between them.

Repair: write `(1/2)^(1/p)` in §7.2 and `‖a‖₁=1/2≤√2·‖a‖_(H¹)=√2·(1/2)` in §8.4 (or state that these two Checks use the unnormalized trace); in §4.3 write "the preadjoints of ι and of E respectively, with `ι_*∘E_* = id` on N_* and `E_*∘ι_* ≠ id`".

## R05 (P3) — Locators into Cwikel's notes and two unlocated or loosely cited claims

Location: `README.md` line 455, "(Bergh–Löfström, §4.1; Cwikel, §2.1)" for the strip construction; line 465, "(Cwikel, §2.2; Bergh–Löfström, §4.1)" for the upper method; line 467, "Prove that the lower and upper methods coincide with equal norms when one endpoint is reflexive" (no locator); §6.3 lines 1098–1099, "the operator Cauchy–Schwarz inequality ... (CStarAlgebras C3)".

Witness: cwikel §2.1 (line 289) is a preface that refers the definitions of `[X₀,X₁]_θ` and `[X₀,X₁]^θ` to Calderón's paper; §2.2 (line 425) is "Preliminaries, mainly about scalar valued analytic functions"; Cwikel's own definitions are §2.3 (line 879, the lower space) and §2.4 (line 1111, Definition 2.21, the upper method), and Calderón's duality theorem is Theorem 2.2 (line 319). The reflexive-endpoint coincidence is Bergh–Löfström, Theorem 4.3.1 (Calderón 1964, §9.2), which the References entry does not list. CStarAlgebras C3 at its head (lines 459–496) has "finite row/column matrix norm formulas" but not the inequality by that name; the inequality is the factorization `∑u_αv_α = [u_α]·[v_α]ᵀ` through those formulas. (CStarAlgebras C4 line 504 states "the Schwarz inequality for unital 2-positive maps", which is what §5.5 calls Kadison–Schwarz: that citation resolves.)

Repair: cite Cwikel §2.3 (and Calderón via Bergh–Löfström §4.1) for the lower method, Cwikel §2.4 (Definition 2.21) for the upper method, Cwikel Theorem 2.2 for the duality; add Bergh–Löfström, Theorem 4.3.1, at the reflexive-endpoint claim and in the References entry; in §6.3 say "the row–column factorization of CStarAlgebras C3's finite row/column norm formulas".

## Verified sound

**Principles.** No route-specific shortcut: Khintchine (§6.3, §7.5, §8.3), Burkholder–Gundy (§7.3, §8.2), Ball–Carlen–Lieb (§5.5) and the Haagerup construction (§3) are stated for every von Neumann algebra, with the finite-tracial and matrix cases as Checks. No re-planned roadmap: VonNeumannAlgebras V10.TracialLp at the head of #889 (lines 2167–2192) owns Lp(M,τ) for 1 ≤ p < ∞ with completeness, Hölder, L¹ = M_* and L² = GNS, exactly as §1.3 says, and nothing in V10–V11 builds singular numbers, the measure topology, 0 < p < 1, interpolation, Haagerup Lp norms, Kosaki's theorem, the reduction theorem or martingale inequalities. No copied passages; no algorithms; no sorry'd data; no `set_option`; the two `local instance` lines (Suggested.lean 37–43) are instance selections, not overrides. No edit outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeIntegration'` is empty); metadata.toml is `topic = "math.OA"`. No process words, pull-request numbers, `lemma`, LaTeX delimiters or local paths in the README (grep for each).

**Ownership against open work.** `roadmaps grep` over main and the 432 open pull requests for Khintchine, Burkholder, "Haagerup L", UMD, Clarkson, K-functional, Riesz–Thorin, "measure topology", Ball–Carlen, Lorentz, Kosaki, τ-measurable: every hit outside this folder is a different object (free and classical Lévy–Khintchine in FreeProbability/StandardDistributions; the commutative Burkholder–Davis–Gundy inequality in StochasticCalculus #1030; the weak measure topology in ColemanPowerSeries/PadicMeasuresIwasawaAlgebras; the scalar Riesz–Thorin in PDE on main and ComplexKahlerGeometry; "UMD" as a letter string in cohomology roadmaps; Kosaki's index in Subfactors #874). No other roadmap declares any of the ten fully qualified names. Two open pull requests carry a VonNeumannAlgebras folder (#889 with V0–V13, #1041 with V0–V4); every V-citation here was resolved at #889's head, which the merge order's VonNeumannAlgebras entry (line 4) precedes this roadmap.

**Supplier citations resolved** (every one, at the copy named). VonNeumannAlgebras at #889: V2 (line 486), V4.Core / V4.PositivePredual / V4.Normality (898, 984, 1049), V5 comparison and halving (1202–1222), V6 `JMJ=M′` (1350; line 180 of that layer), V7.Index (1698), V8 discrete crossed products with the expectation extracting the identity coefficient (1772; line 144 of that layer), V10.ClosedOperators / V10.Affiliation / V10.TracialLp / V10.ModularTheory (2093, 2134, 2167, 2193), Layer 11: tensor-product weights (2672–2684), Pedersen–Takesaki (2866), Takesaki's expectation theorem naming "NoncommutativeIntegration I4" as the owner of the Lp inclusions (2888–2896), dual fixed-point theorem (3082–3085), continuous core with `θ_s(u_t)=exp(i s t)u_t`, `Tr∘θ_s=exp(s)Tr`, `T(x)=∫θ_s(x)ds` and the cocycle isomorphism (3093–3100). BanachSpaceTheory on main: B1 (line 41: Goldstine 61), B2 (74: Eberlein–Šmulian 79, James 85, Milman–Pettis with the scalar Lᵖ estimates 100–103). CStarAlgebras at #860: C3 (459), C4 (497, Schwarz inequality 504), C5 (546). OperatorTheory on main: OperatorIdeals Part A (108), Part B with the Schatten scale (282, 97), Majorization MAJ-A28 (179), MAJ-A31 (185). PDE on main item 9 (273–275). Downstream consumers: FreeProbability README lines 64 and 435 cite I4; NoncommutativeGeometry line 59 cites I1.

**Library declarations opened at the pins.** Mathlib: `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean` 94), `CStarMatrix` and `CStarMatrix.ofMatrix` (`Analysis/CStarAlgebra/CStarMatrix.lean` 44, 54), `CFC.nnrpow`, `CFC.sqrt`, `CFC.rpow` (`…/ContinuousFunctionalCalculus/Rpow/Basic.lean` 86, 231, 396), `IsSelfAdjoint.instNonUnitalContinuousFunctionalCalculus` (`…/Instances.lean` 216), `CStarAlgebra.instNonnegSpectrumClass'` (`…/Basic.lean` 430), `ENNReal.HolderTriple` and `ENNReal.HolderConjugate` (`Basic/ENNReal/Holder.lean` 42, 46), `MeasureTheory.condExp` (`…/ConditionalExpectation/Basic.lean` 101), `MeasureTheory.Filtration` (`Probability/Process/Filtration.lean` 50), `MeasureTheory.Martingale` (`Probability/Martingale/Basic.lean` 53), `UniformConvexSpace` (`Analysis/Convex/Uniform.lean` 39), `Complex.HadamardThreeLines.norm_le_interpStrip_of_mem_verticalClosedStrip` (`Analysis/Complex/Hadamard.lean` 593), `DiffContOnCl` (`Analysis/Calculus/DiffContOnCl.lean` 31), `StrongDual`, `WeakDual`, `VonNeumannAlgebra` (67), `WStarAlgebra` (45), `Submodule.Quotient`. Absence claims confirmed by grep: no Riesz–Thorin, Khintchine/Kahane, Clarkson, cotype or interpolation space in Mathlib. Tau Ceti: `TauCeti.lintegral_rpow_le_of_mul_meas_ofReal_lt_le` (`MeasureTheory/Integral/Marcinkiewicz/Basic.lean` 232), `…_of_le_eLpNormEssSup` (369), `TauCeti.lintegral_rpow_le_of_meas_ofReal_lt_le` (`General.lean` 416), `TauCeti.meas_ofReal_lt_le_add_setLIntegral` (469); no Riesz–Thorin, Schatten or noncommutative Lp module (the only "Khintchine" hits are Lévy–Khintchine).

**Lean.** `lake env lean` on `Suggested.lean`: five `sorry` warnings (lines 76, 88, 97, 104, 112), nothing else. `#check @name` for all ten declarations on a scratch copy: each elaborated type agrees with the README statement and with the worker's signatures; no section binder is lost (the only variables are `{d n : ℕ}`, which every type mentions). One-tactic probe on the scratch copy: each of the five theorems tried with `simp`, `rfl`, `infer_instance`, `norm_num`, `positivity`, `decide`; none closes (all five fall through to `sorry`). No padding: the five definitions are exactly what the headlines need. Imports: `import Mathlib` only. Junk values: `matrixLpGauge 0 x` is irrelevant (every theorem has p ≥ 1); d = 0 and n = 0 give 0 on every side (computed in the table).

**Sources verified at their locators** (seeded sample, 15 sections; each theorem number, page and hypotheses read in the cached text):
1. §1.4: fk86 Theorem 4.2(i)–(iii) (lines 605–609: Hölder for p,q,r > 0, pointwise product bound, log-submajorization for increasing f with t ↦ f(eᵗ) convex); Lemma 4.1 (562–567: projection variational formula, "no minimal projection"); Lemma 4.3 (675–677); Theorem 4.4(ii) (680–682); Theorem 4.7(i) (808–810, increasing concave g with g(0) = 0); proof of Theorem 4.9(iii) (877–881, `g(s)=s^{p'}`, p' ↑ p). moslehian line 98–99: `s(A+B) ≺_w s(A)+s(B)` attributed to Fan 1951 ✓.
2. §1.5: hiai Example 5.2 (1934–1938: Schatten class and ordinary Lp) ✓; fk86 Lemma 4.8 (855) for the matrix formula's Haagerup analogue.
3. §1.6: Bergh–Löfström §1.3 not readable (below).
4. §2.1: hiai Theorem 5.13 (2298–2299), Corollary 5.14 (2335–2336: M_* = L¹ with positivity), Proposition 5.7 (2160–2161: `τ(ab)=τ(ba)` for 1/p+1/q = 1) ✓.
5. §2.2: cwikel Definition 1.1 (75–78: two Banach spaces continuously included in a Hausdorff TVS) and Definition 1.3 (109–113: regular couple) ✓; fk86 formula after Theorem 4.4 (702–724: `∫₀ᵗ μ_s = inf(‖T₁‖₁+t‖T₂‖_∞)`) ✓.
6. §2.3: cwikel Theorem 2.2 (319–328: `([X₀,X₁]_θ)^# = [X₀^#,X₁^#]^θ` isometrically, regular couple) ✓; §2.1/§2.2 locators off (R05).
7. §2.4: Bergh–Löfström not readable; Tau Ceti declarations exist (above); Check value corrected (R01).
8. §2.5: fk86 K-functional formula (702–724) ✓; Pisier–Xu Handbook not readable.
9. §3.2: hiai Lemma 11.2(1)–(3) (5157–5164: `φ ↦ φ̂` bijection onto θ-invariant weights with `s(φ̂)=s(φ)`), Lemma 11.3 (5215–5222: h_φ measurable iff φ bounded, via `τ(e⊥_1)=φ(1)`), Theorem 11.5(a)–(c) (5303–5312), Definition 11.6 (5342–5353: `tr(h_φ)=φ(1)`, `‖a‖₁=tr|a|`, `|tr a|≤‖a‖₁`), (11.7) (5355), Theorem 10.13 (4817). haagerup78b Theorem 3.1(b),(d) (409–425: `T=sup E_φ` an n.f.s. operator-valued weight, `φ̂=(φ∘π⁻¹)∘T`). haagerup79 (OCR, now readable) Theorem 1.2 (79–86: densities of normal semifinite weights, measurable iff bounded), Theorem 1.3 (88–93: linear extension to M_*), Definition 1.4 (98–101: L¹(M) and tr), Proposition 1.5 (102–104: isometry) ✓.
10. §3.3: hiai Lemma 11.14 with (11.9) (5426–5442: `N(ε,δ)∩Lp={‖a‖_p≤εδ^{1/p}}`, `μ_t(a)=t^{−1/p}‖a‖_p`, all 0 < p < ∞), Remark 11.9 (5377–5382), Theorem 11.22 and Remark 11.23 (5551–5572: Hölder by the three-lines route, and the real-analytic route through (11.9), which is §3.3's), Proposition 11.24 (5573–5577), Theorem 11.25(a),(c) (5588–5594), Lemma 11.16 (5448–5449) ✓.
11. §3.5: hiai Remark 11.10 (5383–5401: `κ=Ad U` carries θ, T, τ and Lp across weights), Example 11.11 (5402–5412: `h_φ = dφ/dτ ⊗ e^{−t}`, `Lp(M)=Lp(M,τ₀)⊗e^{−t/p}` isometrically, in Hiai's sign) ✓.
12. §4.1: hiai Lemma 12.5 (6081–6084: `σ^φ_t = Ad h_φ^{it}` on the support) ✓; hjx §5 (823–1001) uses Kosaki's theorem in the form `D^{1/2p} m D^{1/2p}` dense (996–997) ✓; Kosaki 1984 not readable.
13. §4.3: hiai Theorem 6.4 (2592–2599: Umegaki's expectation, finite trace) and Theorem 6.6 (2698–2704: Takesaki, faithful normal state, invariance iff expectation); hjx (6.5) (1098–1099: `E(axb)=aE(x)b`, `1/p+1/q+1/r ≤ 1`) ✓.
14. §5.5: hiai Proposition 5.11 (2285–2288: Clarkson for 2 ≤ p < ∞ and McCarthy for 1 < p ≤ 2) and Proposition 11.26 (5608–5617, Haagerup case p ≥ 2); rx14 Theorem 2 (63–65: every von Neumann algebra, 1 < p ≤ 2, reversed for 2 < p < ∞) ✓.
15. §7.2: px97 lines 187–226 (column/row subspaces, `‖(∑a_n*a_n)^{1/2}‖_p=‖∑a_n⊗e_{n1}‖_p`), 345–361 (H_C^p, H_R^p, H^p as sum for 1 ≤ p < 2 with (1.7), intersection for p ≥ 2 with (1.8)) ✓.
Also read: hjx (2.2)–(2.3) and the branch `0 ≤ Im Log < 2π` (332–338), Theorem 2.1 (295), Lemma 2.4 (344), Lemma 2.7 (521), Remark 2.8 (535–548), Theorem 3.1 and Remarks 3.2–3.4 (564–640), Theorem 6.8 (1367–1371), Lemma 6.11 (1448–1449); px97 Theorem 2.1 (371–374), Theorem 2.3 (397–402), Theorem 2.8 (717–735), Appendix definitions and (A1)–(A3) (1422–1461, 1637–1642); pisierGT Theorem 9.1 (1403–1410), (9.10)–(9.12) (1449–1479), Lemma 9.2 (1432–1435), Theorem 9.5 (1582–1587); hm07 Theorem 2.11 (705–709) and Proposition 2.12 (714); hiai Lemma 4.11, Theorem 4.12, Example 4.13 (1519–1584), Proposition 4.17(1)–(10) (1658–1671), Proposition 4.18 (1737), Proposition 4.21 (1839–1845), Lemma 5.3, Theorem 5.10 (1939, 2221), Lemma 11.1 (5127), Definition 11.7 and Proposition 11.8 (5360–5372), Lemma 11.12 (5413), Proposition 11.20 (5509), Lemma 11.27 (5618), Theorems 11.28, 11.30, Remark 11.31 (5642, 5670, 5760), Theorem 10.15 (5031).

**Adversarial pass.** One row per statement; values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §1.1 `μ_t(x)=s_⌊t⌋(x)`, unnormalized trace | x = diag(3,1), t ∈ (0,1), [1,2), ≥ 2 | d_x = 2, 1, 0 on λ < 1, [1,3), ≥ 3; μ = 3, 1, 0 | ✓ | none |
| §1.1 normalized trace | same, t = 1/2 | `d/2 ≤ 1/2` ⟺ `#{s_j>λ} ≤ 1`: μ = 1 = s_⌊2·½⌋ | ✓ | none |
| §1.1 right continuity | f = 1_(0,1/2) on (0,1), t = 1/2 | d_f(λ) ≤ 1/2 for all λ ≥ 0: μ_{1/2} = 0; t < 1/2: μ = 1 | ✓ | none |
| §1.1 shifted sum law | x = e₁₁, y = e₂₂, s = t = 1/2 | μ₁(1) = 1 ≤ 1+1; unshifted t = 1: μ₁(1) = 1 > 0+0 | ✓ | none |
| §1.1 `μ_t(f(|x|))=f(μ_t(x))`, f(0) ≠ 0 | f = λ²+1, t ≥ 2 | left 0 (trace 2), right 1 | ✓ fails as stated | none |
| §1.2 `V(ε,δ)` on M₂, δ < 1 | e ≠ 1 | τ(1−e) ≥ 1 > δ: e = 1, norm ball | ✓ | none |
| §1.2 rank-one cut at δ = 1 | e = e₁₁ | τ(1−e) = 1: admitted by `≤ 1`, excluded by `< 1` | ✗ control reversed | R03 |
| §1.2 `x_n = n1_(0,1/n)` | e = 1−1_(0,1/n) | x_n e = 0, τ(1−e) = 1/n: x_n ∈ V(ε,1/n), ‖x_n‖_∞ = n | ✓ | none |
| §1.2 sum law with max | x = n1_(0,1), y = n1_(1,2), ε < n | each in V(ε,1); x+y needs τ(1−e) ≥ 2 | ✓ for sum, xy = 0 for product | R03 |
| §1.2 Fatou | x_n = 1_(n,n+1) | τ(0) = 0 < liminf 1 | ✓ | none |
| §1.3 p-triangle in ℓ^{1/2} | x = e₁, y = e₂ | ‖x+y‖^{1/2}_{1/2} = 2 = 1+1; ‖x+y‖_{1/2} = 4 > 2 | ✓ | none |
| §1.3 `x_n = n^{1/p}1_(0,1/n)` | p = 1, 2 | ‖x_n‖_p = 1; support 1/n → 0 | ✓ no converse | none |
| §1.3 `V(ε,δ)∩Lp ⊇ {‖x‖_p ≤ εδ^{1/p}}` | x = ε1_(0,δ) | ‖x‖_p = εδ^{1/p}; boundary of V | ✓ | none |
| §1.3 completeness 0 < p < 1 locator | — | fk86 4.9 is Haagerup Lp; hiai 5.10 is p ≥ 1 | ✗ locator | R02 |
| §1.4 Ky Fan at k = 1, 2 | x = e₁₁, y = e₂₂ | s(x+y) = (1,1), s(x) = s(y) = (1,0): 1 ≤ 2, 2 ≤ 2 | ✓ | none |
| §1.4 not weak submajorization | a = (1,1) ≺_w b = (2,0), g = √ | 2 > √2 | ✓ | none |
| §1.4 concave inequality | x = e₁₁, y = e₁₂, g = √, t = 1 | s(x+y) = (√2,0): 2^{1/4} ≈ 1.19 ≤ 2 | ✓ | none |
| §1.4 Hölder constant 1 | ℂ², x = y = (1,1), p = q = 2 | ‖xy‖₁ = 2 = √2·√2 | ✓ | none |
| §1.5 finite-trace inclusion | ℂ², x = (1,1), p = 1, q = 2 | 2 ≤ 2^{1/2}·√2 = 2; exponent reversed gives 2 ≤ 1 | ✓ | none |
| §1.5 no inclusion for infinite trace | (1/n) ∈ ℓ²∖ℓ¹; t^{−1/2}1_(0,1) ∈ L¹∖L²; 1_(1,∞)/t ∈ L²∖L¹ | ∑1/n² < ∞, ∑1/n = ∞; ∫₀¹t^{−1/2} = 2, ∫₀¹t^{−1} = ∞; ∫₁^∞t^{−2} = 1, ∫₁^∞t^{−1} = ∞ | ✓ | none |
| §1.5 Schatten values | x = diag(3,1) | ‖x‖₁ = 4, ‖x‖₂ = √10, ‖x‖_∞ = 3; normalized 2, √5, 3 | ✓ | none |
| §1.5 S_p, 0 < p < 1 | diag(1/n), p = 1/2 | ∑n^{−1/2} = ∞; diag(1/n²) ∈ S₁ | ✓ | none |
| §1.6 weak Lp ⊋ Lp | f = t^{−1/p} | sup t^{1/p}t^{−1/p} = 1; ∫dt/t = ∞ | ✓ | none |
| §1.6 q = p recovers ‖·‖_p | — | `(t^{1/p}μ_t)^p/t = μ_t^p` | ✓ | none |
| §1.6 weak L¹ of diag(3,1) | t ∈ (0,1), [1,2) | sup 3t = 3, sup t·1 = 2: 3; ‖x‖₁ = 4 | ✓ | none |
| §2.1 L¹ dual is M, not M* | ℓ∞ | (ℓ¹)* = ℓ∞; (ℓ∞)* ⊋ ℓ¹ | ✓ | none |
| §2.1 norming element | x = diag(3,1), p = 2 | τ(x·x/√10) = 10/√10 = √10 | ✓ | none |
| §2.1 cyclicity | x = e₁₂, y = e₂₁ | τ(e₁₁) = 1 = τ(e₂₂) | ✓ | none |
| §2.2 K-functional | f = 1_(0,1) on (0,∞) | K(t,f) = ∫₀ᵗ f* = min(t,1); (E,E): min(1,t)‖x‖ | ✓ | none |
| §2.2 non-regular (c₀,ℓ∞) | — | c₀ ∩ ℓ∞ = c₀ not dense in ℓ∞ | ✓ | none |
| §2.3 `[L¹,L∞]_θ = L^p`, 1/p = 1−θ | θ = 1/2 | p = 2; convention 1/p = θ gives the same at 1/2 only | ✓ | none |
| §2.3 `[ℓ∞₂,ℓ²₂]_{1/2} = ℓ⁴₂` | — | 1/q = 0 + 1/4 | ✓ | none |
| §2.3 operator estimate 2^θ | T = id: (E,E) → (E,E′), ‖·‖₁ = 2‖·‖ | f(z) = 2^{θ−z}x: boundary norms 2^θ‖x‖, 2·2^{θ−1}‖x‖; three lines on φ gives ‖x‖ ≤ 2^{−θ}‖x‖_θ; ‖T‖_θ = 2^θ = 1^{1−θ}2^θ | ✓ | none |
| §2.4 (E,E)_{θ,q} | θ ∈ {0,1} | ∫₀¹ t^{−θq}dt/t diverges at θ = 0; ∫₁^∞ t^{(1−θ)q}dt/t at θ = 1 | ✓ | none |
| §2.4 (L¹,L∞)_{1/2,2} value | f = 1_(0,1) | integrand t^{−2}min(t,1)²: ∫₀¹1 + ∫₁^∞t^{−2} = 1+1 = 2, not 3/2 | ✗ value | R01 |
| §2.4 (L¹,L∞)_{θ,∞} = weak Lp | f = t^{−1/p}, p > 1 | K = t^{1−1/p}/(1−1/p); sup t^{−θ}K < ∞ iff θ = 1−1/p | ✓ | none |
| §2.5 exponent convention | p₀ = 1, p₁ = ∞, θ = 1/4 | (1−θ)/1 = 3/4 → p = 4/3; swapped: 1/4 → p = 4 | ✓ | none |
| §2.5 retraction K | x = diag(3,1) | K = 3t, 2+t, 4; K(1) = 3 = ‖diag(2,0)‖₁+‖1‖_∞ | ✓ | none |
| §2.6 scalar case | ℓ¹_N → ℓ∞_N norm 1, ℓ∞_N → ℓ¹_N norm N | θ = 1/2: bound √N vs actual 1 | ✓ not sharp | none |
| Conventions / §3.2 sign of θ_s(h_ω) | Tr∘θ_s = eˢTr, ω̂ θ-invariant | Tr(hθ_s y) = Tr(hy) = eˢTr(θ_{−s}(h)y) ⇒ θ_s(h) = eˢh; Lp character e^{s/p} | ✓ (Hiai has e^{−s} with τ∘θ_s = e^{−s}τ, 5036–5037, 5362) | none |
| §3.1 semifinite core | R = M⊗̄L∞(ℝ), θ_s f(u) = f(u−s), Tr = τ⊗eᵘdu | Tr∘θ_s = eˢTr; θ_s(x⊗e^{−u/p}) = e^{s/p}x⊗e^{−u/p} | ✓ | none |
| §3.1 Lp ∩ Lq = 0 | p ≠ q | e^{s/p}x = e^{s/q}x ∀s ⇒ x = 0 | ✓ | none |
| §3.2 M = ℂ, ω = id | h = e^{−u} | Tr(hy) = ∫y du Lebesgue, θ-invariant; Tr(1_(λ,∞)(h)) = ∫_{u<−logλ}eᵘdu = 1/λ | ✓ | none |
| §3.2 μ_t(h_ω) and Tr(h_ω) | — | inf{λ : ω(1)/λ ≤ t} = ω(1)/t; ∫₀^∞ω(1)/t dt = ∞ | ✓ | none |
| §3.2 nonfaithful ω = (1,0) | — | h = e₁₁⊗e^{−u}, support e₁₁⊗1 θ-fixed; 1_(0,1)(u) not translation-fixed | ✓ | none |
| §3.3 distribution formula | p = 2, ‖x‖₂ = 1, λ = 2, t = 4 | 2^{−2} = 1/4; μ₄ = inf{λ : λ^{−2} ≤ 4} = 1/2 = 4^{−1/2} | ✓ | none |
| §3.3 triangle via Ky Fan | p = 2; p = 1 | ∫₀¹s^{−1/2} = 2 both sides; ∫₀¹s^{−1} = ∞ | ✓ | none |
| §3.3 p-triangle, p = 1/2, r = 1/4 | — | ∫₀¹s^{−1/2} = 2 cancels; ‖x+y‖^{1/4} ≤ ‖x‖^{1/4}+‖y‖^{1/4}; r ↑ 1/2 | ✓ | none |
| §3.3 Hölder M = ℂ | x = y = h^{1/2} | ‖h‖₁ = 1 = 1·1 | ✓ | none |
| §3.4 corner norm | M₂, e = e₁₁, ω ≥ 0 | ‖e h_ω e‖₁ = (eωe)(1) = ω(e) | ✓ | none |
| §3.5 matrix identification | x h_τ^{1/p} = x⊗e^{−u/p} | tr_H(|x|^p⊗e^{−u}) = τ(|x|^p); with tr/d: /d | ✓ | none |
| §4.1 left embedding | pairing ω_a(y) = tr(ay) | φ(yx) = tr(hyx) = tr((xh)y); xh = (xh^{1/p})h^{1−1/p} | ✓ | none |
| §4.1 symmetric vs left | φ = tr(diag(1,2)·)/3, x = e₁₂ | left (2/3)^{1/p}; symmetric (1/3·2/3)^{1/(2p)} = (2/9)^{1/(2p)}; ratio 2^{1/(2p)}; h^{−1/(2p)}e₁₂h^{1/(2p)} = 2^{1/(2p)}e₁₂ reconciles | ✓ | none |
| §4.3 no contraction below p = 1 | ℂ², (1/2,1/2), f = (1,0), p = 1/2 | ‖f‖^p_p = 1/2, ‖Ef‖^p_p = (1/2)^{1/2}: 1/4 vs 1/2 in the README's normalization: E not contractive | ✓ | none |
| §4.3 nontracial witness | N diagonal, e₁₁ | h_{φ|N} = h; E_p(h^{1/(2p)}e₁₁h^{1/(2p)}) = (1/3)^{1/p}e₁₁; e₁₂ ↦ 0 | ✓ | none |
| §4.3 non-invariant N | e₁₂+e₂₁ | σ_t = Ad diag(1,2)^{it}: 2^{−it}e₁₂+2^{it}e₂₁ ∉ N | ✓ | none |
| §4.3 preadjoints | ℂ², N = ℂ | ι_*: (a,b) ↦ a+b; E_*: c ↦ (c/2,c/2); ι_*E_* = id, E_*ι_* ≠ id | ✓ values, wording | R04 |
| §4.4 Bochner norm | Ω two points, M = M₂ | ((‖x‖^p+‖y‖^p)/2)^{1/p} = ‖diag(x,y)‖_p for (1/2)⊗τ | ✓ | none |
| §5.1 period | f(e^{iθ}) = θ, b_n = f(λ(2^{−n})) | e^{ib_n} = λ(2^{−n}); e^{−i2^{−n}a_n} = λ(2^{−n})*; σ^{φ_n}_{2^{−n}} = id; hjx 334–338 same branch | ✓ | none |
| §5.1 M = ℂ, tracial M₂ | — | centralizer = R, R_n = R, Φ_n = id | ✓ | none |
| §5.2 nestedness | λ(2^{−n}) = λ(2^{−n−1})² | b_n ≡ 2b_{n+1} mod 2π; a_n ≡ a_{n+1} mod 2^{n+1}π | ✓ | none |
| §5.3 Hölder exponent | p = 1/2 | 1/r = 2−1/2 = 3/2, r = 2/3; ‖h^{3/2}‖_{2/3} = tr(h)^{3/2} = 1 | ✓ | none |
| §5.3 normalization | τ_n(1) = d | x ↦ d^{−1/p}x carries unnormalized to normalized p-norm | ✓ | none |
| §5.4 p_i ≠ 1 | ℂ², p = e₁, Φ(a,b) = (a,0) | φ∘Φ = (a/2) ≠ φ; pφp(a,b) = a/2 = φ(Φ(a,b)) | ✓ | none |
| §5.5 BCL ⇒ moduli | u = (x+y)/2, v = (x−y)/2 | ‖u‖² ≤ 1−(p−1)ε²/4 ⇒ δ ≥ (p−1)ε²/8; reversed: ρ(t) ≤ √(1+(p−1)t²)−1 ≤ (p−1)t²/2 | ✓ | none |
| §5.5 p = 2 | — | δ = 1−√(1−ε²/4) ≥ ε²/8; ρ = √(1+t²)−1 ≤ t²/2 | ✓ | none |
| §5.5 scalars | x = y = 1, p = 3/2; p = 3 | 2 ≥ 3/2; 2 ≤ 3 | ✓ | none |
| §5.5 p = 1 excluded | ℓ¹₂, x = e₁, y = e₂ | ‖x−y‖ = 2, ‖(x+y)/2‖ = 1: δ(2) = 0 | ✓ | none |
| §5.5 matrix witness | x = e₁₁, y = e₁₂, p = 3/2 | s(x±y) = (√2,0): (2+2)/2 = 2 ≥ 1+1/2 | ✓ | none |
| §6.1 matrix units | a_k = e_{1k}, n | ∑a*a = 1: C_p = n^{1/p}; ∑aa* = ne₁₁: R_p = √n | ✓ | none |
| §6.1 realization | X = ∑a_k⊗e_{k1} | X*X = ∑a_k*a_k⊗e₁₁ | ✓ | none |
| §6.1 p = 1 values | a = (e₁₁,e₁₂) | C₁ = ‖1‖₁ = 2; R₁ = ‖√2e₁₁‖₁ = √2 | ✓ | none |
| §6.1 sum gauge = √2 | b = 0, c = a; dual x = a/√2 | ‖∑x*x‖ = 1/2, ‖∑xx*‖ = 1, ‖x‖_RC = 1; pairing 2/√2 = √2 | ✓ | none |
| §6.2 K₁, K₂ for (1,1) | — | E|ε₁+ε₂| = 1; K₂ = √2 | ✓ | none |
| §6.2 Lévy witness | x = (1,1), t = 1; x = (1,1,1) | 1/2 ≤ 2·1/2; P(max > 1) = 1/2, P(|S₃| > 1) = 1/4: 1/2 ≤ 1/2, fails without 2 | ✓ | none |
| §6.3 dualities | — | (A+B)* = A*∩B* with max; L¹(ℓ²_C)* = L∞(ℓ²_C) | ✓ | none |
| §6.3 pairing expansion | i = j terms counted | E(S⁴) = A+B+C−2D with all-index sums; (1,1): 4+4+4−4 = 8 = (16+16)/4 | ✓ | none |
| §6.3 Pauli | σ_x, σ_z | S² = 2, E(S⁴) = 4; A = B = 4, C = 2+2(σ_xσ_z)² = 0, D = 2 | ✓ | none |
| §6.3 bound 3 | T = ∑x_k² | A = T² ≤ ‖T‖²; B ≤ ‖T‖T; ‖C‖ ≤ ‖B‖ by u = v = x_ix_j; 0 ≤ E(S⁴) ≤ A+B+C | ✓ | none |
| §6.3 optimality | x_k = 1 | E(S⁴) = 3n²−2n: n = 2: 8, n = 3: 21 | ✓ | none |
| §6.3 truncation | c₀ = √3/2 | (|t|−c₀)₊² ≤ t⁴/(16c₀²) ⟺ (|t|−2c₀)² ≥ 0; t = √3: 3/4 = 3/4; E(F²) ≤ 3‖T‖²/12 < 1/4 | ✓ | none |
| §6.3 iteration | — | [x] ≤ c₀(1+1/2+…) = √3 | ✓ | none |
| §6.3 scalars (1,1) | — | 3^{−1/2}√2 ≈ 0.816 ≤ 1 ≤ √2; sharp n = 2 constant 1/√2 | ✓ | none |
| §7.1 martingale of e₁₁ | tr/2 | x₀ = 1/2, x₁ = e₁₁; ‖x₀‖₂²+‖dx₁‖₂² = 1/4+1/4 = 1/2 = τ(e₁₁) | ✓ | none |
| §7.2 values for e₁₂ | tr/2 | ‖dx₂‖_p = (1/2)^{1/p}, not 1 | ✗ value | R04 |
| §7.3 x₁*x₁ identity | dx₀ = 1/2, dx₁ = e₁₁−1/2 | 1/4+1/4 + (e₁₁−1/2) = e₁₁ | ✓ | none |
| §7.4 transform (1,−1,1) | — | 1/2−(e₁₁−1/2) = e₂₂ | ✓ | none |
| §7.4 commutation | v = e₂₁, A = e₁₁ | vAv* = e₂₂ ≰ cA | ✓ | none |
| §7.4 L¹ fails | x_n = 2ⁿ1_(0,2^{−n}) | E_n x_{n+1} = 2^{n+1}/2 = 2ⁿ; norm 1; no L¹ limit | ✓ | none |
| §7.5 scalars p = 4 | (1,1) | K₄⁴ = (16+16)/4 = 8; max(C₄,R₄) = √2; B₄ ≥ 2^{1/4} | ✓ | none |
| §7.5 type in ℓ¹ | e_k | n vs √n | ✓ | none |
| §7.5 McCarthy | ℂ², r = 2, 1/2 | 2 = 2; 2 ≤ 4; √2 ≤ 2 | ✓ | none |
| §8.1 square function | e₁₂h^{1/p} | h^{1/p}e₂₂h^{1/p} = (2/3)^{2/p}e₂₂ ∈ L^{p/2}, norm (2/3)^{2/p}; sqrt (2/3)^{1/p} = ‖e₁₂h^{1/p}‖_p | ✓ | none |
| §8.2 trace preservation | y ∈ R_m | φ̂(e^{−a_m}Ê_n y) = φ̂(Ê_n(e^{−a_m}y)) needs e^{−a_m} ∈ R(M₀) | ✓ | none |
| §8.4 BMO of 1 | n = 0 | E₀(1) = 1: ‖1‖_BMO_C = 1 | ✓ | none |
| §8.4 BMO of e₁₂ | tr/2 | 1/2, e₂₂, e₂₂ → 1; row e₁₁ → 1; = ‖e₁₂‖_∞ | ✓ | none |
| §8.4 endpoint value | e₁₂ | ‖a‖₁ = 1/2 (tr/2), not 1 | ✗ value | R04 |
| §8.4 reverse fails | dyadic x_n | dx_k = ±2^{k−1} on (0,2^{−k+1}); S² = (4^j−1)/3 on (2^{−j},2^{−j+1}); ‖S‖₁ = ∑2^{−j}2^j/√3 = ∞ | ✓ | none |
| §8.4 constants | px97 (ii) | (1/√3)‖a‖ ≤ ‖φ_a‖ ≤ √2‖a‖ ⟺ README | ✓ | none |
| `matrixLpGauge` | p = 2, x = diag(3,1); wrong models | tr(|x|²)^{1/2} = √10; `x*star x` same by unitary invariance; omitting `.re^(1/p)` fails; normalized trace excluded by `Matrix.trace` | ✓ | none |
| `columnSquare`/`rowSquare` | (e_{1k}) | n^{1/p} vs √n distinguishes the swapped model | ✓ | none |
| `randomSumGauge` | n = 1; no division | ‖a‖_p; 2^{n/p} too large | ✓ | none |
| `rowColumnSumGauge` | n = 0; general | set = {0}: 0; nonempty (b = a, c = 0), bounded below by 0, so `Real.sInf` is the infimum | ✓ | none |
| `matrix_khintchine_high` | n = 0; d = 0; p = 2 | all gauges 0; S = K, any B ≥ 1 | ✓ | none |
| `matrix_khintchine_low` / `_one` | n = 0; p = 1 overlap | 0 ≤ 0; A = 1/√3 consistent | ✓ | none |
| `matrix_ball_carlen_lieb_low/high` | d = 0; p = 2 | 0 ≤ 0; both become the parallelogram law | ✓ | none |
| Lean generality vs README | all five | matrices with constants uniform in d, n; README states every von Neumann algebra and the docstring says why | ✓ | none |

## Not verifiable

- Bergh–Löfström, *Interpolation Spaces* (§1.3; §§2.3, 3.1; Theorems 3.1.2, 3.4.1, 4.1.2, 4.3.1, 4.5.1, 4.6.1, 5.1.1, 5.1.2, 5.2.1; §5.3): Springer book, DOI 10.1007/978-3-642-66451-9, paywalled; cited by locator.
- Pisier–Xu, *Non-Commutative Lp-Spaces*, Handbook 2 (§§1–3, 5–7): Elsevier, DOI 10.1016/S1874-5849(03)80041-4, paywalled.
- Kosaki, J. Funct. Anal. 56 (1984): Elsevier, paywalled; its use is confirmed through hjx lines 846, 996–1001.
- Takesaki, *Theory of Operator Algebras II* (VIII.3, IX.4.2, X.2.3): book, not online; the statements used are Hiai's.
- Ball–Carlen–Lieb, Invent. Math. 115 (1994): Springer, paywalled; checked through rx14 lines 56–65.
- Lust-Piquard–Pisier, Ark. Mat. 29 (1991): Springer, paywalled; the description agrees with pisierGT lines 1419–1422 and px97 line 737.
- Ledoux–Talagrand, *Probability in Banach Spaces* (Proposition 2.3, Theorem 4.7): Springer book, paywalled.
- Burkholder, Handbook 1 (2001), §2: Elsevier, paywalled.
- Ky Fan, PNAS 37 (1951): pnas.org refuses the fetch; the inequality is confirmed from moslehian lines 98–99 with the attribution.
- Haagerup, *On the dual weights … I* (Math. Scand. 43, 99–118): not fetched; the README cites only Part II, which was read.

## Source issues

- **Misprint** in hiai at Remark 11.23, printed page 112 (line 5570): the source writes the singular-number formulas with the exponent `t^{1/p}` (and `t^{1/q}`, `t^{1/r}`); it should be `t^{−1/p}` as in (11.9) (line 5429), which the same remark cites; affects nothing (the logarithmic cancellation that follows is written correctly).

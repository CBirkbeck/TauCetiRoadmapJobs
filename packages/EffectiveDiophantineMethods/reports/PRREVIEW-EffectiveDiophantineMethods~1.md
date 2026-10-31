# Review of EffectiveDiophantineMethods (pull request #1046 at 5499fdb)

**Verdict:** needs changes

The gate fails on two text checks (`readme-ids-missing=46`, `residue=2`); the targeted build and the dependency check pass. One finding is blocking (R01). Everything else is style, locator or naming. The six headline statements in `Suggested.lean` elaborate, agree with their README statements and with the sources, and none of them closes under the one-tactic probe.

## R01 (P2) — The solved-equation headlines of §§6.36–6.39 are statable at the pins but absent; their arithmetic inputs are owned by nobody

Location: `TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` lines 34–39 (module docstring: "The equations and finite coordinate lists of §§6.36–6.39 are expressible, but their full arithmetic input and validity types are not supplied by the pins"); README §6.36 lines 8921–8935, §6.37 lines 8969–8975, §6.38 lines 9006–9012, §6.39 lines 9042–9048.

Claim: the Layer 6 endpoints (README summary line 6: "The endpoint is a finite list … and a completeness theorem"; Layer 6 title "complete solution lists") are the four application theorems of Tzanakis–de Weger 1989 Theorems A and B, de Weger Theorem 6.3 and Tzanakis–de Weger 1992 §18. Each of them is a plain statement about integers:

- §6.36 (i): for all integers X, Y, `X⁴ − 4X³Y − 12X²Y² + 4Y⁴ = 1` iff `(X, Y) = ±(1, 0)` (tzanakisDeWeger1989 line 752–753, p. 122);
- §6.36 (ii): `X⁴ − 12X²Y² − 8XY³ + 4Y⁴ = 1` iff `(X, Y) ∈ ±{(1,0), (1,−1), (1,3), (3,−1)}` (line 754–755);
- §6.37: the integral points of `y² = x³ − 4x + 1` are the 22 listed points (tzanakisDeWeger1989 line 628);
- §6.38: `x + y = z` in `{2,3,5,7,11,13}`-units with `gcd(x,y) = 1`, `x ≤ y` has exactly 545 solutions (deWeger1989 line 6547–6551, p. 123).

Witness: every carrier is `ℤ` (or `ℕ`), so each statement elaborates against `import Mathlib` alone; the module docstring's reason ("validity types are not supplied by the pins") applies to the roadmap's own datum types, not to these theorems. The README's conditional forms make three kinds of thing hypotheses: (a) the unit group of the order `ℤ + ℤϑ + ℤϑ²/2 + ℤϑ³/2` (§6.36 lines 8925–8927 and 8932–8934; a mathematical fact about one explicit order, statable with `AdjoinRoot` and `Subalgebra`, and provable from a regulator lower bound and a finite index check); (b) "an admissible initial exponent bound K₀ proved from DiophantineApproximationAndTranscendence §§3.6–3.7" (lines 8935–8936, i.e. §2.3 of this roadmap applied to the eight linear forms — a proof step, not a hypothesis); (c) "a lattice scale c₀ satisfying the exact §1.4 reduction inequalities … and a second reduction datum whose resulting bound is at most 10" (lines 8936–8938). Item (c) is the conclusion: once `A ≤ 10` is a hypothesis, the theorem is the finite enumeration of `|a_i| ≤ 10`, which Tzanakis–de Weger report in one line (line 879). No layer, supplier section or pinned declaration provides (a); the scope paragraph (README lines 50–52) says no class-group or unit algorithm is in scope and that "an application supplies such exact data"; nobody is named to supply them.

Repair, tested on §6.36 (i): state in `Suggested.lean`

```lean
theorem thue_tzanakisDeWeger_i (X Y : ℤ) :
    X ^ 4 - 4 * X ^ 3 * Y - 12 * X ^ 2 * Y ^ 2 + 4 * Y ^ 4 = 1 ↔
      (X = 1 ∧ Y = 0) ∨ (X = -1 ∧ Y = 0) := by
  sorry
```

(the same shape for (ii), §6.37 as an `↔` with the 22-element list, §6.38 as `Set.ncard = 545` over the S-unit triples), and in the README either make the unit-group, class-number and Mordell–Weil generator facts of §§6.36–6.39 targets of Layer 6 (each is a theorem about one explicit number field: generation of the unit group of a given order by listed units from a regulator bound and index test; class number one of `ℚ(ψ)`, `ψ³ − 4ψ + 1 = 0`, from the Minkowski bound), or cite a supplier that owns them. If the roadmap keeps a conditional form, the only legitimate hypothesis is (a); (b) and (c) are steps of the proof route and must leave the "Work under the following conditions" blocks. The same applies to the `(U)`, `(M)` and `c.Valid` hypotheses of §§2.20, 2.28 and 2.33 insofar as `Valid` includes the reduction-chain inequalities (§2.19 lines 2387–2467): those are the proof, not the hypothesis.

## R02 (P3) — Gate failure: 46 README identifiers presented as declarations are not in `Suggested.lean`; "catalogue" residue

Location: README lines 586–591 (`ED0.ExactAlgebraicData`, `….root_unique`, `….exists_small`, …), 1101–1111, 3275–3279, 3723–3727, 3865–3870, 4446–4454, 4548–4555, 7169–7176, 8296–8440 and the rest of the gate's list; README lines 6894 and 6898 ("The exact 1492-case catalogue", "The catalogue, point counts and Mordell–Weil tables").

Witness: `tauceti-roadmap gate … EffectiveDiophantineMethods --base origin/main` at 5499fdb prints `readme-ids-missing=46 residue=2 … FAIL`; `Suggested.lean` declares exactly 13 names (`ED2.matveevConstantUpper`, `ED2.matveev_lower_bound`, `ED2.yuConstantUpper`, `ED2.yu_valuation_upper_bound`, `ED3.cremonaMu`, `ED3.canonicalHeight_sub_naiveHeight_cremona`, `ED3.archimedeanLogHeight`, `ED3.silvermanMu`, `ED3.canonicalHeight_sub_naiveHeight_silverman`, `ED3.mordellWeilSubgroup`, `ED3.mordellWeil_basis_of_height_and_saturation`, `ED6.seriesValue`, `ED6.roots_determined_of_truncation`), while the README backticks 224 distinct `EDk.…` names, of which 218 are declared nowhere (my count by `grep -o`; the gate reports 46 of them).

Repair: state every API bullet and Check in prose without a backticked Lean name of this roadmap's own (the README rule: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it), keeping only the 13 names above; replace "catalogue" at lines 6894 and 6898 by "list" or "table".

## R03 (P3) — Supplier declarations cited by names that do not exist at the cited heads

Location: README lines 324–333 ("From AnabelianGeometryAndNonabelianChabauty §5.8 use `abelianLog.add`, `abelianLog.derivative`, `abelianLog.kernel`, `abelianLog.functorial`, `abelianLog.formal`, `abelianLog.baseChange`, `abelianLog.cp`, `abelianLog.pairing` and `abelianLog.unique` … `colemanAbelian.integral` and `colemanAbelian.basepoint`"), §4.6 lines 4704–4707 and 4733–4736; lines 371–376 ("PadicDifferentialEquationsAndRigidCohomology §RD.7.18 … `matrixF` and primitivesf"); line 360 ("ModularCurvesPartII §§13.1–13.4 and `16.1–16.8`").

Witness: AnabelianGeometryAndNonabelianChabauty at #1021, §5.8 "Abelian logarithms" (its README line 7478 onward) states the local abelian logarithm, its `ℂ_p` extension and the "Coleman and abelian logarithm comparison" as prose API bullets; the strings `abelianLog.` and `colemanAbelian.` occur nowhere in that README (0 hits each). PadicDifferentialEquationsAndRigidCohomology at #1002 §RD.7.18 (its line 14241) supplies "the matrix `F` with `𝔽_p^*ω_i = Σ_j F_{ij}ω_j + df_i` … and the primitives `f_i`" with no declaration named `matrixF` (0 hits). ModularCurvesPartII at #913 Layer 16 has §§16.1–16.7 (its lines 4099–4220); there is no §16.8.

Repair: cite AnabelianGeometry §5.8 by its paragraph titles ("Local abelian logarithm", "Coleman and abelian logarithm comparison") and the facts needed (additivity, identity differential, finite torsion kernel, `ℂ_p` extension, base-point change), PadicDE §RD.7.18 by "the Frobenius matrix `F` and primitives `f_i`" in prose, and ModularCurvesPartII by §§16.1–16.7.

## R04 (P3) — Certificate-shaped targets and implementation-level theorems

Location: README §1.7 lines 1293–1334 and §1.8 lines 1334–1363 (`fpEnumeration G t R` defined through the Fincke–Pohst level-by-level bounds, with a "soundness and completeness" theorem for the enumeration); §5.7 lines 6034–6064 ("Correctness with only changed tests"); §3.8 lines 3514–3562 (the lifting alternatives are stated as a decision procedure "with bound ord_p(disc g) + 2").

Witness: the house rules exclude "executable procedures, certificates, implementations"; §1.8 is the correctness statement of Fincke–Pohst's algorithm (2.8) (finckePohst1985 line 119), and §5.7 is a re-use optimisation of §5.6 with no mathematical content beyond §5.6. The mathematics each one carries is already a plain statement: §1.7–1.8 is "the set of `x ∈ ℤⁿ` with `(x − t)ᵀG(x − t) ≤ R` is finite and equals the level-set description", §5.7 is a special case of §5.6.

Repair: keep §1.7's finiteness and the level-set equality as the targets (drop the named enumeration and its "output"), delete §5.7 (or merge its statement into §5.6 as a Check), and in §3.8 state the depth bound as a lemma ("if `ord_p g(x) ≥ 2k` and `ord_p g′(x) ≥ k` then `k ≤ ord_p disc g`") rather than as the termination of a test. The depth bound itself is correct: writing `g = ax⁴ + bx³ + cx² + dx + e` after an integral translation taking `x_k` to `0`, every monomial of `disc g` has `i_d + 2i_e ≥ 1` (there is no `c⁶` term), so `ord_p disc g ≥ min(k·i_d + 2k·i_e) ≥ k`.

## R05 (P3) — Duplicated statement paragraphs, a background locator cited for theorems, and reference-list artefacts

Location: README §4.6 lines 4733–4751 repeat lines 4710–4723 verbatim under "The intended signatures also include"; the same pattern at §4.13 lines 5041–5046, §6.16 lines 7865–7873, §6.21 lines 8135–8140; §0.2 line 611 cites only deWeger1989 §2.5 pp. 32–34; References lines 9115–9143 (`W`. Aitken, `J`. `E`. Cremona, `B`. `M`. `M`. de Weger, …).

Witness: deWeger1989 lines 1542–1575 (printed pp. 32–34) are remarks on multiprecision arithmetic, Newton's method and interval arithmetic; they contain no statement of the root-isolation, uniqueness or disjointness facts of §0.2 (which are elementary and need no source beyond separability and finiteness of roots). The reference entries put single initials inside code spans, a scanner artefact that a reader sees as Lean names.

Repair: delete the duplicated "intended signatures" paragraphs (the statement is already above them); cite §0.2 as standard (or Mathlib's `Polynomial.roots` finiteness) and keep de Weger as background; write the author initials as plain text.

## R06 (P3) — Unused hypothesis in the Mordell–Weil basis theorem

Location: `Suggested.lean` line 137 (`hW : ∀ a ∈ [W.a₁, W.a₂, W.a₃, W.a₄, W.a₆], IsIntegral ℤ a` in `ED3.mordellWeil_basis_of_height_and_saturation`).

Witness: the conclusion follows from the index bound `[E(ℚ)/T : L] ≤ ⌊√R·(γ/λ)^{r/2}⌋` and `p`-saturation for the primes `p ≤ N`, which use only the Néron–Tate pairing, Hermite's inequality and the height lower bound `λ` (all model-independent); Tau Ceti's `canonicalHeight` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` line 120) is defined for any `W` with `W.IsElliptic`. Integrality is needed by §3.12 and §3.15, where the inputs `λ` and `R` are computed, not by this theorem.

Repair: drop `hW` from the theorem (it is a P3 note; keep it if the README's §3.22 statement is also widened to any model).

## Verified sound

**Gate and build.** `gate … --base origin/main` at 5499fdb: `set_option=0 … sorry-data=0 sorry-examples=0 residue=2 … imports=0 … readme-ids-missing=46 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 FAIL`; the worker's run adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EffectiveDiophantineMethods'` is empty (no change outside the folder). `lake env lean TauCetiRoadmap/EffectiveDiophantineMethods/Suggested.lean` from the worktree: 3.5 s, six `declaration uses 'sorry'` warnings and nothing else. The manifest pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf, which are the revisions named in README line 123–124; `.lake/packages` resolves to them.

**Dependency check.** `gate --depcheck … --name EffectiveDiophantineMethods --order ORDER.txt --movable --content …` prints `depcheck: 205 roadmaps, 1415 edges, 0 problem(s)`: no UPWARD or CYCLE line. The merge order lists EffectiveDiophantineMethods at line 158, after AnabelianGeometryAndNonabelianChabauty (157), HeightsRationalPointsAndObstructions (125), ColemanIntegration (123), ModularCurvesPartII (70) and GeometryOfNumbersAndQuadraticArithmetic (65). Every `*Needs:*` line of the sampled sections names only earlier sections of this roadmap, Mathlib/Tau Ceti declarations, or those suppliers.

**Signatures.** A scratch file with `#check @name` for all 13 declarations elaborated; each printed type matches its README statement: `matveev_lower_bound` carries `0 < n`, `[K:ℚ] ≤ D`, `n ≤ s²`, `log D ≤ L`, `16/100 ≤ A i`, `D·h(α_i) ≤ A i`, `‖λ_i‖ ≤ A i`, `Λ ≠ 0` and concludes `−c(1 + log max|b_i|) < log|Λ|`; `yu_valuation_upper_bound` carries `2 ≤ n`, `[K:ℚ] ≤ d`, `0 < logLower ≤ log p`, `h(α_i) ≤ h i`, `‖Complex.log σ(α_i)‖ ≤ 10 h i`, `log p ≤ h i`, `log(10nd·max(h,1)) ≤ logUpper`, `b ≠ 0`, `α^b ≠ 1`; the two height-difference theorems carry integrality and `[W.IsElliptic]`; the basis theorem carries `0 < r`, the torsion list, `finrank ℤ ≤ r`, `0 < δ ≤ det ≤ R`, the height lower bound, Hermite's inequality, `N = ⌊√R (γ/λ)^{r/2}⌋₊` and `p`-saturation for primes `p ≤ N`; the root theorem carries `IsRestricted 1`, Gauss norm one, `0 < N`, `0 < d`, the coefficient error and the multiplicity bound. No section variable is lost (the file has none).

**One-tactic probe.** On a copy with every `sorry` replaced by `first | rfl | simp | infer_instance | exact le_refl _ | exact ⟨∅, by simp, by simp, by simp⟩`, all six theorems (probe lines 68, 93, 112, 134, 168, 196) fail with unsolved goals: none is padding. The four definitions are the scalar constants, the generated subgroup and the series value that the headlines need.

**Library declarations opened at the pins.** Mathlib `Height.mulHeight₁`/`logHeight₁` (`Mathlib/NumberTheory/Height/Basic.lean` lines 113, 146: relative, product over archimedean absolute values with multiplicity times the non-archimedean product), `NumberField.absMulHeight₁`/`absLogHeight₁` (`Height/NumberField.lean` lines 136, 145: the `1/[ℚ(x):ℚ]` root), `InfinitePlace.mult` (`InfinitePlace/Basic.lean` line 274: 1 or 2), `Point.naiveHeight := logHeight P.xRep` and `naiveHeight_eq_logHeight₁` (`Height/EllipticCurve.lean` lines 37, 43), `Real.exp_one_lt_d9` (`exp 1 < 2.7182818286`), `analyticOrderAt` (`Analysis/Analytic/Order.lean` line 48), `IsRestricted` (`RingTheory/MvPowerSeries/Restricted.lean` line 33); Tau Ceti `Point.canonicalHeight := limUnder atTop (naiveHeight (2ⁿ•P)/4ⁿ)` (`CanonicalHeight/Basic.lean` line 120), `neronTatePairing` and `neronTatePairing_apply` (lines 368, 378), `abs_canonicalHeight_sub_naiveHeight_le` (line 191), `regulator := |det (neronTateGramMatrix (finBasis))|` and `regulator_eq_abs_det_neronTateGramMatrix` (`MordellWeil/Regulator.lean` lines 91, 95), `PointModTorsion` (`PointModTorsion.lean` line 56), `fg_point_of_numberField` (`FinitelyGenerated.lean` line 121), `IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq` and `existsUnique_…` (`Weierstrass/Preparation.lean` lines 163, 284), `hasSum_log_of_mem_unitFiltration_one`, `valuation_log_sub_log` (`LocalField/Logarithm.lean` lines 97, 256). These confirm the README's conventions (line 85–90): both pinned heights are relative full `x`-heights, so `canonicalHeight/[K:ℚ] − naiveHeight/[K:ℚ]` is Silverman's `2(ĥ − ½h(x))`.

**Cross-roadmap citations resolved** (at the heads the brief gives): HeightsRationalPointsAndObstructions #1017 §§0.19, 0.24, 1.15a–1.19, `card_quotient_two_padic` (its lines 328, 384, 794–852, 831); AnabelianGeometryAndNonabelianChabauty #1021 §§2.0, 2.7, 5.8, 6.1, 6.8 (lines 4479, 5253, 7478, 7686, 8351); ColemanIntegration #1043 §§L0.10, L0.13, L0.17, L1.1, L1.9, L1.19 (lines 84, 107, 43, 684, 41, 999); ModularCurvesPartII #913 §§9.5–9.8, 11.8, 13.1–13.4, 16.1–16.7, 17.2 and `gammaZeroPlus` (lines 2675–2757, 3124, 3239–3367, 4099–4220, 4270); GeometryOfNumbersAndQuadraticArithmetic #851 §5.1 with `lllCoefficient`, `IsLLLReduced`, `lll_short_vector_factor` (lines 2132, 2134, 70); NeronModels #852 §3.8 (line 1648); DeligneWeightsAndPurity #929 §§1.1–1.4 (lines 911–960); AbelianSchemes #849 A3.9, A6.14, A6.15 with `Polarization.rosati`, `rosatiPositivity`, `rationalNSAmpleCone` (lines 1684, 3064, 3208); PadicDE #1002 §RD.7.18 (line 14241). On main: DiophantineApproximationAndTranscendence §§0.2, 3.6 (Matveev restated with `B* = max|b_j|`, `C₁(n,κ)` and `log(eD)·log(eB*)`, its line 2559), 3.7 (Yu restated with `n ≥ 2`, `h_j ≥ max(h(α_j), |log α_j|/(10d), log p)`, `ord_𝔭(α^b − 1) < Φ·log(dB)`, non-unit tuples allowed, its lines 2700–2735), 4.3, 4.5; JacobianChallenge Layers C–F; SchemeAndStackFoundations §§2.20 (`curve_dualizing_comparison` line 4358), 3.3, 3.8; StableReduction Layers 2, 5; EllipticCurves Layers 3, 4, 6, 7; AlgebraicCurves Layers 4, 10; IntegralLattices Layer 2; NewtonPolygons §§3.4, 4.3; RestrictedPowerSeries §2; RealAlgebraicGeometry Layer 1 (under `Completed/`). Ownership against the open pull requests listed in the brief was checked by object for the six headline objects (explicit Matveev/Yu constants, Cremona/Silverman height-difference constants, a basis-from-saturation criterion, quantitative root matching): none of the 426 open heads states them (`roadmaps grep` for `Matveev`, `Silverman`, `saturat`, `Weierstrass preparation` finds only general theorems in DiophantineApproximationAndTranscendence, HeightsRationalPointsAndObstructions and NewtonPolygons, which this roadmap cites, not restates).

**Sources, seeded sample.** Each locator was opened in the sources cache (page markers `=== page N ===`, printed pages from the footers):

| Target | Source and locator | Found |
| --- | --- | --- |
| 0.2 | deWeger1989 §2.5, printed pp. 32–34 (lines 1542–1575) | section exists at that page; it is a remarks section on numerical methods (R05) |
| 1.1 | deWeger1989 §3.7 p. 53 (lines 2476–2504, footer 53): lattice with rows `[γ·C·ϑ_i]`; tzanakisDeWeger1989 §II.3 p. 112; tzanakisDeWeger1992 §16 p. 264 (line 887, footer 264): general weights `W_j` | all three support the statement |
| 1.8 | finckePohst1985 §2 (2.6)–(2.7) p. 465 (lines 88–118) | the level bounds and recursion are there |
| 2.2, 2.3, 2.15 | tzanakisDeWeger1989 Lemmas 2.3–2.4 p. 110 (lines 348–371, page 12): Lemma 2.4's proof derives `A < (C₅/n)(log C₆ + C₇C₈′ + C₇ log A)` and `C₈′ = C₈ + log r` in the complex case | matches §2.15's `a`, `b` and `Ĉ₈` |
| 2.33 | deWeger1989 Theorem 6.3 p. 123 (line 6547, footer 123); Lemma 7.3 p. 138 (line 7986, footer 138) | both locators exact |
| 3.8 | cremonaBookCh3 §3.6 pp. 80–82 (lines 884–978): subroutines `lemma6`, `lemma7` | every alternative of §3.8 is the corresponding line of `lemma6`/`lemma7` |
| 3.12 | cremonaBookCh3 Proposition 3.5.1 p. 77 (lines 698–703): `−h(j)/12 − μ(E) − 1.922 ≤ ĥ(P) − h(P) ≤ μ(E) + 2.14` with `μ(E) = (log|Δ| + log⁺ j)/6 + log⁺(b₂/12) + log 2*`, "standard Weierstrass equation over ℤ"; footnote 3 (line 730): `ĥ` is double Silverman's and 1.922 is Bremner's corrected constant. silverman1990 Theorem 1.1 p. 725 (lines 91–100): integral coefficients, `μ(E) = h(Δ)/12 + h_∞(j)/12 + h_∞(b₂/12)/2 + (log 2*)/2`, constants 0.973 and 1.07 | `cremonaMu` is Cremona's `μ`, `silvermanMu` is `2μ(E)`, `961/500 = 1.922`, `973/500 = 2·0.973`, `107/50 = 2·1.07` |
| 3.17, 3.22 | siksekDescent1995 §4 p. 17, equation (39) (lines 804–814): index divisible by `p` iff `Σ a_iP_i = pQ` is solvable | supports the saturation criterion |
| 4.6 | mccallumPoonen2010 Remark 8.3(2), author copy p. 12 (lines 511–523) | the remark exists and says what §4.6 attributes to it |
| 5.2, 5.3, 5.28 | bruinStoll (arXiv 0906.1934) §3.3 "Computation of A(NΓ)" (line 400), §4.4 (line 692), Corollary 5.15 (line 1273), 1492 curves (line 535) | the published page numbers could not be matched in the arXiv copy; the content is there |
| 6.7 | bdmtv2019annals (28)–(29) p. 915 (lines 1244–1258): `C_x⁻¹dC_x = Λ`, `dΩ_x = −ω`, `dg_x = Ω_xᵀZ dΩ_x − η`; Λ as in (27) | exactly the README's (28)–(29) |
| 6.16 | bdmtv2021 Lemma 4.7 and Remark 4.8, arXiv v4 p. 25 (lines 1335–1352) | statement found; its tail condition is weaker than the proof needs (Source issues) |
| 6.21 | bdmtv2019annals Proposition 6.2 and Remark 6.3, p. 927 (lines 1803–1819) | exact |
| 6.36 | tzanakisDeWeger1989 Theorem B p. 122 (lines 752–755) and proof pp. 123–126 (lines 760–881) | solution lists, `ε₁ = 1 + ϑ`, `ε₂ = 3 + ϑ`, the order's basis `{1, ϑ, ϑ²/2, ϑ³/2}`, `C₅ = 1.211`, `C₆ = 6.38771·10⁴`, `A < 3.26·10⁴⁰`, `c₀ = 10¹⁴⁰`, `|b₁| > 3.247·10⁴⁶`, `4.846·10⁴⁶`, `‖s₃‖ > 0.029`, `A ≤ 72`, `c₀ = 10¹²`, `1.293·10⁴`, `1.092·10⁴`, `0.143`, `A ≤ 10` all match |

**Adversarial pass** (values computed on each side):

| Statement | Instances tried | Values | Result |
| --- | --- | --- | --- |
| §2.2 `Ĉ(n) ≥ C₁(n,κ)`, Check `matveev_two_logs` | `n = 2, D = 1, s⁺ = 1.415, ℓ⁺ = 0, A = (0.7, 1.1)` | `Ĉ(2)·0.77 = 7.8253·10⁸`; `c = 8·10⁸` accepted, `7·10⁸` rejected; `log 2 = 0.6931 < 0.7`, `log 3 = 1.0986 < 1.1`, `√2 = 1.41421 ≤ 1.415` | Check correct |
| §2.2 Check `matveev_one_log` | `n = 1` | `Ĉ(1) = e⁺·30⁴/2 = 1.100904·10⁶`, the `κ = 1` branch | correct |
| §2.3 `ED2.matveev_lower_bound` vs Matveev/DAT §3.6 | `n = 1`, `b = (b₁) ≠ 0`; `[K:ℚ] = D′ < D`; `K ⊄ ℝ` | `B* = |b₁| ≥ 1` so `log B* ≥ 0`; `C₁D′²log(eD′) ≤ Ĉ(n)D²(1 + L)` since `L ≥ log D`; `Ĉ(n) ≥ C₁(n, 2)` by the max | hypotheses match the source at the stated generality |
| §2.4 Check `yu_rational_two_primes` | `n = 2, d = 1, p = 5, h = (log 5, log 5)` | `22000·28.5⁶·(log 5)⁻³·4·(log 5)²·log(20 log 5) = 1.01721·10¹⁴ > 10¹⁴` | Check correct |
| §2.5 `ED2.yu_valuation_upper_bound` | `α = (2, 3)`, `b = (1, 2), (3, −1), (3, 0)` | `2·9 − 1 = 17`, `v₇ = 0`; `8/3 − 1 = 5/3`, `v₇ = 0`; `8 − 1 = 7`, `v₇ = 1`; conclusion `−log‖ι(x)‖/log p = ord_𝔭(x)/e ≤ ord_𝔭(x)`, negative when `ord_𝔭 < 0` | correct; non-unit `α_j` allowed exactly as in Yu p. 242 ("the only assumption that `α^b − 1 ≠ 0`") |
| §1.1 Check `lfl_log_rounding` | `C = 10⁸` | `round(69314718.06) = 69314718`, `round(109861228.87) = 109861229` | correct |
| §1.1 Checks `lfl_two_dim`, `lfl_mem_iff` | `A = [[1,0],[3,7]]` | `A(1,0)ᵀ = (1,3)`; `(0,1)`: `7x₂ = 1` impossible; `v ∈ Γ ⟺ 7 ∣ v₂ − 3v₁` | correct |
| §1.8 Checks | `G = [[2,1],[1,2]], R = 2`; `Γ = ℤ(1,0)+ℤ(0,10), y = (0,−1)`; `G = (1), t = ½, R = ¼` | `x² + xy + y² ≤ 1` has the 7 vectors listed; nearest lattice vector distance 1 > ½; `x ∈ {0, 1}` both on the boundary | correct |
| §2.15 exponent bound | `A < a + b log A` with `(a,b) = (10,1), (0,10)` | largest solutions `12.53`, `35.77`; bound `2a + 2b(log 2b − 1) = 19.39`, `39.9`; general proof: `log A ≤ log(2b) − 1 + A/(2b)` | correct |
| §2.33 Check `S = {2,3}` | all coprime `a + b = c` in `{2,3}`-units | `1+1=2, 1+2=3, 1+3=4, 1+8=9` and no other (`2ᵃ + 1 = 3ᵇ` only for `a ∈ {1,3}`, `3ᵇ + 1 = 2ᶜ` only for `b ∈ {0,1}`) | correct |
| §3.8 Checks | `g = 3x⁴ + 3` at `p = 3`; `g = −x⁴ − 1`; `2x⁴ − 34` | `3(x⁴+1)` has odd valuation for every `x ∈ ℚ₃` (`x⁴ + 1 ≡ 1, 2 mod 3` on `ℤ₃`; valuation `1 − 4k` off it) and `3` is not a square: no `ℚ₃`-point; `−x⁴ − 1 < 0` on `ℝ`; `y² = 2x⁴ − 34` is `(2y′)² = 2(x⁴ − 17)`, the Lind–Reichardt curve | correct; depth bound `k ≤ ord_p disc g` proved (R04) |
| §3.12 Check `y² = x³ + B` | `a₁ = a₂ = a₃ = a₄ = 0` | `Δ = −16·27B² = −432B²`, `j = 0`, `b₂ = 0`, so `μ_C = log|432B²|/6` | correct |
| §3.12 `cremona` vs source | `K = ℚ`, Cremona's "standard equation over ℤ" | Cremona §3.1 defines only "integral", "minimal" and "reduced"; Proposition 3.5.1 needs integrality (Silverman Theorem 1.1's hypothesis), which is `hW` | generality equal |
| §3.12 `silverman` normalisation | general `K`, `[K:ℚ] = d` | `ĥ_TC/d − h_TC/d = 2(ĥ_S − ½h_abs(x))`; `−h(j)/12 − 2μ − 1.946 ≤ … ≤ 2μ + 2.14`; `archimedeanLogHeight = (Σ_v n_v log max(1,|t|_v))/d = h_∞` | matches Theorem 1.1 |
| §3.17 Checks | `6ℤ ≤ ℤ`; `ℤ × 0 ≤ ℤ × ℤ/2`; `0 ≤ ℤ/p` | `5a ∈ 6ℤ ⇒ 6 ∣ a`; `2·3 ∈ 6ℤ, 3 ∉ 6ℤ`; `G ∩ 2A = 2ℤ×0 = 2G` but `A[2] = 0×ℤ/2 ⊄ G`; `p·a = 0 ∈ G` for `a ≠ 0` | all three correct |
| §3.22 `mordellWeil_basis…` | `r = 1`, `N = 1`; index `m` of `L = ⟨P_i⟩` in `E/T` | `det(E/T) = R/m²`; Hermite: `λ ≤ ĥ(Q) ≤ γ(R/m²)^{1/r}` so `m ≤ √R(γ/λ)^{r/2} = N`; every prime `p ∣ m` has `p ≤ N`, contradicting saturation, so `m = 1`; `det > 0` gives `|det| = det` | sound; Gram-determinant positivity needs the positive semidefiniteness of `⟨,⟩`, which `canonicalHeight ≥ 0` gives |
| §5.3 Check | `Γ = G = ℤ/2, L = Γ, X₀ = {0}, X₁ = {1}` | `Γ/L = 0`, `G/φ(L) = 0`, so the class `0` is admissible though no `g` has `g ∈ X₀ ∩ X₁ = ∅` | correct (nonemptiness proves nothing) |
| §6.7 gauge identities | `C = [[1,0,0],[Ω,1,0],[g,ΩᵀZ,1]]`, `N = C − 1` | `N² = [[0,0,0],[0,0,0],[ΩᵀZΩ,0,0]]`, `N³ = 0`, `C⁻¹ = 1 − N + N²`; `C⁻¹dC = [[0,0,0],[dΩ,0,0],[dg − ΩᵀZdΩ, dΩᵀZ, 0]]`; equal to `Λ = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]` iff `dΩ = −ω`, `dg = ΩᵀZdΩ − η` | matches Annals (29); Checks: `Z = [[0,1],[−1,0]], c = (1,0), Ω = (0,1)`: `cᵀZΩ = 1`; `𝔽₂`, `Z = diag(1,0)`, `Ω = (1,0)`: `ΩᵀZΩ − g = 1 ≠ −g = 0` |
| §6.16 `roots_determined_of_truncation` | `G = T^D·u`, `H = T^D − p^N`; `D = 0`; `G ≡ 0` | roots `0^{(D)}` vs `‖z‖ = p^{−N/D} ≤ p^{−N/d}` (tight at `D = d`); `D = 0`: both multisets empty; `G ≡ 0` is excluded by the Gauss-norm-one hypothesis and by `hmult` (`analyticOrderAt = ⊤`) | sound; cluster argument: on `|z − a| = r` with `ε^{1/d} < r < 1` crossing no root distance, `|G| ≥ r^D > ε^{D/d} ≥ ε ≥ |G − H|` gives equal zero counts |
| §6.21 | `K = ℚ(ζ₇)⁺`, `p = 17` | `17 ≡ 3 (mod 7)`, `3` has order 3 in `(ℤ/7)^×/{±1}`, so `17` is inert | correct |
| §6.36 Checks | `(1,3), (3,−1), (1,0), (1,−1)` in (ii); all `|X|,|Y| ≤ 200` | `1 − 108 − 216 + 324 = 1`; `81 − 108 + 24 + 4 = 1`; (i) has only `±(1,0)` in the box, (ii) exactly `±{(1,0),(1,−1),(1,3),(3,−1)}` | correct |
| §6.37 | the 11 listed `(x, y)` | `y² = x³ − 4x + 1` for all (e.g. `45473² = 2067793729 = 1274³ − 4·1274 + 1`) | correct |
| §6.38, §6.39 | largest solutions | `91 + 1771470 = 11⁶ = 1771561`, `1771470 = 2·3¹¹·5`; `F(48632, −3729) = 3.2·10¹⁴ = 2¹⁸·5¹³` | correct |

Counts: 22 adversarial rows with values, 16 sampled locators opened, 24 library declarations opened at the pins, 27 cross-roadmap sections resolved, 13 Lean signatures compared.

## Not verifiable

- matveev2000, §2 Corollary 2.3, p. 1219 (cited by §§2.2, 2.3, 2.15): the Math-Net.Ru full-text URL timed out three times (read timeout, two SSL handshake timeouts); the DOI landing page offers no PDF; the Izvestiya: Mathematics version of record is paywalled. The statement was checked instead against DiophantineApproximationAndTranscendence §3.6 on main (its line 2559), which restates the corollary with the same `C₁(n,κ)`, `A_j ≥ max{Dh(α_j), |λ_j|, 0.16}` and `B* = max|b_j|`; the Lean statement agrees with that restatement. Listed in `needs-references.toml` for a retry.
- yu1994 §0.1 p. 242: the text layer of the Numdam scan drops the displayed formulas (the README says so too). The words around them were checked: `B = max(|b₁|, …, |bₙ|, 3)`, `h′ = max(hₙ, 1)`, `log α_j` with imaginary part in `(−π, π]`, `p^{f_𝔭} − 1 ≤ p^d − 1`, no unit hypothesis on the `α_j`. The constant `22000·(9.5(n+1)d/√log p)^{2(n+1)}` itself was not read from the page image.
- bruinStoll2010: read in the arXiv version (0906.1934); the published page numbers 272, 273, 280, 301 cited by §§5.2, 5.3, 5.28, 5.29 could not be matched to the version of record, which the DOI landing page does not serve as open text.
- The numerical facts the applications take as hypotheses (unit groups, class numbers, `L′(f,1) ≠ 0`, the 545 and 72 solution tables) were not recomputed beyond the spot checks in the table.

## Source issues

- **Gap** in bdmtv2021 at Lemma 4.7, printed p. 25 (arXiv v4): the source requires only that no index `i ≥ m` has `ord_p(F_i) + i = n`; it should require `ord_p(F_i) + i ≥ n` for every `i ≥ m` (otherwise `F = 1 + x^m` with `m < n`, `k = 0` satisfies the hypothesis and `G` is not congruent to a polynomial of degree below `m`); affects the proof.
- **Error** in bdmtv2019 (arXiv v1 1711.05846) at (19), p. 22: the source says `dΩ_x = ω` and `dg_x = dΩ_xᵀZΩ_x − Ω_xᵀ(Z − Zᵀ)ω − η`; it should be `dΩ_x = −ω` and `dg_x = Ω_xᵀZ dΩ_x − η`, the equations that `C_x⁻¹dC_x = Λ` with `Λ = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]` forces; affects a stated result; corrected in print at Annals of Mathematics 189 (2019), (29), p. 915.

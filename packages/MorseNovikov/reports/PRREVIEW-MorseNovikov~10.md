# Review of MorseNovikov (pull request #1854 at c07dda7)

**Verdict:** needs changes

This pull request changes `TauCetiRoadmap/MorseNovikov/README.md` in two places: the supplier of the degree-one Hurewicz isomorphism `H₁=π₁ᵃᵇ` is now AlgebraicTopology Stage 8 item 3 rather than DGFloer Layer 1 item 1. As requested, this is a full review of the folder. Everything below is P3: no statement is false, no supply is upward or cyclic, and the build passes. The verdict is "needs changes" because the worker's gate fails (R01) and because six repairs are open.

## R01 (P3) — The gate fails on two files edited outside the roadmap folders

**Location.** The worker's gate on this head reports `outside-folder=2`: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`. Every other check is 0, including `build` and `depcheck`.

**Claim.** This pull request edits two folders that are not among the roadmap folders under review here, and no review covers those edits.

**Witness.** `git diff --stat origin/main...HEAD` with every reviewed folder excluded leaves exactly `Completed/ArithmeticDirichletSeries/README.md | 2 +-` and `TauCetiRoadmap/SymplecticGeometry/README.md | 6 +++---`.

**Repair.** Move these two edits (the 3-4-1 remark and the CG6 paragraph) to a pull request of their own. Alternatively, register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request so that each gets its own review. Either way, the gate's outside-folder count for MorseNovikov drops to 0.

## R02 (P3) — `AbelianCoverHomology` in Suggested.lean is padding and contradicts the README

**Location.** `TauCetiRoadmap/MorseNovikov/Suggested.lean` lines 102–133: `def doubling : ℤ →+ ℤ`, `def fiberMap : ℤ →+ ℤ × ZMod 2`, `doubling_injective`, `fiberMap_eq_zero`, `fiberMap_not_injective`. The module docstring's lines 26–27 point at it.

**Claim.** These five declarations compute small values of maps between ℤ and ℤ × ZMod 2 and mention no carrier of the roadmap. Specifically:
- The three theorems have no docstrings.
- The section sits after Layers 6–7, out of README order.
- README lines 1408–1411 say the file's supporting definitions are exactly `fixedPointDerivative`, `rationalHomologyMap` and `vectorFieldChartDerivative`, but the file has five definitions.

**Witness.** One-tactic probe on a scratch copy, elaborated with `lake env lean`; all three theorems close:
- `doubling_injective` by `intro a b h; simpa [doubling] using h`;
- `fiberMap_eq_zero` by `ext <;> simp [fiberMap, doubling] <;> decide` (the remaining goal is `(2 : ZMod 2) = 0`);
- `fiberMap_not_injective` by `exact fun h => one_ne_zero (h (by simp [fiberMap_eq_zero]) : (1:ℤ) = 0)`.

**Repair.** Delete lines 102–133 and docstring lines 26–27. README §2.3 keeps the calibration "n ↦ 2n upstairs, ↦ (0,0) downstairs" as prose. The remaining file then has exactly the three definitions and two theorems that README lines 1408–1411 describe.

## R03 (P3) — The docstring calls Layer 1, 4 and 5 carriers missing, but pinned Tau Ceti has them

**Location.** Suggested.lean lines 13–14: "Layer 1's completion and universal property lack the period-controlled completed group ring and topology". Also lines 17–20, which say Layers 4 and 5 lack "the based determinant-line torsion construction and the Novikov ring" and "the periodic orbit counting series and its completion".

**Claim.** These claims about the pins are false. The repository rule is: "When an earlier roadmap target is already implemented in Tau Ceti, prototype the new interface against that implementation." The acceptance test's statement of what is statable must therefore match the pins.

**Witness.** At the pinned Tau Ceti:
- `structure NovikovSeries` (RingTheory/NovikovSeries/Basic.lean:92);
- `TauCeti.NovikovSeries.completionPkg` (Topology.lean:349);
- `HomologicalComplex.reidemeisterTorsion` (Algebra/Homology/ReidemeisterTorsion/Basic.lean:291) and `reidemeisterTorsionWithHomology` (Homology.lean:226);
- `TauCeti.NovikovSeries.orbitZeta` (OrbitZeta.lean:104) and `orbitZeta_eq_mapRingHom_eulerProduct` (:264).

**Repair.** Replace those three sentences with:

> Layer 1's completion, functoriality and domain theorem are proved at the pinned Tau Ceti (`TauCeti.NovikovSeries.completionPkg`, `TauCeti.NovikovSeries.mapRingHom`, `TauCeti.NovikovSeries.isDomain_of_fg`). Layer 4's based torsion, with its basis-change, homology-basis and componentwise forms, is there too (`HomologicalComplex.reidemeisterTorsion`, `HomologicalComplex.reidemeisterTorsionWithHomology`, `HomologicalComplex.componentwiseReidemeisterTorsion`). So is Layer 5's algebraic product formula with integral coefficients (`TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct`). Two things remain not statable: the Novikov inequalities, which lack the Novikov homology of a closed one-form; and the zeta function and cover-norm theorem of a closed-one-form flow, which lack its periodic-orbit data.

Do not add Lean statements for these: each would close by `exact` with the pinned lemma.

## R04 (P3) — §3.3 plans a construction that pinned Tau Ceti already has; native supplier items are cited only through AlgebraicTopology

**Location.** README §3.3, line 552: "Construct an equivariant finite cellular chain complex of X̃ over ℤ[H] from a finite CW model of X and actual lifted attaching maps." Also lines 157–163 and §2.2 *Needs:*, which consume AT4.2–AT4.3 and AT8.3.

**Claim.** This object exists at the pin, so it must be cited, not planned. The cellular comparison and the H₁ Hurewicz isomorphism are also native: AlgebraicTopology at this head only "consumes" them. The README names neither.

**Witness.** At the pinned Tau Ceti:
- `TauCeti.cellularChainComplexRep : ChainComplex (Rep R G) ℕ` (AlgebraicTopology/Cellular/Covering.lean:153), free on chosen lifts by `TauCeti.cellularChainRepIsoFree` (:252), over `TauCeti.cwComplexPreimage` (Topology/CWComplex/Classical/Covering.lean:398);
- `TauCeti.cellularDifferential` (Cellular/Chains.lean:333) and `TauCeti.cellularSingularHomologyIso` (Cellular/Comparison.lean:244);
- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (Homotopy/Hurewicz/One/Basic.lean:705).

**Repair.**
1. In §3.3, replace the sentence with: "Consume `TauCeti.cellularChainComplexRep` on the lifted CW structure `TauCeti.cwComplexPreimage`, free over ℤ[H] on chosen lifts by `TauCeti.cellularChainRepIsoFree`."
2. Keep the completion `Nov⊗_(ℤ[H])–` and the comparisons as targets.
3. List the six declarations above, plus `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv` (Naturality.lean:100), under "From Tau Ceti" with their files.
4. In §2.2 *Needs:*, cite the native Hurewicz isomorphism beside AT8.3.

## R05 (P3) — Another open pull request changes this roadmap, conflicts with this one, and no order is stated

**Location.** The description's merge-order paragraph names only "#1101 → #1807 → this pull request" and #1808.

**Claim.** Open pull request #1161 changes MorseNovikov's `README.md` and `Suggested.lean` and conflicts with this head in both files. Its head still cites DGFloer Layer 1 item 1 as the supplier of H₁=π₁ᵃᵇ, which is the MorseNovikov → DGFloer edge this pull request removes. Merging it unchanged would reintroduce the cycle.

**Witness.** The worker's overlap report: "#1161 and #1854 conflict in README.md, Suggested.lean". #1161's README line 80 reads "π₁(X)ᵃᵇ ≅ H₁(X;ℤ): DGFloer Layer 1 item 1", and line 222 is "### From TauCetiRoadmap.DGFloer".

**Repair.** Add to the merge-order paragraph that #1161 is rebased onto this pull request before either merges. That rebase must replace #1161's DGFloer Layer 1 item 1 citations (its README lines 80, 222, 491, 550, 1377, 1436, 1462) with AlgebraicTopology Stage 8 item 3, or with the native declaration of R04.

## R06 (P3) — No cited text states the Lefschetz headline's local-index formula

**Location.** README §6.5, lines 1223–1224: "Hatcher §2.C, proof of Theorem 2C.3, pp. 180–181 supplies the chain/homology trace argument; §§5.2 and 6.4 construct the stronger local-index equality." §6.4's "Hopf's barycentric modification" has no locator.

**Claim.** The headline `lefschetz_fixed_point_formula` states Σ sgn det(1−df_x) = Σ(−1)^i tr f_*. No cited text states this equality.

**Witness.** Hatcher, Theorem 2C.3 (p. 179) concludes only that a map of a retract of a finite simplicial complex with τ(f) ≠ 0 has a fixed point. Its proof (pp. 180–181) uses a fixed-point-free simplicial approximation, not local indices.

**Repair.** Add a locator to a text that states and proves the Lefschetz–Hopf formula: the sum of fixed-point indices equals τ(f) for a compact ENR, with index sgn det(1−df_x) at a nondegenerate fixed point. Dold, *Lectures on Algebraic Topology*, Chapter VII, §6, is one candidate; record its proposition number from the text, or mark it uncertified if only the locator is available. Give the Hopf construction the same locator.

## R07 (P3) — Notation and layout slips in §4.1, §6.5 and the closing sections

**Location.** Three places:
- §4.1, line 646: `τ=±Π_i det(d_s:C_i→C_(i−1))^((-1)^i)`.
- §6.5: a second `**Checks.**` list (lines 1253–1257) directly follows the Checks of `rationalHomologyMap`.
- `## Worked examples` (line 1381) comes before `## Downstream consumers` and opens with build-order prose.

**Claim.**
- The determinant in the §4.1 formula is of the square projected minor D_i→E_(i−1) defined two lines earlier. C_i→C_(i−1) need not be square.
- The second §6.5 list tests the theorem, not the definition above it.

**Witness.** Take the acyclic complex ℚ →(1,−1)ᵀ→ ℚ² →(1,1)→ ℚ.
- The determinant of d₁ : C₁→C₀ is undefined (a 2→1 map).
- With D₁=⟨e₁⟩, E₀=C₀, D₂=C₂ and E₁=⟨e₂⟩, the minors are 1 and −1, giving τ=±1 (rt3 Prop. A.2, p. 239).

**Repair.**
1. Write `det(d_s:D_i→E_(i−1))` in §4.1.
2. Move the §6.5 list in lines 1253–1257 to directly after the theorem paragraph that ends at line 1224, as the theorem's Checks.
3. Put `## Downstream consumers` before `## Worked examples`, and move lines 1383–1389 into "How to read the build".

## Verified sound

**Gate and build.**
- Worker gate: every check is 0 except outside-folder (R01).
- `lake env lean` on Suggested.lean: exit 0, five `sorry` warnings and nothing else.
- `#check @` of all 10 declarations matches the worker's elaborated signatures. Both headlines keep `FiniteDimensional ℝ E`, `I.Boundaryless`, `IsManifold I ∞ M`, `T2Space`, `SecondCountableTopology` and `CompactSpace`, matching README §6.5 and §7.3. No binder is lost.
- One-tactic probe (`first | simp | rfl | infer_instance`) fails on both headlines, so neither is padding.

**Dependency check.** Output: `depcheck: 237 roadmaps, 2340 edges, 0 problem(s)`. No UPWARD or CYCLE line. MorseNovikov is on main, so it has no merge-order position. DGFloer now appears only under Downstream consumers (line 1415).

**Supplier citations resolved (12).** Each resolves on main or at this head:
- AlgebraicTopology Stages 1–7 (head lines 488–2146) and Stage 4 items 2–3.
- Stage 8 item 3 at this head, which consumes `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`.
- Completed UniversalCovers, Stage 2 item 8 (Galois correspondence and deck quotient).
- HeegaardFloer Lane M §§1.1–1.5 (M.1–M.5), §2.8 (F0.6) and F0 §§2.1–2.9.
- MorseTheory M1–M4 and M6.
- DifferentialGeometry and GeometricTopology layer sections.
- HeegaardFloer README lines 54–57 lists MorseNovikov among consumers that supply nothing: no reverse edge.

**Library declarations opened at the pins (16):**
- Mathlib: `singularHomologyFunctor` (AlgebraicTopology/SingularHomology/Basic.lean:52); `VectorField.mpullback` (Geometry/Manifold/VectorField/Pullback.lean:106, junk value zero at a non-invertible derivative, as the README says); `IsAddQuotientCoveringMap` (Topology/Covering/Quotient.lean:29); `LinearMap.trace` (LinearAlgebra/Trace.lean:75).
- Tau Ceti: `IsManifoldNondegenerateCriticalPoint` (Morse/Basic.lean:61); `manifoldMorseIndex` (Morse/Index.lean:79); `MorseChart` (Morse/Lemma.lean:69); `TauCeti.MorseChart.field` (PseudoGradient/Existence.lean:97); `Riemannian.Tensor.rieszDual` and `inner_rieszDual` (VectorBundle/Riemannian/Riesz.lean:77, 85); `exists_contMDiffAt_localFlow` (IntegralCurve/SmoothFlow.lean:58); `stableSet_eq_biUnion_orbit_localInvariantSet_Ici` (Analysis/Calculus/Morse/LocalToGlobal.lean:187); `isMeagre_image_criticalPoints_of_isFredholm` (Analysis/Fredholm/SardSmale.lean:409).
- The pinned Tau Ceti torsion convention (`reidemeisterTorsion`, exponent (−1)^j on [b_(j+1)s_j/c_(j+1)]) gives a⁻¹ for a: C₁→C₀, which agrees with §4.1.
- Neither pin has a fixed-point index, Lefschetz number, Poincaré–Hopf theorem or Euler structure, so the two headlines duplicate nothing.

**Ownership.**
- `roadmaps grep` for Novikov rings over main and the 463 open heads: FukayaTheory (README line 26, and Tau Ceti `NovikovSeries`) and DGFloer (line 182) consume Layers 1 and 4. Nobody else owns the completion or based torsion.
- CharacteristicClasses at this head (line 153) hands the Lefschetz formula to Layer 6.
- K3Surfaces consumes Layers 5–7.
- Poincaré–Hopf and the Lefschetz formula are owned only here.
- No other Suggested.lean declares a `TauCetiRoadmap.MorseNovikov.*` name, apart from #1161, which revises this same roadmap (R05).

**Seeded sample (15 targets): all locators agree with the text.** In rt3, journal page = PDF page + 208.

| Target | Locator checked | Result |
|---|---|---|
| 1.3 | rt3 §1.3, (1.1)–(1.2) and Remark 1.4, p. 212 (rt3 lines 162–212) | agrees |
| 1.4 | rt3 Example 1.3, p. 211 (lines 148–153); Lemma A.4 leading coefficients, p. 240 (lines 1900–1931) | agrees |
| 2.3 | Hatcher §1.2, pp. 51–52: Klein bottle as the word aba⁻¹b, i.e. aba⁻¹=b⁻¹ | agrees |
| 2.4 | rt3 §1.4 compactness, p. 213 (line 243); Lemma 2.2, pp. 218–219 (lines 538–575); expected dimension, p. 211 (lines 114–117) | agrees |
| 3.3 | rt3 (1.4), p. 213 (lines 252–258) | agrees |
| 3.4 | rt3 (1.4), p. 213; App. A, pp. 239–240 | agrees; top-degree vanishing is labelled derived |
| 4.1 | rt3 Def. A.1 and Prop. A.2, p. 239 (lines 1851–1875); Prop. A.5, p. 240 (lines 1933–1944); Milnor 1966 §3, p. 365 | agrees; Milnor's τ of C₁ →a→ C₀ is [a], the inverse convention |
| 4.4 | rt3 Lemma 3.5 and (3.8), p. 227 (lines 1076–1133); Prop. 3.6, p. 228 (lines 1146–1229) | agrees |
| 5.2 | rt3 §1.1, p. 210 (lines 64–82); Lemma 3.2, p. 223 (line 855) | agrees |
| 5.3 | rt3 (1.1)–(1.2), p. 212; Prop. 3.6(a), p. 228 | agrees; the corrected exponent is derived, see Source issues |
| 6.1 | rt3 Theorems A and B, pp. 214–215 (lines 322–344); Lemma 2.11 and (2.1), pp. 222–223 (lines 774–817); §§3.1–3.3, pp. 223–226 | agrees |
| 6.4 | rt3 Examples 1.7–1.9, pp. 215–216 (lines 354–417); rt2 Example 1.4, p. 372 (rt2 lines 150–154) | agrees |
| 6.5 | Hatcher Theorem 2C.3, p. 179; proof pp. 180–181 | agrees as worded; see R06 |
| 7.1 | rt3 Def. B.1, p. 241 (lines 1965–1992); Milnor TFDV §6, p. 35 | agrees |
| 7.3 | Milnor TFDV §6, Poincaré–Hopf theorem, p. 35 | agrees |

Also checked outside the sample:
- rt3 §2.1 Def. 2.6 and Lemmas 2.7–2.9 (pp. 220–221) for §4.3.
- rt3 Lemmas 3.7–3.10 (pp. 229–230) for §6.2.
- The family-Floer erratum paragraphs on §2.2 and Proposition 3.4, for §3.2.

**Adversarial pass (values computed on each side).**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `lefschetz_fixed_point_formula` | M=∅; point with f=id | 0 = 0; det on the 0-dim space is 1 ⇒ +1, tr on H₀=ℚ is 1 | holds |
| same | two points: swap; constant map | 0 = tr[[0,1],[1,0]] = 0; 1 = tr[[1,1],[0,0]] = 1 | holds |
| same | S¹ reflection; rotation | det(1−(−1)) = 2 ⇒ +1+1 = 2 = 1−(−1); 0 = 1−1 | holds |
| same | S² antipodal; rotation by θ | 0 = 1+(−1); det(I−R_θ) = 2−2cos θ > 0 ⇒ 2 = 1+1 | holds |
| same | RP², [x:y:z]↦[x:2y:3z] | minors diag(2,3): (−1)(−2) > 0; diag(½,3/2): −¼ < 0; diag(⅓,⅔): 2/9 > 0 ⇒ 1; H_*(RP²;ℚ) = ℚ in degree 0 | holds, nonorientable |
| same, wrong models | sign det(df−1); ℝ translation | reflection gives −2 ≠ 2, so that convention is excluded; LHS 0 ≠ RHS 1 shows `CompactSpace` is needed | conventions pinned |
| `poincare_hopf` | ∅; two points | 0 = 0; 1+1 = dim H₀ = 2 | holds |
| same | S¹ with sin θ ∂θ; T² with constant field | cos 0 = 1, cos π = −1 ⇒ 0 = 1−1; 0 = 1−2+1 | holds |
| same | S² height gradient; RP² Morse gradient | det I = 1, det(−I) = 1 ⇒ 2 = 1+0+1; indices 0,1,2 give 1−1+1 = 1 = dim H₀ | holds |
| `vectorFieldChartDerivative` | V=±x; V=x²; (−x,y) conjugated by diag(−1,1) | ±1; 0, so nondegeneracy fails; det −1 both before and after | determines the sign |
| `fixedPointDerivative` | f=−x; f=2x conjugated by 3x | det(1−(−1)) = 2; 3·2·3⁻¹ = 2 ⇒ det(1−2) = −1 | holds |
| §1.1 support condition | Σt^k with N(k)=k; N=0; R=0 | terms below 3: k = 0,1,2; square coefficient at t² is 3, at t⁻¹ is 0; infinitely many below C=1; R=0 is onto for every N, hence "nontrivial R" | holds |
| §1.2 maps | projection ℤ²→ℤ; precomposition along ℤ⊕ℤ/2→ℤ | 1+e^(0,1) ↦ 2; 1 ↦ 1+g, (1+g)² = 2+2g ≠ 1+g | not a ring map, as stated |
| §1.3 | (1−t)Σt^k; exp, log | coefficients 1,0,0; 1+t+t²/2; t−t²/2 | holds |
| §1.4 domain theorem | H=ℤ/2 | (1−g)(1+g) = 1−g² = 0 | torsion-free hypothesis needed |
| §2.3 cover | A, B on ℝ×ℝ/2ℤ | AB = (s+1,−y−1), BA = (s+1,−y+1), equal mod 2; B² = id; aba⁻¹b⁻¹ = b⁻², and π₁/⟨b²⟩ ≅ ℤ⊕ℤ/2 is abelian; 2[b] = 0 in H₁ | universal abelian cover |
| §2.4 dimension | index pairs (1,0), (0,0) | 0; −1, so absent | holds |
| §3.3 | exact circle; nonzero period | ℤ[t^±]/(1−t) = ℤ and H₁ = 0; (1−t)⁻¹ = Σt^k in ℤ((t)) | holds |
| §3.4 top degree | α=0 on S¹; nonzero period, untwisted and twisted | H₁ = ℤ ≠ 0, so [α]≠0 is needed; ker(1∓e^h) = 0 when N(h)≠0 | holds |
| §4.1 convention | ℚ →2→ ℚ; basis change A₀=3, A₁=5 | rt3: 2⁻¹; Milnor: 2; 3⁻¹·2·5 = 10/3 ⇒ τ = 3/10 = ½·3·5⁻¹ | holds; R07 notation |
| §4.4 norm and trace | s=t²; 1+t²; idempotent of ℤ[ℤ/2] | M_t = [[0,s],[1,0]], tr 0, det −s, Norm(1−t) = 1−s; Tr = 2+2s = 2ι*(1+s); norm of (1+g)/2 is 0 | (3.8) needed |
| §5.2 local index | x/2; 2x; x+x²−ε | det 1/2 ⇒ +1; det −1 ⇒ −1; 1−DP = −2x gives −1 at √ε and +1 at −√ε, total 0; ε<0 gives 0 | conserved |
| §5.3 iterate signs | multipliers ½, 2, −2 on a surface; critical-free circle | ε ≡ +1, factor (1−t)⁻¹; ε ≡ −1, factor (1−t); ε(γ^k) = (−1)^(k+1), factor (1+t), and (1+t)/(1−t²) = (1−t)⁻¹; log ζ = Σt^k/k | exponent (−1)^(n−i₀) holds |
| §5.3 cover norm | double circle cover; lifted orbits | Norm((1−t)⁻¹) = (1−s)⁻¹; (k/l)·l(−1)^m/p = k(−1)^m/p | holds without (3.8) |
| §6.1 Cerf fold | x³/3−εx; general chart | zeros ±√ε, second derivative ±2√ε, indices 0 and 1; indices i−1 (x₁>0) and i (x₁<0) | matches rt3 (2.1) |
| §6.1 / §6.4 circle | no critical points; one critical pair | τ = 1, ζ = (1−t)⁻¹; τ = (1−t)⁻¹, ζ = 1; same I | rt3 Ex. 1.7 |
| §6.2 covers | H=ℤ⊕ℤ/2, h=(2,1) | d in H/T is 2 (d in H is 1); μ₃(h) = 2·2 ≡ 1; ν₂(nh) = 2n ≡ 0 mod 4 iff n even; no map H→ℤ/4 sends h↦1 | README fixes the rt3 gap |
| §6.2 log norm | z = 1+c₂t²+…, d=k=2 | coefficient of e^(2h) is dk·(log z)₂ = 4c₂ | holds |
| §6.4 mapping torus | reflection and identity monodromy; unknot; trefoil | (1−t)⁻¹(1+t) = exp Σ_(k odd) 2t^k/k; L(id) = 0 ⇒ 1; (1−t)⁻²; Δ = t⁻¹−1+t is symmetric | holds |
| §7.1 / §7.2 Euler structures | S² gradient; S¹ nonsingular field; CN=0 | +1+1 = 2; Euler classes form an H₁ = ℤ torsor; volume e^h at ξ₀+h; (1−t)⁻¹ ↦ t(1−t)⁻¹ | holds |
| R02 padding | three theorems | each closes in one line (R02 witness) | padding |
| R03 docstring | pinned declarations | the declarations listed in R03, at the lines given there | carriers exist |


## Not verifiable

- V. Turaev, *Introduction to Combinatorial Torsions* (Birkhäuser 2001), and *Euler structures, nonsingular vector fields…* (1990): paywalled, with no legal copy found. Both appear only in References, with no locator that a target relies on.
- A. Pajitnov, *Circle-valued Morse Theory* (de Gruyter 2006): paywalled. It appears only in References.
- Milnor TFDV was read from the copy hosted on the University of Edinburgh mathematics site (Ranicki archive), the only copy the sources service holds. The DOI route led only to a review.

## Source issues

- **Gap** in rt3 at Lemmas 3.7(a) and 3.10, pp. 229–230: the source takes d as h's divisibility in H; with torsion (h=(2,1) in ℤ⊕ℤ/2, d=1) the needed maps to ℤ/4, resp. ℤ/2 killing torsion, with h↦1 do not exist; it should use the divisibility of h's image in H/T; affects the proof.
- **Error** in rt2 at equation (2), p. 371: the source says the primitive-orbit factor has exponent −(−1)^(i₀); it should be (−1)^(n−i₀), equal only for odd n (a surface orbit with multiplier ½ contributes (1−[γ])⁻¹); affects a stated result.
- **Gap** in rt3 at the proof of Lemma A.4, p. 240: the source deduces that L_j⊗Q(Nov(F,N)) is a field from Nov(F,N) being a domain; this needs ℚ algebraically closed in Q(Nov(F,N)), which a leading-coefficient argument gives; affects the proof.

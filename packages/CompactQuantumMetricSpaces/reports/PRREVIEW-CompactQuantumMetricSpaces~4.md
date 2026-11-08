# Review of CompactQuantumMetricSpaces (pull request #1155 at 9647ef8)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/CompactQuantumMetricSpaces/README.md` (1671 lines) and `TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean` (405 lines, 39 declarations, 17 `sorry`). This is a full review: the folder changed by 320 lines since 25e9712. The worker's gate passes every check, nothing changed outside the folder, and the dependency check reports no problem. One finding is P2: the gauge action of `C*(ℤᵈ, σ_Θ)` has two open owners. The other seven are P3.

Sources are cited by the line numbers of the sources service's extractions: rieffel98 = arXiv math/9807084v2, rieffel99 = math/9906151v2, rieffel00 = math/0011063v4.

## Status of the previous review's findings

- **Previous R01 (P3, three locators): not repaired.** README line 182 still reads "(Rieffel 2000, Definition 4.1, the set `M(L_E, L_F)`)" and line 1161 "Rieffel 2000, Definition 4.1 for the finite case". Line 1264 still cites "(Rieffel 2000, §4)" for the diameter estimate. §2.4 (lines 742–748) still has no locator. These are carried forward as R05 below.
- **Previous R02 (P3, quotient-distance estimate unstated): not repaired.** §5.5 line 1317 still says "use 2.5 for the quotient Lip-norm", and §5.6 lines 1334–1335 still say "use 2.5 to get a quotient `F` with `dim F ≤ card(net)` and `dist_q(E, F) < ε`". No section states Rieffel 2000, Proposition 5.7. This is carried forward as R06.

## R01 (P2) — The gauge action of `C*(ℤᵈ, σ_Θ)` has two open owners

**Location.** README Scope, lines 35–37: "for every `d`, the quantum-torus family … with its identification theorem, the point-norm continuity of its gauge action and its gauge-finite Fourier polynomials". §6.1, lines 1451–1453: "Prove that the gauge action of §6.0 is point-norm continuous … Construct the coefficient maps by gauge averaging, `E_p(a) = ∫ z^(−p) α_z(a) dz`".

**Claim.** This roadmap owns the point-norm continuity of the gauge action of `Tᵈ` on `A_Θ` and its Haar averages. It takes the algebra itself from HeisenbergImprimitivity §3.1.

**Witness.** The open OperatorAlgebraDynamics revision (#1137, head 2ccd93b) plans the same objects for every discrete abelian `G`. Its `TauCetiRoadmap/OperatorAlgebraDynamics/README.md`, lines 1148–1151 (D2.CentralTwists), proves that `γ ↦ α̂_γ` is point-norm continuous and that `∫ α̂_γ(x) dγ = E(x)1`. Its lines 37–43 claim single ownership of `C*(G,ω)`. Its lines 2940–2945 say that this roadmap's regular model, trace and `𝕋ᵈ` gauge action are D1/D2.CentralTwists'. HeisenbergImprimitivity (#1149, `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` lines 30–41) claims the same algebra.

**Test instance.** At `G = ℤᵈ`, `ω = σ_Θ`, both texts give `∫ α_z(W_q) dz = δ_(q,0)·1 = τ_Θ(W_q)·1`. This is the `p = 0` case of this README's `E_p`.

**Repair.** Settle one owner before either pull request merges, and state the choice in this pull request's merge-order paragraph. There are two options.
- **OperatorAlgebraDynamics owns the gauge analysis.** It is the earlier roadmap and states the general theorem. Then delete "the point-norm continuity of its gauge action" from Scope line 36. Replace the first sentence of §6.1 with a citation of OperatorAlgebraDynamics D2.CentralTwists for continuity and for `∫ α_z dz = τ_Θ(·)1`. Keep only `E_p` for `p ≠ 0` and the gauge-finite subalgebra as owned here. Name that revision in the merge-order paragraph.
- **HeisenbergImprimitivity §3.1 owns `C*(L, c)`.** Then the revision must withdraw its lines 37–43 and 2940–2945 claim before it merges, and this pull request's description must say so.

## R02 (P3) — A §0.1 Check's non-Archimedean witness is false

**Location.** README lines 349–352: "`ℝ²` with the cone `{x > |y|} ∪ {(t, −t) : t ≥ 0}` and `e = (1, 0)`: `(0, 1) ≤ ε e` for every `ε > 0` but `(0, 1) ≰ 0`, so the cone is not Archimedean".

**Claim.** `(0, 1) ≤ εe` holds for every `ε > 0`.

**Witness.** Take `ε = 1/2`. Then `εe − (0, 1) = (1/2, −1)`. This vector fails `x > |y|` because `1/2 < 1`, and it is not on the ray `(t, −t)`. So `(0, 1) ≤ εe` fails for every `ε < 1`.

**Repair.** Use `a = (−1, −1)` as the non-Archimedean witness. For every `ε > 0`, `εe − a = (1 + ε, 1)` lies in `{x > |y|}`. But `−a = (1, 1)` is not in the cone, so `a ≰ 0`. Keep `(0, 1)` for the second half of the Check: `‖(0, 1)‖ = 1`, and the interval formula fails at `r = 1` because `(1, 1)` is not in the cone.

**Repair tested.** For `a = (−1, −1)` the order-unit norm is `2`, attained through the ray point `(1, −1)`. The interval formula holds at `a`. This is consistent with the §0.1 API bullet: the formula fails at another element, `(0, 1)`.

## R03 (P3) — §6.5 states less than Rieffel's Theorem 9.2

**Location.** README lines 1584–1586: "the theorem `Ψ → Θ ⇒ dist_q((A_Ψ, L_Ψ), (A_Θ, L_Θ)) → 0`, … in every dimension and for `d = 0`, with local uniformity on compact parameter sets".

**Claim.** Continuity holds, uniformly only on compact parameter sets.

**Witness.** rieffel00 Theorem 9.2 (line 1666–1668, p. 43) gives one `δ` for all `θ, ψ` with `‖θ − ψ‖ < δ`. Lines 1806–1808 (p. 46) reduce this to compact sets by integer periodicity. The README proves that periodicity in the same section, yet stops at local uniformity.

**Repair.** State the global form: for every `ε > 0` there is `δ > 0` such that `‖Θ − Ψ‖ < δ` implies `dist_q < ε` for all `Θ, Ψ` (Rieffel 2000, Theorem 9.2). Derive it from uniform continuity on a compact neighbourhood of a fundamental domain, using the periodicity isometries `A_(Θ+N) ≅ A_Θ` of this section.

**Repair tested.** For `d = 2`, the transport gives `dist_q(A_θ, A_(θ+1)) = 0`. So uniform continuity on `[−1, 2]` already gives one `δ` on all of `ℝ`.

## R04 (P3) — The module docstring names a Tau Ceti declaration absent at the pin

**Location.** `Suggested.lean` line 28: "(Tau Ceti has only its smooth subalgebra `TauCeti.SmoothNoncommutativeTorus θ`)".

**Claim.** The pinned Tau Ceti declares `TauCeti.SmoothNoncommutativeTorus`.

**Witness.** At the pinned Tau Ceti a91d3aa (`lake-manifest.json`), a case-insensitive grep over `TauCeti/` for `NoncommutativeTorus`, "noncommutative torus" and "rotation algebra" finds nothing. The name occurs only in the NoncommutativeGeometry revision's README.

**Repair.** Replace the parenthesis with "(neither pinned library has the rotation algebra or its smooth subalgebra)".

**Repair tested.** The same grep confirms the replacement sentence.

## R05 (P3) — Three locators from the previous review are unrepaired

- **Notation, not Definition.** Line 182 reads "Rieffel 2000, Definition 4.1, the set `M(L_E, L_F)`", and line 1161 reads "Definition 4.1 for the finite case". The source item is "4.1 Notation" (rieffel00 line 620–621); Definition 4.2 (line 627) is the distance. Repair: "Notation 4.1" in both places, and in References line 1647.
- **§5.3 diameter estimate.** Lines 1261–1264 read "Prove `|diam E − diam F| ≤ 2 dist_q(E, F)` and the classical comparison … (Rieffel 2000, §4)". The diameter estimate is Lemma 13.6 (rieffel00 line 2542–2556). The comparison is Proposition 4.7 (line 736–739). Repair: "(Rieffel 2000, Lemma 13.6 and Proposition 4.7)".
- **§2.4 has no locator.** Lines 742–748 have none. Rieffel's morphisms of order-unit spaces, and the affine weak-star continuous dual map `S(ϕ)`, are the paragraph before Proposition 3.1 (rieffel00 lines 359–368). Proposition 3.3, which the previous review also suggested, is about closedness of quotient Lip-norms and is not the right locator. Repair: "(Rieffel 2000, §3, the paragraph on morphisms before Proposition 3.1)". The `C`-Lipschitz pullback estimate itself is owned here.

## R06 (P3) — The quotient-distance estimate is used twice and stated nowhere

**Location.** §5.6 lines 1334–1335: "use 2.5 to get a quotient `F` with `dim F ≤ card(net)` and `dist_q(E, F) < ε`". §5.5 line 1317: "use 2.5 for the quotient Lip-norm". The §5.6 Check at lines 1357–1358 says "at distance `≤ 1/(2n)`".

**Claim.** The quotient by a compact convex `K ⊆ S(E)` is within `dist_H(K, S(E))` of `E`.

**Witness.** That inference is Proposition 5.7 (rieffel00 line 966–971), invoked at line 2423 for Theorem 13.1. §2.5 gives only `S(F) = K`. The §5.6 Check moves from a Hausdorff distance `1/(2n)` to `dist_q ≤ 1/(2n)` through it.

**Repair.** Add to §5.2 the target: "for compact convex `K₁, K₂ ⊆ S(E)` with quotients `F₁, F₂` of 2.5, `dist_q(F₁, F₂) ≤ dist_H(K₁, K₂)` for `ρ_(L_E)`; in particular `dist_q(E, F) ≤ dist_H(K, S(E))` (Rieffel 2000, Proposition 5.7)". Cite it in §5.5 and §5.6.

**Repair tested.** On the Check's net `{δ_(k/n)}` of `C([0, 1])`, the Hausdorff distance is `1/(2n)` (push mass to the nearest grid point). The new target then gives the Check's bound `1/(2n)`.

## R07 (P3) — Further locators point beside the claim

- **Order-unit spaces are in Rieffel 1999 §1, not §2.**
  - Location: §0.1 line 327, §0.2 line 367 and §0.3 line 399 cite "(Rieffel 1999, §2 …)", and References line 1640 says "§2 for order-unit spaces".
  - Witness: the order-unit norm, states and Kadison's representation are rieffel99 §1, "Recollections on order-unit spaces" (lines 101–132). §2 is "The radius of the state space" (line 147). Rieffel 1998 §1 (lines 95–105) works with a normed space and a seminorm, not with the order-unit norm.
  - Repair: cite "Rieffel 1999, §1" in §0.1–§0.3. In References write "§1 for order-unit spaces, §2 for the dual-ball identity (Lemma 2.1) and the radius (Proposition 2.2)".
- **Rieffel 1998 has no Definition 2.1.**
  - Location: §1.1 line 493, "(Rieffel 1998, Definition 2.1 for the finite case …)".
  - Witness: the extracted text of Rieffel 1998 contains no "Definition" at all. Its (2.1a–c) at lines 307–313 are the length-function axioms.
  - Repair: "(Rieffel 1999, §2, the definition of a Lipschitz seminorm; Rieffel 2000, Definition 2.1)". The source lines are rieffel99 152–154 and rieffel00 258–261.
- **§0.5 has no locator.** Repair: "(Rieffel 2000, §3, the paragraph on morphisms before Proposition 3.1, and Proposition 3.5)". The source lines are rieffel00 359–368 and 512–515.
- **§4.3 compactness of `α_f`.** "`α_f` … is a compact operator on `A` when every isotypic space is finite dimensional" (line 1027–1028) has no locator. It is Rieffel 1998, Lemma 2.5 (line 413–420). Repair: add it.
- **§4.4 placement of the `χ` discussion.**
  - Location: line 1060, "(Rieffel 2000, §8, discussion before Proposition 8.1 and Theorem 8.2)".
  - Witness: the faithful representation and `χ` are introduced after Proposition 8.1 (rieffel00 lines 1440–1447). The strict maximum of `χ` at `e` is in the proof of Theorem 8.2 (lines 1486–1492).
  - Repair: "(Rieffel 2000, §8, between Proposition 8.1 and Theorem 8.2, and the proof of Theorem 8.2)".
- **§4.5 equality `actionLip = L_der`.**
  - Location: line 1101 attributes the equality to "(Rieffel 1998, Theorem 3.1)".
  - Witness: that theorem (lines 464–467) states only the weak-star conclusion. Its proof (lines 476–490) gives `actionLip ≤ ‖da‖`, "for any norm on g". The reverse inequality is this README's own.
  - Repair: "(Rieffel 1998, proof of Theorem 3.1, for `actionLip ≤ L_der`; the reverse inequality is owned here)".
- **Wrong Mathlib file for `RealRMK.rieszMeasure`.**
  - Location: line 209–210 cites `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Basic.lean` for `RealRMK.rieszMeasure`.
  - Witness: at the pin it is `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean` line 65 (namespace `RealRMK`, line 52). The `rieszMeasure` in `Basic.lean` (line 324) is `NNRealRMK`'s.
  - Repair: correct the path.

## R08 (P3) — Two one-tactic lemmas in Suggested.lean

**Location.** `Suggested.lean` lines 115–123: `stateEDist_self` (proved by `simp [stateEDist]`) and `stateEDist_comm` (proved by `simp only [stateEDist, abs_sub_comm]`).

**Claim.** These declarations are part of the acceptance test.

**Witness.** Each closes in one tactic. They serve only as the `edist_self` and `edist_comm` fields of `stateEMetricSpace`.

**Repair.**
- Delete both theorems from `Suggested.lean`.
- Write the fields as `edist_self φ := by simp [stateEDist]` and `edist_comm φ ψ := by simp only [stateEDist, abs_sub_comm]`.
- In README §1.2 (line 521), drop the backticks on the two names; the README keeps them as stated targets.

**Repair tested.** A scratch copy with exactly this change elaborates with exit 0 and the same 17 `sorry` warnings, and no other diagnostic.

## Verified sound

**Gate and direction.**
- The worker's gate at 9647ef8 reports: `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty, and `metadata.toml` holds only `topic = "math.OA"`.
- My rerun of the dependency check prints:

```
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

- Merge order: CompactQuantumMetricSpaces is at line 206 of the merge order. Its suppliers VonNeumannAlgebras (line 5) and CStarAlgebras (line 7) come earlier, and every other supplier is on main.
- HeisenbergImprimitivity and SmoothBanachRepresentations are not in the board's merge order. They are new-folder pull requests of the same operator, listed before #1155 in the description's depends-on list and merge-order paragraph. Neither cites this roadmap as a supplier: HeisenbergImprimitivity names it only under Downstream consumers (line 816), and SmoothBanachRepresentations likewise.

**Elaboration and signatures.**
- I ran `lake env lean` on a scratch copy with `#check @name` for all 39 declarations: exit 0, 17 "declaration uses `sorry`" warnings, nothing else.
- I compared each elaborated type with its README statement. Since the previous head, the only change is the deletion of `exists_faithful_unitary_representation`, which is now consumed from CharacteristicClasses; no binder was lost.
- Context audit:
  - The predicates and definitions carry only the instances their types mention (`IsOrderUnitNorm`, `stateSpace`, `centeredUnitBall`, `leftState`, `rightState`: `[PartialOrder]`; `ExtendedLipschitzSeminorm`, `stateEDist`, `IsLipNorm`, `IsClosedLipNorm`, `scalarLine`: no order).
  - Every theorem carries `[IsOrderedAddMonoid] [PosSMulMono ℝ]` and `IsOrderUnitNorm` where it needs them.
  - `quantumGHEDist_eq_zero_iff` carries `[CompleteSpace E] [CompleteSpace F]`. `exists_limit_of_cauchySeq_quantumGHEDist` carries `[∀ n, CompleteSpace (E n)]` and returns `CompleteSpace F`.
  - `exists_closedLipNorm_actionLip` carries `[CompactSpace G] [T2Space G] [IsTopologicalGroup G]`, together with `hℓ`, `hα` and `herg`.

**Padding probe.** On a second copy each `sorry` was replaced by `first | rfl | simp | infer_instance | (intros; rfl) | (intros; simp) | aesop`. All 17 sites fail (17 errors, each "aesop made no progress" or unsolved goals). The only one-tactic declarations are the two in R08.

**Lean form.**
- Imports are `import Mathlib` and `TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic`, whose object file is present.
- There is no `set_option`, no `lemma`, no `#eval` and no sorried data.
- `integrationState` has a real body proved in place, and `stateEMetricSpace` has honest data.
- Every Lean name occurs in the README.

**Headlines.**
- The Summary lists `tendsto_stateEDist_iff`, `closedLipNorm_recovery`, `stateEDist_integrationState`, `exists_closedLipNorm_actionLip`, `quantumGHEDist_triangle`, `quantumGHEDist_eq_zero_iff`, `exists_limit_of_cauchySeq_quantumGHEDist`, `totallyBounded_quantumGHEDist_iff` and the quantum-torus continuity. All but the last are stated.
- The docstring names three items as not statable: the isometry-class metric space, `Φ_θ` and the quantum-torus continuity. For the last two the reasons were checked at the pins:
  - Mathlib has no rotation algebra: a grep for "rotation algebra", `NoncommutativeTorus` and "quantum torus" finds nothing.
  - Tau Ceti's `TauCeti.twistedMonoidAlgebra` has no star, norm or completion: `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean` defines it at line 282, there are no star or norm instances in that folder, and `Finite.lean` is the only other file.
- Stating the continuity would need twisted shifts on `lp`, a closed star-subalgebra with its C*-structure, and the order instances on its self-adjoint part. I judge that a long ad hoc encoding, so I do not raise its absence. R04 corrects only the parenthesis.

**Supplier citations resolved (16).**

On main (eaf17b1):

| Supplier | Item | README line |
|---|---|---|
| BanachSpaceTheory | B1 | 54 |
| BanachSpaceTheory | B5 | 800 |
| VonNeumannAlgebras | Layer 0 | 275 |
| VonNeumannAlgebras | V8.CompactErgodicActions, now on main through #889 (arbitrary compact Hausdorff `G`, Haar expectation, unique faithful tracial invariant state, finite multiplicity) | 2037–2039 |
| RepresentationTheory/CompactGroups | Layers 0–5 | 205–318 |
| RepresentationTheory/LieGroups | Layer 2, with "Cartan's automatic-smoothness corollary" | 275, 294–296 |
| CharacteristicClasses | C1 item 3, "one finite faithful unitary representation"; compact Lie branch "including finite discrete groups" at 42–43 | 664–667 |
| OptimalTransport | Layers 0–3 | 346, 395, 444, 504 |
| NoncommutativeGeometry | N5 | 410 |
| NoncommutativeGeometry | N6 (`U₂U₁=exp(2πiθ)U₁U₂` at 484) | 475 |
| NoncommutativeGeometry | N7 (`D=−i(σ₁δ₁−σ₂δ₂)` at 534) | 530 |
| RiemannianGeometry | R7.1–R7.8 | 1303 |
| SpinGeometry | G6 | 569 |
| OperatorAlgebraDynamics | D2 | 143 |
| AmenableGroups | Layer 6 | 391 |

At open heads:
- CStarAlgebras (#860, 33ddcef): C1 = Layer 1 (line 232) and C2 = Layer 2, with C2.1 state extension (line 544).
- SmoothBanachRepresentations (#1145, 2e5d798):
  - §2.1 (line 187): `E^k`, `E^∞`, linearity in `X`.
  - §3.1 (line 231): `dπ` with `p_m(dπ(X)v) ≤ C p_(m+1)(v)`.
  - §8.1 (line 484): dense complete Fréchet subalgebra, derivations, star law for star-preserving actions.
- HeisenbergImprimitivity (#1149, ea88c1a): §3.1 (lines 440–462).
  - It contains `λ_c(x)h(y)=c(x,y−x)h(y−x)`, `C*(L,c)=C*_r(L,c)`, the universal property, the faithful `τ(f)=f(0)`, the Fourier coefficients, and the gauge action with fixed algebra `ℂ1`.
  - The star `f*(x)=conj(c(−x,x))conj(f(−x))` is in its Conventions.

CharacteristicClasses C1 item 3 is unchanged in the three open revisions that touch CharacteristicClasses (#1807 line 668, #1808 line 707, #1854 line 672).

**Pinned declarations opened (16).**

Mathlib:
- `WeakDual.isCompact_closedBall` (`Mathlib/Analysis/Normed/Module/WeakDual.lean:269`).
- `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one` (`Mathlib/Analysis/CStarAlgebra/PositiveLinearFunctional.lean:74`).
- `PositiveContinuousLinearMap` (`Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Positive.lean:31`).
- `exists_extension_norm_eq` (`Mathlib/Analysis/Normed/Module/HahnBanach.lean:43`).
- `geometric_hahn_banach_closed_point` (`Mathlib/Analysis/LocallyConvex/Separation.lean:230`).
- `BoundedContinuousFunction.arzela_ascoli` (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:109`).
- `Metric.hausdorffEDist` (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean:259`).
- `GromovHausdorff.ghDist` (`Mathlib/Topology/MetricSpace/GromovHausdorff.lean:175`).
- `RealRMK.rieszMeasure` (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean:65`).
- `ContinuousMap.toLp` (`Mathlib/MeasureTheory/Function/LpSpace/ContinuousFunctions.lean:143`).
- `MeasureTheory.L1.integralCLM` (`Mathlib/MeasureTheory/Integral/Bochner/L1.lean:533`).
- `GroupNorm` (`Mathlib/Analysis/Normed/Group/Seminorm.lean:110`).
- `LieGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`).
- `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:58`).

Tau Ceti, all in `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean`:
- `TauCeti.IsFactorSet` (line 97): the cocycle `α (g*h) j * α g h = α h j * α g (h*j)`, normalized.
- `TauCeti.TwistedMonoidAlgebra.of_mul_of` (line 330), `lift` (line 391) and `equivOfCoboundary` (line 501), with hypothesis `β g h * c (g*h) = α g h * (c g * c h)` from the `β`-algebra to the `α`-algebra.

**Ownership.**
- `roadmaps grep` over main and all open heads finds:
  - "Følner box"/`F_nᵈ`: only this roadmap.
  - "quantum Gromov"/`dist_q`: this roadmap and SpectralManifolds, a consumer.
  - "Lip-norm": this roadmap and one passing mention each in QuantumFoundations, SpectralManifolds and the OperatorAlgebraDynamics revision.
  - "order-unit space": this roadmap and QuantumFoundations, a consumer.
  - "twisted group C*": OperatorAlgebraDynamics (#1137), HeisenbergImprimitivity (#1149) and this roadmap. The conflict is R01.
- Ownership against open pull requests was checked through the brief's sibling checkouts and `roadmaps grep`.
- No roadmap on main cites this roadmap, so no dropped id breaks a citation.

**Sources: the seeded sample and every locator a finding touches** (27 rows, all read at the line given).

| README target | Source item | Lines | Agrees |
|---|---|---|---|
| 0.1 order-unit norm, order from norm | rieffel99 §1 | 101–112 | statement yes; locator R07 |
| 0.2–0.3 states, compactness, Kadison | rieffel99 §1; rieffel98 §1 | 121–132; 106 | statement yes; locator R07 |
| 0.4 quotient norm and dual ball | rieffel99 §1 end, Lemma 2.1 | 143–146, 174–184 | yes; README's `ω`-rescaling matches the source's `µ − (tν + (1 − t)µ)` |
| 0.5 functoriality, order quotient | rieffel00 §3, Prop 3.5 | 359–368, 512–515 | yes; locator R07 |
| 1.1 Lipschitz seminorm | rieffel99 §2; rieffel00 Def 2.1 | 152–154; 258–261 | yes; "Rieffel 1998, Definition 2.1" does not exist (R07) |
| 1.2 state distance | rieffel98 §1; rieffel99 §2 | 134–136; 156–158 | yes |
| 1.3 radius identity | rieffel99 Prop 2.2 | 193–207 | yes |
| 1.4 criterion | rieffel98 Thm 1.8, 1.9 | 203–215, 263–269 | yes |
| 1.6 counterexamples | rieffel99 §2 end, Ex 3.5 | 210–212, 249–258 | yes; README's `G_n` is the source's `f_n + 1/(2n)` |
| 2.1 closure, kernel loss | rieffel99 Thm 4.2, after Prop 4.4 | 316–320, 366–369 | yes |
| 2.2 recovery | rieffel99 Thm 4.1 | 310–313 | yes |
| 2.3 metrics from norms | rieffel99 Def 9.1, (9.2), Def 9.3, Def 9.5, Thm 9.7, Thm 9.11 | 788–790, 800, 805, 834–836, 842–845, 920–923 | yes; misprint recorded |
| 2.4 Lipschitz maps | rieffel00 §3 morphisms | 359–368 | no locator (R05) |
| 2.5 quotients | rieffel00 Prop 3.1, Prop 3.5, remark | 376–385, 512–525, 386–389 | yes |
| 3.2 compact metric spaces | rieffel98 §1; rieffel99 §2, §4 | 73–88; 300–304 | standard; substance agrees |
| 4.3 ergodic closed Lip-norm | rieffel98 Thm 2.3, Lemma 2.4, Lemma 2.5; rieffel00 Prop 8.1 | 368–370, 386–405, 413–420; 1437–1439 | yes; Lemma 2.5 uncited (R07) |
| 4.4 kernels, `P_n` | rieffel00 §8, Thm 8.2, Lemma 8.3, Lemma 8.4 | 1440–1492, 1539–1557 | yes; placement R07; Lemma 8.4 uses only centrality, as the README says |
| 4.5 derivative seminorm | rieffel98 Thm 3.1 and proof | 464–467, 476–490 | one inequality only (R07) |
| 5.1 admissible Lip-norms | rieffel00 Notation 4.1, Def 4.2 | 620–630 | yes; "Definition" (R05) |
| 5.3 triangle, comparison, diameters | rieffel00 Thm 4.3, Prop 4.7, Lemma 13.6 | 638–640, 736–739, 2542–2556 | yes; locator R05 |
| 5.6 approximation, compactness | rieffel00 Thm 13.1, Def 13.4, Thm 13.5, Prop 13.7 | 2410–2423, 2473–2489, 2496–2509, 2582–2592 | yes; Prop 5.7 (966–971) unstated (R06) |
| 6.0 twisted convolution | rieffel00 §9, (9.1) | 1627–1640 | yes: `σ(q,p) = σ(q,p−q)` since `σ(q,q) = 1` |
| 6.2 Lip-norms on quantum tori | rieffel00 §9 | 1655–1661 | yes |
| 6.3 norm continuity | rieffel00 Lemma 9.3, remark | 1708–1716, 1722–1748 | yes |
| 6.4 finite-dimensional continuity | rieffel00 Lemma 10.1, Thm 11.2 | 1830–1835, 2138–2144 | yes |
| 6.5 metric continuity | rieffel00 Thm 9.2, periodicity | 1666–1668, 1806–1808 | README narrower (R03) |

**Adversarial table** (52 rows; values computed by me).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 interval formula | `ℝ²`, `e=(1,1)`, `a=(1,1)` | Euclidean `√2`, but `−e ≤ a ≤ e`; max norm `1` | formula selects the order-unit norm | none |
| 0.1 Check 2 cone | `(0,1)`, `ε=1/2`; `a=(−1,−1)` | `(1/2,−1)` not in cone; `(1+ε,1)` in cone, `(1,1)` not | Check false | R02 |
| 0.1 `a ≥ 0 ↔ ‖‖a‖e−a‖ ≤ ‖a‖` | `(1,0)`; `(1,−1)` | `‖(0,1)‖ = 1 ≤ 1`; `‖(0,2)‖ = 2 > 1` | both directions | none |
| 0.2 normalization without positivity | `(a₁,a₂) ↦ 2a₁ − a₂` | value `1` at `e`, norm `3` | not a state | none |
| 0.3 `norm_eq_iSup_states` | `ℝ²`, `(1,−1)`; `C[0,1]`, `t − 1/2` | `sup |2t−1| = 1`; `max(1/2, 1/2) = 1/2` | holds | none |
| 0.3 `stateSpace_nonempty`, `isCompact_stateSpace` | `E = ℝ`; `E = 0` | `S = {id}`; `‖0‖ = 0 ≠ 1`, so `he` excludes the zero space | holds | none |
| 0.4 dual ball | `λ = (1/2,−1/2)` | `φ = (3/4,1/4)`, `ψ = (1/4,3/4)`; source form `ev₁ − (ev₂/2 + ev₁/2) = λ` | exact | none |
| 0.4 quotient norm | `a = (3,1)` | `(3−1)/2 = 1 = ‖a − 2e‖` | holds | none |
| 0.5 edge quotient | `ℝ³`, `K = [ev₁, ev₂]` | quotient `ℝ²`, `S = K` | holds | none |
| 0.5 algebraic quotient by `o(t)` | class of `t` | `ε − t + max(t−ε, 0) ≥ 0`, so `[t] ≤ ε[1]`; `g ≥ t` with `g = o(t)` impossible | non-Archimedean | none |
| 1.1 kernel axiom | `|a₁|`; `∞` off `ℝe` | kernel `{a₁ = 0}`; domain not dense | both excluded | none |
| 1.2 `ρ(δ_x, Leb)` | `x = 0`, `x = 1/2` | `x² − x + 1/2`: `1/2`, `1/4` | holds | none |
| 1.3 radius | `L = |a₁−a₂|`, `L/2` | diam `1`, `r = 1/2`; diam `2`, `r = 1` | holds | none |
| 1.6 `‖q‖` on `ℓ^∞` | `e_n − e_m` | `‖q‖ = (1−(−1))/2 = 1` | not totally bounded | none |
| 1.6 `G_n` | `n = 2` | `G₂ − (t+1) = −1/4` for `t ≥ 1/2`, `+1/4` for `t ≤ −1/2`; `L(G₂) = 1`, `L(t+1) = 2` | not closed | none |
| 2.1 kernel loss | polynomials on `[0,2]`, `g = (s−1)²₊` | `L(p_n) → 0`, `‖q(p_n)‖ ≥ 1/2 − ‖p_n − g‖` | `g` in closure kernel | none |
| 2.1 graph norm | `√((t−1/2)² + 1/n)` | limit `|t − 1/2| ∉ C¹`; derivatives converge to `sign`, not uniformly | incomplete vs complete | none |
| 2.2 `closedLipNorm_recovery` | `a = re`; `√t`, `δ_h`, `δ_0` | `0`; `h^(−1/2) → ∞` | `0/0 = 0`, `x/∞ = 0` correct | none |
| 2.3 simplex | side `√2` | `‖(1/2,1/2,−1)‖₂ = √1.5 < √2 = W₁` | extreme points do not recover `L` | none |
| 2.3 `|x−y|²` | `0, 1/2, 1` | `1 > 1/4 + 1/4` | metric hypothesis needed | none |
| 2.4 pullback direction | `T = id`, `L_F = L_E/2` | `ρ_E(T*φ, T*ψ) = ρ_F/2` | correct | R05 |
| 2.5 quotient vs restriction | `|a₁−a₂| + 2|a₂−a₃|` | `inf_t = |b₁ − b₃|` at `t = b₃`; restriction `2|a₁ − a₃|` | differ | none |
| 2.5 image vs quotient norm | `K = [δ₀, (δ₀+δ₁)/2]`, `b = (0,1)` | `1`; every lift has `a(1) = 2`: `2` | not identified | none |
| 3.1 `classicalLip` | `t²` on `[0,1]`; `X = ∅` | `2`; `0` | holds | none |
| 3.2 `exists_closedLipNorm_classicalLip` | `X = {0,1}`; `√x`, `r = 1` | `|f(0) − f(1)|`; `‖√x − min(x, √x)‖ = 1/4` at `x = 1/4` | holds | none |
| 3.3 `stateEDist_integrationState` | `{0,1}`; `δ_(1/2)` vs Leb | `|t − s|`; `1/4` | equals `W₁` | none |
| 3.5 commutator | `M₂`, `diag(1,−1)` | entries `2a₁₂`, `−2a₂₁`; kernel diagonal | not a Lip-norm | none |
| 4.1 inverse law | `C(T)`, `2 + z` | `L(f) = 1`, `‖f⁻¹‖ = 1`, `L(f⁻¹) = 1` | equality | none |
| 4.3 `exists_closedLipNorm_actionLip` | `T`, `ℓ = |θ|`; `ℤ/2`; `A = 0` | `∫ℓ = π/2`, diam `π`; `1/2`, diam `1`; `L = 0` satisfies all fields | true, sharp | none |
| 4.3 compact `α_f` | finite multiplicity | rieffel98 Lemma 2.5 | locator missing | R07 |
| 4.4 kernels | `T`, `1⊕z`; `ℤ/2`, `1⊕sgn`; `T`, `1⊕z²` | `2 + 2cosθ`, max `4`; `k_n = 2·1_{1}`, `δ_n = 0`; `δ_n → π/2` | Checks correct | none |
| 4.4 supplier scope | finite `ℤ/2` | regular rep faithful; CharacteristicClasses covers finite groups | holds | none |
| 4.5 `actionLip = L_der` | path integral; `exp(tX)` | `≤` from the path argument, `≥` from `ℓ(exp tX) ≤ t‖X‖` | equality true | R07 (locator) |
| 5.1 two infima | `ℝ²` vs `ℝ`, `M_δ` | `ρ = |t − 1/2| + δ`, Hausdorff `1/2 + δ`; lower bound `1/2` | both `1/2` | none |
| 5.2 compatibility | `P = id`, `L_F = L_E/2` | diam `1` vs `2`, `dist_q ≥ 1/2` | Check correct | none |
| 5.3 `quantumGHEDist_triangle` | `E = H = ℝ²`, `F = ℝ` | `0 ≤ 1/2 + 1/2` | holds | none |
| 5.3 diameter estimate | `ρ_M(µ_j, ν_j) < d + ε` | `ρ(µ₁, µ₂) ≤ diam F + 2(d + ε)` | Lemma 13.6 | R05 |
| 5.3 two-point spaces | `d = 1` vs `d = 2` | `ghDist = 1/2`; `dist_q ≥ 1/2` | equality | none |
| 5.4 `quantumGHEDist_eq_zero_iff` | `C¹` vs `C[0,1]` | distance `0`, not order isomorphic; `C¹` fails `CompleteSpace` | hypothesis needed and present | none |
| 5.5 `exists_limit_of_cauchySeq_quantumGHEDist` | constant; `E_n = ℝ` | limit `E`; `ℝ` with `L = 0` | holds | none |
| 5.6 `totallyBounded_quantumGHEDist_iff` | `(ℝ², t|a₁−a₂|)`, `t → 0` | diam `1/t` unbounded; both sides false | consistent | none |
| 5.6 `Scv` | `[0,1]`, `ε = 1/4`, `0.3` | `⌈1/(2ε)⌉ = 2`, `2` | holds | none |
| 5.6 `Fin` by net | `δ_(k/n)` | `dist_H = 1/(2n)` ⇒ `dist_q ≤ 1/(2n)`; `n + 1 ≤ 1/ε + 2` | step unstated | R06 |
| 6.0 supplier convention | `λ_c(x)δ_q` | `c(x,q)δ_(x+q)`; variant gives `σ_(−Θ)(x,q)` | matches HeisenbergImprimitivity | none |
| 6.0 `W_p* = W_(−p)` | `σ(−p,p)` | `exp(−πi pᵀΘp) = 1` | holds | none |
| 6.0 lift injective | `W_pδ₀` | `σ(p,0)δ_p = δ_p` | holds | none |
| 6.0 identification theorem | `d = 1`, `C({±1})`; `C(T)` | `V₂ = 1`, `τ_B(V₂) = 1 ≠ 0`; `Φ = id`, `τ_B` faithful as conclusion | negative and positive cases | none |
| 6.1 `E_p` | `a = W_q` | `∫ z^(q−p) dz · W_q = δ_(p,q)W_q = τ(W_qW_p*)W_p` | holds | R01 (owner) |
| 6.1 `Φ_θ` phases | `U₁`, `U₂` on `δ_(m,n)` | `e^(−πiθn)`, `e^(πiθm)` on both sides | holds | none |
| 6.2–6.4 Dirac bound, Harper, support | `W_(1,0) + W_(−1,0)`; `θ = 1/2`; `a = (−1,−3)` | `‖x‖ = 4π` both bounds; `‖H‖² = 8` vs `16` at `0`; `−1` for `R ≥ 2`, `1` at `R = 1` | Checks correct | none |
| 6.5 coboundary transport | `d = 2`, `N₁₂ = 1`, `p = (1,0)`, `q = (0,1)` | `σ_(Θ+N)/σ_Θ = e^(πi) = −1`; `b(p)b(q)/b(p+q) = −1`; `b = ±1` real, so star preserved | `equivOfCoboundary` direction correct | none |
| 6.5 uniformity | `d = 2`, `θ` and `θ + 1` | `dist_q = 0` by transport | global uniformity holds | R03 |

**Checks per definition.**
- Every `### k.n` carries at least three Checks: 0.1–0.5: 4/4/4/5/3; 1.1–1.6: 3/4/4/4/3/3; 2.1–2.5: 4/4/3/3/4; 3.1–3.6: 4/4/4/3/3/3; 4.1–4.6: 4/3/4/4/3/3; 5.1–5.6: 4/3/3/3/3/4; 6.0–6.5: 7/4/3/4/3/4.
- Each subsection has a `*Needs:*` line, and all 7 layers end with `### Examples` and `### Dependencies`.

**Counts.** 27 sampled locators read at their lines, 16 supplier citations resolved, 16 pinned declarations opened, 39 Lean declarations elaborated and compared with the README, 17 sorried statements probed for padding, and 52 adversarial rows.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): the DOI 10.2307/1971377 resolves to JSTOR, which is paywalled. It is consumed only through VonNeumannAlgebras V8.CompactErgodicActions.
- rieffel00 Lemmas 13.8–13.11 (lines 2608–2665) were read for their statements only. Their proofs were not rechecked line by line, since the README cites only Proposition 13.7 for that conclusion.

## Source issues

- **Misprint** in rieffel99 at Theorem 9.11, printed page 26: the source says the metric must be convex, midpoint balanced and midpoint convex; it should be midpoint concave, the condition of its Definition 9.5 used in Theorem 9.7; affects nothing.
- **Gap** in rieffel00 at the remark before §10, printed page 46: the source says the quantum tori are unchanged when integers are added to the entries of θ; it should say isometrically isomorphic, by rescaling generators with a ±1-valued coboundary, since σ changes by exp(πi p·Nq); affects the proof.

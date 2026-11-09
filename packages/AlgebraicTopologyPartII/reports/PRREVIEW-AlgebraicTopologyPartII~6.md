# Review of AlgebraicTopologyPartII (pull request #1694 at c6348a9)

**Verdict:** needs changes

This is an incremental re-review of the 115 lines changed since ca3704e. The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check reports no problem. Four of the five previous findings are repaired. Two P3 findings remain, and neither blocks:
- the gap sentence raised in the previous two reviews;
- a model mismatch that the §16.1 repair introduced.

## R01 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R02, not repaired)

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 132: "Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** This sentence is the declared contract for `gap:configuration-cover-comparison`.

**Witness.** `packages/AlgebraicTopologyPartII/design/plan.json` gives section "3.5–3.8 and 6.5" and needs "Expose §§3.5–3.8 and §6.5 … compatible in one comparison diagram." A script comparing all 14 README gap sentences with the plan finds 13 equal.

**Repair.**
1. Replace the text after "(gap:configuration-cover-comparison): " with the plan's `needs`, word for word.
2. Nothing else changes: line 130 already states the compatibility with IG.0.T2–IG.0.T4 as ordinary prose.

Both supplier sections exist at the head of EtaleDualityAndPerverseSheaves (#1040): §3.8 at README line 3626 and §6.5 at line 6934. No repair report marks this finding not actionable. I searched FIX-RT~1, REV-PKG~3 and every PRREVIEW report.

**Test.** The README-versus-plan comparison then reports 14 of 14 equal.

## R02 (P3) — The pinned regular-fibre atlas does not meet §16.1's fibre hypothesis

**Location.** `Suggested.lean` lines 244–245 ("for instance the regular-fibre atlas `TauCeti.regularFiberChartedSpace`") and line 259 (`[ChartedSpace (EuclideanSpace ℝ (Fin (n - k))) {x : M // f x = b}]`). The same claim appears in README line 1525 ("The regular-fibre atlas `TauCeti.regularFiberChartedSpace` is one") and line 78 ("After the linear identification …").

**Claim.** The pinned regular-fibre atlas satisfies the fibre hypotheses of `equivariantEhresmannTransport`.

**Witness.** `TauCeti.regularFiberChartedSpace` (`TauCeti/Geometry/Manifold/RegularValue/ManifoldLevel.lean:198`) is an atlas on `Fin (finrank ℝ E − finrank ℝ F) → ℝ`. Supplying it at line 259 fails with "Type mismatch … ChartedSpace (EuclideanSpace ℝ (Fin (n - k)))".

No pinned declaration and no target of this roadmap changes the model of an atlas while keeping `IsManifold` and `IsSmoothEmbedding`. So the headline's fibre hypothesis has no witness at the pins.

**Repair.** Use the model the pin provides, up to an equation of natural numbers.
1. In `equivariantEhresmannTransport`:
   - in the three fibre binders (lines 259–261), replace `EuclideanSpace ℝ (Fin (n - k))` by `Fin (n - k) → ℝ` and `𝓡 (n - k)` by `𝓘(ℝ, Fin (n - k) → ℝ)`;
   - in both `ContMDiffOn` clauses (lines 264–265), replace `𝓡 (n - k)` by `𝓘(ℝ, Fin (n - k) → ℝ)`.
2. In README line 78, replace the last sentence with one saying that rewriting `finrank ℝ (EuclideanSpace ℝ (Fin n)) − finrank ℝ (EuclideanSpace ℝ (Fin k))` to n − k by `finrank_euclideanSpace_fin` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean:225`) turns `TauCeti.exists_regularFiber_smoothEmbedding` into the fibre hypotheses of §16.1.
3. In README line 1525, write "a smooth structure modelled on `Fin (n − k) → ℝ`".

The theorem's truth does not change, because the uniqueness argument of line 1525 does not depend on the model. If the author prefers to keep `EuclideanSpace`, the alternative is to drop the "is one" claims and add the change of model as a target of §16.1.

**Test.** I tested this in a scratch file under `lake env lean`.
- The repaired statement elaborates, with only the `sorry` warning.
- A theorem proved with no `sorry` derives the repaired hypotheses from the pin:
  1. obtain the atlas, `IsManifold` and `IsSmoothEmbedding` from `TauCeti.exists_regularFiber_smoothEmbedding (m := ∞) (by simp) hf BoundarylessManifold.isInteriorPoint hreg`;
  2. `revert` them;
  3. `rw` with the finrank equation, which `simp` proves;
  4. `exact` them.
- The direct use of the atlas under the head's binders fails, as quoted in the witness.

## Previous findings

- R01 — repaired: `theorem equivariantEhresmannTransport` (`Suggested.lean` line 249) states §16.1 for a proper smooth f, smooth involutions, a σ_B-fixed regular value b and a smoothly embedded fibre; the not-statable list no longer names Ehresmann. The repair introduced R02.
- R02 — not repaired: README line 132 still reads "Expose §§3.5–3.7 on the ordered-root S_m torsor … with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4." It is R01 above.
- R03 — repaired: line 286 is `structure IsSmoothStratification [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)] (incl : ∀ i, S i → X)`, after `variable (d) in`; the elaborated type carries `(d : ι → ℕ)` and both instances, and the ℚ witness no longer elaborates.
- R04 — repaired: the five theorems are gone from `Suggested.lean`; README lines 1541, 1543 and 1573 keep them as prose targets ("Prove that for a smooth stratification the incidence relation is a strict order, irreflexive and transitive …"), with no backticks.
- R05 — repaired: README line 1573 says "These two are Mather's conditions (A10)–(A11) (MATHER §8, PDF p.25, MATHER lines 672–677) … The third condition is not among Mather's axioms"; `Suggested.lean` lines 338–342 match.

## Verified sound

**Gate and build**
- **Gate at c6348a9:** `gate AlgebraicTopologyPartII: set_option=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopologyPartII'` is empty.
- **Dependency check:** `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 14 warnings `declaration uses 'sorry'`, at lines 69, 108, 165, 174, 189, 215, 231, 249, 371, 400, 415, 469, 486 and 502, and no error. No module needed building, and the worktree stays clean.
- **`#check @name` on all 38 declarations in one scratch file,** compared with the README:
  - `equivariantEhresmannTransport` carries every hypothesis of README line 1525: T2 and second countable on M and B, `IsManifold` on both, `ContMDiff` f, `IsProperMap f`, two smooth involutions, `f ∘ σM = σB ∘ f`, `σB b = b`, `TauCeti.IsRegularValue … f b`, and the fibre structure with `Manifold.IsSmoothEmbedding`.
  - `IsSmoothStratification` elaborates to `{X} → [TopologicalSpace X] → {ι} → (d : ι → ℕ) → {S} → [∀ i, TopologicalSpace (S i)] → [∀ i, ChartedSpace …] → [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)] → (∀ i, S i → X) → Prop`.
  - `exists_flow`, `exists_isControlledVectorField_lift` and `exists_trivialization` take `IsSmoothStratification d incl`, with the manifold instance among their binders.
- **Leads in `signatures.md`:**
  - The 7 "looks dropped" leads are all false. `ControlData`, `IsCompatible`, `IsInvariant`, `IsNormalized`, `IsControlledSubmersion`, `WhitneyB` and `IsWhitneyStratification` all show `[∀ i, TopologicalSpace (S i)]` and `[∀ i, ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]`.
  - The entry `the` (line 245) is the signature tool reading the docstring word "instance" at the start of that line; there is no such declaration.
  - The four names in `citations.md` are this roadmap's own declarations, and all are declared.
- **One-tactic probe on the new theorem:** `intros` followed by each of `simp`, `rfl`, `infer_instance`, `trivial`, `exact ⟨⟩` and `constructor <;> simp` fails. The theorem is not padding.
- **Form:**
  - The imports are `Mathlib` and four existing `TauCeti.*` modules; `TauCeti.Geometry.Manifold.RegularValue` is new and provides `IsRegularValue`.
  - There is no `set_option` and no `lemma`, and every declaration has a docstring.
  - Definitions have real bodies, with no sorry'd data.

**Headline theorems.** 14 are stated: the 13 listed in the previous report and `equivariantEhresmannTransport` (§16.1). The five former API theorems are README prose targets. The not-statable list in the module docstring is unchanged apart from the Ehresmann clause, and each remaining entry was checked previously.

**Library declarations opened at the pins**
- Tau Ceti:
  - `TauCeti.IsRegularPoint` and `TauCeti.IsRegularValue` (`Geometry/Manifold/RegularValue.lean:86, 92`): the derivative is surjective at every point of the fibre, so a value outside the range is regular;
  - in `Geometry/Manifold/RegularValue/ManifoldLevel.lean`:
    - `regularFiberChartedSpace` (`:198`);
    - `isManifold_regularFiber` (`:215`);
    - `isSmoothEmbedding_coe_regularFiber` (`:225`);
    - `exists_regularFiber_smoothEmbedding` (`:257`).

    The module docstring there confirms that the atlas needs no Hausdorff hypothesis, allows an empty fibre and is not a global instance, as README line 78 says.
- Mathlib:
  - `Manifold.IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean:70`, an immersion that is a topological embedding);
  - `ContMDiff.iff_comp_isImmersion` (`Geometry/Manifold/Immersion.lean:995`), which supports README line 1525's claim that the smooth structure on the fibre is unique;
  - `Bundle.Trivialization` (`Topology/FiberBundle/Trivialization.lean:376`; `source_eq` and `target_eq` at lines 71–72);
  - `IsProperMap.isClosedMap` (`Topology/Maps/Proper/Basic.lean:92`), which the proof sketch uses for the critical image;
  - `ChartedSpace.comp` (`Geometry/Manifold/ChartedSpace.lean:293`), `HasGroupoid.comp` (`Geometry/Manifold/LocalInvariantProperties.lean:681`) and `ModelWithCorners.transContinuousLinearEquiv` (`Geometry/Manifold/Diffeomorph.lean:399`). Each needs extra work before it can change an atlas's model, which is why R02 asks for the model the pin provides;
  - `finrank_euclideanSpace_fin` (`Analysis/InnerProductSpace/PiL2.lean:225`).

**Sources: the seeded sample in the changed passages,** each read at its locator.
- **§16.1** (changed, not in the sample): B19 lines 1253–1261, Proposition 6.6 proof, printed p.94. The neighbourhood is G-stable and its real points are fixed by G, so the base involution is trivial on the real parameter neighbourhood, as line 1525 now says. DIMCA is uncertified.
- **§16.1a:**
  - MATHER line 206 (§5, PDF p.10, Whitney prestratifications);
  - lines 635–645 (PDF p.24, axioms (A3)–(A5): manifold strata, local finiteness, frontier condition).
- **§16.1b:**
  - MATHER line 480 (control data, PDF p.19) and lines 485–487 (compatibility);
  - lines 672–677 ((A10)–(A11), PDF p.25);
  - lines 669–671 (every prestratified set is equivalent to one satisfying them);
  - lines 510–511 (PDF p.20: the tubular retraction on an admissible ε-tube is proper);
  - lines 928–931 (Corollary 10.4 proof, PDF p.32: shrinking T_X makes (ρ_X, π_X) proper).

  Every condition is now attributed to a passage that states it.
- **§16.1c:** MATHER line 488 (Proposition 7.1, PDF p.19), line 512 (Lemma 7.3, PDF p.20) and lines 672–677.
- **§16.1d** (Lean binders touched): MATHER line 715 (controlled submersion, PDF p.26), line 727 (Proposition 9.1), line 825 (Proposition 10.1, PDF p.29) and lines 895–902 (Corollary 10.2 proof, PDF p.31).
- **Other sample targets:** 2.1, 3.1, 4.2, 4.3, 5.2, 7.4, 9.4, 11.5, 12.2, 15.1 and 16.3 lie in passages this head does not change. Earlier reviews checked them, so I did not re-read them.

**Adversarial table.** The rows for statements this head leaves untouched are carried from the previous report (r5); their values are those computed there. New rows have values computed here.

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `equivariantEhresmannTransport` (new) | README Check: f=x² on ℝ, σ_M=−x, σ_B=id, b=1 | n−k=0, F={−1,1}, U=(0,∞), h(x)=(x²,x/\|x\|): (e(σ_M x)).2=−x/\|x\| / σ_M((e x).2)=−x/\|x\|; σ_B⁻¹U=U | holds |
| same | b=0 | df(0)=0 is not onto, so `hreg` fails / fibres over c<0, c=0, c>0 have 0, 1, 2 points: no trivialization near 0 | `hreg` needed |
| same | b=−1 | F=∅, U=(−∞,0) / f⁻¹(U)=∅=source, target U×∅=∅ | holds (empty fibre) |
| same | ℝ×S¹→ℝ, σ_B(t)=−t, σ_M(t,z)=(−t,z̄), b=0 | e(t,z)=(t,(0,z)): (e(σ_M(t,z))).2=(0,z̄) / σ_M(0,z)=(0,z̄) | holds with nontrivial σ_B |
| same | n<k: M a point, B=ℝ, f≡0, b=1 | `n - k` is the junk value 0 / a nonempty fibre needs ℝ⁰→ℝ¹ onto, so F=∅ and U=ℝ∖{0} | holds; junk harmless |
| same | k=0, B countable and discrete | F=f⁻¹(b) open and closed, dimension n−0=n / U={b}, e(x)=(b,x) | holds |
| same | not proper: ℝ∖{1}↪ℝ, b=1 | F=∅ and `hreg` holds vacuously / every U∋1 has f⁻¹(U)≠∅ while U×∅=∅ | `hp` needed |
| same | σ_M not an involution: ℝ×S¹, σ_M(t,z)=(t,e^{it}z), σ_B=id | the fibre map over t=π would conjugate rotation by π to the identity / impossible | `hσM2` needed |
| same | pinned atlas as the fibre structure | model `Fin (finrank−finrank) → ℝ` / required `EuclideanSpace ℝ (Fin (n−k))`: type mismatch | R02 |
| `IsSmoothStratification` (binders changed) | X=ℚ, one stratum `id`, d=0 | r5: predicate proved / now "failed to synthesize ChartedSpace (EuclideanSpace ℝ (Fin 0)) ℚ" | repaired |
| same | closed disc: ∂D (d=1), D° (d=2) | all 7 fields hold; StratumLT ∂D D° true / StratumLT D° ∂D false | holds |
| same | ℝ with the atlas {id, x↦x³} | transition x^{1/3} is not C¹ at 0 / no `IsManifold (𝓡 1) ∞` instance, so excluded | the binder separates |
| `exists_flow`, `exists_isControlledVectorField_lift`, `exists_trivialization` (argument `d` added) | r5 instances | rotation dρ₀=−2xy+2xy=0 / inward radial dρ₀=−2\|v\|; ∂_x lifts ∂_t; x²+y²: fibre a point / a circle | unchanged |
| `ControlData.IsNormalized` (docstring only) | T=(−1,1)∪(1,2) | {ρ≤ε} ⊇ (1,1+ε], not compact / after shrinking to (−1,1), compact | holds; locators now MATHER 672–677 and 511 |
| §16.1a prose targets (strict order, open union, Whitney ⇒ smooth, d_i<d_j) | closed disc; spiral onto S¹ (r5) | U={D°} upward closed and open / U={∂D} not upward closed; spiral: frontier holds, (b) fails, dimensions 1=1 | carried |
| §16.1b normalisation prose target | a={0}, b={5}, T_a=(−1,1)∪(4,6) (r5) | T_a∋5: not normalised / deleting (4,6) normalises | carried |
| `configurationTraceFormula` (r5) | q=2, m=2, χ=sgn; χ≡1 | sgn: +1−1=0 / 0−0; χ≡1: 2 / 4−2=2 | holds |
| `eulerExponent`, §3.3 (r5) | n even and odd, N=2; q=2, c=±1 | −2,−1,−2 and 2,−3,2 / BS (7.2) the same; 1,2,2 / 1+2U+2U² | holds |
| `stableConfigurationDiagonal` (r5) | (0,2,2,2); (0,1,1,0) | 1 / 1; `hd` fails, 0 against 1 | holds; `hd` needed |
| §4.3, §4.4, `rationalBouquetRanks` (r5) | N=2, n=3; s=0, k=0,1,2 | rank 3 / 3; 2,3,2 / 2, 2+L₂, L₃ | holds |
| `tameFibreBouquet` (r5) | x³−3x+y², a=0,±2; n=0 | μ=2: two circles / one circle at ±2; n=0: empty fibre | holds; n≥1 needed |
| `doubleLoopBetti`, `phamStrongRetraction`, `fermatDoubleLoopSimplyConnected` (r5) | S⁴; K₂,₃; n=4,5 | 1,0,1,0,1,1,1 / ℚ[y₂]⊗Λ(z₅); 2 / 2; S³: π₃=ℤ≠0 | holds; n≥5 needed |
| §§6.1, 7.4, 8.1, 9.5, 10.1, 14.1–14.2, 15.3, 16.4 (r5) | as in r5 | values as recorded there (for example §8.1: H⁰,H¹(G,ℤ(1))=0,𝔽₂) | holds |
| `WhitneyB`, `ControlData`, `IsCompatible`, `exists_controlData_isCompatible`, `firstIsotopyLemma`, `equivariantStratifiedTransport` (r5) | cusp; t·sin(1/t); 3 strata of ℝ²; ℝ×S¹ with conjugation | \|t\|/2→0 / distance→1; det 2xy/√(x²+2y²)≠0; unaveraged h(π/2,1)=(π/2,−i) / averaged h=id | holds |

**Cross-roadmap citations resolved**
- EtaleDualityAndPerverseSheaves §§3.5, 3.6, 3.7, 3.8 and 6.5 at its open head: README lines 3319, 3387, 3541, 3626 and 6934.
- SmoothBundlesConnections §B1 item 5 is the owner of ordinary Ehresmann that README line 20 names; §16.1's new route uses it only on the complement of the closed critical image.

**Ownership.** `roadmaps grep` over main and every open head for an equivariant Ehresmann theorem or equivariant local trivializations of a submersion finds it only here. The one other match, TopologicalKTheory (#1807) README lines 112 and 1389, concerns orthonormal frame bundles, a different object. `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.

**Gaps.** All 14 gaps are declared with a named supplier and the same slug in `plan.json` and the README; 13 sentences equal the plan's, and R01 is the 14th.

**Remark on unchanged text, no change asked.** The §16.1 proof sketch applies the proper-surjective-submersion theorem off the critical image, where f need not be surjective. This is harmless: the image is open and closed there, a connected neighbourhood of b inside it suffices, and the sketch handles b outside the image separately.

## Not verifiable

- These are settled and cited by locator only, so I did not read them:
  - uncertified: DIMCA Lemma 4 (pp.369–374, the §16.1 locator), HILTON, BRUMFIEL, SCHEIDERER and BCR;
  - waived: KRASNOV.
- MATHER is an OCR scan. Proposition numbers, axiom labels and page markers are legible, and the wording was read through the OCR noise.
- Ownership against open pull requests was checked through the `roadmaps grep` and `overlaps` tools at the heads indexed on 2026-11-08.

## Source issues

- none

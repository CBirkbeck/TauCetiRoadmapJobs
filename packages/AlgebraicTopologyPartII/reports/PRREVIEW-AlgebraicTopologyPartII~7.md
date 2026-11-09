# Review of AlgebraicTopologyPartII (pull request #1694 at 674154f)

**Verdict:** needs changes

This is an incremental re-review of the 23 lines changed since c6348a9. The gate passes, and `Suggested.lean` elaborates with `sorry` as the only warning. The dependency check reports no problem.

The §16.1 model repair (previous R02) is correct: a `sorry`-free derivation from the pinned regular-fibre theorem now satisfies the theorem's hypotheses. One P3 finding remains, and it does not block.

## R01 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R01, not repaired)

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` line 132: "What EtaleDualityAndPerverseSheaves must provide (gap:configuration-cover-comparison): Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** This sentence is the declared contract for `gap:configuration-cover-comparison`.

**Witness.** `packages/AlgebraicTopologyPartII/design/plan.json` gives section "3.5–3.8 and 6.5" and needs "Expose §§3.5–3.8 and §6.5 … compatible in one comparison diagram." Comparing the README's 14 gap sentences with the plan, 13 are equal and this one differs.

**Repair.**
1. Replace the text after "(gap:configuration-cover-comparison): " with the plan's `needs`, word for word.
2. Change nothing else. Line 130 already states the compatibility with IG.0.T2–IG.0.T4 as ordinary prose.

Both supplier sections exist at the head of EtaleDualityAndPerverseSheaves: §3.8 "Analytic smooth trace compatibility" at README line 3626 and §6.5 "Contraction and Frobenius twisting" at line 6934.

No repair report marks this finding not actionable. The reports folder has no repair report after the previous review, and the commit since then changes only §16.1.

**Test.** After the repair, the README-versus-plan comparison reports 14 of 14 equal.

## Previous findings

- R01 — not repaired: README line 132 still reads "Expose §§3.5–3.7 on the ordered-root S_m torsor … with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4." It is R01 above.
- R02 — repaired: the three fibre binders and both `ContMDiffOn` clauses of `equivariantEhresmannTransport` now use `Fin (n - k) → ℝ` and `𝓘(ℝ, Fin (n - k) → ℝ)`. README lines 78 and 1525 say `finrank_euclideanSpace_fin` rewrites the pinned model. The repair introduced no new problem.

## Verified sound

**Gate and build**
- **Gate at 674154f** (run here): `gate AlgebraicTopologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on this head also reports `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopologyPartII'` is empty.
- **Dependency check:** `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 14 warnings `declaration uses 'sorry'`, at lines 69, 108, 165, 174, 189, 215, 231, 250, 374, 403, 418, 472, 489 and 505, and no error. No module needed building, and the worktree stays clean.
- **`#check @name` on all 38 declarations** (the file followed by 38 `#check` lines, elaborated once): no error.
  - `equivariantEhresmannTransport` elaborates to the following hypotheses:
    - T2 and second countable on M and B, with `IsManifold … ⊤` on both;
    - `ContMDiff` for f, and `IsProperMap f`;
    - two smooth involutions, with `f (σM x) = σB (f x)` and `σB b = b`;
    - `TauCeti.IsRegularValue (𝓡 n) (𝓡 k) f b`;
    - `[ChartedSpace (Fin (n - k) → ℝ) {x // f x = b}]`, `[IsManifold (modelWithCornersSelf ℝ (Fin (n - k) → ℝ)) ⊤ _]` and `Manifold.IsSmoothEmbedding (modelWithCornersSelf ℝ (Fin (n - k) → ℝ)) (𝓡 n) ⊤ Subtype.val`.

    This matches README line 1525 word for word on hypotheses and on the model.
  - The 7 "looks dropped" leads in `signatures.md` are false again. `ControlData.IsCompatible` and the other six all carry `[(i : ι) → TopologicalSpace (S i)]` and `[(i : ι) → ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]`. `IsSmoothStratification` carries `(d : ι → ℕ)` explicitly.
  - The four Lean-name leads in `citations.md` (`ControlData.IsControlledSubmersion`, `ControlData.IsControlledVectorField`, `ControlData.exists_flow`, `ControlData.exists_isControlledVectorField_lift`) are this roadmap's own declarations, and all four elaborated in that file. `citations.md` finds no cross-roadmap citation missing.

**Test of the R02 repair** (scratch copy of the statement, `lake env lean`):
- `fibre_hyps` is proved with no `sorry`. From `ContMDiff (𝓡 n) (𝓡 k) ∞ f` and `IsRegularValue … f b` it obtains `TauCeti.exists_regularFiber_smoothEmbedding (m := ∞) (by simp) hf BoundarylessManifold.isInteriorPoint hreg`, reverts the atlas, and rewrites with `finrank ℝ (EuclideanSpace ℝ (Fin n)) - finrank ℝ (EuclideanSpace ℝ (Fin k)) = n - k` (by `simp`). This yields exactly the head's three fibre hypotheses.
- `applies` then feeds them to the copied headline, with no further glue.
- The negative control is passing `TauCeti.regularFiberChartedSpace` directly, without the rewrite. It fails with "Type mismatch … `Fin (finrank ℝ (EuclideanSpace ℝ (Fin n)) - finrank ℝ (EuclideanSpace ℝ (Fin k))) → ℝ` … expected `Fin (n - k) → ℝ`". So the README's "once `finrank_euclideanSpace_fin` rewrites its model" states exactly the step that is needed.

**One-tactic probe on the changed theorem.** After `intros`, each of `simp`, `rfl`, `infer_instance`, `trivial`, `exact ⟨⟩`, `constructor <;> simp`, `aesop` and `exact?` fails ("`exact?` could not close the goal"). The theorem is not padding.

**Library declarations opened at the pins**
- Tau Ceti, `TauCeti/Geometry/Manifold/RegularValue/ManifoldLevel.lean`:
  - `regularFiberChartedSpace` (`:198`), modelled on `Fin (finrank ℝ E - finrank ℝ F) → ℝ`, with `[I.Boundaryless]` on the source model and `J.IsInteriorPoint c`;
  - `isManifold_regularFiber` (`:215`);
  - `isSmoothEmbedding_coe_regularFiber` (`:225`);
  - `exists_regularFiber_smoothEmbedding` (`:257`), which needs `1 ≤ m`, `ContMDiff I J m f`, an interior value and `IsRegularValue`, and no separation axiom.

  README line 78 describes all four correctly, including "not a global instance", "no Hausdorff hypothesis" and "the fibre may be empty".
- Mathlib:
  - `finrank_euclideanSpace_fin` (`Mathlib/Analysis/InnerProductSpace/PiL2.lean:225`), `Module.finrank 𝕜 (EuclideanSpace 𝕜 (Fin n)) = n` for `[RCLike 𝕜]`, cited at that file in README line 78 and in the §16.1 *Needs:* line;
  - `BoundarylessManifold.isInteriorPoint` (`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:188`), which supplies the interior-value hypothesis for the boundaryless B of §16.1.

**Sources**
- **§16.1 locator** (in the changed paragraph): B19 line 1257, PDF page 32 (printed p.94), Proposition 6.6 proof. The source invokes a G-equivariant Ehresmann theorem citing [28, Lemma 4] (DIMCA) on a G-stable neighbourhood with its real points. This agrees with "B19, Proposition 6.6 proof, pp.94–95, B19 line 1257" and with the remark that σ_B is trivial there.
- **Seeded sample** (2.2, 3.1, 4.2, 9.1, 9.2, 9.3, 11.4, 11.5, 13.3, 14.1, 14.2, 15.2, 16.1a, 16.3, 16.4): none falls in the changed passages (README lines 78, 1525 and 1537, and `Suggested.lean` lines 241–270). Earlier reviews checked them.
- **§16.1a spot-check**, next to the change: MATHER line 206 (§5, PDF p.10, Whitney prestratifications) and lines 635–645 (§8, axioms (A3)–(A5)) still match the README's locators "MATHER §5, PDF p.10, MATHER line 206" and "MATHER §8, PDF pp.23–24".

**Cross-roadmap citations of §16.1 resolved on main**
- SmoothBundlesConnections §B1.5 "Ehresmann connections and Ehresmann's fibration theorem": README line 498.
- GeometricTopology Layer 1: line 177.
- AlgebraicTopology Stage 5: line 849.
- DifferentialGeometry Layer 3 "flows": line 371.
- EtaleDualityAndPerverseSheaves §§3.5, 3.6, 3.7, 3.8 and 6.5 at its open head: README lines 3319, 3387, 3541, 3626 and 6934.
- §16.2 (README line 1675) and its *Needs:* line (1686) use §16.1 only for the averaged-chart linearization. `equivariantStratifiedTransport` does not involve the fibre model, so the model change affects no consumer.

**Ownership and overlaps.** The change adds no construction; it cites pinned Tau Ceti and Mathlib declarations. `overlaps.md` lists no other pull request that changes this roadmap, no dropped id and no id that only an open revision defines. Ownership against open pull requests was checked through the `roadmaps` tools at the heads indexed on 2026-11-09.

**Gaps.** All 14 gaps are declared with a named supplier and the same slug in `plan.json` and the README. Thirteen sentences equal the plan's word for word; R01 is the fourteenth.

**Adversarial table.** The rows marked "new" were computed at this head for the changed statement. The rows marked "r6" are carried from the previous report for statements this head leaves untouched, with the values computed there or carried by it from r5.

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `equivariantEhresmannTransport` (new: fibre model) | README Check: f=x² on ℝ, σ_M=−x, σ_B=id, b=1 | pinned model after rewrite `Fin (1−1) → ℝ` = `Fin 0 → ℝ` / required `Fin (1 − 1) → ℝ` = `Fin 0 → ℝ`; F={−1,1}; product model dimension 1+0=1=n; (e(σ_M x)).2=−x/\|x\| / σ_M((e x).2)=−x/\|x\| | holds |
| same (new) | x²+y² on ℝ², b=1, n−k=1 | chart θ↦(cos θ, sin θ): derivative of the inclusion has norm 1, so `hF` holds / chart θ↦(cos θ³, sin θ³): derivative 3θ²(−sin θ³, cos θ³)=0 at θ=0, so `hF` fails | `hF` excludes the wrong smooth structure |
| same (new) | n<k: M a point, B=ℝ, f≡0, b=1 | required `Fin (0 − 1)` = `Fin 0` (ℕ junk) / pinned `Fin (finrank ℝ⁰ − finrank ℝ¹)` = `Fin 0`; F=∅, U=ℝ∖{0} | holds; the junk value is the same on both sides |
| same (new) | k=0: B a point, M=S¹, f constant | required `Fin (1 − 0) → ℝ` / pinned the same after rewrite; F=S¹, U=B, e(x)=(b,x) | holds |
| same (new) | norm on the model, (3,4) ∈ `Fin 2 → ℝ` | sup norm 4 / Euclidean norm 5; the identity is a continuous linear equivalence, so the C^∞ classes agree | changing the model leaves the truth unchanged |
| same (new) | pinned atlas supplied as the fibre structure | with the finrank `rw`: atlas, `IsManifold` and `IsSmoothEmbedding` typecheck, and the theorem applies / without it: type mismatch | R02 repaired |
| same (new) | b=0 for f=x² | df(0)=0 is not onto, so `hreg` fails / fibres over c<0, c=0, c>0 have 0, 1, 2 points, so no trivialization exists near 0 | `hreg` needed |
| same (new) | b=−1 for f=x² | F=∅, U=(−∞,0) / f⁻¹(U)=∅=source, U×∅=∅=target | holds (empty fibre) |
| same (new) | ℝ×S¹→ℝ, σ_B(t)=−t, σ_M(t,z)=(−t,z̄), b=0 | model `Fin (2−1) → ℝ`; e(t,z)=(t,(0,z)): (e(σ_M(t,z))).2=(0,z̄) / σ_M(0,z)=(0,z̄) | holds with nontrivial σ_B |
| same (new) | not proper: ℝ∖{1}↪ℝ, b=1 | F=∅ and `hreg` holds vacuously / every U∋1 has f⁻¹(U)≠∅ while U×∅=∅ | `hp` needed |
| same (new) | σ_M(t,z)=(t,e^{it}z) on ℝ×S¹, σ_B=id, b=0 | σ_M on F is the identity, so the conclusion forces σ_M x=x on the source / σ_M(0.1,1)=(0.1,e^{0.1i})≠(0.1,1); also σ_M²(t,z)=(t,e^{2it}z) | `hσM2` fails, and so does the conclusion |
| `IsSmoothStratification` (r6) | X=ℚ, one stratum `id`, d=0 | "failed to synthesize ChartedSpace (EuclideanSpace ℝ (Fin 0)) ℚ" / predicate cannot be formed | binder separates |
| same (r6) | closed disc: ∂D (d=1), D° (d=2) | all 7 fields hold; StratumLT ∂D D° true / StratumLT D° ∂D false | holds |
| same (r6) | ℝ with the atlas {id, x↦x³} | transition x^{1/3} not C¹ at 0 / no `IsManifold (𝓡 1) ∞` instance | excluded |
| `exists_flow`, `exists_isControlledVectorField_lift`, `exists_trivialization` (r6) | rotation; inward radial; ∂_x over ∂_t; x²+y² | dρ₀=−2xy+2xy=0 / dρ₀=−2\|v\|; lift ∂_x; fibre a point / a circle | holds |
| `ControlData.IsNormalized` (r6) | T=(−1,1)∪(1,2) | {ρ≤ε} ⊇ (1,1+ε], not compact / after shrinking to (−1,1), compact | holds |
| §16.1a prose targets (r6) | closed disc; spiral onto S¹ | U={D°} upward closed and open / U={∂D} not upward closed; spiral: frontier holds, (b) fails, dimensions 1=1 | holds |
| §16.1b normalisation (r6) | a={0}, b={5}, T_a=(−1,1)∪(4,6) | T_a∋5: not normalised / deleting (4,6) normalises | holds |
| `configurationTraceFormula` (r6) | q=2, m=2, χ=sgn; χ≡1 | sgn: +1−1=0 / 0−0; χ≡1: 2 / 4−2=2 | holds |
| `eulerExponent`, §3.3 (r6) | n even and odd, N=2; q=2, c=±1 | −2,−1,−2 and 2,−3,2 / BS (7.2) the same; 1,2,2 / 1+2U+2U² | holds |
| `stableConfigurationDiagonal` (r6) | (0,2,2,2); (0,1,1,0) | 1 / 1; `hd` fails, 0 against 1 | holds; `hd` needed |
| §4.3, §4.4, `rationalBouquetRanks` (r6) | N=2, n=3; s=0, k=0,1,2 | rank 3 / 3; 2,3,2 / 2, 2+L₂, L₃ | holds |
| `tameFibreBouquet` (r6) | x³−3x+y², a=0,±2; n=0 | μ=2: two circles / one circle at ±2; n=0: empty fibre | holds; n≥1 needed |
| `doubleLoopBetti`, `phamStrongRetraction`, `fermatDoubleLoopSimplyConnected` (r6) | S⁴; K₂,₃; n=4,5 | 1,0,1,0,1,1,1 / ℚ[y₂]⊗Λ(z₅); 2 / 2; S³: π₃=ℤ≠0 | holds; n≥5 needed |
| §§6.1, 7.4, 8.1, 9.5, 10.1, 14.1–14.2, 15.3, 16.4 (r6) | as in r5 | e.g. §8.1: H⁰, H¹(G,ℤ(1)) = 0, 𝔽₂ / 0, 𝔽₂ | holds |
| `WhitneyB`, `ControlData`, `IsCompatible`, `exists_controlData_isCompatible`, `firstIsotopyLemma`, `equivariantStratifiedTransport` (r6) | cusp; t·sin(1/t); 3 strata of ℝ²; ℝ×S¹ with conjugation | \|t\|/2→0 / distance→1; det 2xy/√(x²+2y²)≠0; unaveraged h(π/2,1)=(π/2,−i) / averaged h=id | holds |

**Remark on placement (changed text, no change asked).** README line 78 names the Mathlib lemma `finrank_euclideanSpace_fin` inside the From Tau Ceti paragraph, where it is used, with its Mathlib file. The §16.1 *Needs:* line lists it under Mathlib, so the contract is exact.

## Not verifiable

- These are settled and cited by locator only, so I did not read them:
  - uncertified: DIMCA Lemma 4 (pp.369–374, the §16.1 locator), HILTON, BRUMFIEL, SCHEIDERER and BCR;
  - waived: KRASNOV.
- MATHER is an OCR scan. Section numbers, axiom labels and page markers are legible, and the wording was read through the OCR noise.

## Source issues

- none

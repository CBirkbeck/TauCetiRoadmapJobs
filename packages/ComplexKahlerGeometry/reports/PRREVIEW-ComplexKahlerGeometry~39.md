# Review of ComplexKahlerGeometry (pull request #1234 at a2c5e1c)

**Verdict:** needs changes

Full re-review: 311 lines changed since `41f5a15`. Of the previous review's seven findings, R03, R04 and R07 are repaired. R02 and R05 are repaired apart from small leftovers, now R07 and R06 below. R01 is only partly repaired (now R02), and R06 is not repaired (now R08). Re-running the gate on this head now **fails**: the README cites SurfaceTopology and PlanarTopology, and both are on the gate's dropped list (R01). The full pass also found three problems that earlier rounds missed:

- K6.1's analytic-cycle comparison cites DifferentialGeometry for relative-integration statements it does not plan (R03).
- The pinned sphere-quotient `TauCeti.ComplexProjectiveSpace` makes the ℂPⁿ Hodge and Betti numbers statable (R04).
- One of the docstring's "not statable" reasons is false (R05).

Every Lean statement and every sampled target survived the adversarial pass. Apart from R04, the findings concern ownership, citations and statability, not the mathematics.

## R01 (P1) — The gate fails: the Riemann-surface genus dictionary consumes two dropped roadmaps

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2018–2040`, e.g. "construct the native topological surface required by [PlanarTopology's surface convention] … Consume [SurfaceTopology Layers 2–3]'s presentation/realization comparisons, [Layer 6]'s polygon normal forms and [Layer 8]'s compact-surface classification"; also `:2289`, and "Depends on #271 SurfaceTopology" in the description.

Claim: the K7 genus/b₁ dictionary and the integral cup-pairing comparison (consumed by Index I7.4) take the classification of compact surfaces and the surface conventions from SurfaceTopology and PlanarTopology. Neither roadmap is on main: main's copy of this README links them only through a fork commit (`mccorvie/…/7f2099e`), and this head turns those links into relative ones that resolve to nothing. Both names are now on the gate's dropped list. The pins have no classification of compact surfaces (no `genus` or surface-classification declaration under `TauCeti/Topology` or `TauCeti/Geometry/Manifold`). As written, these prerequisites have no owner.

Witness: my gate re-run at `a2c5e1c` reports `dropped=14 … FAIL`, with hits at lines 2020, 2025, 2027, 2028, 2037, 2038 and 2289. The worker's `gate.md`, which reports `dropped=0`, predates the list change. #271 (PlanarTopology, SurfaceTopology) is still open at `421e114`, but its names are refused.

Repair: drop the classification route. None of the stated outputs needs a homeomorphism to a standard model:

- `H²(Σ;ℤ)≃ℤ` follows from AlgebraicTopology Stage 6.3's fundamental class of the closed, connected surface with K1's complex orientation.
- The degree-one cup pairing is unimodular by AlgebraicTopology Stage 6's Poincaré duality. It is alternating because `a∪a` is 2-torsion in the torsion-free group `H²(Σ;ℤ)≃ℤ`.
- A symplectic basis then comes from the normal form of unimodular alternating forms over ℤ. State this as a K7 algebra target.
- `b₁=2g` is K6.1's Hodge comparison, as the README already says.

Delete the PlanarTopology/SurfaceTopology clauses at `:2020–2038` and `:2289`. If a homeomorphism to the standard genus-g surface is still wanted, state the classification of closed orientable surfaces as a K7 target with a locator. Remove "#271 SurfaceTopology" from the description's dependency block.

Test: the gate re-run reports `dropped=0`. On the elliptic curve, `H¹=ℤ²` with cup matrix `[[0,1],[−1,0]]`; on ℂP¹, `H¹=0` and `H²≃ℤ`.

## R02 (P2) — Two owners of the exponential segment and its `c₁` identification (partly repaired from the previous R01)

Location: `README.md:686–691`: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` … It supplies this segment and its `c₁` identification to ComplexComparisonPartII C5.4 …, to K3Surfaces 1.1 and to GeometricQuantization §3.3, which are its consumers."

Claim: the README now states ownership, as option (a)(1) of the previous review proposed. Part (a)(2) was not done: the description still says nothing about it, and none of the three named consumers cites K4.P. ComplexComparisonPartII still claims to be the single owner. So the object still has two owners, and "which are its consumers" is false at all three heads.

Witness:
- #848 (`6723806`) `ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection … to `H¹(M,O_M^×)`, the holomorphic exponential sequence … and the identification of its connecting map with the integral first Chern class".
- #1285 (`5108929`) `K3Surfaces/README.md:116, 371, 406` take the sequence from C5.4.
- #1186 (`bcc5698`) `GeometricQuantization/README.md:20, 714` do the same.
- `K4.P` occurs in none of the three.

Repair:
- Add one sentence to the description: #848 drops the single-owner claim at its line 146 and cites K4.P for the frame torsor, the exponential segment and the `c₁` identification, and #1285 (`:116, 371, 406`) and #1186 (`:20, 714`) cite K4.P in place of C5.4.
- Nothing in this folder changes.
- If the author holds that the folder's side is complete, the repair report may mark this finding not actionable in this package, with that reason: the remaining edits are in #848, #1285 and #1186.

## R03 (P2) — K6.1 cites DifferentialGeometry for relative and fundamental-class integration it does not plan; the owner is DeRhamCohomologyAndDuality

Location: K6.1 cites DifferentialGeometry five times for these statements:
- `README.md:1657–1658`: "Consume DG9.3's general fundamental-class integration formula".
- `:1711`: "DG8.4's open-pair cone sends `(α′,0)` to `[α′]_rel∈H^(2k)(M,U;ℝ)`".
- `:1717–1719`: "DG8.4's relative chain integration `chainIntegral`".
- `:1726–1728`: "DG9.3's compactly supported relative integration formula and DG8.3's smooth/continuous relative-chain comparison".
- `:2271`: "DG8.3–8.5/9.3".

Claim: main's DifferentialGeometry plans only the absolute theory in these sections:
- 8.3 is absolute smoothing.
- 8.4 is simplex and chain integration and `deRhamHom`; it has no open-pair cone and no relative integration.
- 9.3 is `poincareDuality` only.

So the five citations are cited for statements their target does not make. The relative complex, its cone and relative integration, the relative smooth-chain comparison and the compact-support integration formula are planned by DeRhamCohomologyAndDuality, a new roadmap (#1768). That roadmap names K6.1 as their consumer. In addition, DifferentialGeometry's open revision #886 removes Layers 6–11 and renames 5.5 (to 5.5a/5.5b). This README's DG 5.5, 6.2, 8.3–8.5 and 9.3 citations therefore break when #886 merges. `roadmaps overlaps` does not report this, because the tool misses heading removals of this kind.

Witness:
- Main `DifferentialGeometry/README.md:845–851` (8.4) and `:872–875` (9.3, "Duality … `poincareDuality`").
- #1768 (`1b57dbe`) `DeRhamCohomologyAndDuality/README.md:695–702`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1 … K6.1 names these as DifferentialGeometry 8.4's, 8.3's and 9.3's; DifferentialGeometry 8.3, 8.4 and 9.3 plan the absolute theory only."
- #886 (`a565de6`) layer list: 0–5, 5.6, 12. These names have 0 hits there: `chainIntegral`, `deRhamHom`, `legacySmoothTwoFormEquiv`, `integralTopForm_eq_integralDensity`, `homotopyOperator`.

Repair:
- At `:1657–1658`, cite DeRhamCohomologyAndDuality §4.1 (the integration comparison).
- At `:1711`, cite its §§3.1–3.2 (the relative complex and the cone).
- At `:1717–1719`, cite §3.2's relative integration with its naturality for smooth maps of open pairs.
- At `:1726–1728`, cite §4.1's compact-support formula and §2.4's relative smooth-chain comparison.
- At `:2271`, write "DG8.3–8.5/12.1 and DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1". Keep DG 8.3–8.5 for the absolute `deRhamHom` and `deRhamEquiv`.
- Add #1768 to the description's dependency block. #1768 does not consume this roadmap, so the direction is clean.
- In the description, state that #886 merges after this pull request and must give old → new numbering for the DG 5.5, 6.2, 8.3–8.5 and 9.3 items this README cites.

Test: on `V=ℂP¹⊂ℂP²` with `α=ω_FS`, the comparison reads `∫_(V)ω_FS=1=⟨[ω_FS],[ℂP¹]⟩`. After the repair, every input of that chain of equalities has a supplier that states it.

## R04 (P2) — The ℂPⁿ Hodge and Betti numbers are statable on the pinned sphere-quotient carrier; the docstring says K7 is not statable, and K7.2 plans the pinned CW structure

Location: `Suggested.lean:60–63`: "the projective, torus and Hopf computations (K7): Tau Ceti's complex atlas `Projectivization.instIsManifold` on K7.1's carrier cannot be imported together with Mathlib". Also `README.md:1737` ("Use the single carrier `Projectivization ℂ (Fin (n+1) → ℂ)`") and `:1861–1866` ("construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n").

Claim: the import clash is real for `Projectivization`; I reproduced it. But Tau Ceti pins a second ℂPⁿ, `TauCeti.ComplexProjectiveSpace n`, the quotient of `S²ⁿ⁺¹` by `S¹`, and that carrier imports cleanly alongside Mathlib. It has:
- the affine complex atlas, with `IsManifold 𝓘(ℂ, Fin n → ℂ) r` for every `r`;
- compactness, the Hausdorff property and path-connectedness;
- the even-cell CW structure that K7.2 plans to construct.

The README never mentions this carrier. Two K7.2 end results are therefore statable at the pins with this file's own `DolbeaultCohomology` and the pinned `deRhamCohomology`, and are absent: the Hodge numbers `h^(p,q)(ℂPⁿ)=δ_pq` and the Betti numbers of ℂPⁿ.

Witness:
- `TauCeti/Topology/ComplexProjectiveSpace/Basic.lean:58, 72, 77, 153`.
- `TauCeti/Geometry/Manifold/Instances/ComplexProjectiveSpace.lean:40, 65`.
- `TauCeti/Topology/CWComplex/Classical/ComplexProjective.lean:271, 419` (`cellMap`, `cwComplex`; `nat_card_cell_cwComplex` per its docstring).
- A scratch copy of `Suggested.lean`, with `public import TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace` added, elaborates the two statements below with only `sorry` warnings.

Repair: add the import and a `/-! ## Layer K7: … -/` section stating:

```lean
theorem finrank_dolbeaultCohomology_complexProjectiveSpace (n p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology (Fin n → ℂ) (TauCeti.ComplexProjectiveSpace n) p q) =
      if p = q ∧ p ≤ n then 1 else 0 := by
  sorry

theorem finrank_deRhamCohomology_complexProjectiveSpace (n k : ℕ) :
    Module.finrank ℝ (deRhamCohomology 𝓘(ℝ, Fin n → ℂ) (TauCeti.ComplexProjectiveSpace n) k) =
      if Even k ∧ k ≤ 2 * n then 1 else 0 := by
  sorry
```

with docstrings and locators. Then:
- Narrow the docstring bullet: the `Projectivization` clash, line bundles `O(k)`, tori and the Hopf surface remain unstated, each with its missing carrier.
- In K7.1, name `TauCeti.ComplexProjectiveSpace` with `instChartedSpace` and `instIsManifold`, and own the comparison homeomorphism/biholomorphism with `Projectivization ℂ (Fin (n+1) → ℂ)`, which is at neither pin.
- In K7.2, cite `cwComplex` and `cellMap`, transported through that comparison, instead of constructing the CW structure.
- Mention the two new theorem names in K7.2's prose.

Test values: `n=0` gives `h^(0,0)=b₀=1`. `n=1` gives `h^(1,1)=1`, `h^(1,0)=0`, `b₂=1`, `b₁=0`. `p=q=2>n=1` gives 0; a version without `p ≤ n` would wrongly give `h^(2,2)(ℂP¹)=1`. Both sides also agree with `finrank_deRhamCohomology_eq_sum_dolbeault`.

## R05 (P3) — The docstring's reason for K4 and K5b is false: the holomorphic-transition mixin is pinned

Location: `Suggested.lean:41–43`: "Chern connections, Koszul–Malgrange … (K4) and Dolbeault theory and Serre duality with coefficients in a holomorphic bundle (K5b): the native `VectorBundle` has no holomorphic-transition mixin at the pins".

Claim: Mathlib's `ContMDiffVectorBundle n F V IB`, with complex scalars and a complex base model, is exactly the holomorphic-transition mixin. ComplexManifolds Milestone 7, which this README consumes, says so in so many words. The carriers actually missing are a Dolbeault operator `∂̄_V` on `V`-valued type forms and the smooth connection on the underlying real bundle. The pinned `delBar` acts only on forms with a constant coefficient space `F`.

Witness:
- `Mathlib/Geometry/Manifold/VectorBundle/Basic.lean:305` (`ContMDiffOn IB 𝓘(𝕜, F →L[𝕜] F) n` of every coordinate change).
- Main `ComplexManifolds/README.md:321–323`: "A holomorphic vector bundle is literally `ContMDiffVectorBundle ∞ F E 𝓘(ℂ, EB)` … `HolomorphicVectorBundle` is only an abbreviation for that mixin".
- `TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:95` (`delBar : SmoothForm I M F k →ₗ[ℂ] …`).

Repair: replace the reason with "holomorphic bundles are Mathlib's `ContMDiffVectorBundle ∞ F V 𝓘(ℂ, EB)`, but the pins have no Dolbeault operator `∂̄_V` on `V`-valued type forms and no realified smooth connection with a `(0,1)` part".

## R06 (P3) — K7.1 attributes Mathlib's quotient topology on `Projectivization` to Tau Ceti

Location: `README.md:1738–1741`: "with Tau Ceti's quotient topology from the nonzero vectors, `Projectivization.instTopologicalSpace` (`TauCeti.Topology.Algebra.Projectivization`; the generic quotient topology that AlgebraicTopology Stage 4.6 plans is this pinned declaration), its open quotient map `isOpenQuotientMap_mk'`". Also `:2273` ("Tau Ceti's `Projectivization.instTopologicalSpace`").

Claim: the pinned Mathlib declares the same instance, with the same body, together with `isQuotientMap_mk'`, `continuous_mk'`, `continuous_iff`, `continuous_mk`, `continuous_map`, `isOpenMap_mk'` and `isOpenQuotientMap_mk'`. That is exactly the mathlib4#44117 interface that AlgebraicTopology Stage 4.6 lists (main `AlgebraicTopology/README.md:266–273`). The defer-to-Mathlib rule makes these Mathlib's. Only the separation, compactness, countability and connectedness instances and the atlas are Tau Ceti's.

Witness: `Mathlib/Topology/Algebra/Projectivization.lean:44, 47, 83`; `TauCeti/Topology/Algebra/Projectivization.lean:90, 145, 149, 188, 215, 251`.

Repair: at `:1738–1741` write "with Mathlib's quotient topology `Projectivization.instTopologicalSpace` and `isOpenQuotientMap_mk'` (`Mathlib.Topology.Algebra.Projectivization`, the interface AlgebraicTopology Stage 4.6 names), Tau Ceti's `instT2Space`, …". Make the same change at `:2273`. The existing sentence at `:1761–1763` on the duplicate declaration stays.

## R07 (P3) — K3.MeromorphicGermField still plans two pinned facts (leftover of the previous R02)

Location: `README.md:455–458`: "Prove the ℂ-specific facts the applications need beyond the pinned generality over a normed field: the local-inverse identities of `meromorphicGermsEquiv` for a biholomorphism given in a chart of K1, and the compatibility of `regularEval` with the evaluation of `O_a` under that chart."

Claim: both facts are pinned for a local biholomorphism `ℂ→ℂ`, which is what a chart change at `a∈ℂ` is:
- `meromorphicGermsEquiv` is a `RingEquiv` whose inverse is pullback along `e.symm` (`meromorphicGermsEquiv_symm_apply`).
- `regularEval_pullback` says pullback along an analytic map preserves the value of a regular germ.

Witness: `TauCeti/Analysis/Meromorphic/Pullback.lean:130, 162`; `TauCeti/Geometry/Manifold/Complex/StructureSheaf/RegularEval.lean:147`. Computed at `a=0`, `e(z)=2z`: `1/z ↦ 1/(2z)`, and the inverse pullback along `w/2` returns `1/w`. The regular germ `1+z` pulls back to `1+2z`, with value 1 on both sides.

Repair: replace the sentence with a citation of `meromorphicGermsEquiv_symm_apply` and `regularEval_pullback`. Keep only what is genuinely absent from the pin: GH2's coefficient comparison and the convolution product formula.

## R08 (P3) — The order against the four other open pull requests on this folder is not stated (not repaired; the previous R06)

Location: the pull request description, which names only "#271 SurfaceTopology" and "#1186".

Claim: four open pull requests rewrite this folder and conflict with this head, and the description does not say which is rebased on which:
- #1398 (`d4190f8`).
- #1807 (`bdcbdaa`, draft): restructures the whole README into the house shape, with `## Scope and ownership`, `## Exact supplier contracts` and per-layer `### Examples`/`### Dependencies`. This head lacks that shape.
- #1808 (`d487de8`) and #1854 (`d723ba1`): replace K8's "Consume DGFloer's generic filtered-complex spectral sequence" (this head `:2144–2145, 2219`) by "AlgebraicTopology Stage 5.0". Main's DGFloer cites this roadmap's K7.1–K7.2 as a supplier (`DGFloer/README.md:168`), so this change cuts a mutual citation that this head keeps.

Witness: `scratch/overlaps.md` (all four conflict). The `roadmaps show ComplexKahlerGeometry --pr 1808` diff against main shows lines 1538 and 1613 changed as described.

Repair: one sentence in the description saying which pull request is rebased on which. Whichever merges second keeps #1808/#1854's K8 repointing. The shorter path stays the one the previous review gave: rebase this pull request's insertions onto #1807.

## Previous findings

- **R01** (P2, two owners of the exponential segment): partly repaired. `README.md:686–691` now asserts ownership as the previous review proposed. The description and the three consumer heads are unchanged. Carried as R02.
- **R02** (P3, K3.MeromorphicGermField restated pinned germs): repaired. `README.md:412–444` cites all 21 pinned names, and each resolves (table below). Two leftover facts are R07.
- **R03** (P3, K3 stalk algebra): repaired. `README.md:362–398` cites `holomorphicStructureSheaf`, `smoothSheafIso`, `smoothStalkIso`, the local-ring, domain, maximal-ideal, discrete-valuation-ring and germ comparisons. `:465–471` keeps Noetherianity, regularity, Krull dimension and factoriality as targets, which is correct at the pins.
- **R04** (P3, Hodge star and codifferential): repaired. `README.md:822–854` and `:1314–1330` cite the pinned stars, the type law and the codifferential. The README's sign `(−1)^(m(k+1)+1)` on `k`-forms matches the pinned `(−1)^(m(k+2)+1)` on `(k+1)`-forms (`Codifferential.lean:84–91`).
- **R05** (P3, projective topology and atlas): repaired. `README.md:1737–1766` cites the pinned atlas. The attribution leftover is R06.
- **R06** (P3, order with #1807/#1398): not repaired. Carried as R08.
- **R07** (P3, three citations): repaired in all three places (`README.md:155–157`, `:1717–1719`; `Suggested.lean:160–163`). However, the repaired `:1717–1719` still cites DG 8.4 for a relative statement it does not make; that is part of R03.

## Verified sound

**Gate.** The worker's `gate.md` at this head reports every counter at 0 (OK). My re-run with the same command reports:

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=14 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

The only failing check is `dropped` (R01).

**Dependency check** (`--movable`), exact output:

```text
depcheck: 244 roadmaps, 2458 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The roadmap is on main and not in `ORDER.txt`. GlobalHolomorphicFunctions (89), ComplexComparisonPartII (43) and FormalConnectionsOpers (44) are listed. VariationalMethods (#1028) and UnboundedOperators (#1027) are open new-roadmap pull requests, as are SurfaceTopology and PlanarTopology (#271, see R01).

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexKahlerGeometry'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are unchanged from main.

**Lean.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 in 11 s, with exactly 21 `sorry` warnings (lines 83, 105, 121, 151, 164, 180, 193, 204, 220, 235, 253, 261, 271, 294, 329, 336, 371, 383, 392, 409, 424) and nothing else. The file is in module form with seven `public import TauCeti.*` lines, all present at `2fd255d`. It has no `set_option`, no sorry'd data and no `lemma`.

**Binder audit.** I put `#check @` of all 28 declarations in one scratch file. The elaborated types equal `scratch/signatures.md`:
- The four "looks dropped" leads are definitions whose bodies do not need the hypotheses: the three Dolbeault definitions drop `[FiniteDimensional ℂ E]`, and `lefschetzMap` drops `[FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [CompactSpace M]`.
- Every theorem about them carries the hypotheses.
- Each type matches its README sentence (K1 `:191–197`, K2 `:220–239, 293–297`, K3 `:399–407, 465–480, 488–511, 539–548`, K5a `:1062–1065`, K5b.1 `:1482–1486`, K6.0 `:1497–1501`, K6.1 `:1574–1590`).

**Padding probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | infer_instance | fun_prop | (simp; done) | (simp_all; done) | (exact ⟨inferInstance, inferInstance⟩) | sorry`, plus `unfold complexBesselSymbol; fun_prop` for the symbol. All 21 fallbacks were used, so nothing closes with one tactic. By reading, none of the 21 is a definition restatement, a Check mirror or a boundary case. Nothing is padding.

**Headlines.** The README's headlines:
- K1: Newlander–Nirenberg.
- K2: Dolbeault–Grothendieck, the parameter solver, the Dolbeault theorem.
- K3: Weierstrass preparation, uniqueness and division; regular local ring and factoriality; Rückert; Oka; Cartan; Riemann extension; Hartogs across a point and across codimension two; singular-locus analyticity.
- K4: Chern connection, Koszul–Malgrange, flat correspondence. K4.P: the exponential segment and `c₁`.
- K5a: the Hilbert scale and elliptic regularity.
- K5b: Dolbeault finiteness and Serre duality.
- K6.0: the Kähler identities.
- K6.1: `∂∂̄`, Hodge decomposition and symmetry, odd Betti parity, Hard Lefschetz, Hodge–Riemann, cycle classes.
- K7: the projective, torus and Hopf computations.
- K8: Frölicher and Iwasawa.

21 are stated. The missing ℂPⁿ ones are R04. The docstring reasons I checked at the pins:
- True: 0 hits for a sheaf of holomorphic `p`-forms, an analytic-subset carrier, a density carrier, a units sheaf, or a manifold-level complex Hodge star in `TauCeti/Geometry`.
- True: the `Projectivization` clash, which a scratch file with `import Mathlib` and `import TauCeti.Geometry.Manifold.Instances.Projectivization` reproduces ("environment already contains 'Projectivization.instTopologicalSpace' from Mathlib.Topology.Algebra.Projectivization").
- False: the K4/K5b mixin reason (R05).
- Too broad: the K7 reason (R04).

**Pinned declarations opened** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):

| Declaration | File:line | Gives / lacks |
| --- | --- | --- |
| `meromorphicGerms`, `instField` | `TauCeti/Analysis/Meromorphic/Germ.lean:55, 188` | subring of `Germ (𝓝[≠] a) 𝕜`; field |
| `toMeromorphicGerms`, `_injective`, `exists_toMeromorphicGerms_eq_iff`, `exists_eq_toMeromorphicGerms_div`, `isFractionRing_meromorphicGerms`, `regularPart`, `mem_range_toMeromorphicGerms_iff_principalPart_eq_zero` | `…/Complex/StructureSheaf/MeromorphicGerm.lean:59, 73, 87, 111, 141, 166, 228` | as cited at `README.md:419–432` |
| `evalInvSub`, `principalPart`, `principalPart_eq_iff`, `principalPart_eq_sum_coeff` | `TauCeti/Analysis/Meromorphic/PrincipalPart.lean:138, 188, 217, 256` | `principalPart : meromorphicGerms 𝕜 a →+ 𝕜[X]` |
| `coeff_principalPart_succ_eq_circleIntegral` | `TauCeti/Analysis/Contour/Residue/PrincipalPart.lean:86` | order `−(k+1)` ↔ `∮(z−a)^k f` |
| `rangeToMeromorphicGermsEquiv`, `regularEval`, `regularEval_pullback` | `…/StructureSheaf/RegularEval.lean:63, 80, 147` | R07 |
| `meromorphicGermsEquiv`, `_symm_apply`; `meromorphicGermsEquiv_mem_range_iff`, `toMeromorphicGerms_stalkPrecomp`; `derivation`, `derivation_pullback` | `TauCeti/Analysis/Meromorphic/Pullback.lean:130, 162`; `…/StructureSheaf/Pullback.lean:52, 75`; `…/Meromorphic/Derivation.lean:58, 110` | contravariant field isomorphism |
| `holomorphicStructureSheaf`, `stalkPrecomp`; `smoothSheafIso`, `smoothStalkIso` | `…/StructureSheaf/Basic.lean:68, 326`; `…/SmoothComparison.lean:80, 110` | iso with `(ChartedSpace.locallyRingedSpace I X).sheaf`; `[FiniteDimensional ℂ E]` |
| `isUnit_stalk_iff`, `instIsLocalRingStalk`, `maximalIdeal_stalk`, `residueFieldEquiv`; `stalkIsDomain`, `smoothStalkIsDomain`; `ker_eval_eq_span_holomorphicLinearCoordinateGerm`, `mem_ker_eval_sq_iff`; `instIsDiscreteValuationRingStalk`; `toFilterGerm` | `…/LocalRing.lean:46, 90, 98, 104`; `…/Domain.lean:70, 93`; `…/MaximalIdeal.lean:197, 224`; `…/DiscreteValuationRing.lean:55`; `…/Germ.lean:102` | units = nonzero value (any complex model) |
| `analyticGerms`, `pullback`, `equivOfInverse` | `TauCeti/Analysis/Analytic/Germ.lean:37, 122, 194` | chart-free comparison |
| `exteriorPower_innerₗ`, `volumeEquiv`, `Orientation.hodgeStar`, `hodgeStar_hodgeStar` | `TauCeti/Analysis/InnerProductSpace/HodgeStar/Basic.lean:101, 161, 194, 236` | built on Mathlib's `exteriorPower.hodgeStar` (`Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean:48`); `⟪⋆x,y⟫ = vol(x∧y)` |
| `hodgeStarIsometry`, `hodgeStar_neg_orientation`; `adjoint_wedgeLeft`, `koszulDifferential_hodgeStar` | `…/HodgeStar/Isometry.lean:80, 150`; `…/Contraction.lean:75, 89` | as cited |
| `complexHodgeStar`, `barHodgeStar`, `complexWedgePairing_barHodgeStar`, `complexHodgeStar_mem_typeSubmodule_iff`, `barHodgeStar_mem_typeSubmodule_iff`; `typeSubmodule` | `…/HodgeStar/Complex.lean:57, 126, 161, 219, 233`; `TauCeti/LinearAlgebra/ExteriorPower/AlmostComplexType.lean:66` | skew-adjoint `J`; `(m/2−q, m/2−p)` and `(m/2−p, m/2−q)` |
| `SmoothForm.hodgeStar`; `codifferential`, `_neg_orientation`, `codifferential_codifferential`, `mextDeriv_wedge_hodgeStar`, `integralTopForm_inner_mextDeriv_eq_inner_codifferential` | `TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean:73`; `…/Codifferential.lean:88, 121, 130, 162, 252` | adjointness needs `[BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M]` and one compact support, as stated |
| `Projectivization.instTopologicalSpace`, `isOpenQuotientMap_mk'` (Mathlib); Tau Ceti copies and `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace`, `isOpen_affineOpen`, `affineOpenPartialHomeomorph` | `Mathlib/Topology/Algebra/Projectivization.lean:44, 83`; `TauCeti/Topology/Algebra/Projectivization.lean:90, 145, 149, 188, 215, 251, 271, 311` | R06 |
| `affineChart` (`succAbove`, `insertNth i 1`); `instChartedSpace`, `contDiffOn_affineChart_symm_trans`, `instIsManifold`, `contMDiffOn_affineChart`, `contMDiff_affineChart_symm` | `TauCeti/LinearAlgebra/Projectivization/AffineChart.lean:101`; `TauCeti/Geometry/Manifold/Instances/Projectivization.lean:54, 73, 82, 89, 96` | K7.1 conventions match |
| `TauCeti.ComplexProjectiveSpace`, its atlas, `cwComplex` | see R04 | not cited by the README |
| `ContMDiffVectorBundle`; `SmoothAlmostComplexStructure.delBar` | `Mathlib/Geometry/Manifold/VectorBundle/Basic.lean:305`; `…/Dolbeault/Basic.lean:95` | R05 |
| `ImplicitFunctionData.contDiffAt_implicitFunction`; `analyticAt_implicitFunction` | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41`; `TauCeti/Analysis/Analytic/Inverse.lean` | attributions now correct |
| `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`; `TestFunction.continuous_iff_continuous_comp`; `fourierMultiplierCLM` (Schwartz and tempered); `besselPotential`, `memSobolev_zero_iff`, `BesselPotentialSpace`; `MDifferentiable.isLocallyConstant`, `exists_eq_const_of_compactSpace` | `Mathlib/Analysis/LocallyConvex/Montel.lean:46, 104`; `…/Distribution/TestFunction.lean:335`; `…/Distribution/FourierMultiplier.lean:50, 143`; `…/Distribution/Sobolev.lean:73, 157`; `…/FunctionalSpaces/BesselPotentialSpace.lean:47`; `Mathlib/Geometry/Manifold/Complex.lean:155, 170` | as cited |

**Cross-roadmap citations resolved:**

| Citation | Copy | Result |
| --- | --- | --- |
| ComplexComparisonPartII C5.4 | #848 `6723806` via `roadmaps show`, `:92–93, 146` | single-owner claim (R02) |
| K3Surfaces 1.1 | #1285 `5108929` `:116, 371, 406` | takes the segment from C5.4 (R02) |
| GeometricQuantization §3.3 | #1186 `bcc5698` `:20, 714` | same (R02) |
| DG 0.3, 0.4, 1.5, 2.1, 2.2, 5.4, 5.5, 6.2, 8.3, 8.4, 8.5, 9.3, 12.1, 12.4 | main `DifferentialGeometry/README.md` | headings and the named `legacySmoothTwoFormEquiv`, `integralTopForm_eq_integralDensity`, `integral_riemannianVolume_eq_integralDensity`, `RoughDensity`, `homotopyOperator`, `chainIntegral`, `deRhamHom` exist; 8.3/8.4/9.3 are absolute only (R03) |
| same ids | #886 `a565de6` | Layers 6–11 absent; 5.5 renamed (R03) |
| DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1 | #1768 `1b57dbe` `:384, 443, 465, 486, 512, 695–702` | owner, names K6.1 (R03); does not consume this roadmap |
| ComplexManifolds Milestones 1–4, 7; M2.1, M2.2, M2.4 | main `ComplexManifolds/README.md:197–215, 319–330` | "M2.1" is Milestone 2 item 1; the resolver lead is a false positive |
| `CompactFormPair.operatorDomainV`; UO-D06 | #1028 `VariationalMethods/README.md:845`; #1027 `UnboundedOperators/README.md:512` | exist; the resolver lead is a false positive |
| AlgebraicTopology Stage 4.6, 6.3 | main `AlgebraicTopology/README.md:266–273, 69–88` | 4.6 is mathlib4#44117's interface (R06); AT assigns the integration comparison to DG 9.3, which DG does not plan (R03) |
| SurfaceTopology, PlanarTopology | not on main; #271 `421e114`, dropped | R01 |
| DGFloer | main `DGFloer/README.md:168` | cites K7.1–K7.2 (R08) |

**Seeded sample, locators** (each opened in the cache):

| Target | Locator | Lines | Result |
| --- | --- | --- | --- |
| K3.HolomorphicStalk | Demailly II (2.1), (2.3)–(2.4), (2.7), (2.10) | `demailly-agbook` 3794–3800, 3804–3817, 3872–3873, 3931–3936 | Preparation has `a_k(0)=0` and no uniqueness. Division (2.4) is "unique" (line 3817). Noetherian; factorial. The Lean hypotheses (`iteratedDeriv` order `d`) match "`g(0,z_n)/z_n^s` has a nonzero finite limit". |
| K3.MeromorphicGermField | pinned names only | table above | resolved |
| K4.ComponentwiseFiniteRankAssembly | no external locator | — | adversarial row |
| K5a, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact | pinned Mathlib/Tau Ceti names | table above | resolved |
| K5b, K5b.1 | Demailly VI (7.2), (7.3), (8.12) | 15385–15395, 15523–15528 | finite-dimensional; Serre pairing nondegenerate; `h^(p,q)=h^(n−p,n−q)` for compact X |
| K5b.0 | no external locator | — | adversarial row |
| K6.1 Lean docstrings | Demailly VI (8.5), (8.6), (8.12), (8.17) | 15442–15452, 15523–15527, 15557–15560 | as stated; Hard Lefschetz for `k ≤ n` over ℂ |
| K7.1, K7.2, K7.2.RationalQuartic | no external locator | — | adversarial rows |
| K7.2.TautologicalIncidence | Knutson §1, p. 1 | `knutson-borel-weil` 12–60 | incidence variety, blowup at the origin, tautological line, Liouville, weight spaces 0 for negative weight, polynomials of degree `k` |
| K7.FlatDegreeZero | Berwick-Evans–Tripathy Remark 2.1, p. 6 | `berwick-evans-tripathy` 287–292 | degree-zero lines are flat unitary; `τm+n ↦ e^(2πi(mx+ny))` |
| K8.NilpotentCentralReduction | Sakane pp. 188–189 | `sakane-parallelisable` 95, 102–115 | Theorem 1's preparation on printed p. 189: last nonzero `C^m(G)` central, `A∩Γ` a lattice ([11] p. 31), `AΓ` closed ([11] Thm 1.13), holomorphic principal torus bundle |

The README flags no locator as unverified.

**Ownership by object.** `roadmaps overlaps` reports no dropped id in either direction. By hand, I found DifferentialGeometry #886's removals (R03). Among the roadmaps nearest in vocabulary, ComplexComparisonPartII shares the exponential segment (R02), and DeRhamCohomologyAndDuality owns K6.1's relative-integration inputs (R03). DifferentialGeometry, CalibratedGeometry, GlobalHolomorphicFunctions and GeometricQuantization hand nothing else back. Inside the pins, the remaining shared objects are the ℂPⁿ carrier (R04), the projective topology (R06) and two germ facts (R07). No `Suggested.lean` name is declared in another roadmap's file. `roadmaps grep --lean-only --fixed` on the 26 distinct names finds declarations only in this folder's own `Suggested.lean`: on main and at #1398, #1807, #1808 and #1854.

**Adversarial pass.** One row per statement, with values recomputed in this review.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `newlander_nirenberg` | `M=ℂ`, `J=i`; `E=0`; `N_J≠0` | `finrank 2=2·1`, `φ=id`; `Fin 0→ℂ` a point, constant `φ` a local diffeomorphism; pullback of `i` by a pseudoholomorphic local diffeomorphism has `N=0`, so `hJ` excludes it | Pass | — |
| `polydisc` | `r k≤0`; `n=0` | `ball c 0=∅` gives the empty set; `Set.univ.pi` over `Fin 0` is a point | Pass | — |
| `dolbeault_grothendieck_polydisc` | `n=1`, `p=q=0`, `φ=z̄dz̄`; `n=2`, `φ=z̄₂dz̄₁` | `∂̄(z̄²/2)=z̄dz̄`; `∂̄φ=dz̄₂∧dz̄₁≠0`, excluded by `hclosed` | Pass | — |
| `exists_mixed_parameter_dbar_solution` | `P=Q=pt`, `Ω=ℂ`, `f=1`; `u=z` | `u=z̄`: `(1+I·(−I))/2=1`; `(1+I·I)/2=0` | Pass | — |
| `weierstrass_preparation` | `d=0`; `f=w²−z`; `f=(w−z)e^w` | `u=f`, empty sum; `u=1`, `a₀=−z`, `a₁=0`; `u=e^w`, `P=w−z` | Pass | — |
| `weierstrass_preparation_unique` | `uP=u′P′` | `P′=(u/u′)P+0=1·P+(P′−P)` with `deg_w(P′−P)<d`; (2.4) gives `u=u′`, `P=P′` | Pass | — |
| `weierstrass_division` | `d=0`; `g=w−z`, `f=w²` | `q=f/g`, `r` empty; `q=w+z`, `r₀=z²` | Pass | — |
| `ruckert_nullstellensatz` | `k=0`; `f₁=z²`, `g=z` | `g≡0` near `x`, `m=1`; `g²=1·f₁`, `m=2` | Pass | — |
| `oka_coherence` | `f₁=z²`; `f=(z₁,z₂)` | ℂ{z} is a domain, so the relation module is 0 and `m=0`; Koszul `(z₂,−z₁)` generates | Pass | — |
| `cartan_coherence_reducedIdeal` | `f₁=z²`, `x=0`, `y≠0` | ideal `(z)` at 0; `z` is a unit near `y`, so it generates the unit ideal there | Pass | — |
| `riemann_extension` | `k=0`; `A={0}`, `1/z`; `sin z/z` | `interior U=∅` forces `U=∅`; unbounded, excluded by `hbdd`; extends by 1 | Pass | — |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | stalk ℂ, `dim 0=finrank`; discrete valuation ring (`instIsDiscreteValuationRingStalk` through `smoothStalkIso`), dimension 1 | Pass | — |
| `uniqueFactorizationMonoid_holomorphicStalk` | `E=ℂ` | a discrete valuation ring is a principal ideal domain, hence factorial; `IsDomain` is a `Prop`, so `∃ _ : IsDomain` equals the pinned `smoothStalkIsDomain` | Pass | — |
| `hartogs_extension_across_point` | ℂ², `z₁z₂`; ℂ, `1/z`; line with two origins × ℂ | extends; excluded by `2≤finrank`; `{p}` closed (T1), Hartogs in the chart at `p`, no `T2Space` needed | Pass | — |
| `complexBesselSymbol`, `_temperate` | `z=0`; `‖ζ‖=1`, `z=2+2i` | `1`; `|exp((1+i)log 2)|=2=(1+1)^(Re z/2)` | Pass | — |
| `dolbeaultCocycles`/`Coboundaries`/`DolbeaultCohomology` | `q=0`; `n=0`; `M=ℂ` | coboundaries `⊥`; point gives `H^(0,0)=ℂ`; `H^(0,1)(ℂ)=0`, while `h dz` (type `(1,0)`) is not a cocycle of type `(0,1)` | Pass | — |
| `finiteDimensional_dolbeaultCohomology` | `M=∅`; `p>n` | 0; no nonzero `(p,q)` forms | Pass | — |
| `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf surface | `h^(0,0)=1=h^(1,1)`, `h^(1,0)=0=h^(0,1)`; `h^(0,1)=1=h^(2,1)` without Kähler | Pass | — |
| `IsKahler` | flat ℂ; `form=0` | `ω(v,iv)=|v|²>0`, `N=0`; 0 fails `tames` | Pass | — |
| `del_delBar_lemma` | elliptic curve, `α=ω`; ℂP¹, exact `(1,1)` | `∫ω>0`, not exact, excluded by `hexact`; `∫α=0`, and `α=∂∂̄γ` | Pass | — |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | elliptic `k=1`; ℂP¹ `k=2`; `k>2n` | `2=1+1`; `1=0+1+0`; every `h^(p,k−p)` has `p>n` or `k−p>n`, so 0 | Pass | — |
| `finrank_dolbeaultCohomology_symm` | Hopf | `h^(1,0)=0≠1=h^(0,1)`; Hopf has `H²(M;ℝ)=0`, so no `IsKahler` | Pass | — |
| `even_finrank_deRhamCohomology_odd` | `T²`; closed annulus; Kodaira–Thurston | `b₁=2`; `b₁=1`, excluded by `Boundaryless`; `b₁=3`, excluded by `nijenhuis=0` | Pass | — |
| `lefschetzMap` | `j=0`; `j=1` | `id`; `a ↦ a∧c` via `(wedge k 2).flip c` | Pass | — |
| `hard_lefschetz` | ℂP², `k=0`; `S²×S²`, `aσ₁+bσ₂`; `σ₁` | `∫ω²=1≠0`; `2ab≠0`; `σ₁²=0` and `σ₁` fails `tames` | Pass | — |
| K3.HolomorphicStalk [sample] | `1+z`, `z`, `z²` at 0 | units: `1≠0` yes, `0` no; `z²∈𝔪²` (value 0, derivative 0); `z∉𝔪²` (derivative 1) | Pass | — |
| K3.MeromorphicGermField [sample, R07] | `φ=(z−a)^(−2)+1`; `k=0,1`; `e=2z` | `principalPart=X²`, regular part 1, `regularEval` 1; `∮(z−a)φ/(2πi)=1`, `∮φ/(2πi)=0`; `1/z↦1/(2z)↦1/w` | Pass | R07 (cite) |
| K4.ComponentwiseFiniteRankAssembly [sample] | `M=ℕ`, `r(j)=j`; `∅`; rank 0 | fibres `ℂ^j` unbounded, so no single `VectorBundle ℂ F`; one empty family; zero bundle | Pass | — |
| K4.P [R02] | point; ℂP¹; `E_τ` | `exp(2πi·)` has kernel ℤ (`exp` would give `2πiℤ`); `c₁(O(1))=+1`; `H¹(𝒪)=ℂ`, so `c₁` is not injective | Pass | R02 (ownership) |
| K5a pointwise star [sample] | ℝ²; `α=dx`, `β=dy` | `*dx=dy`, `*dy=−dx`, `**=(−1)^(1·1)=−1`; `⟨*dx,dy⟩=1=vol(dx∧dy)` | Pass | — |
| K5a codifferential and Green [sample] | ℝ², `β=f dx`, `α=g` | `d*β=(−1)^(2·2+1)*d*β=−f_x`; `d(gf dy)=(g_x f+g f_x)vol=⟨dg,β⟩−⟨g,d*β⟩` | Pass | — |
| K5a type law [sample] | standard ℂ, `dz` | `*dz=dy−i dx=−i dz`, type `(1,0)=(1−0,1−1)`; `barStar dz=i dz̄`, type `(0,1)` | Pass | — |
| K5a.SmoothSectionMontel [sample] | `M=ℕ`, rank 1; `C⁰` unit ball | `ℂ^ℕ` product, bounded sets lie in products of discs and are compact; the `C⁰` ball without derivative bounds is not | Pass | — |
| K5a.ComponentwiseCompact [sample] | ranks 0, 1, 2 | `L²=0⊕ℂ⊕ℂ²`, `‖(0,3,(0,4))‖²=25`; all components occur in any finite subcover (disjoint) | Pass | — |
| K5b.0 [sample] | standard ℂ, `H=I` | `|dz|²=2(H⁻¹)₁₁=2`; `dz♯`: `ā/2=1`, `b̄/2=0`, so `2∂_z`; `ω^1/1!=dx∧dy=vol`; `∂̄*=−*∂*` from Stokes with `**=(−1)^k` | Pass | — |
| K5b.1 [sample] | ℂP¹, `O(−1)`; elliptic curve | `h¹(O(−1))=h⁰(O(1)⊗O(−2))=0`; all `h^(p,q)=1` | Pass | — |
| K6.1 integration comparison [R03] | `ℂP¹⊂ℂP²`, `α=ω_FS`; node `z²=w²+w³` | `∫ω_FS=1=⟨[ω_FS],[ℂP¹]⟩`; `S={0}`, two branches, each a regular piece with coefficient 1 | Pass | R03 (citation) |
| K7 genus dictionary [R01] | elliptic curve; ℂP¹; genus 2 | `g=1`, `b₁=2`, cup matrix `[[0,1],[−1,0]]`; `g=0`, `H²≃ℤ`; a unimodular alternating `ℤ⁴` form has a symplectic basis without classification | Pass | R01 (supplier) |
| ℂPⁿ headlines [R04] | `n=0`; `n=1`; `p=q=2>n` | `h^(0,0)=b₀=1`; `h^(1,1)=b₂=1`, `h^(1,0)=b₁=0`; 0 (without `p≤n`: 1, wrong) | Pass | R04 (state) |
| K4/K5b reason [R05] | trivial line; Tau Ceti's `expReTrivialization` | `ContMDiffVectorBundle ∞ ℂ (Trivial M ℂ) 𝓘(ℂ,E)` holds; `expReTrivialization_notMem_maximalAtlas` shows the class excludes a non-holomorphic chart | Pass | R05 (docstring) |
| K7.1 [sample, R06] | `n=1`, `i=0,1`; `[2:4]`; `n=0` | `[v₀:v₁]↦v₁/v₀`, inverse `[1:z]`; `↦v₀/v₁`, inverse `[z:1]`; transition `1/z`; `[1:2]`; a point | Pass | R06 (attribution) |
| K7.2 [sample] | `O(a)⊗O(b)`; `K_(ℂP¹)` | `g^a g^b=g^(a+b)`; `dz=−w⁻²dw` gives `O(−2)` | Pass | — |
| Fubini–Study [sample] | `∂∂̄ log r`; `w=(1,i)/√2`; `z=(1,0)`; ∫ | `Σ(δ_ij/r−w̄_i w_j/r²)dw_i∧dw̄_j`; `r=2`, `h(e₁,e₂)=i/(8π)` (transposed `−i/(8π)`); `H=1/π`; `(1/π)·2π·½=1` | Pass | — |
| K7.2.TautologicalIncidence [sample] | chart `i→k`; `d=2`, `k=1`; `k=0` | `a′=az_k`, `z′_i=1/z_k`, `z′_j=z_j/z_k`; `(t·F)=t⁻¹F`, and the opposite convention gives `F(v)=tF(tv)→0`; constants | Pass | — |
| K7.2.RationalQuartic [sample] | `n=1`; `n=2`; charts; control | `(a,b,0,c,d)`, image `{b₂=0}`; exponents `{0,1,3,4}+{0,1,3,4}=0..8`, `h⁰=9`, kernel `x₀x₃−x₁x₂`; `z↦(z,z³,z⁴)`, `u↦(u⁴,u³,u)`; normal quartic bijective at `n=1` | Pass | — |
| K7.FlatDegreeZero [sample] | `τ=i`, `ρ=(−1)^m`; gauge; holonomy; flattening | `exp(πi(x+1))=−f`; `|σ(τ)|=e^(−v)e^v=1` since `Re(aτ)=v`; `(λ,v)~(0,ρ(λ)⁻¹v)`; `i∂∂̄u=(Δ_std u/2)dx∧dy=−(Δ_d u)ω/2` | Pass | — |
| K8.NilpotentCentralReduction [sample] | real Heisenberg, integer lattice; complex Heisenberg | `A=` centre ≅ℝ, `Γ∩A=ℤ`, `S¹→H/Γ→T²`; `A≅ℂ`, `Γ∩A=ℤ[i]`, real rank `2=2·dim_ℂ A` | Pass | — |
| Iwasawa (K8) | Angella's numbers | `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4≠5`: Frölicher does not degenerate at `E₁` | Pass | — |
| Hopf diamond (K7) | Serre and Betti | `h^(0,1)=1↔h^(2,1)=1`; `b₁=1`, `b₂=0`, `b₃=1` for `S¹×S³` | Pass | — |

Forty-nine rows. No statement failed. The changes are citations, ownership, one docstring reason and two statements to add.

## Not verifiable

- ComplexComparisonPartII #848 was read through `roadmaps show` (no checkout given). #1398, #1807, #1808 and #1854 were read through `roadmaps show` and not elaborated.
- Webster 1989, Hörmander, Wells and Raghunathan are settled as uncertified. Griffiths–Harris chapter 0 is cited without a cached text. Their locators were not opened.
- I did not test whether the complex torus `ℂ/L` (`TauCeti/Analysis/Complex/RiemannSurface/ComplexTorus.lean`) or the Hopf surface carries a pinned complex-manifold instance that would make further K7 statements statable. R04 asks the author to give each remaining K7 item its missing carrier.
- The adversarial rows check instances; they are not proofs.

## Source issues

- none

# Review of SmoothBanachRepresentations (pull request #1145 at 41f719f)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is an incremental re-review of the 41 lines changed since 3313062. The previous R01 (two owners of the Fréchet open mapping theorem) is repaired. The repair added no mathematical defect, and the gate passes. Two P3 findings remain:
- **R01** carries the previous R02: the family index.
- **R02** is new. It concerns one library claim in the rewritten scope sentence.

## R01 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This carries the previous R02 (earlier R05 and R01). I have no repair report that marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- :11, “## The roadmaps”: 14 of the 15 subfolders are linked, and `SmoothBanachRepresentations` gets 0 links.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The family index omits this folder.
- Its scope boundary excludes what Layers 0–4 cover: strongly continuous representations of arbitrary Lie groups, unitary ones included.
- The pull request description names neither the companion pull request that adds the entry nor the order in which the two merge.

**Witness.**
- A per-folder count of `](<Dir>/README.md)` on the index at this head gives 1 for 14 folders (2 for ModularInduction) and 0 for SmoothBanachRepresentations.
- The diff outside the roadmap folder is empty.
- #1146 (head e5e8364) carries the bullet at :55 and a rewritten scope bullet at :119–123.

**Repair.** Do one of the following:
- Copy #1146's bullet (:55) and scope bullet (:119–123) into this pull request's family `README.md`, replacing :129–134. The count then gives 15 of 15.
- Or add to the description: “#1146 adds the family-index entry and scope change for this roadmap and merges right after this pull request.”

## R02 (P3) — The new scope sentence's list of pinned open mapping theorems is incomplete

**Location.** `README.md`:9 (new at this head; it replaces the deleted Mathlib-contract sentence):

> At the pins, Mathlib's open mapping theorems onto an infinite-dimensional target need a Banach source (`ContinuousLinearMap.isOpenMap`) or a σ-compact source group (`AddMonoidHom.isOpenMap_of_sigmaCompact`)

**Claim.**
- Read as a statement about what the pin contains, this is false.
- `IsModuleTopology.isOpenMap_of_surjective` (`Mathlib/Topology/Algebra/Module/ModuleTopology.lean:491`) proves that a linear surjection is open. Of the source it asks only `ContinuousAdd` and `ContinuousSMul`. Of the target it asks that it carry the module topology, and such a target may be infinite-dimensional.
- The sentence's conclusion (nothing at the pins applies to a surjection between Fréchet spaces that are not normable) still holds. The paragraph just does not give the reason for this theorem.

**Witness.**
- Source: C∞(S¹), which is not normable and, by Baire, not σ-compact.
- Target: `ℝ^(ℕ)` with its module topology.
- Any linear surjection between them (one exists by a Hamel-basis count) is open by the pinned theorem.

**Repair.** After the σ-compact clause, insert:

> or a target carrying the module topology (`IsModuleTopology.isOpenMap_of_surjective`), which an infinite-dimensional Fréchet space never carries: every linear functional out of a module-topology module is continuous (`IsModuleTopology.continuous_of_linearMap`), and an infinite-dimensional metrizable space has a discontinuous one

I tested this on the C∞(S¹) target:
- v_n = cos(nx)/nⁿ tends to 0 in the word topology: p₂(v_n) = (1+n+n²)/nⁿ, which is about 0.48 at n=3 and 0.0099 at n=5.
- Extend the v_n to a Hamel basis and send each v_n to 1. This functional is discontinuous, so the module-topology theorem does not apply, and the amended sentence is true.

## Previous findings

- R01 — repaired:
  - §7.2 :452 applies “the Fréchet open mapping theorem of LocallyAnalyticDistributions §0.2, at K=𝕜=ℝ or ℂ”, and *Needs* :454 cites it.
  - The contract :80–82 names exactly that theorem.
  - §7.0, the AdicSpaces contract, the Henkel reference and the Baire items are deleted.
- R02 — not repaired:
  - The family `README.md` still links 14 of 15 folders.
  - Lines :129–131 still exclude infinite-dimensional unitary representations of noncompact groups.
  - The description does not name #1146.
  - Carried as R01.

## Verified sound

**Head and diff.**
- Head `41f719f2a9c3dbc938a4ca4fc0ee3c24236cf3c7`; the worktree is clean.
- Since 3313062 only `README.md` changed (+11/−30). `Suggested.lean` is byte-identical (`git diff 3313062 HEAD` on it is empty).
- Nothing changed outside the folder, and the family files are untouched.
- This review changed no file in the worktree or the manifest.

**Gate.** Rerun with the candidate merge order and `--build`:

```text
gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Run with the default configured order instead, the gate prints `depcheck: NOT IN ORDER: SmoothBanachRepresentations`. That is an artefact of the order file, not a defect: this roadmap is a pull request, and the candidate order lists it at line 60.

**Dependency check** (`gate --depcheck … --movable`, candidate order, content main b3d628f):

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. LocallyAnalyticDistributions is at line 44 of the candidate order, before this roadmap at line 60. It is a new-roadmap pull request (#854), and the description's depends-on list already names it.

**Elaboration.**
- `lake env lean Suggested.lean` gives exactly 7 warnings, all “declaration uses `sorry`”, at :95, :104, :116, :135, :148, :165 and :183.
- `#check @name` on all 12 declarations elaborates with no error, and the types are identical to `signatures.md` and to the previous round. No statement changed, so the previous README comparison and the failed one-tactic probe on all 7 theorems still stand.

**The repaired citation, resolved at LocallyAnalyticDistributions head 473fb50 (#854).**
- The heading “### 0.2 Strict sequences and three-space properties” is at README :1082. Its GitHub slug equals the link anchor `#02-strict-sequences-and-three-space-properties`. The path `../../LocallyAnalyticDistributions/README.md` resolves to `TauCetiRoadmap/LocallyAnalyticDistributions/README.md`.
- **Fréchet open mapping** is at :1108: over a complete nontrivially valued field, with no ultrametric hypothesis. This is explicitly broader than the subsection's shared hypothesis (a).
- `naFrechet_openMapping` (`Suggested.lean:73–81`) binds `[NontriviallyNormedField K] [CompleteSpace K]`. For each of V and W it binds `AddCommGroup`, `UniformSpace`, `IsUniformAddGroup`, `Module K`, `T2Space`, `MetrizableSpace` and `CompleteSpace`, plus `WithSeminorms` families, and it concludes `IsOpenMap f` for a surjective `f : V →L[K] W`.
- The contract at :82 restates exactly these hypotheses.
- That roadmap does not mention SmoothBanachRepresentations, so there is no cycle. SpectralManifolds (#1158, :27) cites the same §0.2 for open mapping, so the theorem has one owner.
- A search of main and every open head for any other owner of a Fréchet open mapping theorem found only PadicDifferentialEquationsAndRigidCohomology's LF-space strictness (Crew 3.4), a different object.

**Deleted §7.0 has no consumers.** Searching main and every open head for “SmoothBanachRepresentations” within 40 characters of 7.0, Henkel or open mapping returns no match. Every remaining reference to SmoothBanachRepresentations (NoncompactQuantumSymmetry, AutomorphicFormsOnReductiveGroups, CompactGroups, NoncommutativeGeometry §§7.2a and 7.3, CompactQuantumMetricSpaces, QuantitativeOrbitMethod Layers 2, 3 and 6, BanachAlgebras, #1146) cites a layer or section that still exists. In the README, no reference to §7.0, AdicSpaces, Henkel's paper, the Baire theorems or `NonarchimedeanAddGroup` remains outside the scope sentence that names the pinned Henkel declaration.

**Library declarations opened at the pins** (Mathlib 1b1ccf4, Tau Ceti 2fd255d).

Mathlib:
- `ContinuousLinearMap.isOpenMap` (`Analysis/Normed/Operator/Banach.lean:229`): normed source and target, with `CompleteSpace F` at :81 and `CompleteSpace E` at :155.
- `MonoidHom.isOpenMap_of_sigmaCompact` (`Topology/Algebra/Group/OpenMapping.lean:114`): a `to_additive` theorem, which supplies `AddMonoidHom.isOpenMap_of_sigmaCompact`. It needs a σ-compact source (:29–31) and a Baire T2 target.
- `IsModuleTopology.isOpenMap_of_surjective` (`ModuleTopology.lean:491`) and `continuous_of_linearMap` (:340): see R02.
- `isOpenMap_of_finiteDimensional` (`Module/FiniteDimension.lean:346`) and `ContinuousLinearMap.isOpenMap_of_ne_zero` (`ContinuousLinearMap/Basic.lean:918`): finite-dimensional targets, correctly excluded by “onto an infinite-dimensional target”.

Tau Ceti:
- `TauCeti.HasZeroSequenceOfUnits.isOpenMap` (`Topology/Algebra/OpenMapping/Henkel.lean:79`), with `[NonarchimedeanAddGroup M]` at :69, as the scope sentence says.
- The other Tau Ceti open mapping theorems also need a nonarchimedean or normed source, so none of them reaches a non-normable archimedean Fréchet space:
  - `isOpenMap_of_isTateRing` (`RingTheory/Huber/OpenMapping.lean:109`, nonarchimedean at :98);
  - `LinearMap.isOpenMap_of_isTate` (`Analysis/Normed/Operator/RingOpNorm/OpenMapping.lean:159`, `IsUltrametricDist` source at :152);
  - `isOpenMap_of_exists_norm_le` (`Analysis/Normed/Group/OpenMapping.lean:26`, seminormed groups).

**New Check (:494).** Layer 2 defines `p_m(v)=Σ_(|w|≤m) ‖A_w v‖` (:217). For (α_t f)(x)=f(x−t), the derivative at t=0 is A_X f = −f′. For f_n=sin(nx)/n this gives p₀=1/n and A_X f_n=−cos(nx) with sup 1, so p₁=1/n+1. Hence f_n→0 in the sup norm while p₁(f_n)≥1, so the identity onto the sup-normed C∞(S¹) is not open. That target is incomplete: its sup-norm closure contains |sin x|. The Check is correct.

**Seeded sample, where it falls in the changed passages.** Of the sampled targets, only 7.2 changed.
- Layer 7's locator, Casselman Proposition 6.1, p.13, is at `casselman2016` lines 638 (page marker) and 645–649. It states a finite sum of π(f_j)v_j with f_j supported in Ω, which supports the factorization used for lifting.
- The open-mapping step now cites a roadmap theorem and carries no source locator.
- 0.1, 0.3, 1.1–1.5, 3.1, 4.1, 5.1, 6.1, 7.1, 7.3 and 8.1 are unchanged; earlier rounds verified them.
- The two Casselman Proposition 6.1 misprints that the r13 review reported (`casselman2016` lines 652–658 and 670–672) are still in the text. They are already in the errata register, so `## Source issues` does not list them again.

**Remarks on untouched text.** None.

### Adversarial table

New rows, for the statements this diff adds or changes:

| # | Statement | Instances and values computed | Result |
|---|---|---|---|
| N1 | §7.2 quotient topology via LocallyAnalyticDistributions §0.2 at ℝ and ℂ | M=E: target 0, open. M=0: identity, open. C(S¹) with M the mean-zero functions: (E/M)∞=ℂ, and the image of the p₀-ball of radius r under f↦mean f is the disc of radius r, open. E=C(S¹)⊕C(S¹) (ℓ¹ norm, diagonal rotation), M=0⊕C(S¹): p₁(f,0)=p₁(f), so the image of the p₁-ball of radius r is the p₁-ball of radius r, open. | True |
| N2 | Contract :82 against `naFrechet_openMapping` | 2 field binders and 7 binders per space, plus 2 `WithSeminorms` families, agree one for one. ℝ and ℂ: ‖2‖=2>1 and complete. E∞ and (E/M)∞: countable word families (Layer 2), Hausdorff, complete. | True |
| N3 | New Check :494 | n=1: p₀=1, p₁=2. n=10: 0.1 and 1.1. n=100: 0.01 and 1.01. The sup of \|cos nx\| is 1, at x=0. | True |
| N4 | Scope: Henkel's form needs a nonarchimedean source, never one over ℝ or ℂ | ℝ², v=(3,4): v/10 has norm 0.5 and lies in the unit disc. Then sv=n·(s/n)v with \|s/n\|·5<1 for large n, so any open subgroup containing the disc contains ℝv for every v, and hence is ℝ². | True |
| N5 | Scope: no Banach or σ-compact theorem reaches a non-normable Fréchet source | C∞(S¹) is not normable. A σ-compact Baire space has a compact set with interior, so a TVS that is both would be locally compact and finite-dimensional. Banach.lean:29 requires a normed source. | True |
| N6 | Scope: the list of Mathlib's open mapping theorems | `isOpenMap_of_surjective` with source C∞(S¹) and target `ℝ^(ℕ)` (module topology) applies, so the list is incomplete. On a Fréchet target, v_n=cos(nx)/nⁿ has p₂ ≈ 0.48 (n=3) and 0.0099 (n=5), and the functional with v_n↦1 is discontinuous, so that theorem is excluded. | Incomplete list (R02); the conclusion is true |
| N7 | Deletion of §7.0 and the Layer 7 Examples and Dependencies text | No external citation of §7.0 (search above). Examples and Dependencies now name only §7.2's consumer of LocallyAnalyticDistributions §0.2. | No defect |

Rows carried from the previous report (`PRREVIEW-SmoothBanachRepresentations_r13`, adversarial table) for untouched statements, with that report's values. Its N8 and N10 tested the deleted §7.0 and are dropped, and its N11 (7.1 and 7.2 orbits) is superseded by N1 above.

| r13 row | Statement | Values (from r13) | Result |
|---|---|---|---|
| N1 | 0.2 scaling law | e^{2t}: A₂x=2x; s=−1: A₋₁x=−x; s=0: A=0 | True |
| N2 | 0.2 𝕜-linearity | e^{it}: A(i)=−1=i·A1, whereas a conjugate-linear map gives 1 | True |
| N3 | 0.2 no additivity | L²(ℝ²) strip: in D(A_(1,1)) but not in D(A_(1,0)), squared quotient ‖φ‖²/\|t\|→∞ | True |
| N4 | 0.3 Check | sup over [−1,1] is e≈2.718, while the global sup is ∞ | True |
| N5 | 1.3 no separability | ℓ^∞, trivial action, tent of mass 1: ‖π(f)v‖=‖v‖ | True |
| N6 | 4.1 automatic smoothness | cos on S¹: W of dimension 2, rotation matrix ρ(θ) | True |
| N7 | 6.1 exponential-product chart | Affine group: J≡1 in order (H,N) and J=e^{−s₂} in order (N,H); rank 1 for a non-basis | True |
| N9 | 7.2a completed quotient | ℂ_ℝ⊗ℂ_ℝ (dimension 4) → ℂ: quotient norm of 1⊗1 is 1 | True |
| N12 | `Suggested.lean` docstring | 12 of 12 signatures unchanged | No defect |
| r12 1 | 0.1 compact bounds | e≈2.718; L∞ translation difference 1; L² √(2\|t\|) | True |
| r12 3 | 1.1 fixed support | K=∅ gives D_K={0}; for G=ℤ, dim D_K=\|K\| | True |
| r12 4 | 1.3 bound | Mass-2 trivial group: equality; for e^t, e−1≈1.718 ≤ e | True |
| r12 5 | 1.4 convolution | S₃: δ_(12)*δ_(23)=δ_(123); affine group c(a₀,0)=a₀ | True |
| r12 6–9 | 3.1–3.4 | [H,N]v=Nv; gNg⁻¹=2N; −∫f′e^t=∫fe^t; q_H=1=tr ad H | True |
| r12 10–12 | 4.1, `dense_smoothLieVectors`, `isSmoothLieVector_smear` | Real span of cos has dimension 2; H^∞ dense in L²(ℝ); orbit e^s∫fe^t | True |
| r12 13–15 | `scalarParametrix`, `dixmierMalliavin`, `_function` | ε=0 forces the limit 0≠δ₀; f(1)=1/2; δ_e*δ_(12)=δ_(12) | True |
| r12 16–17 | 7.1, `smooth_lift` | Projection ℝ²→ℝ; f̂(1) lift e^{ix}; T=0 has no lift | True |
| r12 18–22 | 7.2a, 7.3, 7.4, `smooth_inverse`, 8.1 | √2+1≈2.414 against 1; derivatives 3 and 9; ‖δ_z−δ₁‖=2; I−e^tE₁₂; (dαE₁₂)*=E₂₁ | True |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978).** No legal open copy was found in earlier rounds, and it was not fetched this round. The README labels its locators uncertified and relies on Casselman's verified statements.
- **Schneider's notes, Proposition 8.6.** This is LocallyAnalyticDistributions' own source for the theorem consumed here, and it was not opened. The theorem as consumed (Fréchet spaces over ℝ or ℂ) is the classical open mapping theorem for F-spaces.
- **Ownership against the three board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): their READMEs were not read.
- **Manifest.** The package's `sources.toml` still records `henkel2014`, which the README no longer cites. The manifest lies outside this pull request and this review edits none.

## Source issues

- none

# Review of ReductiveGroups (pull request #1332 at d22e3c4)

**Verdict:** accepted

Incremental re-review of 20 changed lines since `ff2a5ec` (14 insertions and 6 deletions, all in `TauCetiRoadmap/ReductiveGroups/README.md`). No findings remain. The two previous findings are repaired; the gate passes. This verdict means ready for a human's final approval.

## Previous findings

- R01 — repaired: `README.md:1075–1083` now specifies a Borel subgroup containing the torus, reverses the defining-ideal inclusion correctly, and excludes the trivial adjoint character. `README.md:3747–3752` computes the positive and simple roots in SL₂ and SL₃.
- R02 — repaired: The description now says “One new declaration, `StructureAcceptance.orbit_locallyClosed`” and “1,816 added and 299 removed lines.” Both agree with the head and its diff against main.

## Verified sound

### Scope, gate and elaboration

- Confirmed head `d22e3c44292e2084f56e349f1e3ed56d2e0ef2b5`, the 20-line incremental diff, a clean worktree and no changes outside this roadmap folder. `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged since `ff2a5ec`. No PR file was modified.
- Read the repository's normative README and CONTRIBUTING. Compared the shape with the main-branch ChevalleyGroups and RootSystemsPartII roadmaps. The changed prose remains a supplier contract and a discriminating Check; it adds no construction, dependency edge, route restriction, algorithm or Lean stand-in.
- Gate rerun:

```text
gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The supplied worker gate at this head additionally reports `build=0 OK` for `lake build TauCetiRoadmap.ReductiveGroups.Suggested`.

- Independent dependency check, with the prescribed `--movable --pr 1332` options:

```text
depcheck: 235 roadmaps, 2132 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- Direct `lake env lean` elaboration of `TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0, with exactly 11 `sorry` warnings and no other warnings. The warning lines are 152, 178, 198, 220, 241, 263, 284, 309, 332, 494 and 537.
- A scratch copy with `#check @name` for all 22 declarations also elaborates successfully. Its types reproduce all 22 worker signatures exactly after whitespace normalization. The README changes introduce no changed Lean signature or missing binder. In particular the any-field orbit statement, the smooth/geometrically-connected Nagata statement and the finite-dimensional Weyl-arrangement statement retain their hypotheses. The signature and padding conclusions for the untouched declarations are carried from [r113](PRREVIEW-ReductiveGroups~113.md); no new sorried declaration needs a one-tactic probe.

### Pinned definitions and the repaired contract

Opened these declarations at Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. Paths below are relative to their respective library repositories.

- `TauCeti/Algebra/AlgebraicGroup/Pinning/Basic.lean:57`, `SplitMaximalTorus.IsPositiveRoot`: membership in the nontrivial adjoint weights, together with containment of the **whole** weight space in the Borel Lie algebra. At `:72`, `IsSimpleRoot` adds non-decomposability as a sum of two positive roots. These are exactly the two clauses now stated at README:1079–1082.
- `TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:250`, `Derivation.nontrivialAdjointWeights`: `α ≠ 1 ∧ adjointWeightSpace π α ≠ ⊥`. The multiplicative trivial character is the additive zero weight. Thus the zero weight is excluded even when its weight space is nonzero and lies in the Borel Lie algebra.
- `TauCeti/Algebra/AlgebraicGroup/Pinning/Basic.lean:88`, `Pinning`: smoothness, finite type and `ConnectedSpace (PrimeSpectrum R)` are explicit binders. Its `borel_le_torus` field at `:100` is `borel ≤ torus.definingIdeal`; its `rootSpaceEquiv` at `:102` is a linear equivalence from the base ring onto each simple-root space. No root datum is an input. The revised contract correctly distinguishes the subgroup inclusion from its reversed ideal inclusion.
- `Mathlib/Topology/Connected/Basic.lean:705`, `ConnectedSpace`, explicitly includes `Nonempty`. Consequently both the disconnected spectrum and the empty spectrum remain excluded, as README:1083 says.
- `TauCeti/Algebra/AlgebraicGroup/SplitTorus/Maximal.lean:54`, `SplitMaximalTorus`, supplies a surjective coordinate map with geometric-fibre maximality; it imposes neither root-space freeness nor constant roots/coroots. `TauCeti/Algebra/AlgebraicGroup/Borel/Over.lean:59`, `IsBorelOver`, supplies smoothness and the fibrewise Borel condition, without a positive system. The distinctions in §8.1 remain valid.
- `TauCeti/Algebra/AlgebraicGroup/Pinning/Isomorphism.lean:65` and `:86` preserve positivity and simplicity under transport; `:102` constructs `Pinning.comapOfIso`, with the root-vector formula at `:154`. The revised description is compatible with §8.2's consumed transport. `TauCeti/Algebra/AlgebraicGroup/Pinning/BaseChange.lean:48` compares root spaces of two independently supplied pinnings; it is not a constructor of the second pinning.

### Seeded sample, sources and ownership

- **§8.1:** reopened Conrad Definition 5.1.1, printed p. 136 (`conrad-rgs line 5651` through line 5659): nonempty base, constant roots, free rank-one root spaces and constant coroots. Example 5.1.2 (`conrad-rgs line 5669`) distinguishes the coroot condition. The revised supplier contract preserves all these additional conditions.
- **§8.2:** reopened Conrad Definition 6.1.1, printed p. 186 (`conrad-rgs line 7725`), and Remark 6.1.2, pp. 186–187 (`conrad-rgs line 7738` through line 7751). A pinning trivializes the simple-root lines of a positive system; over a connected base its Borel determines that system. Over a disconnected base arbitrary Borels need not arise from one constant positive system. These support the affected section's connected/disconnected distinction.
- **§1.1:** untouched and independent of this change. Its source checks and three computed rows are carried from [r113](PRREVIEW-ReductiveGroups~113.md), which records `jantzen-1985` §§2.8, 2.10, 3.3, 3.9, 4.2 and 4.14–4.16. No newly unverified locator appears in the changed passages.
- Object searches using `roadmaps grep` for pinnings, split maximal tori and simple-root spaces, plus direct inspection of the pins, confirm that this repair **cites** the native definitions rather than replanning them. GroupSchemesOverABase #1522, `TauCetiRoadmap/GroupSchemesOverABase/README.md:88` and `:236`, explicitly consumes ReductiveGroups §§8.1–8.2. SchubertGeometry #1224, `TauCetiRoadmap/SchubertGeometry/README.md:498`, assigns group/root/pinning structure to ReductiveGroups. Main's `TauCetiRoadmap/ChevalleyGroups/README.md:35` assigns abstract structure and the canonical constructor to ReductiveGroups. The unchanged section identifiers continue to resolve; no ownership moves are needed.
- The citation resolver finds no unresolved cross-roadmap citation. Its rerun does not inspect library names, so the changed library references were checked directly above. The overlap data has no dropped id and no id depending only on an open revision. The description's `merge-order` block still explicitly orders #1807, #1808 and #1854 after #1332, covering all three reported shared-folder conflicts. This repair changes neither that order nor their target ownership.

### Headline coverage

The unchanged README headlines stated in Lean are: the normal quotient/faithful-flatness theorem; local closedness of orbits over any field; the characteristic-zero linear-reductivity criterion; Nagata's criterion; characteristic-zero Levi complements; conjugacy of maximal tori; split Bruhat/Tits systems; Levi complements of parabolics; Lang surjectivity; the plane braid-group theorem; and the finite Weyl-arrangement theorem. All 11 retain their statements. The module docstring continues to identify the missing carriers for rational representation comparisons, general group/root-data and relative classification, the integral Chevalley realization, Harish–Chandra and Steinberg-endomorphism interfaces, and highest-weight theory. The corrected §8.2 contract does not supply the still-missing extraction of a general group's root datum, so it does not make a new headline statable.

### Adversarial pass

Eight freshly computed rows cover the changed mathematical clauses, their new examples and the description repair. Sixteen unchanged rows below carry forward the prior report's computations, explicitly attributed to r113.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| README:1075–1077, Borel contains torus | SL₂/ℤ, upper Borel and diagonal torus; lower Borel as direction control | In ℤ[a,b,c,d]/(ad−bc−1), I(B⁺)=(c) ⊆ (b,c)=I(T); hence T⊆B⁺. For B⁻, (b)⊆(b,c). Reverse ideal containment fails since b∉(c). | Matches `borel_le_torus` | R01 repaired |
| README:1079–1080 and :3747–3749, positive weights | SL₂/ℤ, D=diag(t,t⁻¹) | DHD⁻¹=H; DE₁₂D⁻¹=t²E₁₂; DE₂₁D⁻¹=t⁻²E₂₁. Lie(B⁺)=ℤH⊕ℤE₁₂. Nontrivial weights {2,−2}; positive roots {2}={α}, as asserted. | holds | repaired zero-weight exclusion |
| README:1081–1082 and :3749–3751, simple roots | Same SL₂; wrong model admitting 0 | Correct positive set {2} has sum set {4}; simple set {2}. Wrong positive set {0,2} has 0=0+0 and 2=2+0, giving simple set ∅. | correct model gives {α}; wrong model rejected | new Check discriminates |
| README:3751–3752, SL₃ roots | Diagonal determinant-one torus, upper Borel | E₁₂,E₂₃,E₁₃ have characters t₁/t₂, t₂/t₃, t₁/t₃. In simple coordinates the positive set is {(1,0),(0,1),(1,1)}; (1,1)=(1,0)+(0,1), so the simple set is {(1,0),(0,1)}. | equals the stated sets | new Check holds |
| README:1077–1078, root-space equivalence | SL₂ over ℤ, ℚ, 𝔽₂; zero map and doubling | u↦uE₁₂ is rank-one isomorphism. Zero has image 0. Doubling has image 2ℤE₁₂≠ℤE₁₂ over ℤ, inverse 1/2 over ℚ, and image 0 over 𝔽₂. | equivalence excludes non-generators | contract still correct |
| README:1083 and affected §8.2, empty/simple index cases | Torus; zero ring; k×k | Torus has only weight 0, so positive/simple sets ∅ and zero required root vectors. Spec(0)=∅ violates Nonempty; Spec(k×k) has two disjoint nonempty open components and violates preconnectedness. | matches the pinned domain | no new restriction introduced |
| New SL₂ computation against characteristic-two Check | SL₂/𝔽₂, diagonal torus as a group scheme | Characters t² and t⁻² remain distinct from 1 in 𝔽₂[t,t⁻¹]; positive/simple set {2}. The differential of t² is 0, but its character is nontrivial. Root vector E₁₂≠0, while 2E₁₂=0. | compatible with the existing Check | no regression |
| Description declaration and diff counts | Head compared with main | `orbit_locallyClosed` present at Suggested.lean:178; total 22 declarations. Actual folder diff 1816 insertions/299 deletions equals description 1816/299. | exact agreement | R02 repaired |

Rows carried from [r113](PRREVIEW-ReductiveGroups~113.md); `r113` in each row is the attribution of its computation, not a fresh full review:

| Statement | Instances tried | Values computed | Result | Change / evidence |
|---|---|---|---|---|
| `orbit_locallyClosed` | trivial group on `Spec k`; `μ₃` on `𝔸¹_ℝ` at 1; `𝔾_m` on `𝔸¹` at 1, 0; `μ_p` on `𝔸¹_(𝔽_p)` at 1; `μ_p` over `𝔽_p(a)` at `a`; `𝔾_m` on the doubled-origin line at 1; constant `ℤ` on `𝔸¹_ℚ` at 0 | one closed point; `t³−1=(t−1)(t²+t+1)`, two closed points; `D(t)` open, `{0}` closed; `s^p−1=(s−1)^p`, one point `(t−1)`; one point `(t−a)`; complement of both origins, open; `{t=n}` has closure `𝔸¹`, misses the generic point, not locally closed, excluded by `QuasiCompact G.hom` | holds | carried; r113 |
| §3A.6 formula | `n=1,d=1`; `n=2,d=2`; `d=0`; `d=−1` | rank 2 = 2; `C(4,2)=6` = rank of `Sym²(A³)`; `A`; `H⁰=0`, outside `d ≥ 0` | holds | carried; r113 |
| §8.1 against `SplitMaximalTorus` | `GL(R⊕L)`, `L` not free; Conrad Ex. 5.1.2; `SL₂/ℤ`, `r=1` | diagonal `𝔾_m²` is a pinned split maximal torus, but the root spaces `L`, `L∨` are not free; rank-2 torus present, coroot condition fails; `t ↦ diag(t,t⁻¹)` gives `ℤ[a,b,c,d]/(ad−bc−1) ↠ ℤ[t^±1]` | holds (the added conditions are needed) | carried; r113 |
| 1.1 invariants | weight-one line of `𝔾_m`; `μ_p` over `𝔽_p`; trivial group on `ℤ/2` | invariants 0; `t ≠ 1` in `𝔽_p[t]/(t^p−1)`; `ℤ/2` | holds | carried; r113 |
| 1.1 Hochschild complex | `ℤ[t,t⁻¹]` weight one; trivial group | `d⁰(1)=1⊗(t−1)`, `d¹d⁰=0`; differentials `0, id, 0` | holds | carried; r113 |
| 1.1 induction | `1⊂C₂` over `ℤ`; `C₂⊂S₃`; weight-one line | rank 2; rank 3; 0 against trivial `ℤ` | holds | carried; r113 |
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p⊂μ_(p²)`; `N=1`; `N=G`; `αₚ×αₚ` | `k[t^p]`; `O(G)`; `k`; `k[y]/(y^p)` | holds | carried; r113 |
| `linearlyReductive_iff_reductive_identityComponent` | `ℤ/2`; `𝔾_a`; `O₂` | T↔T; F↔F; T↔T | holds | carried; r113 |
| `linearlyReductive_iff_torus` | `𝔾_m`; `SL₂` in char 2; norm-one torus of `𝔽_(p²)/𝔽_p` | T↔T; F↔F; T↔T, nonsplit | holds | carried; r113 |
| `exists_levi_complement` | `𝔾_a⋊𝔾_m`; `𝔾_a` | complements `{(a(1−t),t)}`; `J=0` fails | holds | carried; r113 |
| `exists_conjugate_eq_of_isMaximalTorus` | diagonal torus of `SL₂` and a conjugate | `g=I+E₁₂` | holds | carried; r113 |
| `exists_titsSystem_of_isBorel` | `GL₂(𝔽₂)`; `𝔾_m` | `\|B\|=2`, `2+4=6`; `W=1` | holds | carried; r113 |
| `exists_levi_complement_of_isParabolic` | upper Borel of `GL₂`; `P=G` | upper entry `a(t−s)`; `J=0` | holds | carried; r113 |
| `lang_surjective` | `𝔾_m/𝔽₃`; `𝔾_a/𝔽₂` | `g⁻¹g³=g²`; `a²−a=c` solvable | holds | carried; r113 |
| `plane_braid` | `n=0,1,2` | trivial; trivial; generator of `ℤ` | holds | carried; r113 |
| `nonempty_mulEquiv_artinGroup` | `A₁` on `ℂ`; `A₁×A₁`; `A₁` with a central `ℂ` | `ℤ`; `ℤ²`; `ℤ` | holds | carried; r113 |

Remark on untouched text, carried from r113: the generated `merge-order` block still lists #1676 although it is on main; this incremental review requests no change to that previously passed text.

## Not verifiable

- No changed statement or affected locator remains unverifiable.
- `waterhouse`, `borel`, `springer`, `kohls`, `humphreys`, `howlett-lehrer` and `serre-linear-reps` retain their settled uncertified status. None is needed to verify this repair; no source was requested again.
- Untouched mathematical claims, source checks and padding conclusions are carried from r113, rather than represented as freshly re-reviewed.

## Source issues

- none

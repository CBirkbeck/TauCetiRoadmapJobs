# Review of ReductiveGroups (pull request #1332 at ff2a5ec)

**Verdict:** needs changes

Incremental re-review of the 90 lines changed since `f510911` (84 added and 6 removed, all in `TauCetiRoadmap/ReductiveGroups/README.md` and `TauCetiRoadmap/ReductiveGroups/Suggested.lean`). All three previous findings are repaired. Two new P3 findings come from the repairs: one in the new supplier-contract text and one in the pull-request description. The gate passes.

## R01 (P3) — the supplier contract misdescribes how `TauCeti.Pinning` reads off simple roots and the inclusion of its Borel

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:1075–1080` (new in this head's *From Tau Ceti* block).

> "a split maximal torus, a Borel ideal containing it, … (`TauCeti.SplitMaximalTorus.IsSimpleRoot`: the adjoint weights whose weight space lies in the Lie algebra of the Borel and which are not sums of two such)"

**Claim.** The README paraphrases the pinned definitions. Read as written, the zero weight counts as one of "such" weights: its weight space, the Lie algebra of the torus, lies in the Lie algebra of the Borel. Then every `α = α + 0` is a sum of two such weights, so no weight is simple. Also, "a Borel ideal containing it" gets the inclusion backwards if it is read as ideals. In the library the Borel's ideal lies *inside* the torus's defining ideal; it is the Borel *subgroup* that contains the torus.

**Witness.** `SplitMaximalTorus.IsPositiveRoot` (`Pinning/Basic.lean:57`) requires membership in `Derivation.nontrivialAdjointWeights` (`Tangent/RootSpace.lean:250`: `α ≠ 1 ∧ adjointWeightSpace π α ≠ ⊥`). `Pinning.borel_le_torus` (`Pinning/Basic.lean:100`) is `borel ≤ torus.definingIdeal`. Take `SL₂/ℤ` with the upper Borel. The weights are `{0, α, −α}`. Read literally, the README gives positive weights `{0, α}` and no simple root. The pin gives positive roots `{α}` and simple roots `{α}`.

**Repair.** Replace the two phrases with "a Borel subgroup containing it (its ideal lies in the torus's defining ideal)" and "the nontrivial adjoint weights whose weight space lies in the Lie algebra of the Borel and which are not sums of two such". Tested on the same example: for `SL₂/ℤ` the nontrivial weights are `{α, −α}`, the positive ones `{α}` and the simple ones `{α}`; the ideals satisfy `(c) ⊆ (b, c)`. For `SL₃` the positive roots are `{α₁, α₂, α₁+α₂}` and the simple roots `{α₁, α₂}`.

## R02 (P3) — the pull-request description says `Suggested.lean` gains no declaration

**Location.** The pull-request description: the author's text outside the generated blocks, in its first paragraph and under "What it adds to the text on main".

> "**Suggested.lean.** No new declaration." and "Against main it is 1,726 added and 295 removed lines."

**Claim.** The repair added the §3A.2 headline, so both sentences are now wrong.

**Witness.** `Suggested.lean:178` declares `theorem orbit_locallyClosed` (22 declarations at this head, 21 at `f510911`). `git diff --shortstat origin/main...HEAD -- TauCetiRoadmap/ReductiveGroups` gives `1808 insertions(+), 299 deletions(-)`.

**Repair.** Replace the bullet with: "**Suggested.lean.** One new declaration, `StructureAcceptance.orbit_locallyClosed` (§3A.2, local closedness of orbits over any field); `linearlyReductive_iff_torus` drops …" (keep the rest of the bullet). Change the counts to 1,808 added and 299 removed lines.

## Previous findings

- R01 — repaired: `Suggested.lean:178` "theorem orbit_locallyClosed {k : Type v} [Field k] (G X : Over (Spec (CommRingCat.of k))) [GrpObj G] [ModObj G X] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom] …"; named in the docstring (line 33) and in README §3A.2 (line 1742).
- R02 — repaired: `README.md:2030` "computation `H⁰(ℙⁿ_A, O(d)) = Sym^d(A^(n+1))` for `d ≥ 0` of §2.6"; gate `tex=0`.
- R03 — repaired: README:1063–1091 cite `TauCeti.SplitMaximalTorus`, `TauCeti.HopfIdeal.IsBorelOver`, `TauCeti.Pinning` and `comapOfIso`/`comapOfIso_rootVector` with what each omits. §8.1 (3695–3698) and §8.2 (3723–3736) consume them and keep the rest as targets. The new paraphrase has the defect raised as R01.

## Verified sound

### Gate, dependency check, build, signatures

- **Gate** (my rerun at `ff2a5ec`): `gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run, which includes the build, also shows `build=0 OK`.
- **Dependency check** (my run, with `--movable --pr 1332`): `depcheck: 227 roadmaps, 2061 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **Build:** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0. The only warnings are 11 `declaration uses 'sorry'`, at lines 152, 178, 198, 220, 241, 263, 284, 309, 332, 494 and 537 (10 at `f510911` plus the new line 178).
- **Signature of the new theorem** (`#check @…StructureAcceptance.orbit_locallyClosed` in a scratch copy): `{k} [Field k] (G X : Over (Spec ↧k)) [GrpObj G] [ModObj G X] [LocallyOfFiniteType G.hom] [QuasiCompact G.hom] [LocallyOfFiniteType X.hom] [QuasiCompact X.hom] (x : 𝟙_ _ ⟶ X) : IsLocallyClosed (TauCeti.SchemeAction.orbit G x)`. No binder is lost, and it matches README §3A.2 ("locally of finite type over `k` with quasi-compact underlying spaces", `x ∈ X(k)`). Over the affine `Spec k`, `QuasiCompact G.hom` is the pinned lemma's `[CompactSpace G.left]`. The `open` and the local `Over.cartesianMonoidalCategory` instance are confined to `section AlgebraicOrbits`, and the other ten statements elaborate as before.
- **Padding probe.** I replaced the new theorem's `sorry` with `first | rfl | trivial | infer_instance | decide | simp | aesop | exact TauCeti.SchemeAction.isLocallyClosed_orbit G x`. It fails with `failed to synthesize IsAlgClosed k`. The pinned lemma's section has `[IsAlgClosed k]` (`GroupAction/LocallyClosed.lean:69`, theorem at `:177`), so the theorem is not padding.

### Library declarations opened at the pin (Tau Ceti `2fd255d9`)

- `TauCeti.SplitMaximalTorus` (`Algebra/AlgebraicGroup/SplitTorus/Maximal.lean:54`) has fields `coordinateMap` onto the rank-`r` split-torus Hopf algebra, `surjective`, and `maximal` on every algebraically closed `k` over `R`. It has no root-space or coroot condition, as the README says. `comapOfIso` is at `:125` and `baseChange` at `:189`.
- `TauCeti.HopfIdeal.IsBorelOver` (`Borel/Over.lean:59`) means a smooth quotient whose geometric fibres are `IsBorelOverAlgClosed`, with no positive system. `comapOfIso` is at `:129` and `baseChange` at `:170`.
- `TauCeti.Pinning` (`Pinning/Basic.lean:88`) takes the binders `[Algebra.FiniteType R H] [Algebra.Smooth R H] [ConnectedSpace (PrimeSpectrum R)]` and has the fields `reductive`, `torus`, `borel`, `isBorel`, `borel_le_torus` and `rootSpaceEquiv` (indexed by `torus.IsSimpleRoot borel`). Mathlib's `ConnectedSpace` includes `Nonempty`, so "a disconnected or empty spectrum is excluded" is correct.
- `TauCeti.Pinning.comapOfIso` (`Pinning/Isomorphism.lean:102`) and `comapOfIso_rootVector` (`:154`, the root vector carried by `Derivation.dualCotangentMap e.hom.hom`). `TauCeti.Pinning.rootSpaceBaseChangeEquiv` (`Pinning/BaseChange.lean:48`) takes two independent pinnings `P`, `Q`. A grep for constructions with result type `Pinning` finds only `comapOfIso` and the standard pinnings of `SL`, `Sp` and short-root `G₂`, so "no base change of a pinning as a whole" is correct.
- `TauCeti.SchemeAction.orbit` (`AlgebraicGeometry/GroupAction/Orbit/Basic.lean:49`, the range of `(orbitMap G x).left`, defined over any base).

### Seeded sample and locators

- **8.1** (`conrad-rgs`): Definition 5.1.1, p. 136 (lines 5651–5659): over a nonempty base, a maximal torus `T ≃ D_S(M)`, nontrivial weights from `M`, root spaces free of rank one, coroots from `M∨`. Example 5.1.2 (line 5669) has (1) and (2) but fails (3). It admits a split maximal torus in the pinned sense, which confirms that the coroot condition is what §8.1 adds to `SplitMaximalTorus`.
- **8.2** (`conrad-rgs`): Definition 6.1.1, p. 186 (lines 7725–7730), and Remark 6.1.2, pp. 186–187 (lines 7738–7751). Over a connected base, Borel subgroups containing `T` and positive systems coincide; on a disconnected base some Borels arise from no positive system. This supports §8.2's split between the consumed connected case and the disconnected target.
- **1.1**: unchanged since `f510911`. The previous review's check of `jantzen-1985` §§2.8, 2.10, 3.3, 3.9, 4.2 and 4.14–4.16 stands.
- **Milne 2017** (`milne`, author-page copy): Proposition 1.65 starts on p. 26 (line 1461). Part (b) and its proof are on p. 27 (lines 1467, 1485–1493), and the proof reduces to `k̄` through the quotient map `|Y_k̄| → |Y|`. This matches the new docstring's "Proposition 1.65(b), pp. 26–27". Line 1503 applies (b) to orbits.

### Ownership and overlaps

- `roadmaps grep 'SchemeAction\.orbit|isLocallyClosed_orbit|orbit_locallyClosed'` over main and the open heads finds no other statement. The hits are this folder, its older copies in #1807, #1808 and #1854, and QuiverRepresentationsPartII line 15, which reuses a Tau Ceti topology lemma. This roadmap owns §3A.2.
- The overlap check: no dropped id and no id that only a revision defines. The conflicting heads #1807, #1808 and #1854 are ordered after this pull request in the description's merge-order block. The citation check: no cross-roadmap citation is found nowhere. Its 19 Lean names are this file's declarations, including the new `StructureAcceptance.orbit_locallyClosed`, and `VanishingCycles.lisseMonodromyEquiv` (EtaleCohomologyFoundations on main).

### Adversarial pass

New rows, for the statements this head adds or changes:

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `orbit_locallyClosed` | trivial group on `Spec k`; `μ₃` on `𝔸¹_ℝ` at 1; `𝔾_m` on `𝔸¹` at 1, 0; `μ_p` on `𝔸¹_(𝔽_p)` at 1; `μ_p` over `𝔽_p(a)` at `a`; `𝔾_m` on the doubled-origin line at 1; constant `ℤ` on `𝔸¹_ℚ` at 0 | one closed point; `t³−1=(t−1)(t²+t+1)`, two closed points; `D(t)` open, `{0}` closed; `s^p−1=(s−1)^p`, one point `(t−1)`; one point `(t−a)`; complement of both origins, open; `{t=n}` has closure `𝔸¹`, misses the generic point, not locally closed, excluded by `QuasiCompact G.hom` | holds | none |
| §3A.6 formula | `n=1,d=1`; `n=2,d=2`; `d=0`; `d=−1` | rank 2 = 2; `C(4,2)=6` = rank of `Sym²(A³)`; `A`; `H⁰=0`, outside `d ≥ 0` | holds | none |
| §8.1 against `SplitMaximalTorus` | `GL(R⊕L)`, `L` not free; Conrad Ex. 5.1.2; `SL₂/ℤ`, `r=1` | diagonal `𝔾_m²` is a pinned split maximal torus, but the root spaces `L`, `L∨` are not free; rank-2 torus present, coroot condition fails; `t ↦ diag(t,t⁻¹)` gives `ℤ[a,b,c,d]/(ad−bc−1) ↠ ℤ[t^±1]` | holds (the added conditions are needed) | none |
| §8.2 against `TauCeti.Pinning` | `SL₂/ℤ`, upper Borel; `SL₂/𝔽₂`; a torus; `Spec(k×k)` with `B⁺`, `B⁻` | pinned positive roots `{α}`, simple `{α}`, `ℤ ≃ ℤ·E₁₂`; README paraphrase: `{0, α}` positive, `α=α+0`, no simple root; over `𝔽₂`, `α(t)=t²` is still nontrivial, simple `{α}`; torus: no simple root, no equivalence; disconnected base: no `ConnectedSpace`, so `Pinning` does not apply and the constant system rejects `(+,−)` | citation holds; paraphrase fails | R01 |
| Description, `Suggested.lean` bullet | the head file | 22 declarations against 21; the folder's diff against main is 1808/299, not 1726/295 | stale | R02 |

Rows carried from the review of `f510911` (statements this head does not touch):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 invariants | weight-one line of `𝔾_m`; `μ_p` over `𝔽_p`; trivial group on `ℤ/2` | invariants 0; `t ≠ 1` in `𝔽_p[t]/(t^p−1)`; `ℤ/2` | holds |
| 1.1 Hochschild complex | `ℤ[t,t⁻¹]` weight one; trivial group | `d⁰(1)=1⊗(t−1)`, `d¹d⁰=0`; differentials `0, id, 0` | holds |
| 1.1 induction | `1⊂C₂` over `ℤ`; `C₂⊂S₃`; weight-one line | rank 2; rank 3; 0 against trivial `ℤ` | holds |
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p⊂μ_(p²)`; `N=1`; `N=G`; `αₚ×αₚ` | `k[t^p]`; `O(G)`; `k`; `k[y]/(y^p)` | holds |
| `linearlyReductive_iff_reductive_identityComponent` | `ℤ/2`; `𝔾_a`; `O₂` | T↔T; F↔F; T↔T | holds |
| `linearlyReductive_iff_torus` | `𝔾_m`; `SL₂` in char 2; norm-one torus of `𝔽_(p²)/𝔽_p` | T↔T; F↔F; T↔T, nonsplit | holds |
| `exists_levi_complement` | `𝔾_a⋊𝔾_m`; `𝔾_a` | complements `{(a(1−t),t)}`; `J=0` fails | holds |
| `exists_conjugate_eq_of_isMaximalTorus` | diagonal torus of `SL₂` and a conjugate | `g=I+E₁₂` | holds |
| `exists_titsSystem_of_isBorel` | `GL₂(𝔽₂)`; `𝔾_m` | `\|B\|=2`, `2+4=6`; `W=1` | holds |
| `exists_levi_complement_of_isParabolic` | upper Borel of `GL₂`; `P=G` | upper entry `a(t−s)`; `J=0` | holds |
| `lang_surjective` | `𝔾_m/𝔽₃`; `𝔾_a/𝔽₂` | `g⁻¹g³=g²`; `a²−a=c` solvable | holds |
| `plane_braid` | `n=0,1,2` | trivial; trivial; generator of `ℤ` | holds |
| `nonempty_mulEquiv_artinGroup` | `A₁` on `ℂ`; `A₁×A₁`; `A₁` with a central `ℂ` | `ℤ`; `ℤ²`; `ℤ` | holds |

### Remarks on untouched text (no change requested)

- The generated merge-order block still lists "#1676 (ReductiveGroups) → this pull request", although #1676 is on main.

## Not verifiable

- **Uncertified texts.** `waterhouse`, `borel`, `springer`, `kohls`, `humphreys`, `howlett-lehrer` and `serre-linear-reps` are settled as uncertified. None is cited in the changed passages.
- **Milne edition.** The manifest key `milne-iag` records the 2015 notes. The new docstring cites the 2017 numbering, which I checked against the 2017 author-page copy (`milne`). The manifest is outside this folder.

## Source issues

- none

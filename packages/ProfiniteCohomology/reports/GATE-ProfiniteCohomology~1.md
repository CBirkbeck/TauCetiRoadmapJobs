# GATE-ProfiniteCohomology~1: answers to human review

Reviewed head `607b419`. Repairs were committed in two commits, neither pushed: `5defcb1` (the review points) and `98bf9c1` (the gate repair, see "Gate repair" below). Edited files: `TauCetiRoadmap/ProfiniteCohomology/README.md` and `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`. Line numbers in H01–H11 are at `5defcb1` unless marked "old". Where `98bf9c1` later removed a declaration named in a section, that section says so.

## H01 (CBirkbeck) — answered

This approval covers the carrier and coefficient correction at `36beeff` (the nonempty-target qualification, the Layer 1 dictionary references, `TopRep` versus `Action`, the variance of restriction and inflation). This round leaves all of those passages as they were. The later review of `607b419` (H04–H11) is the one that asks for changes.

## H02 (kim-em) — answered

Status note on `e19bd58` (the `.Basic` import and citation paths). Those paths are unchanged. The two imports added this round, `TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.AllDegreeColimit` and `TauCeti.Topology.Algebra.Group.WreathProduct.Monomial`, both exist at the pinned Tau Ceti `a91d3aa` and elaborate (build below).

## H03 (kim-em) — answered

Status note on the merge `af812e2`. The pull request's diff against `origin/main` is still confined to `TauCetiRoadmap/ProfiniteCohomology/` (gate: `outside-folder=0`).

## H04 (CBirkbeck) — applied

The finding is correct. `γ ↦ (x ↦ γ⁻¹x)` is an anti-homomorphism into `Equiv.Perm (G ⧸ U)`: on `S₃` with `U = 1`, `a = (12)`, `b = (23)`, it sends `ab` to translation by `ba`, while the composite of the two components is translation by `ab`.

What changed in `Suggested.lean`:
- `monomialHom` (old 5195–5203, sorry'd data) became an `abbrev` of Tau Ceti's `Subgroup.monomialHom`, applied to the bundled transversal `⟨Set.range t.rep, Subgroup.isComplement_range_left t.mk_rep⟩`, with target `TauCeti.WreathProduct U (G ⧸ U)`.
  - Its permutation component is `x ↦ γx` (`Subgroup.monomialHom_right`).
  - Its coordinate is `t(x)⁻¹ γ t(γ⁻¹x)` (`Subgroup.monomialHom_left`). This satisfies `a(γδ,x) = a(γ,x)a(δ,γ⁻¹x)`, which matches `TauCeti.PermutationWreathProduct.mul_left`.
- `monomialHom_continuous` is now proved by `Subgroup.continuous_monomialHom`.
- The same defect pattern was also in the duplicated wreath block: the sorry'd `wreathAut`, the `PermutationWreathProduct` built on it, and `wreathTopology`. All three are deleted. Tau Ceti's `TauCeti.PermutationWreathProduct` / `TauCeti.WreathProduct` and its topology instance are used instead.
- The continuity docstring now says the Schreier factor is continuous, not locally constant. For `U = G = ℤ_p` it is `γ`.

What changed in the README:
- Layer 13 milestones 1–2 now state Tau Ceti as the supplier and give both conventions explicitly.
- Milestone 2 has three Checks: the `S₃` non-example, the `ℤ_p` factor, and the `C₄ ⊇ C₂` values `a(s,U) = s²`, `a(s,sU) = 1`.
- §1 Consumed now lists the wreath and monomial declarations.

## H05 (CBirkbeck) — applied

The finding is correct. For `G = C₂` and `M = ℤ_sign`, the quotient `Coind₁M/M` is the trivial module `ℤ`, so `H⁰` of it is `ℤ`, while `H¹(C₂, ℤ_sign) = ℤ/2`.

README Layer 7, "Acyclicity and dimension shifting" (lines 1300–1316):
- Old: "in the range where both sides are defined".
- New: the isomorphism is claimed for `i ≥ 1`. The `i = 0` endpoint is stated separately as `coker(H⁰(G,Coind₁ᴳM) → H⁰(G,Coind₁ᴳM/M)) ≅ H¹(G,M)`, which is Tau Ceti's `explicitDimensionShift0`.
- The `C₂`/`ℤ_sign` computation is added as a Check.

`dimensionShiftIso` in `Suggested.lean` already carried `0 < n` and was left unchanged in `5defcb1`. `98bf9c1` removed it, because it was sorry'd data (it is built on the sorry'd `coindEmbedding` and `dimensionShiftQuotient`). The `i ≥ 1` statement and its endpoint remain targets in README Layer 7.

## H06 (CBirkbeck) — applied

The finding is correct for both counterexamples:
- `H²(C_p, 𝔽_p) = 𝔽_p`.
- For `p ≠ q`, `H¹(ℤ_q, ℤ/p) = 0`: a continuous map kills an open `q^kℤ_q`, so its image has order dividing both `q^k` and `p`.

README §6, the `Hⁱ(Ẑ,-)` bullet (lines 2599–2614):
- Removed: the clause allowing "an arbitrary procyclic group with a topological generator".
- New carrier: Tau Ceti's `TauCeti.zHat`, or a group given with an isomorphism of topological groups to it.
- Cited as already proved at the pin: `TauCeti.zHat.h1EquivZMod`, `TauCeti.zHat.subsingleton_continuousCohomology_two_of_isAddTorsion` and `TauCeti.zHat.cohomologicalDimensionAt_eq_one`.
- Only `H²(Ẑ,ℤ) ≅ ℚ/ℤ` is left as this roadmap's work.
- Both counterexamples are added as negative controls. The Consumed list now names the module.

## H07 (CBirkbeck) — applied

**Colimit half.** The pinned Tau Ceti already has the all-degree system, cocone and colimit, with the transition, point and leg equations (`FiniteQuotient/Canonical.lean`, `FiniteQuotient/AllDegreeColimit.lean`).
- The three sorry'd definitions (old 1377–1399, with `map := sorry`) are now `abbrev`s of `TauCeti.ContCohomology.continuousFiniteQuotientSystem`, `…Cocone` and `…Colimit`.
- The point is `Hⁿ(G,M)` and each leg is coefficient inclusion followed by inflation. Both are fixed by `continuousFiniteQuotientCocone_pt` and `continuousFiniteQuotientComparisonApp_eq_map`.
- The colimit carries `[CompactSpace G] [ContinuousSMul G M]` in its own signature. The section no longer supplies them, so they cannot drop out silently. `continuousCohomology_preservesFilteredColimits` now carries `[CompactSpace G] [TotallyDisconnectedSpace G]` explicitly.
- README Layer 10 (lines 1639–1650) now states the object, arrow, point and leg formulas and names Tau Ceti as the supplier. Naturality in coefficients and agreement with Layer 4 remain targets.

**Homotopy half (repaired differently from the suggestion).**
- The Alexander–Whitney cup is strictly associative on cochains: both bracketings evaluate to `μ₂(μ₁(a(g₀…g_p), b(g_p…g_{p+q})), c(g_{p+q}…))`. Tau Ceti proves this as `TauCeti.TopPairing.cupCochain_assoc`. So the sorry'd `cupAssocHomotopy` is deleted, and `cupAssocHomotopy_spec` (a class-level statement) is replaced by the strict cochain identity `cupCochain_assoc`.
- `cupCommHomotopy_spec` now names the operator. For cocycles `a, b` of degrees `m, n` with `m+n = k+1`, `a⌣b − (−1)^{mn}·cast(b⌣ᵒᵖa) = cast(d_k(cast(cupCommHomotopy … a b)))`. In total degree 0 the two cups agree on cochains (from `hop`), and the docstring says so.
- `cup_assoc` and `cup_gradedComm` are now left as `sorry` with "derived from" docstrings. They are no longer proved by the class-level spec.
- README Layer 12 items 7–8 and the export table row (line 249) were updated to match.
- In `98bf9c1`, `cupCochain_assoc`, `cupCommHomotopy_spec`, `cup_assoc` and `cup_gradedComm` were removed from `Suggested.lean`. They are stated on the sorry'd `resolutionCupPairing`, `cupCommHomotopy` and `cup`. The corrected statements are kept as targets in README Layer 12 items 7–8, without Lean names in backticks. The strict associativity is at the pin as `TauCeti.TopPairing.cupCochain_assoc`, on Tau Ceti's own `TauCeti.TopPairing`.

## H08 (CBirkbeck) — applied

README Layer 10, source for the all-degree corestriction (lines 1796–1799):
- Old: "open, equivalently of finite index in the compact case".
- New: an open subgroup of a compact group has finite index, and a closed subgroup is open exactly when it has finite index. A finite-index subgroup need not be open; the index-two dense subgroup of `∏ₙ𝔽₂` is given as the example.

The other finite-index passages (lines 400, 451, 1219) already state only the open ⇒ finite-index direction.

## H09 (CBirkbeck) — applied

The finding is correct. Every additive map `ℤ_p → ℤ/pᵏ` kills `pᵏℤ_p`. Every additive map `ℤ_p → ℤ` is zero, because elements of `ℤ_p` are divisible by every power of a prime `q ≠ p`.

What changed:
- README §6 (lines 2590–2598): "Continuity is what makes both statements true" was replaced by these two arguments.
- It also gives an example where continuity does matter: discrete `ℚ`. There `H¹(ℤ_p,ℚ) = 0`, while the abstract homomorphisms form the nonzero `ℚ`-dual of `ℚ_p`.
- The two example docstrings in `Suggested.lean` (lines 683–699) were corrected to match.

## H10 (CBirkbeck) — applied

**Evens locator.** Checked in the AMS open-archive text of Evens, Trans. AMS 108 (1963), fetched through the sources service from the publisher's PDF: §6.2 "Double coset rule" with Proposition 2 is at Evens1963 lines 263–276 (pp. 61–62), and Proposition 3, the automorphism property, is at lines 295–303.
- `evensNorm_res_doubleCoset` docstring: "Evens §6 Prop. 3" → "Evens 1963, §6 Prop. 2, pp. 61-62".
- The README References entry now lists Props. 1–4 individually: transitivity, double cosets, naturality, multiplicativity.
- `98bf9c1` removed `evensNorm_res_doubleCoset`, which is stated on the sorry'd `evensNorm`. The corrected locator stays in the README References entry for Evens 1963 (§6 Prop. 2).

**Helper headers.** The "have not been compiled" / "uncompiled" comments are in `CohomologyUniverseComparison.lean` and `DimensionNormalization.lean`. This round's edits were limited to `README.md` and `Suggested.lean`, so those comments are unchanged; that part goes back to the author. The local build in this round compiled only `Suggested.lean`, not the helpers.

## H11 (CBirkbeck) — applied

`continuousCochainsShortExact_shortExact` (lines 1486–1497):
- Old: a sorry'd claim of short exactness in `CochainComplex (TopModuleCat ℤ) ℕ` for an arbitrary topological group.
- New: short exactness of the image under `(forget₂ (TopModuleCat ℤ) (ModuleCat ℤ)).mapHomologicalComplex _`, with `[LocallyCompactSpace G]` in the signature. It is proved by `TauCeti.ContCohomology.DiscreteShortExact.continuousCochainsShortExact_shortExact`.
- The docstring says the topological-category form is not asserted.

The README Layer 10 long-exact-sequence bullet (lines 1664–1673) now attributes the forgotten form to Tau Ceti and calls the `TopModuleCat` form a stronger statement that is not asserted. `delta_naturality` and `delta_corestriction` remain targets.

## Signature check

**`5defcb1`.** All twelve changed or affected declarations were printed with `#check @…`. The lines were appended temporarily to `Suggested.lean`, the file was built once, and then it was restored byte-for-byte (verified with `cmp`). Every elaborated type matches its README statement.
- `continuousFiniteQuotientColimit` shows `[CompactSpace G] [ContinuousSMul G M]`.
- `continuousCochainsShortExact_shortExact` shows `[LocallyCompactSpace G]` and the forgotten complex.

**`98bf9c1`.** The same procedure was run for the 53 theorems that gained an `omit … in` line and for `cohomologicalDimensionLE_iff_torsion`. The `#check` lines were appended, the file was built once, and it was restored byte-for-byte (verified with `cmp`).
- Each elaborated type lacks exactly the omitted instance binders, and nothing else changed. For example, `B1_le_Z1` no longer has `[IsTopologicalGroup G]`, and `monomialHom_continuous` no longer has `[CompactSpace G] [TotallyDisconnectedSpace G]`.
- All 53 are proved theorems, not sorry'd ones. Each omission therefore makes a still-proved statement more general, and none drops a hypothesis that a `sorry` was hiding.
- `cohomologicalDimensionLE_iff_torsion` shows `IsAddTorsion M →` in place of the deprecated alias `AddMonoid.IsTorsion M →`. These are the same predicate (Mathlib `GroupTheory/Torsion.lean:60`: `alias AddMonoid.IsTorsion := IsAddTorsion`).

## Adversarial pass on changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `monomialHom` permutation part | `S₃`, `U=1`, `a=(12)`, `b=(23)` | `x↦γ⁻¹x`: `ab ↦` translation by `ba`, composite = translation by `ab`; `x↦γx`: both `ab` | old convention false | Tau Ceti map, Check added |
| Schreier factor | `C₄ ⊇ ⟨s²⟩`, `t={1,s}` | `a(s,U)=s²∈U`, `a(s,sU)=1` | in `U`; cocycle law holds | Check added |
| monomial continuity | `U=G=ℤ_p`, `t=1` | factor of `γ` is `γ` | continuous, not locally constant | docstring fixed |
| dimension shift | `C₂`, `ℤ_sign`; `i=0` vs `i=1` | `H¹=ℤ/2`, `H⁰(Q)=ℤ`, coker `ℤ/2ℤ` | iso false at `i=0`, coker form true | `i≥1` + endpoint |
| `Ẑ` examples | `C_p`, `𝔽_p`; `ℤ_q`, `ℤ/p` (`p≠q`); `Ẑ`, `ℤ/n` | `H²(C_p,𝔽_p)=𝔽_p`; `H¹(ℤ_q,ℤ/p)=0`; `H¹(Ẑ,ℤ/n)=ℤ/n` | holds only on `Ẑ` | carrier fixed, negative controls |
| `ℤ_p` Hom examples | abstract `ℤ_p→ℤ/pᵏ`, `ℤ_p→ℤ`, `ℤ_p→ℚ` | `ℤ/pᵏ`; `0`; nonzero `ℚ`-dual of `ℚ_p` | first two need no continuity | prose fixed |
| open vs finite index | `∏ₙ𝔽₂`, kernel of a form vanishing on `⊕𝔽₂` | index 2, dense, not open | "equivalently" false | qualified |
| `cupCochain_assoc` | degrees `(0,0,0)`, `(1,1,1)` | both sides `μ₂(μ₁(a(g₀),b(g₀)),c(g₀))`; at `(1,1,1)` both `μ₂(μ₁(a(g₀,g₁),b(g₁,g₂)),c(g₂,g₃))` | strict | homotopy removed |
| `cupCommHomotopy_spec` | `m=n=0`; `m=1,n=0` (`k=0`) | `m=n=0`: `P(a g₀,b g₀)=Pop(b g₀,a g₀)` by `hop`, excluded by `hk`; `m=1,n=0`: sign `+1`, `a⌣b − b⌣a` on cocycles is a coboundary of a degree-0 cochain | consistent with `cup_gradedComm` sign `(−1)^{mn}` | restated |
| cochain short exactness | `G` locally compact (profinite) vs arbitrary | Tau Ceti theorem needs `LocallyCompactSpace`, forgotten complex | stronger form unproved | weakened to supplier form |
| finite-quotient colimit | `G` not compact (`ℤ` discrete), `M=ℤ/2` trivial | system defined; colimit theorem needs compactness, now in signature | hypotheses explicit | Tau Ceti abbrevs |

## Ownership and citations

- **Owners for everything that changed.** Every declaration that changed is now an `abbrev` of, or a proof by, a Tau Ceti declaration at the pin, except `cupCochain_assoc` and `cupCommHomotopy_spec`. Those two stay here because Layer 12 here is stated on this roadmap's own `TopPairing`. No new cross-roadmap citation was added.
- **Open roadmap pull requests.** Ownership against them was not searched this round; the changes only consume Tau Ceti.
- **New source.** `Evens1963` was fetched from the AMS open archive. The roadmap folder has no `sources.toml` on this branch, so the entry was not recorded there; nothing was added to `needs-references.toml`.

## Gate repair (`98bf9c1`)

The worker's checks on `5defcb1` listed `set_option`, TeX, PR-number, sorry'd-data, admitted-example, residue, line-count, missing-README-id and build-lint failures. All of them are repaired in `98bf9c1`.

**Sorry'd data.** The 37 `def`/`instance` declarations with a `sorry` body were deleted, together with every declaration that mentions one, found by a transitive closure over identifiers in the code (docstrings excluded). That is 148 blocks.
- The build then showed that removing the sorry'd instance `abelianizationProP_continuousSMul` also broke 11 Layer 11 declarations that used it implicitly: `abelianizationProPClass`, `abelianizationProPRes1/2`, their injectivity, and the `subsingleton_h1_…`/`…Class_generates` theorems. They were deleted as well.
- Layers affected:
  - Layers 6/10: `resLe`, `corestrictionLe`, `conjOpenSubgroup`, `conjMapOf`, transitivity, Mackey, `delta_conjMapOf`.
  - Layer 7: `coindEmbedding`, `dimensionShiftIso`, `algebraicShapiroIso`.
  - Layer 9: `powerClassNorm`, `kummerCor`, `kummerIso_norm`.
  - Layer 11: the class module.
  - Layer 12: the whole graded cup on this roadmap's `TopPairing`, and `explicitIso_cup`.
  - Layer 13: `evensNorm` and tensor induction with all their laws, `homClass`, `evensNormIndexTwo`, the cup-involving index-two sequences, and the `galois*` field-extension forms.
- The module docstring now says that no map has a `sorry` body, and lists which headline theorems are therefore not stated in the file and what each one lacks.

**Residual defect, reported rather than hidden.** Two of these headlines are statable at the pin against Tau Ceti carriers, and they are not restated in the file:
- Layer 12's cup laws, against `TauCeti.TopPairing.cup` in `Cup/Cohomology.lean`, on Tau Ceti's own `TauCeti.TopPairing`.
- Layer 11's class module, against `TauCeti.abelianizationProPClass` with the instance `TauCeti.abelianizationProP_continuousSMul` in `CohomologicalDimension/ClassModule/Basic.lean`.

The docstring names both. Restating them means replacing this file's own `TopPairing` and `abelianizationProPAction` by Tau Ceti's. That is a redesign, beyond "change nothing else". It is the obvious next repair.

**Admitted examples.** All 10 were deleted:
- the two `H¹(ℤ_p, -)` examples;
- discrete cochain lifting;
- two Layer 8 cocycle examples;
- the `C₂` cup example;
- two Kummer cocycle examples;
- the `C₈` anchor;
- the mod-2 Kummer class.

They remain README Checks and worked examples. Eight README sentences claimed these were "in `Suggested.lean`"; those sentences were reworded (README lines 263, 1417, 2038, 2447, 2557, 2591, 2625, 2648 at `5defcb1`).

**`set_option`.** All 15 lines were removed.
- Five were attached to declarations that had already been deleted.
- `smul_mem_muN` does not elaborate without the override, even with the result type ascribed. It was deleted. It only restated Tau Ceti's `TauCeti.smul_mem_rootsOfUnity`, and nothing referenced it.
- The other Kummer declarations elaborate under the defaults.

**README ids.** In README prose, 119 backticked names of this roadmap that are no longer declared lost their backticks. That is the 113 removed names plus the six previously missing ones (`cohomologicalDimensionLE_native_sameUniverse_iff`, `continuousCohomologyFunctor_additive/linear`, `explicitCor0/1/2_trans`). In the export table their cells were dropped, and the row "agreement of the two cups" was removed, since its only declaration was `explicitIso_cup`.

**TeX, PR number, residue.**
- The flagged display formulas were rewritten in Unicode:
  - `∑ (u : G ⧸ U), …`;
  - `Γ = G⧸N` in the five-term sequence;
  - `res(G → V) ∘ cor(U → G) = ∑ (VgU ∈ V \ G / U), cor(V ∩ gUg⁻¹ → V) ∘ conj g ∘ res(U → U ∩ g⁻¹Vg)` with the notation defined;
  - `⌣[μ₁]`;
  - `Hⁿ(G, C')` with `n = p + q + 1`;
  - `c_D₁₆ + δ 1[u, uv, s, vs]`;
  - `H^(l * q)`.
- The same `_{…}`/`^{…}` pattern was cleared from the Lean docstrings, and `c_D₁₆`, `1[u, uv, s, vs]` and `N_Ev` are now used consistently in the README.
- "Mathlib #33608" was removed (README 346, 1507; Lean module docstring). Both "TODO" phrasings now say what the pin does not provide.

**Lints.**
- 53 `omit … in` lines were added, all on proved theorems (see Signature check).
- Six unreferenced `hμ` binders and one unreferenced `hU` binder became `_hμ`/`_hU`.
- `AddMonoid.IsTorsion` became `IsAddTorsion`.
- The build now prints no warning other than `declaration uses 'sorry'`.

**Length.** 6086 → 4447 lines.

**Adversarial pass on the statements this repair changed:**

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| `B1_le_Z1` without `[IsTopologicalGroup G]` | `G = ℚ` with the discrete topology; `G = C₂` with the indiscrete topology (a topological group); `M = ℤ` | the coboundary `d⁰m (g) = g•m − m` is a homomorphism, by the computation `d⁰m(gh) = gh•m − m = g•(h•m − m) + (g•m − m)`, which needs no continuity of multiplication | true without the hypothesis; the proof compiles without it | `omit` |
| `explicitFiniteQuotientSystem0_obj` without compactness | `G = ℤ` discrete, `U = 2ℤ`, `M = ℤ/2` trivial | `M^U = ℤ/2`, and the level-`U` `H⁰` is `(ℤ/2)^(ℤ/2ℤ) = ℤ/2`; the statement is `obj U = M^U`, definitional | holds for non-compact `G` | `omit` |
| `kummerShortExact_incl/proj` without `[NeZero n]` | `n = 0` | `hn : IsUnit (0 : K)` is false in a field, so the statement is vacuous at `n = 0` | binder redundant given `hn` | `omit` |
| `hilbert90` without explicit compactness | `K = ℝ`, `G = C₂`, `M = ℂˣ` | `H¹ = ker N / im(z ↦ z̄/z) = S¹/S¹ = 0`; compactness of `Gal` is an instance at the pin | unchanged in content | `omit` |
| `cohomologicalDimensionLE_iff_torsion` | `M = ℚ/ℤ` (torsion); `M = ℚ` (not torsion) | `IsAddTorsion (ℚ/ℤ)` holds (every element has finite order); `IsAddTorsion ℚ` fails (`1` has infinite order); same truth values as the deprecated alias, which is definitionally it | same statement | alias replaced |
| `smul_mem_muN` | — | deleted; it restated `TauCeti.smul_mem_rootsOfUnity` (`ζⁿ = 1 ⇒ (gζ)ⁿ = g(ζⁿ) = 1`) | padding | removed |
| explicit-cup `δ` identities with `_hμ` | — | binder name only; the elaborated types are unchanged | — | rename |

**Ownership and citations.**
- No new cross-roadmap citation was added.
- The new Tau Ceti names in the docstring and report were checked at the pin: `TauCeti.TopPairing.cup` (`Cup/Cohomology.lean:167`), `TauCeti.abelianizationProPClass` (`ClassModule/Basic.lean:166`) and the instance `TauCeti.abelianizationProP_continuousSMul` (`ClassModule/Basic.lean:116`).
- Ownership against the open roadmap pull requests was not re-searched. The repair only deletes content and adds nothing a sibling could own.

## Build and gate

At `98bf9c1`:

- **Build:** `lake build TauCetiRoadmap.ProfiniteCohomology.Suggested` printed `Build completed successfully (9148 jobs).` It printed 42 `declaration uses 'sorry'` warnings, no other warning and no error.
- **Depcheck:** `depcheck: 148 roadmaps, 999 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- **Gate:**

      gate ProfiniteCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK

- **Unchanged since `5defcb1`:** the helper files `CohomologyUniverseComparison.lean` and `DimensionNormalization.lean` (see H10), which are outside this job's edit scope.

# GATE-ReductiveGroups~2: answers to the human review of the ReductiveGroups pull request

Review answered: CBirkbeck, 2026-11-09T09:56:56Z, an AI review of head `1b262ae` with findings
F01–F06. The quoted review text stops inside F06's repair ("Close or retarget #1332 if this
pull request supers…"), so nothing after that point is answered. F06 makes three distinct
points, so the review gives eight findings, H01–H08. The repairs are commit `4f4198cb` on top of
`8bad12e`, and touch only `TauCetiRoadmap/ReductiveGroups/README.md` and
`TauCetiRoadmap/ReductiveGroups/Suggested.lean`. Line numbers below are at `4f4198cb`.

## H01 (CBirkbeck) — applied

The merge of `origin/main` in `8bad12e` already moved the pins to Tau Ceti `2fd255d` and Mathlib
`1b1ccf4b`, and it deleted the Suggested.lean paragraph claiming that the pinned Tau Ceti lacks
`TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`. Every name F01 lists (for example
`TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints`, `IsNilpotent.log`,
`BialgHom.parabolicCoordinateAlgEquiv`, `TauCeti.FiniteField.frobeniusPoints`, the five
`TauCeti.SchemeAction` names and `…isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive`)
resolves at `2fd255d`, and so does each of the 94 pinned names this round adds or touches.

## H02 (CBirkbeck) — applied

`8bad12e` states the headline as `StructureAcceptance.exists_levi_complement_of_isParabolic`
(Suggested.lean L253; README Layer 7, *Parabolic subgroup schemes and Levi decompositions*), with
the reviewer's signature. The name differs from #1797's `IsParabolic.exists_levi_complement`
because no declaration here may reuse the fully qualified name of a declaration at an open head.
The diagonalizable-group and `k`-radical sentences remain a separate paragraph (L76–83).

## H03 (CBirkbeck) — applied differently

Added `StructureAcceptance.exists_titsSystem_of_isBorel` (Suggested.lean L230). It is stated at the
generality of the source (Milne 2017, Example 21.47, p. 439, and Proposition 21.75, p. 448: a split
reductive group over any field), with `subgroupN` the rational points of the scheme normalizer
`BialgHom.normalizerPoints π hπ`, not over `k̄` with the normalizer of `T(k)`. The proposed form
is a special case of this one, and the abstract normalizer fails over small fields: over `𝔽₂`,
`T(𝔽₂) = 1`, so its normalizer is all of `GL₂(𝔽₂) ≅ S₃`, in which `B(𝔽₂)` (order 2) is not
normal. For the same reason the pinned `TauCeti.glTitsSystem` assumes `[Nontrivial kˣ]`.
README L2134 rewrites the *Bruhat decomposition* bullet. It now:
- cites "Milne, §21.h, p. 446; Theorem 21.45, p. 438" only for the scheme-level cells and the
  abstract decomposition, and Example 21.47 and Proposition 21.75 for the Tits system;
- consumes `TauCeti.TitsSystem.existsUnique_mem_bruhatCell` instead of restating the
  decomposition;
- adds five Checks (`GL₂/𝔽₂`, `𝔾_m`, `SL₂/𝔽₃`, `T ⊄ B`, constant `ℤ/3`).

## H04 (CBirkbeck) — applied

Three new supplier subsections (README L545, L617, L644) list each declaration F04 names, with its
file and hypotheses. Each restated target is now consumed, and the layers keep only what the
library leaves open:
- Layer 0 (L858) states no target. Its scheme-point adapter is also pinned at `2fd255d`, as
  `TauCeti.AffineGroupSchemeCat.algebraPointsFunctorIsoCoordinatePointsFunctor`, so only the
  descent adapters remain, in its base-change bullet.
- §1.1 (L963) keeps the invariants comparison; the ownership clause at L17–20 is rewritten.
- Layer 3 keeps Milne 5.34 and the kernel/Lie transport; the kernel itself is pinned as
  `TauCeti.CommHopfAlgCat.isPullback_kernelSpec`.
- Layer 4 (L1530, L1562) keeps Milne 9.17, "split iff trivial Galois action" and the
  multiplicative-type extension.
- Layer 6 (L1752) keeps the structure theorems; the "provide both definitions" sentence is
  deleted.
- Layer 7 (L2102) keeps transitivity and the comparison with `IsParabolic`.
- Layer 7a (L2339) keeps the coset bijection, with the convention change written out.
- §9A.1a–1b (L2852, L2913, L2969) keep the field-presentation injectivity, the integral and
  full-Y comparisons, the full lift group and the fixed-algebra weight/generation/type
  dictionary. These sections also consume two pinned items beyond F04's list:
  `TauCeti.DynkinType.norm_rootLattice_eq_two_iff` and `Matrix.SignCover.map`.
- 9B (L3375, L3427, L3459) keeps the kernel of `τ`, the identification of the carriers with the
  pinned simply connected groups, and `E_G(A)`/`GE_G(A)`.

## H05 (CBirkbeck) — applied differently

Layers 7 (L2208) and 7C (L2272) now depend on "§§3A.1–3A.5 (the pinned orbit theorems and the
complex charts)", as proposed. Instead of adding CompactGroups and LieGroups Layer 7 to 3A's
dependencies, the `U(n)` composite is removed from §3A.6 (L1473), so Layer 3A no longer consumes
LieGroups Layer 7 at all. No roadmap on main or at an open head cites §3A.6
(`roadmaps grep 'ReductiveGroups…3A\.6'`: no match), and the conversion of compact-group
representations belongs to LieGroups Layer 7.

## H06 (CBirkbeck) — answered

The pull-request description is outside this job, so the worker supplies the order. The facts for
it:
- The overlap index (2026-11-09T10:35:51Z) lists conflicts with #1332, #1797, #1807, #1808 and
  #1854 in `ReductiveGroups/README.md` or `Suggested.lean`.
- #1797's head states, among its ReductiveGroups headlines, `exists_titsSystem` (over `k̄` with the
  abstract normalizer), `IsMaximalTorus.exists_conjugate_eq`, `IsParabolic.exists_levi_complement`,
  `isIso_quotient_of_isNormal` and `nonempty_weylQuotient_artin`. This head now states the same
  mathematics, Bruhat at Milne's generality, under different names.
- So #1797's ReductiveGroups part would be rebased on this pull request, not the reverse.
- What the truncated text asks about #1332 cannot be answered from the quoted data.

## H07 (CBirkbeck) — answered

Both validation sentences are false at this head as well, and the worker should replace them:
- Against `origin/main`, the folder diff is 9 files, +3759/−2757, with seven `*Targets.lean`
  files deleted.
- Suggested.lean admits twelve theorems with `sorry`.

## H08 (CBirkbeck) — answered

There are two statements of Lang's theorem, and the fix belongs in Part II:
- ReductiveGroupsPartII consumes this roadmap (its README cites ReductiveGroups layers 0, 2, 4,
  6 and 7, e.g. L174, L477). So main's citation of Part II RG2.3.7 from ReductiveGroups was an
  upward edge, and Lang's theorem moved down into Layer 7a, as README L15 and L49 record.
- Part II's "single owner" sentence (README L61–62) and its `lang_surjective` (Suggested.lean
  L212) are on main, outside this folder. The worker raises the Part II revision.

## Repairs outside the review: two statable headlines that were missing

Searching for other instances of F02's pattern (a statable headline that is absent or called
unstatable) found two more:
- **Layer 3:** `StructureAcceptance.isIso_coinvariantsQuotient_of_isNormal` (Suggested.lean L137;
  README L1163). For a normal Hopf ideal of a finite-type Hopf algebra over a field, nonreduced
  groups included, the map from the fppf quotient to `Spec O(G)^N` is an isomorphism and `O(G)` is
  faithfully flat over `O(G)^N` (Milne 2017, Theorem 5.14, p. 102; Proposition 5.18, p. 103;
  Propositions 5.21 and 5.25, pp. 104–105).
- **Layer 11B:** `ReflectionArrangementAcceptance.nonempty_mulEquiv_artinGroup` (Suggested.lean
  L505; README L4180), with the definitions it needs: `corootReflectionGroup`, `RegularCoroots`
  and `RegularOrbits`. The docstring had named it unstatable ("missing carrier is the `W`-action
  on the complexified root-hyperplane complement"), but those carriers are three short
  definitions on native objects. The gate's statement-hygiene rule asks a `Nonempty (… ≃* …)`
  conclusion to be named `nonempty_*`. The generator-characterized form needs wall-crossing loops
  whose regularity proof cannot be left as `sorry` inside a definition, so it stays a README
  target (L4180).

The module docstring was also corrected:
- The Layer 4 torus/Galois-lattice equivalence is pinned
  (`TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor_isEquivalence`).
- The signed ADE shell algebras, folding and the `G₂`/`F₄` isogenies are pinned. They had been
  listed as lacking carriers and now sit in the "Proved in the pinned Tau Ceti" paragraph.
- The Layer 11 entry now names its missing carrier, the adjoint quotient `𝔤 → 𝔤//G`.

None of the new names occurs on main or at any open head (`roadmaps grep`).

## Build, gate and direction check

- `lake build TauCetiRoadmap.ReductiveGroups.Suggested`: `Build completed successfully (19972
  jobs)`, with 12 `declaration uses 'sorry'` warnings and the `module` advisory warning.
- Gate: `gate ReductiveGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0
  dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 237 roadmaps, 2308 edges, 0 problem(s)`, with no UPWARD,
  CYCLE or moved line.
- Signatures: one scratch file importing the built module, with `#check @name` for all 25
  declarations, elaborated once after the last change. Every hypothesis of the four new
  theorems is in its elaborated type (for example `TauCeti.reductiveCommHopfAlgProperty k H →`,
  `I ≤ TauCeti.HopfIdeal.kerOfSurjective π hπ →`, `[P.IsCrystallographic] [P.IsReduced]`).
  Nothing was dropped and nothing changed as a result.
- `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found
  nowhere. It does not check Tau Ceti or Mathlib names on this host, so all 400 backticked dotted
  README names were checked textually against both pinned trees. Every miss is either a module
  path, a declaration of this roadmap's Suggested.lean, or a pre-existing prose token (`W.op`).

## Adversarial pass on new and changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| Layer 3 quotient | `N = G` (`I = 0`); `N = 1` (augmentation); `μ_p ⊂ μ_{p²}`; nonnormal `B ⊂ GL₂` | `O(G)^G = k` (Δh = h⊗1 ⇒ h = ε(h)); `O(G)^1 = O(G)`; coinvariants `k[t^p]`, quotient `μ_p`, free of rank `p`; `O(GL₂)^B = k`, but `GL₂/B = ℙ¹` | holds; normality needed | hypothesis kept; μ_p and edge cases are README Check text |
| Bruhat Tits system | `GL₂/𝔽₂`; `SL₂/𝔽₃`; `𝔾_m`; trivial group; `T ⊄ B` over `k̄`; constant `ℤ/3` | `\|N(𝔽₂)\| = 2`, `B∩N = 1`, `6 = 2+4`; abstract normalizer = `GL₂(𝔽₂)`, `B` not normal; `\|N(𝔽₃)\| = 4`, `B∩N = ±1`, `24 = 6+18`; `𝔾_m`: one cell; `B∩N(T′) = scalars·⟨[[−1,1],[0,1]]⟩`, not stable under `t′` with `a ≠ ±d`; `W = ℤ/3` has no involutions | holds with scheme normalizer, `T ⊆ B`, connectedness | form changed from the proposal; 5 Checks added |
| `slTitsSystem` sentence | `SL₂/𝔽₃` | `T(𝔽₃) = {±1}` central, normalizer of order 24 vs `N(𝔽₃)` of order 4 | draft sentence false | corrected (README L2134 ff.) |
| Brieskorn | rank 1 (`±2`, `±1` on ℂ); no roots; `A₁×A₁`; `A₂` | `ℂ*/±1 ≅ ℂ*`, `π₁ = ℤ =` Artin `A₁`; trivial = Artin(∅); `(ℂ*)²/(ℤ/2)² ≅ (ℂ*)²`, `ℤ²`; `B₃` | holds; extra coroot-space directions are a W-fixed ℂ^m factor | none |
| §1.1 invariants target | trivial group on `ℤ/2`; `𝔾_m` weight one; `μ_p` weight one | all fixed; `1 ↦ 1⊗t`, 2 acts by 2; `μ_p(𝔽̄_p) = 1` yet invariants 0 | universal point needed | `μ_p` negative control added |
| Layer 7a convention | `σ(h) ∈ hJ` vs pinned `nσ(n)⁻¹ ∈ J`, `n = h⁻¹` | `h⁻¹σ(h) = nσ(n)⁻¹`; `x⁻¹σ(x) = yσ(y)⁻¹` for `y = x⁻¹` | the two forms agree | stated in README |
| 9A.1a checks | `A₁` Killing; `A₂` opposite sign; empty/root-free | `Σ B(α,a)² = 4+4 = 8`; `ε(α₁+α₂,−α₁−α₂) = −1`; zero algebra vs abelian `Y` | consistent with pinned type-A map | Checks added |
| 9A.1b A₂ exchange (kept) | `e = xα+xβ`, `h = Hα+Hβ` | `[h,e] = (2−1)e = e`; `[e,f] = h`; index of `(E,F,H) = (e,2f,2h)` is 4 | holds | none |
| 9B pinning convention | G₂ and F₄ pinned equations | G₂ cubes the short parameter, torus `(s₀,s₁) ↦ (s₁,s₀³)`; F₄ uses `isogenyExponent` (`t ↦ t²` at short roots) | matches README exponent convention | none |

## Ownership, overlaps, suppliers and sources

**Ownership.**
- Bruhat: LieGroups names ReductiveGroups Layer 7 the single owner of generic Bruhat (LieGroups
  README L1081).
- Brieskorn's theorem occurs only in ReductiveGroups revisions (`roadmaps grep -i Brieskorn`).
- Representability for specific groups belongs to Layer 3 (Scope); SchemeAndStackFoundations
  §§1.13–1.15 supplies only generic quotient sheaves.
- Ownership against open pull requests was checked with `roadmaps grep`, and #1797's head with
  `roadmaps show`.

**Ids and suppliers.**
- No section, layer or target id was renamed: CFSGStatement's citations of the 9B bullets
  *Special isogenies in characteristics two and three* and *Explicit carriers with numbered
  symmetries* still resolve.
- No supplier later in the merge order was added.
- The one notion moved down is Lang's theorem (H08), from ReductiveGroupsPartII RG2.3.7 into
  Layer 7a.

**Sources.**
- The cached text the brief lists for `milne-iag` is Milne's v2.00 (2015). Its numbering differs
  from the 2017 edition the README cites (v2.00 has no Tits-system section).
- `sources fetch --id milne-iag` fetched the author's copy of the 2017 edition
  (jmilne.org `iAG2017.pdf`). Every Milne locator added this round was checked against it:
  Theorem 5.14 p. 102, Proposition 5.18 p. 103, Propositions 5.21 and 5.25 pp. 104–105, Theorem 9.18
  p. 170, Theorem 12.23 p. 240, Theorem 21.45 p. 438, Example 21.47 p. 439, §21.h p. 446,
  Theorem 21.73 p. 447, Proposition 21.75 p. 448.
- Jantzen §2.10(1)–(2) is `jantzen-1985` lines 1216–1223 (printed p. 41).
- This job does not edit the sources manifest. The worker should record the 2017 URL under
  `milne-iag`.
- No `needs-references.toml` entry was needed.

**Untrusted text.** The review contains no instruction outside the job's scope.

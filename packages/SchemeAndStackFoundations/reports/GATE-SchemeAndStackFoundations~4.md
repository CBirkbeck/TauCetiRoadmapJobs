# GATE-SchemeAndStackFoundations~4: answers to the human review of `94710cb`

All points come from one comment (CBirkbeck, 2026-11-05T00:06:19Z): finding F01 and two remarks
(the warnings on main's consumer files, and the pull-request description's §4.10A). They are
numbered H01–H03 in order. The quoted comment is cut off inside its table of rows carried over from
the earlier review; the visible rows restate earlier rows and raise no further point.

None of H01–H03 changes a file. The worker's checks then reported two gate failures in this
round, `statement-hygiene=9` and `dropped=39`. Both are repaired in commit `170bdbee`
(`TauCetiRoadmap/SchemeAndStackFoundations/README.md` and `Suggested.lean` only; see "Repairs of
the gate findings" below). The gate now passes: `OK`, with `build=0`.

## H01 (CBirkbeck) — disputed

The targeted build still prints Lake's advisory for this file ("imports `Mathlib` … consider
adding `module`"), at `94710cb` and at `170bdbee`. However, the gate with its targeted build reports
`build=0`, because its build filter drops that advisory and ignores warnings in files outside the
folder. So the finding's only witness (`build=4 FAIL`) no longer reproduces. The plain form is
also the repository's form: after main's pin bump to Lean v4.36.0-rc2 (`a891cd1`), main's own copy
of this file, its two consumers `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean` and
`TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean`, and 157 of the 169 `Suggested.lean` files
under `TauCetiRoadmap/` on main still begin with `import Mathlib`.

The proposed module form was checked at `94710cb` and works:

- The scratch copy used `module`, nine `public import` lines, the unchanged docstring, and
  `@[expose] public section` before `universe u`, with `#check @name` for all 155 declarations.
- It elaborated in 60 s. Its only warnings were `declaration uses sorry` (76).
- All 155 elaborated types matched `94710cb`'s signature file token for token.
- All eight `TauCeti.*` files it imported are `module` files at this branch's pin (`358314d4`) and
  at main's pin (`2fd255d9`).

#1656's head already uses that header for this file, so a human can adopt it when the two pull
requests are reconciled. It was not applied here because nothing requires it and the import line
this project prescribes is `import Mathlib`. The ninth import added in `170bdbee`,
`TauCeti.AlgebraicGeometry.Modules.Tilde.Basic`, is also a `module` file at the pin.

## H02 (CBirkbeck) — answered

The three other lines are the same Lake advisory on main's
`TauCetiRoadmap/AdicSpacesPartII/Suggested.lean`, `TauCetiRoadmap/AdicEtaleGeometry/Suggested.lean`
and `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean`. They still appear in the targeted build
(4 advisories, 0 errors). The gate does not count them, because they are advisories and come from
files outside this folder, so `build=0`. Nothing in this folder changes for them, as the review
itself says.

## H03 (CBirkbeck) — answered

The folder has no §4.10A: `README.md` and `Suggested.lean` contain no `4.10A` (0 hits each). The
only 4.10 heading is `README.md:5450` ("Grothendieck's existence theorem and algebraization"). The
section was dropped in commit `828d0b6` ("drop 4.10A"). The pull-request description is outside the
files this job may edit; the worker corrects it when it replies.

## Repairs of the gate findings

These were not raised by the reviewer. The worker's checks named them for this round.

### `statement-hygiene` (9 hits → 0)

The flagged `Nonempty (A ≃ B)` conclusions asserted only that some bijection exists. A conclusion
`Nonempty (X ≃ Y)` between types says no more than that `X` and `Y` have the same cardinality. Each
is now the canonical statement, a characterised existence, or a README target.

- **`Suggested.lean:187` `Henselization.fixed_of_henselian`.**
  - Old: `Nonempty (algebra I ≃ₐ[R] R)`. New: `Function.Bijective (algebraMap R (algebra I))`.
  - The README already said "`R → algebra I` is an isomorphism" (`README.md:995`), so the Lean
    now matches it.
- **`localCohomology_degreeZero` and `localCohomology_flat_baseChange`** (old `:699`, `:708`):
  removed from Lean. They are now README targets in §2.7.
  - The README now states their canonical form (`README.md:3474–3481`): the evaluation map from
    `H⁰_I(M)` to `M` is injective with image the `I`-power torsion; the base-change map
    `B ⊗_A H^q_I(M) → H^q_{IB}(B ⊗_A M)` is an isomorphism.
  - Neither map exists at the pins. Mathlib defines `localCohomology` as a colimit of the old
    `Ext` functor (`Mathlib/Algebra/Homology/LocalCohomology.lean:173`) and has no
    base-change map on it. The evaluation map would need a new cocone definition over the
    `Ext⁰` diagram.
  - Neither is a headline. An existence-only isomorphism would be the weakened substitute the
    brief rules out, so nothing replaces them.
  - The `*Lean:*` line now says this (`README.md:3508`), and the section comment reads "§2.5–§2.6".
  - DeformationAndDerivedPatchingAlgebraPartII cites `localCohomology_flat_baseChange` as a target
    of §2.7. The target remains there, so that citation still resolves.
- **`Suggested.lean:811–823` `Coherent.DQCoh.affineEquiv`** (old `letI` plus
  `Nonempty (D(A) ≌ DQCoh (Spec A))`).
  - The local `letI` became the named instance `Coherent.instHasDerivedCategoryModuleCat`.
  - The theorem now states Stacks 06Z0 canonically:
    `(tilde.functor A).mapDerivedCategory` is `Full` and `Faithful`, and its essential image is
    exactly the complexes whose homology sheaves are all quasi-coherent.
  - This is statable at the pins because Tau Ceti proves `tilde.functor` left exact:
    `TauCeti.AlgebraicGeometry.preservesFiniteLimits_tildeFunctor`, in
    `TauCeti/AlgebraicGeometry/Modules/Tilde/Basic.lean:135`. Its module was added to the imports
    and to the Tau Ceti supplier contract (`README.md:396`).
- **`Suggested.lean:942` `Curve.vectorBundleDegree_pullback`.**
  - The `let φ := … ; letI := φ.hom.toAlgebra` became the binder
    `[Algebra Y.functionField X.functionField]`.
  - It comes with the hypothesis `hφ`: `Spec.map (algebraMap) ≫ Y.fromSpecStalk ξ_Y = X.fromSpecStalk ξ_X ≫ f`.
    This ties the algebra to `f`, and it determines the algebra because `Spec` of a stalk is a
    monomorphism.
  - README §3.3 (`README.md:4681`) says so.
- **`Suggested.lean:993` `Picard.lineBundleClass_spec_equiv_pic`.**
  - Old: `Nonempty (LineBundleClass (Spec R) ≃ CommRing.Pic R)`.
  - New: `∃ e : LineBundleClass (Spec R) ≃* CommRing.Pic R, ∀ L P, e (mk L) = P ↔ Nonempty (L.obj ≅ P~)`.
    This determines `e`, because `tilde` is fully faithful.
  - README §3.4 (`README.md:4740`) and the `*Lean:*` line follow.
- **`Suggested.lean:1434–1460` `Chow.CH_coprod`.**
  - The two `letI`s (one proving `LocallyOfFiniteType` by an in-statement `by sorry`) became
    instances with real bodies:
    - `Chow.coprodOver` is `⟨Sigma.desc …⟩`;
    - `Chow.coprod_locallyOfFiniteType` is proved by Mathlib's `IsZariskiLocalAtSource.sigmaDesc`,
      with `HasRingHomProperty.instIsZariskiLocalAtSource` supplied explicitly because instance
      search does not find it under the default options.
  - The conclusion `Nonempty (CH(∐X) ≃+ ∏ CH(X_i))` became the restriction criterion: a `k`-cycle
    `α` on `∐ X` lies in `RatEquiv` iff for each `i` some `β ∈ RatEquiv (X i)` agrees with `α`
    along `Sigma.ι X i`.
  - Together with the bijection of cycles, this gives the isomorphism. The restriction map itself
    is not statable without a definition whose well-definedness is a theorem.
  - README §5.1 (`README.md:6594`) and its `*Lean:*` line follow. This also removes one `sorry`
    from inside a statement: 73 `sorry` warnings, against 75 before.
- **`Suggested.lean:1466` `weil_bound`.** `[Fintype k]` → `[Finite k]`, and `Fintype.card k` →
  `Nat.card k` (twice).

### `dropped` (39 hits → 0)

AbundanceStatement and CommRingFactorizationSystems are on the list of roadmaps never cited as
suppliers. All 23 AbundanceStatement lines and both CommRingFactorizationSystems lines are gone
(`grep -c` of both names: 0).

The roadmap already owned the general versions of every statement those suppliers were cited for.
So the repair deletes the characteristic-zero supplier branch and states each result once, in every
characteristic. Their content moves down into this roadmap:

- **The "Other supplier contracts" table (old `README.md:445–452`).** Deleted (four rows).
- **Comparison-only sentences: deleted.** In §0.7, §2.6, §3.3 and §4.13 (three places), the
  sentences that only compared this roadmap's theorems with AbundanceStatement's special cases are
  deleted, together with their seven italic `*_abundanceSpecialization*`/`*_abundanceComparison*`
  targets.
- **§0.23 (`README.md:1484–1492`): own affine targets in place of CommRingFactorizationSystems F2.**
  - *universalHomeomorphism_affine*: `Spec φ` is a universal homeomorphism iff `φ` is integral,
    `Spec φ` is surjective, and `φ` is injective on field-valued points. This uses Stacks, Lemma
    29.10.2 (01S4), checked on the Stacks project site.
  - *universalHomeomorphism_of_surjective_of_nil_kernel*: the affine case of `of_isThickening`,
    with no uniform nilpotence exponent.
  - A new Check covers the second target: `k[x₁, x₂, …]/(x_n^n) → k`, whose kernel is nil but
    not nilpotent.
- **Layer 5 introduction (`README.md:6539`).** It now says that the surface theory of §§5.9–5.10 is
  built here in every characteristic.
- **§5.9 (`README.md:7110`).** *surface_pairing* and "`C · D = deg_C(O(D)|_C)` for integral `C`"
  are this roadmap's targets over every field (Hartshorne 1977, V.1, Proposition 1.4, the locator
  the README already used outside characteristic zero).
- **§5.10.**
  - The comparison paragraph *numericalQuotient_abundanceComparison* is deleted.
  - Numerical Néron–Severi finiteness (`README.md:7207`) is proved in every characteristic, with
    the same Lang–Néron locator.
  - `nakai_moishezon` (`README.md:7229`) is proved in every characteristic (Hartshorne 1977, V.1,
    Theorem 1.10).
  - The `hodge_index_signature` input sentence no longer splits by characteristic.
- **§5.10 Checks.** The three supplier-comparison Checks are rewritten as computed tests of this
  roadmap's statements:
  - `Num(E × E)` has rank `2 + rank End(E)`: `3`, `4` or `6`;
  - `O(a, b)` on `ℙ¹ × ℙ¹` is ample iff `a, b > 0`;
  - the matrix `[[0,1],[1,0]]` has signature `(1, 1) = (1, ρ − 1)`.
  The `−H` Check now applies in every characteristic.
- **Layer 5 Dependencies and Downstream consumers.** The supplier references are removed.
  AbelianSchemesAndArithmeticModuli now imports §5.10 "in every characteristic".

Ownership: these are general scheme and surface statements that the roadmap already stated in
general. No roadmap earlier in the merge order or on main owns them. Searching main and the open
heads (`roadmaps grep`) finds no other owner of the removed comparison targets, and no roadmap
cites them or the removed heading.

## Overlap with open pull requests

- **Open pull requests that change this folder.** #1656, #1807, #1808 and #1854 all change this
  folder, and each conflicts with this head.
  - #1807 and #1854 carry the same README for this roadmap, which differs from main in 93 lines.
    They drop the ModularCurves 0B/9D inputs, which this head has already dropped. They also add a
    regular-local-ring block (Serre's theorem, Auslander–Buchsbaum, global dimension, after main's
    `README.md:5655`) that this head lacks.
  - #1656 and #1808 rewrite large parts of both files.
  - All four heads still carry the 23 AbundanceStatement lines, the two CommRingFactorizationSystems
    lines and the `Supports` theorems that this head removes.
  - Order: this pull request, the revision of the whole roadmap, merges main first and lands first.
    #1807/#1854, #1656 and #1808 then rebase onto it, re-applying respectively the regular-local-ring
    block, §0.7a and the ModularCurves move, and keeping this head's removals. None of these is
    restated here.
- **Dropped and revision-only ids.** No id this README cites is dropped by an open pull request,
  and none is defined only by an open revision. This pull request drops no id that another roadmap
  cites: `localCohomology_flat_baseChange` remains a §2.7 target, and the removed heading and
  italic comparison targets are cited nowhere.
- **Ownership.** The three new Lean declarations are `instHasDerivedCategoryModuleCat`,
  `Chow.coprodOver` and `Chow.coprod_locallyOfFiniteType`. They are instances on this roadmap's
  carriers. No library or roadmap declaration has their names or states the same instance.
- **Pins.** This branch is 53 commits behind main, including main's pin bump: Mathlib `f6090c70` →
  `1b1ccf4b`, Tau Ceti `358314d4` → `2fd255d9`, Lean v4.35.0-rc3 → v4.36.0-rc2. Everything here was
  built at the branch's manifest pins. The file was not elaborated at main's pins.

## Signature check

All 156 declarations of `170bdbee` were put into one scratch file as `#check @name` and elaborated
once. The file has 155 − 2 removed + 3 new declarations.

- The elaboration gave 0 errors and 73 `sorry` warnings.
- 147 elaborated types are identical token for token to `94710cb`'s signature file.
- The 6 that differ are exactly the restated theorems:
  - `fixed_of_henselian`;
  - `DQCoh.affineEquiv`;
  - `vectorBundleDegree_pullback`;
  - `lineBundleClass_spec_equiv_pic`;
  - `CH_coprod`;
  - `weil_bound`.
- Each of the 6 keeps all its binders: the new `[Algebra K(Y) K(X)]` and `hφ` are present, and
  `weil_bound` has `[Finite k]`.
- 2 are missing (the `Supports` theorems) and 3 are new (the instances above).
- Each changed type was compared with its new README statement. They agree:
  - Pic: `e (mk L) = P ↔ Nonempty (L.obj ≅ tilde ↧P)`;
  - `affineEquiv`: `Full ∧ Faithful ∧ essImage ↔ ∀ n, IsQuasicoherent (homology n)`.

## Adversarial pass

Rows 1–12 cover the statements this round changed. The remaining rows are carried over from the
first pass of this round.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `fixed_of_henselian` (bijective `R → R^h`) | `(R, ⊥)`; `R = 0`, `I = ⊤`; `(ℤ_p, (p))`; control `(ℤ, (5))` | `(R, ⊥)` is henselian. `R` is a neighbourhood and every neighbourhood `B` has `R ≅ B`, so `R^h = R`, which is bijective; this agrees with the Check "`algebra ⊥ ≅ R`". `R = 0`: `0 → 0`. `ℤ_p`: bijective. `(ℤ, (5))` is not henselian (`x² + 1` has simple roots mod 5 but none in `ℤ`), and `ℤ^h` contains a square root of `−1`, so the map is not surjective without the hypothesis. | Pass; restated as bijectivity. |
| `DQCoh.affineEquiv` (derived `tilde`: full, faithful, image `D_QCoh`) | `A = 0`; `A = k`; `A = k[t]` with `K = j_!O_U[0]`, `U = D(t)` | `A = 0`: both categories are trivial, all three clauses hold, and the right side holds vacuously on `∅`. `A = k`: `D(k) → D(k-vector spaces)`. For `j_!O_U[0]`, `H⁰ = j_!O_U` is not quasi-coherent, so the right side is false. The left side is also false: by exactness the homology of `M~•` is `(H M•)~`, which is quasi-coherent. | Pass; canonical form. |
| `instHasDerivedCategoryModuleCat` | Consumer `EnhancedDerivedSheaves:314` binder `[HasDerivedCategory.{u+1} (ModuleCat.{u} R)]`, `R : Type u` | The instance is on `ModuleCat ↥A`, `A : CommRingCat`, and the consumer's local binder takes precedence. The targeted build of both consumers succeeds. | Pass. |
| `vectorBundleDegree_pullback` with `hφ` | `ℙ¹ → ℙ¹`, `t ↦ t²` (char ≠ 2), `E = O(1)`; wrong algebra `s ↦ t³` | Square holds for `s ↦ t²`: `finrank = 2`, `deg f^*O(1) = 2 = 2 · 1`. For `s ↦ t³`, `Spec k(t) → Y` corresponds to a different embedding `k(s) → k(t)`, so `hφ` fails. Without `hφ`, that algebra gives `3 · 1 = 3 ≠ 2`, so the hypothesis is needed. | Pass; the hypothesis determines the algebra. |
| `lineBundleClass_spec_equiv_pic` | `R = 0`; `ℤ`; `ℤ[√−5]` (`Pic = ℤ/2`); wrong model `L ↦ Γ(L)⁻¹` on `ℤ[(1+√−23)/2]` (`Pic = ℤ/3`) | `R = 0`: one class each side, and every sheaf on `∅` is isomorphic, so the iff holds. `ℤ`: only `O ↦ 1`. `ℤ[√−5]`: `P~ ↦ P`, and `O ≇ P~` because `P` is not principal. Wrong model: for `P` of order 3, `P⁻¹ ≠ P` while `P~ ≅ P~`, so the iff fails. | Pass; the inverse convention is excluded. |
| `CH_coprod` (restriction criterion) | `I = ∅`; `I = Unit`; `E = ∐_ℕ 𝔸¹`, `α = Σ[0_n]`; `Spec κ ⊔ 𝔸¹`, `α = [pt]`, `k = 0`; `k = −1` | `∅`: `α = 0`, both sides true. `Unit`: `ι` is an isomorphism, so the two sides agree. `Σ[0_n]`: left true (README Check), right true (`[0] = div t` on each `𝔸¹`). `[pt]`: left false (a one-dimensional `W_j` lies in `𝔸¹`), right false (`RatEquiv(Spec κ) = 0`). `k = −1`: the cycle group is `0`, both true. The wrong model `∃ i` would give true on `[pt]` (`i = 𝔸¹`), so it is excluded by `∀`. | Pass. |
| `coprodOver`, `coprod_locallyOfFiniteType` | Arbitrary `I : Type u` | `Sigma.ι i ≫ Sigma.desc g = g i`, so each `X i` keeps its structure map. The local-at-source proof elaborates with no `sorry` (73 warnings, none at `:1440`). | Pass. |
| `weil_bound` (`Nat.card`) | `𝔽₂` with `y² + y = x³ + x` | `Nat.card 𝔽₂ = 2`, `N = 5`, `|5 − 3| = 2 ≤ 2√2 ≈ 2.83`. `Nat.card` junk (`0` on infinite types) is excluded by `[Finite k]`. | Pass. |
| *universalHomeomorphism_affine* (§0.23) | `ℚ → ℚ(i)`; `k[t², t³] → k[t]` | `ℚ(i)`: integral and surjective, but two maps `ℚ(i) → ℂ` restrict to the same `ℚ → ℂ`, so it is not universally injective and not a universal homeomorphism; this agrees with the 𝔽_{p²} Check. `k[t]`: `t` is determined by `(t², t³)`, as `t = t³/t²` when `t² ≠ 0` and `t = 0` otherwise, so the map is injective on field-valued points and is a universal homeomorphism. | Pass. |
| *…_of_surjective_of_nil_kernel* | `A = k[x_n]/(x_n^n) → k` | `I^m ∋ x_{m+1}^m ≠ 0`, and every element of `I` is nilpotent. The map is surjective, hence finite. `I` lies in every prime, so `Spec` is surjective. Field-valued points are determined by restriction. So the map is a universal homeomorphism with no uniform exponent. | Pass; new Check. |
| §5.9 `C · D = deg_C(O(D)|_C)` in every characteristic | Conic `xz = y²` and a line in char 2; `x² + y² = z²` and `z = 0` over `ℝ` | Char 2: the conic is smooth (its singular locus needs `x = z = 0`, hence `y = 0`), and `C · L = 2 = deg O_{ℙ¹}(2)`. Over `ℝ`: one point with residue field `ℂ`, so the intersection is `2 · 1 = 2`. `C ≅ ℙ¹_ℝ` has the point `(1:0:1)`, and `O(1)|_C = O(2)` has degree `2`. | Pass. |
| §5.10 Checks (new) | `ℙ²`; `E × E`; `O(a, b)`; `[[0,1],[1,0]]` | `L² = 1`. `ρ = 2 + rank End E`, which is `3`, `4` or `6`. `O(a, b) · (1, 0) = b`, `· (0, 1) = a`, `O(a, b)² = 2ab`, so it is ample iff `a, b > 0`. Eigenvalues `±1` give signature `(1, 1)`, matching `ρ = 2`. `Pic⁰(E × E) ≠ 0`, so `Num ≠ Pic`. | Pass. |
| F01 witness: gate build counter | Gate with targeted build | Review: `build=4 FAIL`. Now `build=0`, both at `94710cb` and at `170bdbee`. | Witness gone (H01). |
| Module-form alternative | `module` + `public import` ×9 + `@[expose] public section` + 155 `#check` at `94710cb` | 76 `sorry` warnings, 0 other diagnostics, 155/155 types identical. | Works; not applied (H01). |
| `SchemeFrobenius.schemeCharP_spec_iff` | `A = 0`, `ℤ/p²`, `𝔽_p × ℚ`, `𝔽_p[ε]` | Left side: true, false, false, true. `(p : A) = 0`: true, false, false, true. | Pass. |
| `FlatAnnihilator.annihilator_flat_baseChange` | Without `Module.Finite`: `M = ⊕ₙ ℤ/n`, `ℤ → ℚ` | `Ann_ℤ M = 0` gives `0`. But `ℚ ⊗ M = 0`, whose annihilator is `ℚ`, and `0 ≠ ℚ`. | Pass; the finiteness hypothesis is needed. |
| `flat_over_dedekind` | `Spec ℤ[x]/(2x)` over `ℤ` | The component `V(2)` maps to `(2)`, so `hdom` fails, and `x` is 2-torsion, so the map is not flat. | Pass. |
| `exists_regularSystem_of_quotient` | `k[[x,y]]`: `I = (y − x²)`, `(y² − x³)` | `c = 1` with system `x, y − x²`. The cusp quotient is not regular, so it is excluded. | Pass. |

## Build and gate

Targeted build (`lake build TauCetiRoadmap.SchemeAndStackFoundations.Suggested
TauCetiRoadmap.AdicEtaleGeometry.Suggested TauCetiRoadmap.EnhancedDerivedSheaves.Suggested`) at
`170bdbee` gave `Build completed successfully (9271 jobs)`, exit 0.

- This file: 73 `declaration uses 'sorry'` warnings and one Lake module-system advisory.
- `AdicSpacesPartII`, `EnhancedDerivedSheaves` and `AdicEtaleGeometry`: the same advisory each.
- No error and no other warning.

Gate (`gate … SchemeAndStackFoundations --base origin/main --build`, at `170bdbee`):

    gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

Dependency check (`gate --depcheck … --movable`):

    depcheck: 239 roadmaps, 2431 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the new README finds no cross-roadmap citation and no Lean name of a roadmap
that exists nowhere. The new library names were checked at the pins: `IsZariskiLocalAtSource.sigmaDesc`
(`Mathlib/AlgebraicGeometry/Morphisms/Basic.lean:302`), `Functor.mapDerivedCategory`
(`Mathlib/Algebra/Homology/DerivedCategory/ExactFunctor.lean:43`), `tilde.functor`, and Tau Ceti's
`preservesFiniteLimits_tildeFunctor`.

Sources: the only new locator is Stacks, Lemma 29.10.2 (01S4). It and Lemma 29.46.5 (04DF) were
read on the Stacks project's own site rather than through the sources service. No manifest entry
was written: the folder has no `sources.toml`, and this job may edit only `README.md` and
`Suggested.lean`. No `needs-references.toml` was written. No text in the review or in the fetched
pages asked for any action.

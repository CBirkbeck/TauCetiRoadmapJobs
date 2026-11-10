# Review of SchemeAndStackFoundations (pull request #1276 at b311bda)

**Verdict:** needs changes

This is an incremental re-review: 31 lines of the folder changed since `bf48be7`.

- **Previous findings.**
  - R03 and R04 of r74 are repaired.
  - R01 is not repaired. R02 is partly repaired. Both are carried, and both are steps for the worker or a human, not for a folder repair.
- **New this round.** The repair of r74's R03 (a) added a sentence deriving the dense open from the constructible locus. It cites Lemma 005K for constructible sets, but the locus is only locally constructible (R03).
- **Blocking.** The only blocking finding is R01.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`, where most of the README's Tau Ceti citations do not exist

Re-raised: H01. The repair report is right that a folder repair cannot merge `origin/main`. That does not settle the finding. The citations fail at the pin this review must check, at this head, and only the worker's merge (or a human) can repair them. It is re-raised so that it goes to them rather than to another folder-repair round.

- **Location.**
  - `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`.
  - `README.md:427` says "**From Mathlib** (`1b1ccf4b`)" and `:468` says "**From Tau Ceti** (`2fd255d9`)".
  - `Suggested.lean:119` and `:126` still restate `Ring.IsJapanese` and `Ring.IsNagata`.
- **Claim.** The README names 81 distinct `TauCeti/….lean` files. 60 of them are absent at the branch pin `358314d4`.
- **Witness.**
  - The line this round edited, `README.md:1435`, cites `Nagata.lean:76`, `:86`, `:109`, `:124`. `TauCeti/RingTheory/Nagata.lean`, `Japanese.lean` and `UniversallyJapanese.lean` are all absent at `358314d4`.
  - At `2fd255d9` they exist: `Nagata.lean:76` is `of_finite` (docstring 032T) and `:124` is `of_isLocalization` (032U).
- **Repair.**
  1. The worker merges `origin/main` (`f8836c48`). `git merge-tree --write-tree HEAD origin/main` exits 0 at this head.
  2. A folder repair then replaces the restated definitions with Tau Ceti's, as set out in r73's R01.
- **Tested.** Of the 81 files, 80 exist at `2fd255d9`. The 81st, `Cohomology/FormalFunctions.lean`, is §4.9's planned home.

## R02 (P3) — The description still describes a §4.10A this head lacks, and says no Lean declaration changes

Re-raised: H02. The repair report is right that a folder repair may not edit pull-request text. The sentences are still false at this head.

- **Location.** `scratch/pull-request.md` contains "New section 4.10A constructs that scheme …" and "This README-only addition changes no Lean declarations or configuration".
- **Witness.**
  - `grep -c '4\.10A' README.md` returns 0. §4.10 is followed directly by §4.11 (`README.md:5695`, `:5743`).
  - `git diff --stat` against the merge base shows 1928 changed lines in `Suggested.lean`, including 12 added declaration lines.
- **Repaired since r74.** The generated `merge-order` block now states the order with the four conflicting heads: "this pull request → #1656 → #1807 → #1808 → #1854".
- **Repair.** Replace the hand-written description with the one drafted in the r72 repair report. No file change is needed.

## R03 (P3) — §0.8 applies Lemma 005K, a statement about constructible sets, to a locus that is only locally constructible

- **Location.** `README.md:957–959`: "In the last three cases the dense open follows from the locus statement, because a constructible set containing the generic point of an irreducible space contains a dense open (Stacks, Lemma 5.15.15 (005K))."
- **Claim.** The locus statements of this paragraph conclude only "locally constructible". Lemma 005K needs `E` to be a finite union of locally closed subsets. The step between the two, restricting to an affine open containing `η`, is not stated, so the cited lemma does not apply as written.
- **Witness.**
  - The locus statements say "locally constructible": 0579 (Stacks book p. 3252), `ega-iv-3` line 3115 (9.7.7) and line 3746 (9.9.5).
  - 005K (Stacks book p. 155) assumes "a finite union of locally closed subsets".
  - Properties, Lemma 28.2.1 (054C, p. 2373) supplies the missing step: a locally constructible set is constructible in every affine open.
- **Repair.** Replace the sentence with: "In the last three cases the dense open follows from the locus statement: on a nonempty affine open `U ⊂ S` the locus is constructible (Properties, Lemma 28.2.1 (054C)) and contains the generic point, so it contains a dense open of `U` (Topology, Lemma 5.15.15 (005K)), which is dense in `S`."
- **Tested.**
  - Take `X = Spec ℤ[x, y]/(y² − x³ − 5)` over `S = Spec ℤ`. Then `Δ = −16·27·25 = −2⁴·3³·5²`.
  - The fibres at 2, 3 and 5 have cusps:
    - at `(0, 1)` mod 2, where `v² = x³` with `y = 1 + v`;
    - at `(1, 0)` mod 3, where `y² = u³` with `x = 1 + u`;
    - at `(0, 0)` mod 5.
  - The locus of normal, respectively smooth, fibres is therefore `D(30)`. It is constructible in the affine `U = S` and contains `η`, as the repaired sentence requires.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`. `README.md:427` and `:468` still name `1b1ccf4b` and `2fd255d9`, and 60 of the 81 cited Tau Ceti files are absent at the branch pin. Carried as R01.
- R02 — partly repaired: the generated `merge-order` block now states "this pull request → #1656 → #1807 → #1808 → #1854". The description still says "New section 4.10A …" and "changes no Lean declarations". Carried as R02.
- R03 — repaired:
  - (a) `README.md:951–956` gives a dense-open and a locus locator for each property (0578/0579, 0559/055B, 055G/055I, EGA 9.7.7 (iv), 9.9.4 (iii)/(i) with 9.9.5).
  - (b) `:1435–1437` cites 032T, 032U and 032R separately.
  - (c) `:1741–1743` states Proposition 3.11 (iii).
  - The sentence added after (a) is this report's R03.
- R04 — repaired: `Suggested.lean:330`, `:566`, `:576`, `:757` and `:1224` now carry docstrings. A scan for declaration keywords not preceded by a docstring finds none; its only hit is inside the module docstring, at line 43.

## Verified sound

### Gate, dependency check, build

- **Gate.** The worker's gate reports every counter 0 and `OK`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 and `OK`, and exited 0.
- **Dependency check.** The output of `gate --depcheck … --movable --pr 1276`, verbatim:

  ```text
  depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
  ```

  It exited 0, with no UPWARD, CYCLE or `moved:` line.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean <abs>/Suggested.lean` exited 0 in 83 s. It printed 47 "declaration uses `sorry`" warnings and nothing else, matching the 47 `sorry` in the file.
- **Signatures of the changed declarations.** Only the docstrings of five instances changed. In a scratch file importing the module (the `.olean` postdates this head's `Suggested.lean`):
  - `#check` gives `Groups.instCartesianMonoidalCategoryOverSchemePresheaf : (A : SchemePresheaf) → CartesianMonoidalCategory (Over A)`.
  - `#check` gives `Coherent.instHasDerivedCategoryModules : (X : Scheme) → HasDerivedCategory X.Modules`.
  - `#check` gives `Coherent.instCategoryDQCoh : (X : Scheme) → Category (DQCoh X)`.
  - `inferInstance` finds `Curve.instOverBaseChangeSpecOf` from exactly the binders `[Field k] [X.Over (Spec k)] [Field K] [Algebra k K]`.
  - `inferInstance` finds the `ChowGroup` `AddCommGroup` instance from exactly the binders `[Field κ] [X.Over (Spec κ)] [LocallyOfFiniteType …]`.
  - No binder was lost. `scratch/signatures.md` reports 0 lost binders in 120 declarations.
- **Padding.** No Lean statement changed, so r74's probe stands: all 47 positions fail under `first | rfl | (simp; done) | infer_instance | trivial | decide`.
- **Headlines.** No Lean statement changed, so the list is as at r74.
  - Stated: Artin's bootstrap, Grothendieck existence and algebraization, both de Jong theorems, Hodge index, the Weil bound, and the §2.18 gluing theorems.
  - Named in the module docstring with the missing carrier: §5.7, §1.23, §2.19–§2.20, §2.22, §3.6, §4.4, §5.8.

### Changed locators, checked at the text

The Stacks items were checked in the cached Stacks book (book.pdf, version `ed88ff78`, 7654 pages, printed page = PDF page).

- **§0.8, dense open for each property.**
  - 0578 (37.26.4, p. 3252): `Y` irreducible, `X_η` geometrically reduced, `f` of finite type.
  - 0559 (37.27.5, pp. 3255–3256) and 055G (37.28.4, p. 3260) have the same shape, for irreducible and for connected.
  - All three are implied by the README's finite presentation over an integral `S`.
- **§0.8, loci.**
  - 0579 (37.26.5): quasi-compact and locally of finite presentation, locus locally constructible.
  - 055B (37.27.7) and 055I (37.28.6): finite presentation, each level set `E_n` locally constructible. With `n = 1`, `n_{X/Y}(y) = 1` means geometrically irreducible, respectively geometrically connected.
- **EGA IV₃.**
  - `ega-iv-3` lines 3109–3115: Théorème 9.7.7, (iv) géométriquement intègre, on printed p. 79.
  - Lines 3714–3722: Proposition 9.9.4, (i) géométriquement régulier, (iii) géométriquement normal, on p. 93.
  - Lines 3744–3746: Corollaire 9.9.5, the set of `s` where the property holds at every point of `X_s`, on p. 94.
  - The README's "(iii) and (i)" for "normal and smooth" matches this order. Smoothness of a fibre locally of finite type over `κ(s)` is geometric regularity at every point.
- **005K** (5.15.15, p. 155): with a generic point, `ξ ∈ E` is equivalent to `E ∩ Z` containing a dense open of `Z`, for `E` a finite union of locally closed sets. See R03.
- **§0.20.**
  - 032R (Definition 10.162.1, p. 881).
  - 032T (Lemma 10.162.5, p. 882): `R` Nagata and `R → S` quasi-finite, "for example finite", give `S` Nagata. Quotients are finite, so they follow.
  - 032U (Lemma 10.162.6, p. 882): localisations.
  - At Tau Ceti `2fd255d9`, `Nagata.lean`:
    - `:76` is `of_finite` (docstring cites 032T);
    - `:86` is `quotient` (via `of_finite`);
    - `:109` is `of_field` (via `of_krullDimLE_zero`);
    - `:124` is `of_isLocalization` (docstring cites 032U).
    - The README's order "finite algebras, quotients, fields and localisations" matches.
- **§0.25.**
  - `bhatt-scholze-2017` line 441: Definition 3.2, `Perf` is perfect qcqs `𝔽_p`-schemes.
  - Lines 529–538: Proposition 3.11, (iii) for every cofiltered `{Z_i} ∈ Perf/Y` with affine transition maps, on p. 12.
  - The README's "perfect qcqs schemes over `Y`" is `Perf/Y`. Its qcqs scope on `X, Y` matches "a morphism in `Perf`".
  - The clause the repair dropped ("every pfp morphism of affine perfect schemes is a cofiltered limit…") is used nowhere else. `README.md:1783–1803` use only §0.25's local/global comparison. `EnhancedDerivedSheaves` E2.8 on main (`README.md:2401`, `:2413`) cites only the notions of §0.25.

### Library declarations opened

- Mathlib `f6090c70`:
  - `Mathlib/CategoryTheory/Monoidal/Cartesian/Over.lean:33` `Over.cartesianMonoidalCategory`: unit `Over.mk (𝟙 X)`, product `pullback.cone Y.hom Z.hom`. This agrees with the new docstring's "the product is the fibre product over `A`".
  - `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:81` `HasDerivedCategory.standard`.
- Tau Ceti `2fd255d9`: `RingTheory/Nagata.lean:76`, `:86`, `:109`, `:124`.

### Cross-roadmap citations and ownership

- The changed passages add no new object and no new cross-roadmap citation.
- `roadmaps grep 'pfp_characterisations|generic_fibre_spreading|fibre_locus_constructible|…0.25'` finds two consumers:
  - `SieveMethodsAndPrimePatterns`, an open head (`README.md:127`, `:3604`, `:3612`), uses `generic_fibre_spreading` for geometric irreducibility, which the repaired statement keeps.
  - `EnhancedDerivedSheaves` on main uses §0.25's notions.
- `scratch/overlaps.md` lists no dropped id in either direction. Its four conflicting heads are covered under R02.
- Seeded sample: none of the 15 seeded targets (§0.6, 0.16, 0.21, 0.29, 1.5, 1.10, 1.19, 2.1, 2.9, 4.5, 4.6, 4.9, 4.12, 4.20, 5.4) falls in a changed passage. The changes touch §0.8, §0.20 and §0.25, plus docstrings in §1.13–§1.17, §2.18, Layer 3 and §5.2. The README flags no locator as unverified.

### Adversarial table

Rows marked r74 are carried from the previous report (`PRREVIEW-SchemeAndStackFoundations~74`) for statements this diff leaves untouched. The other rows are computed this round, for the changed statements.

| Statement | Instances | Values computed (left / right) | Result | Round |
|---|---|---|---|---|
| §0.8 geometrically reduced | `ℤ[x]/(x² + 1)` over `Spec ℤ` | `X_η = Spec ℚ(i)`, separable; `X_p` reduced for odd `p` (`disc = −4` a unit), `X_2 = 𝔽_2[x]/(x + 1)²` nonreduced; locus `D(2)` | Pass | r76 |
| §0.8 geometrically irreducible, `n = 1` | `ℤ[x, y]/(xy − 6)` | `X_η ≅ Spec ℚ[x, x⁻¹]`, `n = 1`; `X_2`, `X_3` are `xy = 0`, `n = 2`; level set `E_1 = D(6)` | Pass | r76 |
| §0.8 geometrically connected, `n = 1` | `ℤ[x, y]/(3xy − 1)` | `X_η ≅ 𝔾_m`, `n = 1`; `X_3 = Spec 0 = ∅`, `n = 0` (empty is not connected); `E_1 = D(3)` | Pass | r76 |
| §0.8 geometrically integral | `ℤ[x, y]/(xy − 6)` | `X_p ≅ Spec 𝔽_p[x, x⁻¹]` integral for `p ∤ 6`, `X_2` reducible; locus `D(6) ∋ η`, dense open `D(6)` | Pass | r76 |
| §0.8 geometrically normal, smooth | `ℤ[x, y]/(y² − x³ − 5)` | `Δ = −2⁴·3³·5²`; cusps `v² = x³` mod 2, `y² = u³` mod 3, `y² = x³` mod 5; locus `D(30) ∋ η` | Pass; R03 | r76 |
| §0.20 permanence | `ℤ`; `ℤ[i]`; `ℤ/4`; `ℤ_(2)`; `𝔽_p(t) ⊂ 𝔽_p(t^{1/p})` | finite: `ℤ[i]` Nagata; `(ℤ/4)/(2) = 𝔽_2`, N-2; localisation; integral closure of `𝔽_p(t)` in `L` is `L`, `[L : 𝔽_p(t)] = p` | Pass | r76 |
| §0.25 Prop. 3.11 (iii) | `𝔽_p[t]^perf`; `𝔽_p[x_1, x_2, …]^perf`, `Z_i = Spec 𝔽_p[x_1..x_i]^perf` | `t ↦ a ∈ colim O(Z_i)` comes from some `Z_i`: bijective; `id_X` would need `A_i → A` surjective, but `x_{i+1}` is not in its image: not bijective | Pass | r76 |
| `Over A` cartesian instance (`:332`) | `A` terminal; `X, Y → h_S` | `X ⊗ Y = X × Y`; `X ×_{h_S} Y`, unit `𝟙_{h_S}` | Pass | r76 |
| base-change instance (`:758`) | `k = ℝ`, `X = Spec ℝ[x]/(x² + 1)`, `K = ℂ` | `X_ℂ ≅ Spec ℂ ⊔ Spec ℂ` over `Spec ℂ` by `pullback.snd`; `fst` lands in `X`, not `Spec ℂ` | Pass | r76 |
| `ChowGroup` group (`:1226`) | `ℙ¹_k`, dimension 0 | `Z_0 = ⊕_x ℤ`, `div(f)` has degree 0; `CH_0 = ℤ` | Pass | r76 |
| `derivedHom_isSheaf` | `K = L = O_X[0]`; `K = O`, `L = O[1]` on `𝔸² ∖ 0` | `H^i(U, O) = 0` for `i < 0`; `Hom(K, L[−1]) = H⁰(O) ≠ 0`, `H¹(𝔸² ∖ 0, O) ∋ x⁻¹y⁻¹` | Pass | r74 |
| `derivedObject_gluing` | `ℙ¹`, `O(−2)[1]`; `X = ∅`; `O ⊕ O[1]` | glues to `Ω¹[1]`; `D(O_∅) = 0`; `Hom(K, K[−1]) ⊇ Hom(O, O) ≠ 0`, excluded | Pass | r74 |
| `derivedRestrict` Checks | `Spec ℤ`, `U = D(2)` | `(ℤ/2)~ ↦ 0`; `H¹[O →·2 O] = (ℤ/2)~ ↦ 0` | Pass | r74 |
| §0.2 `relativeSpec_modulesEquiv` | `S = Spec k`, `A = k[t]` | kernel `∋ t⊗1 − 1⊗t ≠ 0` / over `p^*A`: `A` | Pass | r74 |
| §0.8 `flat_over_dedekind` | `k[t,x]/(tx)`; `k[t,x]/(x², tx)` | `t·x = 0`, not flat, `V(t)` not dominant; not reduced | Pass | r74 |
| §0.8 `quasi_sections` | generic point of `𝔸¹_k` | `κ = k(t)`, not closed in its fibre, excluded | Pass | r74 |
| §0.20 Checks | `R_r = k[t_i², t_i³]_{i ≤ r}` | `2^r` monomial generators; countable case not finite | Pass | r74 |
| §1.8 chart products | `F = G = H = Spec k`, `W = Spec k ⊔ Spec k` | `U ×_W V = ∅` / `U ×_H V = Spec k` | Pass | r74 |
| §1.15 torsors | `μ_p` over `𝔾_m`; `μ_2/ℚ` | `k(t)[s]/(s^p − t)` purely inseparable; `ℚ^×/(ℚ^×)²` | Pass | r74 |
| §1.17 `finiteGroupQuotient_projective` | `ℤ/2` on `ℙ¹_ℤ`; swap on `ℙ¹ × ℙ¹` | forms in `x², y²`; `H⁰(O(2k,2k))^{S_2} = H⁰(ℙ², O(2k))` | Pass | r74 |
| §1.17 `IsGeometricQuotient` | `Spec k[ε]/ε² → Spec k` | topological clauses hold; `k → k[ε]/ε²` not iso | Pass | r74 |
| `artinBootstrap` | `F = h_X`, atlas `𝟙` | flat, locally finitely presented, surjective | Pass | r74 |
| §2.14 `brownGersten_vanishing` | `Cone(A[0] → RΓ_Nis)` | `F(∅) ≃ A[1]`; `F(pt ⊔ pt) ≃ A[0]` | Pass | r74 |
| §2.14 dimension | `Spec ℝ` | `H^q_Nis = 0` / `H²_ét(𝔾_m) = ℤ/2` | Pass | r74 |
| §2.19 `upperShriek_smooth`, `_lci` | `𝔸¹_k → Spec k`; `Spec k → 𝔸¹` | `Ω¹[1] = O·dx[1]`; `H⁰ = H¹ = k` both sides | Pass | r74 |
| §3.3 degree | `V(z²) ⊂ ℙ²`; genus 2 | `χ(O(n)) = 2n + 1`, `deg O(1) = 2`; `deg O = 0 ≠ χ(O) = −1` | Pass | r74 |
| `Curve.vectorBundleDegree_pullback` | `z ↦ z²`, `E = O(1)` | `3 − 1 = 2` / `2 · 1` | Pass | r74 |
| §3.3 `curve_serre_duality_ext_hom` | node skyscraper | `dim Ext¹ = 2` / `dim Hom(K, K ⊗ ω) = 1` | Pass | r74 |
| §3.6 Picard torsors | pointless real conic | `Pic X = 2ℤ`, `Pic(ℝ) = ℤ`, cokernel `ℤ/2` | Pass | r74 |
| §5.2 pushforward | `𝔸¹ → Spec k`; degree-`d` point | `[0] ∼ 0`, `deg = 1`; `d[𝔸¹_k]` both sides | Pass | r74 |
| §5.5 `Chow.gysin` | origin along `z ↦ z²`; `{1} → 𝔾_m → 𝔸¹` | `2[pt]` for both `U`; `(ji)^! = i^!j^!` | Pass | r74 |
| §5.12 `bezout_inequality` | line with itself; skew lines; double line | `1 ≤ 1`; `0 ≤ 1`; `1 ≤ 2` | Pass | r74 |
| `hodge_index` | `ℙ¹ × ℙ¹`, `D = (1, −1)` | `D·H = 0`, `D² = −2 ≤ 0` | Pass | r74 |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² = x³ + x` over `𝔽_3` | `0 ≤ 0`; `\|4 − 4\| ≤ 2√3` | Pass | r74 |
| `grothendieck_existence` | `A = k[[t]]`; `𝔸¹_A` | `lim A/t^{n+1} = A`; `Σ tⁿxⁿ ∉ A[x]` | Pass | r74 |
| §5.10 `Num(E × E)` | `y² = x³ + x` over `𝔽̄_p` | `p ≡ 1 mod 4`: rank 4; `p ≡ 3 mod 4`: rank 6 | Pass | r74 |

### Remarks on untouched text

- none

## Not verifiable

- **Elaboration at main's pins.** Only the branch pins can be elaborated with the commands this review allows, so `Suggested.lean` was not elaborated at `2fd255d9`/`1b1ccf4b`.
- **Fulton 1998, de Jong 1996, Hartshorne 1977.** These were not re-checked: none is cited in a changed passage. r74 records Fulton as having no legal copy; the manifest settles de Jong and Hartshorne as uncertified.
- **Ownership against open pull requests.** It was checked through `scratch/overlaps.md` and `roadmaps grep` for the changed targets. The changed passages add no object.

## Source issues

- none

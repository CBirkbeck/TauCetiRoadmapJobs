# Review of PolynomialGaloisGroups (pull request #986 at 2e4a762)

**Verdict:** needs changes

:robot: AI review. Full review of the folder `TauCetiRoadmap/PolynomialGaloisGroups/` at the same head the previous review read (no line of the folder changed; nothing outside the folder changed; the merge base is `origin/main`). Every target was re-read, every locator re-opened in the cached texts, every cited declaration re-resolved at the pins (Mathlib `f6090c70`, Tau Ceti `358314d4`), the gate and the dependency check rerun, the file elaborated, and the worked examples recomputed. One blocking finding remains, the roadmap's identity against the other open proposal for the same folder; the mathematics is sound.

## R01 (P2) — One owner for the radical criterion, with its own roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, "This roadmap continues the completed Polynomial Galois Groups roadmap"; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:21`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`.

**Claim:** two open pull requests by the same author propose a roadmap in the folder `PolynomialGaloisGroups`, and both build the radical criterion and the separation theorem; a construction has one owner. This proposal also reuses the completed base's folder name and namespace, so "PolynomialGaloisGroups, Layer 1" names both the base's permutation layer and this continuation's radical criterion.

**Witness:** `roadmaps list` this round: `#763 PolynomialGaloisGroups @kim-em 88bb69d` and `#986 PolynomialGaloisGroups @kim-em 2e4a762`. `roadmaps grep 'isSolvable_gal_iff_forall_rootSet_mem_solvableByRad'` hits `Suggested.lean:50` here and `Suggested.lean:72` of the other proposal (its namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartIII` at its line 32); `roadmaps grep 'separable_specialize_quinticF20Spec'` hits line 80 here and line 84 there. `Completed/PolynomialGaloisGroups/Suggested.lean:60` on main opens the namespace of line 21. The open Part II proposal's README (line 26) cites "PolynomialGaloisGroups, Layers 0 and 1" for the base's root actions. The pull request's own description (data) names the other proposal as "the complete single-owner proposal".

**Exact repair:** decide the owner. Either this folder becomes a Part roadmap with its own folder name and namespace (the next free Part number after the open Part II and the other proposal's Part III; title and summary saying where the base stops, as the summary already does) and the other proposal drops its radical and separation layers and imports this roadmap by section; or this proposal is withdrawn in favour of the other. Retest: the two greps above hit one open proposal each, and "PolynomialGaloisGroups, Layer 1" resolves only to the base. No mathematical statement changes. Carried from the previous report's R01, which this head does not touch.

## R02 (P3) — The prime-degree obstruction is a corollary of pinned Mathlib and tests nothing the roadmap builds

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:68`–72, `not_mem_solvableByRad_of_prime_degree_two_nonreal`; `README.md:214`–215, "*Needs:* Mathlib `Polynomial.Gal.galActionHom_bijective_of_prime_degree`, `Equiv.Perm.not_isSolvable`, `isSolvable_gal_of_irreducible`."

**Claim:** the statement is proved from the three Mathlib lemmas its *Needs:* line names and nothing of Layers 1–3; it is an acceptance test of Mathlib, not of the finished roadmap.

**Witness:** a scratch file importing only `Mathlib` proved the statement verbatim at the pin in twelve lines (the three lemmas, `Group.isSolvable_of_surjective` at `Mathlib/GroupTheory/Solvable.lean:167`, and the four-line root count copied from the body of `galActionHom_bijective_of_prime_degree`, `Mathlib/Analysis/Complex/Polynomial/Basic.lean:132`–136); `lake env lean` returned exit 0 with no warning.

**Exact repair:** delete the declaration from `Suggested.lean`; the README keeps §2.3 as a target or moves it to the Layer 2 Examples (its content is unchanged and correct). Nonblocking.

## R03 (P3) — Cross-references to "Checks" name sections titled "Examples"

**Location:** `README.md:56`, "(Layer 1, Checks)"; `README.md:254`, "The hypothesis `(5 : F) ≠ 0` cannot be dropped (Checks)."

**Claim:** the README has no `**Checks.**` lists (it defines nothing, so none are required); the negative controls referred to are the bullets under `### Examples` at lines 164–171 and 289–293.

**Witness:** `grep -n 'Checks' README.md` returns lines 56 and 254 only; `grep -n '^### Examples' README.md` returns lines 153, 217 and 277.

**Exact repair:** write "(Layer 1, Examples)" and "(Examples)". Nonblocking.

## Previous findings

- R01 — not repaired: `README.md:3` and `Suggested.lean:21` are unchanged and the other proposal still states the same theorems at its current head `88bb69d`. Carried as R01.
- R02 (record the sources in `sources.toml`) — withdrawn. No roadmap on main carries a `sources.toml` in its folder (0 of the folders under `TauCetiRoadmap/`, 0 under `Completed/`); the manifest is the board package's file, which the package job writes, and a `sources.toml` inside this folder would be a stray file under the gate's rule. The three cited texts are in the sources cache and were read at their locators (below); nothing is missing.
- R03 (the module-system header) — repaired, and verified again: the gate reports `build=0` and `OK`; `lake env lean` of `Suggested.lean` exits 0 with the `#check` output and exactly seven `declaration uses sorry` warnings (lines 36, 50, 59, 68, 80, 89, 98).

No repair report marks any finding "not actionable in this package"; nothing settled is overridden.

## Verified sound

**Principles.** No route-specific shortcut: every statement is at the generality of its source or wider (§3.1 and the group form of §3.2 over any field with `5 ≠ 0`, where Dummit's remark at `dummit-quintics line 31`–32 excludes characteristics 2 and 5, and the README's characteristic-2 argument is correct, see the table). Nothing of the completed base is restated: the Scope section lists the base's layers as imported and the supplier contracts name their Tau Ceti declarations, all of which exist at the pin (below). No passage is copied: the Chapman argument is rewritten with the ℤ/5 labelling, the sources' wording is not reproduced. No algorithm, no sorry'd data, no `set_option`, no `lemma`, no process word, no pull-request number in the folder.

**Gate and dependency check.** My rerun of the gate printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The dependency command printed

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. The six `*Needs:*` lines cite Mathlib, Tau Ceti, Layer 1 (from §2.1), §2.1 (from §2.2), §3.1 and Layer 2 (from §3.2): every edge points down. `git diff --stat origin/main...HEAD` lists only the three files of the folder. The worker's citation resolver found no cross-roadmap citation and no Lean name missing; I confirmed the only cross-roadmap citations are to the completed base on main and to "Polynomial Galois Groups, Part II" as a non-supplier (scope exclusion), which is the open proposal `PolynomialGaloisGroupsPartII`.

**Sources, the seeded sample (read in the cached texts).** milne-fields is Milne's FT.pdf v5.10 (`line 28`, `49`); dummit-quintics is the author's copy of Math. Comp. 57 (1991); chapman-quintics is the one-page note on Dummit's page.

| Target | Locator | Found | Supports the statement as written |
|---|---|---|---|
| §1.1 | Milne Thm 5.34, p. 77 | `milne-fields line 3409`–3410, on page 77 (`line 3403`): characteristic 0, a polynomial is solvable in radicals iff its Galois group is solvable; the radical-tower definition at `line 1918`–1925 (p. 45) | Yes. Stated for polynomials, as the README says; the finite-Galois form is the splitting-field case, proved by the same induction (`line 3411`–3420). Lemma 5.33 at `line 3400`–3402 (p. 76), Prop 5.27 at `line 3267`–3270 (p. 74) as cited for the route. |
| §2.1 | Milne Thm 5.34, p. 77 | as above | Yes; Milne's "solvable in radicals" is a tower containing a splitting field, which is "every root in the radical closure", the README's convention (`README.md:52`–55). |
| §2.2 | Milne Thm 5.34 with the irreducible deduction | as above | Yes; the some-root direction is Mathlib's `isSolvable_gal_of_irreducible`, the other is §2.1 plus the existence of a root. |
| §2.3 | Milne Prop 4.16, p. 52 | `milne-fields line 2217`–2218 on page 52 (`line 2203`): irreducible of prime degree over ℚ, splits in ℂ with exactly two nonreal roots, then the group is `S_p` | Yes for the group; the radical conclusion and `p ≥ 5` are the README's own corollary via Abel–Ruffini, and `p ≥ 5` is necessary (table). |
| §3.1 | Chapman's note, whole page | `chapman-quintics line 8`–30 | Yes: the factorisation of `θ₂ − θ₃` and `θ₄ − θ₅` (`line 18`, `22`), the sign case (`line 26`–28), `5x₂` rational (`line 30`). The README's labelling `(a,b,c,d,e)` matches Chapman's `(1,4,3,5,2)` and `(3,4,1,5,2)`. Chapman works over ℚ; the README's characteristic-2 remark and the `5 ≠ 0` hypothesis are exactly what the argument needs (table). |
| §3.2 | Dummit Thm 1, p. 389; remark p. 387; §2 p. 388; formula (2) | `dummit-quintics line 102`–105 (Theorem 1, page 389 at `line 82`); `line 31`–32 (valid in characteristic ≠ 2, 5); `line 46`–52 (`F₂₀` generated by `(12345)`, `(2354)`, stabiliser of the invariant); `line 99`–101 (trinomial formula) | Yes. Dummit's "solvable by radicals" is the radical form; the group form is his proof's first sentence (`line 106`–110). The trinomial formula at `line 100`–101 equals `README.md:65` and the pinned `TauCeti.quinticF20Spec_specialize_X_pow_five_add_C_mul_X_add_C` (`TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Trinomial.lean:350`). |

No locator is flagged unverified in the README.

**Library declarations opened at the pins.** Mathlib: `solvableByRad` (`Mathlib/FieldTheory/AbelRuffini.lean:194`, the sInf of intermediate fields closed under `n`th roots, `n ≠ 0`), `solvableByRad.rad_mem` (`:201`), `isSolvable_gal_minpoly` (`:301`), `isSolvable_gal_of_irreducible` (`:313`, hypotheses `x ∈ solvableByRad F E`, `Irreducible q`, `aeval x q = 0`), `isCyclic_tfae` (`Mathlib/FieldTheory/KummerExtension.lean:563`, a primitive `finrank`-th root of unity in `K`), `IsSepClosed.hasEnoughRootsOfUnity` and `AlgebraicClosure.hasEnoughRootsOfUnity` (`Mathlib/RingTheory/RootsOfUnity/AlgebraicallyClosed.lean:29`, `:46`, under `[NeZero (n : F)]`, as the README says), `HasEnoughRootsOfUnity.exists_primitiveRoot` (`EnoughRootsOfUnity.lean:33`), `IsGalois.sup_right` (`Mathlib/FieldTheory/Galois/Basic.lean:575`, `K ⊔ L = ⊤` gives `IsGalois L E`), `IsGalois.tower_top_intermediateField` (`:157`), `IntermediateField.restrictRestrictAlgEquivMapHom_injective` (`:641`, under `K ⊔ L = ⊤` and `Normal F K`), `IsGalois.normalAutEquivQuotient` (`:449`), `IntermediateField.subgroupEquivAlgEquiv` (`:295`), `IsGalois.card_aut_eq_finrank` (`:107`), `Polynomial.Gal.galActionHom_bijective_of_prime_degree` (`Mathlib/Analysis/Complex/Polynomial/Basic.lean:128`, hypotheses `Irreducible p`, `p.natDegree.Prime`, `Fintype.card (p.rootSet ℂ) = Fintype.card (p.rootSet ℝ) + 2`, identical to the Lean statement at line 69–70), `Equiv.Perm.not_isSolvable` (`Mathlib/GroupTheory/Solvable.lean:297`, `5 ≤ Cardinal.mk X`), `Polynomial.Gal` constants (`uniqueGalZero`, `uniqueGalOne`, `uniqueGalC`, `PolynomialGaloisGroup.lean:85`–91), `Polynomial.rootSet` (`Mathlib/Algebra/Polynomial/Roots.lean:576`; `rootSet_zero`, `rootSet_C` at `:591`, `:586`), `IsSplittingField.lift` (`IsSplittingField.lean:111`), `Splits.adjoin_rootSet_eq_range` (`Mathlib/Algebra/Polynomial/Splits.lean:571`), `Normal.of_isSplittingField` (`Mathlib/FieldTheory/Normal/Basic.lean:63`), `Algebra.IsSeparable.of_integral` (`Mathlib/FieldTheory/Separable.lean:663`, under `[Algebra.IsIntegral F K] [CharZero F]`), `galAction_isPretransitive` (`PolynomialGaloisGroup.lean:181`), `exists_prime_orderOf_dvd_card` (`Mathlib/GroupTheory/Perm/Cycle/Type.lean:491`), `separable_iff_derivative_ne_zero` (`Separable.lean:298`, the step "irreducible and `5 ≠ 0` gives separable"). Tau Ceti: `Group.IsSolvable.exists_normal_index_prime` (`TauCeti/GroupTheory/Solvable.lean:78`, the type printed by the file's `#check`), `quinticF20Invariant` (`Resolvent/Quintic/Basic.lean:70`, the ℤ/5 formula of `README.md:60`), `quinticF20Spec` (`:202`), `ResolventSpec.specialize` (`Resolvent/Spec.lean:151`, total, the orbit product at the roots for monic `f` of degree `n`), `exists_isRoot_specialize_quinticF20Spec_of_isSolvable` (`Resolvent/Quintic/Solvable.lean:89`, needs `f.Separable`) and `isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` (`:104`, needs `f.Separable` and the sextic separable), `resolventSextic_X_pow_five_sub_X` (`Collision.lean:83`, `(X − 2)⁴ (X² + 16)`), `not_forall_exists_le_map_conj_of_isRoot_specialize_quinticF20Spec` (`:197`). Each supplier-contract sentence matches the hypotheses printed at these lines.

**Duplication by object.** `solvableByRad` occurs in Mathlib only in `AbelRuffini.lean` (no converse of Abel–Ruffini at the pin); in Tau Ceti it occurs only in three docstrings (`FieldTheory/GaloisGroups/Quintic.lean:133`, `Degree.lean:107`, `Label.lean:286`), each saying the statement there is about the group, not about radicals. No `Separable` theorem about `quinticF20Spec.specialize` exists in `Resolvent/Quintic/` beyond `separable_X_pow_five_sub_X` (`Collision.lean:75`). Among the sibling checkouts named in the brief, `PolynomialGaloisGroupsPartII` (open head) owns ramified cycle types and cites the base's permutation layers; it states no radical criterion. The only duplicate is the other open proposal for this folder, R01.

**Headlines and padding.** The README's seven headlines (§1.1, §2.1, §2.2, §2.3, §3.1, §3.2 group form, §3.2 radical form) are stated at lines 36, 50, 59, 68, 80, 89, 98; no headline is omitted and none is forced through a stand-in; the file defines nothing. One-tactic probe on a scratch copy at the pin (`first | rfl | simp | infer_instance | exact?`, then `exact?` alone on the three Layer 3 statements): none of the seven closes. The twelve-line Mathlib-only proof of §2.3 is R02. The worker's `#check` of all seven declarations (`signatures.md`) shows every binder of the README statements in the elaborated types: §1.1 `[CharZero F] [FiniteDimensional F E] [IsGalois F E]` and `ι`; §2.1, §2.2 `[CharZero F]`, §2.2 `Irreducible q`; §2.3 the four hypotheses; §3.1 and the group form `Monic`, `Irreducible`, `natDegree = 5`, `(5 : F) ≠ 0`; the radical form `[CharZero F]` without `5 ≠ 0`. Generality of README and Lean agree target by target (`README.md:45`–46 states exactly this split of hypotheses).

**Shape.** Title, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, three layers each with numbered prose targets carrying hypotheses, locators and `*Needs:*` lines, `### Examples` and `### Dependencies`, Downstream consumers, References: the upstream shape. Every example is a computed instance (table). Lean form: `module`/`public import` header (precedent on main: `TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean`), module docstring of the required content, namespace, section comments in README order, a docstring on every theorem, one `#check` pinning a Tau Ceti declaration.

**Adversarial table.** Values computed this round (plain-integer and finite-field arithmetic in a scratch script; the orbit of the invariant under all 120 permutations).

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| §1.1, trivial extension `E = F` | group of order 1 | derived length 0, solvable; every `ι x` is in `⊥ ≤ solvableByRad`: `true ↔ true` | holds |
| §1.1, nonabelian solvable, splitting field of `X³ − 2` | `S₃`, derived orders `6 → 3 → 1` | `(2^{1/3})³ = 2`, `ζ₃³ = 1`, so both generators and hence `E` lie in the closure: `true ↔ true` | holds |
| §1.1, nonsolvable, splitting field of `X⁵ − 4X + 2` | Eisenstein at 2; values at `−2, −1, 0, 1, 2` are `−22, 5, 2, −1, 26`; `5X⁴ − 4` has two real zeros | three real roots, two nonreal, degree 5 prime: group `S₅` (Milne 4.16), derived orders `120 → 60 → 60`; a radical root would make the group solvable (`isSolvable_gal_of_irreducible`): `false ↔ false` | holds |
| §1.1, normality needed: `E = ℚ(α)`, `α` a real root of `X⁵ − 4X + 2` | `[E : ℚ] = 5`; stabiliser of a point in `S₅` is `S₄`, fixing no other root, so `Aut(E/ℚ)` is trivial | trivial group solvable, `α` not radical: `true ↔ false` | `[IsGalois F E]` is in the type (line 38); hypothesis necessary |
| §1.1, ambient closure: `E = ℚ(ζ₇ + ζ₇⁻¹)` | `u = 2cos(2π/7)`: `u³ + u² − 2u − 1 = 8.9·10⁻¹⁶ ≈ 0`; group `C₃` | an `x ∈ E ∖ ℚ` with `xⁿ ∈ ℚ` has conjugates `±x` only, at most 2 < 3: `solvableByRad ℚ E = ℚ`; with `E` as ambient field `true ↔ false`, with the algebraic closure `true ↔ true` | the docstring at line 35 and `README.md:164`–171 are correct |
| §1.1, roots of unity: `N = |Gal|`, primitive `N`th root in `AlgebraicClosure F` | `AlgebraicallyClosed.lean:46` needs `NeZero (N : F)` | `N ≥ 1` and `CharZero F` give `(N : F) ≠ 0` | route input available |
| §1.1, induction step: `p = [M : K]` prime, `ζ^{N/p}` | `p ∣ |Gal(L/K)| ∣ |Gal(L/F₁)| ∣ N` | `ζ^{N/p}` has order `p` in `F₁ ⊆ K`; `isCyclic_tfae` applies; `α^p ∈ K ⊆` closure, `p ≠ 0`, so `α ∈` closure by `rad_mem` | route sound |
| §2.1, constants `q = 0`, `q = 1`, `q = C a` | `rootSet = ∅` (`rootSet_zero`, `rootSet_C`); `Gal` unique | `true ↔ true` (vacuous right side) | holds, as `README.md:184` says |
| §2.1, `X − 1`, `X² − 2`, `(X² − 2)²` | root sets `{1}`, `{±√2}`, `{±√2}` (sizes 1, 2, 2); groups `1`, `C₂`, `C₂` | `true ↔ true` in each case; repeated factors allowed | holds |
| §2.1 versus §2.2, `q = (X⁵ − 4X + 2)(X − 1)` | six roots, `1` radical; `q.Gal ↠ S₅` by restriction to the divisor | all-roots form `false ↔ false`; some-root form without irreducibility `false ↔ true` | `Irreducible q` is in the type (line 60); hypothesis necessary |
| §2.2, `X − 1`, `X² − 2`, `X⁵ − 4X + 2` | (solvable, some radical root) = `(true, true)`, `(true, true)`, `(false, false)` | both directions | holds |
| §2.3, `X⁵ − 4X + 2` | complex roots 5, real roots 3, `5 = 3 + 2`; degree 5 prime, `5 ≤ 5` | no root radical | holds |
| §2.3, bound `p ≥ 5` needed: `X² + 1`, `X³ − 2` | nonreal roots 2, 2; degrees 2, 3 prime; `5 ≤ 2`, `5 ≤ 3` false | roots `±i`, `2^{1/3} ζ₃ᵏ` radical; groups `C₂`, `S₃` solvable | `5 ≤ q.natDegree` necessary (line 69) |
| §2.3, irreducibility needed: `(X² + 1)(X − 1)(X − 2)(X − 3)` | degree 5, complex roots 5, real roots 3, `5 = 3 + 2` | roots `i, −i, 1, 2, 3` radical; group `C₂` | `Irreducible q` necessary (line 69) |
| §2.3, Lean hypothesis form | `galActionHom_bijective_of_prime_degree` at `Basic.lean:128`–131 | same three hypotheses verbatim | agrees; the scratch proof of R02 closes it |
| §3.1, trinomial sextic convention | `X⁵ + aX + b` with `(a, b) = (0, −2), (−5, −12), (−1, −1), (−1, 0)` | `X⁶ − 50000X`; `X⁶ − 40X⁵ + 1000X⁴ − 20000X³ + 250000X² − 66400000X + 976000000`; `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 3637X + 9631`; `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 512X + 256` | equal to `README.md:65` instantiated and to `Trinomial.lean:350`, `:369` |
| §3.1, separation for `X⁵ − 2`, `X⁵ − 5X − 12`, `X⁵ − X − 1` over ℚ | `gcd(R, R′)` | degree 0, 0, 0 | separable, as stated |
| §3.1, reducible control `X⁵ − X` | sextic above; `gcd(R, R′)` | degree 3; equals `(X − 2)⁴ (X² + 16)` coefficient by coefficient | inseparable: irreducibility necessary (`Collision.lean:83` agrees) |
| §3.1, Chapman's factorisation in the ℤ/5 labelling | three random rational 5-tuples; orbit of the invariant under `S₅` | orbit sizes 6, 3, 6 (the size-3 tuple had coincidences); the 5-cycle `a ↦ a + 1` fixes `Φ`; every pair of non-fixed values differs by `(xₐ − x_b)(x_c − x_d)[(xₑ − xₐ)(xₑ − x_b) − (xₑ − x_c)(xₑ − x_d)]` for some labelling: 10 of 10, 1 of 1, 10 of 10 pairs | `README.md:245`–247 correct |
| §3.1, the sign case and `5 ≠ 0` | `u² = v²`, `u, v ≠ 0` | `u = v` gives `xₐ = x_b`; `u = −v` forces `w = −z` from `uw = vz`, then `2xₑ = xₐ + x_b = x_c + x_d`, `5xₑ = Σ roots ∈ F` | `xₑ ∈ F` needs `5 ≠ 0`; in characteristic 2 the two cases coincide and only distinctness is used: characteristic 2 allowed, as `README.md:250`, `294` say |
| §3.1, `5 ≠ 0` necessary: `𝔽₅`, `f = X⁵ − X − 1`, roots `α + k` | `f` irreducible (no factor of degree ≤ 2); orbit values | two distinct values: `3` once (the fixed `Φ`) and `2` five times; sextic mod 5 is `X⁶ + 2X⁵ + 3X + 1 = (X − 3)(X − 2)⁵`; the README's difference `(−4)(1)[(3)(−1) − (1)(2)] = 20 ≡ 0` | inseparable, as `README.md:289`–293 say |
| §3.1 and §3.2, characteristics 2 and 3: `𝔽₂[t]/(t⁵ + t² + 1)`, `𝔽₃[t]/(t⁵ + 2t⁴ + 1)` | both irreducible; roots `α^{pᵏ}` distinct, 5 each | six distinct orbit values (separable sextic); exactly one value in the prime field (`1` in both); group `C₅` solvable | group form `true ↔ true`; `README.md:294`–295 correct |
| §3.2 group form, inputs of the Tau Ceti theorem | `Solvable.lean:104` needs `f.Separable`, sextic separable | `f′` has leading coefficient `5 ≠ 0`, so `f′ ≠ 0` and `separable_iff_derivative_ne_zero` gives `f.Separable`; sextic separable is §3.1 | both discharged by the stated hypotheses |
| §3.2 radical form, `X⁵ − 2`, `X⁵ − 5X − 12`, `X⁵ − X − 1` | `R(0) = 0`; `R(40) = 0` (`4096·10⁶` cancels, then `2560 − 1280 + 400 − 2656 + 976 = 0` millions); `R(1) = 6267`, `R(−1) = 13877`, `9631` prime (no prime factor `≤ 97`), `R(±9631) ≠ 0` | groups `F₂₀`, `D₅`, `S₅`: `true ↔ true`, `true ↔ true`, `false ↔ false` | holds |
| §3.2, `X⁵ − 5X − 12` versus Dummit's `X⁵ − 5X + 12` | `b ↦ −b` | only `b⁴` enters the sextic, same sextic; `X ↦ −X` identifies the splitting fields, same group `D₅` | `README.md:281`–283 consistent with Dummit's example 2 |
| Conventions, two senses of "solvable" | `X⁵ − 4X + 2` versus `X⁵ − 2` | group `S₅`/radical false; group `F₂₀`/radical true | never conflated in the README or the Lean |

**Finding witnesses as checks.** R01: two list entries, two grep hits per name. R02: scratch proof exit 0, no `sorry` warning. R03: two "Checks" occurrences, three "### Examples" headings.

## Not verifiable

- The seven theorems are admitted. Elaboration verifies their signatures and export; the computed instances and the sources' proofs do not constitute formal proofs.
- Ownership against open pull requests was checked through the `roadmaps list`, `grep` and `show` tools (index of 2026-11-03) and the sibling checkouts the brief names; the board's package list carries no `PolynomialGaloisGroups` package beyond its reports.
- Chapman's note is read from the author's page copy; I have no published version to compare.

## Source issues

- **Gap** in dummit-quintics at Theorem 1, printed p. 389 (`line 113`–118): the source says the five remaining resolvent roots are permuted transitively by a 5-cycle and so are roots of an irreducible quintic; it should first show the six resolvent roots are distinct, as chapman-quintics does; affects the proof.
- **Misprint** in dummit-quintics at example 2, printed p. 399 (`line 496`): the source says the sextic's `x³` coefficient is `+20000`; it should be `−20000`, as `160·(−5)³` and the stated root `40` require; affects a stated result.
- **Misprint** in milne-fields at Proposition 5.27 proof, printed p. 74 (`line 3273`): the source says `1, σ, …, σⁿ⁻¹` are distinct homomorphisms `F× → F×`; it should be `E× → E×`; affects the proof.
- **Misprint** in milne-fields at Theorem 5.34 proof, printed p. 77 (`line 3419`): the source says "Theorem 5.27"; it should be Proposition 5.27; affects nothing.

# Review of PolynomialGaloisGroups (pull request #986 at 645bf25)

**Verdict:** needs changes

:robot: AI review. Full review of `TauCetiRoadmap/PolynomialGaloisGroups/README.md` and `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean` at `645bf25`. The previous review read this same head, and the folder has not changed since (0 changed lines, nothing outside the folder), so its one blocking finding is re-examined against the current state of the other open proposal rather than against a diff. The gate passes at this head, the dependency check reports no problem, the file elaborates at the pins (Mathlib `f6090c70`, Tau Ceti `358314d4`) with exactly six `sorry` warnings, and every sampled locator and every cited declaration was found where the README says. The mathematics of the six stated theorems holds on every instance tried (table below). The one defect is the roadmap's identity: two open proposals for the same folder state the same theorems, and this one reuses the completed base roadmap's folder name and namespace.

## R01 (P2) — One owner for the radical criterion, with its own roadmap identity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:3`, "This roadmap continues the completed Polynomial Galois Groups roadmap"; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:23`, `namespace TauCetiRoadmap.PolynomialGaloisGroups`.

**Claim:** a construction has one owner, and an extension of a completed roadmap is a Part roadmap with its own folder. Two open pull requests by the same author propose a roadmap in the folder `PolynomialGaloisGroups`, and both state the radical criterion (finite Galois form and all-roots polynomial form), Chapman's separation theorem and Dummit's criterion in group and radical form. This proposal also reuses the completed base's folder name and namespace, so "PolynomialGaloisGroups, Layer 1" names both the base's permutation layer, which the open Part II proposal cites by that name, and this continuation's radical criterion.

**Witness:** `roadmaps list` today: `#763 PolynomialGaloisGroups @kim-em 8d40b6d` (a newer head than the previous review saw) and `#986 PolynomialGaloisGroups @kim-em 645bf25`. `roadmaps grep --fixed --lean-only 'isSolvable_gal_iff_forall_rootSet_mem_solvableByRad'` hits `Suggested.lean:52` here and `Suggested.lean:71` of the other proposal at `8d40b6d`; `separable_specialize_quinticF20Spec` hits line 73 here and line 83 there; the other proposal's line 61 states the finite Galois form under the name `isSolvable_iff_forall_mem_solvableByRad` and its line 103 the radical form of Dummit's criterion, in namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartIII`, with its README's Layer 3 (its lines 434–512) planning the same three targets. `Completed/PolynomialGaloisGroups/Suggested.lean:60` on main opens the namespace of line 23 here. The open Part II proposal's README cites "PolynomialGaloisGroups, Layers 0 and 1" (its line 26) and "PolynomialGaloisGroups, Layer 1" (its line 245) for the base's permutation layers.

**Exact repair:** decide the owner. Either this folder becomes a Part roadmap with its own folder name and namespace (the next free Part number after the open Part II and the other proposal's Part III; the summary already says where the base stops), and the other proposal drops its Layer 3 and imports this roadmap by section; or this proposal is withdrawn in favour of the other. Retest: the two greps above hit one open proposal each, and "PolynomialGaloisGroups, Layer 1" resolves only to the base. No mathematical statement changes. Carried from the previous report's R01, which this head does not touch and which the other proposal's new head does not resolve.

## Previous findings

- R01 — not repaired: `README.md:3` and `Suggested.lean:23` are unchanged, and the other proposal at its new head `8d40b6d` still states the same theorems (witness above). Carried as R01.
- R02 and R03 were already marked repaired by the previous report at this head; re-checked: `roadmaps grep` finds `not_mem_solvableByRad_of_prime_degree_two_nonreal` nowhere, `README.md:205`–213 states §2.3 as a prose target, and `grep -n Checks README.md` returns nothing.

No repair report marks any finding "not actionable in this package"; nothing settled is overridden.

## Verified sound

**Principles.** No route-specific shortcut: Layers 1–2 are stated for every field of characteristic zero and Layer 3 for every field with `5 ≠ 0`. Nothing of the completed base is re-planned (its Layers 0–6 and 9, titles checked at `Completed/PolynomialGaloisGroups/README.md:442`–1385, are imported by Tau Ceti declaration). No copied passage: every source statement is paraphrased with a locator. No algorithm. `Suggested.lean` has no definition, no sorry'd data, no `set_option`; the `module`/`public import` header is the form 14 roadmaps on main use and the gate accepts.

**Seeded sample, at the text.**

- §1.1 ↔ Milne Theorem 5.34: `milne-fields line 3409`–3410, on page 77 (marker `line 3403`): characteristic zero, a polynomial is solvable in radicals iff its Galois group is solvable. Milne's "solvable in radicals" (`line 1918`–1925) is a radical tower containing a splitting field, which is the README's Conventions (line 53–54). The README states the finite-Galois form and says "stated there for polynomials"; Milne's proof of ⟸ (`line 3411`–3420) is the field-tower induction the README's route follows, and ⟹ (`line 3421`–3440) is what Mathlib's `isSolvable_gal_of_irreducible` packages. Lemma 5.33 at `line 3400`–3402 (page 76, marker `line 3345`): restriction injects the Galois group over the larger field into the one over the base, as the route uses. Proposition 5.27 at `line 3267`–3270 (page 74, marker `line 3246`): with a primitive `n`th root of unity, a cyclic extension of degree `n` is `F[α]` with `αⁿ ∈ F`, as the route uses.
- §2.1, §2.2 ↔ Milne Theorem 5.34 (above); the some-root deduction is the README's own and is correct (an irreducible polynomial has a root; the other direction is `AbelRuffini.lean:313`).
- §2.3 ↔ Milne Proposition 4.16: `line 2217`–2218 (page 52, marker `line 2203`): irreducible of prime degree `p` over ℚ, splits in ℂ with exactly two nonreal roots, then the group is `S_p`. The README says "for the group" and adds `p ≥ 5` and the radical conclusion itself.
- §3.1 ↔ Chapman: `chapman-quintics line 8`–30, the one page. His argument is over ℚ ("is rational", `line 30`); the README's generalisation to `5 ≠ 0` is justified in its own text (irreducible of degree five is separable when the characteristic is not five; `5xₑ ∈ F` gives `xₑ ∈ F` when `5 ≠ 0`; the `u = v` branch covers characteristic two). I recomputed his factorisation (table).
- §3.2 ↔ Dummit Theorem 1: `dummit-quintics line 102`–105, page 389 (marker `line 82` is page 3 = printed 389); formula (2) at `line 84`–98 and the trinomial case at `line 99`–101, same page; the remark that the results hold in characteristic different from 2 and 5 at `line 31`–32 (page 387); the stabilizer of the invariant is `F₂₀`, `line 46`–52 (page 388). The README's group form drops the characteristic-two restriction; that is justified by Tau Ceti's `Solvable.lean:104`, which is over an arbitrary field, plus §3.1.

**Library declarations opened at the pin** (Mathlib `.lake/packages/mathlib/Mathlib`, Tau Ceti `.lake/packages/TauCeti/TauCeti`):

| Declaration | File:line | Hypotheses as the README states them |
|---|---|---|
| `solvableByRad` | `FieldTheory/AbelRuffini.lean:194` | `sInf` of intermediate fields closed under `n`th roots, `n ≠ 0`; matches Conventions line 50–52 |
| `solvableByRad.rad_mem` | `AbelRuffini.lean:201` | `n ≠ 0`, `x ^ n ∈ …` |
| `isSolvable_gal_minpoly` | `AbelRuffini.lean:301` | — |
| `isSolvable_gal_of_irreducible` | `AbelRuffini.lean:313` | `x ∈ solvableByRad F E`, `Irreducible q`, `aeval x q = 0` |
| `isCyclic_tfae` | `FieldTheory/KummerExtension.lean:563` | finite `L/K`, primitive root of order `finrank K L` in `K`; cyclic Galois ↔ `K⟮α⟯ = ⊤` with `α ^ n ∈ K` |
| `IsSepClosed.hasEnoughRootsOfUnity` | `RingTheory/RootsOfUnity/AlgebraicallyClosed.lean:29` | `[NeZero (n : F)] [IsSepClosed F]` (the `AlgebraicClosure` instance is line 46) |
| `HasEnoughRootsOfUnity.exists_primitiveRoot` | `RingTheory/RootsOfUnity/EnoughRootsOfUnity.lean:33` | — |
| `IsGalois.sup_right` | `FieldTheory/Galois/Basic.lean:575` | `K` finite Galois over `F`, `K ⊔ L = ⊤` |
| `IsGalois.tower_top_intermediateField` | `Galois/Basic.lean:157` | — |
| `IntermediateField.restrictRestrictAlgEquivMapHom_injective` | `Galois/Basic.lean:641` | `K ⊔ L = ⊤` |
| `IsGalois.normalAutEquivQuotient` | `Galois/Basic.lean:449` | finite Galois |
| `IntermediateField.subgroupEquivAlgEquiv` | `Galois/Basic.lean:295` | finite |
| `IsGalois.card_aut_eq_finrank` | `Galois/Basic.lean:107` | finite Galois |
| `Polynomial.Gal.galActionHom_bijective_of_prime_degree` | `Analysis/Complex/Polynomial/Basic.lean:128` | irreducible, prime `natDegree`, `card (rootSet ℂ) = card (rootSet ℝ) + 2` |
| `Equiv.Perm.not_isSolvable` | `GroupTheory/Solvable.lean:297` | `5 ≤ Cardinal.mk X` |
| `Polynomial.Gal`, `galActionHom`, `galAction_isPretransitive` | `FieldTheory/PolynomialGaloisGroup.lean:56, 204, 181` | pretransitivity needs `Irreducible p` and a `Fact` that `p` splits |
| `Polynomial.rootSet` | `Algebra/Polynomial/Roots.lean:576` | — |
| `IsSplittingField.lift`, `Splits.adjoin_rootSet_eq_range`, `Normal.of_isSplittingField`, `Algebra.IsSeparable.of_integral` | `SplittingField/IsSplittingField.lean:111`, `Algebra/Polynomial/Splits.lean:571`, `Normal/Basic.lean:63`, `Separable.lean:663` | — |
| `exists_prime_orderOf_dvd_card` | `GroupTheory/Perm/Cycle/Type.lean:491` | Cauchy, `[Fintype G]` |
| `Group.IsSolvable.exists_normal_index_prime` | Tau Ceti `GroupTheory/Solvable.lean:78` | finite, solvable, nontrivial; `#check` output in the elaboration log agrees |
| `quinticF20Invariant`, `quinticF20Spec` | Tau Ceti `Resolvent/Quintic/Basic.lean:70, 202` | the invariant is `∑ₐ xₐ²(xₐ₊₁xₐ₋₁ + xₐ₊₂xₐ₋₂)`, as Conventions line 60 |
| `ResolventSpec.specialize` | Tau Ceti `Resolvent/Spec.lean:151` | orbit product mapped through Vieta |
| `isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` | Tau Ceti `Quintic/Solvable.lean:104` | monic, separable, irreducible, degree 5, sextic separable; arbitrary field |
| `exists_isRoot_specialize_quinticF20Spec_of_isSolvable` | `Quintic/Solvable.lean:89` | same without the sextic hypothesis |
| `resolventSextic_X_pow_five_sub_X` | `Quintic/Collision.lean:83` | `(X − 2)⁴ (X² + 16)` |
| `not_forall_exists_le_map_conj_of_isRoot_specialize_quinticF20Spec` | `Quintic/Collision.lean:197` | the converse fails without separation |
| `quinticF20Spec_specialize_X_pow_five_add_C_mul_X_add_C` | `Quintic/Trinomial.lean:349` | the trinomial formula of Conventions line 65, over every commutative ring |

**Cross-roadmap citations resolved.** The completed base on main (`Completed/PolynomialGaloisGroups/README.md`, layer titles at lines 442–1385, and its line 318–320 saying the converse to Abel–Ruffini "is not a milestone here"); "Polynomial Galois Groups, Part II" as a scope exclusion only (open head `285e665`, namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartII`, no `solvableByRad` in its README). The worker's resolver found no missing citation or Lean name; I confirmed each of the six Lean names appears in the README and nowhere in the base's `Suggested.lean`.

**Gate and dependency check.** The worker's gate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. My dependency command printed

```text
depcheck: 207 roadmaps, 1701 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The six `*Needs:*` lines point only to Mathlib, Tau Ceti and earlier sections of this roadmap (§2.1 → Layer 1; §2.2 → §2.1; §3.2 → §3.1 and §2.1). `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration and binders.** `lake env lean` of `Suggested.lean`: exit 0, the `#check` output, six `declaration uses sorry` warnings (lines 38, 52, 61, 73, 82, 91), nothing else. The worker's elaborated signatures show every README hypothesis in every type: §1.1 `[CharZero F] [FiniteDimensional F E] [IsGalois F E]` and `ι`; §2.1 `[CharZero F]`; §2.2 `[CharZero F]`, `Irreducible q`; §3.1 and the group form `Monic`, `Irreducible`, `natDegree = 5`, `(5 : F) ≠ 0`; the radical form `[CharZero F]` without `5 ≠ 0`, as `README.md:45`–46 says. README generality equals Lean generality in all six.

**Headlines and padding.** The README's headlines are §1.1, §2.1, §2.2, §3.1 and the two forms of §3.2, all stated; §2.3 is named in the module docstring as a README target provable from three pinned Mathlib declarations, which I confirmed exist with the stated hypotheses. One-tactic probe on a scratch copy at the pin, each `sorry` replaced by `first | rfl | simp | infer_instance | exact?`: lines 38, 52, 61, 73 fall through to `sorry` (no tactic applies); at lines 82 and 91 `simp` only rewrites `IsRoot` to `eval … = 0` and leaves the goal unsolved. Nothing closes; no padding, no definition, no example.

**Duplication by object.** `solvableByRad` occurs in Mathlib only in `AbelRuffini.lean` (no converse of Abel–Ruffini at the pin) and in Tau Ceti only in docstrings (`Quintic.lean:133`, `Degree.lean:107`, `Label.lean:286`, each saying the statement is about the group, not `solvableByRad`). The only `Separable` facts about the specialized sextic in Tau Ceti are the pure-quintic case `Pure.lean:65` and the `X⁵ − X` counterexample `Collision.lean:113`; no separation theorem for irreducible quintics exists at the pin. The one duplicate owner is the other open proposal, R01.

**Adversarial table.**

| Statement | Instances tried | Values computed on each side | Result and change |
|---|---|---|---|
| §1.1, `E = F` | trivial group; `x ∈ F` | `IsSolvable` of the trivial group: true; `ι x ∈ solvableByRad` since `F ⊆` every intermediate field: true | `true ↔ true`; holds |
| §1.1, splitting field of `X⁵ − 2` over ℚ | group `F₂₀`, order 20 | solvable (derived series `20 → 5 → 1`); generators `2^(1/5)` (fifth power 2) and `ζ₅` (fifth power 1) radical | `true ↔ true`; holds |
| §1.1, splitting field of `X⁵ − 4X + 2` | values at `−2, −1, 0, 1, 2`: `−22, 5, 2, −1, 26` (three sign changes), `5X⁴ − 4` has two real zeros, Eisenstein at 2 | three real roots, two nonreal, group `S₅` by Milne 4.16; not solvable; no root radical by `AbelRuffini.lean:313` | `false ↔ false`; holds |
| §1.1, `IsGalois` needed: `ℚ(α)`, `α` a root of `X⁵ − 4X + 2` | `Aut(ℚ(α)/ℚ)` | stabiliser of `α` in `S₅` is `S₄`, fixes no other root, so the automorphism group is trivial: solvable; `α` not radical | `true ↔ false` without normality; hypothesis stated |
| §1.1, ambient field: cubic subfield `E` of `ℚ(ζ₇)` | `x ∈ E ∖ ℚ`, `xⁿ ∈ ℚ` | conjugates `xζ`, real and in `E`, so `ζ = ±1`; three distinct conjugates cannot lie in `{x, −x}`; hence `solvableByRad ℚ E = ℚ ≠ E` while `C₃` is solvable | `true ↔ false` with `solvableByRad F E`; the README's choice of the algebraic closure is necessary and stated |
| §1.1, roots of unity | `N = |Gal|`, `(N : F) ≠ 0` in characteristic zero | `AlgebraicallyClosed.lean:46` gives `HasEnoughRootsOfUnity (AlgebraicClosure F) N` from `NeZero (N : F)` | route input exists |
| §1.1, induction step | `H ◁ Gal(L/K)` of prime index `p` | `p ∣ |Gal(L/K)| ∣ N`, so `ζ^(N/p)` is a primitive `p`th root in `F₁ ⊆ K`; `isCyclic_tfae` applies with `finrank K M = p` | route closes |
| §2.1, `q = 0`, `q = 1`, `q = C a` | `rootSet`, `Gal` | `rootSet = ∅` (vacuous right side), `Gal` trivial | `true ↔ true`; holds |
| §2.1, `X − 1`, `X² − 2`, `(X² − 2)²` | root sets `{1}`, `{±√2}`, `{±√2}` | all radical; groups trivial, `C₂`, `C₂` | `true ↔ true`; repeated factors handled, as line 186 says |
| §2.1 vs §2.2, `(X⁵ − 4X + 2)(X − 1)` | six roots | `1` radical but `Gal ↠ S₅` (`Gal.restrictDvd_surjective`) | all-roots form `false ↔ false`; some-root form `false ↔ true`: `Irreducible` needed in §2.2 and stated |
| §2.2, `X − 1`, `X² − 2`, `X⁵ − 4X + 2` | irreducible | `(true, true)`, `(true, true)`, `(false, false)` | holds |
| §2.3, `X⁵ − 4X + 2`; `X² + 1`, `X³ − 2`; `(X² + 1)(X − 1)(X − 2)(X − 3)` | `5 = 3 + 2`, degree 5; degrees 2, 3 with `5 ≤ p` false; degree 5 reducible | no root radical; `±i` and `2^(1/3)ζ₃ᵏ` radical with groups `C₂`, `S₃`; roots `i, −i, 1, 2, 3` radical with group `C₂` | hypotheses `p ≥ 5` and `Irreducible` necessary and stated at line 205 |
| §3.1, Conventions formula vs Tau Ceti | `Trinomial.lean:349` | the seven coefficients agree term by term | consistent |
| §3.1, Chapman's identity | six random integer points with distinct coordinates | `Φ` has exactly six conjugates with stabiliser of order 20; the cycle `a ↦ a + 1` fixes `θ₁` and permutes the other five with no fixed point; each of the 10 differences of the five equals `±(xₐ − x_b)(x_c − x_d)[(xₑ − xₐ)(xₑ − x_b) − (xₑ − x_c)(xₑ − x_d)]` for a labelling (e.g. pair 1: `(0, 4, 1, 2, 3)`) | line 246–248 verified, 10/10 |
| §3.1, `𝔽₅`, `X⁵ − X − 1` | `a = b = −1`; labelling `(0, 4, 2, 1, 3)`, `x_k = α + k` | sextic `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 3637X + 9631 ≡ X⁶ + 2X⁵ + 3X + 1 = (X − 3)(X − 2)⁵` mod 5; the labelled difference is `(−4)(1)[(3)(−1) − (1)(2)] = 20 ≡ 0` | inseparable; `5 ≠ 0` necessary, as line 290–294 |
| §3.1, `X⁵ − X` over ℚ | reducible, separable | `(X − 2)⁴(X² + 16)` (`Collision.lean:83`) | `Irreducible` necessary, as line 288 |
| §3.1 and §3.2 in characteristic two, `𝔽₂`, `X⁵ + X² + 1` | no root in `𝔽₂`, not divisible by `X² + X + 1` (remainder 1); roots `α^(2^k)` in `𝔽₃₂` | six values of `Φ` distinct (`{1, 8, 10, 14, 19, 30}` as field elements), `θ₁ = 1 ∈ 𝔽₂` in the Frobenius numbering; group `C₅` solvable | sextic separable with a root in `𝔽₂`; `true ↔ true`, as line 295 |
| §3.2 group form inputs | `Solvable.lean:104` | its `hsep` follows from `Irreducible` and `5 ≠ 0` (an irreducible inseparable polynomial has degree divisible by the characteristic), its `hres` is §3.1 | route closes |
| §3.2 radical form, `X⁵ − 2`, `X⁵ − 5X − 12`, `X⁵ − X − 1` | trinomial formula | `X⁶ − 50000X`, `R(0) = 0`; `X⁶ − 40X⁵ + 1000X⁴ − 20000X³ + 250000X² − 66400000X + 976000000`, `R(40) = 0`; `R(1) = 6267`, `R(−1) = 13877`, `9631` prime (no prime factor below 99) | groups `F₂₀`, `D₅`, `S₅`; both sides `true, true, false`; the README's `−20000X³` is what the formula gives (Dummit's printed example has `+`, Source issues) |
| §3.2 radical form, `5 ≠ 0` dropped | `[CharZero F]` | `(5 : F) ≠ 0` holds in characteristic zero | no missing hypothesis |

**Finding witness as a check.** R01: two `roadmaps list` entries for the folder, two grep hits per name at the heads of today's index, the Part II README's two citations of "PolynomialGaloisGroups, Layer 1".

## Not verifiable

- The six theorems are admitted. Elaboration verifies their signatures; the computed instances and the sources' proofs do not constitute formal proofs.
- Ownership against open pull requests was checked through `roadmaps list` and `roadmaps grep` (index of 2026-11-04) and the sibling checkouts the brief names; the board's package list carries no `PolynomialGaloisGroups` package beyond its reports.
- Chapman's note and Dummit's paper are read from the author's page copies; I have no published copy of the note to compare, and Dummit's page numbers are taken from the printed running heads of the author's copy.

## Source issues

- **Gap** in dummit-quintics at Theorem 1, printed page 389: the proof says the five non-fixed resolvent values are roots of an irreducible quintic, without showing the six values are distinct; it should include Chapman's separation argument (the README's §3.1); affects the proof.
- **Misprint** in dummit-quintics at Examples (2), printed page 399: the sextic of `X⁵ − 5X − 12` is printed with `+20000X³`; it should be `−20000X³`, as the trinomial formula on page 389 gives with `a = −5`; affects nothing.
- **Misprint** in milne-fields at Proposition 5.27, printed page 74: the proof calls `1, σ, …, σⁿ⁻¹` homomorphisms `F× → F×`; it should be `E× → E×`; affects nothing.
- **Misprint** in milne-fields at Theorem 5.34, printed page 77: the proof cites "Theorem 5.27"; it should be Proposition 5.27; affects nothing.

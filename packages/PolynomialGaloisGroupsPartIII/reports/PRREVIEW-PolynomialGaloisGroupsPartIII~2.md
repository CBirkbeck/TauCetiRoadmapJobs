# Review of PolynomialGaloisGroupsPartIII (pull request #763 at 50620aa)

**Verdict:** needs changes

Two findings, both P3, both citations of what the pinned Tau Ceti already contains. The gate passes, the dependency check reports no problem, the four findings of the previous review are repaired, every sampled locator checks at its source, and the adversarial pass found no false statement.

## R01 (P3) — The orbit-sum adapters are in the pinned Tau Ceti; the README says they are not

**Location.** `TauCetiRoadmap/PolynomialGaloisGroupsPartIII/README.md` lines 243–249: "Induction–Restriction Layer 2.1, for the adapters that the pinned Tau Ceti does not contain: … `Gassmann.invariantOrbitSumBasis` … and `Gassmann.orbitSumEquivariant`". The same two names are repeated at lines 63, 657 and 672. The pull request description, "Library carriers": "… the restriction, quotient-invariant and orbit-sum adapters, which are not in the pinned library."

**Claim.** Four adapters are absent from the pin and are taken from the roadmap stand-ins of Induction–Restriction 2.1. Two of the four exist at the pin.

**Witness** (Tau Ceti 2fd255d, `TauCeti/RepresentationTheory/OfMulAction.lean`; both `#check` at the pin):

| Cited stand-in | Pinned declaration |
|---|---|
| `Gassmann.invariantOrbitSumBasis` | `TauCeti.invariantOrbitSumBasis`, line 297: for a group `I` acting on a finite `X` and a commutative ring `k`, a basis of `(ofMulAction k I X).invariants` indexed by `orbitRel.Quotient I X` |
| `Gassmann.orbitSumEquivariant` | `TauCeti.orbitSumEquiv`, line 385: for `I` normal in `D`, an equivalence of `ofMulAction k (D ⧸ I) (orbitRel.Quotient I X)` with `(ofMulAction k D X).quotientToInvariants I`; and `TauCeti.ofMulAction_invariantOrbitSumBasis_mk`, line 345, the form for an element normalizing `I` |

`Representation.ofMulAction_comp_subtype` (same file, line 122) identifies the restriction of `ofMulAction k G X` to a subgroup with the subgroup's own permutation representation, which is the bridge the 4.1 route needs between `Gassmann.restrictEquiv` and `TauCeti.orbitSumEquiv`.

**Repair.**
- Under *From Tau Ceti*, add `RepresentationTheory/OfMulAction.lean`: `TauCeti.invariantOrbitSumBasis`, `TauCeti.orbitSumEquiv`, `TauCeti.ofMulAction_invariantOrbitSumBasis_mk`, `Representation.ofMulAction_comp_subtype`.
- Reduce *From TauCetiRoadmap.RepresentationTheory* (lines 243–252) to `Gassmann.restrictEquiv` and `Gassmann.normalInvariantEquiv`. I found no named pinned declaration for these two: no `Representation.Equiv (ρ.comp f) (σ.comp f)` constructor and no equivalence of `quotientToInvariants` in `TauCeti/RepresentationTheory` or `Mathlib/RepresentationTheory`.
- Repoint line 63 ("orbit-sum adapters"), the 4.1 route (lines 655–657) and the 4.1 Needs line (lines 670–672) to the pinned names.
- Correct the "Library carriers" sentence of the description.

## R02 (P3) — The unramified case of "residue degrees from the Galois group" is pinned and not cited

**Location.** README lines 637–651 (4.1, second lemma): "So the multiset of residue degrees is the full cycle type of `φ` acting on the `I`-orbits of `Gal(E/ℚ) ⧸ H`."

**Claim.** The lemma is stated as new, with only the double-coset declarations as inputs.

**Witness.** `Ideal.fullCycleType_toPerm_quotient_eq_map_inertiaDeg`, `TauCeti/NumberTheory/NumberField/Frobenius/FixedField/SplittingType.lean` line 46: for `L/K` Galois number fields, `Q` unramified over `p`, `σ` an arithmetic Frobenius at `Q` and any `H`, the full cycle type of `σ` on `Gal(L/K) ⧸ H` is the multiset of residue degrees of the primes of `L^H` above `p`. This is the lemma at `I = 1`. The same folder has the inertia formula in number-field form: `Ideal.ramificationIdx_under_fixedField_eq_relIndex`, `Inertia.lean` line 177 (`e = [I(Q) : I(Q) ∩ H]`).

**Repair.** Cite `Ideal.fullCycleType_toPerm_quotient_eq_map_inertiaDeg` under *From Tau Ceti* and in the 4.1 Needs line, and say in one clause in the lemma that it extends that declaration from unramified primes to all primes by passing to the `I`-orbits. At `I = 1` the `I`-orbits are the cosets and the lemma's statement is the pinned one, so the two agree on the instance (the README's own Check `E = ℚ(i)`, `H = 1`, `p = 5`: cycle type `1, 1`, two primes of degree 1).

## Verified sound

**Previous review (head bae2d00), finding by finding.**

| Finding | At this head | Status |
|---|---|---|
| R01, two owners of the sufficient direction of Perlis | README lines 81–84: "The sufficient direction of Perlis' theorem has one owner, this roadmap's 4.1, and the conjugacy criterion … has one owner, 4.2"; lines 758–761 list Finite Group Invariants Layer 7 as consumer; the description names the order. | Repaired on this side (option (a)). `TauCetiRoadmap/FiniteGroupInvariants/README.md` at the head of #1708 still claims both directions (lines 95, 1266) and its `Suggested.lean` still states the iff (lines 497–503); that change belongs to #1708, which is not in the merge order. |
| R02, pinned almost-conjugacy API | README lines 213–228 cite `Subgroup.AlmostConjugate`, `.comap`, `Subgroup.exists_map_conj_comap_eq_iff`, `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`, `Representation.reverse_charpoly_ofMulAction`, `TauCeti.exists_S16_gassmann_pair`; `Suggested.lean` line 109 is `(hHK : H.AlmostConjugate K)`. | Repaired. The same defect remains for the orbit-sum adapters (R01 above). |
| R03, missing or deprecated names | `Ideal.doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure` (line 203), `Ideal.ramificationIdx_under_smul_eq_relIndex_inertia_of_isIntegralClosure` (lines 205, 643, 668), `HasEnoughRootsOfUnity.exists_isPrimitiveRoot` (lines 143, 489, 503). | Repaired; all three `#check`. |
| R04, padding | `isSolvable_gal_iff_exists_isRoot_quinticF20` is gone from `Suggested.lean`; README lines 567–571 keep the group form as prose with no backticked name of its own. | Repaired. |

**Gate, build, dependency check.**
- Gate at 50620aa: every counter 0, build OK.
- `lake env lean` on `Suggested.lean`: eight `sorry` warnings (lines 50, 62, 72, 84, 94, 107, 119, 128), nothing else.
- Dependency check output: `depcheck: 229 roadmaps, 2144 edges, 0 problem(s)`. No UPWARD or CYCLE line. The roadmap is at line 402 of the merge order; its suppliers (`Completed/PolynomialGaloisGroups`, `Completed/NumberFieldArithmetic`, `TauCetiRoadmap/RepresentationTheory/InductionRestriction`) are on main.
- Nothing outside the roadmap folder differs from main.
- Signatures: the nine elaborated types (`#check @name`, and `scratch/signatures.md`) agree with the README: 3.1 `CharZero F`, `FiniteDimensional`, `IsGalois`, `ι : E →ₐ[F] AlgebraicClosure F`; 3.2 `CharZero F`, any `q`; separation `NeZero (5 : F)`, monic, separable, irreducible, `natDegree = 5`; Dummit radical form `CharZero`, monic, irreducible, degree 5; 4.1 `NumberField E`, `IsGalois ℚ E`, `H.AlmostConjugate K`, every `n`; 4.2 finite Galois; 4.3 closed. No binder lost.
- One-tactic probe on scratch copies: `simp` fails on all eight theorems; `first | rfl | infer_instance | exact?` fails on all eight. No padding.

**Headline theorems.** Stated: the class count (1.1), the radical criterion for extensions (3.1) and polynomials (3.2), the separation of the sextic and Dummit's radical form (3.3), Gassmann's theorem (4.1), the conjugacy criterion (4.2), the existence theorem (4.3). Named in the module docstring as not statable, correctly: the labelled classification with the `6T6` comparison (1.3) and the unique Galois label (2.1); `TauCeti.numTransitiveGroups` is `0` above degree five at the pin (`TransitiveGroupLabel/Basic.lean` lines 66–70, 94), so `TauCeti.TransitiveGroupIndex n` is empty there.

**Seeded sample, read at the text.**

| Target | Locator | Result |
|---|---|---|
| 1.1 | `conway-hulpke-mckay` lines 282–285 (Table 2, p. 7) | degrees 2–11: primitive `1 2 2 5 4 7 7 11 9 8`, transitive `1 2 5 5 16 7 50 34 45 8` |
| 1.1, 1.3 | TransGrp at `165fc21`, `lib/trans.grp` lines 43–69, 212 | sixteen degree-six and seven degree-seven rows in the README's order; `6T6` generators `(3,6)`, `(1,3,5)(2,4,6)`; `TRANSLENGTHS` begins `1, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8` |
| 1.2 | no source; proof checked (below) | — |
| 2.1 | no source; follows from 1.3 and the pinned `TauCeti.isPretransitive_map_range_galActionHom_iff` (`Label.lean` line 124) | — |
| 3.1, 3.2 | `milne-fields` line 3409 | Theorem 5.34, p. 77 of v5.10: characteristic zero, solvable in radicals iff solvable Galois group |
| 3.3 | `dummit-quintics` lines 46–74, 99–105 | generators `(1 2 3 4 5)`, `(2 3 5 4)` of `F₂₀`; `θ₂ … θ₆` as `(1 2 3)`, `(1 3 2)`, `(1 2)`, `(2 3)`, `(1 3)` of `θ₁`; (2′); Theorem 1 on p. 389 |
| 3.3 | `chapman-quintics` lines 16–30 | both factorizations, `2x₂ = x₁ + x₃ = x₄ + x₅`, `5x₂` in the base field |
| 4.1 | `sutherland-arith-equiv` lines 252–256 (Theorem 2.10, p. 7) and 195–201 (Proposition 2.6, p. 5) | equal zeta functions iff rationally equivalent subgroups of the Galois closure; (ii) of 2.6 is the class-count condition |
| 4.2, 4.3 | `sutherland-arith-equiv` lines 22–31 (introduction, p. 1) | Gassmann's example and criterion; isomorphic iff conjugate, for a common Galois closure. The README's general finite Galois form is proved by its own lifting argument, checked below. |

**Adversarial table.**

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Conventions | `Fin 3`; `6T6` generators | `((0 1)(1 2)) 0 = (0 1) 0 = 1`, `((1 2)(0 1)) 0 = (1 2) 1 = 2`. `r = (0 2 4)(1 3 5)`, `t = (2 5)`: `r t r⁻¹ = (4 1)`, `r² t r⁻² = (0 3)`; with `r⁻¹ t r` the two are exchanged. | holds |
| 1.1 `TransitiveSubgroupClass`, count | `n = 0, 1, 2, 3, 4` | `n = 0`: one subgroup, transitive vacuously, 1 class, while the native count is 0, so the list starts at `n = 1`. `n = 1`: 1. `n = 2`: `⊥` intransitive, 1. `n = 3`: `A₃`, `S₃`, 2. `n = 4`: 3 + 1 + 3 + 1 + 1 = 9 subgroups, 5 classes. Lean list `[1, 1, 2, 5, 5, 16, 7, 50, 34, 45, 8]` = README = CHM. | holds |
| 1.2 descent criterion | proof; `{S₃, A₃}`; `{S₄, A₄, D₄, C₄}` | Minimal-order member `R` containing a conjugate `G′`: if `G′ < R`, a maximal `M ⊇ G′` is transitive, conjugate to a member of order `|M| < |R|`, contradiction. `S₃`: maximal subgroups `A₃` and three point stabilizers; hypothesis holds. `S₄` family: normal `V₄` is maximal and transitive in `A₄` (index 3) and `D₄` (index 2) and is not cyclic, so hypothesis fails. | holds |
| 1.3 degree-six table | sixteen rows | orders `6, 6, 12, 12, 18, 24, 24, 24, 36, 36, 48, 60, 72, 120, 360, 720`; even rows `4, 7, 10, 12, 15` (5); primitive `12, 14, 15, 16` (4 = CHM); solvable 12. `6T7` (edges of a tetrahedron): a transposition acts as `2²·1²`, a 4-cycle as `4·2`, both even. `6T8` (cosets of `C₄`): a 4-cycle has 8/4 = 2 fixed cosets, type `4·1²`, odd. | holds |
| 1.3 `6T6` comparison | `⟨r, t⟩` | `(2 5), (1 4), (0 3)` commute, generate `C₂³`, `r` cycles them: order 8 · 3 = 24; blocks `{0,3} → {2,5} → {1,4}` under `r`, fixed by `t`: quotient `C₃`; `t` odd. | holds |
| 1.3 restricted columns | `6T6`, `6T16` | pinned formulas (`Primitive.lean` line 114: `n ≠ 4 ∨ 3 ≤ j`; `Solvable.lean` line 142: `n ≠ 5 ∨ j < 3`) at `n = 6` give "primitive" and "solvable"; `6T6` has the block `{0,3}` and `S₆` is not solvable. | restriction needed, as stated |
| 2.1 unique label | `X⁶ − 2`; `Φ₇`; `(X² − 2)(X⁴ + 1)`; `(X² − 2)³` | `disc = (−1)¹⁵ · 6⁶ · (−2)⁵ = 2¹¹ · 3⁶`, odd exponent of 2, not a square; degree 12; `6T3`. `Φ₇`: regular `C₆`, `6T1`. Reducible: intransitive, no label. Inseparable: fails `Separable`. | holds |
| 3.1 radical criterion | `E = F`; cyclic cubic of `X³ − 3X + 1`; route | `E = F`: both sides true. Cubic: `x ∈ E ∖ ℚ` with `xⁿ ∈ ℚ` would have conjugates `±x` only, but has 3; so `solvableByRad ℚ E = ℚ` while the group `C₃` is solvable: the closure must be taken in the algebraic closure. Route: `|Gal(L/F(ζ))|` divides `N`, so each prime index `p` divides `N` and `ζ^{N/p}` is in the base of every step. | holds |
| 3.2 all-roots form | `q = 0`; `(X⁵ − 4X + 2)(X − 1)`; `X³ − 2` | `q = 0`: trivial group, empty root set, both true. Product: `f(−2) = −22`, `f(0) = 2`, `f(1) = −1`, `f(2) = 26`, three real roots, `S₅`; root `1` radical, both sides false. `X³ − 2`: prime degree 3, two nonreal roots, `S₃` solvable: `p ≥ 5` needed. | holds |
| 3.3 separation | propagation; Chapman's step; characteristic 2 and 5 | A 5-cycle lies in exactly one of the six conjugates of `F₂₀` (24 five-cycles, 4 each), so it fixes one `θ` and cycles five; any coincidence gives `θ₂ = ⋯ = θ₆`. Dividing the two bracket equations gives `(x₂ − x₁)² = (x₂ − x₃)²`; sign `+` gives `x₁ = x₃`; sign `−` gives `2x₂ = x₁ + x₃ = x₄ + x₅`, `5x₂ ∈ F`. Characteristic 2: only the `+` case. `𝔽₅`, `x_j = α + j − 1`: bracket `1·(−2) − (−1)(−3) = −5 = 0`; (2′) at `a = b = −1` mod 5 is `X⁶ + 2X⁵ + 3X + 1 = (X − 3)(X⁵ − 2) = (X − 3)(X − 2)⁵`. | holds; `5 ≠ 0` sharp |
| 3.3 Dummit radical form | `X⁵ − 2`; `X⁵ − X − 1`; `X⁵ − 5X − 12`; `X⁵ − X` | (2′) at `(0, −2)`: `X⁶ − 3125·16·X = X⁶ − 50000X`, root 0. At `(−1, −1)`: constant `256 + 9375 = 9631`, no divisor in `2…98`; values at `±1` are `6267`, `13877`, at `±9631` nonzero. At `(−5, −12)`: value at 40 is 0. At `(−1, 0)`: `(X − 2)⁴(X² + 16)` expands to `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 512X + 256`. | holds |
| 4.1 Gassmann | `n = 0`; `V₄`; `ℚ(i)` at 5; orbit count; product | `n = 0`: 1 and 1 (`dedekindZetaCoeff_zero`). `ℚ(√2), ℚ(√3), ℚ(√6)`: at 3 `0, 1, 1`; at 5 `0, 0, 2` (2, 3 non-residues mod 5; 6 ≡ 1). `ℚ(i)`: 2. Orbit of `τH` under `D` has `[D : D ∩ τHτ⁻¹] = e·f`, under `I` has `[I : I ∩ τHτ⁻¹] = e`, so `f` `I`-orbits forming one `φ`-cycle. `(1 − Z)²(1 − Z²)`: lowest term `−2Z`, recovers `{1, 1, 2}`. | holds |
| 4.2 conjugacy criterion | `H = K`; `H = 1`, `K = ⊤`; `S₃`; `S₄`; infinite extension | `g = 1`. Degrees `[E : F]` and 1: both sides false. `X³ − 2`: order-2 subgroups conjugate, `ℚ(∛2) ≅ ℚ(ζ₃∛2)`. `X⁴ + X + 1`: `disc = −27 + 256 = 229`, cubic `x³ − 4x − 1` has values `−4, 2` at `±1`: `S₄`; normal and non-normal `V₄` not conjugate, one sextic field Galois, the other not. Without finite dimension a non-closed subgroup and its closure have the same fixed field: `FiniteDimensional` is needed and present. | holds |
| 4.3 existence | the pair in `S₁₆` | `16!/16 = 15! = 1307674368000`. `C₄ × C₄`: 1, 3, 12 elements of orders 1, 2, 4. `Q₈ × C₂`: order 2: `(−1, 0), (1, 1), (−1, 1)`, 3; order 4: 6 · 2 = 12. Regular action: types `1¹⁶`, `2⁸`, `4⁴`. Supplier's nonconjugacy `¬ ∃ σ, H.map (MulAut.conj σ) = K` is the right-hand side of 4.2. Both fields live in `Type`. | holds |

**Library declarations opened at the pins** (Mathlib 1b1ccf4, Tau Ceti 2fd255d). One scratch file `#check`s 58 names with no unknown constant among those the README cites: every declaration of *From Mathlib* (among them `Ideal.Quotient.stabilizerHom_surjective`, `RingTheory/Invariant/Basic.lean` line 365; `Ideal.Quotient.ker_stabilizerHom`, `RingTheory/Ideal/Over.lean` line 357; `isCyclic_tfae`, `FieldTheory/KummerExtension.lean` line 583; `IsGalois.sup_right`, `FieldTheory/Galois/Basic.lean` line 583; the `IsCyclic` instance, `FieldTheory/Finite/Basic.lean` line 409) and of *From Tau Ceti* (`Subgroup.AlmostConjugate`, `GroupTheory/AlmostConjugate.lean` line 92, with `almostConjugate_iff` 99 and `.comap` 179; `Subgroup.exists_map_conj_comap_eq_iff`, `Algebra/Group/Subgroup/Conjugates.lean` 182; `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`, `RepresentationTheory/CharacterTable/FixedPointCount.lean` 183, `CharZero k`; `Representation.reverse_charpoly_ofMulAction`, `LinearAlgebra/Charpoly/Permutation.lean` 186; `TauCeti.exists_S16_gassmann_pair`, `GroupTheory/AlmostConjugate/GassmannPair.lean` 66; the double-coset declarations in `IntegralClosure.lean` 101, 205 and `DecompositionOrbits.lean` 135, 179; `Subgroup.fixedField_map_conj`, `FieldTheory/Galois/FixedField.lean` 488; `TauCeti.dedekindZetaCoeff` and its two lemmas, `Trivial.lean` 51, 56, 60; the label, column and classification theorems; the quintic resolvent declarations; `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`, `Symmetric/Realization.lean` 44). No pinned declaration states 3.1, 3.2, the separation of the sextic, 4.1, 4.2 or 4.3: `solvableByRad` occurs in three Tau Ceti files, none with the converse; `AlmostConjugate` occurs in five, none about number fields.

**Cross-roadmap citations resolved.**
- `Completed/PolynomialGaloisGroups/README.md`: degrees 6–11 excluded (line 57); the radical converse not planned (line 1037).
- `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`: Layer 2.1 (line 346) has `Gassmann.restrictEquiv` (393), `Gassmann.normalInvariantEquiv` (399), `Gassmann.invariantOrbitSumBasis` and `Gassmann.orbitSumEquivariant` (415–416); Layer 2.2 (433). The two "found nowhere" leads of the worker's citation list are these roadmap names, which exist there.
- `Completed/NumberFieldArithmetic/README.md`: Layer 1.4 (line 548); arithmetic equivalence excluded (line 2244).
- BelyiMaps: Layer 1.6 on main (line 879) asks for labels through degree eleven; its open revision declares the family as a gap on the base roadmap (lines 81–83, 229–230). 1.3 here is that family.
- The open PolynomialGaloisGroups revision (#986) still owns the radical criterion, the separation and Dummit's criterion at its head (README lines 17–24). It is not in the merge order and this roadmap is, so the single owner is Layer 3 here; closing the duplicate is #986's change.
- No other open pull request changes this folder, and none drops an id cited here.

## Not verifiable

- Butler–McKay, Comm. Algebra 11 (1983): paywalled, marked uncertified in the README; its counts were checked against Conway–Hulpke–McKay Table 2 and TransGrp.
- Perlis, J. Number Theory 9 (1977), Theorem 1: paywalled, marked uncertified; the statement was read in Sutherland's Theorem 2.10.
- Dixon–Mortimer, Theorem 2.6A: Springer, outside the sample, consumed through the base roadmap.
- The description of #986, which this description says names this pull request as owner: not among the files given.

## Source issues

- **Gap** in dummit-quintics at Theorem 1, proof, p. 389: the source says a rational `θᵢ` puts the Galois group in its stabilizer and the other five roots form an irreducible quintic, without showing the six `θᵢ` distinct; it should be preceded by a proof of distinctness, as in Chapman's 1992 note (`chapman-quintics` lines 16–30), which needs irreducibility and `5 ≠ 0`; affects the proof.

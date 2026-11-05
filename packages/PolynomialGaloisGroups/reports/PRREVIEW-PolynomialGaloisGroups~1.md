# Review of PolynomialGaloisGroups (pull request #763 at cbb3352)

**Verdict:** rejected

The roadmap this pull request rewrites is finished and archived: on main it lives at
`Completed/PolynomialGaloisGroups/`, every listed layer is proved, and the merge base of this
branch is that archived text up to two relative paths. The branch re-creates it under the active
folder with four new programmes (a classification of transitive groups through degree 11 from a
160-row generator table, a characteristic-zero radical criterion, an `S₁₆` Gassmann fixed-field
example, and a cross-base root dictionary with elementary embedding examples). A completed roadmap
is built on, never re-planned; the new material belongs in a Part roadmap of its own. Edits to
this branch cannot repair that, so the verdict is rejected rather than needs changes. The
findings below are recorded so that the author can carry the salvageable mathematics into a new
roadmap; the arithmetic of the worked examples checked out everywhere I computed it.

Gate at this head (worker's run, confirmed by my own elaboration): FAIL on tex, residue,
sorry-examples, imports and build. Dependency check: `depcheck: 155 roadmaps, 1063 edges,
0 problem(s)`.

## R01 (P1) — Re-plans a completed roadmap instead of extending it in a Part II

Location: `TauCetiRoadmap/PolynomialGaloisGroups/README.md` lines 32–40 ("Complete classification
of the transitive subgroups of `Sₙ`, for `1 ≤ n ≤ 11`"), lines 46–51 (Layer 10), lines 894–985
(Layer 1D), lines 1683–1716 (Gassmann example), lines 1718–1850 (Layer 10).

Claim: the pull request "develops the full polynomial Galois-group programme" by amending the
existing roadmap in place.

Witness: main has `Completed/PolynomialGaloisGroups/README.md` (1699 lines) whose scope says
"Complete classification … for `n ≤ 5` only" and lists "Completeness of the classification of
transitive subgroups in degrees 6 to 11" as outside the roadmap; its `STATUS.md` says "Nothing
within the stated scope remains." The merge base of this branch equals that archived README
except two link paths (`diff` shows only lines 139 and 1573). The open roadmap
`PolynomialGaloisGroupsPartII` already continues this roadmap in another direction (ramified
merging), so a second Part is the only legal home for the new layers.

Repair: close this pull request without merging. Open a new roadmap (for example
`TransitiveGroupsThroughDegreeEleven` for Layer 1D and the generic label corollary, and a separate
roadmap for the radical criterion and the elementary embedding examples), whose introduction says
where `PolynomialGaloisGroups` stops, which cites the completed roadmap's Layers 0, 1, 1C/6 by
section, and which carries the `Suggested.lean` of only its own headlines. The Belyi Maps revision
at its open head cites "PolynomialGaloisGroups Layer 1D"; it must be repointed to the new owner.

## R02 (P1) — Supplier declarations that exist nowhere: Number Field Arithmetic Layer 8.4

Location: `README.md` line 162 (contract row "Number Field Arithmetic 3.8, 8.4"), lines
1689–1711 (`*Needs:*` of the Gassmann example), line 2061 (references table).

Claim: Number Field Arithmetic Layer 8.4 supplies `Gassmann.dedekindZeta_eq_of_almostConjugate_of_one_lt_re`,
`Gassmann.dedekindZetaCoeff_eq_of_almostConjugate`, `Gassmann.dedekindZeta_eq_of_almostConjugate`
and `Gassmann.not_algEquiv_fixedFields_of_not_conj`, and Layer 3.8 supplies a named instance
`TauCetiRoadmap.NumberFieldArithmetic.numberField_splittingField`.

Witness: `Completed/NumberFieldArithmetic/README.md` has Layer 8 subsections 8.1–8.3 only (lines
2140, 2160, 2206) and lists "arithmetic equivalence and Gassmann triples" under "Related
mathematics that no milestone here covers" (line 2244). Its 3.8 (line 990) asks for the instance
but names no declaration; its `Suggested.lean` line 1110 states it as an anonymous `example`.
`roadmaps grep` for the four Gassmann names and the instance name finds them only in this pull
request's README. The Induction–Restriction roadmap on main (`TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`
lines 346–460) does supply `Gassmann.almostConjugate_comap`, `Gassmann.not_conj_comap` and
`Gassmann.exists_S16_gassmann_pair`, so those three citations resolve.

Repair: in the new roadmap, state the arithmetic-equivalence theorem (equal Dedekind zeta
coefficients of fixed fields of almost-conjugate subgroups) as a target of that roadmap, or declare
it as a gap against a Number Field Arithmetic Part II that owns it; do not cite a section of a
completed roadmap that excludes it. The number-field instance on the splitting field is a
one-line consequence of `Polynomial.IsSplittingField.finiteDimensional` and can be a target of
the consumer.

## R03 (P1) — A 160-row database export copied from the GAP transitive-groups library

Location: `TauCetiRoadmap/PolynomialGaloisGroups/HighDegreeReferenceData.md` lines 1–170;
`README.md` lines 902–913 ("Fixed inputs and values").

Claim: the table "is a fixed mathematical input, not a proof"; the roadmap's own scope (lines
70–75) says database exports are outside it but carves out this table as "secondary data".

Witness: gap-transgrp-trans lines 43–69 list the degree-6 and degree-7 entries of GAP's
`lib/trans.grp`; every row of the table is that entry with each point decreased by one and the
generators in the same order (for example gap-transgrp-trans line 48 against the table's `6T6`,
line 56 against `6T12`, line 66 against `7T4`). The file header (gap-transgrp-trans line 10) is a
copyright notice of RWTH Aachen; the data is reproduced wholesale, not described.

Repair: delete the file. A roadmap that classifies transitive groups in a degree names its
representatives by locator (GAP `TransitiveGroup(n, j)` at the cited commit, or the LMFDB page
`nTj`) and lets the implementer construct them; where a representative is needed in the text
(the `6T6` comparison), two generators written in the author's words are fine, 160 rows are not.

## R04 (P1) — A certificate-search algorithm stated as targets

Location: `README.md` lines 935–951 ("A finite proof producer, not a completeness oracle"), line
1908 ("Every polynomial in the following list was checked with PARI, through `polgalois` and
`nfdisc`").

Claim: Layer 1D's completeness is to be proved by "a subgroup-classification certificate with
concrete generator lists and conjugating permutations", a recursion on subgroup orders with a
verifier whose "soundness, termination by strict order, local-covering proofs and final matching
are named targets", with "a finite fallback" that enumerates all subgroups of `Sₙ`.

Witness: this is a computational procedure (a verifier, a recursion, a fallback enumeration), not
a theorem with hypotheses; no statement in the paragraph has a conclusion a reader can check, and
`Suggested.lean` states nothing for it.

Repair: in the new roadmap, state the mathematics: for each degree `6 ≤ n ≤ 11`, every transitive
subgroup of `Sₙ` is conjugate to exactly one listed representative, with the proof route by cases
(imprimitive groups through the wreath embedding of Layer 1 and the classifications in the block
degrees; primitive groups through the known lists in degree ≤ 11, with the source cited by
theorem and page). A "fallback that enumerates subgroups" is not a target. PARI checks are
provenance and do not belong in the README.

## R05 (P2) — Companion Lean files: a copy of a later Tau Ceti module, and alias duplicates

Location: `TauCetiRoadmap/PolynomialGaloisGroups/PrescribedGenerators.lean` lines 11–17;
`TauCetiRoadmap/PolynomialGaloisGroups/Compatibility.lean` lines 14–48; `Suggested.lean` lines
1–2 (`import TauCetiRoadmap.PolynomialGaloisGroups.Compatibility`,
`import TauCetiRoadmap.PolynomialGaloisGroups.PrescribedGenerators`).

Claim: the six generator equalities are "local conservative comparisons" and the aliases are
"conservative abbreviations"; the README says "no milestone depends on … a future version".

Witness: `PrescribedGenerators.lean` says its bodies are copied from
`TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Generators.lean` at commit `65066c0`; the pinned
Tau Ceti (`a91d3aa`) has no such file (`TauCeti/GroupTheory/Perm/TransitiveGroupLabel/` holds
Affine, Basic, Classification, Cyclic, Dihedral, Even, KleinFour, Order, Parity, Primitive,
Solvable). So the object has an owner in the library after the pin, and this folder is a second
one. `Compatibility.lean` re-declares `fullCycleType`, `numTransitiveGroups`,
`TransitiveGroupIndex`, `referenceSubgroup`, `TransitiveGroupLabel` as `abbrev`s with `rfl`
bridges: an API catalogue of names the library already has. The gate's imports rule refuses both
imports.

Repair: delete both files; `Suggested.lean` imports `Mathlib` and `TauCeti.*` modules only. The
six exact-generator facts are README Checks of the completed roadmap's Layer 1C (they are proved in
Tau Ceti after the pin and will be cited when the pin advances). Belyi Maps consumes the native
names `TauCeti.referenceSubgroup` and friends directly.

## R06 (P2) — The Layer 1D headline is statable but absent, and the Lean file pins its negation

Location: `Suggested.lean` lines 2276–2282 and `Compatibility.lean` line 46
(`numTransitiveGroups_eq_zero_above_five`); `README.md` lines 915–926 ("replace them by the
proved `11<n` boundary … They are not retained as false equalities for degrees 6–11").

Claim: the headline of Layer 1D is `∃! j, TransitiveGroupLabel j G` for every transitive
`G ≤ Sym(Fin n)`, `1 ≤ n ≤ 11`, and the exact `6T6` equality.

Witness: `Suggested.lean` states no declaration for Layer 1D and its module docstring (lines
92–160) does not say the headline is not statable. It is statable at the pins without the
evolved `numTransitiveGroups`: `Subgroup.closure {[(2 : Fin 6), 5].formPerm, …}` and
`∃! H ∈ list, ∃ σ, G.map (MulAut.conj σ) = H` use only Mathlib carriers. Instead the file
elaborates `numTransitiveGroups n = 0` for `5 < n` as an `example` (line 2281) and the companion
exports it as a theorem, the equality the README itself calls false after evolution. README and
Lean disagree on the roadmap's central new claim.

Repair: in the new roadmap's `Suggested.lean`, state the degree-6 (or degree-6-to-11)
classification with explicit closures as the headline, with `sorry`, and the `6T6` block-system
and quotient statements; do not restate the pinned boundary theorem.

## R07 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean` line 169 (`splittingField_algEquiv_of_baseEquiv`), line 3570
(`finiteGalois_solvable_implies_image_mem_solvableByRad`), lines 3483–3547 (twelve admitted
`example`s), and the roughly 400 proved `example`s that pin library declarations (for instance
lines 2276–2295, 2827–2838).

Claim: the file "suggests Lean forms for the milestones".

Witness: `splittingField_algEquiv_of_baseEquiv` is proved in place from
`Polynomial.IsSplittingField.algEquiv` (a library lemma, and the source of the four `letI`/`haveI`
linter warnings at lines 176–178 and 186 that fail the build rule "`sorry` the only warning").
`finiteGalois_solvable_implies_image_mem_solvableByRad` is the `.mp` direction of the theorem
stated nine lines above it. The twelve admitted examples (`Irreducible (X ^ 2 + 3 : ℚ[X])`,
`Module.finrank ℚ ℚ⟮α⟯ = 3`, `¬ IsSplittingField ℚ ℝ (X ^ 2 - 2)`, …) are worked examples of
elementary field theory, and an admitted `example` is never written. My one-tactic probes on
seven of them (`simp`, `infer_instance`, `unfold; ring`, `irreducible_of_degree_le_three_of_not_isRoot`)
closed none, so they are not trivial, but they are Checks, not headlines.

Repair: delete the proved helper, the one-direction duplicate and the twelve admitted examples from
`Suggested.lean` (the README keeps them as Checks). Keep `finiteGalois_iff_image_mem_solvableByRad`
as the Layer 10 headline, in the new roadmap.

## R08 (P3) — Gate failures: TeX, residue, admitted examples, imports, build

Location: `README.md` line 2136 (`xⱼ ↦ x_{j−1}` outside a code span), line 1040 ("Mathlib's own
TODO in `Resultant/Basic.lean`"); `Suggested.lean` lines 1–2 (imports), 176–178 and 186
(linter warnings), 3483–3544 (twelve `sorry`'d `example`s).

Witness: the worker's gate output and my elaboration (`lake env lean` on the file: 16 `sorry`
warnings, 4 `letI`/`haveI` linter warnings, no error).

Repair: put the subscript in a code span; write "the product-form statement Mathlib's resultant
file leaves open" instead of "TODO"; see R05 for the imports and R07 for the examples and the
helper.

## R09 (P3) — README shape, process residue and library claims that are false at the pin

Location: `README.md` lines 92–140 ("Suggested home", "How to read the milestone lists", "private
provenance ledger"), 181–197 ("At the pinned revision the native reference family is empty",
"today's empty `TransitiveGroupIndex 6`"), 251–259 ("The actual pinned native definition has only
the first five entries … evolution target"), 732 ("Mathlib's `GroupAction/Jordan.lean` records the
same statement as a `proof_wanted`"), 365–366 ("`IsSolvableByRad` is deprecated there since
2026-02-28"), 2069–2103 ("*Not inspected for this pass*", five times).

Witness: the README keeps the pre-roadmap form (no `## Scope and ownership`, `## Exact supplier
contracts`, `## How to read the build`; layers without `### k.n` subsections, `### Examples` and
`### Dependencies`), which the archived roadmap inherited and which a rewrite must bring to the
current shape. At the pin, `Mathlib/GroupTheory/GroupAction/Jordan.lean` contains no
`proof_wanted`; `Mathlib/FieldTheory/AbelRuffini.lean` contains no `IsSolvableByRad` and no
deprecation (the name occurs only in `Archive/Wiedijk100Theorems/AbelRuffini.lean` line 21, in a
docstring). "Not inspected for this pass" and "pinned revision … today" are process narrative.
No `sources.toml` records the cited works (the worker reports none).

Repair: in the new roadmap, use the current shape, state what a library has only after opening it
at the pin, and record every cited work in `sources.toml`.

## R10 (P3) — The Layer 1D instruction to delete a native theorem that three native files use

Location: `README.md` lines 921–925 ("The current theorem `numTransitiveGroups_eq_zero_of_five_lt`
… on evolution replace them by the proved `11<n` boundary and refactor their uses").

Witness: at the pin that theorem is used by
`TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Primitive.lean` line 130, `Parity.lean` line 65
and `Solvable.lean` line 152, each closing a case split "no reference groups above degree five";
after evolution those proofs need the full degree-6-to-11 invariant tables, which the README
lists only as "complete basic API for every new row". The dependency is real but it is not
written as a target with hypotheses.

Repair: in the new roadmap, make "parity, primitivity and solvability of every reference row in
degrees 6–11" named targets with their values (for `6T6`: odd, imprimitive, solvable), since the
native primitivity, parity and solvability theorems over all degrees depend on them.

## R11 (P3) — Sources: locators missing for the classification and the generator data

Location: `README.md` lines 971–976 (Layer 1D *Sources:*), 2085–2087 (Butler–McKay "Not inspected").

Witness: the classification through degree 11 is cited to Butler–McKay without theorem or page,
and to a GitHub commit of a code library; the LMFDB `6T6` page (lmfdb-6T6 lines 118–140, 200,
236, 289, 303) gives order 24, `A₄ × C₂`, solvable, parity `−1`, imprimitive, which the README's
`6T6` paragraph agrees with but does not cite line by line.

Repair: cite Butler–McKay by table and page for each degree, or Hulpke 2005 §3 by theorem, and
record the LMFDB page as the locator for the `6T6` invariants.

## Verified sound

**Verdict basis.** `Completed/PolynomialGaloisGroups/` exists on main at `ffcc9d3`; the merge base
`8f5231d` carries the same README (diff: lines 139 and 1573 only, link paths) and the same
`Suggested.lean` (diff: line 2, one import path). The pull request's `git diff --stat` touches
nothing outside the roadmap folder.

**Gate and build.** Worker gate FAIL (tex 1, residue 1, sorry-examples 12, imports 1, build 4).
My elaboration of `Suggested.lean` with `lake env lean`: 25 s, 16 `sorry` warnings, 4 linter
warnings, 0 errors. Dependency check: 0 problems.

**Suppliers resolved.** Induction–Restriction Layer 2.1 (`almostConjugate_comap`,
`not_conj_comap`, `TauCetiRoadmap/RepresentationTheory/InductionRestriction/Suggested.lean`
lines 774, 810) and Layer 2.2 (`exists_S16_gassmann_pair`, line 824): present on main. Number
Field Arithmetic 3.10 `exists_gal_fullCycleType_eq_factorizationType`: present on main
(`Completed/NumberFieldArithmetic/README.md` line 1039) and in the pin as
`TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`
(`TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean` line 164). Number Field Arithmetic
3.8: a target, no named declaration. Number Field Arithmetic 8.4: does not exist (R02). Belyi
Maps on main 1.6 (line 879) consumes `TransitiveGroupLabel` through degree 11 from
PolynomialGaloisGroups "Layers 6, 7"; its open revision cites "Layer 1D" of this branch.

**Pinned declarations opened.** Tau Ceti `a91d3aa`: `numTransitiveGroups` with values
`1, 1, 2, 5, 5` then `0` (`TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Basic.lean` lines 66–96);
`Group.IsSolvable.exists_normal_index_prime` (`TauCeti/GroupTheory/Solvable.lean` line 78, with
`[Finite G] [Group.IsSolvable G] [Nontrivial G]` as the README says); `Equiv.Perm.fullCycleType`
(`Perm/Partition.lean` line 96); `irreducible_X_pow_three_sub_two`,
`natCard_gal_X_pow_three_sub_two` (`FieldTheory/GaloisGroups/Cubic.lean` lines 147, 182);
`dedekindZetaCoeff` (`NumberTheory/ArithmeticDirichletSeries/Trivial.lean` line 54);
`isSolvable_iff_exists_le_map_conj_referenceSubgroup_five_two`,
`existsUnique_transitiveGroupLabel_five`. Mathlib: `isCyclic_tfae`
(`FieldTheory/KummerExtension.lean` line 563), `restrictRestrictAlgEquivMapHom_injective`,
`IsGalois.sup_right`, `tower_top_intermediateField`, `subgroupEquivAlgEquiv`,
`normalAutEquivQuotient`, `of_fixedField_normal_subgroup`, `finrank_eq_fixingSubgroup_index`
(`FieldTheory/Galois/Basic.lean`), `AlgebraicClosure` instance `hasEnoughRootsOfUnity`
(`RingTheory/RootsOfUnity/AlgebraicallyClosed.lean` line 46), `exists_primitiveRoot`
(`EnoughRootsOfUnity.lean` line 33), `IsPrimitiveRoot.of_map_of_injective`,
`Algebra.IsSeparable.of_integral`, `finrank_eq_one_iff_eq_top`, `lift_adjoin_simple`,
`restrictScalars_adjoin_eq_sup`, `adjoin_simple_le_iff`, `adjoin_rootSet_eq_range`,
`solvableByRad.rad_mem` (`AbelRuffini.lean` line 201), `isSolvable_gal_of_irreducible` (line 313),
`Equiv.Perm.not_isSolvable`, `galActionHom_bijective_of_prime_degree`, `block_stabilizerOrderIso`,
`subgroup_eq_top_of_swap_mem` (`Perm/Cycle/Type.lean` line 546), `discr_C` (`Resultant/Basic.lean`
line 939). All exist at the pin. `docs/1000.yaml` line 1674 lists Chebotarev as the README says.

**Sources opened.** conrad-cubicquartic: Definition 3.1 (line 245), (3.7) (line 244), Theorem 3.4
(line 275), Theorem 3.6 with Table 4 (lines 289–296), Corollary 3.8 (line 347), Theorem 4.1
Kappe–Warren (line 397), Example 3.2 `X⁴ − X − 1` (line 252), Example 3.3 `X⁴ + 8X + 12` with
resolvent `X³ − 48X − 64` and discriminant `576²` (lines 260, 329): every quartic locator is
correct. dummit-quintics: "precisely `F₂₀`" on page 2 of the PDF, that is p. 388 (line 51);
Theorem 1 and formula (2′) on page 3, p. 389 (lines 98–102); generators `(12345)` and `(2354)`
(line 129): correct. lmfdb-6T6: order 24, `A₄ × C₂`, solvable, parity −1, imprimitive (lines
118–303). gap-transgrp-trans lines 43–69: degree 6 and 7 entries, which the 160-row table
transcribes (R03).

**Adversarial table.** Values computed by my own scripts (exact discriminants by Sylvester
determinant; numeric roots by Durand–Kerner; permutation-group closures by breadth-first search).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Exact generators (Layer 1C, six closures) | 3T2, 4T2, 4T4, 4T5, 5T4, 5T5 | proof bodies in `PrescribedGenerators.lean` elaborate; orders 6, 4, 12, 24, 60, 120 | sound, but a copy of a later Tau Ceti module | R05 |
| Fixed inputs and values (160 rows) | all 160 rows | counts 16, 7, 50, 34, 45, 8; all transitive; orders in degree 6: 6,6,12,12,18,24,24,24,36,36,48,60,72,120,360,720; degree 7: 7,14,21,42,168,2520,5040; degree 11: 11,22,55,110,660,7920 (A11, S11 skipped as over 600000); degrees 8–10 consistent with the LMFDB orders (8T25=56, 8T37=168, 8T43=336, 8T48=1344, 9T27=504, 9T32=1512, 10T26=360, 10T35=1440, 10T43=28800) | data correct; copied | R03 |
| Evolve the canonical declarations in place | pin values | `numTransitiveGroups 6 = 0` at the pin; `numTransitiveGroups_eq_zero_of_five_lt` used at Primitive.lean:130, Parity.lean:65, Solvable.lean:152 | README and Lean contradict each other | R06, R10 |
| Complete basic API for every new row | degree 0, 1; `6T6` | `numTransitiveGroups 0 = 0`, `1 = 1`; `6T6` parity: 12 even of 24 (odd), imprimitive, solvable | values not stated as targets | R10 |
| A finite proof producer | — | no statement with hypotheses and conclusion | algorithm | R04 |
| The required `6T6` comparison | `r = (0,2,4)(1,3,5)`, `t = (2,5)` | closure order 24; transitive; preserves `{{0,3},{1,4},{2,5}}`; centre `{1, (0,3)(1,4)(2,5)}` of order 2; image on blocks of order 3; element orders 1:1, 2:7, 3:8, 6:8, which is `A₄ × C₂` | correct | none |
| Outputs and order (unique label ≤ 11) | degree 6 | not stated in Lean; Belyi cites it | headline absent | R06 |
| `Sₙ` over `ℚ` (headline, pinned) | n = 1 | `X` is separable with full `S₁` | pinned to `exists_monic_int_polynomial_hasFullSymmetricGaloisGroup` | none |
| Radical criterion (Layer 10) | `E = F` | trivial group solvable; `ι x = algebraMap x ∈ solvableByRad` | holds | none |
| Radical criterion, hypothesis `CharZero` | `F = 𝔽_p(t)`, `E = F(α)`, `α^p − α = t` | Galois group cyclic of order `p`, solvable; `α` not radical | hypothesis needed and present | none |
| Radical criterion, second theorem | — | identical to `.mp` of the first | padding | R07 |
| Discriminant test witnesses (Layer 3) | `x³ − 3x − 1`, `x³ − 2`, `x² − 1` over ℤ | discriminants 81, −108, 4 | as stated | none |
| Quartic table (Layer 4) | the five quartics and `x⁴ − x − 1` | resolvent cubics `X³ − 4X − 1`, `X³ − 48X − 64`, `X³ + 8X`, `X³ − 4X`, `X³ − X² − 3X + 2`, `X³ + 4X − 1`; `disc f = disc R₃` in all six cases: 229, 331776, −2048, 256, 125, −283 | as stated | none |
| Dummit (2′) against the orbit product | `x⁵ − 5x − 12`, `x⁵ − 2`, `x⁵ − x` | `f₂₀(40) = 0`; `X⁶ − 50000X`; `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 512X + 256 = (X − 2)⁴(X² + 16)` | as stated | none |
| Orbit values of the `F₂₀` invariant | `x⁵ + x⁴ − 4x³ − 3x² + 3x + 1`; `x⁵ − 5x − 12`; `x⁵ − x`; `x⁵ + 20x − 16` | 6 values with `−16.000`; 6 values with `40.000`; 3 values `{2, 4i, −4i}`; 6 values, none an integer | as stated | none |
| Certificates (Layer 6) | factor degrees mod p | `C₅` example mod 2: (5); `x⁵ − 5x − 12` mod 7: (5), mod 3: (2,2,1); `x⁵ − 2` mod 11: (5); `x⁵ + 20x − 16` mod 3: (5), mod 7: (3,1,1); `x⁵ − x − 1` mod 3: (5), mod 2: (3,2), mod 5: (5) | as stated | none |
| Discriminants (worked examples) | all eleven | 14641 = 11⁴, 64000000 = 8000², 50000, 1024000000 = 32000², 2869 = 19·151, −256, −2012 = −2²·503 | as stated | none |
| `x⁴ + 1` reducible mod every prime | p = 3, 5, 7, 17 | types (2,2), (2,2), (2,2), (1,1,1,1) | as stated | none |
| `F₂₀` contains no transposition | the 20 elements | cycle types 1⁵, 2²1, 41, 5 | as stated | none |
| Order-30 step (Layer 1C) | `S₅` | image ≤ 24 gives kernel ≥ 5 and ≤ 30; normal subgroups have orders 1, 60, 120 | as stated | none |
| Jordan bound witnesses | `AGL(1,5)`, `AGL(1,8)` | orders 20 (`5T3`) and 56 (`8T25`) | as stated | none |
| Gassmann example | `C₄ × C₄`, `Q₈ × C₂` | element orders 1:1, 2:3, 4:12 for both; non-isomorphic; index `16!/16 = 15!` | arithmetic sound; suppliers missing | R02 |
| Wreath example | `WreathProduct (ZMod 2) (Fin 2)` | order `2² · 2 = 8` | as stated | none |

**Binder check.** `#check`-level comparison was done through the full elaboration: the Layer 10
theorems carry `[CharZero F] [FiniteDimensional F E] [IsGalois F E]` and the embedding explicitly,
matching the README; `cubicQuadratic` and `cubicTowerSplittingFieldEquiv` are `def`s with real
bodies and carry their instance arguments explicitly. No `set_option`, no sorry'd data.

**Ownership against open work.** Checked by object in the sibling checkouts named in the brief:
the degree-6-to-11 reference family is claimed nowhere else; `PolynomialGaloisGroupsPartII` (open)
builds ramified merging and higher irreducibility and does not overlap; the Belyi Maps revision
(open) consumes the family and builds none. Open pull requests not given with files were not
checked.

## Not verifiable

- Butler–McKay, *The transitive groups of degree up to eleven* (Comm. Algebra 1983): paywalled;
  cited by the README without theorem or page, so nothing to check at a locator.
- Dixon–Mortimer Theorem 1.5A and 2.6A, Wielandt Theorems 7.5 and 13.9, van der Waerden §61,
  Cohen §6.3: books not held locally; the README itself marks them "not inspected". The
  statements attributed to them are standard and the roadmap grounds them elsewhere.
- Hulpke, *Constructing transitive permutation groups* (2005): the README says it is "in the
  project's `references/`"; no such directory is in this repository, and no sources manifest records it.

## Source issues

- none

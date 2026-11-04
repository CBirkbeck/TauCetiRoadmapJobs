# GATE-PolynomialGaloisGroups~3: answers to human review of the pull request (head `0081eac`)

Repair commit: `8a1ed65` ("PolynomialGaloisGroups: review repairs (rewrite as part III continuation:
new mathematics only, headline-only Suggested)"), not pushed. It changes only
`TauCetiRoadmap/PolynomialGaloisGroups/README.md` (2147 → 725 lines) and
`TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean` (3417 → 107 lines).

**Governing finding: H01.** Main archived the roadmap at `Completed/PolynomialGaloisGroups/`
(commit `569d44af`, declared complete 2026-10-28). The branch still edits the old active path, so
every inherited layer re-plans finished work. The two editable files are therefore rewritten as a
continuation, *Galois groups of polynomials, part III*. It keeps only what the archived roadmap
lacks:

- Layer 1: transitive groups in degrees 6–11.
- Layer 2: labels through degree 11.
- Layer 3: the radical criterion and Dummit's criterion without a separation hypothesis.
- Layer 4: Gassmann's arithmetic equivalence.

Four steps lie outside the two editable files and are the worker's or a human's to do:

1. Rename the folder to `TauCetiRoadmap/PolynomialGaloisGroupsPartIII`. The Lean namespace is
   already `TauCetiRoadmap.PolynomialGaloisGroupsPartIII`. Until the rename, git's rename detection
   would apply this branch's edits to the archived `Completed/PolynomialGaloisGroups/README.md`.
2. Delete `Compatibility.lean`, `PrescribedGenerators.lean`, `STATUS.md` and `PROGRESS.md` from the
   folder. The last two are the archived roadmap's generated files.
3. Record the sources listed under H11 in `sources.toml`.
4. Re-register the merge-order entry under the new name.

## H01 (CBirkbeck) — applied

**Old:** README:40 read "Layer1C retains the fourteen degree-at-most-five references and their
proofs", and Layers 0–6 and 9 were planned again.

**New:** README:3–17 (Summary) and README:28–62 ("Where the base roadmap stops", "Imported, not
planned again") give the archived boundary. They cite base Layers 1, 4, 6 and 9 by section and by
native declaration. No inherited layer remains. The new material is Layers 1–4 (README:220–681).
The part name is coordinated with the open Part II (ramified merging), and README:60–62 states
that neither part uses the other. The folder rename and the deletions listed above are outside
this job's files.

## H02 (CBirkbeck) — applied differently

The witness is right. For `p = 2X² − 4` and `α = √2`, `minpoly ℚ α = X² − 2 ≠ p`, and the
normalized form `p · C(p.leadingCoeff⁻¹) = X² − 2` is Mathlib's `minpoly.eq_of_irreducible`
(`Mathlib/FieldTheory/Minpoly/Field.lean:152`). The sentence was a verbatim copy of the archived
base Layer 2. It left this package together with the rest of base Layer 2 (H01). The same defect
remains in the archived roadmap at `Completed/PolynomialGaloisGroups/README.md:673` on main, which
needs a separate erratum against `Completed/`.

## H03 (CBirkbeck) — applied differently

The witness is right. With `g = X − 1`, `n = 1`, `k = 1`, `e₂(1) = 0`, but `g.coeff (1 − 2)` is
`g.coeff 0 = −1` under truncated subtraction. Mathlib's `Polynomial.coeff_eq_esymm_roots_of_card`
assumes `k ≤ natDegree` (`Mathlib/RingTheory/Polynomial/Vieta.lean:116`). The passage was copied
from the archived base Layer 4 and is deleted here with that layer. The archived copy at
`Completed/PolynomialGaloisGroups/README.md:831` needs the bound `k < n`, or `k : Fin n`, in a
separate erratum.

## H04 (CBirkbeck) — applied

**Old:** the claim that `x⁵ − x` shows Dummit's criterion fails without separation (old
README:2135).

**New:** README:503–528 (3.3) adds two results.

- Chapman's separation theorem: for `f` monic, separable, irreducible of degree 5 over a field
  with `5 ≠ 0`, the specialized sextic is separable.
- Dummit's Theorem 1 in radical form, stated without a separation hypothesis. It is the headline
  `forall_rootSet_mem_solvableByRad_iff_exists_isRoot_quinticF20` (Suggested.lean:77).

README:544–547 now records `x⁵ − x` as a *reducible* negative control.

The argument was checked against the sources and by exact computation:

- Chapman's identities for `θ₂ − θ₃` and `θ₄ − θ₅` (`chapman-quintics` lines 18–24) hold in
  `ℤ[x₁,…,x₅]`.
- The stabilizer of `θ₁` has order 20.
- `(1 2 3 4 5)` cycles `θ₂ → θ₆ → θ₃ → θ₄ → θ₅`, as Dummit states (`dummit-quintics` lines 114–115).
- Numerically, `X⁵−2` has root 0 and `X⁵−5X−12` has root 40.
- `X⁵−X−1`, `X⁵+20X−16` and `X⁵−4X+2` have pairwise distinct θ-values.

The characteristic-2 case contradicts directly. The archived copy of the sentence is at
`Completed/PolynomialGaloisGroups/README.md:1687`.

## H05 (CBirkbeck) — applied

Removed:

- the certificate producer, its verifier and its termination by strict order;
- the "finite fallback" enumeration (old README:921–934);
- base Layer 6's certificate type and check interface (old README:1561–1596).

In their place, README:261–297 (1.2) has:

- a general descent criterion. Let `𝓡` be a family of transitive subgroups that contains `⊤` and is
  closed, up to `Sₙ`-conjugacy, under transitive maximal subgroups. Then `𝓡` meets every
  transitive class. The proof is by induction on order, using `Finite.to_isCoatomic`.
- the conjugation invariants that separate rows;
- per-row finite statements whose proof method is not prescribed.

README:67–69 puts programs, searches and termination claims out of scope. The reviewer's S₃ test
is the first Check (README:288–290): `{S₃, A₃}` satisfies the hypothesis, and orders descend
`6 → 3`. The Check at README:291–293 shows the hypothesis failing at `A₄` and `D₄` when the normal
Klein group is omitted.

## H06 (CBirkbeck) — applied

Suggested.lean now states six headlines.

- **Classification:** `card_transitiveSubgroupClass` (Suggested.lean:45), on native carriers. The
  number of `Sₙ`-conjugacy classes of transitive subgroups is `1,1,2,5,5,16,7,50,34,45,8` for
  `n = 1..11`. This is the count form of the reviewer's 16-class existential probe, and the two
  are equivalent.
- **Radicals:** the finite-Galois criterion (`isSolvable_iff_forall_mem_solvableByRad`) and the
  all-roots polynomial criterion (`isSolvable_gal_iff_forall_rootSet_mem_solvableByRad`).
- **Dummit:** the quintic criterion in radical form.
- **Gassmann:** `dedekindZetaCoeff_fixedField_eq_of_almostConjugate`, and the existence of
  nonisomorphic number fields with equal zeta coefficients,
  `exists_dedekindZetaCoeff_eq_not_isomorphic`.

The module docstring (Suggested.lean:5–23) names the one missing carrier. Above degree 5 the
pinned `TauCeti.TransitiveGroupIndex n` is empty (`TauCeti.numTransitiveGroups_eq_zero_of_five_lt`).
That carrier is needed for the labelled classification, the `6T6` comparison and polynomial labels
through degree 11. None of them is stated through the empty index.

## H07 (CBirkbeck) — applied differently

The finding is right. `Compatibility.lean:42` asserts that the count is zero above degree five,
which Layer 1.3 makes false. Deleting the two companion files is outside the two files this job may
edit, so it is the worker's step (see the list at the top). In the editable files:

- the README no longer mentions either companion file or any alias, and the "no alias" claim
  (old README:175) is gone;
- the six generator equalities they carried belong to the archived base Layer 6 and are not
  restated;
- nothing in Suggested.lean imports or names the companion files.

## H08 (CBirkbeck) — applied

**Old:** Suggested.lean had 3417 lines, 387 proved `example`s, seven instances and the
`fullCycleType` `rfl` API.

**New:** 107 lines: one definition (`TransitiveSubgroupClass`, needed for the count headline) and
six `sorry` headlines, with no `example` and no `instance`.

None of the headlines is in the pinned libraries. Mathlib's `isSolvable_gal_of_irreducible` is the
one-way theorem, and nothing at the pins counts transitive classes above degree 5 or proves
Gassmann's theorem.

## H09 (CBirkbeck) — applied

The README now has the required shape:

- `**Summary.**` (README:3);
- `## Scope and ownership` (README:26) and `## Conventions` with **Checks** (README:78–116);
- `## Exact supplier contracts` (README:118), with "From Mathlib", "From Tau Ceti" and
  "From TauCetiRoadmap.X" subsections;
- `## How to read the build` (README:211);
- Layers 1–4 with `k.n` subsections, each target with `*Needs:*` and **Checks**, and each layer
  ending in `### Examples` and `### Dependencies`;
- `## Downstream consumers` and `## References`.

The one definition, `TransitiveSubgroupClass`, has four Checks:

- `n = 0`: one class, against the native count `0`;
- `n = 2`: one class, against 2 without the transitivity filter;
- `n = 4`: 5 classes, against 9 subgroups;
- `6T7` and `6T8`: two classes for one abstract `S₄`.

"This pass" and the docstring narration of superseded proposals are gone.

## H10 (CBirkbeck) — applied differently

README:316–321 restricts three native column theorems to `n ≤ 5`:

- `TauCeti.isPreprimitive_referenceSubgroup_iff` (`Primitive.lean:114`);
- `TauCeti.isSolvable_referenceSubgroup_iff` (`Solvable.lean:142`);
- `TauCeti.referenceSubgroup_le_alternatingGroup_iff` (`Parity.lean:37`).

It also replaces the zero-above-five boundary with zero above eleven.

Exact columns are given for degrees 6, 7 and 11. The degree-6 table (README:342–359) was computed
from the TransGrp generators by exact permutation closure:

- `6T6` has order 24 and is odd, imprimitive and solvable.
- `6T16` is odd, primitive and not solvable.
- Exactly four rows are primitive (6T12, 6T14, 6T15, 6T16), matching Conway–Hulpke–McKay Table 2.

Unrestricted, the three columns fail at degree 6:

- the primitivity column (`n ≠ 4 ∨ 3 ≤ j`) would make `6T6` primitive;
- the solvability column (`n ≠ 5 ∨ j < 3`) would make `6T16` solvable;
- the parity column (true only for `n ∈ {1, 3, 4, 5}`) would make the even rows `6T4`, `6T7`,
  `6T10`, `6T12`, `6T15` odd.

**Where the repair differs from the request:** degrees 8–10 (129 rows) are not tabulated. Writing
them out would re-create in prose the 160-row database copy that the previous round removed. Their
per-row columns are theorems computed from the fixed generators. The primitive counts `7, 11, 9`
for those degrees (Conway–Hulpke–McKay Table 2) are aggregate Checks. Aggregate parity and
solvability counts for degrees 8–10 are not given, because no legal source read here states them.

## H11 (CBirkbeck) — applied differently

Locators:

- **Butler–McKay** (Comm. Algebra 11) is paywalled: tandfonline returns HTTP 403. It is cited by
  locator only, as uncertified, and is not used for any number. The whole article is the list of
  groups, so the full page range is its honest locator.
- **Counts:** every count used is located in Conway–Hulpke–McKay Table 2, p. 7
  (`conway-hulpke-mckay` lines 282–285). That paper is open on Cambridge Core, and the copy was
  read.
- **Line-level locators** are given for Dummit (Theorem 1 at lines 100–103, θ conjugates at lines
  53–70, (2′) at lines 97–99), Chapman (lines 16–30), Milne v5.10 (Theorem 5.34, line 3409) and
  Sutherland (Proposition 2.6, Theorem 2.10, introduction lines 22–31).
- **Perlis** Theorem 1 is cited as uncertified (Elsevier). The theorem number is confirmed through
  Sutherland's Theorem 2.10, which cites "[35, Theorem 1]".
- **Gassmann (1926):** no legal copy was found, so its direct citation is replaced by Sutherland's
  account.
- **TransGrp:** the files are cited at commit `165fc21`, and the README states that they supply
  only generators. Completeness and uniqueness are 1.2's targets.

This job may not create `sources.toml`. The worker should record:

| id | how it was obtained | status |
|---|---|---|
| `conway-hulpke-mckay` | DOI 10.1112/S1461157000000115, Cambridge PDF | publisher-open |
| `dummit-quintics` | DOI 10.1090/S0025-5718-1991-1079014-X, AMS PDF | publisher-open |
| `chapman-quintics` | site.uvm.edu/ddummit | author-page |
| `milne-ft` | jmilne.org, v5.10 | open-repository |
| `sutherland-arith-equiv` | arXiv:2104.01956v4 | open-repository |
| `transgrp`, `transgrp-11` | GitHub `hulpke/transgrp` at `165fc21` | author-page |
| `perlis-zeta` | — | uncertified |
| `dixon-mortimer` | — | uncertified |
| `butler-mckay` | paywalled | uncertified |

No text is missing, so `needs-references.toml` is not left in scratch.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested`: `Build completed successfully (9010
  jobs)`. The only warnings are `declaration uses sorry`, at Suggested.lean lines 45, 57, 67, 77,
  90 and 101.
- Gate, on commit `8a1ed65`:
  `gate PolynomialGaloisGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1177 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or `moved:` line.

  The named suppliers are all on main: the archived base roadmap, RepresentationTheory
  (Induction–Restriction 2.1 and 2.2) and the archived Number Field Arithmetic Layer 1.4. No notion
  was moved down from a later roadmap.

## Signature check

A scratch file containing all seven declarations and `#check @…` for each elaborated.

- The elaborated types carry exactly the README hypotheses: `CharZero`, `FiniteDimensional`,
  `IsGalois` and the embedding `ι`; `Monic`, `Irreducible` and `natDegree = 5`; and `NumberField`,
  `IsGalois ℚ E` and the class-intersection hypothesis.
- No section `variable` exists, so no binder can be dropped. Nothing changed as a result of the
  check.
- Every backticked Mathlib and Tau Ceti name in the README was checked. It either resolved by
  `#check` at the worktree's Tau Ceti pin (`a91d3aa`) or was found in source at the content pins
  (Tau Ceti `358314d`, Mathlib `f6090c7`). `Ideal.doubleCosetQuotientEquivPrimesOver` and the
  decomposition-orbit theorem were checked in source at both pins, because no `.olean` is built for
  them at the worktree pin.
- One name was corrected while drafting: `IsGalois.map_fixingSubgroup`, not
  `IntermediateField.map_fixingSubgroup`.

## Ownership against open work

This was checked with `roadmaps grep` over main and the 392 open heads.

- **Open PR #986** (another revision of the same roadmap) states the same radical criterion, as
  `TauCetiRoadmap.PolynomialGaloisGroups.RadicalConverse.*`. As a revision of an existing roadmap it
  is not a dependency. This file's declarations live under `TauCetiRoadmap.PolynomialGaloisGroupsPartIII`,
  so no fully qualified name collides with #986 or with `Completed/PolynomialGaloisGroups/Suggested.lean`.
  Whether #986 or this continuation owns the radical criterion is a human decision.
- **Arithmetic equivalence** has no other owner. Completed Number Field Arithmetic excludes it at
  `Completed/NumberFieldArithmetic/README.md:2244`.
- **The degree 6–11 classification** has no other owner. BelyiMaps (#767) consumes it and cites
  "PolynomialGaloisGroups pure Layers 1C–1D". After the rename that citation should read
  "PolynomialGaloisGroupsPartIII, 1.3".
- The resolver's earlier lead about the `Gassmann` namespace was a false positive: that namespace
  is in `TauCetiRoadmap/RepresentationTheory/InductionRestriction/Suggested.lean` on main, lines
  634–831.

## Adversarial pass

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `TransitiveSubgroupClass` | `n = 0, 1, 2, 4` | classes `1, 1, 1, 5`; native count at 0 is `0`; 2 classes at n=2 without transitivity; 9 subgroups vs 5 classes at n=4 | count stated from `n = 1`; Checks added |
| `card_transitiveSubgroupClass` | degrees 6, 7 from TransGrp | 16 and 7 rows; CHM Table 2 `1,2,5,5,16,7,50,34,45,8` | matches |
| descent criterion | `{S₃,A₃}`; `{S₄,A₄,D₄,C₄}` with and without `V₄` | holds (orders 6→3); fails at `A₄`, `D₄`; 5 classes once `V₄` is added | Checks added |
| row separation, degree 6 | orders and parity of 16 rows | 6T1/6T2 by 6-cycle; 6T3/6T4 and 6T9/6T10 by parity; 6T6 (no order 4) vs 6T8 | Check added |
| native columns at degree 6 | 6T6, 6T16, even rows | primitivity formula true vs computed false (6T6); solvability formula true vs false (6T16); parity formula false vs + for 6T4, 6T7, 6T10, 6T12, 6T15 | restricted to `n ≤ 5` |
| `6T6` comparison | `r=(0 2 4)(1 3 5)`, `t=(2 5)` | order 24; `r` maps `{0,3}→{2,5}→{4,1}`; action on blocks is `C₃`; `t^r=(4 1)`, `t^{r²}=(0 3)` | stated |
| degree 7 and 11 columns | all rows | 7: orders 7, 14, 21, 42, 168, 2520, 5040, parity `+,−,+,−,+,+,−`; 11: `11T2`, `11T4`, `11T8` odd | Checks |
| unique label ≤ 11 | `X⁶−2`, `Φ₇`, `(X²−2)(X⁴+1)`, `(X²−2)³` | disc `2¹¹·3⁶` (not a square) → 6T3; `C₆` regular → 6T1; reducible → none; inseparable → none | Checks |
| radical criterion (finite Galois) | `E=F`; `X⁵−2`; `X⁵−4X+2`; cyclic cubic `X³−3X+1` | trivial ↔ true; `F₂₀` ↔ radical; `S₅` ↔ not; `C₃` solvable but `solvableByRad ℚ E = ℚ` | ambient closure required (Check) |
| all-roots polynomial form | `q=0`; `(X⁵−4X+2)(X−1)`; `X³−2` | trivial / no roots; root 1 radical but `S₅`; degree 3 solvable | some-root form only for irreducible `q`; `p ≥ 5` |
| Chapman separation | the identities; `x⁵−2`, `x⁵−5x−12`, `x⁵−x−1`, `x⁵+20x−16`, `x⁵−4x+2`, `x⁵−x` | identities exact; min `|θᵢ−θⱼ|` 8.71, 24.99, 2.61, 27.0, 3.31; `x⁵−x`: 0 | hypotheses `5 ≠ 0` and irreducibility; char 2 contradiction derived |
| Dummit radical form | `x⁵−2`, `x⁵−5x−12`, `x⁵−x−1` | sextic roots 0, 40; constant term 9631 (prime), no integer root in ±200000 | stated in characteristic 0, monic |
| Gassmann theorem | `n=0`; `V₄ ≤ Gal(ℚ(√2,√3)/ℚ)`; `ℚ(i)`, `p=5` | coefficient `1=1`; coefficients at 3 `0,1,1` and at 5 `0,0,2` (equal order is not enough); `ℚ(i)` at 5 is 2 | Checks |
| fixed fields ↔ conjugacy | `X³−2` order-2 subgroups; Klein subgroups of `S₄` (`X⁴+X+1`); `1` vs `G` | conjugate ↔ `ℚ(∛2) ≅ ℚ(ζ₃∛2)`; isomorphic but not conjugate ↔ Galois vs non-Galois sextic; degrees differ | Checks |
| existence (`S₁₆`) | regular `C₄×C₄`, `Q₈×C₂` | full types `1¹⁶:1`, `2⁸:3`, `4⁴:12` for both; degree `15! = 1307674368000` | Checks |
| conventions | `(0 1)(1 2)` on `Fin 3`; conjugation of `⟨(0 1)⟩` by `(1 2)`; `dedekindZetaCoeff` | `0↦1` vs `0↦2`; `⟨(0 2)⟩`; `ℚ`: 1 at 0 and at `n≥1`; `ℚ(i)` at 5: 2 | Checks |
| H02 / H03 witnesses | `2X²−4`; `X−1`, `k=1` | `minpoly = X²−2`; `e₂=0` vs `−1` | defects in the archived copy, lines 673 and 831 |

Review text was treated as data. It contained no instruction to run commands or to change files
outside this job.

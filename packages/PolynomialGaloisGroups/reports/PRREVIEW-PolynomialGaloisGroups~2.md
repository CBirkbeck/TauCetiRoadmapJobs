# Review of PolynomialGaloisGroups (pull request #763 at 0081eac)

**Verdict:** rejected

## R01 (P1) — The package re-plans a completed roadmap

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:40`: “Layer1C retains the fourteen degree-at-most-five references and their proofs.” Layers 0–6 and 9 again describe their construction.

**Claim:** this folder owns the old polynomial Galois library as well as the new degree-six-to-eleven classification and radical converse.

**Witness:** main's `Completed/PolynomialGaloisGroups/STATUS.md:30` records Layers 0–6 and 9 as finished; line 34 requires a new roadmap for further work. Its README:57 excludes degrees 6–11. The pinned library contains these constructions.

**Repair:** submit a continuation whose introduction identifies the completed boundary; import the old results by exact declaration and retain only new mathematics. Coordinate its Part name with the existing `PolynomialGaloisGroupsPartII`, whose scope is different. Moving the extension, rather than editing the completed program in place, is necessary. Test: degrees 1–5, resolvents and Sₙ realization then have one existing owner; degrees 6–11 and the radical converse have an explicitly new owner. This is why the verdict is rejected rather than needs changes.

## R02 (P2) — The endpoint minimal polynomial silently requires monicity

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:983`: “For `E = F`, `minpoly E α = p`”. The standing assumptions at line 965 are irreducibility and separability, not monicity.

**Claim:** the endpoint polynomial equals the given irreducible polynomial.

**Witness:** over ℚ take `p = 2X² − 4`, `α = √2`. Then `minpoly ℚ α = X² − 2`, whereas `p = 2X² − 4`; both have the same two roots.

**Repair:** use the monic normalization, equivalently `p * C p.leadingCoeff⁻¹`, in the equality. Keep the general irreducible-polynomial statement and its block of all roots. Test: the normalized polynomial is `X² − 2` in this example. The pinned `minpoly.eq_of_irreducible` is already used in precisely this form in `Mathlib/FieldTheory/AbelRuffini.lean:315`.

## R03 (P2) — Vieta's coefficient index needs a bound

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1140`: “the `(k+1)`-st elementary symmetric polynomial at `x` is `(−1)^(k+1) · g.coeff (n − (k+1))`”.

**Claim:** this identity holds for an unrestricted natural index.

**Witness:** `g = X − 1`, `n = 1`, `k = 1`, root list `[1]`: the left side is `e₂ = 0`; truncated natural subtraction makes the right side `g.coeff 0 = −1`.

**Repair:** state `0 ≤ k < n`, or use `k : Fin n`, as `Suggested.lean:1617` already does. State vanishing separately for elementary symmetric degree greater than `n`. Test: `k = 0` gives `1 = −(−1)`; `k = 1` belongs only to the vanishing statement `e₂ = 0`.

## R04 (P2) — The rational quintic theorem is unnecessarily weakened

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:2135`: “Layer 4's `x⁵ − x` shows it fails without it”; line 2138 adds separation evidence to the classical criterion.

**Claim:** Dummit's irreducible rational quintic criterion needs an extra separability premise for its sextic.

**Witness:** `dummit-quintics` lines 102–105, Theorem 1, printed p. 389, has no such premise. `chapman-quintics` lines 16–30 supplies the missing collision argument. The proposed counterexample `X⁵ − X` has the rational root 0 and is reducible.

**Repair:** retain the general orbit-resolvent theorem with its separation hypothesis, but also retain Dummit's full theorem for irreducible quintics over ℚ. Use Chapman's argument to discharge the extra condition where needed, rather than treating it as an assumption left implicit by the theorem. Test: `X⁵ − X` is excluded by irreducibility; the formulas for `X⁵ − 2` and `X⁵ − 5X − 12` still give roots 0 and 40. Chapman's contradiction is `5x₂ = Σ xᵢ ∈ ℚ`, which would make a root of an irreducible quintic rational. The corrected source is the [author-hosted Chapman note](https://site.uvm.edu/ddummit/files/2021/04/Solving_Solvable_Quintics_note_by_Robin_Chapman.pdf).

## R05 (P1) — The higher-degree deliverable remains a computational algorithm

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:921`: “Build a subgroup-classification certificate”; lines 931–934 require verifier termination and a fallback enumeration of subgroups and conjugacy orbits.

**Claim:** an executable finite classification procedure, its verifier and its termination are roadmap targets.

**Witness:** the instructions to recurse on subgroup orders, discard nodes, enumerate subgroups, filter and match are the algorithm itself. They remain after removal of the copied database file. Layer 6:1561–1596 also specifies a computational certificate/check interface.

**Repair:** remove the certificate producer, verifier, enumeration and executable checker from this mathematical roadmap. State the general classification, subgroup-covering facts, conjugacy comparisons and invariant theorems with exact hypotheses and sources. Existing native certificate APIs can be cited as existing work, not rebuilt. Test: for S₃ the mathematical covering assertion still says every proper subgroup lies in a conjugate of C₃ or C₂, with orders `6 → 3 or 2 → 1`; its theorem does not require a search implementation. Preserve all transitive groups, not a selected tractable subset.

## R06 (P2) — New headline theorems are absent from the acceptance test

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:97`: “The classification … in degrees `6 ≤ n ≤ 11` … is not stated here”. README:1681–1693 additionally promises fixed-field arithmetic equivalence, and :1823–1843 promises polynomial radical corollaries.

**Claim:** these omitted results cannot, or need not, be stated against the pins.

**Witness:** a scratch Lean probe elaborates: there are 16 transitive subgroups of `Perm (Fin 6)` such that every transitive subgroup is conjugate to exactly one. It uses only native carriers; no unavailable classification carrier is needed.

**Repair:** in the continuation, state the classification headline on native carriers, including its explicit representative comparisons when the few necessary definitions are supplied. State the new arithmetic-equivalence and all-roots radical headlines with their real hypotheses. For a comparison that genuinely requires the future canonical degree-six index, name precisely that unavailable carrier in the module docstring; do not use its currently empty index as a substitute. Test: the degree-six existential classification probe elaborates with the exact count 16; `numTransitiveGroups 6` at the pin is 0, so those are demonstrably different statements.

## R07 (P2) — The companion files contradict the native-only contract

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Compatibility.lean:14`–44 defines five local aliases and six bridge/boundary theorems. README:175–176 says “no alias of them”. `PrescribedGenerators.lean:1`–194 retains six proved generator Checks.

**Claim:** the package introduces no second names and the auxiliary files satisfy the same headline-only form as Suggested.lean.

**Witness:** `Compatibility.lean:17` declares a local `numTransitiveGroups` alias; :42 asserts zero above five. After extension this would assert `0 = 16` at degree six. PrescribedGenerators retains the six equalities called Checks at README:876.

**Repair:** delete both companion files from this package. Use the native names in consumers; keep the generator equalities in the README's Checks and deliver any missing comparison proofs in the library implementation. Test: the six generator closures still have orders `6, 4, 12, 24, 60, 120`; deleting redundant local names changes none of those objects. The companion import/docstring/declaration forms also cease to violate the stated Lean-file rules.

## R08 (P3) — Suggested.lean is predominantly an API catalogue and Checks

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:176` and :181 state the defining equation and identity case of `fullCycleType`; the file contains 387 proved `example` declarations, seven local instances and six named theorems.

**Claim:** these are appropriate acceptance targets.

**Witness:** :176 closes by `rfl`; :181 closes by `Equiv.Perm.fullCycleType_one`. A scratch one-tactic probe confirms the latter. Five of the six named theorems are a native Jordan re-export or worked-value/Check declarations; the sixth is the actual radical headline.

**Repair:** delete this padding from `Suggested.lean`, including the API catalogue and instances used only by it. Keep the statements and examples in the README where appropriate; cite native results in the supplier contracts. Do not “prove them in place”—they are already proved. Test: the remaining radical headline does not close by `simp`, `rfl` or `infer_instance`; the existing one-direction Abel–Ruffini theorem does not prove its converse.

## R09 (P3) — The document does not have the required roadmap form

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1`, :36, :108, :519 and :2031; `Suggested.lean:91`–147.

**Claim:** the roadmap supplies the standing shape and timeless definition/API/Check contracts.

**Witness:** the opening lacks `Summary`; headings are `Scope` and nested `Layer` sections, without `Exact supplier contracts` or layer-ending `Examples`/`Dependencies`. References says “this pass”; the Lean docstring narrates superseded proposals.

**Repair:** write the continuation in the required shape, with own-word mathematical prose, exact per-target dependencies, API facts and at least three discriminating Checks for each kept definition. Put existing-library ownership in the scope/contracts sections and remove historical narration. Test: each kept definition, including any higher reference family interface, must have three computed examples/non-examples that distinguish its intended object; an API bullet or a statement merely unfolding that definition is not one.

## R10 (P3) — Native invariant formulas cannot survive the extension unchanged

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:906`–919 promises lower-reference preservation and a “Complete basic API for every new row”, but does not specify the replacement invariant formulas and their values.

**Claim:** replacing the zero-above-five boundary and supplying a general API description is a complete extension contract.

**Witness:** `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Primitive.lean:115` says primitivity iff `n ≠ 4 ∨ 3 ≤ j`; at `6T6` this would be `false ↔ true`. `Solvable.lean:142` says solvability iff `n ≠ 5 ∨ j < 3`; at `6T16 = S₆` this would be `false ↔ true`.

**Repair:** specify the exact parity, primitivity and solvability columns for every new row, and the replacement global theorems, including their polynomial-label consumers. Preserve old conclusions with an explicit `n ≤ 5` restriction or their transported low-degree form. Give precise source locators and Checks. Test: `6T6` is odd, imprimitive and solvable; `6T16` is odd, primitive and nonsolvable. Restricting the old equivalences to degrees at most five excludes both false new instances.

## R11 (P3) — Classification locators and source records remain incomplete

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:957` cites “Butler–McKay's degree-at-most-eleven classification”; :2071 gives the article's full page range rather than the location of the asserted classification. No `sources.toml` exists in the folder.

**Claim:** the seven sampled targets have exact auditable source support.

**Witness:** the fixed GAP commit gives generators, not a completeness proof. No theorem/table/page locates the classification or subgroup-covering assertion. The new-row API also gives no exact normalizer/centralizer comparisons to verify.

**Repair:** record each work once in `sources.toml`; add precise theorem/table/page locators for classification and for each new structural target. Cite the source files/row ranges for generator data and the `6T6` entry for that action's invariants. Mark genuinely inaccessible literature uncertified rather than claiming inspection. Test: the six source counts total 160 and the sixth degree-six row has the stated generators; neither computation establishes uniqueness or exhaustiveness of all subgroup conjugacy classes.

## Verified sound

The following checks support specific claims; finite examples are not proofs of the general theorems. No PR file was changed. The target head, clean worktree and absence of changes outside this folder were checked. The root README and CONTRIBUTING were read, together with the completed polynomial and number-field roadmaps and the relevant Induction–Restriction sections on main.

**Previous review, finding by finding.** No readable repair report marking a finding “not actionable in this package” was found. This assessment is against the current passages, not a presumption that the previous review was correct.

| Previous finding | Current passage and assessment |
|---|---|
| R01, completed roadmap | README:40 “Layer1C retains … references and their proofs”: **not repaired**, now R01. |
| R02, fictitious Number Field Arithmetic 8.4 | README:153–155 “Arithmetic equivalence … is not supplied by Number Field Arithmetic”; :1683–1693 owns the two arithmetic targets: **repaired**. The native number-field instance and IR 2.1/2.2 were resolved anew. |
| R03, copied 160-row source file | README:888–898 links the fixed GAP input and says its assertions require proof; `HighDegreeReferenceData.md` is absent: **repaired**. |
| R04, computational producer | README:932 “enumerate subgroups … and their conjugacy orbits”: **not repaired**, now R05. |
| R05, companion files | README:175 “no alias of them”, but Compatibility:17 still defines the alias; PrescribedGenerators still exists: **partly repaired** by removing their Suggested imports, now R07. |
| R06, missing classification and opposite boundary | Suggested:97–98 explicitly omits classification; its own boundary Check was removed, but Compatibility:42 remains: **partly repaired**, now R06/R07. |
| R07, padding | Some old helper/admitted examples were removed; Suggested:176 still ends `rfl`, and 387 proved examples remain: **partly repaired**, now R08. |
| R08, gate | Worker record ends `build=0 OK`, all counters zero: **repaired**. Independent targeted build and direct elaboration also pass. |
| R09, shape and library claims | README:718 correctly describes the Mathlib Jordan docstring, but the old shape persists and Suggested:773 still mentions `proof_wanted`: **partly repaired**, now R09; existing-library ownership is also R01. |
| R10, replacing the native boundary | README:909–910 says “replace it … and refactor its uses”; :912–919 still gives no replacement invariant values: **not materially repaired**, now R10. |
| R11, source locators | README:889 now names exact GAP files and commit, and :959 links `6T6`; :957 still gives no classification theorem/table/page: **partly repaired**, now R11. |

**Gate, build and binders.** The worker's complete gate result is:

```text
gate PolynomialGaloisGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently ran the targeted build `lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested` and direct `lake env lean` elaboration of Suggested.lean. Both passed; the sole source warning is the radical theorem's `sorry` at line 3407. These checks establish elaboration, not truth or compliance with all semantic rules.

A scratch copy printed `#check @name` for all 30 named declarations/instances across the three Lean files: 13 in Suggested (the anonymous instance received a probe-only name), 11 in Compatibility, and six in PrescribedGenerators. Compatibility was put in a separate probe namespace to avoid artificially shadowing native names when concatenating the three independent files. The copy elaborated. No silently dropped required binder was found: the radical statement retains both field universes, `CharZero`, `Algebra`, `FiniteDimensional`, `IsGalois` and the chosen embedding. The hypothesis needed for Vieta is present in Lean and absent in prose. No PR signature was changed.

The only sorried theorem was tested with `simp`, `rfl` and `infer_instance`; none closed it. The pinned one-way Abel–Ruffini theorem was read and cannot close the equivalence. A separate one-lemma padding probe closed the full-cycle identity. The exact 16-class degree-six existence/uniqueness statement elaborated with native carriers and no sorry'd data.

**Headlines.** The README's end results are: complete transitive reference classification through degree eleven and unique polynomial labels; the resolvent orbit/factor correspondence and low-degree recognition; the consequences of Dedekind factorization; Sₙ realization over ℚ; the Gassmann fixed-field arithmetic-equivalence example; and the finite-Galois radical equivalence with its polynomial consequences. The middle three are already supplied by the completed roadmap/native library. The new radical equivalence is stated correctly in Suggested.lean. The classification and new arithmetic/polynomial headlines are missing as described in R06. The module docstring's lack of a future comparison module is not lack of a carrier for the classification theorem.

**Adversarial calculations (135 rows).** Here `T/F` denotes true/false, cycle multisets include fixed points, and source-data counts are distinguished from classification proofs. Repeated API examples of the same mathematical assertion share the corresponding row. Values were obtained by exact permutation closure, integer/rational polynomial arithmetic, modular division, or the explicit small-field/group calculation shown in the row. The table covers all seven seeded targets, the headlines, the convention boundaries and the mathematical claims touched by findings.

| Statement or interface | Instances tried | Values on the two sides | Result and change |
|---|---|---|---|
| Root count and degree bookkeeping | `1`, `X`, `X²−2` over ℚ | root counts `0,1,2`; degrees `0,1,2` | Equal; keep nonzero/separable hypotheses. |
| Zero-polynomial boundary | `0` | `natDegree=0`, rootSet empty; separability F | Excluded by standing nonzero/separable premises. |
| Inseparable boundary | `X²−t` over 𝔽₂(t) | degree 2, one geometric root, trivial automorphism group | Excluded; no degree-two label. |
| Transitivity iff irreducibility | `X²−2`, `(X²−2)²`, `X²−1` | `(T,T)`, `(T,F)` without separability, `(F,F)` | The repeated-factor negative control is valid. |
| Orbit/factor correspondence | `(X−1)(X²−2)` over ℚ | root orbits `1,2`; monic irreducible-factor degrees `1,2` | Equal; reducible case retained. |
| Root dictionary under base isomorphism | complex conjugation, `X²+1` | roots `i,−i` exchanged; two images before/after | Same bijection cardinal 2; ambient fields retained. |
| Faithful root-action image | `X³−2` over ℚ | `Gal=S₃`, image order 6, kernel order 1 | Injective, not merely an abstract order match. |
| Full cycle type definition | identity in S₀/S₁/S₄ | `[]`, `[1]`, `[1,1,1,1]` on both sides | Fixed-point restoration correct. |
| Full cycle type, sign and order | `(01)` in S₄ | full `[1,1,2]`, sign −1, order 2; product of cycle signs −1, lcm 2 | Equal. |
| Full cycle transport and inversion | `(012)` in S₄ and its inverse | both `[1,3]`; order 3, sign +1 | Renumbering/inversion preserve the multiset. |
| Cycle powers | `(01)(234)` cubed | `[2,3]` becomes `[1,1,1,2]`; order `6→2` | Odd power is the single transposition. |
| Product of disjoint root actions | `(X²−2)(X²−3)` | image V₄ of order 4; simultaneous flip type `[2,2]` | Independent factors give product, not S₄. |
| Normal closure and point stabilizer | ℚ(∛2)/ℚ | closure degree 6; `G=S₃`, stabilizer order 2, index 3 | Matches root field degree 3. |
| Embeddings versus conjugate subfields | ℚ(√2)/ℚ | `|G/H|=2`; `|G/N(H)|=1` | Two embeddings, one subfield; normalizer quotient is essential. |
| Conjugate cubic fields | ℚ(∛2) in its closure | `|G/H|=3`, `|G/N(H)|=3` | Stabilizer is self-normalizing. |
| Field reconstruction qualification | ℚ(√2), ℚ(√3) | both abstract pairs `(C₂,1)`; discriminants 8 and 12 | Abstract pair alone is insufficient. The reconstruction sentence is sound only with the fixed ambient normal closure/action retained; no separate false-theorem finding is based on that ambiguous reading. |
| Block–stabilizer order correspondence | C₄ regular action, base point 0 | `{0}`, `{0,2}`, all points map to subgroup orders `1,2,4` | Inclusion preserved; inverse orbits have sizes `1,2,4`. |
| Failure without transitivity | trivial group on `{0,1}` | two blocks `{0}`, `{0,1}`; both stabilizers order 1 | Map not injective; negative control correct. |
| Minimal/maximal block distinction | C₄ regular, block `{0,2}` | stabilizer acts as C₂ on two points; quotient C₂ on two blocks | Both primitive actions have size 2, on different carriers. |
| Wreath carrier, inclusions and order | `C₂ ≀ Sₘ`, `m=0,1,2` | orders `1,2,8`; formula `2^m m! = 1,2,8` | Empty and singleton cases agree. |
| Wreath projection/kernel | `C₂ ≀ S₂` | kernel order 4, quotient order 2, total 8 | `4·2=8`; base normal, top inclusion injective. |
| Wreath functoriality/regular comparison | identity map of C₂, index set C₂ | both maps fix all 8 elements; both regular/symmetric descriptions have 8 elements | Equality of maps on this case, not equality of differently bundled carriers. |
| Two wreath actions | `C₂ ≀ S₂` acting on pairs / binary functions | carrier sizes `2·2=4`, `2²=4`; both imprimitive | Construction does not imply primitivity. |
| Product primitivity, missing faithfulness | `C₃×C₂` through C₃ on three points, two coordinates | action kernel order 4; nine functions partition into three lines `x−y=c` of size 3 | Countermodel excluded by faithfulness. |
| Imprimitivity embedding | C₄ on four points, two-point blocks | image order 4 inside wreath order 8; kernel 1 | Faithful embedding possible. |
| Nonfaithful embedding countermodel | `C₃×C₄` through C₄ | group order 12, image 4, kernel 3, target order 8 | `12∤8`; claimed injection would fail without faithfulness. |
| Jordan p-cycle bound | `AGL(1,5)`, `AGL(1,8)` | orders 20,56 versus `|A₅|=60`, `|A₈|=20160`; cycles 5,7 | Both violate `p+3≤n`; cannot weaken to `p+1≤n`. |
| Prime-degree transposition recognition | transitive C₃ and S₃ | C₃: no transposition, order 3; S₃: transposition, order 6 | Hypothesis separates them. |
| `(n−1)`-cycle recognition | S₄ natural action | point stabilizer S₃ transitive on other 3 points | Ordered distinct-pair orbit size `4·3=12`. |
| `1T1` reference | identity on one point | closure order 1; even T, primitive T, solvable T | Matches row; degree 0 intentionally has no label. |
| `2T1` reference | `(01)` | order 2; even F, primitive T, solvable T | Matches row. |
| `3T1` reference | `(012)` | order 3; even T, primitive T, solvable T | Matches row. |
| Exact generators: `3T2` | `(02),(01)` | closure = all six permutations = native top | Exact subgroup equality, not only cardinality. |
| `4T1` reference | `(0123)` | order 4; two elements of order 4; even F, primitive F | Distinguishes C₄ from V₄. |
| Exact generators: `4T2` | `(01)(23),(03)(12)` | closure = identity plus three double swaps; size 4 | Exact Klein-four subgroup; no element of order 4. |
| `4T3` reference | `(0123),(02)` | order 8; five involutions, two elements of order 4; even F | Correct dihedral action preserving opposite pairs. |
| Exact generators: `4T4` | `(123),(023)` | closure contains all 12 even permutations and no odd ones | Exact A₄. |
| Exact generators: `4T5` | `(0123),(01)` | closure contains all 24 permutations | Exact S₄. |
| `5T1` reference | five-cycle | order 5; four nonidentity elements order 5; even T | Cyclic/primitive/solvable. |
| `5T2` reference | five-cycle and `(03)(12)` | order 10; five involutions; even T | Dihedral/primitive/solvable. |
| `5T3` reference | five-cycle and affine `a↦2a+1` | order 20; ten elements order 4; even F | Frobenius/primitive/solvable. |
| Exact generators: `5T4` | `(012),(234)` | closure = 60 even permutations | Exact A₅, nonsolvable. |
| Exact generators: `5T5` | `(01),(01234)` | closure = all 120 permutations | Exact S₅, nonsolvable. |
| Low-degree uniqueness/order recognition | C₄ versus V₄; five degree-five rows | degree 4 orders `4=4` but cyclicity T/F; degree 5 orders `5,10,20,60,120` distinct | Order-only recognition confined to its valid range. |
| Degree-five order-six recognition | five reference groups | counts of order-six elements `0,0,0,0,20` | Forces S₅. |
| Solvability iff contained in conjugate F₂₀ | degree-five rows | solvable flags `T,T,T,F,F`; possible containment orders `5,10,20` divide 20, `60,120` do not | Both directions agree in classification table. |
| Fixed inputs and values | GAP rows for degrees 6–11 | counts `16,7,50,34,45,8`; sum 160 | Data count verified; not a completeness proof. |
| Evolve canonical declarations in place | `n=0,5,6,12` | pinned counts `0,5,0,0`; promised counts `0,5,16,0` | Low degrees preserved; degree-six carrier must change. |
| Complete basic API for every new row | `6T6` | order 24, normalizer 48, centralizer 2; even F, primitive F, solvable T | Concrete values available; unspecified other row contracts remain R10/R11. |
| Global primitivity formula after evolution | `6T6`, index 5 | actual F; old RHS `6≠4 ∨ 3≤5 = T` | R10; old formula must be restricted/replaced. |
| Global solvability formula after evolution | `6T16=S₆`, index 15 | actual F; old RHS `6≠5 ∨ 15<3 = T` | R10. |
| Finite proof producer | S₃ maximal-subgroup cover | proper subgroup types `1,C₂,C₃`; cover orders 2 and 3; decreasing lengths at most 2 | Mathematical cover sound; executable producer removed by R05. |
| Required `6T6` comparison | `r=(024)(135)`, `t=(25)` | closure size 24; element-order counts `1:1,2:7,3:8,6:8` | Matches A₄×C₂ action, not S₄ (which has order-four elements). |
| `6T6` pair flips and centre | `t, rtr⁻¹, r²tr⁻²` | flips `(25),(14),(03)` in cyclic order up to orientation; kernel order 8, centre order 2 | `8·3=24`; central generator `(03)(14)(25)`. |
| `6T6` block quotient | blocks `{0,3},{1,4},{2,5}` | r induces a three-cycle, t identity; image order 3 | Quotient is `3T1`, separately from six-point comparison. |
| Outputs and order | degree-six transitive group above | mathematical label required sixth of 16; pinned index set has cardinal 0 | Missing producer headline, not an inhabited native index; R06. |
| Blocks and intermediate fields | C₄ quartic extension | fields degrees `1,2,4`; containing-root blocks sizes `4,2,1` | Order reversed, endpoints correct. |
| Endpoint minpoly normalization | `2X²−4`, root √2 | actual `X²−2`; claimed `2X²−4` | R02; normalize, retaining root set. |
| Primitivity/intermediate-field atom | cubic versus cyclic quartic | cubic has no degree-between-1-and-3 field; quartic has degree-2 field | Primitive T/F respectively. |
| Two-transitivity/root-field factor | `X³−2`, `X³−3X−1` | root-field remaining quadratic irreducible / split; stabilizer orbits `2` / `1,1` | Two-transitivity T/F. |
| Products/towers as fiber product | duplicate `X²−2` versus independent `X²−2`,`X²−3` | image sizes 2 versus 4; full product size 4 | Shared splitting field forces diagonal, not full product. |
| Discriminant normalization/root product | roots `0,1,2` | squared differences `1·4·1=4`; cubic discriminant 4 | Sign normalization correct. |
| Constant and repeated-root discriminants | monic `1`, `X`, `(X−1)²` | discriminants `1,1,0`; separability `T,T,F` | Boundary values agree under nonzero hypothesis. |
| Integral versus field separability | `X²−1` over ℤ and ℚ | discriminant 4 in both; derivative coprimality F over ℤ, T over ℚ | Field/fraction-field distinction necessary. |
| Alternating-square criterion | `X³−3X−1`, `X³−2` | discriminants 81 and −108; square T/F; groups C₃/S₃ even T/F | Both directions agree. |
| Characteristic-two negative control | `X²+X+1` over 𝔽₂ | discriminant 1 square; Galois C₂ swaps roots, even F | Characteristic exclusion necessary. |
| Discriminant field | `X²−2` then base change to ℚ(√2) | ℚ(√8)=ℚ(√2), degree 2; after base change degree 1 | Fixed even subgroup and base change agree. |
| Universal resolvent specification | quartic pairing, quintic Φ, quintic pair sum | stabilizer/orbit sizes `(8,3),(20,6),(12,10)`; products 24,120,120 | Exact carriers and index counts agree. |
| Wrong quartic pairing | `x₀x₂+x₁x₃` versus `x₀x₁+x₂x₃` | same orbit of size 3; different stabilizers of order 8 | Exact stabilizer law excludes conjugate-but-wrong reference. |
| Rename direction | swap indices 0,1 applied to `x₀x₂` | output `x₁x₂`; inverse swap gives same; cycle `(012)` gives `x₁x₀` | Left rename sends variable index forward, not backward. |
| Symmetric descent and uniqueness | two roots `a,b` | orbit product `X²−(a+b)X+ab`; elementary expression `X²−e₁X+e₂` | Coefficients descend integrally; no division by group order. |
| Vieta, valid indices | roots `2,3`, polynomial `X²−5X+6` | `e₁=5=−(−5)`, `e₂=6=6` | Correct within bounds. |
| Vieta, out-of-range index | root `[1]`, `n=1,k=1` | `e₂=0`, claimed coefficient expression −1 | R03. |
| Specialization/base change | quartic `X⁴+X+1`, mod 2 | integral resolvent `X³−4X−1`; reduction `X³+1` on both sides | Universal reduction identity agrees. |
| Specialization degree in zero ring | degree-three resolvent mapped to zero ring | image zero, natDegree 0 rather than 3 | Nontrivial-ring hypothesis on degree is necessary and present. |
| Orbit-product collision | `X⁵−X` | six symbolic orbit members, only three values: `2` four times, `4i`, `−4i` | Symbolic distinctness does not imply distinct values. |
| Collision polynomial | same quintic | both coefficient and orbit forms `(X−2)^4(X²+16)`; discriminant 0 | Generic factor/orbit theorem needs separation. |
| Resolvent edge H=top/bottom | S₃ | indices `1,6`; orbit sizes `1,6` | Linear versus degree-six universal resolvent. |
| Root enumeration law | `X²−1`, ordered roots `[1,−1]` / `[−1,1]` | products both `X²−1`; repeated `[1,1]` gives `X²−2X+1` | Root-product/bijectivity laws exclude wrong enumeration. |
| Resolvent factors as G-orbits | quartic with V₄ image | cubic resolvent has three linear factors; orbit sizes `1,1,1` | Correspondence agrees under separation. |
| Rational root without generic separation | `X⁵−X` sextic | value 2 fixed, four symbolic representatives above it | Value alone does not select a fixed symbolic representative; R04 distinguishes irreducible quintics. |
| Tschirnhaus admissibility | root set `{−1,1}`, T=X / T=X² | image sizes 2 / 1 | Identity admissible; square map not admissible. |
| Tschirnhaus transport | same set with T=X+1 | old roots `−1,1`, new roots `0,2`; both splitting fields ℚ | Admissible change preserves Galois action. |
| Quartic depression | `X⁴+aX³+…`, shift `−a/4` | new cubic coefficient `4(−a/4)+a=0`; in char 2, 4=0 | Invertibility premise essential. |
| Quartic S₄ row | `X⁴+X+1` | discriminant 229; resolvent `X³−4X−1`, discriminant 229, no rational root | Nonsquare + irreducible cubic gives S₄. |
| Quartic A₄ row | `X⁴+8X+12` | discriminants both `331776=576²`; resolvent `X³−48X−64` irreducible | Square + irreducible cubic gives A₄. |
| Quartic D₄ row | `X⁴−2` | discriminants −2048; resolvent `X(X²+8)`; unique rational root 0 | Nonsquare, one resolvent root; remains irreducible over ℚ(√−2). |
| Quartic V₄ row | `X⁴+1` | discriminant 256; resolvent `X(X−2)(X+2)` | Three rational roots and even V₄ image. |
| Quartic C₄ row | `X⁴+X³+X²+X+1` | discriminant 125; resolvent `(X−2)(X²+X−1)` | Unique rational root 2; quartic becomes reducible over ℚ(√5). |
| Kappe–Warren paired quadratics | `X⁴−2`, r′=0 | auxiliary polynomials `X²`, `X²−2`; not quartic factors | Correct distinction from a claimed factorization of f. |
| Dummit invariant stabilizer | ten exponent vectors, all 120 permutations | stabilizer exactly affine group size 20; orbit size 6 | Supports exact F₂₀, not only its order. |
| Dummit formula, pure quintic | `X⁵−2` | sextic `X⁶−50000X`; value at 0 = 0 on both constructions | Correct normalization. |
| Dummit formula, dihedral quintic | `X⁵−5X−12` | sextic coefficients ascending `[976000000,−66400000,250000,−20000,1000,−40,1]`; value at 40 = 0 | Correct sign; source p.399 misprint identified. |
| Dummit second-example source misprint | printed cubic coefficient +20000, x=40 | printed sextic value 2560000000; corrected value 0 | Equation (2′) requires −20000. |
| Dummit third-example source misprint | printed constant, x=−9955 | printed value 324234617080000000000; corrected value 0 | Constant must be −360260685644469671875. |
| Quintic rational criterion | preceding two irreducible quintics | Galois groups F₂₀/D₅ solvable; rational sextic root T/T | Full source criterion retained by R04. |
| Pair-sum resolvent | unordered pairs of five distinct formal variables | orbit size `5·4/2=10`; stabilizer `2!3!=12` | Degree 10, not 20 ordered pairs. |
| Factor degrees, arithmetic Frobenius | `X²+X+1` over 𝔽₂ | Frobenius swaps α and α²; orbit size 2, factor degree 2 | Arithmetic direction x↦x² fixed. |
| Finite-field boundary | 𝔽₂, split `X(X−1)` | Frobenius fixes both; degrees `[1,1]` | Fixed points retained; a one-element field does not exist. |
| Factor-degree multiplicity | `X²` modulo 2 | multiset `[1,1]`, sum 2; distinct-factor set size 1 | Multiplicities retained. |
| Factor-degree zero/unit cases | `0`, `1` modulo a prime | normalized-factor lists empty, degree multisets `[]` | No positive-degree irreducibility inference. |
| Good polynomial prime versus resolvent prime | `X⁵−5X−12`, p=3 | polynomial discriminant `64000000 ≡1`; sextic discriminant `≡0` | Polynomial-good does not imply resolvent-good. |
| Dedekind unramified/index control | `X³+X²−2X+8`, p=2 | polynomial discr −2012=`4·(−503)`; reduction `X²(X+1)` | Index 2 invalidates the polynomial-good premise despite field unramifiedness. |
| Factorization membership, S₅ example | `X⁵−X−1`, p=2,3 | factors `[2,3]`, `[5]`; corresponding permutation types identical | Order 6 and 5 witnesses; cannot infer every group element from one prime. |
| Label definition negative controls | `(X²−2)²`, `X(X−1)`, constant 1 | separability F / transitivity F / positive degree F | No transitive label in each case. |
| Numbering independence of label | swap labels on `X²−2` roots | image subgroup C₂ unchanged; label `2T1` twice | Conjugacy predicate gives same label. |
| C₅/D₅ limitation | cyclic quintic below, `X⁵−5X−12` | square discriminants `121²`, `8000²`; sextic roots `−16`,40 | Same two coarse predicates, distinct labels. |
| Cyclic quintic worked example | `X⁵+X⁴−4X³−3X²+3X+1` | discr 14641; mod 2 factor `[5]`; fifth-degree real cyclotomic subfield | C₅, label `5T1`. |
| Dihedral quintic worked example | `X⁵−5X−12` | discr 64000000; mod 7 `[5]`, mod 3 `[1,2,2]` | D₅, label `5T2`. |
| Frobenius quintic worked example | `X⁵−2` | discr 50000; mod 11 `[5]`; sextic root 0 | F₂₀, label `5T3`. |
| Alternating quintic worked example | `X⁵+20X−16` | discr `1024000000=32000²`; mod 3 `[5]`, mod 7 `[1,1,3]` | A₅, label `5T4`. |
| Symmetric quintic worked example | `X⁵−X−1` | discr 2869 nonsquare; mod 2 `[2,3]`, mod 3 `[5]` | S₅, label `5T5`. |
| Certificate soundness boundary | false supplied modular identity / true S₅ data | checker success F / verified patterns `[2,3]`,`[5]` | Soundness is conditional; computational interface is existing work, not a new roadmap target. |
| Full-symmetric predicate | `X`, `(X²−2)²` | first degree1/group1=`1!`; second degree4/group2≠`4!` though root action onto S₂ | Separability/degree prevents wrong full-symmetric claim. |
| Sₙ realization, small n | `n=1,2,3` via X, `X²−2`, `X³−2` | group orders `1,2,6` = factorials | Degree1 separate argument valid. |
| Three-prime patterns, n=2 | irreducible quadratic mod2; split distinct mod3; irreducible quadratic mod5 | factor types `[2]`, `[1,1]`, `[2]` | Distinct linear factors exist over 𝔽₃; no nonexistent pattern needed. |
| Three-prime patterns, n=3 | irreducible cubic mod2; linear×quadratic mod3/mod5 | `[3]`, `[1,2]`, `[1,2]` | Transitivity plus transposition yields S₃. |
| Recognition in general realization | n=5, types `[5]`,`[1,4]`,`[2,3]` | transitive; point stabilizer 4-cycle; cube of last type `[1,1,1,2]` | Primitive plus transposition yields S₅. |
| CRT coefficients | residues 0 mod2, 1 mod3, 2 mod5 | coefficient 22 has residues `(0,1,2)` | One explicit simultaneous lift; monic leading coefficient remains 1. |
| Gassmann finite pair supplied by IR | regular C₄×C₄ versus Q₈×C₂ | both element orders: `1:1,2:3,4:12`; regular types `[1^16],[2^8],[4^4]` | Equal S₁₆ class counts, nonisomorphic groups, hence nonconjugate. |
| Gassmann field degrees | subgroups of order 16 in S₁₆ | `16!/16 = 15! = 1307674368000` twice | Degree calculation correct. |
| Almost-conjugacy, trivial/equal input | E=ℚ or H=K | fixed fields equal; coefficient at 0 =1 and at 1 =1 on both sides | Includes totalized native coefficient convention; not the convention a(0)=0. |
| Fixed-field isomorphism iff conjugacy | S₃ splitting field, H=⟨(01)⟩, K=⟨(12)⟩ | conjugator exists; two cubic fields are ℚ-isomorphic; H order2 vs A₃ order3 gives degrees3 vs2 | Both directions discriminate; ambient extension is fixed. |
| Radical headline, trivial extension | E=F | Gal order1 solvable; every embedded x is in base subfield | Both sides T; no need for a nontriviality premise. |
| Radical headline, quadratic | ℚ(√2)/ℚ | C₂ solvable; `(√2)²=2` | Both sides T. |
| Radical headline, nonabelian | splitting field of `X³−2` | S₃ derived orders `6,3,1`; adjoining ζ₃ then ∛2 gives radical tower | Both sides T; abelian hypothesis unnecessary. |
| Radical headline, nonsolvable | splitting field of `X⁵−X−1` | S₅ derived subgroup A₅ order60, next still60; no radical root by Abel–Ruffini | Both sides F. |
| Normal prime-index input | S₃ versus trivial group | A₃ normal index2; trivial group has no prime-index subgroup | Induction treats order1 separately, as required. |
| Root-of-unity enlargement | S₃ example, N=6 | ζ₆⁶=1; ζ₆³ has order2, ζ₆² order3 | N positive; prime divisors provide needed Kummer roots. |
| Compositum restriction | E₀=ℚ(√2), F₁=ℚ | compositum E₀, restriction C₂→C₂ kernel1 | Supremum=top premise has actual content. |
| Relative-field induction/Kummer | `M=ℚ(√2)`, K=ℚ | `[M:K]=2`; α²=2; remaining dimension decreases `2→1` | Containment carries through adjoining α. |
| All-roots versus some-root corollary | `X(X⁵−X−1)` | one rational radical root 0, splitting group S₅ nonsolvable | Some-root criterion false for reducible q; all-roots statement excludes it. |
| Repeated factors in radical corollary | `(X²−2)²` | splitting group C₂; distinct roots ±√2 both radical | Nonzero reducible/repeated-polynomial corollary remains valid. |
| Prime degree/two nonreal roots | `X³−2`, degree3 | real roots1, complex roots3, difference2; S₃ solvable | Necessity of `p≥5` demonstrated. |
| Empty/out-of-range label and padding | n=0 and pinned n=6 | index cardinalities0,0; identity full-cycle equation definitionally equal | No manufactured label; R07/R08 delete the boundary catalogue. |

**Source sample: seven targets, 16 readable source texts.** Six exact low-degree generators were checked against LMFDB entries, after translating coordinates by subtracting one: `lmfdb-3T2` line 311, `lmfdb-4T2` line 317, `lmfdb-4T4` line 321, `lmfdb-4T5` line 319, `lmfdb-5T4` line 323, `lmfdb-5T5` line 321. Exact finite subgroup enumeration gave the six equalities, not merely matching orders.

| Seeded target | Source inspected at locator | What is established / limitation |
|---|---|---|
| Exact generators | the six LMFDB lines above; the six companion proofs also elaborate | Displayed permutations agree after coordinate shift; full closure comparisons succeed. |
| Fixed inputs and values | `gap-transgrp-trans` lines 43–69; `gap-transgrp-8` lines 17–76; `gap-transgrp-9` lines 17–57; `gap-transgrp-10` lines 17–77; `gap-transgrp-11` lines 18–28 | Counts `16,7,50,34,45,8`; names and generators are data. Fixed commit `165fc21ff497b24b7a5975582b331e6692ba04f1`. |
| Evolve canonical declarations in place | native Basic:66,94,102,138,150; GAP rows above | Exact boundary change identified. This is a new library target, not a theorem supplied by the GAP data. |
| Complete basic API for every new row | `lmfdb-6T6` lines 200,236,289,303,327; GAP properties, including `gap-transgrp-11` lines 30–37 | `6T6` invariants verified independently. No exact normalizer/centralizer target list exists for all 160 rows. |
| A finite proof producer | `hulpke-transitive` §3, author version pp.3–5, lines 181–201 | Lemma 3.1 concerns inflation classes and Theorem 3.1 the wreath embedding; these are not the README's complete certificate-verifier/termination contract. R05/R11. |
| Required `6T6` comparison | `gap-transgrp-trans` line 48; `lmfdb-6T6` line 327 and invariant lines above | Generators, order24, odd parity, imprimitivity, solvability and A₄×C₂ action agree. Belyi's specific carried triple is a separate consumer target. |
| Outputs and order | completed owner; native labels; BelyiMaps §§1.6/14.6 | Correct supply direction; future degree-six label cannot be tested using the pin's empty index. Classification proof locator unresolved. |

For the remaining inspected sources, Conrad Definition 3.1 and (3.7), printed p.6 (`conrad-cubicquartic` lines 244–248), Theorem 3.4 p.7 (line 275), Theorem 3.6/Table 4 p.7 (lines 289–295), Corollary 3.8 p.9 (347–355), and Theorem 4.1 p.10 (393–400) support the quartic formulas and decision table with irreducibility and characteristic not two. The standing irreducibility premise preceding Theorem 4.1 matters. The roadmap's reducibility-over-the-discriminant-field reformulation follows from the C₄/D₄ subgroup actions: the even C₄ subgroup has two root orbits, while the even V₄ in D₄ is transitive. Dummit §2 p.388 fixes the invariant/stabilizer; equation (2′) and Theorem 1 p.389 are at `dummit-quintics` lines 99–118. The source formula and its hypotheses were read, not inferred from the README's “Inspected” labels. The author-hosted Hulpke version has 34 pages; its pagination was not silently identified with the 30-page journal version.

**Duplication and pin audit.** Mathlib is pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 25 file/locator entries were opened for the stated objects; these are positive evidence of existing ownership, not claims that every theorem in those modules was reproved here.

| Pinned file and line | Object and material hypotheses checked |
|---|---|
| `Mathlib/GroupTheory/GroupAction/Blocks.lean:572` | `MulAction.block_stabilizerOrderIso`, existing transitive-action block correspondence. |
| `Mathlib/FieldTheory/AbelRuffini.lean:197` | `solvableByRad` root-adjoining closure; the root exponent must be nonzero. |
| `Mathlib/FieldTheory/AbelRuffini.lean:301` | `isSolvable_gal_minpoly`, and :313 `isSolvable_gal_of_irreducible`; one direction only. |
| `Mathlib/FieldTheory/KummerExtension.lean:563` | `isCyclic_tfae`: finite dimension and a primitive root of order equal to that dimension. |
| `Mathlib/FieldTheory/Galois/Basic.lean:575` | `IsGalois.sup_right`: finite Galois first field and supremum top. |
| `Mathlib/FieldTheory/Galois/Basic.lean:641` | restriction injectivity requires supremum top and normality; no linear-disjointness needed for injection. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:329` | relative dimension one iff intermediate field is top. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:455` | restriction of an adjoin is a supremum; supplies the induction's containment step. |
| `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:939` | constant-polynomial discriminant convention, including constant zero. |
| `TauCeti/GroupTheory/Perm/Partition.lean:96` | native full cycle type adds ones for fixed points. |
| `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:66` | native counts; :94 zero-above-five; :102 index; :138 reference; :150 ambient-conjugacy predicate. |
| `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.lean:107` | existing low-degree closure/classification results, including C₃ = A₃. |
| `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Primitive.lean:115` | global primitivity formula currently relies on absent higher indices. |
| `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Parity.lean:37` | parity table and its empty-higher-index branch at :65. |
| `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Solvable.lean:142` | solvability table and zero-boundary branch; transitive F₂₀-containment theorem at :165. |
| `TauCeti/GroupTheory/Perm/Jordan.lean:154` | native generalized Jordan p-cycle theorem. |
| `TauCeti/GroupTheory/Solvable.lean:78` | normal subgroup of prime index requires finite, solvable, nontrivial group. |
| `TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.lean:69` | native specification has actual invariant, exact stabilizer and orbit-product descent data, not a free completeness proposition. |
| `TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.lean:151` | specialization, and :172 nontrivial-ring degree theorem; coefficient base change at :190. |
| `TauCeti/FieldTheory/GaloisGroups/Label.lean:111` | label includes separability, degree and transported root-action conjugacy; :240 existing unique-label theorem through degree five. |
| `TauCeti/FieldTheory/GaloisGroups/ConjugateFields.lean:59` | native conjugate-simple-field carrier in a fixed normal extension; the ambient field is part of the data. |
| `TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.lean:44` | existing Sₙ realization, not a new theorem to plan. |
| `TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean:421` | root-product formula; :669 monic separability test, :679 nonzero general field test, :704 fraction-field form. |
| `TauCeti/NumberTheory/NumberField/SplittingField.lean:35` | native splitting-field number-field instance. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Trivial.lean:54` | ideal-count coefficient, including zero ideal; :59 coefficient0=1, :63 totalized zeta comparison, :155 rational coefficient=1. |

Object searches used the roadmap service over main and indexed open heads, and searched board packages for block correspondences, reference subgroups, resolvents, Gassmann data and radical closures. The completed polynomial roadmap owns the existing library. `PolynomialGaloisGroupsPartII` at its supplied open head, README:1–90, extends it toward ramified reductions, factorization distributions and further irreducibility criteria; it does not justify re-opening the completed base. BelyiMaps at its supplied head, README:5221–5230, consumes the exact `6T6` and quotient comparisons; it does not own another reference family. Induction–Restriction owns the finite almost-conjugate pair and transports. No second owner of the new degree-six-to-eleven classification or the radical converse was found in the searched board packages. This audit uses only the supplied open checkouts as ownership evidence, not unprovided PR revisions as suppliers.

**Supplier-order and citation audit.** All `*Needs:*` lines were read. The dependency check returned exactly:

```text
depcheck: 162 roadmaps, 1170 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Belyi is a consumer, not a prerequisite; the Sₙ construction depends on group recognition and the polynomial Frobenius theorem, not on later label packages. The radical route uses native finite solvable-group and Kummer results; it does not depend on its own conclusion.

The substantive external roadmap contracts were resolved as follows:

| Citation | Resolved owner and locator | Result |
|---|---|---|
| Number Field Arithmetic 3.10 | `Completed/NumberFieldArithmetic/README.md:1039`; native `TauCeti/NumberTheory/NumberField/Frobenius/CycleType.lean:164` | Monic polynomial, prime not dividing polynomial discriminant; reducible input permitted and fixed points included. |
| Number-field splitting field | `TauCeti/NumberTheory/NumberField/SplittingField.lean:35`; completed Number Field Arithmetic §3.8 | Native instance exists; no fictitious §8.4 supplier. |
| IR 2.1 transports | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/Suggested.lean:775` and :811 | `Gassmann.not_conj_comap` and `almostConjugate_comap` exist in the stated namespace on main. |
| IR 2.2 finite pair | same file :825 | `Gassmann.exists_S16_gassmann_pair` gives both subgroup orders 16, almost-conjugacy and nonconjugacy. |
| BelyiMaps 1.6/14.6 | supplied open head, README:5160 and :5221–5268 | Consumes the extension and separately compares its actual carried triple and quotient; no reverse edge. |
| PolynomialGaloisGroupsPartII | supplied open head, README:1–90 | Existing continuation acknowledges the base boundary and owns other extensions. |

The citation tool's five unresolved-name leads are not five defects: the three Gassmann declarations and their namespace are in Induction–Restriction's submodule on main, and the radical declaration is local at Suggested:3407. General mentions of RepresentationTheory and LFunctions in `Related roadmaps` are ownership boundaries, not consumed theorem declarations. No declared supplier gaps were supplied in the brief.

## Not verifiable

- The general degree-six-to-eleven classification proof and all 160 invariant rows were not certified from a primary theorem at an exact locator. The GAP source supplies the exact list, and the small permutation computations test selected rows; neither replaces a classification proof. Butler–McKay's DOI landing page returned HTTP 403. The README supplies no internal theorem/table/page for the new claim. R11 records this locator defect without pretending the classification itself is false.
- Dixon–Mortimer (block/wreath/Jordan and table locators) was returned as uncertified/paywalled by the source service. Wielandt (Theorems 7.5, 13.9), van der Waerden (Algebra I §61), and Serre (Topics in Galois Theory §4.4) were not obtained legally through its bibliographic searches. Their exact printed locators are therefore not certified here. Corresponding pinned results and explicit witnesses were checked independently; that does not certify a book's page numbering.
- Perlis 1977 Theorem 1 and Gassmann 1926 pp.665–675 were not obtained by the service's title searches. The fixed-field arithmetic-equivalence source claim remains unverified against those texts; its elementary degree calculation and finite-group supplier were checked. No new source was guessed from the README's assurance of inspection.
- The original Kappe–Warren article was not readable from its DOI endpoint (HTTP 403). Its criterion was read in Conrad Theorem 4.1 with the preceding irreducibility assumption, so the mathematical criterion has secondary-source verification but the original article's page locator is not independently certified.
- Conway–Hulpke–McKay's publisher landing page did not yield a readable legal text through the service. Stauduhar's publisher landing likewise did not yield a fetched text. Cohen §6.3, Soicher–McKay, Geissler–Klüners and Berlekamp were returned as uncertified/paywalled. These are contextual/excluded-material references in this README, not unchecked replacements for a used proof.
- Hulpke was subsequently obtained from the author's page using the same source key; the inspected author version's §3 supports the inflation/wreath discussion, not the README's entire verifier architecture. Dummit, Chapman, Conrad, the seven LMFDB entries and five fixed GAP files were legally readable. Resolved entries were removed from the missing-text request; inaccessible works remain recorded once, without changing a source manifest in the PR.
- This is not a proof audit of every native theorem or an exhaustive enumeration of subgroups through degree eleven. In particular, abstract reconstruction of a field from a permutation-group isomorphism class alone was not accepted: the fixed normal closure must remain part of the input. No source passage was copied into the PR, and no fetched source code was executed.

## Source issues

- **Gap** in dummit-quintics at Theorem 1 proof, printed p. 389: the source infers an irreducible quintic factor from a five-cycle without excluding coincident values; it should justify distinctness using the difference identities and irreducibility; affects the proof.
- **Misprint** in dummit-quintics at second example, printed p. 399: the source gives the sextic's cubic coefficient as +20000; it should be −20000, as equation (2′) gives; affects a stated result.
- **Misprint** in dummit-quintics at third example, printed p. 400: the source gives constant term −36026068564469671875; it should be −360260685644469671875, making the stated root −9955 vanish; affects a stated result.

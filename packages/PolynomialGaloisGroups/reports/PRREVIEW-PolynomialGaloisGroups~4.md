# Review of PolynomialGaloisGroups (pull request #763 at 86b0515)

**Verdict:** needs changes

## R01 (P2) — The continuation still occupies the completed roadmap's folder

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1`, “part III”; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:27`, `namespace TauCetiRoadmap.PolynomialGaloisGroupsPartIII`; `TauCetiRoadmap/PolynomialGaloisGroups/README.md:191`, “From TauCetiRoadmap.PolynomialGaloisGroups”.

**Claim:** a distinct continuation consumes the completed base, but its folder still gives it the base roadmap's identity. Previous R01 remains unresolved; this is repairable packaging, not a demand to replace the mathematical programme.

**Witness:** Main's base is `Completed/PolynomialGaloisGroups/README.md:57`, excluding degrees 6–11. This folder instead owns those degrees. Its unchanged `STATUS.md:34` still says that nothing remains and degrees 6–11 are excluded.

**Exact repair:** move the continuation to `TauCetiRoadmap/PolynomialGaloisGroupsPartIII/`, retaining its matching namespace and metadata, and omit the base roadmap's generated `STATUS.md` and `PROGRESS.md` from the new folder. Keep the supplier citation naming the completed base. The prospective-name dependency check was run: it reports only `NOT IN ORDER`, with no upward edge or cycle. This is permitted placement after the last supplier, not an additional finding. No move was made during review.

## R02 (P2) — Both companion Lean files still duplicate base-library material

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/Compatibility.lean:17`, `abbrev numTransitiveGroups : ℕ → ℕ := TauCeti.numTransitiveGroups`; `TauCetiRoadmap/PolynomialGaloisGroups/PrescribedGenerators.lean:12`, “Proof bodies adapted without mathematical change”.

**Claim:** the continuation consumes native definitions and completed base results; these two unchanged files instead retain aliases, definitional identities and six proofs about the base's degree-at-most-five references. They are not this continuation's headline acceptance tests. `Compatibility.lean` also lacks the required `import Mathlib`.

**Witness:** `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:66` already defines the aliased count; lines 116–145 define the degree-three-to-five reference groups. `Completed/PolynomialGaloisGroups/README.md:1172` owns their classification. Neither companion is imported by `Suggested.lean`.

**Exact repair:** delete `Compatibility.lean` and `PrescribedGenerators.lean`; keep the native supplier citations in the README. The six displayed generator closures were recomputed with orders `6, 4, 12, 24, 60, 120`, matching `S₃`, `V₄`, `A₄`, `S₄`, `A₅`, `S₅`. Their mathematics remains with the completed base. The successful targeted build uses neither companion, so removing them does not remove an acceptance-test dependency. This carries forward previous R02.

## R03 (P3) — The new consumer sentence assigns the field-pair citation to the wrong section

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:692`, “7.2 cites the arithmetically equivalent pair of 4.3”.

**Claim:** FiniteGroupInvariants §7.2 cites this roadmap's constructed number fields.

**Witness:** `TauCetiRoadmap/FiniteGroupInvariants/README.md:834`–835 cites Induction–Restriction §2.2 for the group pair. The number-field-pair citation is instead in its supplier list at lines 117–119, under the old Layer 9 numbering.

**Exact repair:** delete “and 7.2 cites the arithmetically equivalent pair of 4.3”, or locate that citation in FiniteGroupInvariants' supplier list. Retain the §7.2 reference-row dependency and the intended §7.4/§7.6 ownership split. The distinction is substantive enough to locate precisely: the group pair has subgroup orders `16,16`; the fields constructed in §4.3 have degrees `15!,15! = 1307674368000,1307674368000`. This is a locator note, not a new mathematical blocker.

## Previous findings

- R01 — not repaired: `README.md:1` and `Suggested.lean:27` identify Part III, but the folder still has the base name and retains the base's generated status. Carried forward as R01.
- R02 — not repaired: `Compatibility.lean` and `PrescribedGenerators.lean` are unchanged; they still carry aliases and proofs for the completed base's native reference family. Carried forward as R02.
- R03 — repaired: `README.md:51`–54 and 74–79 assign the coefficient theorem, conjugacy criterion and pair here, and the converse, shared invariants and count to FiniteGroupInvariants. The new §7.2 locator error is separately R03 (P3).

No repair report marking these findings “not actionable in this package” was supplied or present among the available previous reports; no settled disposition is being overridden.

## Verified sound

This is an **incremental re-review of 17 changed lines since 8a1ed65**. The actual diff is 13 insertions and 4 deletions, all in the README's ownership and consumer paragraphs. All three Lean files are unchanged. Head `86b0515a05634e17ae2dfec55b42cd262ac73f93` was confirmed, as was an empty outside-folder diff against `origin/main`. The worktree was not edited. The normative root README and CONTRIBUTING were read; main's completed PolynomialGaloisGroups and NumberFieldArithmetic and its Induction–Restriction sections were consulted again.

**Gate and elaboration.** The worker's recorded gate passed all checks, including `build=0`. The independent gate rerun passed every scanner and dependency check (its output does not include a build field); the targeted build was therefore run explicitly and passed: `lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested`, 9010 jobs. Direct `lake env lean` elaboration of `Suggested.lean` also passed with exactly six `sorry` warnings and no other warning or error. No unfinished Lean process remains.

The requested dependency check returned exactly:

```text
depcheck: 198 roadmaps, 1259 edges, 0 problem(s)
```

The prospective Part III name returned:

```text
NOT IN ORDER: PolynomialGaloisGroupsPartIII (insert it after its last supplier)
depcheck: 199 roadmaps, 1261 edges, 1 problem(s)
```

The latter is permitted placement, not an UPWARD or CYCLE finding. All ten `*Needs:*` blocks and all five supplier headings were inspected; FiniteGroupInvariants appears only in scope and downstream-consumer prose. There is no reverse supply edge.

**Signatures and headlines.** A scratch copy with `#check @name` for all seven declarations was elaborated successfully. The definition's carrier and all six theorem signatures match their unchanged README statements. In particular, `CharZero`, `FiniteDimensional`, `IsGalois`, the chosen embedding, monicity, irreducibility, degree five, `NumberField` and the class-intersection hypothesis remain in the elaborated types. No binder changed or disappeared. The supplied earlier signature attempt's missing object file is resolved by the successful targeted build.

The headlines remain: the transitive class count; labelled classification and the `6T6` comparison; the unique polynomial label; field and polynomial radical criteria; Dummit's radical criterion; the coefficient form of Gassmann's theorem; the fixed-field conjugacy criterion; and existence of nonisomorphic arithmetically equivalent fields. Six theorems are in `Suggested.lean`. Its docstring still identifies the unavailable extended reference family needed by the labelled headlines. The prior headline/padding audit is carried forward for the unchanged file, including its eighteen failed `simp`/`rfl`/`infer_instance` probes; those probes were not presented as new runs. No headline signature was touched by this repair.

**Changed ownership claims.** Sections 4.1–4.3 still state precisely what the revised scope assigns here. Equality of the native ideal-count coefficients implies equality of the native zeta functions, including the total-function convention at zero. The converse, shared invariants and field count are indeed the subjects of FiniteGroupInvariants §§7.4, 7.5, 7.6. Its §7.4 still describes an Artin-L-function proof of the sufficient direction, and §7.6 still has the older dependency wording. The new text here records the required ownership division; aligning that consumer's proof route and old layer numbers belongs to its own review. This folder should not acquire a dependency on that consumer. The inaccurate additional assertion about §7.2 is isolated as R03.

**Pinned declarations reopened (12).** The manifest and checked-out commits agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

- `TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Basic.lean:66`, `:94`, `:102`, `:138`, `:150`: `numTransitiveGroups`, its zero-above-five theorem, `TransitiveGroupIndex`, `referenceSubgroup`, `TransitiveGroupLabel`. The degree-six count at this pin is zero; the label index there is `Fin 0`. The conjugacy predicate uses ambient conjugation, not abstract isomorphism.
- `TauCeti/NumberTheory/ArithmeticDirichletSeries/Trivial.lean:54`, `:59`, `:63`: `dedekindZetaCoeff`, `dedekindZetaCoeff_zero`, `dedekindZeta_eq_LSeries_dedekindZetaCoeff`. The definition is the cardinality of the ideal norm fibre; it includes the zero ideal. It is not an arithmetic function with value zero at zero.
- `Mathlib/FieldTheory/Galois/Basic.lean:281`, `:462`, `:698`: `fixingSubgroup_fixedField`, `IsGalois.map_fixingSubgroup`, `finrank_eq_fixingSubgroup_index`; `Mathlib/FieldTheory/Normal/Basic.lean:190`: `AlgHom.liftNormal`, with its scalar-tower and normality context at lines 184–185. The conjugation direction agrees with §4.2.

**Cross-roadmap citations resolved again (six roadmaps).** The roadmap service's `show` and object searches were used for the supplied open heads; main was used for the existing suppliers.

- `Completed/PolynomialGaloisGroups/README.md:532`, `:777`, `:1172`, `:1385`: base Layers 1, 4, 6, 9. The scope exclusion at line 57 supports the continuation boundary.
- `Completed/NumberFieldArithmetic/README.md:548`: §1.4, double cosets and the `e·f` law.
- `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:346`, `:433`: §§2.1–2.2. Its `Suggested.lean:639`, `:728`, `:749`, `:755`, `:775`, `:811`, `:825` contain `AlmostConjugate`, the permutation-equivalence criterion, restriction, normal invariants, both transports and the `S₁₆` pair. The three orbit/determinant adapters are named targets at README lines 415–417. These resolve all nine scanner leads: they are supplied roadmap targets, not allegedly present pinned declarations.
- `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:17`: owns ramified merging and random partitions; it does not supply this continuation's arithmetic-equivalence layer.
- `TauCetiRoadmap/BelyiMaps/README.md:976`: consumes the degree-six-to-eleven classification and exact `6T6` comparison. Lines 984–985 retain obsolete layer/data-file citations; this is unchanged consumer drift, carried from the previous report.
- `TauCetiRoadmap/FiniteGroupInvariants/README.md:117`, `:832`, `:857`, `:870`, `:881`, `:913`: the supplier list, §§7.2, 7.4, 7.5, 7.6 and 8.3. Sections 7.2/8.3 consume reference groups; §§7.4–7.6 match the ownership split. Its biconditional remains at `Suggested.lean:611`. The new §7.2 field-pair locator is the sole new citation finding.

Object searches over the pinned libraries, main, the supplied open roadmap heads via `roadmaps grep`, and available package README/Lean files found no new implementation of the coefficient/fixed-field implication or `AlmostConjugate` at these pins. The generic group pair and representation adapters remain owned by Induction–Restriction. This continuation owns the passage to number fields and ideal-count equality; it imports the group pair. The open-owner duplication already identified in the previous report is addressed by the new explicit supply direction. No declaration was added, so the repair creates no new fully qualified declaration collision.

**Source sample.** The ten seeded targets remain covered by the previous report's source check. For unchanged §§1.1–3.3, its exact locators and computations are carried forward rather than fetched and reviewed again. For the arithmetic-equivalence scope change and its dependent §§4.1–4.3, `sutherland-arith-equiv` was fetched legally through the sources service from arXiv v4, the published Discrete Analysis version. I read its introduction at lines 22–30 and 37 (pp. 1–2), Proposition 2.6 at lines 195–201 (p. 5), Theorem 2.10 at lines 252–256 (p. 7), and the common-core reduction at lines 262–265. They support the class-count definition, the arithmetic-equivalence implication, the fixed-field isomorphism criterion and the nonisomorphic-field phenomenon. Section 4.2's extension to general finite Galois extensions is supplied by the pinned normal-extension/Galois-correspondence route, not by a claim that Sutherland states that broader version. No new source, theorem locator or unverified flag was introduced by the diff.

**Adversarial table.** The previous report contains 53 data rows (despite its heading saying 52); all are carried below with an explicit citation in each row. The eight fresh rows then test the changed ownership claims, their arithmetic content, and the two retained blocking findings. The six small generator closures were recomputed by permutation composition; the order distributions and field degrees by exact integer arithmetic. Nothing here treats `sorry` elaboration as a proof.

| Statement | Instances tried | Values on the two sides | Result | Change / evidence |
|---|---|---|---|---|
| 1.1 `TransitiveSubgroupClass n` count | `n = 1,…,11` | computed classes `1,1,2,5,5,16,7,50,34,45,8` (degrees 6, 7, 11 from the rows below; 8–10 are the row counts of the data files); `card_transitiveSubgroupClass` list identical | Equal. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.1 degenerate `n = 0` | `Perm (Fin 0)` | one subgroup, vacuously transitive; one class; native count `0` | README states the count from `n = 1`; correct. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.1 Check `n = 4` | all 30 subgroups of `S₄` | transitive subgroups `9` with orders `4,4,4,4,8,8,8,12,24`; classes `5` | Equal; the wrong definition gives 9. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.1 Check `n = 2` | `⊥`, `⊤` | `⊥` not transitive; classes `1`; without transitivity `2` | Equal. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.1 Check `6T7`/`6T8` | both rows | both order 24, element orders `1:1,2:9,3:8,4:6`; parity `+`/`−` | Isomorphic, not conjugate; count twice. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.2 descent, degree 3 | `𝓡 = {S₃, A₃}` | maximal subgroups of `S₃`: orders `3,2,2,2`, transitive `T,F,F,F`; of `A₃`: trivial | Hypothesis holds; `6 → 3`. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.2 descent, degree 4 | `𝓡 = {S₄,A₄,D₄,C₄}` | maximal subgroups of `A₄`: four of order 3 (intransitive), one of order 4 (transitive, the Klein group); of `D₄`: orders `4,4,4`, transitive `F,T,T` | Fails at `A₄` and `D₄` exactly as the Check says. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.2 separating invariants | `6T1` vs `6T2` | cycle types `{1⁶, 2³, 3², 6}` vs `{1⁶, 2³, 3²}` | `6T1` has a 6-cycle; separated. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.2 separating invariants | `6T3`/`6T4`, `6T9`/`6T10` | parity `−/+`, `−/+` | Separated. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.2 order-24 rows | `6T6`, `6T7`, `6T8` | `6T6` orders `1:1,2:7,3:8,6:8` (no 4); `6T8` has order-4 elements; `6T7` even | Separated. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 degree-six table | all 16 rows | orders `6,6,12,12,18,24,24,24,36,36,48,60,72,120,360,720`; parity `−−−+−−+−−+−+−−+−`; primitive only `12,14,15,16`; solvable all but `12,14,15,16` | All 64 entries equal the table. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 degree-six counts | the table | primitive `4`, even `5`, solvable `12` | Equal; CHM Table 2 primitive count 4. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 degree-seven rows | 7 rows | orders `7,14,21,42,168,2520,5040`; parity `+−+−++−`; all primitive; solvable first four | Equal to the Check. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 degree-eleven rows | 8 rows | orders `11,22,55,110,660,7920` (A₁₁, S₁₁ by definition); parity `+−+−++` and `+`, `−`; all primitive; solvable first four | Equal; `transgrp-11` lines 30–37 record the same signs. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 primitive counts | degrees 7–11 | CHM Table 2 line 284: `7,7,11,9,8`; unrestricted degree-five formula would give `16,7,50,34,45,8` | Check correct. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 columns unrestricted | `6T6`, `6T16` | primitivity formula `6 ≠ 4 ∨ 3 ≤ 5 = T`, actual `F`; solvability formula `6 ≠ 5 ∨ 15 < 3 = T`, actual `F` | Restriction to `n ≤ 5` is necessary. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 `6T6` comparison | `r = (0 2 4)(1 3 5)`, `t = (2 5)` | closure order 24; equals the closure of the TransGrp row `(3,6),(1,3,5)(2,4,6)` shifted; blocks `{0,3},{1,4},{2,5}` preserved; image on blocks order 3 | Equal. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 1.3 `6T6` structure | conjugates of `t` | `r t r⁻¹ = (1 4)`, `r² t r⁻² = (0 3)`; they generate an abelian group of order 8 of exponent 2; `(0 3)(1 4)(2 5)` central; even part order 12 with element orders `{1,2,3}` | `A₄ × C₂`. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| Conventions, composition | `(0 1) * (1 2)` on `Fin 3` | `((0 1)(1 2)) 0 = 1`, `((1 2)(0 1)) 0 = 2` | Right-to-left; Check correct. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| Conventions, conjugation direction | `(2 5)` by `r`, by `r²` | `(4 1)`, `(0 3)` | `r⁻¹ = r²` exchanges them; direction pinned. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| Conventions, zeta coefficient | `ℚ` at `0`, `n ≥ 1`; `ℚ(i)` at 5 | `1`, `1`; `2` from `(2+i),(2−i)` | `Trivial.lean:59` gives the value 1 at 0. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 2.1 Check `X⁶ − 2` | discriminant, degree, label | `(−1)^{15}·6⁶·(−2)⁵ = 1492992 = 2¹¹·3⁶`, not a square; `[ℚ(2^{1/6},ζ₆):ℚ] = 12`; `6T3` is the only odd row of order 12 | Label `6T3`. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 2.1 Check `Φ₇` | regular `C₆` | `6T1` is the only cyclic row | Correct. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 2.1 negative controls | `(X²−2)(X⁴+1)`, `(X²−2)³` | intransitive / inseparable | No label; `HasGaloisLabel` requires separability (`Label.lean:111`). | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.1 field headline | `E = F` | trivial group solvable; `ι x ∈ F ⊆` radical closure | Both sides true. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.1 field headline | splitting field of `X⁵ − 2` | `F₂₀` solvable; `ℚ(2^{1/5}, ζ₅)` radical | Both true. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.1 field headline | splitting field of `X⁵ − 4X + 2` | `f(−2),f(0),f(1),f(2) = −22, 2, −1, 26`: three real roots, two nonreal; `S₅`; no radical root | Both false. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.1 closure in `E` versus in `Ω` | cyclic cubic of `X³ − 3X + 1` | discriminant `81 = 9²`, `C₃`; an `x ∈ E∖ℚ` with `xⁿ ∈ ℚ` would have conjugates `ζx` real, so `ζ = ±1`, but `x` has three conjugates; `solvableByRad ℚ E = ℚ` | Statement false with `E` as ambient; the Check is right. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.1 route, prime index | `S₃`; trivial group | `A₃` normal of index 2; `exists_normal_index_prime` needs `Nontrivial` (`Solvable.lean:78`) | Induction stops at the trivial group. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.1 route, roots of unity | `N = 20` for `X⁵ − 2` | `ζ₂₀^{20/5} = ζ₅`; `HasEnoughRootsOfUnity (AlgebraicClosure F) n` needs `NeZero (n : F)` (`AlgebraicallyClosed.lean:46`), true in characteristic zero | Route sound. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.2 polynomial headline | `q = 0`, constant `q` | `q.Gal` trivial; `rootSet` empty | Both true (probe elaborated). | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.2 polynomial headline | `(X² − 2)²` | `C₂`; roots `±√2` radical | Both true. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.2 some-root negative control | `(X⁵ − 4X + 2)(X − 1)` | root `1` radical; group contains `S₅` | Some-root form fails for reducible `q`; the headline quantifies over all roots. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.2 prime degree | `X³ − 2`, `X⁵ − 4X + 2` | `p = 3`: two nonreal roots, `S₃` solvable; `p = 5`: `S₅` | `p ≥ 5` necessary. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 Dummit invariant | `θ₁` as at `dummit-quintics` lines 45–50 | stabilizer in `S₅` has order 20 and equals `⟨(1 2 3 4 5),(2 3 5 4)⟩`; `θ₁,…,θ₆` pairwise distinct polynomials | Equal. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 Chapman identities | both in `ℤ[x₁,…,x₅]` | `θ₂ − θ₃` and `θ₄ − θ₅` equal the stated products exactly | Identities hold. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 five-cycle on the `θ` | `c = (1 2 3 4 5)` by `xᵢ ↦ x_{c(i)}` | `θ₁ ↦ θ₁`, `θ₂ ↦ θ₆ ↦ θ₃ ↦ θ₄ ↦ θ₅ ↦ θ₂` | Agrees with the README and Dummit line 115. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 Chapman in characteristic 2 | the two bracket equations | `(x₂−x₃)²(x₂−x₅) = (x₂−x₁)²(x₂−x₅)`, so `(x₂−x₃)² = (x₂−x₁)²`, so `x₁ = x₃` | Contradiction without dividing by 2; Check correct. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 characteristic 5 | `5x₂ = Σxᵢ` | gives `Σxᵢ = 0`, no contradiction | Hypothesis `5 ≠ 0` necessary and present. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 `X⁵ − 2` | sextic from the six `θ` values | `X⁶ − 50000X`; roots distinct (`0, 8.7055, …`) | Equal to (2′). | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 `X⁵ − 5X − 12` | sextic | `[1,−40,1000,−20000,250000,−66400000,976000000]`; value at 40 is `0` | Rational root 40. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 `X⁵ − X − 1` | sextic | constant `9375 + 256 = 9631`, prime; values at `±1` are `6267`, `13877` | No rational root; `S₅`. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 `X⁵ − X` | sextic | `(X−2)⁴(X²+16) = [1,−8,40,−160,400,−512,256]`; `θ` values `2,2,2,2,4i,−4i` | Reducible input breaks separation; native collision example. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 3.3 radical form | hypotheses of `Quintic/Solvable.lean:104` | monic, separable (from `CharZero` and irreducible), irreducible, degree 5, separable sextic (3.3) | All discharged. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.1 headline | `H = K`; `E = ℚ` | both sides equal trivially | True. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.1 hypothesis content | `H = ⊥`, `K = ⊤`, `E ≠ ℚ` | class of 1: `1 = 1`; a nontrivial class `C`: `0 ≠ card C` | Not almost conjugate; hypothesis is not vacuous. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.1 Check, equal order | `ℚ(√2),ℚ(√3),ℚ(√6)` at 3 and 5 | `3`: inert, ramified, ramified: `0,1,1`; `5`: `2,3` nonresidues, `6 ≡ 1`: `0,0,2` | Equal order does not suffice. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.1 route, local counts | `p^k` | ideals of norm `p^k` are `∏ 𝔮^{k_𝔮}` with `Σ f k_𝔮 = k` | Determined by residue degrees. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.1 route, residue degrees | a `D`-orbit `O` of size `ef` | `I`-orbits in `O` all of size `e`, `f` of them, permuted cyclically by Frobenius | Full cycle type of Frobenius on `I`-orbits. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.1 route, product determines multiset | `∏(1 − Z^d)` | lowest-order term `1 − m Z^{d₀}` with `d₀` the least part, multiplicity `m` | Strip and induct. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.2 criterion | `X³ − 2`, two order-2 subgroups | conjugate; `ℚ(∛2) ≅ ℚ(ζ₃∛2)` | Both directions. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.2 Check 3 | `X⁴ + X + 1`, two Klein groups | discriminant 229 prime, group `S₄`; normal Klein fixes a Galois sextic, non-normal a non-Galois one | Isomorphic subgroups, nonisomorphic fields. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |
| 4.3 pair | `C₄ × C₄`, `Q₈ × C₂` regular on 16 points | element orders `1:1, 2:3, 4:12` both; full types `1¹⁶, 2⁸, 4⁴`; abelian versus not | Almost conjugate, not conjugate; degrees `15! = 1307674368000`. | Unchanged; [previous review](packages/PolynomialGaloisGroups/reports/PRREVIEW-PolynomialGaloisGroups~3.md). |

| Statement | Instances tried | Values on the two sides | Result | Change / evidence |
|---|---|---|---|---|
| Revised coefficient-level ownership, README:51–54, §4.1 | `E = ℚ(i)`, `H = K = 1`, norms `0,2,3,5` | Both sides `1,1,0,2`; modulo `2,3,5`, `X²+1` has `1,0,2` distinct roots, respectively | Equal, including ramified 2 and total-function zero | Recomputed; same mathematics, sharper ownership. |
| Revised §4.2 ownership, README:53 | `S₃`, `H = ⟨(01)⟩`, `K = ⟨(02)⟩` | Class intersections `(1,1,0)` on both sides; conjugation by `(12)` sends H to K; fixed-field degrees both `6/2 = 3` | Conjugate and isomorphic; both implications hold | Computed group witness; compatible with pinned conjugation direction. |
| Revised §4.3 ownership, README:54 | Regular `C₄×C₄`, `Q₈×C₂` in `S₁₆` | Orders `1,2,4` occur `1,3,12` times in both; full cycle types `1¹⁶,2⁸,4⁴`; field degrees both `16!/16 = 1307674368000` | Equal class intersections, nonconjugate since one group is abelian and the other is not | Recomputed; finite pair comes from Induction–Restriction, fields are constructed here. |
| Converse assigned to §7.4, README:74–79 | Distinct order-2 subgroups of `V₄`, fixing `ℚ(√2)` and `ℚ(√3)` | Class counts `(1,1,0,0)` versus `(1,0,1,0)`; coefficients at 3 are `0` versus `1` | Both almost-conjugacy and zeta equality fail; equal subgroup order alone is insufficient | Ownership only changed; criterion remains consistent. |
| Invariants and count assigned to §§7.5–7.6, README:75–79 | `F = ℚ(i)`, `G=C₂`, `H=1` | Almost-conjugacy in an abelian group forces equality; alternative subgroup classes `0`, alternative field classes `0`; degree 2, discriminant −4, signature `(0,1)` on both copies | Count `0 = 0`; invariant equalities hold | Recomputed base case of the assigned subjects. |
| New §7.2/§8.3 reference-row dependency, README:691 | Regular `C₂`, regular `C₃` | Counts of subgroup classes almost conjugate to the identity subgroup other than itself `0,0`; derangements of prime order `1,2`; elusiveness `false,false` | The cited sections really concern finite reference-group tests | Changed consumer mapping; neither computation needs the number-field pair. |
| R01: continuation boundary and native label carrier | Degree `6` | Pinned count `0`, continued class count `16`; pinned index `Fin 0`, requested labels 16 | Different scope; base status cannot describe the continuation | Finding carried; prospective Part III name has no supply cycle. |
| R02 and R03: distinguish base group proofs and field construction | Six generator pairs; regular order-16 pair | Closure orders `6,4,12,24,60,120` match native group orders; `16` versus `15!` distinguishes subgroup order from fixed-field degree | Companion proofs belong to base; §7.2 group-pair citation is not the §4.3 field-pair citation | Recomputed; delete companions and correct locator. |

## Not verifiable

- Butler–McKay, *The transitive groups of degree up to eleven*: unchanged uncertified citation. The previous review reports a DOI HTTP 403 and no legal copy; no new request was made. The previously verified Conway–Hulpke–McKay Table 2 supplies the counts.
- Perlis 1977, Theorem 1: unchanged uncertified publisher citation. Its text was not reopened or represented as inspected. Sutherland's published-version restatement and the explicit local-count route supply the checked content of §§4.1–4.3.
- Dixon–Mortimer Theorem 2.6A remains consumed through the completed base and outside this incremental source recheck.
- The prior Dummit/Chapman and classification source checks and computations are explicitly inherited, not independent new reads. The previous report's Dummit source gap is retained below; no new source issue was found.

## Source issues

- **Gap** in dummit-quintics at Theorem 1 proof, printed p. 389: the source says the remaining five sextic roots give an irreducible quintic without establishing distinctness; it should establish distinct sextic roots, as Chapman's note does; affects the proof.

# Review of ProfiniteCohomology (pull request #616 at 93f8a71)

**Verdict:** needs changes

Incremental re-review of the 58 lines of `TauCetiRoadmap/ProfiniteCohomology/` changed since `d1c54e0` (the head the previous review read): the `module`/`public import` header of `Suggested.lean`, two sentences of README 11.1 on the coefficient-universe convention, the Koch reference's path to the completed pro-`p` roadmap, and the regenerated `STATUS.md`/`PROGRESS.md`. No Lean statement changed. One blocking finding: the gate's targeted build fails at this head, because four Lean files on main import `TauCetiRoadmap.ProfiniteCohomology.Suggested` and use declarations this pull request deletes from it. The three P3 findings of the previous review are not repaired and are carried forward; one new P3 on the changed README sentence.

## R01 (P1) — The targeted build fails: consumers on main import declarations this file no longer declares

**Location:** `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:57`–`129` (the five declarations of the file); the gate's build of `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.QuadraticFormInvariants.Suggested`.

**Claim:** The pull request replaces main's 6076-line `Suggested.lean` by a 132-line acceptance test. Four files that are on main, merged into this branch at `2464b0cc`, import the module by name and refer to twenty of its declarations; nineteen no longer exist and the twentieth has a different signature and conclusion. The build the gate runs on this head therefore fails, and the two roadmaps the gate names as importers cannot be built.

**Witness:** Gate at this head (worker's run and my re-run with `--build`): `build=18 FAIL`, first error `Completed/ProfiniteProPGroups/Suggested.lean:3671:4: Unknown identifier ProfiniteCohomology.cd_p`. That file (`:2`) imports `TauCetiRoadmap.ProfiniteCohomology.Suggested` and uses `ProfiniteCohomology.TopPairing`, `.cup` (`:221`) and `.cd_p` (`:229`, `:3671`, 17 sites). The chain to the gate's targets: `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:17` imports `Completed.LocalFieldsRamification.Suggested`, whose `:23` imports `Completed.ProfiniteProPGroups.Suggested`; `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:4` imports `TauCetiRoadmap.ClassFieldTheory.Suggested`. Those two files also use missing names directly: ClassFieldTheory `ProfiniteCohomology.TopRep` (`:627`), `.TopPairing` (`:1155`), `.degreeCast` (`:1187`), `.cup` (`:1188`), `.cup_add_left` (`:1193`), `.cup_gradedComm` (`:1216`), `.cup_coeffMap` (`:1419`), `.coeffMap` (`:1534`), `.cd_p`, `.scd_p` (`:1882`), `.cd_p_le_of_isClosed` (`:1897`), `.cd_p_le_scd_p` (`:1904`); QuadraticFormInvariants `.cup` (`:1503`), `.H2` (`:2038`), `.AbsoluteGaloisGroup` (`:2523`), `.wreathSection` (`:3366`); `Completed/LocalGaloisGroups/Suggested.lean` `.cup_coeffMap` (`:455`), `.infl` (`:549`), `.cup_infl` (`:586`), `.abelianizationProP` (`:1304`), `.scd_p` (`:1902`), `.abelianizationProPClass` (`:1910`), `.H2` (`:1911`). Of the twenty names only `abelianizationProPClass_generates` survives, and LocalGaloisGroups `:1914` applies it as `… p (Field.absoluteGaloisGroup K) (…).le V hV` to conclude `zmultiples (class) = ⊤ ∧ Nat.card H² = p ^ padicValNat p …`, main's signature (`(hG : scd_p p G ≤ 2) (V) [V.Normal] (hV)` under a `[Fact p.Prime]` variable), whereas this file takes `(p) (hp : p.Prime) (G) … (h) (V) [V.Normal] (hV)` and concludes `∃ e : H2 … ≃+ ZMod (p ^ V.index.factorization p), e (class) = 1` (`Suggested.lean:121`–`126`). The failures are "unknown identifier" errors, not import errors: the `module` header of this round is not what breaks them (my `lake env lean` of `Suggested.lean` itself: exit 0, five `sorry` warnings only).

**Repair:** The gate's build must pass at the head that is reviewed. Two routes, for the author and operator to choose between; either closes this finding, and I tested neither beyond the name audit below.

1. Keep, in `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`, the consumer-facing declarations with the exact signatures the four files use, as real-bodied definitions on the pinned carriers where a counterpart exists: `cd_p`/`scd_p` as `TauCeti.cohomologicalDimensionAt.{u}`/`strictCohomologicalDimensionAt.{u}`; `TopPairing` as `TauCeti.TopPairing` (`Cup/Graded/Basic.lean:120`); `cup` as `TauCeti.ContinuousCohomology.cup` (`Cup/Cohomology.lean:167`); `degreeCast` (`DegreeCast.lean:68`); `coeffMap`/`infl` (`Functoriality.lean:352`); `cup_coeffMap`, `cup_infl` (`Cup/Functoriality.lean:172`, `:209`); `cup_gradedComm` (`Cup/Graded/Comm.lean:447`); `cd_p_le_scd_p` (`CohomologicalDimension/Basic.lean:250`); `cd_p_le_of_isClosed` (`ClosedSubgroup.lean:80`); `H2` (`LowDegree.lean:792`); `AbsoluteGaloisGroup` (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:312`); `wreathSection` (`GroupTheory/GroupExtension/DihedralSixteen.lean:344`); `abelianizationProP`, `abelianizationProPClass` (`ClassModule/Basic.lean:63`, `:166`); and restore main's statement of `abelianizationProPClass_generates` or keep both forms. Then re-run the gate with the build. This reintroduces an API layer the acceptance-test rule excludes, so it needs the operator's acceptance of that exception and a README sentence in `## Downstream consumers` saying these are the consumers' names.
2. Repoint the four consumers to the pinned Tau Ceti names listed above (every one exists at the pin; `wreathSection` is `TauCeti.wreathSection` on `wreathD16Extension.Section`), and `Completed/LocalGaloisGroups/Suggested.lean:1904`–`1915` to this file's `abelianizationProPClass_generates` through `AddEquiv.card` and `ZMod.card`. Those edits are outside this roadmap's folder and so outside this pull request's allowance; they would have to land first, as the consumers' own change, after which this head builds unchanged. README 8.7 already says the Class Field Theory roadmap "takes from here Layer 12's `TauCeti.TopPairing`, cup and `TauCeti.ContinuousCohomology.degreeCast`" (`README.md:1947`–`1949`), so route 2 is the one the README describes; its Downstream section (`README.md:3564`–`3570`) should then also say by which names the consumers read Layer 11 and 12.

Until one route is taken, no acceptance: the gate fails on every head that keeps the five-declaration file while the consumers on main are unchanged.

## R02 (P3) — The exported-interface table disagrees with the layers and the pin on seven entries

Carried from the previous review (its R01), not repaired. **Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:194`, `:204`, `:205`, `:209`, `:215`, `:222`; rule at `:186`: "entry written without backticks is an object this roadmap still builds". **Witness:** row 194 still lists `ofDiscreteModuleRes` and `Invariants`, row 209 `coindTraceRaw`, row 215 `muN`, row 222 repeats `TauCeti.exact_trivialF2ResMap_trivialF2CorMap_of_index_two` twice; none of the unbackticked names is defined by a layer or exists at the pin. **Repair:** as before: backtick the pinned names (`TauCeti.coindTrace`, `TauCeti.ContCohomology.explicitCor0_comp_res0` and siblings, `…longExact_exact₁/₂/₃`), delete `ofDiscreteModuleRes`, `Invariants`, `muN`, `coindTraceRaw`, and keep one copy of the row-222 declaration with the three names 13.1 lists.

## R03 (P3) — The strict criterion's Lean name differs from the name its consumer cites

Carried (previous R02), not repaired. **Location:** `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:91` (`theorem strictCriterion`); README `:2722`, `:2735`, `:3008`. **Witness:** `TauCetiRoadmap/ClassFieldTheory/README.md:160` on main: "the strict-dimension criterion `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` at `n = 2`"; that row also calls `cd_p` and `scd_p` "aliases of Tau Ceti's `cohomologicalDimensionAt` and `strictCohomologicalDimensionAt`", the aliases R01 is about. **Repair:** rename the declaration to the consumer's name (three README mentions follow), or add to `## Downstream consumers` the clause that ClassFieldTheory's name for it is `strictCriterion`; fold the alias question into whichever route R01 takes.

## R04 (P3) — Three garbled source sentences and one misplaced source paragraph

Carried (previous R03), not repaired. **Location:** `README.md:1130` ("The source for the inhomogeneous-against-canonical comparison is The chain-level correspondence is classical"), `:3020` ("The source for the `p`-primary torsion of cohomology is The proof of NSW (3.3.2)"), `:3394` ("the unnumbered construction in Scope and ownership, pp. 310–311"), `:906`–`911` (the Ribes–Zalesskii Prop. 2.2.2 paragraph inside 1.7 Additivity and linearity, while 0.3 at `:673`–`696` owns the section theorem). **Repair:** as before: "The chain-level correspondence is classical …", "The `p`-primary torsion of cohomology is used in the proof of NSW (3.3.2) …", "in his §2", and move the paragraph to the end of 0.3.

## R05 (P3) — The new universe sentence points at "§3", which is not where the convention is stated

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2565`: "This roadmap reads its invariants at `v = u`, so coefficients live in `Type u`, as in §3".

**Claim:** The README numbers its layers `## Layer 0` … `## Layer 13` and its subsections `k.n`; "§3" reads as Layer 3 (the comparison isomorphisms, `:1030`), which says nothing about the coefficient universe of the dimension invariants. The statement the sentence relies on is the Conventions bullet **Universes** (`:302`–`306`: "The group and its coefficient modules live in one universe … forced by the pin").

**Witness:** `grep -n "universe" README.md` within Layer 3 (`:1030`–`:1153`) returns nothing; the only statement of the convention is at `:302`.

**Repair:** write "as the Conventions bullet **Universes** says" in place of "as in §3". The mathematics of the sentence is right (table below): the pro-`p`, Demushkin and Sylow-equality theorems of Tau Ceti are stated at `cohomologicalDimensionAt.{u}`, and `Suggested.lean` reads every invariant at `.{u}`.

## Previous findings

- R01 — not repaired: `README.md:194` still lists `ofDiscreteModuleRes` and `Invariants` unbackticked, `:209` `coindTraceRaw`, `:215` `muN`, `:222` the same declaration twice (now R02).
- R02 — not repaired: `Suggested.lean:91` is still `strictCriterion`; ClassFieldTheory `README.md:160` on main still cites `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (now R03).
- R03 — not repaired: `README.md:1130`, `:3020`, `:3394` keep the spliced sentences and `:906`–`911` the misplaced Ribes–Zalesskii paragraph (now R04).

The repairs of this round (the `module` header, the 11.1 sentence, the Koch path) introduce no new mathematical problem; the build failure of R01 is not caused by them (the errors are unknown identifiers, which main's consumers would raise against the five-declaration file of `d1c54e0` as well) but is exposed by the gate's build at this head.

## Verified sound

**Scope.** Worktree clean at `93f8a711`; `git diff --stat origin/main...HEAD` outside the roadmap folder is empty (the long list under "Files changed outside the folder" in the change summary is the merge of main at `2464b0cc`, not pull-request changes). The folder holds the same five files as before; no stray file. No `set_option`, no sorry'd data, no `lemma`, a single `public import Mathlib` plus two existing `TauCeti.*` modules; the gate's text scanners all report zero (`imports=0`, so the gate accepts the `module`/`public import` form).

**Gate and dependency check.** The gate without `--build` reports every text check at zero and `OK` (and prints no `build=` key); with `--build` it reports `build=18 FAIL` with the errors quoted in R01, reproducing the worker's run. Independent dependency check:

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The only roadmap supplier remains `RepresentationTheory/InductionRestriction` on main (`README.md:158`, `:268`, `:1743`).

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`: exit 0, exactly five `declaration uses sorry` warnings (lines 74, 82, 91, 107, 121). A scratch file importing the module ran `#check @` on all five declarations, once with `pp.universes`: `cohomologicalDimensionAt_universe_eq.{u_1}` is `Eq (cohomologicalDimensionAt.{u_1, u_1} p G) (cohomologicalDimensionAt.{0, u_1} p G)`, so the two sides differ in the first (coefficient) universe exactly as README 11.2 says; `TauCeti.cohomologicalDimensionAt.{u_1, u_2}` takes `G : Type u_2` (coefficient universe first, matching `README.md:2559`); Mathlib's `continuousCohomology.{u_1, u_2, u_3}` takes `TopRep.{max u_2 u_3, u_1, u_2}`, so the invariant at `v` uses `continuousCohomology.{0, u, v}` and the "auxiliary cochain universe" of `README.md:2565` is `u_3`. Every binder of the five statements is the same as in the previous review (no section variable lost; the brief's `signatures.md` agrees). The one-tactic probe `first | rfl | simp | infer_instance` on the universe equality fails (the statements are unchanged since `d1c54e0`, where all five probes failed), so nothing in the file is padding.

**The changed passages.**

| Change | What I checked | Result |
|---|---|---|
| `Suggested.lean:1`–`5`, `:53`, `:131`: `module`, `public import`, `public section … end` | elaboration above; the consumers' failures are unknown identifiers, not import errors | sound; the header does not hide the declarations from the non-module importers |
| `README.md:2564`–`2566`: invariants read at `v = u`; "fixes Mathlib's auxiliary cochain universe to the convention used by Tau Ceti's pro-`p`, Sylow and Demushkin dimension theorems" | pin: `Topology/Algebra/Group/Profinite/ProP/CohomologicalDimension.lean:110`–`217`, ten statements all at `cohomologicalDimensionAt.{u}`; `Demushkin/CohomologicalDimension.lean:49`, `:61` at `.{u}`; `Sylow/CohomologicalDimension.lean:82` (equality `cd_p G = cd_p P`) at `.{u}`, `:67` (inequality) at `.{v}`; `Suggested.lean:76`, `:84`, `:94`–`95`, `:109`, `:123` all read `.{u}` | sound, except the "§3" pointer (R05) |
| `README.md:3635`: Koch Ch. 5–6 "is the `../../Completed/ProfiniteProPGroups/` interface" | content main has `Completed/ProfiniteProPGroups/` and no `TauCetiRoadmap/ProfiniteProPGroups/`; from `TauCetiRoadmap/ProfiniteCohomology/README.md` the path resolves | sound (the old `../ProfiniteProPGroups/` pointed nowhere) |
| `STATUS.md`, `PROGRESS.md` | generated files, regenerated to `271e1af`; not roadmap content | not reviewed as content |

**Seeded sample.** None of the fifteen seeded targets (0.3, 1.3, 1.4, 1.7, 2.1, 5.5, 6.2, 6.3, 6.6, 8.2, 8.3, 8.6, 8.7, 9.7, 11.8) lies in the changed lines; their locators were checked in the previous review and are carried. Where the source is readable I re-opened it: Milne ADT (author's copy, `Milne line 296`–`301`) carries (0.1.1)–(0.1.6) as 8.2–8.5 and Layer 12 cite them (boundary with `(−1)^{deg x}` in the second variable, associativity, graded commutativity with `(−1)^{deg x deg y}`, restriction, inflation); `line 449`–`461` Remark 0.11 (coinduced module, adjunction, exactness, Shapiro in all degrees, for 7.1 and 10.4); `line 542`–`548` Prop. 0.15 (inner conjugation trivial on `Hʳ`, for 2.4). The 8.2 citation of Brown V (3.5), the 8.3 citations of NSW (1.4.4) and Brown V (3.6), the 5.5, 6.2, 6.3, 6.6 and 11.8 citations of NSW and Koch remain uncertified (below). 1.3, 1.4, 1.7, 2.1, 8.7 and 9.7 cite pinned declarations, all of which were opened at the pin in the previous review and none of which changed.

**Adversarial table.** Rows for the changed statements carry computed values; rows for untouched statements restate the previous review's values (same head for those statements, since no Lean statement and no other README section changed).

| Statement / location | Instances | Values computed on the two sides | Result |
|---|---|---|---|
| 11.1 universe convention, `README.md:2564`–`2566` | `G : Type 0`; `G : Type 1`; the pinned theorems | at `u = 0`, `.{0,0}` and `.{0,0}` are one term; at `u = 1`, coefficients `Type (max 1 1) = Type 1` and `Type (max 1 0) = Type 1`, cohomology objects `continuousCohomology.{0,1,1}` vs `.{0,1,0}` in `TopModuleCat.{1}` vs `TopModuleCat.{max 1 0}`, distinct terms; pro-`p` (10 statements), Demushkin (2), Sylow equality (1) at `.{u}`, Sylow inequality at `.{v}` | sentence true; `.{u}` is the pinned convention for every named family |
| 11.2 universe equalities, `Suggested.lean:74`, `:82` | `1`, `ℤ_p`, `C_p`; `u = 0` | `0 = 0`, `1 = 1`, `⊤ = ⊤`; at `u = 0` reflexive, at `u ≥ 1` `rfl` and `simp` fail | sound, not padding (as r4) |
| Koch reference path, `README.md:3635` | the two candidate paths | `Completed/ProfiniteProPGroups`: exists on main; `TauCetiRoadmap/ProfiniteProPGroups`: does not | repaired path correct |
| R01 consumers | the 20 fully qualified names | present in this file: 1; missing: 19; signature agreement of the present one: conclusion `∃ e … , e u = 1` vs `zmultiples u = ⊤ ∧ Nat.card = p^…`, argument order `p hp G h V hV` vs `p G h V hV` | build failure necessary, not an artefact of the pin race |
| 11.7 `strictCriterion`, `Suggested.lean:91` | `ℤ_p`, `n = 1`; `ℤ_p`, `n = 2`; `1`, `n = 0`; `ℤ_q` (`q ≠ p`), `n = 1` | `scd = 2 ≰ 1`, `H²(pʳℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`: false ↔ false; `2 ≤ 2`, `H³ = 0`: true ↔ true; `0 ≤ 0`, `H¹(1, ℤ) = 0`: true ↔ true; `scd_p = 0 ≤ 1`, `cd_p = 0`, `H²(U, ℤ)(p) = 0`: true ↔ true | holds (r4) |
| 11.8 class module, `Suggested.lean:107`, `:121` | `ℤ_p ⊇ pℤ_p`, `p = 2, 3`; `V = G`; `ℤ_p × C_ℓ ⊇ ℤ_p`; `C_p ⊇ 1` | `H¹ = Hom(C_p, pℤ_p) = 0`; `H² = pℤ_p/p²ℤ_p` of order `2, 3`, carry class `p ↦ 1`; `ZMod 1`, `1 = 0`; `H² = 0`, `p`-part of index `1`; `H²(C_p, 0) = 0` excluded by `scd = ⊤` | generator and modulus right (r4) |
| 11.8 strict bound necessary | `ℤ_p²`, `V = pG` | `cd = 2`, `scd = 3`; `H²(C_p², ℤ_p²)` has order `p⁴ ≠ p²` | hypothesis needed (r4) |
| 8.2–8.5, Layer 12 signs | `(m,n) = (2,1), (1,2), (m,0)` | exponent `mn + (m+1)n ≡ n`: `−1`, `+1`, `+1`; Milne (0.1.2) and (0.1.4) at `line 297`, `:299` agree | consistent (r4, re-read) |
| 8.6 Bockstein | `C₂`, `𝔽₂`, `x` | `βx = x²`; `β(x²) = x³ + x³ = 0`; `β1 = 0` | consistent (r4) |
| 8.7 evaluation pairing | `M = N = 𝔽₃`; sign source; `M = 0` | `(id, 1) ↦ 1`; `(−id)(−1) = 1`; everything `0` | no perfectness inferred (r4) |
| 6.2, 6.3, 6.6 corestriction | `C₂ ⊇ 1`, `ℤ`; `S₃ ⊇ C₂`; sign `ℤ` on `C₄ ⊇ C₂`; `C₈ ⊇ C₄ ⊇ C₂` | `cor 1 = 2`; `cor 1 = 3`; `cor⁰(1) = 1 + (−1) = 0`; `×4 = ×2 ∘ ×2`; `cor ∘ res = index` in that order | conventions consistent (r4) |
| 5.5 five-term | `C₂ ◁ C₄`, `𝔽₂`; `C₃ ◁ C₉`, `𝔽₃` | orders `2/2`, `1/1`, `2/2`; transgression at lifts `(2,1)`: `0 − 1 + 0 = −1 = 2` | exact, sign pinned (r4) |
| 9.7 restriction/corestriction | `ℂ/ℝ`, `𝔽₂`, degree 0 | `res = id`, `cor = ×2 = 0`, composite `0 = 2·id` | index two (r4) |
| 0.3, 1.3, 1.4, 1.7, 2.1 | as in r4 | section exists for `ℤ_p → ℤ/p`, homomorphic one does not; `1 ↦ 2` dictionary values; `map(f+g)(1) = 5`; `d⁰ 1(s) = −2`, `H¹(C₂, ℤ_sign) = ℤ/2` | consistent (r4) |
| All other rows of the r4 table (94 rows) | unchanged statements | unchanged values | carried |

**Cross-roadmap and ownership audit.** Resolved at this head: InductionRestriction on main (supplier); ClassFieldTheory `README.md:160` and `:1297` on main and QuadraticFormInvariants on main cite this roadmap by the names in R01 and R03; `Completed/LocalGaloisGroups/README.md` and its `Suggested.lean:1914` consume `abelianizationProPClass_generates` (same hypotheses, different conclusion shape); `Completed/ProfiniteProPGroups` consumes `cd_p`, `TopPairing`, `cup`. No second builder of the five declarations among the open heads or on main (the previous review's object search; nothing in this round's diff adds an object). Ownership against open pull requests whose files the brief does not supply was not checked. The pull request's description claims a passing CI run for this head; the gate on this worker says otherwise, and I report the gate.

## Not verifiable

- **NSW**, *Cohomology of Number Fields*, 2nd ed.; **Ribes–Zalesskii**; **Serre**, *Galois Cohomology* and *Local Fields*; **Koch**; **Brown**: Springer or no legal copy found by the service (as in the previous review); the locators of 5.5, 6.2, 6.3, 6.6, 8.2, 8.3, 11.8 into them remain uncertified and were checked on the instances of the table instead.
- The previous review's source issue in Milne Remark 0.11: at `Milne line 455`–`457` the adjunction's right side reads with `H` in the first slot, but the extraction is degraded at that display and I cannot distinguish a misprint from an extraction artefact; I do not re-assert it.
- The pull request's CI claim (a run on a tested merge) cannot be inspected from this worker.

## Source issues

- none

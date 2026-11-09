# Review of TotallyDistributiveTopoi (pull request #1927 at 4907f68)

**Verdict:** accepted

This is an incremental re-review of the 29 lines changed in the folder since 3bfb8db. The changes are in README 4.2 (lines 593–633), the Mathlib and GrothendieckTopoi contracts (lines 113–117, 138) and the Layer 4 Dependencies (line 644). `Suggested.lean` is unchanged. Both findings of the previous review are repaired, the repairs introduce no new problem, and no finding remains.

## Previous findings

- R01 — repaired: lines 603–605, "*Needs:* GrothendieckTopoi 7.1 (open sets are sheaves); Mathlib `TopologicalSpace.IsTopologicalBasis`, `Set.PairwiseDisjoint`, `Sheaf.isLocallySurjective_iff_epi`, `Projective`, `EnoughProjectives`", and line 610, "*Needs:* the general statement of 4.2, 3.6."
- R02 — repaired: lines 628–631, "`U` is covered by `(a, (a + 2b)/3)`, `((2a + b)/3, b)` and `U ∖ {(a + b)/2}`, and a disjoint open refinement with union `U` partitions the connected `(a, b)`".

## Verified sound

**What changed.**
- `git diff 3bfb8db 4907f68` touches only `README.md`: 17 insertions and 12 deletions. `Suggested.lean` and `metadata.toml` are unchanged.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TotallyDistributiveTopoi'` is empty.

**The repair of R01, part by part.**
- The general statement and its route (594–602) now have their own *Needs:* line (603–605), which no longer names 3.6. The Cantor instance (607–609) has its own (610), which names the general statement and 3.6.
- Every step of the route has a named input:
  - `U` is an object of `Sh X`: GrothendieckTopoi 7.1.
  - The local lift: `Sheaf.isLocallySurjective_iff_epi`.
  - A coproduct of projectives is projective: `Projective`, with Mathlib's instance for `∐ g`.
  - The coproduct covers the sheaf: `TopologicalSpace.IsTopologicalBasis`.
- The Sites line of the Mathlib contract gained `Sheaf.isLocallySurjective_iff_epi` (`Sites/LocallySurjective`) at lines 116–117. `Projective` and `EnoughProjectives` were already on the Categories line (121).
- The GrothendieckTopoi contract's 7.1 entry now reads "for targets 3.1, 3.3–3.5 and 4.2" (138), and the Layer 4 Dependencies name 7.1 (644). The sentence "Within the layer, 4.2 uses 3.6" there is still true, through the Cantor instance.

**The repair of R02.** The cover is now a cover of the basic set `U` itself; the computation is in the table below. The sentence is read as "some basic set contains an interval", which holds for every basis of `ℝ` because a basis of a nonempty space has a nonempty member.

**Gate.** I ran it on this head with `--base origin/main`. Every check reports 0, the result is OK and the exit code is 0. The worker's gate at this head also reports `build=0`.

**Dependency check.** Output: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. This roadmap is at line 401 of the merge order. Its only supplier is GrothendieckTopoi, a new-roadmap pull request that the description's depends-on list names.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/TotallyDistributiveTopoi/Suggested.lean` exits with exactly 20 `sorry` warnings and no other message. The file is byte-identical to the one the previous review read, so its `#check @name` comparison of all 30 declarations and its one-tactic padding probe (no theorem closes) stand. The four dropped-binder leads of `signatures.md` were shown false there.

**Headline theorems.** Unchanged from the previous review: all 20 theorems of the Summary are declared, and 3.4 is named in the module docstring as not statable (it lacks `Frame.grothendieckTopology`). `enoughProjectives_sh_cantor` (`Suggested.lean` line 249) is still the statement of the Cantor clause of 4.2. The general 4.2 target has no backticked name, so `readme-ids-missing=0`.

**Library declarations opened at the pin (6).**
- `Sheaf.isLocallySurjective_iff_epi` (`Mathlib/CategoryTheory/Sites/LocallySurjective.lean:377`), for sheaves of types.
- `TopologicalSpace.IsTopologicalBasis` (`Mathlib/Topology/Bases.lean:73`).
- `Set.PairwiseDisjoint` (`Mathlib/Data/Set/Pairwise/Basic.lean:259`).
- `Projective` (`Mathlib/CategoryTheory/Preadditive/Projective/Basic.lean:48`), `EnoughProjectives` (:77) and the instance `Projective (∐ g)` (:127).

**Supplier citations resolved (3).** At the GrothendieckTopoi open head, README section 7.1 (line 1063) proves that `Frame.grothendieckTopology L` is subcanonical and equals `Opens.grothendieckTopology X` for `L = Opens X` (1067–1069). That is what the new *Needs:* line and the contract entry cite. Sections 1.1 (263) and 6.5 (1014), named in the changed Dependencies line, also resolve. Both leads of `citations.md` are unchanged and were resolved in the previous review (GrothendieckTopoi `Suggested.lean` line 435; the anonymous instance at `Mathlib/CategoryTheory/Sites/Limits.lean:214`).

**Ownership and overlaps.** `overlaps.md` reports that no open pull request changes this roadmap, that no id cited here is dropped, and that no id dropped here is cited elsewhere. The diff adds no object, only citations, so the previous review's ownership search stands.

**Seeded sample.** Of the sampled targets only 4.2 contains the change. Its general statement has no literature locator ("own argument"), so it is checked through its route and instances in the table. The References are unchanged, and the README flags no locator as unverified.

**Adversarial table.** The first five rows carry values computed in this review. The rest cover statements the diff leaves untouched and cite the review of 3bfb8db (r6), where the values are set out.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Check: `ℝ` has no such basis (628–631) | `𝔅` = opens, `U = ℝ`, `(a, b) = (−1, 2)`; `U = (0, 3)`, `(a, b) = (0, 3)`; `U = (0, 1) ∪ (2, 3)`, `(a, b) = (0, 1)` | First: the cover is `(−1, 1)`, `(0, 2)`, `ℝ ∖ {1/2}` with union `ℝ`; the only disjoint open refinement with union `ℝ` is `{ℝ}`, and `ℝ` lies in none of the three. Second: `(0, 2)`, `(1, 3)`, `(0, 3) ∖ {3/2}` with union `(0, 3)`; the member containing `(0, 3)` contains `5/2`, `1/2` and `3/2`. Third: `(0, 2/3)`, `(1/3, 1)`, `U ∖ {1/2}` with union `U`; the member containing `(0, 1)` contains `0.9`, `0.1` and `1/2` | true | none |
| The cover in general (628–631) | `a < b`, `m = (a + b)/2` | `(2a + b)/3 < m < (a + 2b)/3`, so the two intervals have union `(a, b)` and both contain `m`; `U ∖ {m}` is open and covers the rest of `U`; the union is `U` | true | none |
| 4.2 general target, its *Needs:* line (603–605) | each step of the route at 597–602 | Sheaf structure on `U`: 7.1. Lift: `isLocallySurjective_iff_epi`. Gluing over a disjoint cover: the sheaf condition, with `F(∅)` a point. Coproduct projective: instance at :127. Covering: basis. 3.6 is used by no step | complete | none |
| 4.2 Cantor instance, its *Needs:* line (610) | `𝔅` = clopen sets of `ℕ → Bool`; cover `{[0], [1] ∪ [00]}` of `X` | The refinement `{[0], [1]}` is disjoint and clopen with union `X`; the finite refinement comes from compactness of a clopen set, which is the route of 3.6. The hypothesis of the general statement holds, so the instance follows from it | complete | none |
| Contract and Dependencies (116–117, 138, 644) | each added name and section | `Sheaf.isLocallySurjective_iff_epi` is in `Sites/LocallySurjective` at the pin; GrothendieckTopoi 7.1 states subcanonicity; targets 3.1, 3.3, 3.4, 3.5 and 4.2 each cite 7.1 in their own text (446, 479, 502, 523, 603) | true | none |
| 4.2 general target, degenerate spaces and the two route steps (carried, r6) | `PEmpty`; `PUnit`; `U = ∅`; Cantor cover; `V` open with `t ∈ F(V)` | r6, rows 1–3 | true | none |
| Checks: Lindelöf zero-dimensional, Alexandrov, `LowerIco`, the three non-presheaf examples (carried, r6) | Sorgenfrey, `ℚ`, empty space; Sierpiński, upper sets of `ℕ`; `a = 1/2`, `1` | r6, rows 6–8 and 10 | true | none |
| 4.1 `isPresheafTopos_sheaf_iff` and the unchanged Cantor Checks (carried, r6) | `Type u`; `Sh LowerIco`; Cantor; `Sh ℝ` | r6, rows 12–13 | true | none |
| Layers 1–3: 1.1–1.4, 2.1–2.5, 3.1–3.3, 3.5, 3.6 and the GrothendieckTopoi 1.2 contract (carried, r6) | as listed in r6 | r6, rows 14–27 | true | none |
| Summary end theorems vs `Suggested.lean` (carried, r6) | each clause | 20 theorems declared; 3.4 named as not statable | true | none |

**Remark on formatting.** Line 631 ends early ("and lies in none of the three. In `LowerIco`,"), which leaves the paragraph unevenly wrapped. It renders identically and needs no change.

## Not verifiable

- **Published Lucyshyn-Wright.** JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018, resolves only to a paywalled page. Earlier rounds checked its locators against arXiv:1108.4032v3, and this diff does not touch them.
- **SGA 4 IV, Exercice 7.6.** It is reached only through GrothendieckTopoi's citations and was not opened.
- **Statements without a literature locator.** These are the general 4.2 target (own argument) and 2.3, 2.4 (first statement) and 3.4. They were checked only through their routes and the instances in the table.

## Source issues

- none

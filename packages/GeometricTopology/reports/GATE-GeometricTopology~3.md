# GATE-GeometricTopology~3: answers to the review of `f4d3bc1` (repairs at `65275e57`)

The review numbers its points F01–F06; here they are H01–H06 in the same order.

## H01 (CBirkbeck) — applied

§7.3.1 "Finite horoball patterns": deleted the sentences from "Give finite enumeration and coverage certificates …" to "… handled explicitly.". Kept are finiteness in a fundamental parallelogram and independence of the triangulation/transport under isometries. Also deleted "its ideal-triangulation geometry for enumeration certificates" from the `*Needs:*` line and the closing "certified finite enumeration above are also required targets" sentence. The README scope line "Knot tables and computation" now has no certificate target contradicting it. Same pattern in the later §4.5.1: "Supply the actual finite braid/PD realization and determinant certificates …" → "Prove these values for the realized `PDCode` closure of the word through the geometric closure invariance, in exact arithmetic". The sentence about the source's "43 of 59 listed cases" was a table count, so it is deleted under the same scope line. `grep -n 'enumeration\|certificate\|traversal' README.md` now matches only the scope line and the unrelated "state traversal" model of §4.5.2.

## H02 (CBirkbeck) — applied

§7.3.1: "Prove existence of a shortest nonzero lattice vector … chosen shortest vector." → the two shortest vectors are the witnesses of the first two successive minima of `L` for the closed unit disc of `ℂ` (SuccessiveMinima, Layer 1, `exists_successiveMin_witnesses`). Kept here: the `ℤ`-basis property in dimension two and tied bases. Added a one-line derivation that for *every* shortest `v` the least length outside `ℝ v` is `λ₁`, since the original wording quantified over a chosen shortest vector and 1.5 gives only one particular witness. Proof: an `x ∉ ℝv` with `‖x‖ < λ₁` together with `v` would give two independent vectors of norm `< λ₁`. Attainment: one of the independent witnesses `b₀`, `b₁` lies outside `ℝv`, and either case gives norm `λ₁`. Also added a deferral sentence under *Scope and ownership*, a supplier subsection `### From TauCetiRoadmap.SuccessiveMinima`, and SuccessiveMinima Layer 1 in the section's `*Needs:*`. Checked on main `fa41b374`: `exists_successiveMin_witnesses` is target 1.5 (SuccessiveMinima `README.md:488`) and is declared in its `Suggested.lean:275`. SuccessiveMinima is on main and not in the merge order, so the depcheck stays at 0 problems. `shortestPeriod_exists` lives in the companion `CuspInvariantTargets.lean`. This job may edit only `README.md` and `Suggested.lean`, so that file is untouched (see H05).

## H03 (CBirkbeck) — applied

Deleted the `*Needs:*` paragraph "Follow the quotient-torus design in [Mathlib PR 39460] … adopt the Mathlib declarations when available." (three PR links and the Zulip link). The section's `*Needs:*` now names the pinned carriers instead (`ZLattice`/`ZSpan`, `ZLattice.covolume`, `UnitAddTorus`, `UpperHalfPlane` actions). Deleted the sentence "Its reported `10^(−15)` volume accuracy supplies no per-row proof certificate." The gate now prints `prnum=0`.

## H04 (CBirkbeck) — applied

Adams–Hildebrand–Weeks is added to the hyperbolic-geometry bullet of *References* (Trans. Amer. Math. Soc. 326 (1991), 1–56, §2 (pp. 2–4), Tables 1–2). The source adapter now cites it as "(§2, pp. 2–4, Tables 1–2)" with no link. The same inline-hyperlink pattern in §4.5.1 (Squier) and §6.2 (Rudolph, Feller) is repaired the same way: each is cited by author and title in the text and listed in the braid bullet of *References*. The Feller entry keeps the locator p. 22 that the text already gave.

## H05 (CBirkbeck) — applied differently

Applied to the README only: removed every sentence naming a companion file. That is `CuspInvariantTargets.lean` in §7.3.1, plus the same pattern added after the reviewed head: `LowStrandBurauTargets.lean` in §4.5.1 and `BraidJonesSupportTargets.lean` in §4.5.2. The README now names no `.lean` file of its own except `Suggested.lean`. Not applied: deleting the 26 companion files, or editing `CuspInvariantTargets.lean` (the imports, `hdet`, `cuspModelVolume_eq_half_area`, `shortestPeriod_exists`). Those files are outside what this repair job may edit, so that part remains open for the worker or author. The mathematical claim about `periodRatio_change_basis` is correct: for `b ≠ 0`, `(pa+qb)/(ra+sb) = ((pa+qb)/b)/((ra+sb)/b)` holds for all integers in Lean's division, with both sides `0` when `ra+sb = 0`. So `hdet` is needed only for the denominator-nonvanishing lemma.

## H06 (CBirkbeck) — applied

`Suggested.lean` lines 2–16: `import` → `public import`, and `public section` inserted before `namespace TauCetiRoadmap.GeometricTopology`, following `TypeAHeckeAlgebras/Suggested.lean` on main. The 17 statements are now exported. No statement, binder or docstring changed. The gate's import check accepts the prefix (`imports=0`).

## Adversarial pass on changed statements

| Statement | Instances | Values | Result; change |
|---|---|---|---|
| Two shortest vectors are the witnesses of `λ₀, λ₁` for the closed unit disc `K` of `ℂ` | `L = ℤ + ℤi`; `L = ℤ + 2iℤ`; hexagonal `ℤ + ℤω` | square: gauge = `‖·‖`, `λ₀ = λ₁ = 1`, witnesses `1, i`. `(1,2i)`: `λ₀ = 1`, `λ₁ = 2`, witnesses `1, 2i`, and `1+2i` has norm `√5 > 2`. Hexagonal: `λ₀ = λ₁ = 1` with six tied shortest vectors | matches SuccessiveMinima 1.5 with `d = 2`; ties are kept by the "tied minimizing bases" sentence |
| For every shortest `v`, the minimum length outside `ℝv` is `λ₁` and is attained | hexagonal with `v = ω`; square with `v = i` | hexagonal: the vectors outside `ℝω` include `1` with norm `1 = λ₁`. Square: outside `ℝi`, `1` has norm `1 = λ₁`. Lower bound from the threshold: an `x ∉ ℝv` with `‖x‖ < λ₁` contradicts the definition of `λ₁` | true for every choice of `v`; added because 1.5 fixes one `b₀` only |
| `ℤ`-basis in dimension two (kept here) | `(1,2i)`; hexagonal | `1, 2i` has `det = 2 = covol`, so it is a basis. `1, ω` has `|Im ω| = √3/2 = covol`, so it is a basis | unchanged |
| §4.5.1 `Δ(ζ) = 36 − 13√5 > 13/2 ⇔ 59² > 26²·5` | exact arithmetic | `36 − 13/2 = 59/2`, so the inequality is `59/2 > 13√5 ⇔ 59 > 26√5 ⇔ 3481 > 3380` | true; only the wording changed from "certified by" to "equivalent to" |
| `Suggested.lean` visibility | build | 17 `sorry` warnings before and after, no other diagnostic | statements unchanged |

**Signatures.** No declaration's type or binders changed, only its visibility. The elaborated types in the scratch `signatures.md` (19 declarations, none with a lost section binder) therefore still apply. No extra `#check` file was elaborated, because the brief's Lean commands are limited to the targeted build.

**Ownership.** SuccessiveMinima (main) owns the minima, and this roadmap now cites it. For the rest of §7.3.1 (the quotient torus `ℂ ⧸ L` with flat metric, the horotorus comparison, maximal cusps, shapes and patterns), this roadmap is the owner. I did not repeat the reviewer's `roadmaps grep` over open heads this round. Ownership against open pull requests whose files the brief does not give was not checked.

**Not applied / open.** The companion `.lean` files, H05, are outside this job's editable files.

## Build

`lake build TauCetiRoadmap.GeometricTopology.Suggested`: `Build completed successfully (9131 jobs)`, with 17 `declaration uses sorry` warnings and no other diagnostic.

## Gate

`gate GeometricTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check:

```text
depcheck: 204 roadmaps, 1393 edges, 0 problem(s)
```

`roadmaps resolve` on the README: no Lean name found nowhere.

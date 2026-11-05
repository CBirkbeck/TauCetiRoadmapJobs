# Review of ClassFieldTheory (pull request #1411 at 2221f3e)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since 90bf034: three README lines and one module-docstring line repoint the absolute upper filtration from "LocalFieldsRamification §4a.1" to "RamificationOfCompleteDiscretelyValuedFields §4a.1". Nothing else in the folder changed, no file outside the folder changed, and the gate still fails in the same categories as before plus a new UPWARD line. Two findings are new (R01, R02); R03–R11 are the previous report's blocking or gate-failing findings, unrepaired at this head, written again in short form.

## R01 (P2) — The repointed supplier is upward of a roadmap on main

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:1467`, `1537`, `1548`: "supplied by RamificationOfCompleteDiscretelyValuedFields §4a.1"; `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:104`.

**Claim:** The absolute comparison (closure of `artinMap(U_K^(n))` equals the image of `G_K^n`) consumes the absolute upper filtration, its closedness, finite-level surjections and inertia endpoint from RamificationOfCompleteDiscretelyValuedFields §4a.1.

**Witness:** The dependency check returns `UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#1) at README lines [1543]`. ClassFieldTheory is `TauCetiRoadmap/ClassFieldTheory` on main; RamificationOfCompleteDiscretelyValuedFields is the first open roadmap of the merge order, whose header rule lets a roadmap consume only roadmaps above it, roadmaps on main, and other authors' pull requests. The cited section does exist at that roadmap's open head (`TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:524–560`) and states what this roadmap uses, and its scope (lines 67–68 and 77–79) names ClassFieldTheory as the owner of the reciprocity–filtration compatibilities, so that roadmap expects to sit below this one.

**Repair:** A revision of a roadmap on main cannot consume an open roadmap. Either (a) own the specialisation here: state in Layer 7, before the absolute comparison, the target "absolute upper ramification subgroup of a nonarchimedean local field" as the closed subgroup of `Field.absoluteGaloisGroup K` of elements whose restriction to every finite Galois `M/K` lies in `Gal(M/K)^n`, with its laws (closed, normal, antitone in `n`, restriction onto `Gal(M/K)^n` for every finite Galois `M` by Herbrand's theorem from LocalFieldsRamification Layer 3, `G_K^0` equal to Tau Ceti's `inertiaSubgroup`), its `*Needs:*` line and three Checks (the `ℚ_2(ζ_8)` images: everything at depths 0 and 1, `{1, 5}` at depth 2, trivial at depth 3; an unramified finite quotient where the depth-0 image is trivial; the tame `ℚ_p(ζ_p)` quotient where the depth-0 image is the whole group and the depth-1 image is trivial), delete the three supplier citations and the docstring sentence, and say in Scope and ownership that the general carrier over a perfect residue field is RamificationOfCompleteDiscretelyValuedFields's and restricts to this target; or (b) remove the absolute form from this revision (keep `map_unitFiltration_normResidue` and the conductor statements, which are independent of it) and leave the absolute comparison to a roadmap below RamificationOfCompleteDiscretelyValuedFields. Under (a), record that RamificationOfCompleteDiscretelyValuedFields §4a.1 would then duplicate the local-field case and should cite it. Tested on the instance that refutes nothing: with the target owned here the dependency check has no edge to an open roadmap from this README.

## R02 (P1) — Three citations still name a section that exists nowhere

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:166`: "`LocalFieldsRamification`, including §4a.1 for the absolute upper filtration"; line 193: "its §4a.1 supplies the absolute upper filtration"; line 1341: "the absolute upper filtration, finite-level surjections and inertia endpoint of §4a.1" under the LocalFieldsRamification prerequisite.

**Claim:** The supplier table, the boundary list and the Layer 7 prerequisites say LocalFieldsRamification §4a.1 supplies the absolute upper filtration.

**Witness:** `Completed/LocalFieldsRamification/README.md` on main (929496d) has Layer 3 at line 724 and "Layer 4: the tame quotient of the absolute Galois group" at line 1154 and no section 4a; the roadmap search for "§4a.1" over every open head and main finds it only in RamificationOfCompleteDiscretelyValuedFields, PadicPeriodRings and this README. The three lines were not touched by the repair that repointed lines 1467, 1537 and 1548, so the README now names two different suppliers for one object, one of them nonexistent.

**Repair:** Make lines 166, 193 and 1341 agree with whichever repair of R01 is taken: under (a) they cite the new Layer 7 target (and the supplier-table row for LocalFieldsRamification loses the absolute-filtration clause); under (b) the three clauses are deleted. Checked on the instance: after the edit, a search for "4a.1" in this README returns nothing.

## R03 (P2) — Admitted data remain in the acceptance test

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:875`, `1128`, `1947`, `2744`, `2779`, and the other definitions and instances the gate counts (`sorry-data=55`); `README.md:2435–2440` still permits them.

**Claim and witness:** Unchanged since the previous report (its R03): `invMap` at line 1128 and `artinMap` at line 1947 have body `sorry`; the Weil topology at line 2779 is admitted. The diff touched none of these lines.

**Repair:** As in the previous report's R03: rewrite the file as a headline acceptance test on native carriers, name in the docstring every headline not statable at the pins, and name the principal ideal and conductor–discriminant theorems in that inventory.

## R04 (P2) — Native declarations are redeveloped

**Location:** `README.md:1040–1059`, `1070`, `1336`; `Suggested.lean:1025`, `1038`, `1128`, `1334`, `1947`.

**Claim and witness:** Unchanged (previous R04): pinned Tau Ceti defines `ClassFieldTheory.invMap` (`Brauer/Invariant.lean:193`), `tateDual` (`Local/Duality/Basic.lean:95`) and the absolute `artinMap` (`Local/ArtinMap.lean:109`); Mathlib has `legendreSym.quadratic_reciprocity`.

**Repair:** As in the previous report's R04.

## R05 (P2) — Equal-characteristic unit-filtration reciprocity overlaps FunctionFieldArithmetic §4.2

**Location:** `README.md:1456–1458`: "a finite abelian extension of nonarchimedean local fields, in equal or mixed characteristic"; the README names FunctionFieldArithmetic nowhere (search count 0).

**Claim and witness:** Unchanged (previous R05): `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1077–1099` at its open head states the same equal-characteristic equality and owns full equal-characteristic existence.

**Repair:** As in the previous report's R05.

## R06 (P2) — The quadratic restriction on ring class fields is not load-bearing

**Location:** `README.md:2137`: "and is load-bearing"; `Suggested.lean:4400–4484`.

**Claim and witness:** Unchanged (previous R06): Kopp–Lagarias Theorems 1.1–1.3 quantify over every number field and every order.

**Repair:** As in the previous report's R06.

## R07 (P2) — The cohomological Hilbert symbol takes an arbitrary coordinate

**Location:** `Suggested.lean:1210`, `1221`, `1234`, `1244`, `1254`: `(tr : H n K 2 (muNRep n K) ≃+ ZMod n)`.

**Claim and witness:** Unchanged (previous R07): replacing `tr` by `−tr` at `n = 3` over `ℚ_7` changes the coordinate of a cup class from 1 to 2 and every stated law survives.

**Repair:** As in the previous report's R07.

## R08 (P3) — Roadmap imports in Suggested.lean

**Location:** `Suggested.lean:23–26`: `import TauCetiRoadmap.ProfiniteCohomology.Suggested`, `TauCetiRoadmap.LocalFieldsRamification.Suggested`, `TauCetiRoadmap.GlobalNumberFields.Suggested`, `Completed.NumberFieldArithmetic.Suggested`.

**Witness:** gate `imports=1`. **Repair:** delete them and use the individual `TauCeti.*` modules (previous R08).

## R09 (P3) — Padding

**Location:** `Suggested.lean:426`, `448`, `491`, `502` (`tateIso_res`, `tateIso_res_trans`, `ker_artinMap`, `surjective_artinMap`) and the other declarations of the previous report's R09.

**Witness:** these four closed under one tactic in the previous report's probes; the lines are unchanged. **Repair:** delete them from `Suggested.lean`; the README keeps the statements.

## R10 (P3) — README shape and locators

**Location:** `README.md:1`, `265–413`, `648–690`, `2198–2373`, `2533–2537`. Unchanged (previous R10): the Artin–Tate existence locator is XIV §6, p. 163, not §§1–5; the principal ideal theorem has no hypotheses or locator. **Repair:** as in the previous report's R10.

## R11 (P3) — Residue, fence and the two tex diagnostics

**Location:** `README.md:2455` (a 51-line `text` fence), `2541` and `2587` (`<a id=` anchors).

**Witness:** gate `residue=2`, `long-fences=1`. The gate's `tex: line 99` and `tex: line 302` are false positives against its stated rule: lines 97–101 and 299–304 are `text` fenced blocks. **Repair:** replace the graph by prose or a table, drop the anchors, and move the two one-line displays into inline code spans so the scanner is satisfied (previous R11).

## Previous findings

- R01 — repaired: the worker's gate at this head reports `build=0`; direct elaboration gives 260 `sorry` warnings and no other diagnostic. The non-sorry dependency warnings of the earlier run no longer appear in the targeted build, so no finding is raised; the forbidden roadmap imports that caused them remain (R08).
- R02 — partly repaired: lines 1467, 1537, 1548 now cite "RamificationOfCompleteDiscretelyValuedFields §4a.1", which exists at that open head but is upward of main (R01); lines 166, 193, 1341 still cite "LocalFieldsRamification §4a.1", which exists nowhere (R02).
- R03 — not repaired: `sorry-data=55`; `invMap`, `artinMap` and the Weil topology still have body `sorry` (R03).
- R04 — not repaired: the redevelopment targets and Lean copies of `invMap`, `tateDual`, `artinMap` and quadratic reciprocity are unchanged (R04).
- R05 — not repaired: line 1457 keeps "in equal or mixed characteristic"; FunctionFieldArithmetic is not named (R05).
- R06 — not repaired: line 2137 keeps "and is load-bearing" (R06).
- R07 — not repaired: the free `tr` coordinate at lines 1210–1254 is unchanged (R07).
- R08 — not repaired: the four roadmap imports at lines 23–26; gate `imports=1` (R08).
- R09 — not repaired: `tateIso_res`, `tateIso_res_trans`, `ker_artinMap`, `surjective_artinMap` are still declared (R09).
- R10 — not repaired: the README's section structure and the Artin–Tate locator are unchanged (R10).
- R11 — not repaired: gate `residue=2`, `long-fences=1`, `tex=2` (R11).

## Verified sound

**Scope of this pass.** The diff since 90bf034 is 4 insertions and 4 deletions in `README.md` (lines 1467, 1537, 1548) and `Suggested.lean` (line 104); `git diff --stat origin/main...HEAD` outside the folder is empty; the working tree is clean and no file in the pull request was changed. Everything that cites or depends on the changed lines was read: the supplier table row at line 166, the boundary list at line 193, the Layer 7 prerequisites at lines 1338–1344, the unit-filtration reciprocity target at lines 1456–1486, the general filtered-norm targets at 1487–1510, the proof route at 1512–1550, the Layer 7 Checks at 1553–1573, the module docstring at `Suggested.lean:101–112`, and the Lean statements the docstring names (`map_unitFiltration_normResidue` at 2220, `conductorExponent_eq_sInf_upperRamificationGroup` at 2234, the two filtered-norm targets at 2195 and 2207, `conductorExponent` at 2154). The seeded sample (§§2.1–2.7, §§5.1–5.8) falls entirely outside the diff; its audit rows of the previous report stand unchanged and are not repeated.

**Pins.** `lake-manifest.json` pins Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`; the worktree's `.lake/packages` resolves to a packages directory at exactly those revisions (checked by `git rev-parse` in both). `Field.absoluteGaloisGroupAbelianization` is `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:101`, an `abbrev` for the topological abelianization of the algebraic-closure Galois group, so the docstring's "maps directly under the quotient" names a real map with a Hausdorff target. No declaration named `absoluteUpperRamificationGroup` exists in the pinned Tau Ceti (searched the whole tree), so the docstring's classification of the absolute comparison as not statable at the pins is correct.

**Elaboration.** `lake env lean` on `Suggested.lean`, run from the worktree with the four roadmap object files present under `.lake/build`, exited 0 in 40 s with 260 `declaration uses 'sorry'` warnings and no other warning or error. The worker's signature extraction failed only because it ran against a different packages directory (its error names a Tau Ceti object file under another Lake hash); the previous report's 457 `#check` comparisons cover the unchanged signatures.

**Gate.** The plain gate at this head: `set_option=0 blob=0 latex=0 tex=2 prnum=0 sorry-data=55 sorry-examples=0 residue=2 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=1 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`; the worker's run adds `build=0`. Every failing category is a finding above (R01, R03, R08, R11). The dependency check with `--movable`:

```text
UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#1) at README lines [1543]
depcheck: 204 roadmaps, 1652 edges, 1 problem(s)
```

The UPWARD line is a true positive under the merge-order file's own header rule (R01), not a placement question: a roadmap on main has no position to move to.

**Supplier resolution.** RamificationOfCompleteDiscretelyValuedFields §4a.1 was read at its open head (`TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:516–560`): it defines `G_K^u` for real `u ≥ −1` on a complete discretely valued field with perfect residue field as the set of elements restricting into `Gal(M/K)^u` for every finite Galois `M`, and states closed, normal, antitone, restriction onto `Gal(M/K)^u` for every `M`, `G_K^(−1) = G_K`, trivial intersection, `G_K^0 = I_K` and `G_K^(0+) = P_K`, citing Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1, p. 128, the same locator this README gives at line 1474. Its contract matches what lines 1466–1470 consume, item by item; a nonarchimedean local field has a finite, hence perfect, residue field, and a finite abelian `L/K` is one of its finite Galois levels. Its own LocalFieldsRamification contract (lines 130–144) consumes only the completed roadmap on main; it has no `*Needs:*` on ClassFieldTheory, so no cycle exists today, only the upward edge. Main's `Completed/LocalFieldsRamification/README.md` has no section 4a (R02). The only other open roadmap naming the absolute filtration is PadicPeriodRings, a consumer.

**Adversarial table.** Rows for the untouched statements are those of the previous report (PRREVIEW-ClassFieldTheory~2, 150 rows) and are carried forward by that citation. Rows for the changed statement and its dependents:

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Absolute comparison: closure of `artinMap(U_K^(n))` = image of `G_K^n`, read in a finite abelian quotient | `ℚ_2(ζ_8)/ℚ_2`, `n = 0, 1, 2, 3` | Artin side via `u ↦ u⁻¹ mod 8`: images `(ℤ/8)ˣ`, `(ℤ/8)ˣ` (`1 + 2ℤ_2 = ℤ_2ˣ`), `{1, 5}`, `{1}`. Filtration side from the character conductors `0, 2, 3, 3` of `(ℤ/8)ˣ`: `G^n` = whole group for `n ≤ 1`, `{1, 5}` at `n = 2`, `1` at `n = 3`. | Equal at every depth; agrees with the supplier's own Check at its line 551 | none |
| Same statement, depth 0 endpoint | `K = ℚ_p`, unramified quotient `C_4`; and `K = ℚ_p`, `L = ℚ_p(ζ_p)` | `artinMap(ℤ_pˣ)` has trivial image in `C_4` and `I_K` maps trivially; in the tame quotient `G^0 = G` of order `p − 1` and `Art(ℤ_pˣ)` is onto via `u ↦ u⁻¹ mod p` | Both sides agree; supplied `G_K^0 = I_K` is what is used | none |
| Depth −1 | `n = −1` | Not in the statement: `n : ℕ`, `n ≥ 0`; the supplier's `G_K^(−1) = G_K` is cited at line 1469 but never consumed | Harmless surplus in the contract sentence | none |
| Closure step: "image compact, hence closed; agreement in all finite abelian quotients" | `K = ℚ_p`, `n = 0`: `G_K^ab ≅ Ẑ × ℤ_pˣ` | `artinMap(ℤ_pˣ) = ℤ_pˣ`, compact image of a compact group, already closed, equal to the inertia image; two closed subgroups of a profinite group with equal images in every finite quotient coincide (each is the intersection of the preimages of its finite images) | Argument valid; it needs the finite-level theorem for every finite abelian `L`, which `map_unitFiltration_normResidue` gives | none |
| Supplier direction of the cited section | ClassFieldTheory (main) → RamificationOfCompleteDiscretelyValuedFields (ORDER line 2) | Merge-order header: a roadmap consumes only roadmaps above it, roadmaps on main, and other authors' pull requests; main ranks above every listed roadmap; the edge goes from main to an open roadmap | UPWARD | R01 |
| Existence of the cited sections | "LocalFieldsRamification §4a.1" (lines 166, 193, 1341) vs "RamificationOfCompleteDiscretelyValuedFields §4a.1" (lines 1467, 1537, 1548) | Completed LocalFieldsRamification on main: Layer 4 at line 1154, no 4a; the open roadmap: §4a.1 at line 524 | One nonexistent, one upward | R01, R02 |
| Finite-level statement `map_unitFiltration_normResidue` (unchanged, named by the changed docstring) | `ℚ_2(√2)/ℚ_2`, `n = 2, 3`; `F_2((t))`, `y² − y = t⁻¹`, `n = 1, 2` | images `C_2`, `1` against `G^2 = C_2`, `G^3 = 1` (conductor 3); images `C_2`, `1` against break 1, conductor 2 | Agree; the `ℕ`-to-`ℝ` cast `⟨(n : ℝ), …⟩` carries no junk value | none (R05 on ownership of the equal-characteristic case) |
| Conductor formula `conductorExponent_eq_sInf_upperRamificationGroup` | unramified `L/K`; `ℚ_5(ζ_5)/ℚ_5`; `ℚ_2(√2)/ℚ_2` | `sInf{n : G^n = 1}` = `0`, `1`, `3`; least `n` with `U^(n) ≤ N(Lˣ)` = `0`, `1`, `3` | Agree; `sInf ∅ = 0` cannot occur since `G^n = 1` for large `n` | none |

**Headline inventory and padding.** The Lean file changed by one docstring line; the previous report's headline table and 205 one-tactic probes stand. The changed docstring correctly lists the absolute comparison as a README target with its missing carrier named.

**Ownership against open work.** Searched by object (absolute upper ramification filtration, unit-filtration reciprocity) over main and the 440 open heads with the roadmap search: the filtration is built only by RamificationOfCompleteDiscretelyValuedFields §4a.1 (open), consumed by PadicPeriodRings and this README; unit-filtration reciprocity in equal characteristic is also stated by FunctionFieldArithmetic §4.2 (R05). No declaration of `Suggested.lean` carries the fully qualified name of a declaration in a roadmap read here.

## Not verifiable

- The previous report's list (Artin–Tate text, Tate 1952, Nakayama 1957, Serre *Local Fields*, Serre *Galois Cohomology*, Neukirch, Brown, NSW, Rim 1959, Cox, Tate Corvallis, Lang *Algebra*, the portability claims) is unchanged: none of the changed lines adds a source. Serre, *Sur les corps locaux à corps résiduel algébriquement clos*, n° 3.1, p. 128, the locator the changed passage shares with the supplier, was verified in the previous round from the readable Serre 1961 text and was not re-fetched.

## Source issues

- none

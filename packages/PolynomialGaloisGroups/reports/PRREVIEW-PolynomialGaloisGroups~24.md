# Review of PolynomialGaloisGroups (pull request #763 at 7ff00e1)

**Verdict:** needs changes

:robot: AI review. Incremental re-review of `TauCetiRoadmap/PolynomialGaloisGroups/` at `7ff00e158c19a2be94d2a4760f68aa0d1f03437c`: 11 changed lines since `8d40b6d` (the scope paragraph on Finite Group Invariants at `README.md:74`–81 rewritten, the Finite Group Invariants bullet deleted from `## Downstream consumers`), all in `README.md`; `Suggested.lean` is byte-identical to the head the previous review read, and nothing outside the folder differs from `origin/main`. The gate passes on my rerun, the dependency check reports no problem at this head, and `Suggested.lean` elaborates with nine `sorry` warnings and nothing else. Three findings: R01 carried (the folder name), R02 partly repaired and carried (the consumer claim is gone, but 4.1 is still planned here while Finite Group Invariants 7.4 plans the same theorem at its open head; the `UPWARD` line that made the author revert the import is itself a product of the folder name), and a new R03 (the rewritten sentence says 4.3 is proved from two suppliers "alone" while its `*Needs:*` line names a third).

## R01 (P2) — The continuation still occupies the completed roadmap's folder

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1`, "Galois groups of polynomials, part III — transitive groups through degree eleven, radicals and arithmetic equivalence"; `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean:31`, `namespace TauCetiRoadmap.PolynomialGaloisGroupsPartIII`; the folder name.

**Claim:** the roadmap consumes the completed base by section (`README.md:3`–8, `:195`–200) and owns what the base's scope excludes, so it is a Part roadmap. Under the base's folder name the repository would hold two roadmaps called `PolynomialGaloisGroups` whose "Layer 1" means different things, two open proposals would build the module `TauCetiRoadmap.PolynomialGaloisGroups.Suggested`, and (new this round) every tool that resolves the name reads this roadmap as the completed one on main: see R02 for the dependency check doing exactly that.

**Witness (recomputed at this head):** main at `a0ad405` (2026-11-04) has `Completed/PolynomialGaloisGroups/` and no `TauCetiRoadmap/PolynomialGaloisGroups/`; `Completed/PolynomialGaloisGroups/Suggested.lean:60` is `namespace TauCetiRoadmap.PolynomialGaloisGroups`. `roadmaps list`: `#763 PolynomialGaloisGroups @kim-em 7ff00e1` and `#986 PolynomialGaloisGroups @kim-em 645bf25`, the latter under the base's namespace (`Suggested.lean:24` of that proposal). The merge order lists only `PolynomialGaloisGroupsPartII` (line 203). The dependency check on this README prints `PolynomialGaloisGroups (on main)` when it names this roadmap.

**Exact repair:** move the folder to `TauCetiRoadmap/PolynomialGaloisGroupsPartIII/` (title, namespace and every citation of the completed base already fit that name) and leave the completed base untouched; the other proposal then drops its radical and separation layers and imports this roadmap by section, or is withdrawn. Retest: the dependency check with `--name PolynomialGaloisGroupsPartIII` on this README prints only `NOT IN ORDER: PolynomialGaloisGroupsPartIII (insert it after its last supplier)` and no `UPWARD` or `CYCLE` (I ran it this round: that is its output), and `roadmaps grep 'separable_specialize_quinticF20Spec'` hits one open proposal. No repair report marks this finding "not actionable in this package".

## R02 (P2) — 4.1 is still planned here while Finite Group Invariants 7.4 plans it; the revert rests on a false `UPWARD`

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:78`–81, "This roadmap states the coefficient-level sufficient direction (4.1), the conjugacy criterion for isomorphic fixed fields (4.2) and the existence theorem (4.3) from Induction–Restriction and Number Field Arithmetic alone; neither roadmap supplies the other"; `README.md:577`–620 (4.1 with its local-count route, `:590`–620); `README.md:14`–17 (the Summary's "it proves Gassmann's theorem"); `Suggested.lean:112`–123 (`dedekindZetaCoeff_fixedField_eq_of_almostConjugate`).

**Claim:** the previous review's repair (import the sufficient direction from Finite Group Invariants 7.4 through its 7.1 bridge, keep 4.1 as a coefficient corollary, delete the Lean statement) was applied at `cd7b0f6` and reverted at this head; the commit message (data) says Finite Group Invariants is later at this placement. It is not. The brief lists Finite Group Invariants among the roadmaps earlier than this one, the merge order has it at line 104, and this roadmap is unplaced. The `UPWARD` line the author saw arises only because the dependency check resolves the name `PolynomialGaloisGroups` to the completed roadmap on main, which precedes every entry of the merge order: that is R01, not a placement of this roadmap. With the consumer claim gone, the README now says outright that two open proposals each build Gassmann's theorem ("neither roadmap supplies the other"), which is the two-owners defect the principles forbid: what another roadmap plans is imported by name and section, never planned again. The Summary still says this roadmap "proves Gassmann's theorem".

**Witness:** dependency check on the README at `cd7b0f6` (scratch copy) with `--name PolynomialGaloisGroups`: `UPWARD: PolynomialGaloisGroups (on main) -> FiniteGroupInvariants (#103) at README lines [222]`, with and without `--movable`; the same README with `--name PolynomialGaloisGroupsPartIII`: `NOT IN ORDER: PolynomialGaloisGroupsPartIII (insert it after its last supplier)` and no `UPWARD`. Finite Group Invariants at the head of pull request 1708 (`91dc700`, 2026-11-04, draft, `@roed-math`): `README.md:954`–968 plans `dedekindZeta_eq_iff_almostConjugate` with the (⇐) route through NumberFieldArithmetic 1.4, `D`-orbits, `I`-orbit counts and equal Euler factors, the route of 4.1 here; its `*Needs:*` (`:967`–968) names 7.1, 7.3, NumberFieldArithmetic 1.4 and 2.1–2.3, Chebotarev Layer 10, Mathlib, nothing of this roadmap; `Suggested.lean:513`–517 states the iff with `sorry`; `README.md:909`–918 (7.1) identifies `AlmostConjugateOfFiniteIndex` with Induction–Restriction §2.1's almost-conjugacy. `grep -c PolynomialGaloisGroups` over its README and Lean: 0 and 0.

**Exact repair:** after R01 (the rename makes the import legal in the tooling), restore the `cd7b0f6` text of 4.1 and of the contracts: 4.1 is the coefficient corollary of Finite Group Invariants 7.4 (sufficient direction) through 7.1, read off with `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `TauCeti.abscissaOfAbsConv_dedekindZetaCoeff`, Mathlib `LSeries_eq_iff_of_abscissaOfAbsConv_lt_top` and `TauCeti.dedekindZetaCoeff_zero`, with `*Needs:* Finite Group Invariants 7.1, 7.4 (sufficient direction); Induction–Restriction Layer 2.1 (`Gassmann.AlmostConjugate`); …`; keep the `### From TauCetiRoadmap.FiniteGroupInvariants` contract; delete `dedekindZetaCoeff_fixedField_eq_of_almostConjugate` from `Suggested.lean` (the README keeps 4.1; `exists_dedekindZetaCoeff_eq_not_isomorphic` and `nonempty_fixedField_algEquiv_iff_exists_map_conj_eq` stay). Rewrite `README.md:74`–81: Finite Group Invariants Layer 7 supplies Perlis' theorem (7.4) and the bridge (7.1); this roadmap owns the conjugacy criterion (4.2) and the existence theorem (4.3), and states 4.1 as the coefficient form that 4.3 uses. Change the Summary's third sentence to "derives from Gassmann's theorem (Finite Group Invariants 7.4) the coefficient form, and realizes …". Retest: the dependency check with `--name PolynomialGaloisGroupsPartIII` prints no `UPWARD` or `CYCLE` (the `cd7b0f6` README already passes that way, as above), and `roadmaps grep -i 'gassmann'` on the open heads finds the sufficient direction planned once. If the author holds that this roadmap should own 4.1 and Finite Group Invariants should import it, that is an edit to pull request 1708 and a reordering, neither available here.

## R03 (P3) — "from Induction–Restriction and Number Field Arithmetic alone" omits the base roadmap

**Location:** `TauCetiRoadmap/PolynomialGaloisGroups/README.md:80`–81, "… the existence theorem (4.3) from Induction–Restriction and Number Field Arithmetic alone".

**Claim:** 4.3 is not built from those two suppliers alone.

**Witness:** `README.md:674`–678, the `*Needs:*` line of 4.3, ends "… Induction–Restriction Layers 2.1 and 2.2 (…); the base roadmap Layer 9"; `README.md:697`–698, Layer 4's Dependencies: "… Number Field Arithmetic Layer 1.4; the base roadmap Layer 9". The realization of `S₁₆` over `ℚ` (`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`) is the base roadmap's Layer 9, as `README.md:195`–200 says.

**Exact repair:** the sentence disappears under R02's rewrite of the paragraph; if the paragraph is kept, replace "from Induction–Restriction and Number Field Arithmetic alone" by "from the base roadmap's Layer 9, Induction–Restriction Layers 2.1–2.2 and Number Field Arithmetic Layer 1.4". Retest: the suppliers named in the sentence equal the roadmap suppliers in Layer 4's `### Dependencies`.

## Previous findings

- R01 — not repaired: `README.md:1` still "part III", `Suggested.lean:31` still `namespace TauCetiRoadmap.PolynomialGaloisGroupsPartIII`, the folder still `TauCetiRoadmap/PolynomialGaloisGroups/`, #986 still open on the same folder at `645bf25`. Carried as R01.
- R02 — partly repaired: the consumer claim ("that roadmap is a consumer of Layer 4") and the Downstream consumers bullet are gone, correctly (Finite Group Invariants cites this roadmap nowhere, and its 7.2 and 8.3 use `GL₃(𝔽₂)` and Sylow arguments, not the reference rows of 1.3); but 4.1 and its Lean statement are owned here again with "neither roadmap supplies the other", so two open proposals still build the theorem. Carried as R02; the repair's new sentence is R03.

## Verified sound

**Scope and head.** `git diff --stat 8d40b6d HEAD -- TauCetiRoadmap/PolynomialGaloisGroups/`: `README.md | 11 ++++-------`, nothing else; `git diff --stat origin/main...HEAD` outside the folder: empty; worktree clean at `7ff00e1`; the folder holds `README.md` (743 lines), `Suggested.lean` (145 lines), `metadata.toml`. Nothing in the worktree was edited (the probe copy of the `cd7b0f6` README lives in the scratch directory).

**Gate, build, dependency check.** The worker's gate at this head passes with `build=0`. My rerun printed `gate PolynomialGaloisGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The dependency check with `--movable` against the merge order and main on this README printed

```text
depcheck: 236 roadmaps, 2088 edges, 0 problem(s)
```

with no `UPWARD`, `CYCLE` or `moved:` line. The two probe runs on the `cd7b0f6` README and the run under the Part III name are quoted in R01 and R02.

**Elaboration and signatures.** `lake env lean` on `Suggested.lean` from the worktree: exit 0, exactly nine `declaration uses sorry` warnings (lines 49, 61, 71, 83, 93, 103, 116, 130, 139), as at `8d40b6d`. The file is unchanged since the previous review, so its signature comparison stands (the worker's `signatures.md`: ten declarations, none with a dropped binder); I re-read the three Layer 4 statements against the README this round: 4.1 with `[NumberField E] [IsGalois ℚ E]` and the class-intersection count over `ConjClasses` (`README.md:579`–583), 4.2 with `[FiniteDimensional F E] [IsGalois F E]` and `H.map (MulAut.conj g).toMonoidHom = K` (`:636`–640), 4.3 as an existence over `Type` with `IsEmpty (K ≃+* L)` (`:661`–664). Generality equal.

**The changed passages.** `README.md:74`–81: Finite Group Invariants Layer 7 at `91dc700` has 7.4 Perlis' theorem (`:954`), 7.5 invariants (`:975`), 7.6 counting (`:992`), as the paragraph says; its 7.4 is the equivalence and its (⇒) route uses Chebotarev Layer 10, so "the converse … needs Chebotarev density" is right. The three section numbers 4.1–4.3 exist (`:577`, `:634`, `:659`). The deleted bullet (`Downstream consumers`) named 7.2 and 8.3 as finite checks over the reference rows of 1.3: at `91dc700`, 7.2 (`:925`–937) is the `GL₃(𝔽₂)` Gassmann triple and 8.3 (`:1044`–1060) the Sylow and Fein–Kantor–Schacher arguments for elusive groups, neither citing this roadmap's rows, so the deletion is correct. The remaining Downstream consumer, BelyiMaps Layer 1.6 (`README.md:702`–703), was resolved last round at the head of pull request 767 and that head is unchanged (index of 2026-11-05).

**Sources.** No locator changed in the 11 lines. The seeded sample's locators were read in full at `8d40b6d` and the files in the cache are the same (`conway-hulpke-mckay` lines 282–285; `dummit-quintics` lines 31–32, 46–52, 54–74, 99–105; `chapman-quintics` lines 8–30; `sutherland-arith-equiv` lines 22–31, 195–201, 252–256; `milne-fields` lines 3409–3421); the findings of that reading (previous report, "Sources at their locators") carry forward unchanged, and the one source issue is repeated below.

**Library declarations at the pins** (Tau Ceti `358314d4`, Mathlib per `lake-manifest.json`): unchanged pins, so the previous report's list stands; the ones R02's repair names were confirmed to exist last round at `NumberTheory/ArithmeticDirichletSeries/Trivial.lean:54`, `:59`, `:63`, `NumberTheory/ArithmeticDirichletSeries/Estimates.lean:528` and Mathlib `NumberTheory/LSeries/Injectivity.lean:231`.

**Ownership against open pull requests.** `roadmaps list`: #763 and #986 on this folder (R01), #1419 Part II, #1708 Finite Group Invariants (draft, `91dc700`, in the merge order at line 104). By object, the sufficient direction of Perlis' theorem is planned in #1708's 7.4 and here in 4.1 (R02); 4.2 and 4.3 in no other open head (last round's grep, heads unchanged).

**Adversarial table.** Rows for statements the diff leaves untouched carry forward from the previous report (`PRREVIEW-PolynomialGaloisGroups~23`), whose values were computed there; the last four rows were computed this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: composition, conjugation, zeta coefficient | as in report ~23 | `((0 1)(1 2)) 0 = 1`; `τ (0 1) τ⁻¹ = (0 2)`; `dedekindZetaCoeff ℚ(i) 5 = 2` (report ~23) | Equal | none |
| 1.1 count and Checks | report ~23 | `S₄`: 9 transitive subgroups in 5 classes; `n = 0`: one class vs native `0` | As stated | none |
| 1.2 descent criterion | report ~23 | `A₄`: `V₄` transitive maximal; `D₄`: normal `V₄` not a member | As stated | none |
| 1.3 degree-six table and `6T6`; degrees 7, 11 | report ~23 | `6T6` order 24, odd, blocks `{0,3},{1,4},{2,5}`; parity of `x ↦ −x` mod 7, 11 | As stated | none |
| 2.1 Checks | report ~23 | `disc(X⁶ − 2) = 2¹¹·3⁶` not a square | As stated | none |
| 3.1, 3.2 radical criterion | report ~23 | `X⁵ − 4X + 2`: `S₅`; `X³ − 3X + 1`: `C₃`, `solvableByRad ℚ E = ℚ` | As stated | none |
| 3.3 invariant, identities, sextics, `𝔽₅` control, Lean forms | report ~23 | stabiliser order 20; identities at 300 points; sextic of `(−1, −1)` with `9631` prime; `𝔽₅`: `(X − 3)(X − 2)⁵` | As stated | none |
| 4.1 Gassmann (statement) | report ~23 | `ℚ(√2, √3)` subfields: `0, 1, 1` at 3 and `0, 0, 2` at 5; `ℚ(i)`, `p = 5`: coefficient `2` | True as stated; also planned in Finite Group Invariants 7.4 | R02 |
| 4.2 conjugacy criterion | report ~23 | `X³ − 2` order-2 subgroups conjugate; `S₄` Klein groups not | Both directions | none |
| 4.3 pair | report ~23 | cycle types `1¹⁶, 2⁸, 4⁴` with multiplicities `1, 3, 12`; `15!` | As stated | none |
| Padding probe | report ~23 | nine sorried theorems, one tactic each: none closes | No padding | none |
| Scope `:78`–81: "neither roadmap supplies the other" | this README; FGI `91dc700`; the merge order | FGI citations of this roadmap: 0 + 0; FGI 7.4 plans (⇐) with the NFA 1.4 route (`:954`–968); this 4.1 plans (⇐) with the NFA 1.4 route (`:590`–613); FGI merge-order line 104, this roadmap unplaced | Two owners of one theorem | R02 |
| Author's placement claim (commit message, data) | depcheck on the `cd7b0f6` README under both names | `--name PolynomialGaloisGroups`: `UPWARD: PolynomialGaloisGroups (on main) -> FiniteGroupInvariants (#103)`; `--name PolynomialGaloisGroupsPartIII`: `NOT IN ORDER`, no `UPWARD` | The `UPWARD` is the folder name resolving to the completed base | R01, R02 |
| Scope `:80`–81: 4.3 "from … alone" | 4.3 `*Needs:*` `:674`–678; Layer 4 Dependencies `:697`–698 | sentence names 2 roadmap suppliers; `*Needs:*` and Dependencies name 3 (`+ the base roadmap Layer 9`) | Overclaim | R03 |
| Deleted consumer bullet (7.2, 8.3 use 1.3's rows) | FGI `91dc700` 7.2 `:925`–937, 8.3 `:1044`–1060 | 7.2: `GL₃(𝔽₂)`, index 7, orders 24; 8.3: Sylow `p`-subgroup, Fein–Kantor–Schacher; citations of this roadmap: 0 | Deletion correct | none |

## Not verifiable

- G. Butler and J. McKay, *The transitive groups of degree up to eleven*: paywalled; cited uncertified by the README. The counts are verified from Conway–Hulpke–McKay Table 2.
- R. Perlis, *On the equation ζ_K(s) = ζ_K′(s)*, Theorem 1: paywalled; cited uncertified through Sutherland's Theorem 2.10.
- The TransGrp generator files at commit `165fc21` are not in the sources cache: the degree 8 to 10 row data was not checked against the file.
- The nine theorems are admitted. Elaboration verifies their signatures; the computed instances do not constitute formal proofs.
- The board manifest's `cited_for` entries for `milne-fields`, `chapman-quintics` and `dummit-quintics` are the other proposal's section numbers, and the README's ids `transgrp`, `transgrp-11` are not manifest keys; this review edits no manifest.

## Source issues

- **Gap** in dummit-quintics at Theorem 1, printed p. 389: the proof treats the six values of the invariant as the six roots of the sextic without showing they are distinct, which the "linear factor times an irreducible quintic" clause needs; it should prove the sextic of an irreducible quintic is separable (Chapman's argument, `chapman-quintics` lines 16–30); affects the proof.

# Review of DrinfeldModulesAndTModulesPartII (pull request #1697 at 9b9bd2d)

**Verdict:** needs changes

## R01 (P3) — `[Fintype F]` beside `[Field F]` in all 33 signatures (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/Suggested.lean` lines 38, 45, 52, 64, 70, 81, 87, 93, 99, 131, 139, 150, 160, 167, 176, 182, 195, 217, 247, 253, 263, 283, 315, 323, 331, 342, 352, 358, 377, 388, 399, 426, 438, e.g. line 38: “`noncomputable def powerSum (F : Type*) [Field F] [Fintype F] (d k : ℕ)`”.

**Claim:** The gate's `statement-hygiene` rule fails 33 times at this head: every declaration that takes the finite field carries `[Fintype F]` (data) where the rule requires `[Finite F]` with `Nat.card F` as q. No acceptance while the gate fails.

**Witness:** Gate at 9b9bd2d: `statement-hygiene=33 … FAIL`, each hit “P3 `[Fintype F]` beside `[Field F]` …; repair: use `[Finite F]`; `Nat.card F` is the cardinality”.

**Repair:** Tested on a scratch copy (`lake env lean`: exit 0, 23 `sorry` warnings, no other message, no `Fintype` left):
1. replace every `[Fintype F]` by `[Finite F]` and every `Fintype.card F` by `Nat.card F`;
2. in `powerSum` (line 39) write `∑ᶠ a : Fin d → F,` for `∑ a : Fin d → F,` (the `Finset` sum needs the `Fintype` instance);
3. `FiniteField.frobeniusAlgHom` needs `[Fintype F]`, so state the three Frobenius hypotheses coefficientwise: in `twisted_system_rigidity`, `(heq : ∀ l ∈ reducedPrefixes (Nat.card F) w, ∀ n, (δ l).coeff n ^ Nat.card F = Polynomial.coeff (<the present right-hand side>) n)`; in `two_row_rigidity`, `(h₁ : ∀ n, δ₁.coeff n ^ Nat.card F = Polynomial.coeff (<rhs>) n)` and `(h₂ : ∀ n, δ₂.coeff n ^ Nat.card F = Polynomial.coeff (<rhs>) n)`.

The README's contract for `FiniteField.frobeniusAlgHom` (line 51) can stay as an input of the proof route.

## R02 (P3) — Duplicated Check bullets

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md`, Checks of §§0.1, 0.3, 0.4, 0.6, 0.9, 0.10, 0.14, 1.1, 1.3, 3.1, 3.3; verbatim: line 317 repeats line 307 (“ζ_A(∅) = 1.”), line 1006 repeats line 996 (“𝔏(∅) = 1.”).

**Claim:** Several Check lists state the same test twice in two wordings (previous report R01, not repaired: the folder is unchanged).

**Witness:** README lines 246 and 250 both test (1, 2) ≤ (2, 1) and its converse; 247 and 250 both test (1, 3) against (2, 1, 1); 316 and 320 both state ζ_A(1) = log_C(1). The other pairs: 318/321, 343/345, 388/392, 441/445, 469/474, 581/585, 621/625, 956/960, 1005/1009.

**Repair:** Delete the second copy of each pair, keeping the fuller wording where the two differ (line 250 over 246–247, line 320 over 316, line 960 over 956). Each definition keeps at least three Checks.

## R03 (P3) — The scope does not say that no base roadmap exists

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:7`: “This Part II develops the multiple-depth extension of depth-one Carlitz special values. Its foundation targets in §0.0 construct …”.

**Claim:** A Part II says where its base roadmap stops; no roadmap `DrinfeldModulesAndTModules` exists on main, at an open head or in the merge order, and the scope does not say so (previous report R02, not repaired).

**Witness:** `ORDER.txt` lists only `DrinfeldModulesAndTModulesPartII` (line 381); main's `TauCetiRoadmap/` has no `DrinfeldModulesAndTModules*` folder; `open-pull-requests.md` names none.

**Repair:** Add to *Scope and ownership*, after the first paragraph: “No earlier roadmap constructs the Carlitz module, its period, Ω, the arithmetic entire ring E, effective dual t-motives or the ABP and Frobenius interfaces: §0.0 is their owner, and a depth-one roadmap consumes §0.0 by section.”

## R04 (P3) — Locator for the field in Chang's MZ property

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:1069`: “A nonzero Z ∈ C_∞ has the MZ property of weight w ≥ 1 if there are d ≥ 2, Φ ∈ Mat_d(K̄[t]) and ψ ∈ E^d with ψ⁽⁻¹⁾ = Φψ such that …”.

**Claim:** The cited definition (CHANG14 Definition 3.4.1) takes Z in the algebraic closure of K∞, as far as the cached text shows; the README's C∞ is the carrier later users need, and the locator does not say that the carrier was widened (previous report R03, not repaired).

**Witness:** CHANG14 line 343 (field of Z printed as the completion at infinity, overline lost in extraction); IKLNDP24 line 3571 applies the property to a value with (q−1)-th roots of F̄_q-constants, outside K∞.

**Repair:** After the locator add: “stated by Chang for Z in the algebraic closure of K∞ and used by Im–Kim–Le–Ngo Dac–Pham for values in F̄_q·K∞ ⊂ C∞; the proof of §3.9 uses only the witness (Φ, ψ)”.

## Previous findings

- R01 — not repaired: README lines 307 and 317 both read “ζ_A(∅) = 1.”; lines 996 and 1006 both read “𝔏(∅) = 1.”. Written again as R02.
- R02 — not repaired: README line 7 still opens “This Part II develops the multiple-depth extension of depth-one Carlitz special values.” with no sentence on the absent base roadmap. Written again as R03.
- R03 — not repaired: README line 1069 still reads “A nonzero Z ∈ C_∞ has the MZ property of weight w ≥ 1 if …” with the bare CHANG14 locator. Written again as R04.

## Verified sound

Incremental re-review of 0 changed lines since 9b9bd2d; this round read the pull request's title and description against the head.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| Description: “dim Z_w = d(w)” (`todd_dimension`, `toddNumber` as a count of `thakurIndices`) | q = 2, 3, 4; w = 0..7, enumeration of compositions against Todd's recurrence | q=2: 1,1,1,2,3,5,8,13; q=3: 1,1,2,3,6,11,20,37; q=4: 1,1,2,4,7,14,27,52 on both sides | Agree |
| Description: “dim AZ_w = s(w)” (`alternating_dimension`, `alternatingNumber`) | same range, Σ (q−1)^depth over q-indivisible compositions against the recurrence | q=2: 1,1,1,2,3,5,8,13; q=3: 1,2,6,16,46,130,368,1042; q=4: 1,3,12,48,189,750,2973,11784 on both sides | Agree |
| R01 repair, `powerSum` with `∑ᶠ` | d = 0; finite index type `Fin d → F` | one empty tuple, summand X⁰ = 1; finite support, so `finsum` equals the `Finset` sum | Same value |
| R01 repair, coefficientwise Frobenius (`twisted_system_rigidity`, `two_row_rigidity`) | δ = c·Xⁿ over K̄, q = 3 | `map` side: coefficient c³ at n; coefficient side: c³ at n; `Nat.card F` = `Fintype.card F` = 3 | Equivalent hypotheses; repaired copy elaborates |

The rows of the previous review for the untouched statements stand as in the previous review, of `9b9bd2d`.

- Pull request text (step 8): title and every prose sentence of the description compared with the head; none contradicted. Adds the roadmap (not on main; 3 files, 2036 insertions, nothing removed); suppliers named in the README are RestrictedPowerSeries and ReductiveGroupsPartII (on main) and PeriodsAndSpecialValues and PadicDifferentialEquationsAndRigidCohomology (open, both in the `depends-on` block). Validation sentence: build, 0 `set_option`, 0 sorry'd data, 0 missing identifiers, depcheck 0, outside-folder diff empty: all reproduced.
- Gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=33 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL` (R01).
- Dependency check: `depcheck: 243 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean`: exit 0, 23 `declaration uses sorry` warnings, nothing else. The repaired scratch copy: the same.
- Cross-roadmap citations resolved again: RestrictedPowerSeries and ReductiveGroupsPartII §RG2.3.7 (main, README line 5201); PeriodsAndSpecialValues §PS.9.1–§PS.9.4 (open head, README lines 2033, 2058, 2084, 2106); PadicDifferentialEquationsAndRigidCohomology §RD.0.33 (open head). 4 of 4 found.
- Pinned declaration opened: `Mathlib/FieldTheory/Finite/Basic.lean:333` (`FiniteField.frobeniusAlgHom`, needs `[Fintype K]`; `:345` `coe_frobeniusAlgHom` gives x ↦ x^q).
- Seeded sample and the remaining steps: no passage of the folder changed, so none of the fifteen targets falls in a changed passage; they stand as in the previous review. Files outside the folder: none changed.
- Overlap check: read PeriodsAndSpecialValues (the only roadmap in the three lists); shared object: the positive-index stuffle product, owner PeriodsAndSpecialValues §PS.9.2, cited here in §1.3; nothing else shared. No other open pull request changes this folder; no cited id is dropped.
- Source independence: changed passages only; 0 passages changed, 0 compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's sentence on AI assistance (“2 independent review rounds and 2 red-team rounds”) describes the board, not the head; the package's report list is consistent with it, and nothing in the folder can confirm or refute it.
- CHANG14 Definition 3.4.1: the cached extraction drops overlines, so whether the field of Z is K∞ or its algebraic closure cannot be read off; R04's wording covers both.

## Source issues

- **Misprint** in CCM23 at (2.3.2), printed p. 9: the source says the divisibility condition is on k while the coefficient is indexed by j; it should be (q − 1) divides j; affects a stated result.
- **Misprint** in CHANG14 at Definition 3.4.1, printed p. 8: the source says, as cached, that Z lies in the completion at infinity although later statements apply the property outside it; it should be the algebraic closure of that completion or C∞; affects nothing.

## For the human reviewers

- none

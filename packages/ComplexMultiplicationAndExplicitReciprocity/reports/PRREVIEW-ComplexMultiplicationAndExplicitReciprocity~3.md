# Review of ComplexMultiplicationAndExplicitReciprocity (pull request #1254 at c9fe5ac)

**Verdict:** needs changes

Incremental re-review of the 10 lines changed since `615f9de`, plus the pull request's title and description.

## R01 (P1) — `Suggested.lean` does not build: `principalIdealAway` is not in the Tau Ceti this branch pins

**Location:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean:61` and `:63`: “`TauCeti.NumberFieldArithmetic.principalIdealAway K m.support a`”.

**Claim:** `IsCanonicalGrossCharacter` elaborates against the pinned Tau Ceti.

**Witness:** `lake env lean` on the file: `61:11` and `63:11`, “Unknown identifier `TauCeti.NumberFieldArithmetic.principalIdealAway`”. The branch's `lake-manifest.json` pins Tau Ceti `a91d3aa`; the declaration exists only from main's pin `2fd255d` (`TauCeti/RingTheory/DedekindDomain/Ideal/UnitsAway.lean:65`).

**Repair:** Merge `main` into the branch, keeping the Lean text as it is; `git merge-tree HEAD origin/main` reports no conflict, and main's manifest pins `2fd255d`. Do not revert to `principalIdealPrimeTo`: `2fd255d` no longer declares it. Not elaborated on the merged tree (the review may not change the checkout); by reading at `2fd255d`: `primeToSubgroup m` is an `abbrev` for `(m.support : Set _)ᶜ.unit K` (`TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:401`), and `RayClass/Exact.lean:99` applies `principalIdealAway K m.support x` to `x : primeToSubgroup m` exactly as here. The merge also makes the description's sentence “the targeted Lake build succeeds with `sorry` as the only warning” true again; at this head it is false.

## R02 (P3) — The higher-genus level function field still has no Check of its own

**Location:** `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:482`, Checks at lines 494–496: “In genus one at level one, `F_1 = ℚ(j)` and regular evaluation at the Gaussian point sends `j` to `1728`.”

**Claim:** The three Checks test the field `F_N` this roadmap constructs for `g ≥ 2`.

**Witness:** Unchanged since `615f9de` (previous R02). Replace every `F_N`, `g ≥ 2`, by its constant field `ℚ(ζ_N)`: the two genus-one Checks and the `ζ_N ↦ ζ_N^a` Check still hold, though transcendence degree is 3, not 0, for `g = 2`.

**Repair:** Keep the genus-one lines as imported comparisons and add three Checks on `g ≥ 2`: (i) for `g = 2`, `F_1` has transcendence degree `3` over `ℚ` (a constant-field model gives `0`); (ii) a named nonconstant `f ∈ F_1`, `g = 2` (a quotient of two equal-weight Siegel Eisenstein series), is regular at one named CM point and its reciprocal is outside the evaluation local ring at a zero of `f`; (iii) for `N = 5`, `U = diag(2,2,1,1) ∈ GSp₄(ℤ/5)` has `ν(U) = 2` and sends `ζ₅` to `ζ₅² ≠ ζ₅`, applied twice `ζ₅⁴`.

## R03 (P3) — The description predates the import of elliptic CM theory and the later repairs

**Location:** pull request description, second paragraph: “reciprocity on torsion and regular modular values, generated ring and ray class fields, CM Hecke characters”; validation paragraph: “with author-side red-team passes to follow”.

**Claim:** The roadmap develops ring and ray class fields of imaginary quadratic fields, and no red-team repair has been made yet.

**Witness:** `README.md:22` (scope table): full-order elliptic classification, singular-modulus integrality, class polynomials and ring/ray Artin reciprocity are owned by ImaginaryQuadraticClassNumber §H3.1; `README.md:36`: “CM.3 uses that classification and reciprocity”. Commits `a0106e6f`, `8b894800` are red-team repairs.

**Repair:** Replace the phrase by “exact fields of regular CM level values (elliptic classification, class-polynomial integrality and ring/ray reciprocity are imported from ImaginaryQuadraticClassNumber §H3.1, on main)”, and the last clause by “author-side red-team passes and two review rounds are applied”. After R01, restate the validation sentence against the merged head.

## Previous findings

- R01 — repaired: `README.md:125` “multiplies under composition (A3.1, multiplicativity of ranks under composition)”; `README.md:364` “(AbelianSchemesAndArithmeticModuli A3.1, multiplicativity of ranks under composition)”. The supplier's A3.1 states that law at its open head (README line 1414).
- R02 — not repaired: `README.md:494–496` are the same three Checks as at `615f9de`; raised again as R02 above.

## Verified sound

| Statement | Instances tried | Computed values / two sides | Result | Change |
|---|---|---|---|---|
| `IsCanonicalGrossCharacter`, principal-sign clause with `principalIdealAway K m.support a` (changed) | `K=ℚ(√−7)`, `α=(1+√−7)/2`; `K=ℚ(i)`, `α=i`; trivial character | Underlying ideal is `toPrincipalIdeal α` under both names (`coe_principalIdealAway`, `rfl`). `ψ((α))=±α`, norm 2; trivial gives `1≠±α`; `(i)=(1)` forces `1=±i`, false | Meaning unchanged; does not elaborate at the branch pin | R01 |
| `canonicalGrossExistence` (depends on the changed definition) | `D=−3,−4,−7,−8,−20` | RHS false, false, true, true, false; units `ζ₃`, `i` violate `ψ((u))=1=±u` for `−3,−4` | Agrees with `615f9de` row; blocked by R01 | R01 |
| CM tensor ideal inclusions, rank multiplicativity citation (changed) | `[2]` then `[3]`, `d=1,2`; `a=(2)⊂b=O`, `x=2` | `4·9=36=6²`; `16·81=1296=6⁴`; `N(2)=[b:xb]=4=[b:a]·[a:xb]=4·1` for `d=1` | Pass; citation resolves to A3.1 prose | None |
| Higher-genus `F_N` Checks (finding) | `g=2`, constant-field model | transcendence degree 3 versus 0; all three stated Checks hold for both | Checks do not discriminate | R02 |

Rows for the untouched statements stand as in the previous review, of `615f9de`.

- Gate at `c9fe5ac`: FAIL, `build=3` (the two errors of R01 and the exit code); every other counter 0, including `outside-folder=0` and `depcheck=0`.
- Elaboration (`lake env lean` on `Suggested.lean`): 2 errors (lines 61, 63), 2 `sorry` warnings (lines 70, 93); the one-tactic probe and `#check` comparison were not rerun on the broken definition, the two theorem statements are textually unchanged.
- Dependency check output: `depcheck: 245 roadmaps, 2244 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Library declarations opened: 5 (branch pin `a91d3aa`: `RayClass/Basic.lean:112` `principalIdealPrimeTo`; main pin `2fd255d`: `UnitsAway.lean:65,72`, `RayClass/Modulus.lean:401,498`, `RayClass/Exact.lean:99`, `HeckeCharacter/Ideal.lean:120`); the other names `Suggested.lean` uses (`reducedForms`, `mem_posDef_of_mem_reducedForms`, `root`, `posDef`, `IsAlgebraic`, the three imported modules) exist at `2fd255d`.
- Cross-roadmap citations resolved: 1 (AbelianSchemesAndArithmeticModuli A3.1, open head); no source locator is in a changed passage, so the seeded sample falls outside the change.
- Duplication: `principalIdealAway` is cited, not restated; the README does not name it or `principalIdealPrimeTo`. Overlap facts: no other open pull request changes this folder, none drops an id cited here, none dropped here.
- Overlap check: read ComplexMultiplicationAndExplicitReciprocityPartII, NonordinaryCMSpecialValues, GrossZagierAndArithmeticHeights, PELModuli, ShimuraVarieties, ImaginaryQuadraticClassNumber as in the review of `615f9de` (the change touches no ownership statement); nothing shared beyond the stated imports from ShimuraVarieties §5 and ImaginaryQuadraticClassNumber §H3.1.
- Pull request text: title and the summary block agree with the head (“adds a roadmap”, 3 files, 5 declarations, the 13 open suppliers); the two stale phrases are R03, the validation sentence is in R01.
- Source independence: changed passages only; 2 passages compared with 1 source (KS, §1.2), none shared (both are supplier citations in the roadmap's own words); largest share MilneCM, 18 of 72 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The repaired statement on the merged tree: elaboration against Tau Ceti `2fd255d` needs the merge of R01, which a review does not perform; typing was checked by reading the declarations at that pin.
- Deuring, GZ, BKO and Kato Lemma 15.11: as in the review of `615f9de` (paywalled, unreachable deposit, damaged extraction); no changed passage cites them.

## Source issues

- none

## For the human reviewers

- none

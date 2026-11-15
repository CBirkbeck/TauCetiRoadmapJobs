# Review of PELModuli (pull request #966 at 697b514)

**Verdict:** needs changes

Incremental re-review of the 7 lines changed since 04e8720, and a first check of the title and description against this head. Both findings of the previous report are repaired as it asked. Two P3 points remain: the repaired M1.3 sentence admits a degenerate choice at a degree-one prime, and one sentence of the description's summary block.

## R01 (P3) — The separating element of M1.3 may be zero at a degree-one prime

**Location:** `TauCetiRoadmap/PELModuli/README.md` lines 1651–1653: "element of `O_F` congruent to a primitive element of one residue field `O_F/𝔭` of `O_F` above `p` and to `0` at the others separates the residue-field embeddings by unique factorization".

**Claim:** every such element recovers the multiplicities `r_τ` for `τ` over `𝔭` from `charpoly(i(a) | Lie)`.

**Witness:** `O_F = ℤ[i]`, `p = 5`, `O_F/𝔭 = 𝔽₅`: `0` is a primitive element of `𝔽₅` over `𝔽₅`, so `a = 5` qualifies; types `(2,0)` and `(1,1)` on `Lie = κ̄²` both give `T²`.

**Repair:** write "congruent to a nonzero primitive element of one residue field `O_F/𝔭` of `O_F` above `p` and to `0` at the others". Tested on the same instance: `a = 2 − i` is `4` modulo `(2 + i)` and `0` modulo `(2 − i)`, giving `(T − 4)²` for `(2,0)` and `(T − 4)T` for `(1,1)`. When `f(𝔭) > 1` a primitive element is already nonzero with pairwise distinct conjugates, so nothing else changes.

## R02 (P3) — The description says the roadmap follows two sources

**Location:** the description, block `<!-- roadmap-summary -->`, paragraph "Approach and generality": "It follows Lan and Kottwitz."

**Claim:** the roadmap's plan is that of Lan and Kottwitz.

**Witness:** the README has no such sentence, and a roadmap does not say it follows a source (planning principles). Layers M3–M6 carry 17 of the 92 Lan citations and rest on Deligne, Milne, Wedhorn, Tsimerman, Faltings–Chai and Bijakowski as well.

**Repair:** replace the sentence by "The moduli problem is the integral isomorphism problem with level structure, compared with the rational quasi-isogeny problem in M1.10; the determinant condition is Kottwitz's (M0.18)." The rest of the paragraph stands.

## Previous findings

- R01 — repaired: line 1001 reads "§5.1, p. 34, for `(a_τ, b_τ)`" and line 1282 "(Bijakowski, §4.1, p. 27)"; bijakowski line 1370 is on page 34 (marker at line 1368), line 1077 on page 27 (marker at line 1066).
- R02 — repaired: lines 1651–1652 read "a primitive element of one residue field `O_F/𝔭` of `O_F` above `p` and to `0` at the others"; the object named is now right. The wording still admits `0` at a degree-one prime (R01 above).

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| M1.3 field equivalence of the two signature conditions (lines 1650–1653) | `ℤ[i]`, `p = 3` inert, `a = i`; `ℤ[i]`, `p = 5` split, `a = 2 − i`, `a = 5`; `a = 1` at `p = 3` | `p = 3`: `(T − i)²` against `T² + 1`, `i ≠ −i`; `p = 5`: `(T − 4)²` against `(T − 4)T`; `a = 5`: `T²` both; `a = 1`: `(T − 1)²` both | sound once the element is nonzero | R01 |
| M0.13 locator for `(a_τ, b_τ)` (line 1001) | bijakowski §5.1 | §5.1 opens on p. 33 (line 1352); the signature pair of `W_i` is introduced at line 1370, p. 34, with Remarque 5.1 at line 1371 | exact | none |
| M0.21 type C multiplicity (line 1282) | bijakowski §4.1; `B = F = ℚ`, `U_ℚ = ℚ^{2g}` | source line 1077, p. 27: `g = dim_ℚ U_ℚ/(2nd)`; instance `n = d = 1`: `2g/2 = g`, the Siegel genus | exact | none |
| M0.21 type A sum `a + b` (line 1280, cited by the changed line) | bijakowski line 1380, p. 34; `F = ℚ(i)`, `n = 1`, `dim_ℚ U_ℚ = 6` | source: `a_i + b_i = dim_ℚ U_ℚ/(2nd)` independent of `i`; instance: `6/2 = 3 = 2 + 1`, the Picard signature | exact | none |

The rows for the untouched statements stand as in the previous review, of 04e8720.

- Gate: the worker's gate at 697b514 passes with every counter zero and the targeted build OK; no file is changed outside the folder (`git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/PELModuli` is empty).
- Dependency check: `depcheck: 247 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuli/Suggested.lean` exits 0 with three warnings, all `declaration uses sorry` (lines 62, 70, 80). The diff touches no Lean; the four elaborated signatures are those the previous review compared with the README, and its `#check @name` comparison and one-tactic probe stand.
- Source locators checked against the text: 3 (bijakowski lines 1077, 1370, 1380), all exact. The seeded sample targets (M0.24, M1.10, M2.16, M3.2) do not fall in the changed passages.
- Description against the head, sentence by sentence: the title; the summary block's account of what is built (README lines 3–28), of the consumers (lines 4150–4168) and of the approach (SV3 explicit at lines 964–967, nonfaithful actions at line 637, Artin's criteria at line 2387, `LinearMap.polyCharpoly` at line 1040, `TauCeti.Symplectic.groupScheme` at line 342 and at the pin in `TauCeti/Algebra/Lie/Symplectic/StandardCarrier/AlternatingForm.lean` line 19); the folder's three files; the validation sentence against the gate. Only the sentence of R02 fails. The pull request adds the roadmap and removes nothing, so no removal is left unstated.
- Suppliers named by the description against the README: the nine roadmaps of the dependency list are exactly the README's suppliers that are not main-branch roadmaps; every other roadmap the README names is on main (SchemeAndStackFoundations, ModularCurves, ReductiveGroups and Part II, ClassFieldTheory, ProfiniteArithmetic, LocalFieldsRamification, GlobalNumberFields, NumberFieldArithmetic, RestrictedProducts, Chebotarev, ProfiniteCohomology, EtaleCohomologyFoundations, ClassicalArithmeticCompletion, IntegralLattices), a consumer (lines 4150–4168), or CrystallineCohomology, named once as a supplier's supplier (line 209) and in the merge-order chain.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no second copy on main.
- Overlap check: read AbelianSchemesAndArithmeticModuli, ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves, ShimuraVarieties, FaltingsFinitenessAndIsogenyTheorems (no roadmap on main is listed as close); nothing shared. Each leaves PEL data and moduli to PELModuli; rational polarized Siegel moduli are ShimuraVarieties §5.0, cited here at lines 233 and 3148; the full `Res_{F/ℚ} GL₂` Hilbert datum is ShimuraData §5.3, the Hilbert integral models are HilbertModularVarietiesAndShimuraCurves §H2, and compactifications are ShimuraCompactifications.
- Source independence: changed passages only; 3 passages compared with 1 source (bijakowski), none shared (the two locator lines carry a formula and a page; the M1.3 sentence has no source counterpart); largest share Lan, 92 locators; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, Definition 3.4.3, p. 149 (named in the sentence before the changed M1.3 passage): not re-read this round; the changed sentence does not depend on its wording.
- The description's sentence on AI assistance and author-side passes: a statement about how the text was produced, with no counterpart in the folder.

## Source issues

- none

## For the human reviewers

- **Not tested.** Lan's book has the largest share of the locators (92). Its table of contents was not set beside the layers in this round, and neither earlier report of this folder carries a `Source independence:` line.

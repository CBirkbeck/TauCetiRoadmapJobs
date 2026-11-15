# Review of FaltingsFinitenessAndIsogenyTheorems (pull request #1004 at c882669)

**Verdict:** needs changes

Incremental re-review of the 115 lines changed since `b83ebd4`, with the title and description read against this head. Two P3 findings; no P1 or P2.

## R01 (P3) — `letI` in the signature of `finite_curves_goodReduction` (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/Suggested.lean:137` "`letI : C.left.Over (Spec (.of K)) := ⟨C.hom⟩`".

**Claim:** The gate fails on this head with `statement-hygiene=1`: a `letI` inside a theorem's statement. The line is also redundant.

**Witness:** Mathlib at the pin, `Mathlib/CategoryTheory/Comma/Over/OverClass.lean:139–140`: `instance OverClass.fromOver (X : Over S) : OverClass X.left S` with `hom := X.hom`, the same structure morphism.

**Repair:** Delete line 137. Tested on a scratch copy: the file elaborates with the same ten `declaration uses sorry` warnings and nothing else.

## R02 (P3) — R28.1.9 attributes to its two suppliers a route and a theorem they do not state

**Location:** `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md:943–944`: "The generic input is ArithmeticGaloisDuality R02.3.1, which realises it through the `ramifiedSupport` finiteness of NumberFieldArithmetic Layer 4.3".

**Claim:** A defect of the repair of the previous R03. ArithmeticGaloisDuality R02.3.1 does not use `ramifiedSupport`, and NumberFieldArithmetic Layer 4.3 states no finiteness of fields.

**Witness:** ArithmeticGaloisDuality README (open head) 1955–1968: the route is the discriminant bound from NumberFieldArithmetic Layers 4 and 6 and `NumberField.finite_of_discr_bdd`; `ramifiedSupport` occurs nowhere in it. NumberFieldArithmetic §4.3 (main, line 1210) only defines the `Finset` and its membership criterion.

**Repair:** Replace lines 943–945 by: "The generic input is ArithmeticGaloisDuality R02.3.1. Its hypothesis is read through `ramifiedSupport` of NumberFieldArithmetic Layer 4.3: an extension is unramified at each finite place outside `S` exactly when its ramified support lies in the finite places of `S`." The `*Needs:*` line at 948–950 already says this and stays.

## Previous findings

- R01 — repaired: `README.md:357` "`AbelianScheme.dual` (with the duality of products)", `:360` "`Hom.deg` (with the function-field degree)"; the same at 1050 and 2678. Neither invented name remains.
- R02 — repaired: `README.md:336–337` and `660` carry `ArithmeticModuli.DMSchematicClosure.stack`, `ArithmeticModuli.DMNormalization.stack`, `ArithmeticModuli.DMNormalization.finite`.
- R03 — partly repaired: both revision hashes and the pin narrative are gone; the replacement sentence at 943–944 misdescribes the suppliers (R02 of this report).
- R04 — repaired: 298 "The orthogonal-sum form"; 466 "This roadmap's correspondence stack"; 847 and 1153 "Use, as an alias, … from"; 2615 "R28.5.14 (the field specialization … rational Torelli)".
- R05 — repaired: R28.1.4's `*Needs:*` reads "PELModuli M6.5 (moduli point);" and the level-3/4 Check is deleted; three Checks remain; M6.3 `siegelStack` is still cited at 432 and 653, where it is used.
- R06 — not repaired, and not carried: the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. A manifest is no file of a roadmap folder (the gate's stray-files rule would refuse it; the sources are the README's references), so no change is asked for.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| `finite_curves_goodReduction` (R01) | with and without line 137 | `letI` instance `⟨C.hom⟩`; `OverClass.fromOver C` has `hom := C.hom`; both elaborate, 10 `sorry` warnings each | Same statement; delete the line. |
| R28.1.9 ramification translation (R02) | `K = ℚ`, `S = {2, ∞}`, `n = 2` | `ℚ(i)`: disc `−4`, support `{2} ⊆ {2}`; `ℚ(√3)`: disc `12`, support `{2,3} ⊄ {2}`; AGD's Check lists `ℚ, ℚ(i), ℚ(√±2)` | The equivalence holds; only the attribution is wrong. |
| R28.1.3 record, reworded fields (a)–(e) | `g = 1`; field (c) | `g̃ ≥ max(1, 2) = 2`, so stable curves exist; one integer `d ≠ 0`, and R28.1.4's lcm over components of `U` is then `d` | Same content as at `b83ebd4`. |
| R28.2.1 reworded formula | `φ = [n]`, dimension `g`, `[K:ℚ] = m` | cokernel `ω/nω` of order `n^{gm}`; `½·2g·log n − (1/m)·gm·log n = 0` | Same statement; consistent. |
| R28.2.3 reworded lattices | elliptic curve, good ordinary; multiplicative reduction | ranks `0 ⊆ 1 ⊆ 2`; `1 ⊆ 1 ⊆ 2`, quotient of rank 1 with trivial inertia (Tate curve) | Consistent; the added §3.13 citation is over a complete DVR, as `R_i` is. |
| Parshin paragraph, reworded | `k = 3`; `k = 2` | `D` has `k − 1 = 2` points; one point, where the generalized Jacobian is the Jacobian and doubling is unramified | Agrees with the Check at 2912–2913. |

- The rows of the review of `b83ebd4` for the untouched statements stand as in that review; `Suggested.lean` did not change since.
- Gate at this head: every counter zero except `statement-hygiene=1` (R01); build `0`. `lake env lean` on `Suggested.lean`: ten `declaration uses sorry` warnings (lines 74, 90, 104, 114, 134, 160, 169, 184, 195, 207), nothing else. No file changed outside the folder.
- Dependency check output: `depcheck: 245 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Cross-roadmap citations resolved for the changed passages (6): NumberFieldArithmetic §4.3 (main, 1210); ArithmeticGaloisDuality R02.3.1 (1842, 1955–1958); NeronModelsAndSemistableAbelianVarieties §3.13 `RaynaudExtensionComparison` (2019); AlgebraicModuliForArithmeticGeometry §5.4 names; PELModuli M6.3, M6.5; the consumers EllipticCurveModularity and EllipticCurveModularityPartIIGL2TypeAbelianVarieties, whose heads cite R28.4 and R28.6 from here.
- Source locators read (5): `faltings-1983 lines 159–176` (Lemma 2, p. 352), `392–401` (Lemma 5, p. 358), `421–431` (Lemma 6, p. 358), `682–700` (proof of Satz 7, p. 365); seeded sample in a changed passage: `dm1969 line 1091`, Theorem 4.19, supports "Integral lifting after a finite extension" for the local step. The other four seeded targets lie in untouched text.
- Pull request text against this head: the consumers named (EllipticCurveModularity, the GL2-type roadmap, HeightsRationalPointsAndObstructions, Heegner-point, motives, MordellLawrenceVenkatesh) match `README.md:2920–2932`; the three files named are the folder's; the 16 open suppliers of the README's contracts are those the description lists, the others are on main; the validation sentence claims nothing the gate contradicts (it does not mention the statement-hygiene rule). No sentence is contradicted and no change is left unstated.
- Overlap check: read ArakelovGeometryAndAbelianHeights, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, PELModuli, FaltingsFinitenessAndIsogenyTheoremsPartII, ClassicalArithmeticCompletion, HeightsAndUnits as in the review of `b83ebd4`; the diff adds no object; nothing shared. The overlap list reports no dropped id, no second copy and no other pull request changing this roadmap.
- Source independence: changed passages only; 5 passages compared with 2 sources, none shared (the reworded fields (c), (d), the Lemma 6 set-up and the Parshin paragraph no longer track the source's clause order); largest share faltings-1983, 61 of about 155 locators; contents not compared again (the diff adds, removes or reorders no layer).
- Remark (untouched text, no change asked): the lettered fields (a)–(d) of R28.1.3 keep the order of the source's lemma; their content is forced by the statement.

## Not verifiable

- SGA 7 I Exposé IX, Faltings–Chai V, Martens, Mumford §23, Reiner: no legal text available, as in the review of `b83ebd4`; none is cited by a changed passage's new claim.
- `faltings-1983` is an OCR scan: the statement of Lemma 6 (line 430) and condition (c) of the bad-reduction list (line 699) are illegible; the reworded passages were compared with the legible lines around them.
- Ownership against open pull requests the brief does not index was not checked.

## Source issues

- none

## For the human reviewers

- none

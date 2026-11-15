# Review of EllipticCurveModularity (pull request #1018 at 5baf484)

**Verdict:** accepted

Incremental re-review of the 83 lines changed since `3593d3b`. No finding.

## Previous findings

- R01 — repaired: README 1277-1287 "That section supplies, at each prime ℓ, the exponent `f(E_(ℚ_ℓ))` with `a(V_r(E_(ℚ_ℓ))) = f(E_(ℚ_ℓ))` … its §5.3g supplies … Prove the passage to the global representation"; `*Needs:*` (1434-1438) has §§2.1, 5.3a, 5.3g, 5.3i.
- R02 — repaired: contract row `Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq` (README 185); 1059-1061 "is the pinned … of the supplier contracts, applied with both characters trivial"; 202-207 and the Miyake reference (2056-2059) agree.
- R03 — repaired: README 495-501 "The headline on `AbelianVariety ℚ` also needs the carrier comparisons AbelianSchemesAndArithmeticModuli A0.2 and A1.6 … ModularCurves Layer 1.3 … FaltingsFinitenessAndIsogenyTheorems §R28.6.1(i)"; the layer's Dependencies (763-766) list all four.
- R04 — repaired: heading "### Rational 3-, 5- and 15-isogenies" (527); 539-540 "these three isogeny targets follows the Imperial College London FLT project"; 564-565 "a special case, recorded in the Checks below".
- R05 — repaired: the sentence "This is a planned supplier interface." is gone; the passage (README 813-815) now reads "for the full eigenform underlying F. It uses one unital map …".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Conductor specialization (README 1277-1295; sampled) | 11a1; 37a1; `y²=x³−x`; ℓ = r | `f_11 = 1`, N = 11 on both sides; 37 = 37; local `f_2 = 5`, N = 32 vs bad-prime product 2 (additive, not semistable); ℓ = r excluded: the r-adic global conductor omits r | pass; supplier §5.3a states `a(V_ℓE) = f(E)` for all `ℓ ≠ p`, §5.3g the 0/1 criteria |
| Cross-level uniqueness of `IsNewformOf` via the pinned theorem | both characters trivial; N = M; 11a1 vs 37a1; level-22 oldform | character hypothesis `1 ∘ _ = 1 ∘ _` holds; at N = M, `lcm N N = N` gives `f.χ = g.χ`; a₃ = −1 vs −3, hypothesis fails as it must; no `Newform 22 2` from 11a1 | pass; `Newforms/StrongMultiplicityOne.lean:451-465` |
| `rationalEndomorphisms_eq_int` with the carrier bridge | 1, 0, [−2]; dim 0 | scalars 1, 0, −2 with degrees 1, 0, 4 on `E` and on `E_ab` (§R28.6.1(i) preserves degree); dim 0 has the zero ring, excluded by `hA` | pass |
| Hauptmodul relations (sampled; one sentence changed) | n = 3, 5 | `(t+27)(t+3)³/t`, `(t²+10t+5)³/t` in the second column | pass; `barrios` lines 250-259 |
| The 15-isogeny boundary (sampled; one sentence changed) | the four j-values | `v_5(j) = 2, 2, 1, 1`: none is a nonnegative multiple of 3 or negative | pass; `ddt` lines 3769-3778 |

The rows for the untouched statements stand as in the previous review, of `3593d3b`; the diff changes no Lean statement. The sampled targets "R29.1", "Curve-level residual attachment", "Exhaustive Γ₀ decomposition" and "Elliptic coefficient summability" lie outside the changed passages.

- Source locators checked against the text: 5 (`serre1970` lines 266-278, `brumer-kramer` lines 550-559, `ddt` lines 2151-2159 and 3769-3778, `barrios` lines 250-259).
- Library declarations opened at the pins (Tau Ceti `2fd255d`): `Newform.level_eq_and_coe_eq_of_forall_notMem_prime_eigenvalue_eq` (`Newforms/StrongMultiplicityOne.lean:451`), `Newform.level_eq_of_forall_notMem_prime_eigenvalue_eq` (427), `Newform.eq_of_forall_notMem_eigenvalue_eq` (172); the contract row matches the hypotheses and conclusion at line 451.
- Cross-roadmap citations resolved, 9: NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g, 5.3i; ArithmeticGaloisRepresentations §2.1 (local restriction `ρ_ι`) and §3.3 (global conductors, `a_v(ρ) = a(ρ_ι)`); AbelianSchemesAndArithmeticModuli A0.2, A1.6; FaltingsFinitenessAndIsogenyTheorems §R28.6.1(i); ModularCurves Layer 1.3 (on main). All present under the cited numbers and saying what is cited.
- Gate on this head: every counter 0, build passes. Dependency check: `depcheck: 246 roadmaps, 2251 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration of `Suggested.lean`: thirteen `declaration uses sorry` warnings and nothing else; the file is unchanged since `3593d3b`, so signatures and the one-tactic probe stand.
- Pull request text read against this head: no sentence contradicted; the change adds no supplier (ModularCurves is on main and was already cited at README 1534), removes no heading target of another roadmap and no declaration.
- Overlap check: read EllipticCurveModularityPartIIGL2TypeAbelianVarieties, EllipticCurveModularityPartII, AlgebraicModularFormsAndSerreWeights, ClassicalSerreModularity, SerreWeightAndLevelOptimisation, ModularForms, EllipticCurves (as in the previous review; the overlap list is unchanged); elliptic conductor and its Artin comparison: owner NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g and EllipticCurves Layer 8, now cited here and not restated; cross-level strong multiplicity one: owner Tau Ceti, cited; `End_ℚ(E) = ℤ` and the stable-cyclic-subgroup predicate: owner EllipticCurveModularity R29.1.
- Source independence: changed passages only; 3 passages compared with 3 sources (`serre1970`, `brumer-kramer`, `ddt`), none shared; largest share `serre`, 22 of about 60 locators, as before; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- Miyake, *Modular Forms*, Theorem 4.6.19 (cited in the changed passages at README 204, 1059, 2056): not in the sources cache; the pinned theorem's docstring names the same locator.
- Faltings–Chai I.1.1–1.2 and Milne III §6 Proposition 6.1, the sources of the supplier sections A0.2, A1.6 and §R28.6.1 now cited: the suppliers' locators, not checked here.

## Source issues

- none

## For the human reviewers

- Licence: README lines 539-540 and 824 say the isogeny targets and the coefficient-map interface follow the Imperial College London FLT project; `three_isogeny_j`, `five_isogeny_j`, `fifteen_isogeny_j` were not compared with that repository's declarations.
- Licence: `serre` was read from its author's Collège de France page and `milne` as a scan of the 1986 Springer chapter on the author's site; both hosts treated as author pages.
- Scope: the three isogeny targets of R29.1 (README lines 527-582) are used by no later layer, since Σ_E contains 3 and 5 by its first clause; their sources are refereed or standard (Barrios, Darmon–Diamond–Taylor).

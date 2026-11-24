# Review of ExplicitNumberFields (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 50 changed lines since `592bdb1`. The change adds one section, 0.7 (Serre's bound for the relative discriminant of a Galois extension, with its root-discriminant form), with its entries in the layer guide, the scope list, the supplier contracts and the references; the bound, its route and its four Checks were recomputed and read against Serre's text at §1.3–1.4, and the two supplier sections it cites were opened. No finding; one small correction (the description does not name this folder's new supplier) and one format note, neither blocking. Nothing is left for a human to decide beyond the final approval.

## C01 — The description does not name the supplier this folder gains

A reader of the description learns that "the additions create 12 new supplier relations between general roadmaps" and is told two of them, but not that ExplicitNumberFields now consumes Completed/NumberFieldArithmetic (§§4.2 and 6.4, in the `*Needs:*` line of 0.7, line 755, and the new subsection of the supplier contracts, line 3552). The roadmap named no section of that roadmap before. One clause in the description would do: "ExplicitNumberFields gains §0.7 (Serre's bound for relative discriminants), which cites Completed/NumberFieldArithmetic §§4.2 and 6.4".

## N01 — The root-discriminant form of 0.7 could name Mathlib's `NumberField.rootDiscr`

The pinned Mathlib defines the root discriminant (`NumberField.rootDiscr`, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean` line 79), and the pinned Tau Ceti has `TauCeti.NumberField.relDiscr_tower` (`TauCeti/NumberTheory/NumberField/Discriminant/Relative.lean` line 43); the `*Needs:*` line of 0.7 (line 755) could name both, so an implementer states `log ρ_E` on the library's carrier.

## Verified sound

Notation in the table: `m = [E:K]`, `n = [K:ℚ]`, `S = Σ_{p ∈ P(E/K)} log p`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.7 bound `log N(𝔡) ≤ n(m−1)S + [E:ℚ] log m` against the source | Serre's (6) has coefficient `[E:ℚ](1 − 1/m)` | `[E:ℚ](1−1/m) = nm(1−1/m) = n(m−1)`; last terms identical | agrees with `serre1981` lines 248–249 | none |
| 0.7 bound, degenerate cases | `E = K`; `E/K` unramified of degree `m` | `0 ≤ 0 + n·log 1 = 0`; `0 ≤ 0 + nm log m` | holds | none |
| Relation `log d_E = m log d_K + log N(𝔡)` | `ℚ(ζ₈)/ℚ(i)`: `d_E = 256`, `d_K = 4`, `N(𝔡) = 16` | `log 256 = 2 log 4 + log 16 = 8 log 2` | agrees with `serre1981` line 221 | none |
| Root-discriminant form | divide (6) by `[E:ℚ] = nm`, using (3) | `log ρ_E − log ρ_K = log N(𝔡)/(nm) ≤ (1 − 1/m)S + log m` | holds | none |
| Route: contribution of the primes above `p` | `v_𝔭(𝔡) = g f (v_P(𝔇))`, `v_P(e) = e·e_𝔭·v_p(e)`, `Σ f_𝔭 ≤ n`, `Σ e_𝔭 f_𝔭 = n` | `v_𝔭(𝔡) ≤ m − 1 + m e_𝔭 v_p(m)`; sum `≤ (n(m−1) + nm·v_p(m)) log p` | equals the README's `(n(m−1) + [E:ℚ] v_p(m)) log p` | none |
| Route: `Σ_p v_p(m) log p ≤ log m` | `m = 4`, `P = {2}`; `m = 6`, `P = {3}` | `2 log 2 = log 4`; `log 3 ≤ log 6` | holds | none |
| Check, `ℚ(i)/ℚ` | `m = 2`, `P = {2}`, `d = 4` | `log 4 = 2 log 2 ≤ log 2 + 2 log 2 = 3 log 2`; root form `log 2 ≤ 1.5 log 2` | true | none |
| Check, `ℚ(√5)/ℚ` | `P = {5}`, `d = 5` | `log 5 ≤ log 5 + 2 log 2`; tame quadratic: `d_E = ∏ p`, first term `= S` attained | true | none |
| Check, `ℚ(ζ₈)/ℚ` | `m = 4`, `d = 2⁸` | `8 log 2 ≤ 3 log 2 + 4 log 4 = 11 log 2` | true | none |
| Check, non-Galois term and `ℚ(p^{1/p^m})` | `p = 2`: `ℚ(√2)`, `d = 8`; `ℚ(2^{1/4})`, `d = 2¹¹` | `2¹·2² = 8`; `2³·4⁴ = 2¹¹`; bound `(N−1) log p + N log N` equal to `log d_E` | true; `serre1981` lines 225–227, 284–288 | none |
| Supplier: exponent bound `v_P(𝔇) ≤ e − 1 + v_P(e)` | tame (`= e − 1`) and wild cases of NumberFieldArithmetic 6.4; `ℚ(√2)` at `2` | `3 = 2 − 1 + 2`; tame `e − 1 ≤ e − 1 + 0` | 6.4 states it for number fields, the generality 0.7 uses | none |
| Consumer of 0.7 (ThetaChainsOnDefiniteUnitaryGroups 2.6) | `M/F` Galois unramified outside `N` | `(1 − 1/m)Σ_{p∣N} log p + log m ≤ log N + log m` | the cited form follows from 0.7 | none |

- Source locators checked against the text: 4 of `serre1981` (§1.3 Proposition 5 (6), formula (3), Proposition 4, §1.4 Exemple), at lines 221–288; all agree.
- Seeded sample: of the fifteen targets, only 0.7 lies in changed or affected text; the other fourteen are untouched and were not re-read.
- Library declarations opened at the pin: `NumberField.rootDiscr` (Mathlib, `NumberTheory/NumberField/Discriminant/Basic.lean` line 79), `differentIdeal` (`RingTheory/DedekindDomain/Different.lean` line 481), `NumberField.discr` (`NumberTheory/NumberField/Discriminant/Defs.lean` line 36), `Ideal.ramificationIdx` (used at `NumberTheory/RamificationInertia/Unramified.lean` line 164), `TauCeti.relDiscr` (`RingTheory/DedekindDomain/Discriminant/Basic.lean` line 33), `TauCeti.NumberField.relDiscr_tower` (`NumberTheory/NumberField/Discriminant/Relative.lean` line 43). Neither library states Serre's bound.
- Cross-roadmap citations resolved: Completed/NumberFieldArithmetic §4.2 (`relDiscr`, tower formula, README line 1123) and §6.4 (tame and wild exponents, line 1818), both on `main`; the one roadmap that cites 0.7 reads it consistently.
- Record: the README at the merge base against the head: no layer or item removed, no id changed; one item added (0.7); `Suggested.lean` unchanged.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ExplicitNumberFields/Suggested.lean`: `sorry` warnings only, no error; the automatic checks all passed. The file is unchanged, so no `#check` comparison of signatures was repeated and no one-tactic probe was run.
- Headline theorems: unchanged by the diff; 0.7 is a Layer 0 input, not a headline, and is not required in `Suggested.lean`.

Overlap check: read ZerosOfLFunctions, LFunctions, LiCoefficientsArithmeticFormula, ExplicitMultiplicativeFunctions, GeneralizedRiemannHypothesisFromWindowBounds, ExplicitPrimeCounting (the third list is empty); nothing shared. A search of every roadmap on main and at the open heads for Serre's discriminant bound finds it stated only here; PadicExtensionFamilies leaves analytic root-discriminant bounds to other roadmaps and SmallRamificationAndAbelianVarietyBaseCases owns representation-specific different bounds, different objects.

Source independence: changed passages only: 5 passages (statement, root-discriminant form, route, the non-Galois Check, the definition of `P(E/K)`) compared with 1 source, none shared beyond the formulas; the route argues through the different directly, not by the source's local propositions; largest share in the changed text `serre1981`, 4 of 4 locators; no layer added, removed or reordered, so the arrangement was not compared.

Research link: The roadmap makes explicit the analytic theory of number fields (ideal counts, zero-free regions, class-number and Chebotarev bounds: Kadiri 2012, Louboutin 2000–2017, Garcia–Lee 2022, Kadiri–Ng–Wong 2019); 0.7 is Serre's 1981 discriminant bound, the input of his effective Chebotarev applications. Rests on the README's summary and references and on `serre1981` §§1–2.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none

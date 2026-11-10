# Review of SpecialFunctionsHypergeometric (pull request #2089 at dc98666)

**Verdict:** needs changes

This is an incremental re-review of the 69 lines changed since 375fe53. Both previous findings are repaired. Moving 15.4.21–15.4.23 to Layer 5 left two small inconsistencies, each fixed by a one-phrase edit (R01, R02). The gate passes, and no statement was found false.

## R01 (P3) — Scope item 4 still claims all of §15.4(ii)

**Location.** `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md` line 61: "4. **Elementary functions and unit argument** (DLMF §15.4(i)–(ii), the circle of convergence in §15.2(i))."

**Claim.** Item 5 (lines 63–64) now claims 15.4.21–15.4.23. The ownership table (line 82) gives Layer 4 only 15.4.1–15.4.20 and 15.4.24–15.4.25. Line 71 says the numbers of the list are those of the layers, so two layers now claim the same three formulas. Item 1 (lines 57–58) handles the same situation with "without".

**Witness.** DLMF-15.4 lines 643, 855 and 885: §15.4(ii) runs from 15.4.20 to 15.4.25, so it contains 15.4.21–15.4.23.

**Repair.** Line 61: "(DLMF §15.4(i)–(ii) without 15.4.21–15.4.23, the circle of convergence in §15.2(i))". Tested: §15.4(i) is 15.4.1–15.4.19 (DLMF-15.4 lines 93–602), so the repaired item is exactly the table row of line 82.

## R02 (P3) — 5.5 attributes to DLMF's notes a route for 15.4.23 that they do not give

**Location.** README line 792, "The routes are those of DLMF's notes to §15.4(ii):", and lines 798–799, "15.4.23 follows from the Euler transformation 15.8.1 (5.1) and 15.4.20 for `F(c − a, c − b; c; ·)`".

**Claim.** The README's route for 15.4.23 is correct, and better than the source's because it covers integer `c − a − b`. It is not DLMF's route, though. DLMF's note sends 15.4.23 through 15.8.4, the same way as 15.4.22. The README's next sentence itself says the route departs from 15.8.4.

**Witness.** DLMF-15.4 lines 653–655: 15.4.21 from 15.8.10, and both 15.4.22 and 15.4.23 from 15.8.4, 5.5.3 and 5.5.1.

**Repair.** Replace the lead-in with: "The routes of 15.4.21 and 15.4.22 are those of DLMF's notes to §15.4(ii). For 15.4.23 the Euler transformation replaces the note's 15.8.4:". Tested on the case the original route misses, `(a, b, c) = (1.3, 1.7 + 0.2i, 1 + 0.2i)` with `c − a − b = −2`, where `sin(π(c − a − b)) = 0`. The Euler route gives `1.19158035232 − 0.185959172473i` on both sides of 15.4.23.

## Previous findings

- R01 — repaired: "### 5.5 Limits at unit argument" (lines 786–804) gives one route per formula and "*Needs:* 4.2 (15.4.20), 5.1, 5.2; Mathlib `Complex.Gamma_mul_Gamma_one_sub`". The Lean docstrings read **5.5**, inside Layer 5. The lead-in sentence of this repair is R02 above.
- R02 — repaired: lines 346–347 now read "(proved on the disk from the series, 1.1, and extended by the identity theorem)".

## Verified sound

**Gate, dependency check, build and Lean form**

- The worker's gate at dc98666 passes every check. A bare rerun of the gate reports `depcheck=1` with "NOT IN ORDER: SpecialFunctionsHypergeometric (insert it after its last supplier)". That happens because the public order does not list a new roadmap yet. The rerun with the job's candidate order and `--build` reports 0 for every check, including `build=0`, and ends "OK".
- Dependency check: `depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`. In the candidate order ZerosOfLFunctions is line 48 and this roadmap line 402. SpecialFunctionsEiLiErfIncompleteGamma, ConformalMappingPartII and EllipticIntegrals are on main.
- The pull request changes no file outside the folder.
- `lake env lean` on `Suggested.lean` prints 61 `sorry` warnings and the output of the `#check` lines, nothing else.
- One-tactic probe on the three moved theorems, on a scratch copy: `simp` makes no progress, `rfl` fails and `norm_num` leaves unsolved goals. None closes. The other 58 theorems are textually unchanged and were probed in the previous review.
- The elaborated types of the three moved theorems are unchanged. Each takes the limit along real `x` in `𝓝[<] 1`, with `hc` on the third parameter, and with `h` and `hne` for 15.4.22 and `h` for 15.4.23. This matches the 5.5 sentence. The file has no section `variable`.
- `Complex.Gamma_mul_Gamma_one_sub` is at `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:398` (`Gamma z * Gamma (1 - z) = π / sin (π * z)`).

**Sources (DLMF §15.4, release date 2026-09-15)**

- The seeded sample falls in the changed passages at 4.2 and 5.5. 1.1 is the target the changed 1.2 sentence cites, and its third bullet (Euler's integral equals Mathlib's series for `0 < Re b < Re c`, `‖z‖ < 1`) is what that step needs. The other sampled targets are untouched; the source table of the previous review stands for them.
- 15.4.20 (DLMF-15.4 lines 669–673): `Re(c − a − b) > 0`.
- 15.4.21 (lines 706–710): `c = a + b`, limit `z → 1−` of `F/(−ln(1 − z))`.
- 15.4.22 (lines 737–741): `Re(c − a − b) = 0`, `c ≠ a + b`.
- 15.4.23 (lines 768–772): `Re(c − a − b) < 0`.
- The right-hand sides are as in the README and the Lean file. The README adds the hypothesis that the third parameter lies outside `{0, −1, −2, …}`, which `F` needs.
- Notes (lines 653–655): see R02.

**Cross-roadmap citations**

- SpecialFunctionsBessel, at the head of its open pull request, cites §§1.2–1.4 only (its README lines 188, 449, 1248, 1288, 1339). SpecialFunctionsConfluent cites the roadmap as a whole (lines 1278, 1293). Moving 15.4.21–15.4.23 breaks no citation.
- The overlaps file lists no dropped id and no other pull request that changes this folder. The move adds no object, so the previous ownership audit stands.

**Remarks on text that needs no change**

- Line 802, "5.1 and 5.2 use only 15.4.20 from 4.2, so there is no cycle", is true.
- "How to read the build" (lines 298–300), "fixing the two coefficients by the limits at `z = 1` (Layer 4)", is still accurate: 5.1 uses Gauss's limit 15.4.20 directly and after the Euler transformation.

**Adversarial pass** (mpmath, 30–40 digits). New rows are for the changed statements; rows marked (r2) are carried from the previous review, PRREVIEW-SpecialFunctionsHypergeometric~2, for statements this change leaves untouched.

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| 5.5, 15.4.21 | `(a, b) = (0.3, 0.7 + 0.2i)`, `x = 1 − 10⁻⁶`, `1 − 10⁻¹²`, `1 − 10⁻²⁴` | 0.32789 + 0.03042i; 0.29464 + 0.03143i; 0.27801 + 0.03194i | 0.26139 + 0.03244i | holds; error ∝ 1/log |
| 5.5, 15.4.21 | `(−1.4 + 0.5i, 2.2)`, same `x` | 0.19437 − 0.60425i; 0.29284 − 0.62570i; 0.34207 − 0.63642i | 0.39131 − 0.64715i | holds |
| 15.4.21 route: constant term of 15.8.10 at `m = 0` | `𝐅(a, b; a + b; x) + log(1 − x)/(Γ(a)Γ(b))`, `x = 1 − 10⁻²⁰`, both pairs | 0.946292881583 + 0.077691487613i; −3.03096396776 − 0.58643258678i | `(2ψ(1) − ψ(a) − ψ(b))/(Γ(a)Γ(b))`: the same | leading term `−log(1 − z)/(Γ(a)Γ(b))` confirmed |
| 15.4.21, polynomial case | `a = −2`, `b = 0.7 + 0.3i`, `x = 1 − 10⁻¹²` | 0.06777 + 0.10844i = `F(1)/27.63`, where `F(1) = 2/((b − 2)(b − 1))` | 0, since `(Γ(−2))⁻¹ = 0` | holds; tends to 0 like 1/log |
| 5.5, 15.4.22 | `(0.3, 0.7 + 0.2i)`, `c = a + b + 0.9i`, `x = 1 − 10⁻⁸`, `1 − 10⁻¹⁶` | −0.0206167682 + 0.0792206372i; −0.0206167676614 + 0.0792206390858i | −0.0206167676614 + 0.0792206390858i | holds |
| 5.5, 15.4.22 | `(1.2 − 0.4i, −0.6)`, `c = a + b − 1.7i` | −0.000874073837739 + 0.00421879928355i | the same | holds |
| 15.4.22, `a ∈ −ℕ` | `a = −2`, `b = 0.4 + 0.3i`, `c = a + b + 0.7i` | 8.0e−17 − 5.4e−17i at `1 − 10⁻¹⁶` | 0 | holds |
| 15.4.22, `c − a ∈ −ℕ` | `a = 1.3`, `c = 0.3`, `b = −1 − 0.5i` | −3.33333333333 − 1.66666666667i | −10/3 − 5i/3 | holds |
| 15.4.22 route: reflection step | `−πΓ(c)/(sin(πs)Γ(a)Γ(b)Γ(1 + s))` with `s = c − a − b`, both generic cases | equal to 12 digits | `Γ(c)Γ(a + b − c)/(Γ(a)Γ(b))` | correct |
| 5.5, 15.4.23 | `(0.3, 0.7 + 0.2i)`, `c = a + b − 0.6 + 0.3i` | 0.413924303822 − 0.105161149555i at `1 − 10⁻¹⁶` | 0.413924303811 − 0.105161149373i | holds |
| 15.4.23, integer `c − a − b = −2` | `(1.3, 1.7 + 0.2i, 1 + 0.2i)` | 1.19158035232 − 0.185959172473i | the same | holds by the Euler route |
| 5.5, 15.4.23 | `(2.1 + 0.4i, 0.9)`, `c = a + b − 1.25 − 0.8i` | 0.482247623337 − 0.197891051608i | the same | holds |
| 15.4.23 route: excess of `F(c − a, c − b; c; ·)` | the three cases | 0.6 − 0.3i; 2; 1.25 + 0.8i | real part `> 0` | Gauss's sum applies |
| 1.2, shift relations of `E` (repair of R02) | `(0.3, 0.4, 2.9, 0.5)`; `(0.3 + 0.2i, 0.6, 3.1 + 0.1i, 0.2 + 0.4i)`; `(0.3, 0.4, 2.9, 2 + i)` | `E` = 0.560212560158; 0.452164787582 − 0.029280564531i; 0.579349623674 + 0.058158322085i, equal to the series and the continued `F/Γ(c)`; residuals of both shifts ≤ 1.2e−14 | 0 | hold on and off the disk |
| 1.2, coefficient identities | symbolic | `(a)ₛ((c − a) + (a + s))/Γ(c + 1 + s)`; `(a)ₛ(b + 1)ₛ − s(a)ₛ(b + 1)ₛ₋₁` | `(a)ₛ/Γ(c + s)`; `(a)ₛ(b)ₛ` | hold |
| 1.2 Checks 1–3 (r2) | `𝐅(0.3, 0.7; −1; 0.4)`; `2/Γ(−½)`; `F(0.3, 0.7; 1.9; 2 ∓ i)` | 0.106407100017; −0.564189583548; 1.0347657243 ∓ 0.3076156788i | README values | holds |
| shift relations at non-Euler parameters (r2) | `(−1.3, 0.4, −2.5, 0.5)`; `c = −1`, `z = −3 + 0.5i` | residuals ≤ 4e−17 | 0 | holds |
| 15.5.18 regularized (r2) | `c = 1`, `1.9`, `−0.4`; `z = 0.4`, `2 + i` | residuals ≤ 7e−26 | 0 | holds |
| 15.10.3, 15.10.7 (r2) | `z = 0.4 + 0.3i`, `2 − i`, `−3 + 0.2i`; `2 + i`, `−1 + 0.5i`, `−4 − 0.3i` | residuals ≤ 2e−16 | 0 | holds |
| 15.10.8, 15.11.7 (r2) | `n = 1, 2, 3`; generic exponents | residuals ≤ 1e−14 | 0 | holds |
| 15.4.20 in the cut plane (r2) | `c − a − b = m ≥ 1` and non-integer | second term tends to 0 with bounded phase | — | true |
| 15.4.26 at `a = −3` (r2) | symbolic `b` | 0 | 0 (`Γ(−2)` in the denominator) | holds |
| 4.3 trichotomy (r2) | terms `∼ C s^{Re(a+b−c)−1}` | exponent `< −1`; in `[−1, 0)`; `≥ 0` | — | three cases; `a, b ∉ −ℕ` needed |
| 15.8.2, 15.8.4 regularized (r2) | `c = −1`; `b − a = 1`; `a = 2`, `b = −1` | residuals ≤ 2e−16 | 0 | holds |
| 15.2.3 jump (r2) | `(0.3, 0.7, 1.9, 2)`; complex `b` | 0.8272611591i; −0.3067354394 + 0.8265250363i | the same | holds |
| 15.8.10 (r2) | `m = 0, 2, 3`; `z = 0.6`, `1.5 − 0.4i`, `0.4 + 0.5i` | residuals ≤ 3e−17 | 0 | holds |
| `w₅`, 15.10.25 (r2) | `z = 2 + i`, `−3 + 0.5i`; `2 − i` | ≤ 4e−16; 1.16 and 0.9176 as printed; 1e−17 with `−i` | 0 | as 5.3–5.4 say |
| 15.6.6–15.6.9 (r2) | Mellin–Barnes and fractional integrals at the r2 points | 0.7426529826 + 0.1232950882i; 0.8208572036 + 0.6811875151i; 1.0189297800 + 0.1339652033i | the same | holds |
| 15.8.31, 15.8.33, cubic transformation of 8.1 (r2) | r2 points inside and outside the domains | ≤ 3e−23 inside; 1.73, 1.64, 0.14, 0.37 outside | 0 | domains needed |
| 15.4.31–15.4.33 (r2) | `a = 0.2`; `a = −1.7 + 0.4i` | 0.9632623833; 1.0170943121; 0.9690200519 + 0.3148537009i | the same | holds |
| 15.9.7, 15.9.26, 15.15.1 (r2) | symbolic; `(½, ½, 1)`; three `(z, z₀)` | coefficients equal; residuals ≤ 3e−18 | — | holds |
| 15.16.4, 15.16.5 (r2) | four `z`; three parameter sets | 1 to 1e−16; 0.7428022470, 0.4785363148 with `Γ(½ + μ)` | the same | corrected form holds |
| 8.14.6, 8.17.9, 8.19.25 (r2) | `(1.5, 0.5, −0.7)`; `(0.7, 1.6, 0.8)`; `(−0.7, 1, 2)` | 2.6959775155; 0.9445669837; 1.0285159272 | the same | holds |
| existence and uniqueness (r2) | regions `R_{p,q}`; two continuations | each step reads `S_{p,q}` inside `R_{p,q}`; identity theorem in `c`, then `b` | — | consistent |

## Not verifiable

- Erdélyi et al. (1953a), Eq. 2.11(41), was not read: no open copy was found in the previous review, and this change does not touch 8.1.
- Andrews–Askey–Roy, Olver, Whittaker–Watson and Dougall (1907) are cited at chapter level. None of them is cited in the changed passages.

## Source issues

- none

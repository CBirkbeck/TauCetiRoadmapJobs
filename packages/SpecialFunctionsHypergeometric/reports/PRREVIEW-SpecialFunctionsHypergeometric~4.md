# Review of SpecialFunctionsHypergeometric (pull request #2089 at aa1fcd0)

**Verdict:** accepted

This is an incremental re-review of the 7 lines changed since dc98666. Both previous findings are repaired by the edits the previous report asked for, and neither edit introduced a new problem. No finding remains and the gate passes.

## Previous findings

- R01 — repaired: README line 61 now reads "(DLMF §15.4(i)–(ii) without 15.4.21–15.4.23, the circle of convergence in §15.2(i))", which is exactly the Layer 4 row of the ownership table (line 82).
- R02 — repaired: README lines 792–793 now read "The routes of 15.4.21 and 15.4.22 are those of DLMF's notes to §15.4(ii). For 15.4.23 the Euler transformation replaces the note's 15.8.4:".

## Verified sound

**The changed passages**

- The change is two sentences of `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md` (lines 61–62 and 792–793). `Suggested.lean` is unchanged, and the pull request changes no file outside the folder.
- Scope item 4 against items 5, 7 and 8 and the ownership table: 15.4.21–15.4.23 now appear in item 5 (line 64) and the Layer 5 row (line 83) only. Item 4 with the exclusion equals the Layer 4 row (line 82). §15.4(iii) stays with items 7 and 8. Each formula of §15.4 has one layer.
- The 5.5 lead-in against DLMF-15.4 lines 653–655: the notes send 15.4.21 through 15.8.10 and both 15.4.22 and 15.4.23 through 15.8.4, 5.5.3 and 5.5.1. The new sentence says this, and the three bullets that follow (lines 794–801, unchanged) agree with it: 15.8.10 at `m = 0`, 15.8.4 with the reflection formula, and 15.8.1 with 15.4.20.
- Everything that cites the changed passages: the three Lean docstrings (`Suggested.lean` lines 334, 339, 346) read "**5.5** DLMF 15.4.21/22/23", the *Needs:* line of 5.5 (line 805) lists 4.2 (15.4.20), 5.1, 5.2 and Mathlib `Complex.Gamma_mul_Gamma_one_sub`, and line 803 ("5.1 and 5.2 use only 15.4.20 from 4.2") is still true. No other passage names 15.4.21–15.4.23 or §15.4(ii).
- The seeded sample falls in the changed passages at 4.2 (scope item 4) and 5.5 (the lead-in); both were checked against DLMF-15.4 as above. The other sampled targets are untouched, and the source checks of the previous reviews stand for them.

**Gate, dependency check, build and Lean form**

- The worker's gate at aa1fcd0 passes every check, including `build=0`. A rerun with the job's candidate order reports 0 for every check and ends "OK".
- Dependency check: `depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- `lake env lean` on `Suggested.lean` prints 61 `sorry` warnings and the output of the `#check` lines, nothing else. The file is byte-identical to the one read at dc98666, so the one-tactic probe, the `#check @name` comparison of elaborated types and the headline list of the previous reviews stand; the signatures file reports no lost section binder for any of the 65 declarations.
- `Complex.Gamma_mul_Gamma_one_sub` is at `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:398` (previous report; the pin is unchanged).

**Cross-roadmap citations, duplication and overlaps**

- The citation resolver lists no cross-roadmap citation found nowhere. Its three Lean-name leads (README lines 233–234, the incomplete Gamma, exponential integral and incomplete Beta names of SpecialFunctionsEiLiErfIncompleteGamma on main) are in untouched text and were resolved in the earlier reviews.
- The overlaps file lists no other pull request that changes this folder, no dropped id and no id that only an open revision defines. The change adds no object and renumbers nothing, so the ownership audit of the earlier reviews stands. SpecialFunctionsBessel and SpecialFunctionsConfluent, the closest open roadmaps, cite §§1.2–1.4 and the roadmap as a whole (previous report); neither citation touches the changed sentences.
- The pull request description needs no change for this head: it names no section the change affects, and "its 61 targets are admitted" matches the 61 `sorry` warnings.

**Adversarial pass** (mpmath, 40 digits). The first four rows are for the changed sentences, recomputed at this head. The remaining rows are carried from the previous report, PRREVIEW-SpecialFunctionsHypergeometric~3, for statements this change leaves untouched: rows marked (r3) were computed there, rows marked (r2, via r3) were carried there from PRREVIEW-SpecialFunctionsHypergeometric~2.

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| 5.5 lead-in, 15.4.23 by the Euler route (changed sentence) | `(a, b, c) = (1.3, 1.7 + 0.2i, 1 + 0.2i)`, `c − a − b = −2`; `x = 1 − 10⁻⁸`, `1 − 10⁻¹⁶` | `F(x)/(1 − x)^{c−a−b}` = 1.1915803501 − 0.1859591704i; 1.19158035232048 − 0.18595917247342i | `Γ(c)Γ(a + b − c)/(Γ(a)Γ(b))` = 1.19158035232048 − 0.18595917247342i; `F(c − a, c − b; c; 1)` gives the same 40 digits | holds; `sin(π(c − a − b)) = 0` here, so the note's 15.8.4 does not apply and the Euler route does |
| 5.5 lead-in, 15.4.22 by the note's 15.8.4 (changed sentence) | `(0.3, 0.7 + 0.2i)`, `c = a + b + 0.9i`, `x = 1 − 10⁻¹⁶` | −0.0206167676613721 + 0.0792206390857537i | −0.0206167676613721 + 0.0792206390857537i | holds; `c − a − b = 0.9i ∉ ℤ` |
| 5.5 lead-in, 15.4.21 by the note's 15.8.10 (changed sentence) | `(0.3, 0.7 + 0.2i)`, `x = 1 − 10⁻¹²`, `1 − 10⁻²⁴` | 0.29464 + 0.03143i; 0.27801 + 0.03194i | 0.26139 + 0.03244i | holds; the gap halves when `log(1 − x)` doubles |
| Scope item 4 against the ownership table (changed sentence) | §15.4(i) = 15.4.1–15.4.19, §15.4(ii) = 15.4.20–15.4.25 | item 4: 15.4.1–15.4.20, 15.4.24–15.4.25; item 5: 15.4.21–15.4.23 | table rows of Layer 4 and Layer 5: the same two sets | disjoint, and together all of §15.4(i)–(ii) |
| 5.5, 15.4.21 (r3) | `(a, b) = (0.3, 0.7 + 0.2i)`, `x = 1 − 10⁻⁶`, `1 − 10⁻¹²`, `1 − 10⁻²⁴` | 0.32789 + 0.03042i; 0.29464 + 0.03143i; 0.27801 + 0.03194i | 0.26139 + 0.03244i | holds; error ∝ 1/log |
| 5.5, 15.4.21 (r3) | `(−1.4 + 0.5i, 2.2)`, same `x` | 0.19437 − 0.60425i; 0.29284 − 0.62570i; 0.34207 − 0.63642i | 0.39131 − 0.64715i | holds |
| 15.4.21 route: constant term of 15.8.10 at `m = 0` (r3) | `𝐅(a, b; a + b; x) + log(1 − x)/(Γ(a)Γ(b))`, `x = 1 − 10⁻²⁰`, both pairs | 0.946292881583 + 0.077691487613i; −3.03096396776 − 0.58643258678i | `(2ψ(1) − ψ(a) − ψ(b))/(Γ(a)Γ(b))`: the same | leading term `−log(1 − z)/(Γ(a)Γ(b))` confirmed |
| 15.4.21, polynomial case (r3) | `a = −2`, `b = 0.7 + 0.3i`, `x = 1 − 10⁻¹²` | 0.06777 + 0.10844i = `F(1)/27.63`, where `F(1) = 2/((b − 2)(b − 1))` | 0, since `(Γ(−2))⁻¹ = 0` | holds; tends to 0 like 1/log |
| 5.5, 15.4.22 (r3) | `(0.3, 0.7 + 0.2i)`, `c = a + b + 0.9i`, `x = 1 − 10⁻⁸`, `1 − 10⁻¹⁶` | −0.0206167682 + 0.0792206372i; −0.0206167676614 + 0.0792206390858i | −0.0206167676614 + 0.0792206390858i | holds |
| 5.5, 15.4.22 (r3) | `(1.2 − 0.4i, −0.6)`, `c = a + b − 1.7i` | −0.000874073837739 + 0.00421879928355i | the same | holds |
| 15.4.22, `a ∈ −ℕ` (r3) | `a = −2`, `b = 0.4 + 0.3i`, `c = a + b + 0.7i` | 8.0e−17 − 5.4e−17i at `1 − 10⁻¹⁶` | 0 | holds |
| 15.4.22, `c − a ∈ −ℕ` (r3) | `a = 1.3`, `c = 0.3`, `b = −1 − 0.5i` | −3.33333333333 − 1.66666666667i | −10/3 − 5i/3 | holds |
| 15.4.22 route: reflection step (r3) | `−πΓ(c)/(sin(πs)Γ(a)Γ(b)Γ(1 + s))` with `s = c − a − b`, both generic cases | equal to 12 digits | `Γ(c)Γ(a + b − c)/(Γ(a)Γ(b))` | correct |
| 5.5, 15.4.23 (r3) | `(0.3, 0.7 + 0.2i)`, `c = a + b − 0.6 + 0.3i` | 0.413924303822 − 0.105161149555i at `1 − 10⁻¹⁶` | 0.413924303811 − 0.105161149373i | holds |
| 15.4.23, integer `c − a − b = −2` (r3) | `(1.3, 1.7 + 0.2i, 1 + 0.2i)` | 1.19158035232 − 0.185959172473i | the same | holds by the Euler route |
| 5.5, 15.4.23 (r3) | `(2.1 + 0.4i, 0.9)`, `c = a + b − 1.25 − 0.8i` | 0.482247623337 − 0.197891051608i | the same | holds |
| 15.4.23 route: excess of `F(c − a, c − b; c; ·)` (r3) | the three cases | 0.6 − 0.3i; 2; 1.25 + 0.8i | real part `> 0` | Gauss's sum applies |
| 1.2, shift relations of `E` (repair of R02) (r3) | `(0.3, 0.4, 2.9, 0.5)`; `(0.3 + 0.2i, 0.6, 3.1 + 0.1i, 0.2 + 0.4i)`; `(0.3, 0.4, 2.9, 2 + i)` | `E` = 0.560212560158; 0.452164787582 − 0.029280564531i; 0.579349623674 + 0.058158322085i, equal to the series and the continued `F/Γ(c)`; residuals of both shifts ≤ 1.2e−14 | 0 | hold on and off the disk |
| 1.2, coefficient identities (r3) | symbolic | `(a)ₛ((c − a) + (a + s))/Γ(c + 1 + s)`; `(a)ₛ(b + 1)ₛ − s(a)ₛ(b + 1)ₛ₋₁` | `(a)ₛ/Γ(c + s)`; `(a)ₛ(b)ₛ` | hold |
| 1.2 Checks 1–3 (r2, via r3) | `𝐅(0.3, 0.7; −1; 0.4)`; `2/Γ(−½)`; `F(0.3, 0.7; 1.9; 2 ∓ i)` | 0.106407100017; −0.564189583548; 1.0347657243 ∓ 0.3076156788i | README values | holds |
| shift relations at non-Euler parameters (r2, via r3) | `(−1.3, 0.4, −2.5, 0.5)`; `c = −1`, `z = −3 + 0.5i` | residuals ≤ 4e−17 | 0 | holds |
| 15.5.18 regularized (r2, via r3) | `c = 1`, `1.9`, `−0.4`; `z = 0.4`, `2 + i` | residuals ≤ 7e−26 | 0 | holds |
| 15.10.3, 15.10.7 (r2, via r3) | `z = 0.4 + 0.3i`, `2 − i`, `−3 + 0.2i`; `2 + i`, `−1 + 0.5i`, `−4 − 0.3i` | residuals ≤ 2e−16 | 0 | holds |
| 15.10.8, 15.11.7 (r2, via r3) | `n = 1, 2, 3`; generic exponents | residuals ≤ 1e−14 | 0 | holds |
| 15.4.20 in the cut plane (r2, via r3) | `c − a − b = m ≥ 1` and non-integer | second term tends to 0 with bounded phase | — | true |
| 15.4.26 at `a = −3` (r2, via r3) | symbolic `b` | 0 | 0 (`Γ(−2)` in the denominator) | holds |
| 4.3 trichotomy (r2, via r3) | terms `∼ C s^{Re(a+b−c)−1}` | exponent `< −1`; in `[−1, 0)`; `≥ 0` | — | three cases; `a, b ∉ −ℕ` needed |
| 15.8.2, 15.8.4 regularized (r2, via r3) | `c = −1`; `b − a = 1`; `a = 2`, `b = −1` | residuals ≤ 2e−16 | 0 | holds |
| 15.2.3 jump (r2, via r3) | `(0.3, 0.7, 1.9, 2)`; complex `b` | 0.8272611591i; −0.3067354394 + 0.8265250363i | the same | holds |
| 15.8.10 (r2, via r3) | `m = 0, 2, 3`; `z = 0.6`, `1.5 − 0.4i`, `0.4 + 0.5i` | residuals ≤ 3e−17 | 0 | holds |
| `w₅`, 15.10.25 (r2, via r3) | `z = 2 + i`, `−3 + 0.5i`; `2 − i` | ≤ 4e−16; 1.16 and 0.9176 as printed; 1e−17 with `−i` | 0 | as 5.3–5.4 say |
| 15.6.6–15.6.9 (r2, via r3) | Mellin–Barnes and fractional integrals at the r2 points | 0.7426529826 + 0.1232950882i; 0.8208572036 + 0.6811875151i; 1.0189297800 + 0.1339652033i | the same | holds |
| 15.8.31, 15.8.33, cubic transformation of 8.1 (r2, via r3) | r2 points inside and outside the domains | ≤ 3e−23 inside; 1.73, 1.64, 0.14, 0.37 outside | 0 | domains needed |
| 15.4.31–15.4.33 (r2, via r3) | `a = 0.2`; `a = −1.7 + 0.4i` | 0.9632623833; 1.0170943121; 0.9690200519 + 0.3148537009i | the same | holds |
| 15.9.7, 15.9.26, 15.15.1 (r2, via r3) | symbolic; `(½, ½, 1)`; three `(z, z₀)` | coefficients equal; residuals ≤ 3e−18 | — | holds |
| 15.16.4, 15.16.5 (r2, via r3) | four `z`; three parameter sets | 1 to 1e−16; 0.7428022470, 0.4785363148 with `Γ(½ + μ)` | the same | corrected form holds |
| 8.14.6, 8.17.9, 8.19.25 (r2, via r3) | `(1.5, 0.5, −0.7)`; `(0.7, 1.6, 0.8)`; `(−0.7, 1, 2)` | 2.6959775155; 0.9445669837; 1.0285159272 | the same | holds |
| existence and uniqueness (r2, via r3) | regions `R_{p,q}`; two continuations | each step reads `S_{p,q}` inside `R_{p,q}`; identity theorem in `c`, then `b` | — | consistent |

## Not verifiable

- Erdélyi et al. (1953a), Eq. 2.11(41), was not read: no open copy was found in the earlier reviews, and this change does not touch 8.1.
- Andrews–Askey–Roy, Olver, Whittaker–Watson and Dougall (1907) are cited at chapter level. None of them is cited in the changed passages.

## Source issues

- none

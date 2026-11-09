# Review of SpecialFunctionsHypergeometric (pull request #2089 at 375fe53)

**Verdict:** needs changes

Two P3 findings, both about build order inside the README. No statement was found false: every Lean statement and every README value below was recomputed. All twelve findings of the previous review are repaired.

## R01 (P3) — 15.4.21–15.4.23 have no route, and the source's route runs through Layer 5

**Location.** `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md` lines 638–641: "15.4.21–15.4.23: the limits as `z → 1−` for `c = a + b`, for `Re(c − a − b) = 0` with `c ≠ a + b`, and for `Re(c − a − b) < 0`". The *Needs:* line of 4.2 (lines 675–676) and Layer 4's Dependencies (line 705) list Layers 1–2 only.

**Claim.** 4.2 gives a route for Gauss's sum and for Dougall's sum, and none for the three limits. The route of the source uses the connection formulas of Layer 5, whose own *Needs:* is "Layers 1–4". An implementer of Layer 4 is therefore blocked on three targets by a layer that is declared to come after it, and the single *Needs:* line of 4.2 covers theorems with different needs.

**Witness.** DLMF §15.4(ii), Notes (DLMF-15.4 lines 653–655): 15.4.21 is derived from 15.8.10, and 15.4.22–15.4.23 from 15.8.4 with 5.5.3 and 5.5.1. These are 5.2 and 5.1 of this roadmap.

**Repair.** There is no cycle, because 5.1 and 5.2 use only 15.4.20 from 4.2; the README has to say so. Either move the three limits to Layer 5 (a subsection after 5.2, with the Lean docstring labels changed to match), or keep them in 4.2 and add:

- a route sentence: "15.4.21 is the leading term of 15.8.10 at `m = 0` (5.2) for `a, b ∉ {0, −1, −2, …}`, and otherwise `F` is a polynomial and both sides are `0`. 15.4.22 follows from 15.8.4 (5.1) and the reflection formula. 15.4.23 follows from the Euler transformation 15.8.1 (5.1) and 15.4.20. 5.1 and 5.2 use only 15.4.20 of this subsection.";
- a separate line "*Needs (15.4.21–15.4.23):* 5.1, 5.2; Mathlib `Complex.Gamma_mul_Gamma_one_sub`";
- in Layer 4's Dependencies: "for 15.4.21–15.4.23, 5.1–5.2".

Tested on the three statements: 15.8.10 at `m = 0` has leading term `−log(1 − z)/(Γ(a) Γ(b))`, which is 15.4.21 after multiplying by `Γ(a + b)`. In 15.8.4 the coefficient of `(1 − z)^{c−a−b}` is `−π Γ(c)/(sin(π(c − a − b)) Γ(a) Γ(b) Γ(c − a − b + 1)) = Γ(c) Γ(a + b − c)/(Γ(a) Γ(b))`, the right side of 15.4.22. The route through 15.8.1 covers integer `c − a − b < 0`, where the `sin` factor of 15.8.4 vanishes.

## R02 (P3) — 1.2 cites 1.3 for a step that 1.1 provides, which reads as a cycle

**Location.** README lines 345–346: "`S_{p,q} = E` on the region of Euler's integral, because `E` satisfies the shift relations there (proved on the disk from the series, 1.3, and extended by the identity theorem)".

**Claim.** The step needs Euler's integral as Mathlib's series for `0 < Re b < Re c`, `‖z‖ < 1`, which is the third bullet of 1.1, together with the coefficient identity `(c − a)(a)ₛ/Γ(c + 1 + s) + a (a + 1)ₛ/Γ(c + 1 + s) = (a)ₛ/Γ(c + s)`. 1.3 states the series identity for the continued function, which exists only after 1.2.

**Witness.** The *Needs:* line of 1.2 (line 370) lists 1.1 only, and that of 1.3 (line 398) lists 1.1–1.2. Read literally, 1.2 needs 1.3 and 1.3 needs 1.2.

**Repair.** Replace "from the series, 1.3," by "from the series, 1.1,". The coefficient identity was rechecked: `(a)ₛ ((c − a) + (a + s))/Γ(c + 1 + s) = (a)ₛ/Γ(c + s)`.

## Previous findings

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01, 15.5.18 at `c = 1` | README lines 470–479: the regularized relation, with the three terms `−0.08819 16794 6…`, `0`, `0.08819 16794 6…` | repaired; recomputed `−0.0881916794620`, `0`, `0.0881916794620` |
| R02, formulas with no owner | lines 140–143 and 1118–1123: the Chapter 10 and 13 formulas go to SpecialFunctionsHypergeometricPartII; 9.4 owns the Chapter 8 integrals off the disk | repaired |
| R03, two owners | lines 98–106 cite ConformalMappingPartII §4.1 and §4.6; lines 1113–1117 list SpecialFunctionsBessel 8.2 as a consumer of 1.2–1.4 | repaired; SpecialFunctionsBessel at its head consumes §§1.2–1.4 (its README lines 448–453) |
| R04, missing headlines | the limits 15.4.21–15.4.23, the circle trichotomy, 15.8.10, `w₅`, 15.10.8, 15.11.7, 15.6.7, 15.6.8–15.6.9 and 15.16.5 are stated; the docstring names the loop integrals as not statable | repaired |
| R05, routes in 8.2 | lines 963–979: 15.4.31 from the new cubic transformation of 8.1, 15.4.32 from 15.8.30 and 15.4.28, 15.4.33 as `z → −∞`; Layer 8 depends on Layer 7 | repaired |
| R06, gate | the local `namespace Complex` is gone; the gate passes | repaired |
| R07, 15.16.4 | line 1038: "on the cut plane for `c ∉ ℤ`" | repaired |
| R08, auxiliary declarations | the seven declarations are deleted | repaired |
| R09, Checks in 1.2 | lines 359–368: three Checks | repaired; values recomputed |
| R10, redundant hypotheses | `hb'`, `h₂`, `hz₀` are dropped; `U∞ = {z | z − 1 ∈ slitPlane}` | repaired |
| R11, process words | "open pull request" and "Deferred" are gone | repaired |
| R12, ZerosOfLFunctions use | lines 41–43 and 705 name Dougall's sum | repaired |

## Verified sound

**Gate, build and Lean form**

- The worker's gate at 375fe53 passes every check. The pull request changes no file outside the folder.
- Dependency check against the candidate order: `depcheck: 236 roadmaps, 2266 edges, 0 problem(s)`. ZerosOfLFunctions is line 48 of that order, this roadmap line 401; SpecialFunctionsEiLiErfIncompleteGamma is on main.
- `lake env lean` on `Suggested.lean`: 61 `sorry` warnings, the 14 `#check` lines, nothing else.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `norm_num`, `infer_instance` on each of the 61 theorems): none closes.
- The file has no section `variable`, so no binder can be lost. I compared the 65 elaborated types with the README statements. The integer and natural casts in 15.10.8 (`k ≤ ↑n − 1` in `ℤ`, `(n − k − 1)!` with `k < n`) and 15.8.10 (`(m − k − 1)!` with `k < m`) are as intended.
- All 65 Lean names appear in the README. No `set_option`, no sorry'd data, no `lemma`.

**Sources: DLMF Release 1.2.8 (2026-09-15)**

| Target | Checked at | Result |
|---|---|---|
| 1.2 | 15.6.1 (NIST page); 15.5.15, 15.5.16_5 (DLMF-15.5 lines 512, 568) | both shift relations rederived |
| 2.2 | 15.5.11, 15.5.18, 15.5.21 (lines 399, 631, 727) | as stated; the regularized 15.5.18 is the printed one divided by `Γ(c + 1)` |
| 3.1, 3.2 | 15.10.1–15.10.3, 15.10.6–15.10.7 (DLMF-15.10 lines 78, 137–141, 174, 288–292, 322) | as stated; 15.10.7 is printed with `(z − 1)^{c−a−b−1}` and no exponential |
| 3.3 | 15.10.8 with its condition (lines 358–360) | as stated |
| 4.1 | the domain sentence (DLMF-15.4 lines 87–91) | as stated |
| 4.2 | Notes of §15.4(ii) (lines 652–657) | the routes of 15.4.21–15.4.23 are those of R01 |
| 4.3 | §15.2(i), (a)–(c) (DLMF-15.2 lines 227–240) | as stated |
| 5.2 | 15.8.6–15.8.12 with regions (DLMF-15.8 lines 330–619) | as stated |
| 5.3 | 15.10.15 (DLMF-15.10 lines 657–664) | as stated, with the half-plane correction |
| 6.1, 6.3 | 15.6.1–15.6.9 and the paragraph on contours (NIST page); 5.12.3, 5.13.3 (NIST pages) | as stated; `Re a, b, c, d > 0` in 5.13.3 |
| 7.1 | 15.8.13–15.8.28 with regions (DLMF-15.8 lines 740–1255) | as stated; 15.8.16, 15.8.18, 15.8.20 have argument tending to `1` as 7.3 uses them |
| 8.1, 8.2 | 15.8.31–15.8.33 (lines 1411–1491); Notes of §15.4(iii) (DLMF-15.4 lines 897–913) | as stated |
| 9.2 | 15.14.1 (DLMF-15.14 lines 55–57); 15.15.1 (DLMF-15.15 line 44) | as stated |
| 9.3 | 15.16.4–15.16.5 (DLMF-15.16 lines 145, 184–186) | 15.16.5 is printed with `Γ(½ + ν)`; see Source issues |
| 9.4 | 8.14.5–8.14.6 (DLMF-8.14 lines 185–218); 8.17.7, 8.17.9 (DLMF-8.17 lines 298–358); 8.19.3, 8.19.25 (DLMF-8.19 lines 189–192, 1196–1198) | as stated; DLMF omits `Re b > 0` in 8.19.25 |

**Library declarations at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9)**

- `Complex.regularizedGaussHGFun` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:428`) is the `sum` of its series, so the terminating case is a polynomial at every argument, as 15.15.1 uses it. Also `ordinaryHypergeometric_div_Gamma_eq` :458 and `radius_regularizedGaussHGFunSeries_eq_top_of_left` :468.
- Tau Ceti: `one_le_radius_ordinaryHypergeometricSeries` and `analyticOnNhd_ordinaryHypergeometric` (`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:36, 56`); `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric` (`EllipticIntegral/Hypergeometric.lean:134, 142`).
- The only files at the pins that mention the Gauss series are those two Mathlib files, `Analytic/Binomial.lean` and the two Tau Ceti files. None states Gauss's sum, Chu–Vandermonde in Pochhammer form, 15.9.5–15.9.7, Barnes's lemma or a continued Gauss function.

**Cross-roadmap citations and ownership**

- ZerosOfLFunctions §1.3 (main, line 469–472): the stated strip estimate, uniform for `σ ∈ [a, b]`.
- SpecialFunctionsEiLiErfIncompleteGamma (main): Conventions (lines 165–176, 189, 228, 277) declare `TauCeti.Complex.upperIncompleteGamma`, `TauCeti.expIntegralE` and `incompleteBeta`; 1.3 (line 506) gives `Γ(a, x)` as the integral; 7.1 (line 900) gives 8.19.3; 3.4 (lines 672–674), 7.5 (line 953) and 15.2 (lines 1594–1595) own 8.14.5–8.14.6, 8.19.25 and 8.17.7, 8.17.9 on the unit disk with exactly the ranges the README quotes; lines 1668–1669 hand the rest to a Chapter 15 roadmap; 4.1 is Pincherle's theorem. The three names the citation tool reports as found nowhere are these planned names.
- ConformalMappingPartII §4.1 (line 603) and §4.6 (line 651), EllipticIntegrals (line 291) and ContourIntegration (completed) are as cited.
- Open pull requests, searched by object (continued Gauss function, Gauss's sum, Pfaff, Chu–Vandermonde, Barnes, Dougall): SpecialFunctionsBessel consumes 1.2–1.4 and hands its Gauss-function formulas to SpecialFunctionsHypergeometricPartII (its line 1594); SpecialFunctionsConfluent hands 13.4.8 and the others to a roadmap that consumes both (its line 1282). No second owner. The overlaps file lists no dropped id and no other pull request changing this folder.

**Adversarial pass** (mpmath, 25 digits)

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| 1.2 Check 1 | `𝐅(0.3, 0.7; −1; 0.4)` | 0.106407100017 | README 0.10640 71000 2 | holds |
| 1.2 Check 2 | `2/Γ(−½)` | −0.564189583548 | README −0.56418 95835 4 | holds |
| 1.2 Check 3, Layer 1 Examples | `F(0.3, 0.7; 1.9; 2 ∓ i)`, `−3` | 1.0347657243 ∓ 0.3076156788i; 0.8262198695 | README values | holds |
| shift relations in `c`, `b` | `(0.3, 0.7, 1.9, 2 + i)`; `(−1.3, 0.4, −2.5, 0.5)`; `c = −1`, `z = −3 + 0.5i` | residuals ≤ 4e−17 | 0 | holds |
| 15.5.18 regularized | `c = 1`, `1.9`, `−0.4`; `z = 0.4`, `2 + i` | residuals ≤ 7e−26 | 0 | holds |
| 15.10.3 regularized | `c = 1.9`, `z = 0.4 + 0.3i`, `2 − i`, `−3 + 0.2i` | residuals ≤ 1e−26 | 0 | holds |
| 15.10.7 on `ℂ \ (−∞, 1]` | `z = 2 + i`, `−1 + 0.5i`, `−4 − 0.3i`, `0.5 + 0.1i` | residuals ≤ 2e−16 | 0 | holds |
| 15.10.8 solves 15.10.1 | `n = 1, 2, 3`; `a = −1.5`, `b = 2.5`; complex `b` | residuals ≤ 1e−14 | 0 | holds |
| 15.11.7 | generic complex `α, β, γ` and exponents, two `z` | residuals ≤ 5e−26 | 0 | holds |
| 15.4.20 limit in the cut plane | `c − a − b = m ≥ 1` and non-integer | second term `(1 − z)^{c−a−b}`, or `(1 − z)^m log(1 − z)`, tends to `0` with bounded phase | — | true |
| 15.4.21 | `x = 1 − 10⁻⁶`, `1 − 10⁻¹²` | 0.3279 + 0.0304i; 0.2946 + 0.0314i | 0.2614 + 0.0324i | holds; logarithmic rate |
| 15.4.22 | `c = a + b + 0.9i`, `x = 1 − 10⁻¹²` | −0.0206167677 + 0.0792206391i | −0.0206167677 + 0.0792206391i | holds |
| 15.4.23 | `c = a + b − 0.6 + 0.3i`, `x = 1 − 10⁻¹²` | 0.41392428 − 0.10516111i | 0.41392430 − 0.10516115i | holds |
| 15.4.26 at `a = −3` | symbolic `b` | `1 − 3b/(b + 2) + 3b/(b + 2) − 1 = 0` | Lean right side `0` (`Γ(−2)` in the denominator) | holds |
| 4.3 trichotomy | terms `∼ C s^{Re(a+b−c)−1}`, `C ≠ 0` | exponent `< −1`; in `[−1, 0)`; `≥ 0` | — | the three cases, and the hypotheses `a, b ∉ −ℕ` are needed for (b), (c) |
| 15.8.2, 15.8.4 regularized | `c = −1`; `b − a = 1`; `a = 2`, `b = −1` | residuals ≤ 2e−16 | 0 | hold at integer parameters |
| 15.2.3 jump | `(0.3, 0.7, 1.9, x = 2)`; complex `b` | 0.8272611591i; −0.3067354394 + 0.8265250363i | same | holds for `𝐅` |
| 15.8.10 | `m = 0, 2, 3`; `z = 0.6`, `1.5 − 0.4i`, `0.4 + 0.5i` | residuals ≤ 3e−17 | 0 | holds |
| `w₅`, four expressions | `z = 2 + i`, `−3 + 0.5i`, `0.2 + 0.1i`; `z = 2 − i` | differences ≤ 4e−16; 1.99, 1.16, 1.37 | 0 | agree only on `Im z > 0`; with `−i` they agree at `2 − i` |
| 15.10.25 | `z = 2 + i`, `−3 + 0.5i`; `2 − i` printed; `2 − i` with `−i` | ≤ 2e−17; 0.9176; 1e−17 | 0 | as 5.4 says |
| 15.6.8, 15.6.9 | `(0.3, 0.7 + 0.2i, 2.1 + 0.3i)`, `d = 0.8`, `λ = 0.4 − 0.3i`, `z = 2 + i` | 1.0189297800 + 0.1339652033i | same (both integrals) | holds |
| 15.6.6 | `(0.6, 0.8, 1.7)`, `z = −2 + 1.5i`, `σ = −0.3` | 0.7426529826 + 0.1232950882i | same | holds |
| 15.6.7 | `z = 2 + 1.5i`; `c − a − b = 0.3`, `σ = −0.2`; `c − a − b = −0.5 + 0.4i`, `σ = −0.55` | 0.8208572036 + 0.6811875151i; 0.1251379625 + 1.2382798621i | same | holds |
| 15.6.7 route | termwise integration on `‖z‖ < 1` | `‖Γ(k − t)‖ ≤ Γ(k − σ)`, so `∑ Γ(k − σ)‖z‖ᵏ/k!` dominates | — | valid on the whole disk |
| 15.8.13 argument | `(z/(2 − z))² ∈ [1, ∞)` | only for `z ∈ [1, ∞)` | — | domain correct |
| 15.8.31 | `a = 0.3 + 0.1i`; `z = 0.5 + 2i`, `−3 + 0.2i`, `0.88 + 5i` | residuals ≤ 1e−26 | 0 | holds |
| 15.8.33 | `z = 0.3`, `0.9 + 0.05i`, `−0.45`; outside: `0.5 + 0.6i`, `0.1 + 0.5i` | ≤ 3e−23; 1.73, 1.64 | 0 | domain needed |
| cubic transformation of 8.1 | first-order coefficient; 120 points of the lens, `a = 0.2`, `0.4 + 0.3i`, `−1.1`; three points outside | `a(a + ½)/(3/2 − 2a)` on both sides; ≤ 3e−23; 0.14, 0.37, 0.07 | 0 | holds on the lens only |
| lens of 8.1 | 401 × 401 grid | 17185 points, one component, real part in `(−1/3, 1/9)` | — | connected; `x = −1/3` satisfies the phase condition, so `hx` is needed |
| 15.4.31 | `a = 0.2`; `a = −1.7 + 0.4i` | 0.9632623833; 0.8624115192 + 0.0551039178i | same | holds |
| 15.4.32, 15.4.33 | `a = 0.2` | 1.0170943121; 0.9690200519 + 0.3148537009i | same | hold |
| 15.9.7 coefficients | symbolic | `(−n)ₖ(n + 1)ₖ/(k!)²` | `(−1)ᵏ C(n, k) C(n + k, n)` | holds |
| 15.9.26 from 15.5.16_5 | `(a, b, c) = (½, ½, 1)` | `F(½, ½; 1) − F(−½, ½; 1)` | `½ k² F(½, 3/2; 2)` | holds |
| 15.15.1 | `(z, z₀) = (2 − 3i, 0.3 + 0.2i)`, `(−1, ½)`, `(3 + i, 0.5 + 0.1i)` | residuals ≤ 3e−18 | 0 | holds; `z ∉ [0, 1]` follows from the hypothesis |
| 15.16.4 | `z = 0.35`, `3 + 2i`, `−5`, `2 − i` | 1 to 1e−16 | 1 | holds |
| 15.16.5 | `(0, 0.3, 0)`; `(0.3, 0.2, 0.45)`; `(0.3 + 0.1i, −0.4, 0.45)`; four `z` each | 0.7428022470; 0.4785363148; 0.1142877784 − 0.0122946344i | with `Γ(½ + μ)`: the same; with `Γ(½ + ν)`: 0.4879, 0.6022, 1.0541 − 0.1134i | the corrected form holds; also at `z → 0` by Gauss's sum |
| 8.14.6 | `(1.5, 0.5, −0.7)`; complex `(a, b, s)` with `Re s = −0.8` | 2.6959775155; agreement to 1e−8 | same | holds |
| 8.17.9 | `(0.7, 1.6, 0.8)` | 0.9445669837 | 0.9445669837 | holds |
| 8.19.25 | `(−0.7, 1, 2)`; complex with `Re a = −0.8` | 1.0285159272; agreement to 1e−9 | same | holds |
| existence regions `R_{p,q}` | induction step | `S_{p+1,q}` reads `S_{p,q}` at `(b + 1, c)` and `(b + 1, c + 1)`, both in `R_{p,q}` | — | regions consistent, and they cover |
| uniqueness | two continuations | identity theorem in `c` on `Re c > Re b`, then in `b` on `Re b > 0` | — | the definition determines `𝐅` |

## Not verifiable

- Erdélyi et al. (1953a), Eq. 2.11(41), was not read; I found no open copy. The transformation stated in 8.1 was instead verified directly (first-order coefficients, 120 points, and its consequence 15.4.31).
- Andrews–Askey–Roy, Olver, Whittaker–Watson and Dougall (1907) are cited at chapter level and were not read; no sampled locator depends on them.
- DLMF §15.6, 5.12 and 5.13 were read from the NIST pages, not from the cache.

## Source issues

- **Misprint** in DLMF at 15.16.5 (§15.16, online, Release 1.2.8): the source says the last Gamma factor of the denominator on the right is at `½ + ν`; it should be at `½ + μ`; affects a stated result.
- **Error** in DLMF at §15.10(ii), 15.10.15–15.10.16 and 15.10.25 (online, Release 1.2.8): the source states the forms carrying `e^{(·)πi}` for principal branches with no region; it should restrict them to `Im z > 0`, with `i` replaced by `−i` for `Im z < 0`; affects a stated result.

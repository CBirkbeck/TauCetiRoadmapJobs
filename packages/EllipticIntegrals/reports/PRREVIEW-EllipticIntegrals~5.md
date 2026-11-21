# Review of EllipticIntegrals (pull request #2556 at 08023cc)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the eight milestones was recomputed or opened in the pinned library, the 42 items of the README on main are all present under their ids, and the eleven statements of `Suggested.lean` elaborate and are none of them closed by one tactic. There are four small corrections (three DLMF numbers that point at the wrong equation, one printed digit, stale section comments in the Lean file, and changes the description leaves out) and four format notes, none blocking. Three facts are left for the human reviewers.

## C01 — Three DLMF numbers point at an equation that does not contain the statement

A reader who opens the cited equation finds a different formula. The statements themselves are right (each is proved in the pinned library and was recomputed).

- In §1.6 (line 207) the heading cites DLMF 19.6.11 and 19.6.13. The second bullet, Π(φ, 0, α²) = arctan(√(1 − α²) tan φ)/√(1 − α²), is in neither: 19.6.11 has only Π(0, α², k) = 0, Π(φ, 0, 0) = φ and Π(φ, 1, 0) = tan φ. The source is 19.6.12, which gives the value as R_C(c − 1, c − α²) with c = csc²φ; with 19.2.18 that is the arctan form. Cite "19.6.12 with 19.2.18" for that bullet.
- In §2.2 (line 268) "DLMF 19.4.1" covers dK/dk only; dE/dk = (E − K)/k is 19.4.2. Cite both.
- In §6.6 (line 716) the entry E(φ, k) = s·R_F − (k²/3)s³·R_D is DLMF 19.25.9. The cited 19.25.7 is the R_G form of E(φ, k), which the roadmap does not state. Replace 19.25.7 by 19.25.9.

## C02 — The last digit of the third Gauss–Brent–Salamin approximation in §4.7 is wrong

The first Check of §4.7 (line 523) prints the n = 3 value as 3.141592653589794. Computed to 40 digits (a₄ and the terms up to c₃) it is 3.14159265358979323827…, so sixteen figures give 3.141592653589793; the printed 4 is a double-precision rounding artefact. The first two values, 3.140579250… and 3.141592646…, are right. Print 3.14159265358979… or the digit 3.

## C03 — The section comments and one docstring sentence of `Suggested.lean` describe an earlier README

The Lean file groups its statements under "Layer 1" to "Layer 5" (lines 37, 44, 68, 87, 110), while the README has Milestones 1 to 8 and the statements belong to Milestones 3, 4, 6, 7 and 8; a reader cannot match "Layer 2" to §§4.6–4.7. The module docstring (lines 23–27) says the theorems the pinned Tau Ceti proves "are supplier contracts of the README", but at this head the supplier contracts list only what the roadmap consumes without owning, and the proved items are named in the milestones. Would the author retitle the five comments by milestone (`## Milestone 3: …`, and so on) and write "are named in the README's milestones" in the docstring.

## C04 — The description leaves out four changes a reader of the README on main would look for

The description's lists are accurate as far as they go (42 items, the weakened hypotheses, the eleven Lean statements were each checked). It does not say that:

- the sections "Scope and completion criterion" (its seven-point completion list) and "Beyond this roadmap" are gone as sections, their content folded into the overview and into "Outside this roadmap" in Scope and ownership, where the nome and the modular function λ are now assigned to SpecialFunctionsTheta;
- the lattice roadmap GrothendieckPeriodConjecture, named on main beside ModularCurvesPartII, is no longer cited;
- the Carlson functions are now in the namespace `Complex` (main said `TauCeti.Complex`), following the library;
- Convention 4 now cites DLMF 19.16.2_5 for R_G where main cited 19.16.3 (which DLMF has moved); this is a locator correction of the same kind as the one listed for §6.4.

One sentence each under "What changes in form" and "Statements whose content changed" would do.

## N01 — The *Needs:* line of §4.6 still omits what the bound "1 − tₙ is at most a constant times kₙ²" uses

The listed `TauCeti.Real.pi_div_two_le_legendreK` and `TauCeti.Real.legendreEc_le_pi_div_two` give only tₙ ≤ 1. The bound itself (E ≥ (π/2)√(1 − k²) and K ≤ (π/2)/√(1 − k²), so tₙ ≥ 1 − kₙ²) comes from `TauCeti.Real.le_legendreE_integrand` and `TauCeti.Real.legendreK_le_pi_div_two_div_sqrt` of §1.1 (lines 493–497).

## N02 — Line 58 of `TauCetiRoadmap/EllipticIntegrals/Suggested.lean` is 106 characters long; rewrapping the docstring brings it within 100.

## N03 — The docstring of `realPeriod_eq_of_three_real_roots` names no source, while its one-root companion cites Byrd–Friedman 239.00; §8.2 cites formula 236.00 for the three-root integral and the docstring could carry it.

## N04 — Gauss's theorem in §4.4 (line 444) carries no locator; DLMF 19.8.5 states it for −∞ < k² < 1.

## Previous findings

The previous review, of `81b06b4`, had no finding and three format notes.

- N01 (the *Needs:* line of the AGM series for E, now §4.6): not repaired; the line is unchanged in substance (N01 above).
- N02 (line 58 of the Lean file): not repaired (N02 above).
- N03 (docstring of the three-root real period): not repaired; "**The real period with three real roots**. If `Ψ₂Sq(x) = …`" still names no source (N03 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.1 Integrands and positivity | k = 0.6; α² = −3 and 0.5 | K(0.6) = 1.750753803, K(√0.6) = 1.94956775; Π integrand in [0.3125, 1] ⊂ [0.25, 1.25] and [1, 2.5] ⊂ [1, 2.5] | holds; library hypotheses match | none |
| 1.5 Degenerate moduli | φ = π/4, k = 1 | ∫ sec = 0.881373587 = artanh(sin π/4) = log(1 + √2); E(π/4, 1) = sin = 0.7071; DLMF 19.6.1, 19.6.8, 19.6.9 agree | holds | none |
| 1.6 Third-kind reductions | α² = −3, 0.5 at φ = 1.2; k = 0.7 at φ = 0.7, 2, 4.5, −3.3 | 0.6894004893 and 1.510512122 both sides; 0.7906735, 3.7472252, 7.4034671, −5.4757035 both sides | holds for every φ | C01 |
| 1.7 Monotonicity in k | library signatures opened | `strictAntiOn_legendreEc` on `Ici 0`, `strictMonoOn_legendreK` on `Ico 0 1`; E(0.6) = 1.418 < π/2 < K(0.6) = 1.751 | holds as stated | none |
| 2.2, 2.3 Derivatives, ODEs | k = 0.6, φ = 1.1 | K′ = 0.7750025015 against difference quotient 0.7750025018; E′ = −0.5544506808 both; ODE residuals 3.6e-6, −4.7e-7 (step 1e-3) | holds | C01 |
| 2.5 Analyticity | library opened | `analyticOnNhd_legendreK`, `analyticOnNhd_legendreEc` on `Ioo (-1) 1`; partial sums 1.712167996, 1.740795759 → 1.750753803 | holds | none |
| 3.1 Logarithmic singularity (headline) | k′ = 10⁻¹, 10⁻², 10⁻³ | K − log(4/k′) = 6.7579e-3, 1.2479e-4, 1.8235e-6; with log(2/k′): 0.693149; J(0.9) = 1.635799433 both forms | tends to 0 | none |
| 3.2 Legendre's relation | k = 0.6 | 1.418083394·1.995302778 + 1.276349943·1.750753803 − 1.750753803·1.995302778 = 1.570796327 = π/2; DLMF 19.7.1 | holds | none |
| 4.4 Gauss's theorem | k = 0.6 | M(1, 0.8) = 0.8972114321; π/(2M) = 1.750753803 = K(0.6); with M(1, 0.6): 1.995302778 = K(0.8) | holds | N04 |
| 4.6 AGM series for E (headline) | k = 0.6, 0.99, −0.5, 0.999 | 1.418083394, 1.028475809, 1.467462209, 1.00399441, each equal to the quadrature of E; weights 2ⁿ give 1.085412986 | holds; route identities rederived by hand | N01 |
| 4.7 Gauss–Brent–Salamin (headline) | 40-digit AGM from (1, 1/√2) | 3.14057925052…, 3.14159264621…, 3.14159265358979323827…; wrong weights 3.000251112; Salamin Theorem 1b, p. 567 read | holds | C02 |
| 5.2 E(1/√2) | Legendre at k = k′ | K/2 + π/(4K) = 1.350643881 = quadrature of E(1/√2); K = Γ(¼)²/(4√π) = 1.854074677 | holds | none |
| 6.1 Check at −2 | x = −2 ± iε, ε = 10⁻³, 10⁻⁴; by hand | 0.906899 ∓ 0.661753 i at 10⁻⁴; closed form π/(2√3) = 0.906899682, artanh(√(2/3))/√3 = 0.661768021 | holds | none |
| 6.2 Symmetry and homogeneity | λ = 2.5, complex arguments | R_F: 0.4429505 − 0.0211591 i both; R_G: 2.2392578 + 0.0366960 i both; R_J: 0.1065039 − 0.1202527 i both | holds | none |
| 6.3 Diagonal values | x = 2 + 3i | R_F = 0.4643255 − 0.2484994 i = x^(−½); R_J = 0.0140887 − 0.1453827 i = x^(−3/2); R_G = 1.6741492 + 0.8959775 i = x^(½) | holds | none |
| 6.5 Duplication theorem (headline) | 60 random complex triples, 20 with x = 0; x = y = e^(3πi/4), z = 1 | relative error ≤ 1.9e-15 (x ≠ 0), 6.7e-12 (x = 0); 0.8012606 − 0.8091666 i both sides; with √(xy): 1.2195926 − 0.5959131 i | holds on the whole domain | none |
| 6.6 Dictionary, E = 2R_G (headline) | k = 0.6, φ = 0.9, −1.3, π/2; α² = −1.7; k = 1.5, φ = 0.5 | F 0.941701578, E 0.861404596, Π 0.707804037 both sides; 2R_G(0, 0.64, 1) = 1.41808339 = E(0.6); R_G(0, 1, 1) = π/4 | holds | C01 |
| 7.1 Amplitude | k = 0.6, u = 0.37, n = 3 | am(u + 6K) = 9.79182737 = am(u) + 3π; am(K) = 1.57079633; library definition opened (junk value `id`) | holds | none |
| 7.2 Identities | k = 0.6, u = K/2 | sn = 0.745355992 = 1/√1.8, cn = 0.666666667, dn = 0.894427191 = √0.8; sn² + cn² = 1, dn² + k²sn² = 1 | holds | none |
| 7.5 Addition theorem (headline) | k = 0.7, (u, v) = (0.3, 1.9), (−2.2, 5.1); k² = ½, u = 0.4, v = K | sn 0.967513414, 0.685998114; cn −0.252819688; dn 0.73574433, both sides; 0.959219637 against wrong sign 0.827059375 | holds | none |
| 7.7 Pendulum (headline) | ω = 1.7, θ₀ = 2; t = 0, 0.4, 1.3, 2.9 | θ″ = −2.62787, −2.82290, 0.59043, 2.85056, equal to −ω² sin θ to 6 figures; θ(0) = 2, θ′(0) = 0; period 4K/ω, antiperiod 2K/ω | holds | none |
| 8.1 Ellipse, both cases | (a, b) = (2, 1), (1, 2), (2, −1), (3, 3) | 9.68844822 = 8E(√3/2) for the first three; wrong formula at (1, 2) gives 6.28318531; circle 18.8495559 | holds | none |
| 8.3 Cubic integral, one real root | (e₁, a, b) = (2, −1, 3), (−4, 5, −0.2), (0, 3, 1) | 0.793092711, 1.961904481, 1.817575199, quadrature and K(k)/√A equal; k and k′ exchanged: 1.16522611 | holds, also for e₁ < a | none |
| 8.2, 8.4 Real period (headlines) | e = (1, 0, −1), (3, 1, −2), (7.3, 7.1, −40); x³ + 1 | both integrals 1.31102878, 0.871873203, 0.599429081; periods 5.24411511, 3.48749281, 4.20654632 by K, AGM and quadrature | holds | N03 |

- Source locators checked against the text: 38 (34 DLMF equations of Chapters 19 and 22 and three tables, read in the texts fetched from NIST; Salamin Theorem 1b; Carlson 1995 (8)–(11); Cremona §3.7, lines 1679–1721 of its text). Three do not contain the statement cited (C01).
- Library declarations opened at the pin: the 279 Tau Ceti declarations the README names all exist; the signature of each was read against its item, hypotheses included. Mathlib names checked: 40, all present (`NNReal.dist_agmSequences_fst_snd` at `Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` line 145, `ODE_solution_unique_univ` at `Analysis/ODE/ExistUnique.lean` line 341). None of the eleven remaining targets is in the pinned Tau Ceti or Mathlib.
- README on main against this head, item by item: Milestones 1–8, 42 items, all present with their statements; none removed, renumbered or reduced to names.
- Cross-roadmap citations resolved on main: EllipticCurves Layer 7, ModularCurvesPartII §1.1 and §1.4a, ConformalMapping Layer 6, DiophantineApproximationAndTranscendence Layer 3, SpecialFunctionsTheta §§6.3, 6.4, 6.6, SpecialFunctionsHypergeometric. The ids other roadmaps cite here (Milestones 1, 3, 8 and 8.2–8.3) are kept.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`. The automatic checks all passed; nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `sorry` warnings and nothing else. One-tactic probe on a copy (`simp`; `rfl`, `norm_num`, `linarith`, `positivity`): no statement closes. The elaborated types were compared with the README statements; no binder is lost.
- Pull request text read against this head: the counts and lists hold; four omissions (C04).

Overlap check: read SpecialFunctionsTheta, SpecialFunctionsHypergeometric and SpecialFunctionsAppell (main) and searched every roadmap, open and on main, for the lemniscate constant, the Carlson integrals, the Jacobi functions, the AGM integral, the pendulum and the Gauss–Brent–Salamin formula; SpecialFunctionsLegendre, SpecialFunctionsHeun, SpecialFunctionsGamma and SpecialFunctionsStruve (open) consume Tau Ceti's declarations or do not mention them; nothing shared.

Source independence: 38 locators and 5 further passages (the notes to DLMF §19.26(iii), Carlson 1995 §2, Salamin §6, Cremona §3.7, two docstrings) compared with 4 sources, none shared; largest share DLMF, 38 of 44 locators; contents compared with DLMF Chapter 19: independent (Milestone 1 draws on §§19.2, 19.6, 19.7, Milestone 3 on §19.12 and §19.7 ahead of §19.8, Milestone 6 on §§19.16, 19.26, 19.25; the order is forced by Milestone 3 needing 2, §4.7 needing 3, and 5 needing 3 and 4). Carlson 1977 and Byrd–Friedman could not be read.

Research link: Milestone 8 evaluates the real period of the Birch–Swinnerton-Dyer quotient by the AGM, the method of Cremona 1997, §3.7 for period lattices; the duplication theorem of Milestone 6 is the step of Carlson's 1995 algorithms; §4.7 is Salamin 1976, Theorem 1b. Rests on the README and those three sources, read.

## Not verifiable

- Carlson 1977, Chapter 9 (the locator of §6.1): a book; the project's source cache has no copy and none was sought elsewhere.
- Byrd and Friedman, formulas 236.00 and 239.00 (§§8.2, 8.3 and one docstring): no copy in the source cache; the integrals were confirmed by quadrature (table above).
- DLMF 22.19.1–22.19.2 (§7.7): read on NIST's page through a page summary, not line by line; the solution formula and the period 4K agree with the README.
- The statement in Provenance that the author of `lean-codes` agreed to its use (Lean Zulip), and the table of counterparts in `lean-codes`: not opened in this review.

## Source issues

- none

## For the human reviewers

- Scope: 38 of the 44 locators are to the NIST handbook (DLMF Chapters 19 and 22); the refereed sources are Salamin 1976, Carlson 1995 and Cremona 1997 (§4.7, §6.5, §8.4 of `TauCetiRoadmap/EllipticIntegrals/README.md`).
- `TauCetiRoadmap/EllipticIntegrals/STATUS.md` (generated, at Tau Ceti commit d2083f0, 2026-11-08) reports seven of eight milestones proved; the pinned commit (2fd255d, 2026-11-04) lacks the eleven statements of `Suggested.lean`, which this review treated as targets.
- Licence: Provenance (README lines 1051–1071) directs implementers to port from `lean-codes` (Apache-2.0 per the README) and says its author agreed on Zulip; an earlier review reported `carlsonRF_duplication` there under the same name. Neither was opened here.

# Review of SpecialFunctionsHypergeometric (pull request #2552 at 6d4b80b)

**Verdict:** accepted

**Summary.** Accepted: the revision changes no statement, and every sampled identity was recomputed and agrees with the README, including its corrections to DLMF 15.16.5 and 15.10.25. The new locators into Whittaker–Watson and DLMF were read at the text and are right; the locators into the other six books could not be read legally and are listed as not verifiable. There are two small corrections (three renamed heading anchors that SpecialFunctionsHeun links to, and three sentences of the description) and one format note, none blocking. The human reviewers have three facts to weigh, the main one being that six of the seven newly cited books were not checked.

## Previous findings

The previous review (of the pull request that added the roadmap) ended with no open finding. Its two earlier repairs survive this rewrite:

- R01 — still repaired: the scope list now gives Layer 4 as "the elementary closed forms, the sums of Gauss, Chu–Vandermonde and Dougall, and the circle of convergence (4.1–4.3)" and Layer 5 as including "the limits at `z = 1` (5.1–5.5)"; 15.4.21–15.4.23 appear in 5.5 only.
- R02 — still repaired: 5.5 reads "The routes of 15.4.21 and 15.4.22 are those of DLMF's notes to §15.4(ii). For 15.4.23 the Euler transformation replaces the note's 15.8.4".

## C01 — Three renamed headings are link targets of SpecialFunctionsHeun, and the README gives no mapping from the old anchors

A reader who follows SpecialFunctionsHeun's supplier contract for this roadmap lands at the top of the README instead of the section once both are merged. The open SpecialFunctionsHeun pull request links, in its section "From SpecialFunctionsHypergeometric" (lines 248, 255 and 262 of its README), to `#34-riemanns-equation`, `#32-fundamental-solutions` and `#53-kummers-24-solutions`. This revision retitles those sections "3.4 The Papperitz equation, Möbius maps and exponent shifts", "3.2 Solution pairs at the three singular points" and "5.3 Kummer's solutions in six groups of four", so the three anchors no longer exist. The section numbers are unchanged, so Heun's prose citations ("SpecialFunctionsHypergeometric 3.4") stay valid; only the links break. The anchors that roadmaps on main link to (`#conventions`, `#12-definition-uniqueness-and-existence`, `#42-unit-argument`) are all kept.

The smallest change is one of: keep the three old headings, as was done for 4.2; or add one sentence to the README giving the former titles of 3.2, 3.4 and 5.3 beside the new ones; or update the three links in the SpecialFunctionsHeun pull request and say so in this description.

## C02 — Three sentences of the description do not match the head

"No changed anchor is linked from main or from any open roadmap pull request" is contradicted by C01: three changed anchors are linked from the open SpecialFunctionsHeun pull request. The text that would be right: "The changed anchors of 3.2, 3.4 and 5.3 are linked from the open SpecialFunctionsHeun pull request", with what is done about it.

"The heading of 4.2 is kept, since the open SpecialFunctionsBessel pull request links to its anchor": SpecialFunctionsBessel is on main and links to `#42-unit-argument` and `#12-definition-uniqueness-and-existence` from there; "since SpecialFunctionsBessel, on main, links to its anchor" would be right.

"The cubic transformations of 8.1 (other than 15.4.32), Elliott's identity and 15.16.1–15.16.4, and 15.15.1 keep DLMF alone": 15.4.32 is a value in 8.2, not a transformation of 8.1, and the list is not complete. At the head 7.2 (15.8.29–15.8.30), 15.8.6–15.8.7 and 15.8.12 in 5.2, 15.2.3 in 5.1, 15.4.27 in 7.3 and 15.4.31, 15.4.33–15.4.34 in 8.2 also carry DLMF alone. Either complete the list or say "among others".

## N01 — The section comments of `Suggested.lean` carry the layer titles this revision replaces

The Lean file's section comments still read "Layer 1: definition and analytic properties", "Layer 5: linear transformations and connection formulas" and so on, while the README's layers are now "the principal branch by Euler's integral", "Pfaff–Euler identities and the connection problem", etc. The description says the Lean file is deliberately byte-identical, so this is offered only: the comments would match the README if they were retitled when the file is next touched.

## Verified sound

Adversarial pass. Values computed for this review in double precision by an independent implementation (Taylor continuation of the hypergeometric equation along the segment from `0`, Lanczos `Γ`, tanh–sinh quadrature); no value is carried from an earlier report.

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| 1.1 Euler's integral equals `𝐅` | `(0.3, 0.7, 1.9)`; `z = 2 + i`, `−3`, `0.4` | 1.07590193990 + 0.31984467382i; 0.85906552518; 1.09473101516 | continued `F/Γ(c)`: same to 1e−15 | holds on and off the disk |
| 1.2 Checks | `𝐅(0.3, 0.7; −1; 0.4)`; `𝐅(1, −½; −½; ½)`; `𝐅(0.3, 0.7; −2; 0.4)` | 0.10640710002; −0.56418958355; 0.14562150178 | README: 0.10640 71000 2; −0.56418 95835 4; 0.14562 15017 79 | agree; limit `c → −2` gives 0.1456216876 at `10⁻⁷` |
| 1.2 shift relations in `c` and `b` | `(0.3, 0.4, 2.9, 2 + i)`; `(−1.3, 0.4, −2.5, 0.5)`; `(0.3 + 0.2i, 0.6, −1, −3 + 0.5i)` | residuals ≤ 1.4e−15 | 0 | hold, also at `c ∈ −ℕ` |
| 1.4 conjugation, values off the disk | `F(0.3, 0.7; 1.9; 2 ± i)`, `F(…; −3)` | 1.03476572428 ± 0.30761567880i; 0.82621986949 | README Examples: same digits | holds; principal branch |
| 2.1 derivative, regularized | `(0.3, 0.7, 1.9, 2 + i)` | `𝐅′` = −0.04320839710 + 0.11991741583i | `ab 𝐅(a + 1, b + 1; c + 1)`: same | holds |
| 2.2 15.5.11 regularized; 15.5.18 at `c = 1` | `(0.3, 0.7, 1.9, 2 + i)`; `(0.3, 0.7, 0.4)` | residual 7.9e−16; terms −0.08819167946, 0, 0.08819167946 | 0; README: ∓0.08819 16794 6 | holds; first term is not 0 at `c = 1` |
| 2.2 degenerate pair at `a = b = c = 1` | `z = 0.3` | `F(1,1;1)` = 1.428571, `F(2,1;1)` = 2.040816, `F(1,1;2)` = 1.188916 | `1/(1 − z)`, `1/(1 − z)²`, `−log(1 − z)/z` | as the README says |
| 3.1–3.2 Wronskian at `0`, plain and regularized | `(0.3, 0.7, 1.9)`; `z = 0.4`; `z = −1 + 0.5i` | −5.401487816956; −0.02546529142 − 0.06950155035i | `(1 − c) z^{−c}(1 − z)^{c−a−b−1}`; `(sin πc/π) z^{−c}(1 − z)^{c−a−b−1}`: same | Abel's form confirmed |
| 3.2 15.10.7 on `ℂ \ (−∞, 1]` | `(0.3, 0.7 + 0.2i, 1.9)`; `z = 2 + i`, `−3 + 0.2i`, `−4 − 0.3i` | residuals ≤ 4.2e−17 | 0 | holds with printed powers |
| 4.2 Gauss's sum and the limit in the cut plane | `F(½, ½; 2; 1)`; `(0.3, 0.7 + 0.2i, 2.4)` at `1 − 10⁻⁹`, `1 − 10⁻⁷ − 10⁻⁷i` | 1.27323954474; 1.1521205135 + 0.0616751199i; 1.1521205148 + 0.0616750404i | `4/π`; 1.1521205139 + 0.0616751203i | holds, complex approach too |
| 4.2 Chu–Vandermonde | `(n, b, c) = (3, 2, 5)`; `(3, 0.3 + 0.2i, −3.5)` | 0.285714285714; 1.4336 + 0.342552381i | `2/7`; `(c − b)₃/(c)₃`: same | holds for negative non-integer `c` |
| 4.2 Dougall | `(0.3, 0.45, 1.8, 2.1)`; `(0.3 + 0.4i, −1.45, 1.8, 2.6 − 0.3i)` | 20.0168951154; 3.67148746040 − 3.07438487323i | 20.0168951154; 3.67148746040 − 3.07438487323i | holds |
| 5.1 Euler, Pfaff, 15.8.4, 15.8.2 | `(0.3, 0.7 + 0.2i, 1.9)`; `z = 2 ± i`, `−3 + 0.5i`, `0.4 + 0.3i` | residuals ≤ 1.6e−15 | 0 | hold with `(−z)^{−a}` on both half-planes |
| 5.1 15.8.4 at degenerate parameters | `c = −1`; `(a, b) = (2, −1)`; `c − a − b = 0.4` with `c = 2` | residuals ≤ 4.5e−16 | 0 | regularized form holds for all parameters |
| 5.1 jump 15.2.3 | `(0.3, 0.7, 1.9, 2)`, `ε = 10⁻⁷` | 0.8272611241i | 0.8272611591i | holds; README value 0.82726 11591 4 i |
| 5.2 15.8.10 in the Lean form | `(0.3, 0.7 + 0.2i)`; `m = 0, 2, 3`; `z = 0.6`, `1.5 − 0.4i` | e.g. `m = 0`: 1.23402550900 + 0.15813823259i | same to 1e−15 in all six cases | holds, signs and finite sum right |
| 5.3 four forms of `w₅` | same parameters; `z = 2 + i`; `z = 2 − i` | differences ≤ 1.6e−16; first minus third = 1.1627 | 0; README: 1.16… | agree on `Im z > 0` only |
| 5.4 15.10.25 | `z = 2 + i`, `−3 + 0.5i`; `z = 2 − i` | 4.6e−16, 8.5e−16; 0.9176 as printed, 1.4e−15 with `−i` | 0; README: 0.918… | as the README states |
| 6.1 15.6.8 and 15.6.9 | `(0.3, 0.7 + 0.2i, 2.3)`, `d = 0.9`, `λ = 0.55 − 0.3i`; `z = 0.4 + 0.3i`, `2 + i`, `−3` | at `2 + i`: 0.84767560730 + 0.21252256346i for both integrals | `𝐅` = 0.84767560730 + 0.21252256346i | hold for complex `λ` |
| 6.1 15.6.2_5 Example | `(1, 1, 2, −1)` | `∫₀^∞ dt/((t + 1)(2t + 1))` = `log 2` by partial fractions | `F(1, 1; 2; −1)` = `log 2` | holds |
| 6.3 15.6.6 Check | `(0.6, 0.8, 1.7, −2)`, `σ = −0.3` | 0.778121842003 | 0.778121842003 | holds |
| 7.1 15.8.13 | `(0.7, ½, 0.6)`; `(0.3 + 0.2i, 1.1, 2 + i)`; `(0.3, 0.8, −5 + 0.1i)` | 1.36308074685; 0.76435948909 + 0.35581018554i; 0.72102672088 + 0.00255984166i | same to 1e−15 | holds on the cut plane |
| 7.3 15.4.26, 15.4.28, 15.4.30 | `(0.6, 0.25)`; `(0.6, 1.3)`; `(0.6 + 0.2i, 1.3)` | 0.919458040749; 1.445117860294; 1.14770513386 − 0.02192854828i | same | hold; README values match |
| 7.3 poles in the Lean right sides | 15.4.26 at `a = −1`; 15.4.28 at `a = −1` | `F(−1, b; −b; −1) = 1 − 1 = 0`; left side is a polynomial value | `1/Γ(0) = 0` in Lean and in DLMF | consistent |
| 8.1 cubic transformation behind 15.4.31 | `a = 0.2`; `x = −0.2`, `0.05 + 0.02i`, `−0.3` | 0.97674183862; 1.00649602913 + 0.00267494685i; 0.96650345193 | same to 7e−15 | holds on the lens |
| 8.1 15.8.31, 15.8.33 | `a = 0.2`, `z = 0.3`, `−2 + i`, `0.5 + 2i`; `z = 0.3`, `0.2 + 0.3i`, `−0.2 − 0.25i` | residuals ≤ 1e−15 | 0 | hold; at `0.2 + 0.5i`, outside the lens, 15.8.33 fails by 1.68 |
| 8.2 15.4.31–15.4.34 | `a = 0.2`; `a = −1.7 + 0.4i` for 15.4.33–34 | 0.96326238329; 1.01709431207; 0.96902005187 + 0.31485370090i; 0.93984842544 + 0.30537526490i | same; 15.4.32 also `(3/4)^{0.4} F(0.4, 7/15; 14/15; ½)` = 1.01709431207 | hold |
| 9.1 Chebyshev, Legendre | `n = 0, 1, 2` symbolic | `T₂`: `1 − 8y + 8y²` at `y = (1 − x)/2`; `U₁`: `2(1 − 2y)`; `P₁`: `1 − 2y` | `2x² − 1`; `2x`; `x` | hold with no extra sign |
| 9.1 15.9.26 | `k² = ½` | `(π/4) F(½, 3/2; 2; ½)` = 1.00686159251 | `(K − E)/k²` from the two Tau Ceti series = 1.00686159251 | holds |
| 9.3 15.16.4 | `(0.3, 0.45, 0.8)`; `z = 0.35`, `3 + 2i`, `−5`, `2 − i` | 1 to 2e−15 | 1 | holds off the disk |
| 9.3 15.16.5 | `(λ, μ, ν) = (0.3, 0.2, 0.45)`, `(0, 0.3, 0)`, `(0, 0, 0)`; `z = 0.3`, `0.5 + 0.8i` | 0.47853631477; 0.74280224698; 0.63661977237 | with `Γ(½ + μ)`: same; with `Γ(½ + ν)`: 0.60222465228, 0.48790689073, 0.63661977237 | README's correction is right |
| C01 anchors | SpecialFunctionsHeun, its three links | `#34-riemanns-equation`, `#32-fundamental-solutions`, `#53-kummers-24-solutions` | headings of 3.4, 3.2, 5.3 at this head are retitled | three links break; numbers unchanged |
| C02 citation counts | names counted in the README | Andrews–Askey–Roy 32, Temme 30, Lebedev 23, Duverney 19, "Olver Ch. 5" 18, Whittaker–Watson 18, Beals–Wong 13 | description: 32, 30, 23, 19, 18, 18, 13 | counts right |

- Source locators checked against the text: all 17 Whittaker–Watson locators (section and page; read in the third edition, lines 1933–2030, 14761–14970 and 19690–20465 of the archive.org text), and for DLMF the formulas 15.4.20–15.4.34 with their notes, 15.16.4–15.16.5 with the note, the three convergence statements of §15.2(i), the remark on 15.2.5 and 15.2.6, and the equation ranges of §§15.2, 15.5, 15.8–15.11, 15.14 and 15.15.
- Library declarations opened at the pin: 21 by file and line (the 14 pinned by `#check` also elaborate), among them `Complex.Gamma_mul_Gamma_one_sub` (`Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:398`), `Complex.Gamma_mul_Gamma_add_half` (`:580`), `Complex.Gamma_add_nat_div_Gamma_eq` (`:481`), `mellinInv_mellin_eq` (`Mathlib/Analysis/MellinInversion.lean:92`), `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Mathlib/Analysis/Analytic/Uniqueness.lean:224`), `Complex.regularizedGaussHGFun_symm` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:440`), and Tau Ceti's two series theorems (`TauCeti/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:36`, `:56`).
- Cross-roadmap citations resolved: ZerosOfLFunctions 1.3 (on main, heading present), SpecialFunctionsEiLiErfIncompleteGamma Conventions, 1.3, 3.4, 4.1, 7.1, 7.5 and 15.2 (on main, headings present; its three names for `Γ(a, z)`, `E_p` and `B_x` are in its Conventions), ConformalMappingPartII, EllipticIntegrals, AsymptoticExpansions. Inbound: SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsBessel and SpecialFunctionsAppell on main and the open SpecialFunctionsLegendre, SpecialFunctionsGamma, SpecialFunctionsStruve and SpecialFunctionsHeun cite sections by number, all still present; only Heun's three anchors break (C01).
- The change: only `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md` (335 insertions, 241 deletions); every removed line was read, and the removals are locator-free sentences replaced by the same sentence with locators, the retitled headings, the removed formula-range table and the reworded scope. No hypothesis or conclusion changed; `Suggested.lean` is unchanged.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 61 `sorry` warnings and the output of the 14 `#check` lines, nothing else. The file has one `import Mathlib` and one Tau Ceti module, no `set_option`, no sorried definition; the four definitions have real bodies. The elaborated signatures show no lost binder. The file is the one already on main, where the one-tactic probe was run; no declaration was added.
- Headline theorems: each layer's headlines named in the README are stated in the Lean file; the loop integrals of 6.2 are named in the module docstring as not statable (no integral of a function continued along its path at the pinned Tau Ceti).
- Arrangement against DLMF Chapter 15, by number: Layer 1 ↔ §15.2 with 15.6.1; Layer 2 ↔ §15.5; Layer 3 ↔ §15.10(i), §15.11; Layer 4 ↔ part of §15.4(i)–(ii), §15.2(i); Layer 5 ↔ §15.8(i)–(ii), §15.10(ii), 15.2.3, 15.4.21–23; Layer 6 ↔ §15.6; Layer 7 ↔ §15.8(iii)–(iv), 15.4.26–30; Layer 8 ↔ §15.8(v), 15.4.31–34; Layer 9 ↔ parts of §§15.9, 15.14–15.16 and three formulas of Chapter 8. DLMF's order is 15.2, 15.4, 15.5, 15.6, 15.8, 15.9, 15.10, 15.11; the roadmap's is forced by its *Needs:* lines (the equation before the connection formulas, Gauss's sum before them, the integrals after).

Overlap check: read SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsGamma, SpecialFunctionsParabolicCylinder and SpecialFunctionsHeun (open), SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsBessel and SpecialFunctionsAppell (main); nothing shared. Each consumes this roadmap (the Gauss function, Gauss's and Dougall's sums, Barnes's first lemma, the periodic Carlson lemma, 15.9.7); the split with SpecialFunctionsEiLiErfIncompleteGamma (argument in the unit disk there, off it here) and with ConformalMappingPartII §§4.1, 4.6 is stated on both sides.

Source independence: 16 passages compared with 2 sources (DLMF and Whittaker–Watson), none shared beyond formulas and a six-word run in the proof note to 15.16.4; largest share DLMF, about 290 of about 435 locators; contents compared with DLMF Chapter 15: independent. Andrews–Askey–Roy, Lebedev, Olver, Temme, Beals–Wong and Duverney could not be read, so no wording or contents comparison was made with them.

Research link: the targets are the classical theory of `₂F₁` (Gauss, Kummer, Barnes 1908, Dougall 1907) as in Andrews–Askey–Roy (1999), Beals–Wong (2010) and DLMF Chapter 15; they are prerequisites of the generalized hypergeometric, Appell, Bessel, Legendre and Heun roadmaps. Rests on the README's References and on those roadmaps' supplier contracts.

## Not verifiable

- Andrews–Askey–Roy (1999), Lebedev (1965), Olver (1974), Temme (1996), Beals–Wong (2010) and Duverney (2024): about 130 theorem, equation and page locators, in every sampled target. No open copy was found (publisher pages only; Duverney's DOI is at a paywalled publisher) and the operator holds none.
- Whittaker–Watson, fourth edition (1927): the README cites it; the copy read is the third edition (1920), whose section numbers and pages agree with every locator given.
- DLMF §15.6: the page text could not be fetched (only its figure was returned); 15.6.2_5, 15.6.6, 15.6.8 and 15.6.9 were checked numerically in the form the README and the Lean file state.
- DLMF release 1.2.8: the cached pages do not show their release number.
- Erdélyi et al. (1953), Eq. 2.11(41), and Dougall (1907): not read; the cubic transformation of 8.1 and Dougall's sum were checked numerically instead.

## Source issues

- **Misprint** in DLMF at 15.16.5 (§15.16, web page): the source says the last Gamma factor of the right-hand denominator has argument one half plus ν; it should be one half plus μ (at λ = ν = 0, μ = 0.3 the left side is 0.7428, not 0.4879); affects a stated result.
- **Gap** in DLMF at 15.10.15–15.10.16 and 15.10.25 (§15.10(ii), web page): the source gives the exponential-phase forms of the solutions at infinity and their connection formulas for principal branches with no restriction on z; it should restrict them to the upper half-plane, with the conjugate phases in the lower (at z = 2 − i, 15.10.25 fails by 0.918); affects a stated result.

## For the human reviewers

- **Not tested (new locators).** The change adds locators into seven books; only Whittaker–Watson (17 locators, third edition) was read. About 130 locators into Andrews–Askey–Roy, Lebedev, Olver, Temme, Beals–Wong and Duverney rest on the description's statement that each was checked.
- **Licence.** DLMF (NIST) keeps the largest share, about 290 of about 435 locators; its formulas are restated, its prose and section order are not. Whether that use of DLMF is acceptable is the question the revision was written to answer.
- **Licence.** The README names `lean-DLMF` (Apache-2.0, by the pull request's author) as a prior formalization of Layers 1–5 and 7–8; `Suggested.lean` was not compared with that repository.

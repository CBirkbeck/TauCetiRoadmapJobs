# Review of SpecialFunctionsParabolicCylinder (pull request #2551 at 18682aa)

**Verdict:** accepted

**Summary.** Accepted: no finding. The change touches only the README (attributions to seven further texts, ten renamed headings, a reworded scope); no statement, hypothesis or Lean declaration changes, and every sampled identity was recomputed from the pinned definitions and holds. The ten new Whittaker–Watson locators were read in the text and are right; the roughly 85 locators into the six other print texts could not be read legally and are unchecked, which is left to the human reviewers. One small correction, two format notes and one question, none blocking.

## C01 — In 2.5, Whittaker–Watson §16.51 covers only two of the three symmetries the sentence attributes to it

A reader who opens Whittaker–Watson for the rotation `z ↦ e^{±iπ/4} z` between Weber's equation and its oscillatory form will not find it there. The sentence at the end of 2.5 (line 487) reads "These symmetries are Whittaker–Watson §16.51, p. 347, and Beals–Wong §6.6, pp. 202 and 204". §16.51 (`ww1927` lines 23865–23869) states that the equation is unchanged under `(n, z) ↦ (−n − 1, ±iz)` and under `z ↦ −z`, which are the first two symmetries of 2.5 (`a ↦ −a` with `z ↦ ±iz`, and `z ↦ −z`); it has no rotation by `e^{±iπ/4}` and no oscillatory equation.

The smallest change: "The first two symmetries are Whittaker–Watson §16.51, p. 347; Beals–Wong §6.6, pp. 202 and 204, has those and the rotation relating the two equations", if that is what Beals–Wong has (I could not read it).

## N01 — Three section comments of `Suggested.lean` keep the layer titles the README no longer uses

`### Layer 4: recurrences and derivatives`, `### Layer 6: integral representations` and `### Layer 8: integrals and addition theorems` (lines 216, 294, 465) are the README's former headings. Renaming them with the README would keep the two files searchable by the same titles; the statements need no change.

## N02 — The first half of 6.6(b) will become a library citation at the next pin

At the pinned Tau Ceti (2fd255d) no declaration gives the residue of `Γ` at `−n`, so `tendsto_add_nat_mul_Gamma` is rightly a target today. The folder's own `STATUS.md` records that later Tau Ceti has it as `Complex.tendsto_add_natCast_mul_Gamma`; when the pin moves, 6.6(b) should cite that declaration and keep only the `Γ(A − 2t)` factor as a target.

## Questions for the author

- SpecialFunctionsGamma, at the head of its open pull request, states the residue of `Γ` at `−n` as its own target (its 1.1, `Complex.tendsto_add_nat_mul_Gamma`), while the ownership table here gives it to 6.6(b). Is 6.6(b) meant to stay the owner, so that SpecialFunctionsGamma 1.1 cites it? This roadmap is on main and so is the earlier owner; the intent is yours to state, and the change, if any, is in that roadmap, not here.
- In 7.1, is the route attributed to Lebedev (10.6.6), p. 292 (Laplace integral for `Re ν < 0`, rotated rays in his footnote 7, the recurrence (10.6.5)) exactly what the text does there? I could not read Lebedev, and the sentence is the only place where the README says a source uses its route.

## Verified sound

**Previous review.** The previous review (of the pull request that added this roadmap, at 4a8c39e) had no finding, so there is nothing to check for repair.

**Adversarial table.** Values recomputed in this review from the pinned definitions (`u₁`, `u₂` by the series 12.4.3–12.4.4 and by the Kummer form of `Suggested.lean`; `U`, `V` with reciprocal-Gamma coefficients; Lanczos Gamma; Simpson quadrature). Left / right unless stated.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 2.3 Weber's equation, Kummer form = series | a = 0.3+0.2i, z = 0.7−0.4i | `u₁` 1.1022524819−0.0607749617i both; `u₁″` 0.4252580720+0.0428887260i both; `u₂″` 0.2988671526−0.1210715390i both; initial values (1,0), (0,1) | holds |
| 2.4 Wronskian of `u₁`, `u₂` | same point | 1.0000000000 | holds |
| 2.5 rotation `e^{±iπ/4}` (C01) | symbolic | `g″ = ±i(±iz²/4 ∓ ia) g = (a − z²/4) g` | holds |
| 3.3 12.2.10 | a = 0.3+0.2i; −½; −3/2 | 0.7978845608 = √(2/π) at all three | holds |
| 3.3 12.2.11 | same | 2.2127616520+0.4193330464i both; 0 = 0 at a = −½, −3/2 (`Γ(0)⁻¹`, `Γ(−1)⁻¹`) | holds |
| 3.3 12.2.12, both signs | a = 0.3+0.2i; −½ | upper 0.6946542388−0.2257068443i both; lower 1.3020988668+0.4230775683i both; a = −½: ∓i | holds |
| 3.5 12.2.15–12.2.20 and reciprocal forms | a = 0.3+0.2i, −½, ½, −5/2; both signs | e.g. 12.2.19: 0.7073588741+0.1903060173i both signs; 12.2.17 reciprocal at a = −½: 0 = 0; 12.2.18 reciprocal at a = ½: 0 = 0 | holds |
| 3.5 as `D_ν` (WW §16.511, §16.52) | n = 0.7+0.1i, z = 0.6−0.3i | 0.8163863446−0.1730966195i on both sides of each | holds |
| 4.1 12.8.1–12.8.4 | a = 0.3+0.2i, z = 0.7−0.4i; a = −½ | residuals 0 to 10 digits; terms 0.5712736188−0.1497293375i, 0.8717494468+0.0711757545i, 0.3004758280+0.2209050920i | holds |
| 4.2 12.8.5–12.8.8 | same | residuals 0; wrong sign of `V(a+1)` gives 1.1531833024−0.7923902391i | holds |
| 4.4 `D_ν` recurrences | ν = 0.7+0.1i | residuals 0; terms −0.0315432363−0.7160693630i, 0.5602006156−0.4747448974i, 0.5917438518+0.2413244656i | holds |
| 5.1 12.7.1–12.7.4 | z = 0.7−0.4i | `D₃` −1.9952632343+0.3474426661i both; `V(5/2)` 1.0734595235−0.6413093401i both; `V(−½)` 0.5547701064−0.2864202012i both; `F(0.8i)` 1.2472583074i both | holds |
| 5.4 12.7.5–12.7.6 | x = 1.3, −0.9 | n = 0: 0.3702174492, 2.5043367360 both; n = 1: 0.1741235704, 3.0705895450 both | holds |
| 6.2 positivity | a = −0.4, 0, 2; x = −3…3 | all positive (min 0.0047224446); control a = −0.6, x = −3: −0.6930270817; a = −3/2, x = −1: −0.7788007831 | holds; hypothesis needed |
| 6.4 loop integral | a = 0.2+0.1i, −1.3, 1.2+0.3i; r = 1, ½ | 0.8943656617−0.2216103270i for `U`, r = 1 and r = ½; swapped ray phases give 0.6521011451−0.1343022192i | holds |
| 6.6(a) product, `|Γ(1+iy)|²`, comparison | (x, y) = (1.3, 0.7), (−0.5, 1.1); y = 0.9 | 1.6731669058 both; 92.6039037370 both; 0.3357426762 both; 0.5205909636 ≤ 1.3073671869 | holds |
| 6.6(b), 6.6(c) Check | n = 0…3; A = 1 | 1, −1, ½, −⅙; affine −½, ½, −¼, 1/12; residue −1.00265−0.37599i = `−√(π/2) z` | holds |
| 6.7 kernel in duplication form (new sentence) | A = 0.8+0.3i, two t | ratio 0.4805747964+0.1013984661i = `2^{A−1}/√π`, independent of t | holds |
| 7.1 12.9.1 | a = 0.3+0.2i, −1.7; N = 1, 2; \|z\| = 3, 4, 5; ph z = 0, 2 | `|rem|·|z|^{2N}` on the axis 0.595, 0.649, 0.679 (next coefficient 0.747); 0.116–0.118 (0.120) | holds |
| 7.1 rotated Laplace integral | θ = 0.6 | 0.8835562044−0.0570430611i both | holds |
| 6.1 Laplace form | a = 0.3+0.2i | 0.7073588741+0.1903060173i both | holds |
| 1.4 Kummer's transformation | b = −1 and 0.4 | 0.2289166448−0.1470742904i both; 0.9223655314−0.0421766819i both | holds |
| 8.1 12.12.1 | a = 0.3+0.2i, μ = 1.4+0.3i | 0.7861865371−0.1763596103i both | holds |
| 8.2 12.13.1 | a = 0.3+0.2i | 0.4630288629+0.0377867028i both | holds |
| 8.3 rotational addition | a = −0.8+0.3i, x = 0.9, y = −0.6, t = 0.5 | left 0.9119646712+0.0891125377i; with `(cos t)^{−a−½}` the same; without it 0.9513020528+0.0554573927i | README form right |
| 9.1–9.3 | a = 0.7, 0.4, −0.6 | imaginary part 0; `−2W(a,0)W′(a,0)` = 1; Wronskian 1.0000000000; 12.14.4: 0.4143517868 both | holds |
| 9.6 12.14.13–12.14.14 | x = 0.8, 2.1; both signs | 0.6249571591, 1.4031508777, −0.1503382319, 1.4364434923 both; derivatives −0.5198660535, 0.4329088591, −0.6233274259, −0.6959332574 both | holds |
| 9.7 12.14.23 | a = 0.4, −0.6; N = 1, 2; x = 4, 5, 6 | `|s − S_N| x^{2N}`: 0.503, 0.504, 0.503 (next coefficient 0.497); 1.090, 1.109, 1.115 (1.108) | holds |
| Conventions, Lebedev's `H_ν` (new) | ν = 0.3+0.2i; ν = 2 | `v″ − 2zv′ + 2νv` = 1e-7 (difference quotient); `H₂` = −0.92−1.44i = `4z² − 2` | holds |
| 6.7, 7.5, 12.12.2–12.12.4, 7.2–7.3, 9.4–9.5 | carried from the earlier reviews | not recomputed here; statements unchanged in this pull request | holds (earlier values) |

- Source locators checked against the text: 51 DLMF equations for the fifteen sampled targets and the remarks (among them 12.2.2, 12.2.10–12.2.12, 12.2.15–12.2.20, 12.8.1–12.8.8, 12.7.1–12.7.7, 12.5.5, 5.8.3, 5.4.3–5.4.4, 12.9.1, 12.14.13–12.14.14, 12.14.17–12.14.23, 1.13.2–1.13.5, 12.2.21, 12.13.5), and all ten Whittaker–Watson locators (`ww1927` lines 23312, 23824, 23865, 23880, 23904, 23945, 23988, 23999, with the running heads for pp. 338, 347–350). None wrong. Whittaker–Watson was read in the third edition (1920), whose pagination of Chapter XVI agrees with the pages the README gives for the fourth.
- Library declarations opened at the pins: 24 Mathlib names (for example `Complex.besselJ`, `Analysis/SpecialFunctions/Bessel.lean` 55; `radius_regularizedHGFunSeries_eq_top`, `RegularizedHypergeometric.lean` 249; `Complex.digamma`, `Gamma/Digamma.lean` 48) and 12 Tau Ceti names (`Complex.hasSum_regularizedHGFun`, `RegularizedHypergeometric.lean` 53; `TauCeti.Contour.residue_eq_of_tendsto_sub_mul`, `Contour/Residue/SimplePole.lean` 152; `TauCeti.Real.erfc`, `Erf.lean` 64). No pinned declaration states an object of this roadmap (`parabolicCylinder`, `dawson`, the Gamma product, the Gamma residue at `−n`: no hit).
- Cross-roadmap citations resolved: AsymptoticExpansions Conventions, Layer 1, §3.3, §4.2, §4.3, §8.2, §8.6, §8.7 and ContourIntegration Layer 2, all on main. The anchors other roadmaps cite here (`#13-kummers-equation`, `#51-hermite-cases`, `#53-the-repeated-gaussian-integrals`, `#conventions`, `#layer-1-the-regularized-kummer-function`) are untouched; none of the ten renamed headings is cited anywhere.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds and drops no supplier.
- Automatic checks: all pass on this head; rerun with the same result. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` exits 0 with 70 `declaration uses sorry` warnings and nothing else; it is byte-identical to main. The elaborated signatures of all 81 declarations were compared with the README statements of the sampled sections; no binder lost, nothing changed.
- Padding probe: each of the 70 sorried theorems tried with `rfl`, `intros; rfl`, `simp`, `simp` with the nine definitions unfolded, and `infer_instance` on a copy of the file; none closes.
- Headline theorems (Kummer's equation and transformation; uniqueness for Weber's equation; the Wronskians and connection formulas; the Laplace and Barnes representations; 12.9.1–12.9.4 and the recessive solution; 12.12.1–12.12.4 and the addition theorems; `W` with 12.14.4 and 12.14.23) are all stated; none is declared not statable.
- Pull-request text: every sentence of the description was read against the head (README only; statements and `Suggested.lean` unchanged; ten headings renamed as tabulated; Temme chapter corrected; Miller dropped; references alphabetical; no cited anchor lost). No sentence is contradicted and no change is left out.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsHypergeometric, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsGamma, SpecialFunctionsStruve (open), SpecialFunctionsBessel, SpecialFunctionsAiry, AsymptoticExpansions (main). Kummer theory of `𝐌` (Layer 1): this roadmap, consumed by Confluent, Airy and QuantumFoundations. Dawson's integral and `Hh_n`: this roadmap, consumed by EiLiErfIncompleteGamma. DLMF 5.8.3 and `|Γ(1+iy)|²`: this roadmap, consumed by SpecialFunctionsGamma. Residue of `Γ` at `−n`: owned here (6.6(b), on main) and also stated by the open SpecialFunctionsGamma 1.1; the earlier owner is this one (see the question). Asymptotic and contour tools: AsymptoticExpansions and ContourIntegration.

Source independence: 9 passages compared with 2 sources (DLMF, Whittaker–Watson), none shared beyond formulas; largest share DLMF, about 199 of about 294 locators; contents compared with DLMF Chapter 12: independent at the level of layers (Kummer theory first; §12.8 and §12.7 before §12.5; §12.12 and §12.13 merged; Gamma material added to Layer 6; the order 4 → 6 → 7 → 8, 9 is forced by the *Needs* lines of 6.1, 7.1, 8.1 and 9.7). Within Layer 9 the subsections run in the order of §12.14(ii)–(viii), with 9.1–9.2 splitting (ii) and 9.5–9.6 splitting (vii) in reverse. Lebedev, Magnus–Oberhettinger–Soni, Beals–Wong, Temme, Olver and Andrews–Askey–Roy could not be read.

Research link: Weber's functions (Weber 1869; Whittaker 1903, per Whittaker–Watson §16.5) are the comparison functions of Olver's uniform turning-point asymptotics (DLMF §12.10, named in the README's Excluded material) and feed Durand's 1975 integral 12.12.4 (`dlmf1212` line 39); the README's consumers are QuantumFoundations, SpecialFunctionsConfluent and the error-function roadmap. Rests on the README and DLMF.

## Not verifiable

- Lebedev, *Special Functions and Their Applications* (14 locators): no legal copy found (title search; no open archive).
- Magnus–Oberhettinger–Soni (24 locators, among them §8.1.7, p. 333, cited for the factor `(cos t)^{−a−½}` of 8.3): resolves only to a paywalled publisher page.
- Beals–Wong (21 locators), Andrews–Askey–Roy (4): publisher landing pages only, not open.
- Temme, *Special Functions* (13 locators): publisher page refuses access.
- Olver, *Asymptotics and Special Functions* (9 locators): no legal copy found.
- For these six texts the mathematical content of each attribution was checked where it is a formula (the `D_ν` and `H_ν` translations, the Wronskians, the recurrences, the kernel of 6.7, the Gamma inequalities); the section, equation and page numbers were not.

## Source issues

- **Error** in dlmf1213 at 12.13.5 (`dlmf1213` line 178): the source says the rotated argument's `U` equals the exponential times the binomial sum, with no power of `cos t`; it should be that sum multiplied by `(cos t)^{−a−½}`; affects a stated result (8.3, which already states the corrected form).

## For the human reviewers

- **Not tested.** Six of the eight cited texts (Lebedev, Magnus–Oberhettinger–Soni, Beals–Wong, Temme, Olver, Andrews–Askey–Roy; about 85 locators, all new in this pull request) could not be read legally; wording and locators were checked only against DLMF and Whittaker–Watson.
- **Licence.** DLMF carries about two thirds of the locators; Layer 9 cites DLMF §12.14 alone and its subsections run in that section's order (README lines 1270–1380). Whether that arrangement is acceptable is yours to decide.
- **Licence.** README lines 1428–1447 say the Lean names and argument order are kept from the author's `bjbraams/lean-DLMF` (Apache-2.0), directory `DLMF/ParabolicCylinder/`; I did not open that repository.
- **Licence.** Whittaker–Watson was read as the Internet Archive scan of the 1920 third edition (`courseofmodernan00whit`), taken to be public domain; the README cites the 1927 fourth edition.

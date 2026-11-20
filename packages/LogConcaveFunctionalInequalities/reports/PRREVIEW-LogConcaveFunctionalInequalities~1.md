# Review of LogConcaveFunctionalInequalities (pull request #2778 at 32900dd)

**Verdict:** accepted

**Summary.** Accepted: no statement of the README or of `Suggested.lean` was found false, overclaimed or unowned. Every theorem was tested on degenerate instances (`d = 0`, `κ ≤ 0`, Dirac and singular laws, the zero Gibbs measure) and every number printed in a Check was recomputed and agrees. There are one small correction (the route of 3.1 uses the logarithmic Sobolev inequality on a product space where the roadmap's definition is not available) and three format notes, none blocking. The two locators into van Handel's lecture notes could not be read, and the status of those notes as a source is left to the human reviewers.

## C01 — The route of 3.1 applies the logarithmic Sobolev inequality to a measure on `E × E`, where the roadmap's definition does not exist

In the first bullet of the route of 3.1 (README line 371) the product `μ ⊗ N(0, C I)` "satisfies the inequality with constant `C`". The inequality is defined, in the Conventions and in `Suggested.lean` (line 58), only for measures on `E = EuclideanSpace ℝ (Fin d)`. The product `E × E` is not of that form, and with Mathlib's product norm (the supremum of the two norms) it is not an inner product space, so `gradient` is not available on it. An implementer who follows the route is stuck at its first step with no statement to apply.

The smallest change is one clause in that bullet saying that the product is read on `EuclideanSpace ℝ (Fin (d + d))` through the evident linear isometry, under which the map `(x, y) ↦ x + √(ε/C) y` and the tensorization of RandomMatrices 2.2 are transported. Alternatively the two definitions would be stated for every finite-dimensional real inner product space, which is the generality RandomMatrices 2.2 names ("finite Euclidean spaces") and costs the theorems nothing; the route then uses `WithLp 2 (E × E)`.

## N01 — The second Check of 1.1 needs "for `d ≥ 1`" on its last sentence

"`V(x) = ‖x‖` is not strongly convex" (README line 102) fails for `d = 0`, where by the next Check every `V` is `κ`-strongly convex for every `κ`. The qualifier `d ≥ 1` of the preceding sentence would be repeated.

## N02 — The summary's Fokker–Planck item omits that `V` is continuously differentiable

4.1 and 4.2 and both Lean statements assume `ContDiff ℝ 1 V`; the fourth item of the summary (README lines 26–29) does not say so. Three words would add it.

## N03 — The two locators into Bakry–Émery carry no page

In 2.3 (README lines 293–295), Corollaire 2 is on printed p. 199 and Proposition 4 on pp. 194–195 of the Numdam text; both support the sentence as written.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `integrable_exp_neg_of_strongConvexOn` | `V = κx²/2`; `V = 0`; `V = ‖x‖`; `d = 0` | `Z = (2π/κ)^(d/2)`: 2.5066 (d=1), 6.2832 (d=2); `V = 0`: tilted measure is 0 at the pin; `d = 0`: Dirac | true; `κ > 0` needed | N01 |
| 1.1 route bound `V ≥ a + (κ/4)‖x‖²` | affine minorant of `V − (κ/2)‖x‖²` | `a + ⟨b,x⟩ + (κ/2)‖x‖² ≥ a − ‖b‖²/κ + (κ/4)‖x‖²` | true | none |
| 1.2 `LogSobolevInequality.poincareInequality` | Gaussian, `g = x`, ε = 0.1, 0.01, 0.001; two-point law; `d = 0`; `C < 0` with arctan | ratios 0.994983, 0.999950, 0.999999 → 1; two-point: 1/4 ≤ 0 fails; `C < 0`: right side negative, left ≥ 0 | true for every real `C` | none |
| 1.3 `relativeFisherInformation` | `h = f²`; `h = 1`; Gaussian translate κ = 2, a = 1/2 | `‖∇h‖²/h = 4‖∇f‖²`; 0; `κ²a² = 1.0000`; Lebesgue Fisher information of `N(0,1)` is 1 ≠ 0 | definition separates the two objects | none |
| Conventions: entropy form of the inequality | `h = f²`, `∫h dμ = 1` | `Ent(f²) ≤ 2C·I/4 = (C/2) I` | agrees | none |
| 2.1 Talagrand | translates; dilations s = 2, 1/2; quartic potential a = 0.5, 1.5; Dirac ν; ν with infinite second moment; `d = 0` | `‖a‖²` both sides; (1, 1.6137), (0.25, 0.6363); (0.25, 0.63219), (2.25, 7.93971); KL = ∞ so right side ∞; 0 ≤ 0 | true, constant sharp | none |
| 2.2 HWI | Gaussian translates; `f ∝ (1−x²)⁴`, `V = x²/2` and `x⁴/4 − x²/2`; `V = (3/2)log(1+x²)`; `d = 0` | equality `κa²/2`; (0.78148 ≤ 2.06468), (1.08144 ≤ 2.84123); `min V'' = −3/8`, partial moments 4.30, 8.90, 13.51; 0 ≤ 0 | true; second moment needed for κ < 0 | none |
| 2.2 finiteness, `‖∇f‖² ≤ 2M f` | `f ∝ (1−x²)⁴` | `I = 10.6667` (κ = 1), `13.1235` (κ = −1), finite | true | none |
| 2.3 Bakry–Émery | exponentials κ = 1/2, a = 1/2 and κ = 2, a = 1; quartic a = 0.5, 1, 2; `d = 0` | 0.321006 both sides; ratios 0.46030, 0.43940, 0.37693 < 1; 0 ≤ 0 | true, `1/κ` sharp | none |
| 2.3 route, `W√I − (κ/2)W² ≤ I/(2κ)` | maximise in `W` | maximum at `W = √I/κ`, value `I/(2κ)` | true | none |
| 2.4 Poincaré | linear `f`, κ = 2; quartic | `Var = 0.5 = (1/κ)∫‖∇f‖²`; `Var(x) = 0.46792 < 1`; source: `T₂(C) ⇒ P(C/2)`, `C = 2/κ` gives `1/κ` | true | none |
| 3.1 Otto–Villani | `μ = δ₀` with `C = 0` and with `C > 0`; smoothing constants; Hopf–Lax Hamiltonian; `d = 0` | `C = 0`: 1 ≤ 0·∞ = 0 fails; `C > 0`: KL = ∞, holds; `C(1 + ε/C) = C + ε`; `L* = (C/2)‖p‖²`; `tZ' ≤ Z log Z` | true; `C > 0` needed | C01 |
| 4.1 dissipation | Gaussian translates κ = 1.5, a = 1.2, t = 0, 0.4, 1; `h = 1`; reversed time; `d = 0` | both sides of PDE `κ²⟨aₜ, aₜ − x⟩h`; `−I` = −3.24, −0.975869, −0.161310; 0 = 0; entropy increases backwards | true under the structure's hypotheses | N02 |
| 4.1 integration by parts | `G = e^(−V)(log h + 1)∇h` | `div G = e^(−V)((Δh − ⟨∇V,∇h⟩)(log h + 1) + ‖∇h‖²/h)`; `G`, `div G` integrable from the three fields | `∫ div G = 0` justified | none |
| 4.2 decay | same family, t = 0, 0.4, 1; half generator | 1.08, 0.325290, 0.053770 = `e^(−3t)·1.08`; `e^(−1.5) = 0.2231` vs `e^(−3) = 0.0498` | true, rate `2κ` sharp | none |

- Source locators checked against the text: 10 in GozlanLeonard2010 (Theorem 1.5 line 247; Theorem 7.1 line 1654; outline lines 1676–1700; Corollaries 7.2, 7.3 lines 1702, 1713; (32) line 1721; Corollary 7.4 line 1743; Definition 8.9 line 2170; Proposition 8.11 line 2191; Theorem 8.12 and first proof lines 2231–2289) and 2 in BakryEmery1985 (Proposition 4 line 584; Corollaire 2 line 741); all support the README. 2 in van Handel's notes not read.
- Library declarations opened at the pins: 20. Mathlib: `Measure.tilted` (Tilted.lean:42), `tilted_of_not_integrable` (:46), `isProbabilityMeasure_tilted` (:125), `klDiv` (KullbackLeibler/Basic.lean:56), `klDiv_comp_right_le` (DataProcessing.lean:185), `StrongConvexOn` (Convex/Strong.lean:117), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (ParametricIntegral.lean:569), `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable` (IntegrationByParts.lean:226), `HasCompactSupport.contDiff_convolution_left` (ContDiff/Convolution.lean:428), Laplacian.lean present. Tau Ceti: `wassersteinEDist` (Wasserstein/Basic.lean:189), `wassersteinEDist_triangle` (:608), `exists_isKantorovichOptimalTransportMap_gradient` (Brenier.lean:565), `internalEnergy_map_smul_add_smul_gradient_le` (DisplacementConvexity.lean:306, needs `Nontrivial E`, matching "let `d ≥ 1`"), `StrongConvexOn.potentialEnergy_map_le` (PotentialEnergy.lean:481), `klDiv_tilted_eq_boltzmannEntropy` (InternalEnergy/Basic.lean:378), `klDiv_eq_iSup_integral_sub_log_integral_exp` (Variational.lean:378), `hopfLax` (HopfLax.lean:89), `hopfLax_add_add_smul_le` (:146), `stdGaussian_eq_withDensity_norm` (Gaussian/Density.lean:178), `LogConcave` (LogConcave.lean:73). Hypotheses agree with the supplier contracts.
- Duplication by object: no logarithmic Sobolev, Poincaré (gradient form), Talagrand, HWI or Fisher-information declaration in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: OptimalTransport 2.4, 3.1, 5.5, 6.6, 9.3, 9.5, 10.3, 11.2, 11.5, 11.7, 11.9, 14.6, 14.7 and RandomMatrices 2.2 on main; DifferentialEntropyAndEntropyPower 2.1, LangevinAndHamiltonianMonteCarlo 5.2–5.4, LogSobolevForMarkovChains at their open heads. All exist and say what is attributed to them.
- Dependency check output: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. Suppliers OptimalTransport and RandomMatrices are on main.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and nothing else; no `set_option`, no sorried data. Elaborated signatures compared with the README: all 13 agree, no binder lost.
- One-tactic probe (`rfl`, `infer_instance`, `simp`) on a copy: none of the eight theorems closes. Headlines (Bakry–Émery, Talagrand, Otto–Villani, HWI, dissipation, decay) are all stated; the Poincaré corollary 2.4 is the composition of two stated theorems and the docstring says so.
- Pull-request text read against the head: title and description agree with it (new roadmap, 8 theorems, 4 definitions, 1 structure, one Tau Ceti import, two suppliers on main). No change outside the folder.

Overlap check: read OrnsteinUhlenbeckSemigroup, DifferentialEntropyAndEntropyPower, LangevinAndHamiltonianMonteCarlo, ScoreBasedDiffusion, LogSobolevForMarkovChains (open), OptimalTransport, GaussianIsoperimetryAndClusters, MathematicalStatisticsNonparametric (main). The logarithmic Sobolev and Poincaré definitions, their tensorization and Gaussian case: owner RandomMatrices 2.2, cited here and written out in Lean because that roadmap has no Lean definition. Entropy decay along the Ornstein–Uhlenbeck semigroup for arbitrary laws: owner OrnsteinUhlenbeckSemigroup 3.2, which excludes other strongly log-concave laws; 4.2 here is for classical solutions given as data. Fisher information of a Lebesgue density: owner DifferentialEntropyAndEntropyPower 2.1; the relative information against a probability measure is owned here. Fokker–Planck flow, semigroup and `W₂` contraction: owner OptimalTransport 11.7, 11.9. Nothing has two owners.

Source independence: 16 passages compared with 2 sources (GozlanLeonard2010, BakryEmery1985), none shared beyond formulas; largest share GozlanLeonard2010, 10 of 14 locators; contents compared with GozlanLeonard2010: independent (Layer 2 draws on its §7 in a different order and with a different logical route, Layer 3 on its §8.4, Layers 1 and 4 have no counterpart; the order 2.2 before 2.3 is forced by the *Needs* line of 2.3). van Handel's notes (2 locators) could not be read.

Research link: Layers 2 and 3 state the Bakry–Émery criterion (Bakry–Émery 1985), Talagrand's transport inequality, the HWI inequality and the Otto–Villani theorem in the forms of Gozlan–Léonard 2010, Corollaries 7.2–7.4 and Theorem 8.12, which attribute them to Talagrand, Otto–Villani, Cordero-Erausquin and Bobkov–Gentil–Ledoux; rests on the sources read.

## Not verifiable

- 4.1, van Handel, Theorem 3.20, p. 63 (first display of the proof): the sources service declined the notes' address as not shown to be an author's page, and no other legal copy was sought. The statement itself was checked by computation (table above).
- 4.2, van Handel, Theorem 3.20, pp. 63–64, implication 1 ⇒ 2 and the identification of `1/(2κ)` with his `c`: same reason. OrnsteinUhlenbeckSemigroup 3.2 cites the same theorem with `c = 1/2` for `κ = 1`, which is consistent but not an independent reading.

## Source issues

- **Gap** in GozlanLeonard2010 at Theorem 8.12, first proof, printed pp. 42–43: the source says the logarithmic Sobolev inequality and the Hamilton–Jacobi equation are applied to the infimal convolution `Qₜf` for smooth enough `f`, for any probability measure; it should be justified that `Qₜf`, only Lipschitz and a solution Lebesgue-almost everywhere, may be used when the measure is not absolutely continuous; affects the proof.

## For the human reviewers

- **Licence.** van Handel's *Probability in High Dimension* (cited for 4.1 and 4.2, README lines 445 and 481) is an unpublished set of lecture notes on a university page; the sources service could not classify the host, and its text was not read.

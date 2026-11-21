# Review of ThetaSeries (pull request #2725 at e7d0eeb)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example I recomputed is correct, the lettered ids 1A–8E of the README on main are back on their items, `Suggested.lean` elaborates with `sorry` as its only warning, and none of its ten theorems closes in one tactic or is proved at the pin. There is one small correction (a sentence of the description) and one format note (coarse locators), neither blocking. For the humans: no cited source could be read legally, so wording and arrangement were compared with no source.

## C01 — The description says every generalised statement is "in the form the pinned library proves it", and §6.2 is not proved at the pin

Under *Statements whose content changed* the description opens: "The following are stated more generally, or with more, than on main, each in the form the pinned library proves it." Its first bullet is §6.2 (6B), reciprocity for all positive `a`, `c`. That statement is an open target: the description's own list of open targets has §6.2, `Suggested.lean` states it with `sorry` (`gaussSum_eq_mul_dualGaussSum`, line 64), and the pin has only the two limits of its route (`ZLattice.tendsto_pow_mul_thetaCoset_comap_S`, `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT`). A reader takes reciprocity at non-coprime pairs for a library theorem.

Write "each, except §6.2, in the form the pinned library proves it; §6.2 is an open target whose realised parts (the intermediate asymptotic and the direct side) hold for all positive `a` and `c`".

## N01 — Locators are coarse or missing

Layers 1, 2 and 4 and §§3.1–3.3, 3.5, 5.1, 5.4, 6.1, 6.4, 7.1, 7.2, 7.6, 8.1–8.5 name no source, and apart from Turaev §1.3, Miyake §4.9, Serre Ch. VII §6 and Conway–Sloane Ch. 2 §2.3 every locator is a whole chapter or appendix. A theorem or page number at each claim would let a reader check the hypotheses.

## Previous findings

The previous review, of `3b3196f`, had one finding, three small corrections and three format notes.

- R01 (lettered ids replaced by a mapping table) — repaired. All 46 item headings end with their id, "### 2.3 Covolume, determinant, index (2C)", "### 7.3 The Hecke–Schoeneberg theorem (7C)"; main's 44 ids 1A–8E are each at their item with their subject, and 2I, 8F are new. The citations of these ids from main (GeometryOfNumbersAndQuadraticArithmetic, HilbertModules/HeisenbergImprimitivity, HypergeometricMotives, LatticePackingsAndPerfectForms) and from the open AutomorphicPadicLFunctionsPartII and QuasiRiemannHypothesis point at items again.
- C01 (docstring pointer) — repaired: "`README.md` names them on the *In Tau Ceti:* lines of its layers" (`Suggested.lean` lines 45–46).
- C02 (level characterization for integral `L`) — repaired in both places: "the level of the rational model (§2.4), which for even `L` is the order of its discriminant quadratic map" (§2.5, lines 515–516; §2.4, lines 488–489, in the same words).
- C03 (description silent on two sections) — repaired: the description now says main's *Ordering* is replaced by the per-layer *Dependencies*, its status table dropped, and the *Acknowledgements* are the last paragraph of *Provenance*.
- N01 (locators) — not repaired; N01 above.
- N02 (§6.3 corollary) — repaired: "gives `4 ∣ n` and contradicts oddness" (line 1134).
- N03 (Schoeneberg reference) — repaired: "that is Layer 7's route of record" (line 1933).

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §1.6 Gaussian transform | `a = τ/i`; `τ = i`; exponent doubled | `1/a = i/τ`, exponent `πi(−1/τ)‖y‖²`; `(i/i)^{−n/2} = 1`; `2^{−n/2} exp(−π‖ξ‖²/2)` | true | none |
| §2.4 bridge, with Layer 2 Examples | `⟨2m⟩`, `A_n`, `ℤ` (odd) | `‖x/2m‖²/2 = 1/(4m)`; `n/(2(n+1))`; level `2`, no quadratic map, statement now restricted to even `L` | true | none |
| §2.7 shells | coset shell; `ℤ ⊕ ℤ` | `‖γ+v‖² ∈ ‖γ‖² + 2ℤ`, so `Nt/2 ≡ N q(γ) (mod N)`; `2·1 + 1·2 = 4` | true | none |
| §2.9 orthogonal sum | `√2ℤ ⊕ √2ℤ`, `A₂ ⊕ A₂`, non-integral summands | `(1+i)² = 2i = 1 + 2i − 1`; `(i√3)² = −3 = √9·i²`; `(L⊕M) ∩ (L^∨⊕M^∨)` splits | true | none |
| §3.2 descent and dual sum | `γ → −γ`; `L = ½ℤ` | `v ↦ −v` reindexes; `L^∨ = 2ℤ ⊆ L`, quotient trivial, `Θ_{2ℤ}(i) ≠ Θ_{½ℤ}(i)` | true | none |
| §3.5 rank one | `ℤ`, `√2ℤ` | coefficients of `exp(πiτ)^m`: `1, 2, 0, 0, 2`; `Θ_{√2ℤ}(τ) = Θ_ℤ(2τ)` | true | none |
| §5.2 level one (with §5.1) | `n ≡ 4 (mod 8)`; `8 ∣ n`; rank `0` | `(−i)^k = −1`, `(ST)³ = −I` acts by `+1`, so `Θ = 0`; `(−i)^k = 1`; constant `1` | true | none |
| §6.1 Gauss sums | `√2ℤ²`, `c = 2`; shift `y + cw`; square completion | `(1 + e(1/2))² = 0`; phase `a⟪y,w⟫ + ac‖w‖²/2 + ⟪w,m⟫`, first two integers; residual `ad ≡ 1` | true | none |
| §6.2 reciprocity, `gaussSum_eq_mul_dualGaussSum` | `√2ℤ²` at `(3,1)`, `(2,2)`, `(1,2)`; `A₂` at `(1,1)`; rank `0` | `∑_{u mod 6} e(−u²/12) = √3(1−i)`, `1 = ⅓·½·i·(−6i)`; `4 = ½·i·(−8i)`; `0 = 0`; `1 = (1/√3)·i·(−i√3)`; `1 = 1` | true | C01 (description only) |
| §6.3 Milgram, `sum_cexp_norm_sq_discriminantGroup` | `A₂`, `D₄`, `√2ℤ²`, rank `0` | `1 + 2e(1/3) = i√3`; `1 − 3 = −2 = 2i²`; `2i`; `1 = 1` | true | none |
| §6.4 odd modulus | `√2ℤ²`: `(3,4)`, `(3,12)` | `(2 + 4e(−1/3))² = −12 = 4·(−1)·3`; `36 ≠ −12` | true | none |
| §6.5 closed form, `gaussSum_eq_sqrt_card_mul_jacobiSym` | `√2ℤ²`: `(1,4)`, `(3,4)`, `(3,12)`; rank `0` | `(2+2i)² = 8i`; `(2−2i)² = −8i = 8i·(−4/3)`; `72i ≠ −24i`; `1 = 1` | true; controls separate | none |
| §6.6 conductor and nebentypus, `conductor_kroneckerChar_dvd_level`, `nebentypus` | `A₂`, `D₄`, `√2•E₈`, form `diag(2,4)`, rank `0` | `3 ∣ 3`; `D = 4`, conductor `1 ∣ 2`; `D = 256`, `1 ∣ 2`; `D = −8`, level `8`; `1 ∣ 1` | true | none |
| §7.2 coset splitting | `A = S`; `N ∣ c` | `G(0,1;m) = 1`, inversion law; `d − ad² = −bcd`, `e(−bd‖m‖²/2) = 1` | true | none |
| §7.3 Hecke–Schoeneberg, `thetaSeries_slash_of_mem_Gamma0`, `exists_modularForm_coe_eq_thetaSeries` | constant; `c = 0`; `−A`; `A₂`, `√2ℤ²` | `(−i)^k c^{−k} det^{−½}·c^k det^{½} i^k (D/a) = (D/a)`; `ε^k = χ(ε)`; `(−1)^k` both sides; `(−3/2) = (−4/3) = −1` | true | none |
| §7.5 coset series, `thetaCoset_slash_of_mem_Gamma`, `exists_modularForm_coe_eq_thetaCoset` | `A ∈ Γ(N)`; `A₂` and `T`; `D₄`, `−I` | `χ(d) = 1`, `e(ab q(γ)) = 1` as `N ∣ b`, `aγ ≡ γ`; `e(1/3) ≠ 1`; `k = 2` even | true | none |
| §7.6 Fricke | raw, normalized, square | `N^{k−1}(Nτ)^{−k}·N^k τ^k`; `(√N)^{2−k}N^{k−1} = N^{k/2}`; `N^{2(k−1)}(−N)^{−k} = (−1)^k N^{k−2}` | true | none |
| §8.1 ranks 8 and 16 | Sturm bounds; `E₄²` | `⌊4/12⌋ = ⌊8/12⌋ = 0`; `q`-coefficient `480 = 480 σ₇(1)` | true | none |
| §8.3 rank 24, with §8.4 | `q²`; Leech `m = 2, 3` | `3·2160 + 3·240² = 179280`, `179280 + 17280 − 24 r(2)`; `65520·2073/691 = 196560`; `65520·256 = 16773120` | true | none |
| §8.6 `A₂`, `D₄`, the two representation numbers | `A₂` at `m = 1, 2, 3, 4, 7`; `D₄` at `m = 1, 2, 3`; constants | `6, 0, 6, 6, 12`; `24, 24, 96`; `B_{1,χ₋₃} = −1/3`, `a₀ = 1/6`; `−(E₂ − 2E₂(2τ)) = 1 + 24q + 24q²` | true | none |
| §2.5, §2.6, §2.8 (conventions the headlines use) | `√2ℤ`, `2ℤ²`, `(−1/0·3)`, `(5/2)` | level `4 = 2 det`; `N = 8`, content `2`, partner level `4`; `1 ≠ 1·(−1)`; `−1` | true | none |

- Source locators checked against the text: 0 of 19; no cited work has a legal copy the sources service could read (below).
- Library declarations opened at the pin: `ZLattice.gaussTerm`, `gaussSumTwisted`, `gaussSum` (`TauCeti/Algebra/Module/ZLattice/GaussSum.lean` lines 133, 171, 176), `dualGaussSum` (line 449), `IsEven.dualGaussSum_eq_jacobiSym` (line 613), `ZLattice.level` (`Level.lean` line 113), `level_ratModel` (line 262), `TauCeti.IntegralLattice.IsEven.level_dvd_iff` (`LinearAlgebra/IntegralLattice/Level.lean` line 261), `ZLattice.representationNumber` (`Shell.lean` line 97), `modFormCharSpace`, `mem_modFormCharSpace_iff_nebentypus` (`NumberTheory/ModularForms/DiamondOperators.lean` lines 327, 356), `ModularForm.eq_of_sturm_bound` (`SturmBound.lean` line 78), `qExpansion_coeff_correctedE2` (`EisensteinSeries/WeightTwo/Basic.lean` line 157), `charE1MF`, `Gamma0_prime_index`, `conductor_kroneckerChar_dvd_iff` (`KroneckerSymbol.lean` line 433). The 261 library names on the *In Tau Ceti:* lines are each declared at the pin. The pin has no theta product formula for `orthSum`, no discriminant-group equivalence for it, no reciprocity, Milgram identity on the real model, closed form, conductor theorem, `Γ₀(N)` or `Γ(N)` law, and no `A₂` or `D₄` representation numbers: nothing in `Suggested.lean` is proved there.
- Cross-roadmap citations resolved on main: AnalyticNumberTheoryPartII §5.3g (line 619), ModularForms §0.1 (line 124) and Layer 6 (line 514), IntegralLattices 6D (line 2523) and its theta-series boundary (lines 188–203), the completed integral-lattices roadmap Layer 3 (line 258), and the five downstream consumers.
- The record: main's 8 layers and 44 items are present under their ids with their statements; the worked examples and boundary checks are kept; nothing changes outside the folder.
- Automatic checks: all passed on this head. Dependency check: `depcheck: 172 roadmaps, 2005 edges, 0 problem(s)`.
- Elaboration: `lake env lean TauCetiRoadmap/ThetaSeries/Suggested.lean` gives 10 `sorry` warnings and nothing else. One-tactic probe (`first | rfl | simp | infer_instance` on a copy): none of the 10 theorems closes. The elaborated types were compared with the README statements: each declaration carries `FiniteDimensional`, `DiscreteTopology`, `IsZLattice`, evenness and `finrank = 2k` in its own signature; none lost a binder; no `set_option`, no sorried data (`nebentypus` has a real body).
- Headlines: level one, `E₈`, Leech, the rank-16 pair and the Fricke identities are proved at the pin and named on *In Tau Ceti:* lines; reciprocity, Milgram, the closed form, the conductor theorem with the nebentypus, Hecke–Schoeneberg in both spellings, the coset series on `Γ(N)` and the `A₂`, `D₄` numbers are stated in `Suggested.lean`. None statable is absent; none is padding.
- The description against the head: the form paragraph, the lists of realised and open sections, the additions and the paragraph on `Suggested.lean` agree with the head; C01 is the one sentence that does not.

Overlap check: read HalfIntegralWeightModularForms, IntegralLattices (on main and its open revision), Rank24LatticeConstructions, SiegelModularForms, MaassForms, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass, ModularForms. Theta series, Poisson summation on a lattice and the real model: owner ThetaSeries, cited as such by each that mentions them (odd rank is HalfIntegralWeightModularForms', degree `g` SiegelModularForms', both excluded here). The rank-16 pair and Milgram at every signature: owner IntegralLattices, cited here. Character Eisenstein series, Sturm bound, Fricke operators: ModularForms or Tau Ceti, cited here. Partial Fourier transforms: AnalyticNumberTheoryPartII §5.3g, cited here. Nothing has two owners.

Source independence: 0 passages compared with 0 sources, because no cited source could be read legally; largest share Ebeling, *Lattices and Codes*, 6 of 19 locators; its table of contents could not be read. By the README's own account of it (References: Ch. 2 for theta series, Poisson summation and inversion, Ch. 3 for the general level and the examples), eight layers do not map one to one onto two chapters.

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic consume Layer 7 and LFunctions consumes Layer 1. Rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Seeded sample, source side (§5.2: Serre Ch. VII §6; §6.2: Milnor–Husemoller App. 4 and Turaev §1.3; §6.6: Ebeling Ch. 3; §7.3: Schoeneberg Ch. IX, Ebeling Ch. 3, Ogg Ch. VI; §8.6: Conway–Sloane Ch. 2 §2.3; the other sampled sections cite no source): Serre, Ebeling, Schoeneberg, Milnor–Husemoller, Conway–Sloane and Miyake resolve only to the publisher's paywalled pages; Turaev 1998 and Iwaniec resolve to publisher pages with no legal copy; Ogg has no copy the sources service finds. Each was asked for once; nothing else was tried.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, *Lattices and Codes*, has the largest share of the locators (6 of 19). Neither its text nor its table of contents could be read, nor any other cited source, so wording and arrangement were compared with no source.

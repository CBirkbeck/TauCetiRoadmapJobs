# Review of QuasiregularMaps (pull request #3034 at 7c7b748)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 315 changed lines since `de93025`. I checked every changed passage and the passages it affects: the rewritten locators into Martio–Rickman–Väisälä, Heikkilä–Pankka and Prywes against the texts at their printed pages, the new Wirtinger formulas of §1.5 and §2.10, the restated §2.3, the 18 SobolevMapsBetweenManifolds declarations and the TeichmullerGeometry, RiemannianGeometry and SobolevDifferentialForms citations as they are on `main`, the library names at the pins, and `Suggested.lean` (elaborated; signatures unchanged from `main`). There is no finding. One small correction and no format notes, none blocking; nothing is left for a human to decide.

## C01 — The Conventions bullet on smooth metrics restricts the local-isometry statement of §7.6 to smooth metrics, which that statement does not need

A reader of the bullet "Smooth metrics" (lines 114–117) takes the second statement of §7.6 to be made for smooth metrics only: "The statements of §7.6 about flat manifolds, local Riemannian isometries and descended metrics are for smooth metrics". That statement (lines 1480–1485) says that a local Riemannian isometry `ℝⁿ → N` makes `N` `1`-quasiregularly elliptic for each orientation, and it holds for continuous metrics: `TauCeti.IsLocalRiemannianIsometry` (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Local.lean`, line 70 at the pin) asks only for a Riemannian bundle on each side, §2.7 (lines 509–511) already makes orientation-preserving local Riemannian isometries `1`-quasiregular for continuous metrics, and the route of the bullet uses only §2.7 and §7.2. Only flatness and the descended metric (`Bundle.ContMDiffRiemannianMetric.quotient`) need a smooth metric.

Either change would do: drop "local Riemannian isometries" from the list in the Conventions bullet, or add there that the local-isometry statement of §7.6 is made for continuous metrics.

## Verified sound

`n` is the dimension; "MRV" is MartioRickmanVaisala1969, "HP" is HeikkilaPankka2025.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Summary: for closed `N`, ellipticity is the same for any two continuous metrics | `g' = 4g` on `N`; compact `N` | `‖Df‖' = 2‖Df‖`, `J' = 2ⁿJ`, quotient unchanged; in general `‖Df‖'ⁿ ≤ βⁿKJ ≤ (β/α)ⁿKJ'` | Pass | None |
| Conventions: chartwise null sets are the null sets of every positive continuous density | `ℝ` with weights `1` and `eˣ` | both strictly positive and continuous, same null sets; SobolevMapsBetweenManifolds §3.1 (its README lines 457–464) states it | Pass | None |
| Conventions: smooth metrics and §7.6 | local Riemannian isometry, continuous metric | `‖dπ‖ⁿ = 1 = J(dπ)`, so `1`-quasiregular by §2.7 with no smoothness | Narrower than needed | C01 |
| Conventions: flat metric of `ℝⁿ` | `EuclideanSpace ℝ (Fin 2)` | `Bundle.instIsContinuousRiemannianBundle (riemannianMetricVectorSpace _).toContinuousRiemannianMetric` elaborates as the stated instance | Pass | None |
| Sample §1.4, locators (2.23), (2.24) | `diag(2, 1)`; `diag(1, ε)` | `‖A‖_HS² = 5`, `q_S = 5/4`, `q_O = 2`, `5/4 ≤ 2 ≤ 5/2`; ratio `2/(1+ε²) < 2`; MRV lines 426–436, printed pp. 14–15 | Pass | None |
| §1.5: `a = (A1 − iAi)/2`, `b = (A1 + iAi)/2` | `A z = az + bz̄` | `A1 = a + b`, `Ai = i(a − b)`; `A1 − iAi = 2a`, `A1 + iAi = 2b`; `wirtingerDeriv` at `1` is `(Dg 1 − i Dg i)/2` (`Wirtinger/Basic.lean:66`) | Pass | None |
| §2.2 bullet: isometries and `C¹` factors, proved in §4.3–§4.4 | isometry `θ`, `K_θ = 1` | `K_O(f∘θ) ≤ 1·K_O(f)` and the same for `θ⁻¹`; §4.4 with `K' = 1` | Pass | None |
| Sample §2.3, for every map | discontinuous `f`; fold; `M = ∅`; identity | off the class: left set empty, `∞ ≤ K` false, right empty; fold: both empty; `∅`: `K_O = 1`, both `[1, ∞)`; identity: both `[1, ∞)` | Pass | None |
| §2.6 new *Needs:* | `(c(x₁), 0)`, `c` the Cantor function | `W^{1,1}_loc` would give `ACL` by §5.2, contradicting `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction` (`CantorFunction.lean:245`); §5.2 uses no Layer 2 | Pass | None |
| Sample §2.7 | `x ↦ −x`; `(x³, y)` | `J = (−1)ⁿ`; `q_O = max(3x², 1)²/(3x²) → ∞`, and `df = diag(0, 1)` with `J = 0` at `x = 0` | Pass | None |
| Sample §2.10, first two statements | `z + z̄/2`, `K = 3`; `K = 1`; constant | `k = 1/2`, `1/2 ≤ (1/2)·1`, `K_O = (3/2)/(1/2) = 3`; `K = 1`: `k = 0`, `f_z̄ = 0`; constant: `k₀ = 0`, `K_O = 1` | Pass | None |
| §2.10: weak and classical Wirtinger derivatives agree a.e. | `f = id` with `Du(0)` changed to `0` | formula gives `0` at `0`, `wirtingerDeriv id 0 1 = 1`; differ on a null set only, as stated | Pass | None |
| §2.10, third statement; TeichmullerGeometry contract | `z + az̄`, `|a| < 1` | `μ = a`; `(1+|a|)/(1−|a|)` equals the `q_O` of §1.5; §7.4 on `main` (README line 743) has these formulas and this dilatation | Pass | None |
| Sample §3.3 | projection of `ℝ²`; `n = 1` | `DP = diag(1, 0)`: `J = 0 = ℓⁿ`, `‖DP‖² = 1 > K·0`; `n = 1`: `P = 0`; MRV lines 423–425, printed p. 14 | Pass | None |
| §3.2 and both Lean theorems, (2.25) | `diag(2,1,1)`; `diag(1,1,1/2)`; `n = 1` | `q_O = 4`, `q_I = 2 ≤ 16`, `4 ≤ 2²` equality; `q_O = 2`, `q_I = 4 = 2²`; `n = 1`: `K⁰ = 1`; MRV orders (2.25) as the docstrings say | Pass | None |
| Sample §4.1 | conformal change `e^{2u}`, `e^{2w}` | `‖A‖' = e^{w−u}‖A‖`, `J' = e^{n(w−u)}J`, `q'_O = q_O`; HP §1, p. 1 (lines 20–27) | Pass | None |
| Sample §4.2 | identity `(ℝ², std) → (ℝ², −std)` | `J = −1`; quasiregular for both signs forces `‖Df‖ⁿ ≤ KJ` and `≤ −K'J`, so `Df = 0` | Pass | None |
| Sample §4.3 | `θ = R` a reflection, `f = id` | `J = −1`, not quasiregular: orientation hypothesis used | Pass; Rickman1993 uncertified | None |
| Sample §4.4 | radial stretches `a = 2` after `a = 1/2` in `ℝ³` | `K_O = a² = 4` and `1/a = 2`; `y = |x|^{−1/2}x`, `|y|y = x`; `1 ≤ 8` | Pass; Rickman1993 uncertified | None |
| Sample §5.1, locators | MRV 2.1 and 2.16 | formal derivative, `J(x, f)`, `ℓ(T)` at lines 118–127 (printed p. 7); 2.16 at lines 332–340 (p. 12): open intervals, `p ≥ 1`, as the README says | Pass | None |
| §5.3, locators | MRV 2.20, (2.21) | `ACLⁿ` and `|f'|ⁿ ≤ KJ` at lines 409–411; `K`-quasiregular means `K(f) ≤ K` at line 418; `∞` off the class at 418–419 | Pass | None |
| Sample §6.3 | HP Lemma B.2 | closed `M`, `W^{1,∞}`, Stokes with corners, lines 1255–1316, pp. 23–24, as the README says | Pass | None |
| §6.2, §6.4, §7.7, locators | HP Proposition B.1 | closed `M`, `N`, `n ≥ 2` (lines 1247–1251); proof with the `ϕᵢ` on p. 24 (lines 1317–1339) | Pass | None |
| Sample §7.1 and its new *Needs:* | isometry of `N`; of `ℝⁿ` | §4.4 with `K' = 1`; §4.3 with `K_θ = 1`; HP p. 1 (lines 20–21), p. 6 (lines 271–273); Prywes2019 p. 1 (lines 22–27) | Pass | None |
| Sample §7.3 | `α|w| ≤ |w|' ≤ β|w|` | `‖Df‖' ≤ β‖Df‖`, `J' ≥ αⁿJ`, factor `(β/α)ⁿ`; HP Theorem 1.1 fixes no metric (line 18) | Pass | None |
| Sample §7.5 | antipodal map of `Sⁿ`; `ℤ` on `ℝ²` by `(x+k, (−1)ᵏy)` | degree `(−1)ⁿ⁺¹`; `det diag(1, −1) = −1`, no descended orientation | Pass; Lee2012 uncertified | None |
| Sample §7.6 with `killingHopf_euclidean` | `ℝⁿ/ℤⁿ`; Klein bottle | `J_π = 1`, `K_O = 1`; glide reflection has `det = −1`, excluded; `killingHopf_euclidean` at RiemannianGeometry `Suggested.lean:402`, README line 1785 under R4 item 7 | Pass | None |
| Downstream consumers: Part III and forms | the two roadmaps on `main` | SobolevMapsBetweenManifolds lists "Sobolev spaces of differential forms" as outside (README line 1738); SobolevDifferentialForms works on open `Ω ⊆ ℝⁿ` (line 10) | Pass | None |
| SobolevMapsBetweenManifolds contract, Lean names | all 18 | each declared in its `Suggested.lean` on `main` (lines 71–406); §4.6 (a) is for submersions and names both declarations, §5.1 is for tangent norms | Pass | None |
| Module docstring, not statable | pins | no `IsSobolevMap`, `HasWeakMFDeriv` in Mathlib or Tau Ceti at the pins; §2.3 and §2.1, §2.2, §7.1 need that class | Pass | None |

- Source locators checked against the text: 24, in three sources. MartioRickmanVaisala1969: 2.1 (p. 7), 2.16 (p. 12), 2.20 with (2.21)–(2.23) (p. 14), (2.24), (2.25), "best possible", Lemma 2.26 (p. 15); printed page is scan page plus one, by the running heads (scan pages 9, 11, 13, 15 are headed 10, 12, 14, 16). HeikkilaPankka2025: p. 1, p. 2, §1.1, p. 6, Appendix B pp. 23–24. Prywes2019: pp. 1–2.
- Library declarations opened at the pins: `TauCeti.wirtingerDeriv`, `TauCeti.conjWirtingerDeriv` (`Analysis/Complex/Wirtinger/Basic.lean` 66, 80); `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction` (245); `TauCeti.IsLocalRiemannianIsometry` (`Isometry/Local.lean` 70); `isLocalRiemannianIsometry_descend` (`Pullback/Descent.lean` 189); Mathlib `riemannianMetricVectorSpace`, `Bundle.ContMDiffRiemannianMetric.toContinuousRiemannianMetric`, `Bundle.instIsContinuousRiemannianBundle`, `essSup_le_of_ae_le`, `ae_le_essSup` (by `#check`). The pinned Tau Ceti has no `Wirtinger/Weak.lean` and no `Beltrami` directory, as the description says.
- Cross-roadmap citations resolved on `main` (`62f96b5`): SobolevMapsBetweenManifolds §1.2, §3.1, §3.3, §4.2–§4.6, §5.1–§5.3, §6.1–§6.3, §7.1 and the 18 names; TeichmullerGeometry §7.4; RiemannianGeometry R4 item 7; SobolevDifferentialForms. No open pull request changes this roadmap or drops a cited id.
- Automatic checks: every check passed on this head. Dependency check: `depcheck: 124 roadmaps, 1402 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives five `declaration uses sorry` warnings (lines 94, 110, 164, 181, 195) and nothing else. The 10 declarations and their signatures are those on `main`; only docstrings changed. `#check @` compared with README §1.1, §2.9, §3.2, §5.1–§5.3: no binder lost.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `infer_instance`, `exact?`): none of the five theorems closes.
- Record: the README at `de93025` and at the head have the same seven layers and subsections with the same ids and titles; no item is removed. No file outside the folder changes. No "line N" locator remains in either file.
- Previous review (same head): no finding; its one small correction is C01 above, still open. The pull request's title and description agree with the head item by item.

Overlap check: read SobolevMapsBetweenManifolds, TeichmullerGeometry and RiemannianGeometry (main); the Sobolev class, weak differential and oriented Jacobian are owned by SobolevMapsBetweenManifolds, which names QuasiregularMaps as owner of quasiregular maps and of locally Lipschitz membership (its README lines 1656, 1727); weak Wirtinger derivatives and planar quasiconformal maps are owned by TeichmullerGeometry §7.4 and cited here; nothing else shared. The open DifferentialGeometry, GeometricMeasureTheory, ComplexManifolds, PlanarTopology and TangentialBordism were not read in full: the change adds no object.

Source independence: changed passages only; 12 passages compared with 3 sources (MartioRickmanVaisala1969, HeikkilaPankka2025, Prywes2019), none shared beyond formulas and standard terms; largest share MartioRickmanVaisala1969, 26 of 69 mentions of the four most cited sources; contents not compared, since no layer is added, removed or reordered.

Research link: Layers 2 and 7 state the definitions under which Bonk–Heinonen (2001) and Prywes (2019) bound the de Rham cohomology of closed quasiregularly elliptic manifolds, answering Gromov (1981), and Heikkilä–Pankka (2025) embed the de Rham algebra in `⋀*ℝⁿ`; §7.6–§7.7 are their torus examples. Rests on the README and on HeikkilaPankka2025 §1 and Prywes2019 §1, both read.

## Not verifiable

- Rickman1993, Vaisala1971, Ahlfors2006 and Lee2012 are settled as uncertified and cited by locator only; they stand behind the sampled §1.5, §2.7, §4.3, §4.4 and §7.5, whose mathematics I computed instead. This revision changes none of their locators.
- Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981 and Gromov1999 are settled as uncertified; none of their locators changes.

## Source issues

- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24: the source says the Nash embedding composed with the piecewise linear map, written in the order that does not compose, is Lipschitz; it should be `ι ∘ p : M → ℝᵐ`; affects the proof.
- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24: the source says the distortion bound has the minimum of the Jacobian of `ϕ` without its simplex index; it should be the minimum over `κ(σᵢ)` of `det Dϕᵢ`; affects the proof.

## For the human reviewers

- none

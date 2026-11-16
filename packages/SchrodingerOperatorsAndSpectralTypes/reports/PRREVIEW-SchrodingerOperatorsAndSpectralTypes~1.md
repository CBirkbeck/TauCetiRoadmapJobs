# Review of SchrodingerOperatorsAndSpectralTypes (pull request #2424 at 9710150)

**Verdict:** needs changes

## R01 (P3) — The description overstates what the roadmap extends from UO-E06

**Location:** Pull request description, second prose paragraph: "It extends the three-dimensional `L² + L^∞` case of UnboundedOperators and the congruence-surface case of CongruenceSpectralGap to the general statements."

**Claim:** The head extends only the bounded-potential part of UO-E06 to other dimensions. Potentials with an `L²` part outside `ℝ³` are excluded.

**Witness:** `TauCetiRoadmap/SchrodingerOperatorsAndSpectralTypes/README.md` lines 150–151 exclude "potentials in `L^p` or in the Kato class outside the three-dimensional `L² + L^∞` case of UO-E06". Section 4.4 (line 1855) assumes `ess sup |V| < ∞`.

**Repair:** Replace the sentence with: "It extends the self-adjointness and `C_c^∞`-core clauses of UnboundedOperators UO-E06 from bounded potentials on `ℝ³` to bounded potentials on every `ℝ^d`, `d ≥ 1`; potentials with an `L²` part stay with UO-E06 in dimension three. It also extends the essential self-adjointness and kernel statements of CongruenceSpectralGap §0.2 from congruence surfaces to every complete Riemannian manifold."

## R02 (P3) — The description calls roadmaps consumers that are not

**Location:** Pull request description, Dependencies paragraph: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README also names CongruenceSpectralGap and MaassForms. Neither is on main, neither is in the merge order, and neither consumes this roadmap.

**Witness:** README lines 141–149 compare against CongruenceSpectralGap §0.2 and §0.6 ("None of these is restated here"). Line 209 cites MaassForms §0.1 only for the sign of the Laplacian. `roadmaps grep` finds no roadmap that cites SchrodingerOperatorsAndSpectralTypes.

**Repair:** Replace the paragraph with: "Dependencies: the suppliers that are still open pull requests are QuantumFoundations (§8.2) and AutomorphicSpectralTheory (§0.8), both in the merge order below; roadmaps on main are cited by name. CongruenceSpectralGap (§0.2, §0.6) and MaassForms (§0.1) are named only for comparison: the congruence case of 3.6–3.7 and the sign of the Laplacian. They are neither suppliers nor consumers. No roadmap consumes this one yet."

## Verified sound

| Target | Instances tried | Statement side (computed) | Other side (computed) | Result |
|---|---|---|---|---|
| 1.1 `IsSpectralMeasureOf` | `A = 2` with `δ₂`, `δ₃`; `A = i` at `z = 2i` | `(i − 2)⁻¹ = (−2 − i)/5`; for `A = i` the left side is `−i` | `δ₃` gives `(−3 − i)/10`; right side's imaginary part lies in `[−1/2, 0)` | holds; kernel sign pinned |
| 1.2 `diag_spectralType_components` | `M_x ⊕ diag(1/2)`, `f = (1, 1)`; Cantor `c` | `μ_f = Leb|[0,1] + δ_{1/2}`, atom set `{1/2}` | restrict gives `δ_{1/2} = μ_{f_pp}`; for `c`: singularPart `c`, pp part `0` | holds; type hypotheses force pairwise `⟂ₘ` |
| 1.4 `acSpectrum`, `perfect_acSpectrum_and_mem_iff` | `ℋ = 0`; `diag(q_n)`; `M_x` on `L²[0,1]` | `ℋ = 0`: `σ_ac = ∅`, `Perfect ∅`; `diag(q_n)`: every ac part `0` | right side false for `f = 0`; `M_x`: `[0,1]` closed, no isolated point | holds |
| 1.5 `Icc_subset_acSpectrum_iff` (sample) | `a = b`; `M_x` on `L²([0,1] ∪ [2,3])`; fat Cantor `K` | `a = b`: right side vacuously true, `{a} ⊆ ∅` false | density `1` on `[0,1]`: both true; on `(1,2)` mass `0` both | holds for `a < b`; teschl line 4326, Lemma 3.15, p. 104 |
| 1.6 `minMax_principle` | `ℋ = 0`; `0` on `ℂ`; `diag(1,3,5)` with `c = 4`; `−diag(n)` | all `⊤`; `(0, ⊤, …)`; `(1, 3, 5, ⊤)`, count `2` | finrank `0`; `1`; `2`; without `γ`: count `∞`, finrank `0` | holds; `γ` needed |
| 1.7 wave operators (sample) | `H₁ = H₂`; `0` vs `1` on `ℂ`; `M_x` vs `M_x + c` | `D = ℋ`; `e^{it}ψ` converges iff `ψ = 0`; `e^{itc}` | `Ω = 1`; `D = 0`; `D = 0` | holds; teschl lines 10585–10620 match |
| 1.8 Rosenblum's lemma | `M_λ`, `x = m·1_{[0,1]}`, rank-one `C` | `∫ |⟨φ, e^{−itλ}x⟩|² dt = 2πm²` | bound `2πm²·‖C‖²_HS = 2πm²` (kato57 line 96) | equality; factor `2π` pinned |
| 1.9 `pearson_tendsto` (sample) | `J = 0`; `J` the inclusion into `L² ⊕ ℂ`; `H₂ = 2M_x` | `C = 0`: limit `0`; `C = 0`: constant `Jx` | `2M_x`: weak limit `0` at norm `1`; excluded, `C` unbounded | holds; yafaev04 line 193, Theorem 1.8 |
| 1.9 `katoRosenblum` (sample) | `V = 0`, `diag(1,2)`; `diag(1/n²)`, `V = −diag(1/n²)` | `W = 0` while `Ω = 1`; `H₂ = 0` | `e^{−it/n²}c_n` diverges, so `D = 0`; `ℋ_ac = 0` on both sides | holds; kato57 lines 21–35 |
| 2.1 bottom of spectrum (sample) | `A = 2` on `ℂ`; `H₀ + c` with Gaussians | conditions hold iff `γ ≤ 2`; `λ₀ = 2` | `‖u'‖² = π/(n√2)`, `‖u‖² = n/√2`, quotient `c + π/n² → c` | holds; teschl line 5044, Theorem 4.10 at `n = 1` |
| 2.3 `katoRellich_lowerBound_hasCore` | `A = 2, V = 1, γ = 2`; scalar `V = −(a + b|λ|)`; `a = 1, b = 1/2, γ = 0` | bound `1 ≤ 3`; `λ − b|λ|` nondecreasing | bound `−2`; Teschl's printed bound fails (`−1.028 < −1`) | holds in Kato's form |
| 3.1 complex Laplacian (sample) | `‖x‖²` on `ℝ^d`; `y^s` on `ℍ`; `e^{inθ}` on circle | `−2d`; `s(1 − s)y^s` | library gives `2d`; Green `2πn² = 2πn²`, without conjugation `0` | holds |
| 3.2 initial operator (sample) | `(0,1)`; discrete `X` | `e^{±x} ∈ ker(Δ₀† + 1)` | deficiency `(2,2)`; `Δ₀ = 0`, closure `0` on `ℓ²` | holds; bms02 lines 151–157 |
| 3.3 maximal operator (sample) | `e^{−|x|}` on `ℝ`; `χ/|x|` on `ℝ³` | `Δu = −u + 2δ₀ ∉ L²` | `Δu = 4πδ₀` + smooth (Mathlib sign gives `−4πδ₀`) | holds; bms02 line 179, Theorem 2.3 |
| 3.4 Friedrichs Laplacian (sample) | `(0,1)` | `1 ∈ H¹ ∖ H¹₀` (Poincaré bound `π⁻¹` fails for `1`) | Dirichlet `n²π²`, `n ≥ 1`; Neumann from `n ≥ 0` | holds; teschl lines 2914, 2960 |
| 3.6 `gaffney_isSelfAdjoint_closure` (sample) | route (a), (b); `ℝ⁴ ∖ 0`; dimension `0` | `∫χ²|du|² ≤ 2‖Δu‖‖u‖ + 4 sup|∇χ|²‖u‖²` (Young, factor ½) | `∫χ_k²|u|² ≤ 32k⁻²‖u‖² → 0`; `∫|x|⁻⁴ = ∞` | holds; bms02 line 245, Corollary 2.10; connected, line 128 |
| 3.7 `exists_mem_domain_closure_eq_zero_iff` (sample) | `⊔ S¹_j`; `ℝ`; a point | `ker ≅ ℓ²`, Hilbert dimension `ℵ₀` (Hamel `2^ℵ₀`) | `λ₁⁺ = 1 ≠ 0 = λ₁`; on `ℝ`: `0 = 0`; point: `⊤ = ⊤` | holds; hm23 lines 41–43 |
| 3.9 `laplacian_add_potential_isSelfAdjoint_closure` (sample) | circle with `V = 1`, `V = 1_{[0,π)}`; one point, `s = 1` | eigenvalues `n² + 1` from `1`; Rayleigh quotient of `1` is `1/2` | smooth eigenfunction gives `u(0) = u'(0) = 0`, so `u = 0`; `T = i`, `i + i⁻¹ = 0` | holds |
| 3.10 `Ici_quarter_subset_essentialSpectrum` (sample) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `‖u_n‖² = wn‖ψ‖²`; `Δ(y^{1/2}f) = y^{1/2}(1/4 − ∂_r²)f` | residual ratio `≤ (2|t|‖ψ'‖/n + ‖ψ''‖/n²)/‖ψ‖`; `3·2^j < 2^{j+2}` | holds; lp80 lines 251–256 |
| 3.10 `IsStandardCuspEnd`, `cuspRegion` | `⟨z ↦ z + 1⟩\ℍ` at widths `1`, `2`; metric instance | width `1` chart valid; width `2` identifies `(0,y)`, `(1,y)` | instance is restriction of `UpperHalfSpace` metric (`(dx² + dy²)/y²`) | holds |
| 4.1 four descriptions of `H²` (sample) | Gaussian, `d = 1`; `1_{[−1,1]}` | `‖u''‖² = 3π²2^{−1/2}`; `‖ξ²𝓕u‖² = 3·2^{−1/2}/(16π²)` | ratio `16π⁴`, so `‖Δu‖ = 4π²‖ξ²𝓕u‖`; `𝓕u = sin(2πξ)/(πξ)` | holds; teschl lines 7086–7092 |
| 4.2 free Laplacian | Gaussian, `d = 1` | `dμ/dλ = e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2}` | `‖ψ‖² = 2^{−1/2}`; `q(u) = π/√2`, quotient `π` | holds |
| 4.3 local compactness (sample) | resolvent identity at `s = 0`, `s = 1`; `V = 1` | `(0 − i)⁻¹ = i`; `(1 − i)⁻¹ = (1 + i)/2` | right side `i`, `(1 + i)/2`; the sign slip gives `2 − i`; `σ((H₀+1)⁻¹) = [0,1]` | holds; teschl line 7213, Lemma 7.11, p. 170 |
| 4.4 `schrodinger_isSelfAdjoint_closure` (sample) | `V = −1_{[−1,1]}`, `d = 1`; `V = 1`; `d = 0` | `k = 0.739`: `k tan k = 0.6735` | `√(1 − k²) = 0.6737`, `E ≈ −0.454 ≥ −1`; `σ_ess = [1,∞)`; `d = 0`: `∅` | holds; teschl line 9578, Theorem 10.2, p. 222 |
| 4.5 quasi-periodic potentials | `ω = (1, √2)` | `V = cos x + cos √2x`, real, `|V| ≤ 2` | `ess inf V = −2`, never attained (`√2` irrational) | holds |
| `essentialSpectrum` | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)` | `∅`; `{0}`; `{0}` | same formula as UnboundedOperators `Suggested.lean` lines 168–178 | holds; no fully qualified name clash |

- Source locators checked against the cached text: 57, all at their lines (teschl 27, kato57 7, yafaev04 6, bms02 6, hm23 4, lp80 3, rosenblum57 2, kps26 2). That covers all 15 seeded targets. 11 Teschl page numbers match the page markers.
- Library declarations opened at the pins: 20. Examples: Mathlib `LinearPMap.HasCore` (`Topology/Algebra/Module/LinearPMap.lean:141`) and `TemperedDistribution.MemSobolev` (`Analysis/Distribution/Sobolev.lean:153`). Tau Ceti `TauCeti.ProjValMeasure` (`ProjValMeasure/Basic.lean:91`), `LinearPMap.IsRelativelyBounded` (`RelativeBound.lean:56`), `ContinuousLinearMap.nuclearENorm` (`Nuclear/Basic.lean:53`), `TauCeti.riemannianVolume` (`VolumeDensity/Volume.lean:82`) and `TauCeti.IsLocalRiemannianIsometry` (`Isometry/Local.lean:70`). A further 28 cited names were found in the files the README names.
- Cross-roadmap citations resolved: 72.
  - On main: 28 SelfAdjointSpectralTheory ids and 13 UnboundedOperators ids, with content read for SA-B85 (its `C₀(X)` case), SA-E05, SA-E44, UO-A02, UO-C02, UO-C03, UO-D06 and UO-E04–E06; 25 further sections.
  - At their open heads: QuantumFoundations §8.2, CongruenceSpectralGap §0.2 and §0.6, AutomorphicSpectralTheory §0.8 and §1.16a, MaassForms §0.1.
- Declared gaps: `weyl-criterion` and `spectral-integral-resolvent` match `plan.json`.
  - Neither asks for something already provided: UO-C02 uses Weyl's criterion only inside a proof.
  - UO-A02 inverts `z − A` only for `P = P_A`.
- Gate: every check 0, OK. Dependency check output: `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no other message. `#check @` on all 19 declarations gives types that match the README statements, with no lost binder.
- Padding probe: `first | rfl | simp | infer_instance` closes none of the 12 theorems.

Overlap check: read UnboundedOperators, SelfAdjointSpectralTheory, VariationalMethods (main), the SelfAdjointSpectralTheory revision, CongruenceSpectralGap, QuantumFoundations, AutomorphicSpectralTheory, SchattenClassesAndSchurMultipliers (open). Each shared object has one owner, cited here:
- essential spectrum: UnboundedOperators UO-C02;
- spectral-type subspaces: UO-C03;
- free Laplacian: QuantumFoundations §8.2;
- square-integrable kernels: AutomorphicSpectralTheory §0.8;
- congruence-surface Laplacian: CongruenceSpectralGap §0.2, a special case;
- compact-pair min–max: VariationalMethods 4.4, a different object.

Source independence: 24 passages compared with 8 sources, plus 5 roadmap-only passages (Conventions, 3.5 route, 3.8 eigenspace identity, the `pearson_tendsto` docstring, the 4.4 route). None is shared. Largest share is teschl, with 40 of 98 locators. The layers were compared with teschl's contents and are independent: Layer 1 draws on Ch. 3, 4 and 12, Layer 3 has no counterpart, and Layer 4's order is forced by its *Needs:* lines.

## Not verifiable

- `strichartz83` Theorem 2.4, `chernoff73`, `gaffney54` (3.5, 3.6): settled as uncertified; locator only.
- `grigoryan09` Ch. 3, 4, 11 (3.1, 3.4, 3.5, 3.6): settled as uncertified.
- `rs1` §VII.2; `rs2` Ch. IX, §X.1, §X.2, Theorem X.12; `rs3` §XI.3, Theorems XI.7–XI.8: settled as uncertified.
- `kato76` Ch. V §4.1, Ch. X §4.4; `pearson78`; `cfks87` Ch. 1: settled as uncertified.
- `chavel84` Ch. I; `iwaniec02` Ch. 4, 7, 11; `lp76` Ch. 1, 8: settled as uncertified.
- `rosenblum57` §§3–4 and `lp80` §§4–7: whole sections, not opened beyond the lines checked.

## Source issues

- **Error** in teschl at Theorem 6.4, (6.3), p. 135: the source says the Kato–Rellich lower bound is `γ − max(a|γ| + b, b/(a − 1))`, so the second term never matters; it should be `b/(1 − a)`, as Lemma 6.3's estimate gives, the printed form failing for `A = diag(0,1)`, `B = −[[0.97, 0.22], [0.22, 1.2]]`, `a = 1/2`, `b = 1`; affects a stated result.
- **Misprint** in teschl at the proof of Theorem 6.4, p. 135: the source factors `A + B ± iλ` as `(I + B R_A(±iλ))(A ± iλ)`; with `R_A(z) = (A − z)⁻¹` it should be `R_A(∓iλ)`; affects the proof.

## For the human reviewers

- Merge coordination: Layer 4 consumes QuantumFoundations §8.2. That is an open pull request by another author (#1771), yet the generated merge-order block of the description says the roadmap "depends on no other author's open pull request".

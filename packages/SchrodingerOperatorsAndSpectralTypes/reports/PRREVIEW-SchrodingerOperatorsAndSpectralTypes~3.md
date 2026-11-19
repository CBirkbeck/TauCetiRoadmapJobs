# Review of SchrodingerOperatorsAndSpectralTypes (pull request #2424 at 02dfa40)

**Verdict:** accepted

**Summary.** Accepted: no stated result, Check or route sentence was found false, and every one of the thirteen `Suggested.lean` theorems agrees with its README statement and survives the one-tactic probe. The new section 3.11 (decomposition principle, `σ_ess = [1/4, ∞)` for a compact set plus finitely many cusp ends) was recomputed step by step and holds. There are three small corrections (the pull-request description predates 3.11; one pointer in the Worked examples; one parenthesis in the route of 1.6) and one format note, none blocking. The acceptance is conditional on the two declared supplier gaps; the human reviewers are asked about the open supplier and the uncertified sources.

## C01 — The description was written before section 3.11 and its theorem existed

A reader of the description does not learn that the roadmap now proves the equality `σ_ess(Δ_X) = [1/4, ∞)`, and is told a count and a supplier status that the head contradicts. Three sentences: "`Suggested.lean` states twelve headline theorems" (the file has thirteen; `essentialSpectrum_eq_Ici_quarter` is the added one); "shows that a hyperbolic cusp end forces `[1/4, ∞) ⊆ σ_ess`" (the head also has 3.11: the decomposition principle and the equality when `X` is a compact set with finitely many disjoint cusp ends); "Two suppliers are open pull requests that must merge first … and AutomorphicSpectralTheory" (AutomorphicSpectralTheory and CongruenceSpectralGap are on main now; QuantumFoundations is the only open supplier, and MaassForms the only open roadmap named for comparison).

Text that would be right: "thirteen headline theorems"; after the cusp sentence, "and that `σ_ess(Δ_X) = [1/4, ∞)` when `X` is a compact set together with finitely many pairwise disjoint cusp ends (section 3.11, by the decomposition principle and Hardy's inequality)"; "One supplier is an open pull request that must merge first: QuantumFoundations (§8.2)".

## C02 — The Hide–Magee worked example cites Layer 3's Examples for a decomposition those Examples give only for congruence quotients

In the Worked examples (README line 1678) the sentence "`X` is a compact set together with finitely many standard cusp ends (Layer 3, Examples)" is about an arbitrary finite-area noncompact hyperbolic surface, but Layer 3's Examples (lines 1412–1426) present only `Γ\ℍ` for a congruence `Γ` with torsion-free image, through FuchsianOrbifolds Layer 3. The Downstream consumers paragraph (lines 1659–1665) itself lists the thick–thin decomposition of a general finite-area surface among the inputs "beyond this roadmap". The mathematics is true; the pointer does not supply it, so an implementer following it finds the hypothesis of 3.11 unproved for Hide–Magee's `X`.

Smallest change: "by 3.11, once `X` is presented as a compact set together with finitely many standard cusp ends (the thick–thin decomposition named under Downstream consumers; Layer 3, Examples, gives it for congruence quotients)".

## C03 — In the route of 1.6, finite-dimensionality of `ran P_A((−∞, λ))` is credited to UO-C02 alone

In the route of 1.6 (line 432) the parenthesis "(always for `λ < inf σ_ess(A)`, by UO-C02)" needs the lower bound of `A` as well: the section's own last Check, `A = −diag(n)` on `ℓ²`, has `σ_ess = ∅` and `ran P_A((−∞, 0))` infinite-dimensional. The section's standing hypothesis (bounded below) and the next paragraph (compactness of `σ(A) ∩ (−∞, c]` for `A ≥ γ`) make the statement true as used, so no result is affected; the Glazman lemma just before it is stated "for a self-adjoint `A`" without the bound, which is where a reader could carry the parenthesis too far. Smallest change: "(always for `λ < inf σ_ess(A)` when `A` is bounded below, by UO-C02 and the compactness argument of the next paragraph)".

## N01 — Six lines of `Suggested.lean` exceed 100 characters

Lines 63, 85, 254, 281, 360 and 421 (three of them the instance binders `[IsContinuousRiemannianBundle …] [IsRiemannianManifold I M] [CompleteSpace M] …` at 160 characters); `laplacian_add_potential_isSelfAdjoint_closure` already breaks the same binders across two lines.

## Verified sound

| Target | Instances tried | Statement side (computed) | Other side (computed) | Result |
|---|---|---|---|---|
| 1.1 `IsSpectralMeasureOf` (sample) | `A = 2` on `ℂ`, `δ₂`, `δ₃`, `z = i`; `A = i`, `z = 2i` | `(i − 2)⁻¹ = (−2 − i)/5`; `R_A(2i) = −i` | `δ₃`: `(−3 − i)/10`; `Im (2i − s)⁻¹ = −2/(s² + 4) ∈ [−1/2, 0)` | holds; teschl line 3983–3992, p. 96 |
| 1.2 `diag_spectralType_components` (sample, headline) | `M_x ⊕ 1/2`, `f = (1,1)`; cross terms ac/sc/pp | `μ_f = Leb|[0,1] + δ_{1/2}`; atoms `{1/2}` | `|μ_{x,y}(B)|² ≤ μ_x(B)μ_y(B)` vanishes on a carrier null for the other measure | holds; teschl line 4388–4419 |
| 1.3 reduced restriction (sample) | `diag(1,2,3)`, `U = span(e₁,e₃)`; `U = 0` | compression `δ₁, δ₃`, `σ = {1,3}` | unrestricted `P_A` gives `{1,2,3}`; `U = 0`: `∅` | holds; teschl line 3282–3304, 4945–4946 |
| 1.4 `perfect_acSpectrum_and_mem_iff` (headline) | `ℋ = 0`; `diag(q_n)`; isolated `t` | `∅` perfect; `σ_ac = ∅`; ac `μ_f({t}) = 0` | support of `μ_{P(I)f}` meets `I ∖ {t}`, each point in `σ_ac` | holds |
| 1.5 `Icc_subset_acSpectrum_iff` (sample, headline) | `a = b`, `A = 0`; `M_x` on `L²([0,1] ∪ [2,3])` | `a = b`: left false | right vacuous; `(1,2)` mass `0`, subintervals of `(0,1)` mass `> 0` | holds for `a < b`; teschl line 4326–4332 |
| 1.6 `minMax_principle` (sample, headline; C03) | `ℋ = 0`; `diag(1,3,5)`, `c = 4`; `−diag(n)` | all `⊤`, count `0`; `(1,3,5,⊤)`, count `2`; all `−∞` | finrank `0`; `2`; infinite sum, `finrank` junk `0 ≠ ∞`: `hγ` needed | holds; teschl line 5044–5069 |
| 1.7 wave operators (sample) | `H₁ = H₂`; `0, 1` on `ℂ`; Hardy space under `e^{−isx}` | `Ω = 1`; `e^{it}ψ` converges iff `ψ = 0` | Fourier support moves to `[−s/2π, ∞)`: invariant iff `s ≤ 0` | holds; teschl line 10585–10620 |
| 1.8 Rosenblum's lemma (sample) | `M_λ`, `x = m·1_{[0,1]}`, rank-one `C`; `|λ|^{−1/4}1_{[−1,1]}` | `∫|⟨φ, e^{−itλ}x⟩|² dt = 2πm²`; tail `∫_{|λ|<m⁻⁴}|λ|^{−1/2} = 4/m²` | bound `2πm²·1`; kato57 line 96 has `2πm²‖A‖²` | equality; `2π` right |
| 1.9 `pearson_tendsto` (headline) | `J = 0`; inclusion `L² → L² ⊕ ℂ`; direct-sum reduction | `C = 0`, limit `0`; `⟨xψ₁,φ⟩ − ⟨ψ₁,xφ⟩ = 0`, constant `Jx` | reduction: `⟨H₂ψ₂,Jφ₁⟩ − ⟨ψ₂,JH₁φ₁⟩ = ⟨ψ₂,Cφ₁⟩` | holds; yafaev04 line 193 |
| 1.9 `katoRosenblum` (headline) | `V = 0` on `diag(1,2)`; `M_x + c`; `M_x, 2M_x`, `x = 1_{[0,1]}` | ac subspaces `0`; `e^{itc}` no limit | `c·1` not trace class; `(e^{it} − 1)/(it) → 0`, norm stays `1` | holds; kato57 line 21–35 |
| 2.2 bounded perturbations (sample) | `diag(0,1) + diag(1,−1)`; `V = c` | `λ₀(A + V) = 0` | `0 + (−1) ≤ 0 ≤ 0 + 1`; `c`: equality | holds; teschl line 5704–5711 |
| 2.3 `katoRellich_lowerBound_hasCore` (sample, headline) | `a = 1, b = 1/2, γ = 0`; scalar `A = λ`, `V = −(a + b|λ|)`; `b = 0` | bound `−2`; `sup_{λ≥γ}|λ|/(λ − μ) = max(1, |γ|/d)` | minimum `γ − a − b|γ|` at `λ = γ`; `a/d + b·max < 1` iff `d > max(a/(1−b), a+b|γ|)` | holds; teschl line 5709–5711 prints `b/(a − 1)` |
| 3.4 Sobolev, Friedrichs (sample) | `(0,1)`; `𝔞(iu, v)` | `1 ∈ H¹ ∖ H¹₀` (Poincaré `‖u‖ ≤ π⁻¹‖u′‖` fails for `1`) | Dirichlet `n²π²`, `n ≥ 1`; Neumann `n ≥ 0`; `𝔞(iu,v) = −i𝔞(u,v)` | holds; teschl line 2914–2917, 2960–2966 |
| 3.5 Gaffney cutoffs (sample) | step `φ`; `(0,1)` | rise `1` over `3/4`: slope `4/3 < 2`; `|grad χ_k| ≤ 2·(2/k)` | `(0,1)`: `1 ≤ (4/k)(1/2)` fails for `k > 2` | holds |
| 3.6 `gaffney_isSelfAdjoint_closure` (sample, headline) | Young in (a), (b); `ℝ⁴ ∖ 0` | (a) `∫χ²|du|² ≤ 2‖Δu‖‖u‖ + 4 sup|∇χ|²‖u‖²` | (b) `∫χ²|u|² ≤ sup|∇χ|²‖u‖² ≤ 16k⁻²‖u‖²`; `∫_{|x|<1}|x|⁻⁴ = ∞` in `ℝ⁴` | holds; bms02 line 245–246, connected at 128–129 |
| 3.7 `exists_mem_domain_closure_eq_zero_iff` (headline) | `⊔ S¹_j`; a point; `ℝ` | `∫ conj(Δφ)·1_{X_j} = 0` per component | `λ₁⁺ = 1 ≠ 0 = λ₁`; point `⊤ = ⊤`; `ℝ`: `0 = 0` | holds; hm23 line 41–43 |
| 3.9 `laplacian_add_potential_isSelfAdjoint_closure` (headline) | circle, `V = 1_{[0,π)}`; one point | Rayleigh quotient of `1`: `1/2`; `T − T* = 2is·TT*` | `(1 − λ)u′(0) = −λu′(0)` gives `u′(0) = 0`; `i + i⁻¹ = 0` | holds |
| 3.10 `Ici_quarter_subset_essentialSpectrum` (headline) | `u_n = y^{1/2+it}ψ((log y − n)/n)` | `−(∂_r² − ∂_r)(e^{r/2}f) = e^{r/2}(1/4 − ∂_r²)f`; `‖u_n‖² = wn‖ψ‖²` | residual `−y^{1/2+it}(2itψ′/n + ψ″/n²)`; `3·2^j < 2^{j+2}` | holds; lp80 line 251–256 |
| 3.11 `essentialSpectrum_eq_Ici_quarter` (sample, headline) | rotation identity; Hardy; `m = 0`; `Γ(2)\ℍ ⊔ ℝ²` | `Σ|d(χ_i u)|² = |du|² + |dθ|²|u|²`; `∫|f|²y⁻² ≤ 4∫|f′|²`; `(1+ε)‖du‖² ≥ (c−ε)‖u‖²` on `ker R` | `y^{1/2}f(log y)`: quotient `(∫|f′|² + ¼∫|f|²)/∫|f|² → 1/4`; closed surface `σ_ess = ∅`; `ℝ²` gives `[0,∞)` | holds; hm23 line 44–47 |
| 4.2 free Laplacian (sample) | Gaussian, `d = 1`; `d = 0` | density `2·e^{−λ/(2π)}/(4π√λ)`, mass `Γ(1/2)(2π)^{1/2}/(2π) = 2^{−1/2}` | `‖ψ‖² = 2^{−1/2}`; `q(u) = 4π²/(4π√2) = π/√2`; `d = 0`: `σ_ess = ∅` | holds; teschl line 7137–7143 |
| 4.4 `schrodinger_isSelfAdjoint_closure` (sample, headline) | `V = −1_{[−1,1]}`, `d = 1`; `V = 1`; `d = 0` | `k = 0.739`: `k tan k = 0.6735` | `√(1 − k²) = 0.6737`, `E ≈ −0.454 ∈ [−1, 0)`; `σ_ess = [1, ∞)`; `d = 0`: `∅` | holds; teschl line 9578–9589 |
| 4.3 resolvent-point identity | scalar at `s = 0, 1` | `(s+1)⁻¹(1 + (1+i)/(s−i)) = (s−i)⁻¹`: `i`, `(1+i)/2` | sign slip gives `2 − i` at `s = 0`; bracket modulus `(s+1)/√(s²+1) ≤ √2` | holds |
| Worked example, Hide–Magee (C02) | preimage of a cusp end in a degree-`n` cover | each component covers with degree `k`: a cusp end of width `kw` | Layer 3 Examples: congruence `Γ` only; general `X` listed as an outside input | true; pointer too narrow |

- No earlier finding was open: the previous review (at `9710150`) accepted with none. The folder changed by 1465 lines since; every section was reviewed again.
- Source locators checked against the cached text: 47 line ranges in 8 sources (teschl 27, bms02 4, yafaev04 4, kato57 2, rosenblum57 2, hm23 3, lp80 3, kps26 2); 13 Teschl printed pages match the file's offset of 12 (42, 70–72, 74, 80, 96, 104–106, 116, 119, 134–135, 145, 147, 167–168, 170, 222, 247).
- Library declarations opened at the pins: `LinearPMap.HasCore` (`Mathlib/Topology/Algebra/Module/LinearPMap.lean:141`, `(f.domRestrict S).closure = f`), `LinearPMap.IsRelativelyBounded` (`RelativeBound.lean:56`), `TauCeti.IsLocalRiemannianIsometry` (`Isometry/Local.lean:70`, invertible differential), `TauCeti.ProjValMeasure` (`ProjValMeasure/Basic.lean:91`, `diag` as data, `proj_univ`), `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`Stone/Unbounded.lean:106`), `IsSelfAdjoint.add_of_isRelativelyBounded` (`KatoRellich.lean:118`). No declaration at the pins states a lower bound or core transfer for Kato–Rellich, an essential spectrum, wave operators or a Laplacian closure.
- Cross-roadmap citations resolved: on main, UnboundedOperators (13 ids; §2.3, §3.2, §3.3, §4.7, §5.4, §5.7 read), SelfAdjointSpectralTheory (26 ids located), OperatorIdeals (8 ids), BanachSpaceTheory B4, AutomorphicSpectralTheory §0.8 and §1.16a, CongruenceSpectralGap §0.2 and §0.6, PDE §1.2, §1.3, §6.3, ComplexKahlerGeometry §5.1, §5.4, §5.7, RiemannianGeometry R5c and R7.8 item 8, FuchsianOrbifolds Layer 3 item 3, GeometricTopology §7.1, ComplexCurveModuli D6 item 2, VariationalMethods 3.1, 4.4, 5.1, HilbertModules H6, SmoothBundlesConnections B2.2, PseudodifferentialOperators P1.0, Completed/HopfRinow (b); at open heads, QuantumFoundations §8.2 (density formula read) and §9.5, MaassForms §0.1.
- Declared gaps `weyl-criterion` and `spectral-integral-resolvent`: stated in the README under the UnboundedOperators contract with their hypotheses. UO-C02 names Lemma 6.17 only inside its Fredholm proof and lists no Weyl criterion among its items; UO-A02 inverts `z − A` only for the measure of a given `A`. The acceptance is conditional on these two gaps.
- Automatic checks: all passed. Dependency check output: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. On a scratch copy, `first | rfl | (simp; done) | infer_instance | (intros; trivial)` closes none of the 13 theorems (0 errors). The seven definitions have real bodies; the elaborated signatures show no lost binder; smoothness is `∞`, not `ω`, throughout. The three clauses the docstring names as not statable match the README.

Overlap check: read UnboundedOperators, SelfAdjointSpectralTheory, VariationalMethods (main), QuantumFoundations, CongruenceSpectralGap, AutomorphicSpectralTheory, SobolevDifferentialForms; shared objects and owners: essential spectrum, UnboundedOperators UO-C02; type subspaces, UO-C03; free Laplacian, QuantumFoundations §8.2; Hilbert–Schmidt kernels, AutomorphicSpectralTheory §0.8; congruence-quotient Laplacian, CongruenceSpectralGap §0.2 (special case, cited); compact-pair min–max, VariationalMethods 4.4 (different object, index shift recorded); the Gaffney identity on the cube of SobolevDifferentialForms 7.1 is a different statement. No other roadmap states Kato–Rosenblum, Pearson's theorem, the Gaffney–Chernoff–Strichartz theorem, the decomposition principle or the cusp threshold, and none cites this roadmap.

Source independence: 24 passages compared with 8 sources, none shared (the Weyl-criterion contract and Teschl Lemma 6.17 agree only in the hypotheses the statement forces); largest share teschl, 38 of 97 locators; contents compared with teschl: independent (Layer 1 draws on its Chapters 2, 3, 4 and 12 and on Kato, Rosenblum and Yafaev, Layer 3 has no counterpart there, Layer 4's order is forced by its *Needs:* lines). The 13 uncertified sources (28 locators) were not compared.

Research link: Layer 1 is the trace-class scattering theory of Kato 1957, Rosenblum 1957 and Pearson 1978; 3.6–3.11 state the operator and essential spectrum in which Hide–Magee 2023 (Theorem 1.1) and Lax–Phillips 1980 work; 4.4–4.5 are the operators of Karpeshina–Parnovski–Shterenberg 2026 (Theorem 1.1). Rests on the README's Worked examples and on hm23, lp80, kps26 as read.

## Not verifiable

- `strichartz83` Theorem 2.4, `chernoff73`, `gaffney54` (3.5, 3.6): settled as uncertified; locator only.
- `grigoryan09` Ch. 3, 4, 11; `chavel84` Ch. I; `iwaniec02` Ch. 4, 7, 11; `lp76` Ch. 1, 8: settled as uncertified.
- `rs1` §VII.2; `rs2` Ch. IX, §X.1, §X.2, Theorem X.12; `rs3` §XI.3, Theorems XI.7–XI.8; `kato76` Ch. V §4.1, Ch. X §4.4; `pearson78`; `cfks87` Ch. 1: settled as uncertified.
- `rosenblum57` §§3–4 and `lp80` §§4–7: cited as whole sections; only the lines listed in the table were read.
- `kps26`: the cached text is OCR; the conjugation in `V_n = conj(V_{−n})` at (1.3) and the `≤` at (1.4) are not legible there; the README's reading is the only one that makes `V` real.

## Source issues

- **Error** in teschl at Theorem 6.4, (6.3), p. 135: the source says the lower bound of `A + B` is `γ − max(a|γ| + b, b/(a − 1))`, whose second term is negative for `a < 1`; it should be `b/(1 − a)`, as the estimate in the proof of Lemma 6.3 gives; affects a stated result.
- **Gap** in teschl at Theorem 4.10, p. 119: the source says min–max holds for every self-adjoint `A`, listing the eigenvalues below the essential spectrum increasingly; it should assume `A` bounded below (for `−diag(n)` on `ℓ²` there is no least eigenvalue and every sup–inf is `−∞`); affects a stated result.

## For the human reviewers

- Supplier still open: Layer 4 takes the free Hamiltonian from QuantumFoundations §8.2, which is another author's open pull request (#1771); README lines 1478 and 2014–2021. It must merge first.
- Not tested: 13 sources settled as uncertified (listed under Not verifiable) carry 28 of the 97 locators; their wording and their statements at the locators were not compared. The theorem of 3.6 beyond essential self-adjointness rests on `strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09` and the README's own route.
- Licence: `teschl` was read from the author's online edition on the author's university page; `kps26` only as an OCR text of the arXiv version, whose numbering was not compared with the Annals version the README cites.

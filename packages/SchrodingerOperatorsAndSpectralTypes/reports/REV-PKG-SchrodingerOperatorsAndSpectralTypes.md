<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17292#issuecomment-6901360822 -->
Review (claude) of f97dd45

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) "dimension (a cardinal)" of the kernel is the Hilbert dimension, not the vector-space dimension

   - **Location.** `packages/SchrodingerOperatorsAndSpectralTypes/README.md` line 1314–1315 (§3.7):
     "`ker Δ_X = {u ∈ L²(X) : u is locally constant almost everywhere}`; its dimension (a cardinal) is
     the number of connected components of finite volume".
   - **Claim.** A cardinal-valued dimension of `ker Δ_X` equals the number of finite-volume components.
   - **Witness.** `X = ⊔_{j∈ℕ} S¹_j` (the manifold of the third Check of 3.5): `ker Δ_X` is
     `{(c_j) : Σ |c_j|² < ∞} ≅ ℓ²(ℕ)`. Components of finite volume: `ℵ₀`. Vector-space dimension
     (`Module.rank ℂ`) of `ℓ²(ℕ)`: `2^ℵ₀`. Hilbert dimension: `ℵ₀`.
   - **Repair.** Replace "its dimension (a cardinal) is" by "its Hilbert dimension (the cardinality of
     an orthonormal basis, which is the vector-space dimension when finite) is". On the witness the
     orthonormal basis `(2π)^{−1/2}·1_{S¹_j}`, `j ∈ ℕ`, has cardinality `ℵ₀`, the number of components.
     Add the witness as a Check of 3.7 (it separates the two notions; the present Checks have at most
     two components).

2. **F02** (P3) the module docstring says every headline is stated; two clauses of the Summary are not statable and are not named

   - **Location.** `packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` line 40: "Every
     headline theorem of the roadmap is statable at the pins and is stated below".
   - **Claim.** Nothing the Summary announces is missing from the file for want of a carrier.
   - **Witness.** README line 15–19 (Summary) announces that `Δ_X` is "the operator of the energy form
     on `H¹(X) = H¹₀(X)`" and "its identification on closed manifolds with the operator of
     RiemannianGeometry". `gaffney_isSelfAdjoint_closure` states only self-adjointness of the closure
     and the maximal domain. At the pin, `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` has
     inequalities for `C¹` functions and no `H¹` space of a manifold; R5c's operator is no declaration.
   - **Repair.** Replace the sentence at line 40 by: "Every headline theorem of the roadmap that is
     statable at the pins is stated below: …" (the list unchanged), and add after the list: "Two clauses
     of the README Summary are not statable at the pins and nothing is stated in their place: the
     form-domain clause of §3.6 (`H¹₀(X) = H¹(X)`, `Δ_X` as the operator of the energy form), because
     the pins have no Sobolev space `H¹` of a Riemannian manifold and no distributional differential
     (ComplexKahlerGeometry K5a); and the identification of §3.8 with RiemannianGeometry R5c's closed
     realisation, an operator that is not a declaration at the pins." No Lean declaration changes.

3. **F03** (P3) a docstring attributes the kernel theorem to a work the README and the manifest do not record

   - **Location.** `packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` line 258–259 (docstring
     of `exists_mem_domain_closure_eq_zero_iff`): "(Yau's `L²` Liouville theorem; Hide–Magee state the
     finite-area hyperbolic case)".
   - **Claim.** The statement is cited to a named theorem of Yau.
   - **Witness.** README §3.7 (line 1314–1320) cites only `hm23 line 41–43` and "the kernel route
     below"; `sources.toml` has 21 entries and none for Yau; README References (line 1822–1848) has none.
   - **Repair.** Replace the parenthesis by "(Hide–Magee state the finite-area hyperbolic case; the
     general case is the kernel route of README §3.7)". (The alternative, recording S.-T. Yau, *Some
     function-theoretic properties of complete Riemannian manifolds*, Indiana Univ. Math. J. 25 (1976)
     in the manifest and in §3.7 with a locator, needs the text read first.)

Three findings, all P3 (0 blocking). The mathematics, the supplier citations, the sampled locators
and the Lean file hold up under the checks recorded below; the three repairs are one ambiguous
"dimension" in 3.7, the module docstring's account of what is not statable, and one attribution in
a docstring that neither the README nor the manifest carries. Each repair is a few words.

Files reviewed: `packages/SchrodingerOperatorsAndSpectralTypes/README.md` (1848 lines),
`packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` (352 lines, 7 definitions and 11
theorems), `metadata.toml`, `sources.toml` (21 entries). No previous review of the package exists.

## Verified sound

### 1. Principles

No route-specific shortcut (Layer 1 is stated for an arbitrary self-adjoint operator and for a bare
normalized projection-valued measure, with no separability; 3.6 for every complete manifold,
possibly disconnected, of every dimension including 0; 4.4 for every `d ≥ 1`). No re-planned
roadmap: the type subspaces, the essential spectrum, forms and the free Laplacian are cited
(UO-C03, UO-C02, UO-D06, QuantumFoundations §8.2), not built again. Supply is one-directional
(dependency check below). No copied passage (§8). No algorithm. `Suggested.lean` has no sorry'd
data (the 7 definitions have real bodies), no `set_option`, no `lemma`, no `#eval`/`#print`.

### 2. Sources: the seeded sample (15 targets) and every line locator read

Page markers of the `teschl` extraction are PDF pages; the printed page is the PDF page minus 12
(teschl line 3993–3994: PDF page 109 carries the running head "97"). Every printed page below was
checked with that offset.

| Target | Locator | Read at | Result |
|---|---|---|---|
| 1.1 | Theorem 3.7, p. 96 | teschl line 3983–3992 | uniqueness of `P_A` from the resolvent; supports the predicate and the last law |
| 1.1 | laws | teschl line 4399–4411 | `dμ_{f(A)ψ} = |f|² dμ_ψ` and additivity over orthogonal cyclic subspaces |
| 1.1 Conv. | separability | teschl line 1780 (printed p. 42) | standing assumption, as the Conventions say |
| 1.2 | (3.83)–(3.84), Lemma 3.19 | teschl line 4388–4419 | separable case; the Borel-set clause is correctly not restated |
| 1.3 | Lemma 2.24, p. 80; Cor. 4.6, p. 116 | teschl line 3282–3304, 4945–4946 | reduction ⇔ commuting projection; the compression clause is the roadmap's own |
| 1.4 | (3.79), Lemma 3.15, (3.85), maximal vector, Lemma 3.16 | teschl line 4315–4332, 4350–4366, 4420–4427 | all as cited; (1), (2) correctly marked as deduced here |
| 1.5 | Lemma 3.15, p. 104 | teschl line 4326–4332 | one-measure fact only, as the README says |
| 1.6 | Theorem 4.10, Cor. 4.11, Theorem 4.12(i) | teschl line 5044–5057, 5063–5069 | as cited; form-domain variant at line 5053–5054 |
| 1.7 | (12.3) p. 247, Lemma 12.1, (12.6), Theorem 12.2 | teschl line 10585–10620 | as cited (page number printed at line 10588) |
| 1.8 | (2.7), Lemma 2.1 | kato57 line 92–111 | bound `2π m² ‖A‖²_HS`, constant entering as `m²`: as cited |
| 1.9 | Def. 1.3, Thm 1.4, Thm 1.8, Lemma 1.9 | yafaev04 line 116–122, 136–140, 193–206 | as cited; the source asserts no isometry for `J ≠ 1`, nor does the README |
| 1.9 | Theorem 1, (1.1)–(1.3) | kato57 line 21–35 | as cited |
| 1.9 | Theorem 1.6; weak-to-strong step | rosenblum57 line 70–72, 80–95 | as cited |
| 2.1 | Theorem 4.10 at `n = 1` | teschl line 5044–5052 | as cited |
| 2.2, 2.3, 3.9 | Lemma 6.3, Theorem 6.4, p. 135; (2.68) | teschl line 5683–5720, 3043–3046 | hypotheses as cited; the printed bound is misprinted (Source issues), and 2.3 states Kato's form |
| 3.6 | §2.1, Thm 2.3, Cor. 2.10, Remark 2.12 | bms02 line 128–129, 151–157, 179–182, 245–246, 252–256 | as cited, including the connectedness assumption the README lifts componentwise |
| 3.9 | relatively compact perturbations | teschl line 6358–6360 | as cited |
| 4.3 | Lemma 7.11, p. 170 | teschl line 7213–7228 | as cited |
| 4.5 | (1.1)–(1.6), Theorem 1.1 | kps26 line 20–39, 47–50 | `d ≥ 2`, `l > d`, full-measure set of frequencies: as the Examples say (OCR text) |
| others | Lemma 6.17 p. 145; Thm 7.8, Lemma 7.9, (7.26) p. 168; Thm 10.2 p. 222; Thms 2.12–2.13 | teschl line 6277–6281, 7095–7143, 9578–9589, 2914–2917, 2960–2966 | as cited |
| others | hm23 Intro, Thm 1.1, Cor. 1.3; lp80 (2.8)–(2.10), (2.15)–(2.17), Thm 2.1, Cor. 2.2 | hm23 line 39–47, 60–66, 104–105; lp80 line 251–256, 279–290, 297–301 | as cited |

The author flagged no locator as unverified. The sampled targets 3.1 (`grigoryan09` Ch. 3) and 3.8
(`chavel84` Ch. I) cite uncertified texts only: see Not verifiable; their statements were checked by
computation (rows 10, 20 below) and against the pinned Green identities and RiemannianGeometry R5c.

### 3. Adversarial pass (computed values)

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `IsSpectralMeasureOf` (1.1) | `A = 2` on `ℂ`, `z = i`, `P = δ₂`, `δ₃`; `ℋ = 0` | `⟪1, R(i)1⟫ = (i−2)⁻¹ = (−2−i)/5`; `∫(i−s)⁻¹dδ₂` the same; `δ₃` gives `(−3−i)/10`; `Im = −1/5 < 0`, the sign of `−∫(1+s²)⁻¹dμ`; zero space `0 = 0` | determines `P`; kernel `(s−z)⁻¹` would be unsatisfiable | none |
| 2 | `diag_spectralType_components` (1.2) | `M_x ⊕ ½` on `L²[0,1] ⊕ ℂ`, `f = (1,1)`; `f = √2·1` in `L²[0,1]`; `f = 0` | `μ_f = Leb|[0,1] + δ_{1/2}`; ac part `Leb|[0,1]`; singular part `δ_{1/2}`; atoms `{1/2}`, restriction `δ_{1/2}`; reversed density gives `4·Leb ≠ 2·Leb`; all `0` for `f = 0` | holds; hypotheses are UO's membership predicates verbatim (`UnboundedOperators/Suggested.lean` line 203–205) | none |
| 3 | `acSpectrum`, `perfect_acSpectrum_and_mem_iff` (1.4) | `M_x` on `L²[0,1]`; `diag(q_n)`; `M_x ⊕ diag(2)` at `t = 2`; `ℋ = 0`; single-vector direction | `[0,1]` (perfect); `∅` (Mathlib `Perfect ∅` holds: closed, no points); at `t = 2` an ac `f = (g, 0)` has `μ_f((2−ε, 2+ε)) = 0` for `ε < 1`; `f = Σ 2^{−k} g_k` on disjoint annuli has `μ_f(I_n) = Σ_{k≥n} 4^{−k} > 0` | holds both directions | none |
| 4 | `Icc_subset_acSpectrum_iff` (1.5) | `M_x` on `L²([0,1] ∪ [2,3])`, `(a,b) = (0,1)` and `(1,2)` | `(0,1)`: `f = 1_J` gives `Leb(J) > 0`, and `[0,1] ⊆ σ_ac`; `(1,2)`: `J = (1.2, 1.8)` has mass `0` for every `f`, and `1.5 ∉ σ_ac` | both sides agree; `a = b` excluded by `hab` | none |
| 5 | `essentialSpectrum` | `0` on `ℂ`; `0` on `ℓ²`; `diag(1/n)` | `∅`; `{0}`; `{0}` | same formula as UO-C02's (`UnboundedOperators/Suggested.lean` line 168–178) | none |
| 6 | `minMaxValue`, `minMax_principle` (1.6) | `diag(1,3,5)`; `ℋ = 0`; `0` on `ℓ²`; `−1 ⊕ H₀`; `−diag(n)` | values `1, 3, 5, ⊤, ⊤, …`, `Σ = ⊤`; `c = 4`: count `2 = finrank(ker(1−A) ⊔ ker(3−A))`; `c = 3`: `1 = 1`; zero space: all `⊤`, `0 = finrank ⊥`; `0` on `ℓ²`: `Σ = 0`, `c < 0`: `0 = 0`; `−1 ⊕ H₀`, `c = −1/2`: `1 = 1`; `−diag(n)` violates `hγ` | holds; `finrank` never meets an infinite-dimensional space (spectrum in `[γ, c]` is finite below `Σ`) | none |
| 7 | `pearson_tendsto` (1.9) | `J = 0`; `H₁ = H₂`, `J = 1`; on `ℂ`: `H₁ = 0`, `H₂ = 1`, `J = 1`, `C = 1` (trace class) | limit `0`; constant `x`; on `ℂ` the hypothesis holds and `e^{it}x` diverges for `x ≠ 0`, but `μ_x = |x|²δ₀ ≪ Leb` forces `x = 0` | holds; the absolute-continuity hypothesis is what the last instance needs | none |
| 8 | `katoRosenblum` (1.9) | same `ℂ` instance; `diag(1/n²)`, `V = −diag(1/n²)`; `V = 0`; `M_x`, `V = c·1` | ac vectors `{0}` on both sides, `∅ = ∅`; `∅ = ∅`; `y = x`; `c·1` has infinite nuclear gauge, excluded | holds | none |
| 9 | `katoRellich_lowerBound_hasCore` (2.3) | `A = 2`, `V = −3`, `(a,b) = (3,0)`, `γ = 2`; `A = s ≥ 0`, `V = −(1 + s/2)`, `(1, 1/2)`; `A = −4`, `V = −3`, `(1, 1/2)`, `γ = −4` | bound `−1 = A + V` (tight); bound `−max(2, 1) = −2 ≤ inf(s/2 − 1) = −1`; bound `−4 − max(2, 3) = −7 = A + V` (tight) | holds; both branches of the maximum are attained or needed | none |
| 10 | `complexLaplacian` (3.1) | `‖x‖²` on `ℝ^d`; `yˢ` on `ℍ`; `e^{inθ}` | `−2d`; `s(1−s)yˢ`; `n²e^{inθ}`, Green `2πn² = 2πn²` | sign `−div grad` pinned | none |
| 11 | `gaffney_isSelfAdjoint_closure` (3.6) | `ℝ`; `(0,1)`; dimension `0`; `M = ∅`; cutoff estimates | `H²(ℝ)`; `(0,1)` is not complete and `eˣ ∈ ker(Δ₀† + 1)`; countable discrete `M`: `T = 0` on finite supports, closure `0` on `ℓ²`, maximal domain `ℓ²` with `w = 0`; `L² = 0`; `∫χ²|du|² ≤ 2‖Δu‖‖u‖ + 4 sup|∇χ|²‖u‖²` recomputed from `Re⟪χ²u, Δu⟫ ≥ ½∫χ²|du|² − 2 sup|∇χ|²‖u‖²` | holds | none |
| 12 | `exists_mem_domain_closure_eq_zero_iff` (3.7) | `ℝ`; `S¹`; two circles; `⊔_ℕ S¹` | only `0`; constants; two-dimensional; `ℓ²` of constants | holds; README wording of the dimension: R01 | R01 |
| 13 | `cuspRegion`, `IsStandardCuspEnd`, `Ici_quarter_subset_essentialSpectrum` (3.10) | `u_n = y^{1/2+it}ψ((log y − n)/n)`; width `1` vs `2` | `‖u_n‖² = w n ‖ψ‖²`; residual ratio `≤ (2|t|‖ψ'‖/n + ‖ψ''‖/n²)/‖ψ‖`; supports `log y ∈ [2^{j+1}, 3·2^j]`, `3·2^j < 2^{j+2}`; area `w/a`; the width-`1` quotient map fails the "only if" of the fibre condition for `w = 2` | holds; the cusp chart forces dimension `2` | none |
| 14 | `schrodinger_isSelfAdjoint_closure` (4.4) | `V = c`; `V = 1`; `d = 0`; `d = 1`, `V = −1_{[−1,1]}` | `σ = [c, ∞)`, bound `ess inf V = c` tight; `V = 1` fails the decay hypothesis and `σ_ess = [1, ∞)`; `d = 0`: `σ_ess = ∅ ≠ [0, ∞)`, excluded by `hd`; `k ≈ 0.739`, `k tan k ≈ 0.673`, `κ ≈ 0.674`, `E ≈ −0.454 ∈ [−1, 0)` | holds | none |
| 15 | change of resolvent point (4.3) | spectral value `s = 0`, `s = 1` | `(s−i)⁻¹ = (s+1)⁻¹(1 + (1+i)/(s−i))`: `i = i`; `(1+i)/2 = (1+i)/2`; modulus of the bracket `(s+1)/√(s²+1) ≤ √2` | identity holds | none |
| 16 | Rosenblum's lemma (1.8) | `H = M_λ`, `x = m·1_{[0,1]}`, `C = ⟨φ,·⟩φ`; `x = |λ|^{−1/4}1_{[−1,1]}` | `∫|⟨φ, e^{−itλ}x⟩|²dt = 2π m²`, equality; truncation error `4/m²` | holds, constant `2π` pinned | none |
| 17 | bottom of the spectrum (2.1) | Gaussians `e^{−πx²/n²}` | `‖u‖² = n/√2`, `‖u'‖² = π/(n√2)`, quotient `π/n² → 0` | holds | none |
| 18 | `H²` norms and form of `H₀` (4.1, 4.2) | `u = e^{−πx²}` | `‖u''‖² = 3π²/√2`, `‖ξ²𝓕u‖² = 3/(16π²√2)`, ratio `(4π²)²`; `q(u) = π/√2`; density `e^{−λ/(2π)}/(2π√λ)`, mass `2^{−1/2} = ‖u‖²`, equal to QuantumFoundations §8.2's formula at `n = 1` | holds | none |
| 19 | normal resolvent (3.9) | one point, `V = 0`, `s = 1`; `V = 1_{[0,π)}` on the circle | `T = i`, `T* = −i`, `T − T* = 2i = 2i·TT*`, eigenvalue `i + i⁻¹ = 0`; smooth eigenfunction forces `u(0) = u'(0) = 0`, hence `u = 0` | holds | none |
| 20 | complexification (3.8) | circle, eigenvalue `1` | real eigenspace `span(cos θ, sin θ)`, complex `span(e^{±iθ})`, both of dimension `2`; `κ(iu) = i•κ(u)`; inner product parts match `WithLp.instComplexificationInnerProductSpace` | holds | none |
| 21 | index conventions (1.6, 3.7) | `diag(1,3,5)` | Mathlib's `eigenvalues` are sorted decreasingly (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean` line 274–279, `eigenvalues_antitone` line 309), so indices `2, 1, 0`; VariationalMethods 4.4 indexes from `0` with junk `0` (its README line 112–116, 787) | as the README says | none |
| 22 | Kato–Rellich route (2.3) | `d = γ − μ` | `sup_{s≥γ} |s|/(s−μ) = max(1, |γ|/d)`; `a/d + b·max(1, |γ|/d) < 1` iff `d > max(a/(1−b), a + b|γ|)` | route gives the stated bound | none |

Context and generality (points 2, 3): every Lean declaration carries its binders in its own
signature (no `variable` block in the file). I compared the elaborated types of all 18 declarations
(`#check @name`, the worker's `signatures.md`, elaborated at this head) with the README statements:
`[CompleteSpace H]` is present wherever `TauCeti.ProjValMeasure` or self-adjointness is used; the
three manifold theorems carry `[I.Boundaryless]`, `[CompleteSpace M]`, `[SecondCountableTopology M]`,
`[IsRiemannianManifold I M]` and the smooth metric; the smoothness index elaborates as `∞` (smooth),
not `ω`; nothing changed and nothing was lost. README generality equals Lean generality for each.

### 4. Duplication audit

By object, at the pins (Mathlib and Tau Ceti of `lake-manifest.json`): no essential spectrum, no
absolutely continuous spectrum, no wave operators, no Kato–Rosenblum, no Weyl criterion, no
essential self-adjointness of a Laplacian, no `H¹` of a manifold (grep of both libraries: 0 files for
`essentialSpectrum`, `wave operator`, `Kato–Rosenblum`, `Glazman`; Kato–Rellich at
`TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean` line 118 has self-adjointness
only, no lower bound and no core clause; `HasCore` lemmas at
`TauCeti/Topology/Algebra/Module/LinearPMap/GraphCore.lean` line 68, 79 do not give it either). The
min–max files at the pin are the finite-dimensional Courant–Fischer
(`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean` line 251) and approximation numbers; the
README distinguishes both. The 18 leads of `library-matches.md`: 0 same-name hits, none proves a
target.

Library names: all 85 dotted or library identifiers backticked in the README were opened at the
pins and exist where the contracts say (for instance `TauCeti.ProjValMeasure` with fields `proj`,
`diag`, `inner_proj`, `proj_univ` at `.../ProjValMeasure/Basic.lean` line 91–106;
`LinearPMap.resolvent`, `resolventSet`, `spectrum`, `resolvent_sub_resolvent` at
`.../LinearPMap/Resolvent/Basic.lean` line 129, 140, 169, 280; `LinearPMap.smulSub` at
`TauCeti/LinearAlgebra/LinearPMap/SmulSub.lean` line 39; `LinearPMap.IsRelativelyBounded` at
`.../RelativeBound.lean` line 56; Stone's theorem at `.../Group/Stone/Unbounded.lean` line 106;
`ContinuousLinearMap.nuclearENorm` at `.../Nuclear/Basic.lean` line 53;
`TauCeti.Manifold.integral_mul_laplaceBeltrami` and
`integral_mul_divergence_of_hasCompactSupport_right` at `.../DivergenceTheorem.lean` line 312, 289,
with the hypotheses the contract states; `TauCeti.IsLocalRiemannianIsometry` at
`.../Isometry/Local.lean` line 70; `TemperedDistribution.MemSobolev` at
`Mathlib/Analysis/Distribution/Sobolev.lean` line 153; `Perfect` at `Mathlib/Topology/Perfect.lean`
line 85; the three Lebesgue-decomposition lemmas at
`Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean` line 122, 404, 522). The 18 backticked
names the README attributes to this roadmap are exactly the 18 declarations of `Suggested.lean`.

Roadmaps (`roadmaps grep` over main and the open heads): `Kato.Rosenblum`, `Glazman`, and this
file's declaration names have no hit outside this package and UnboundedOperators' own
`essentialSpectrum`; "wave operators" occurs only in RelativisticQuantumFieldTheory (Haag–Ruelle
and scalar wave equations, other objects); "Gaffney" in SobolevDifferentialForms (the Gaffney
identity on the cube, another statement) and CongruenceSpectralGap §0.2.

Overlap facts (`scratch/overlaps.md`, checked): no other open pull request changes this roadmap; no
cited id is dropped by an open pull request (the SA and UO ids below were resolved on main); none is
defined only by an open revision; this is not a second copy (no folder of this name on main).

Maintainer notes (six claims, each checked against the files at these heads):

1. Holds of UO-E06 (UnboundedOperators §5.7 read: `L² + L^∞` on `ℝ³` only, Coulomb left to a
   consumer). The README already says so (line 126–132, 142–143): no finding.
2. Holds of UO-C03 (§3.3: restriction self-adjointness "in the finite-control-measure case"). The
   README already says so and supplies 1.3 (line 76–79, 383, 627–628): no finding.
3. Holds of UO-C02 (no Weyl criterion among its API items). The README declares
   `gap:weyl-criterion` (line 397–402): no finding.
4. Addressed: 4.3 states the passage from `−1` to `i` with the resolvent identity (line 1680–1688);
   I recomputed it (row 15): no finding.
5. Holds of UO-A02. The README declares `gap:spectral-integral-resolvent` (line 404–409): no finding.
6. Refuted at this head: the contract lists SA-E30 and SA-C86 (README line 357–363).

The ownership decisions of the notes (type subspaces from UO-C03; the free Laplacian from
QuantumFoundations §8.2; this roadmap owning reduction by a commuting projection, the named spectra
and `−Δ + V` in every dimension) are followed by the text; 4.4 says that in dimension three its
first clauses are cases of UO-E06 (line 1730–1734).

Overlap check: read UnboundedOperators (§1.1–1.2, §1.6, §2.3, §3.1–3.3, §4.7, §5.4, §5.7 and its Suggested.lean), SelfAdjointSpectralTheory (the 29 cited items), VariationalMethods (4.4, 5.1), QuantumFoundations (§8.2, §9.5), CongruenceSpectralGap (§0.2, §0.6), AutomorphicSpectralTheory (§1.16a), RelativisticQuantumFieldTheory (grep hits); essential spectrum: UnboundedOperators UO-C02 (repeated here by formula under another namespace, stated as not owned); type subspaces `ℋ_pp`, `ℋ_ac`, `ℋ_sc`: UO-C03; free Laplacian on `H²(ℝⁿ)`: QuantumFoundations §8.2; `−Δ + V` with `V ∈ L² + L^∞` on `ℝ³`: UO-E06, with bounded `V` in every dimension: this roadmap; essential self-adjointness on `Γ(N′)\ℍ`: CongruenceSpectralGap §0.2 (earlier in the merge order, a special case it proves itself), on every complete manifold: this roadmap; nothing has two owners.

### 5. Supplier-order audit

Dependency check output: `depcheck: 243 roadmaps, 2251 edges, 0 problem(s)` (no UPWARD, no CYCLE,
no `moved:` line). The merge order lists this roadmap at line 221, after QuantumFoundations (220),
its latest supplier; CongruenceSpectralGap (164), MaassForms (165), AutomorphicSpectralTheory (101),
FuchsianOrbifolds (50), PseudodifferentialOperators (15), SmoothBundlesConnections (13) and
HilbertModules (8) are earlier; the others are on main. None of the forbidden suppliers is cited.

Citations resolved now, at main `56191c95` or at the open head:

- SelfAdjointSpectralTheory (main): SA-B44, B45, B85, C12–C19, C25, C28, C39, C44, C52, C54, C86,
  D02, D12, D18, D22, E01, E05, E08, E09, E11, E13, E26–E30, E44, E47 all exist with the content the
  contract assumes (README line 420, 676, 818–834, 1001, 1113, 1202–1231, 1260–1268, 1316).
- UnboundedOperators (main): UO-A01, A02, A06, A07, B03, C01, C02, C03, D06 (including the "real
  unbounded spectral restriction" and the complexification of §4.7, line 744), E01, E04, E05, E06
  exist as cited (line 241, 259, 303, 309, 408, 523, 533, 552, 703, 900, 983, 1027, 1033).
- QuantumFoundations §8.2 and §9.5 (open head): the free Hamiltonian, its cores, the density of the
  spectral measure and the Coulomb case are as the contract says.
- VariationalMethods 4.4, 5.1; RiemannianGeometry R5c (line 3715), R7.8 item 8 (line 4434–4437),
  R4; ComplexKahlerGeometry K5a; HilbertModules H6 (line 705–759); PDE §1.2, §1.3, §6.3 (F26);
  OperatorIdeals OI-A35–A40, OI-B29–B36, OI-C14; DifferentialGeometry 12.2–12.5;
  PseudodifferentialOperators P1.0; SmoothBundlesConnections B2.2 (line 605); FuchsianOrbifolds
  Layer 3 item 3; ComplexCurveModuli D6 item 2; GeometricTopology §7.1 (line 6685);
  Completed/HopfRinow (b); CongruenceSpectralGap §0.2 (`N′ = 3N`, Gaffney's argument, kernel the
  constants), §0.6; AutomorphicSpectralTheory §1.16a, §§4.1–4.4; MaassForms §0.1: all found.

Declared gaps. `gap:weyl-criterion` and `gap:spectral-integral-resolvent`: same slugs in
`design/plan.json` (`gaps`) and under "Exact supplier contracts" in the supplier's subsection; each
names its supplier section (UO-C02 §3.2, UO-A02 §1.2); each `needs` is one statement with its
hypotheses; neither asks for what exists (UO-C02's API has no Weyl criterion; UO-A02 proves the
resolvent formula only for `P = P_A`). Not findings; a later acceptance is conditional on them.

No notion was moved down from a later roadmap.

### 6. Shape and completeness

README shape: title, Summary, Scope and ownership, Conventions (each with a computed witness),
Exact supplier contracts, How to read the build, four layers each ending with Examples and
Dependencies, Downstream consumers, Worked examples, References. Every definition has at least
three discriminating Checks (counts: `IsSpectralMeasureOf` 4, vector measures 4, spectral parts 6,
min–max 8, wave operators 3, density-bounded vectors 6, compressed wave operators 5, `λ₀` 4, `Δ` 3,
initial operator 3, maximal operator 3, `H¹` and the form 3, cutoffs 4, vocabulary 3, cusp ends 8,
vanishing at infinity 5, quasi-periodic potentials 3). Every theorem has its hypotheses in the
sentence and a locator or the words "deduced here". The layer order is forced by the dependency
lines (Layers 3 and 4 need 1 and 2; 1 and 2 are independent) and no layer is named after a source.
No LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no numbering
tables (greps: 0 hits).

Elaboration: `lake env lean` on `packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean` from
the content checkout exits 0 with 11 warnings, all `declaration uses 'sorry'` (lines 76, 102, 112,
143, 161, 180, 204, 234, 260, 304, 330). Imports: `import Mathlib` and 11 `TauCeti.*` modules, each
present at the pin.

### 7. Headline theorems and padding

Headlines of the Summary and where they are stated: Lebesgue decomposition of the type components
(`diag_spectralType_components`); structure of `σ_ac` (`perfect_acSpectrum_and_mem_iff`); interval
criterion (`Icc_subset_acSpectrum_iff`); min–max (`minMax_principle`); Pearson (`pearson_tendsto`);
Kato–Rosenblum (`katoRosenblum`); Kato–Rellich lower bound and cores
(`katoRellich_lowerBound_hasCore`); Gaffney–Chernoff–Strichartz (`gaffney_isSelfAdjoint_closure`,
first assertion; the form-domain clause is R02); kernel (`exists_mem_domain_closure_eq_zero_iff`);
cusp threshold (`Ici_quarter_subset_essentialSpectrum`); bounded potentials on `ℝ^d`
(`schrodinger_isSelfAdjoint_closure`, whose case `V = 0` contains `σ_ess(H₀) = [0, ∞)`). No statable
headline is absent; none goes through a stand-in.

One-tactic probe, on a scratch copy, all 11 sorried theorems: `simp`, `rfl`, `infer_instance`,
`trivial`, `simp_all`, `aesop` each fail at all 11 sites. No declaration restates a definition,
mirrors a Check or computes a value. No padding.

### 8. Copyright, licences and scope

Wording: 22 passages set beside 9 sources (the 16 locators of the table in §2, and six further
passages: the essential closure and maximal spectral vector of 1.4 against teschl line 4315–4319
and 4350–4353; the wave-operator definition of 1.7 against teschl line 10585–10587; the route of
2.3 against teschl line 5712–5720; the minimal and maximal operators of 3.2–3.3 against bms02 line
151–157; the route of 4.3 against teschl line 7219–7228; the docstring of `pearson_tendsto` against
yafaev04 line 193–198). No run of shared words beyond standard names and formulas; the routes of
2.3 and 4.3 differ from the source's (real shift with explicit constants; an explicit Hilbert–Schmidt
energy).

Arrangement: `teschl` has 34 of the 52 `<id> line N` locators that sit on one text line of the README (locators wrapped across a line break are not in the count; the proportion is the same by eye). Its contents (teschl line 66–140): Ch. 2
self-adjointness, Ch. 3 spectral theorem, Ch. 4 applications, Ch. 5 dynamics, Ch. 6 perturbation,
Ch. 7 free operator, Ch. 10 one-particle operators, Ch. 12 scattering. The roadmap's Layer 1 draws on
§3.1–3.3, §4.3–4.4 and §12.1 together with Kato, Rosenblum and Pearson, which teschl does not treat;
Layer 2 on §6.1; Layer 3 on nothing in teschl; Layer 4 on §7.2 and §10.1. No run of layers maps one
to one onto a run of chapters.

Reuse: no table, figure, exercise list or data taken from a source. I know of no public
formalisation whose names and statements the Lean file follows.

Source independence: 22 passages compared with 9 sources, none shared; largest share teschl, 34 of 52 line locators; contents compared with teschl: independent.

## Not verifiable

- `grigoryan09` (3.1, 3.4, 3.5, 3.6), `chavel84` (3.8), `gaffney54` (3.5), `strichartz83` and
  `chernoff73` (3.6), `pearson78` and `rs3` (1.7, 1.9), `rs1` (1.1), `rs2` (2.3, 3.6, 3.9, 4.1, 4.4),
  `kato76` (2.3, 1.9), `cfks87` (4.4), `iwaniec02` and `lp76` (3.10, Downstream consumers): the
  manifest records them as uncertified, so their locators were not read. Of the sampled targets this
  leaves 3.1 and 3.8 without a read locator; the main statement of each uncertified citation has a
  certified companion (bms02 for 3.6, yafaev04 for Pearson, teschl for 2.3) or was checked by
  computation, except Kato's form of the bound in 2.3, which rests on the resolvent computation of
  row 22 and not on a read text.
- The published numbering of the arXiv copies `bms02`, `hm23`, `yafaev04`, `kps26` against the
  journals, and the journal data of `kps26` (Ann. of Math. 203 (2026)): not compared.
- `kps26` is an OCR text; the formulas (1.3)–(1.6) are legible only in outline (kps26 line 30–38).
- Whether RiemannianGeometry R4 "leaves the curvature `−1` case" to GeometricTopology §7.1
  (Downstream consumers): §7.1 was read and states the quotient presentation; R4's sentence was not
  located.

## Source issues

- **Misprint** in teschl at Theorem 6.4, (6.3), printed page 135: the source says the lower bound is `γ` minus the maximum of `a|γ| + b` and `b/(a − 1)`, a quotient that is never positive for `a < 1`; it should be the maximum of `a|γ| + b` and `b/(1 − a)`; affects a stated result.

## For the human reviewers

- Licence: `teschl`, the source with the largest share of locators (34 of 52 counted), is read from the author's online edition on a university page (`sources.toml`, `licence_class = "author-page"`); the printed book is an AMS volume.
- Licence: `kato57` and `lp80` are read from publisher-hosted open copies (J-STAGE, AMS Bulletin; `licence_class = "publisher-open"`); no licence text was read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f97dd4530a5c7ee79595b0e663f369ce9efe20a5", "job": "REV-PKG-SchrodingerOperatorsAndSpectralTypes", "model": "fable", "worker": "chris-x29"} -->

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2145#issuecomment-6413097920 -->
Red team round 1 pass b (claude) of c263049

Verdict: needs changes

1. **F01** (P1) §§5.2–5.3 proof routes rest on GIT theorems that no layer, supplier or pin owns

   Location: `README.md` line 880 ("By the Hilbert–Mumford criterion x is unstable if and only if a nontrivial cocharacter of H has only nonnegative weights on x"), line 882 (§5.2 *Needs*: §2.1, §5.1, Witt theorems, three Mathlib carriers), line 942 ("Trivial stabilizers and a dimension count give the bundle structure"), line 944 (§5.3 *Needs*: §5.1, §5.2, Witt theorems, NilpotentOrbits N1.1).

   Claim: the routes of the two theorems stated in `Suggested.lean` use (a) the Hilbert–Mumford numerical criterion for the reductive group H acting linearly on 𝔤, in both directions, and (b) the GIT package of nv21 Lemma 14.1 (p. 96): the affine quotient 𝔤//H, openness of the stable locus, and the fact that a free action with closed orbits on the stable locus makes 𝔤^s → 𝔤^s//H a principal H-bundle (Mumford–Fogarty–Kirwan, Prop. 0.9), together with Zariski's main theorem (nv21 p. 101, "by Zariski's main theorem, using characteristic zero"). None of these is a target of this roadmap, a named supplier section or a pinned declaration.

   Witness: nv21 p. 98 ("Recall the Hilbert–Mumford criterion: x is not H-stable if and only if there is a non-trivial 1-parameter subgroup …") and nv21 p. 101 (proof of Theorem 14.5: injectivity of j, then Zariski's main theorem, then "see Lemma 14.1" for the principal bundle). `roadmaps grep` for "Hilbert–Mumford" finds only special-purpose uses (LanglandsParameterStacks on closed orbits of cocycles, ArithmeticDynamics on Rat_d, CountingBundlesAndHallAlgebrasOfCurves asking AlgebraicModuliForArithmeticGeometry for character-linearized GIT of products of GL_n) and no roadmap stating the criterion for a reductive group acting on a vector space; "geometric invariant theory", "GIT quotient", "categorical quotient" match no roadmap on main or at an open head. NilpotentOrbits N1.1 (cited in §5.3) constructs only χ: 𝔤 → 𝔤//G for the adjoint action of a complex adjoint semisimple group, not the H-action on 𝔤 or any stability statement. The pinned Tau Ceti has no `HilbertMumford`, `IsStable`-orbit or GIT declaration (grep at the pin: the 70 `IsStable` hits are category-theory stability conditions).

   "A dimension count" (line 942) does not give étale-local triviality: a bijective morphism onto a normal variety is an isomorphism only through Zariski's main theorem, and the bundle structure of nv21 Theorem 14.5 is exactly MFK Prop. 0.9 applied after that.

   Repair (exact text): add two targets to Layer 5 before §5.2 and cite them from the routes and *Needs* lines of §5.2 and §5.3.

   > ### 5.1a The numerical criterion for linear actions
   > For a reductive group H over an algebraically closed field of characteristic zero acting linearly on a finite-dimensional vector space M, a point x ∈ M is not H-stable (its stabilizer is infinite or its orbit is not closed) if and only if some nontrivial cocharacter γ: G_m → H has only nonnegative weights on x, that is, `lim_{t→0} γ(t)·x` exists (Mumford–Fogarty–Kirwan, *Geometric Invariant Theory*, 3rd ed., Theorem 2.1 and Proposition 2.2, pp. 49–53; nv21 p. 98 restates it). For H = SO_n and H = GL_n acting by `h ↦ diag(h,1)` on skew-symmetric, respectively all, matrices of size n + 1 this is the statement used in §5.2. *Needs:* Mathlib `Matrix.specialOrthogonalGroup`, `Matrix.GeneralLinearGroup`.
   >
   > ### 5.1b Free stable quotients are principal bundles
   > For H as above acting on a smooth affine variety M with affine quotient M//H (nv21 Lemma 14.1, p. 96), the stable locus M^s and its image are open, and if every stabilizer in M^s is trivial then M^s → M^s//H is a principal H-bundle, locally trivial in the étale topology (Mumford–Fogarty–Kirwan Proposition 0.9, p. 16; Luna's slice theorem). A bijective H-invariant morphism from M^s//H onto a normal variety is an isomorphism (Zariski's main theorem). *Needs:* 5.1a; the adjoint quotient of NilpotentOrbits N1.1 for the existence of [𝔤].

   and in line 882 replace "*Needs:* §2.1, §5.1;" by "*Needs:* §2.1, §5.1, §5.1a;", in line 944 replace "*Needs:* §5.1, §5.2;" by "*Needs:* §5.1, §5.1b, §5.2;", and in line 942 replace "Trivial stabilizers and a dimension count give the bundle structure." by "Trivial stabilizers, Zariski's main theorem for the bijection onto the stable pairs and §5.1b give the bundle structure." If a supplier is preferred to owning the two statements here, declare them as `gap:hilbert-mumford-linear` and `gap:free-stable-quotient-bundle` on AlgebraicModuliForArithmeticGeometry (merge order line 35, earlier than this roadmap), adding both to `design/plan.json` `gaps`. The two `Suggested.lean` theorems are unaffected: they state the conclusions, not the GIT inputs.

2. **F02** (P3) a gap `needs` sentence refers to this roadmap's own section instead of defining its object

   Location: `README.md` line 181, "the local relative character `H_σ` of §4.5 is nonnegative on positive operators"; the same `needs` in `design/plan.json` (`relative-character-positivity`).

   Claim: the intake announces the `needs` sentence on the supplier's job; "§4.5" there is a section of this roadmap, which the supplier's job does not display, so the announced contract does not say which form must be nonnegative.

   Witness: nv21 (18.2), p. 121, defines the form; the other twenty gap sentences are self-contained (compare line 177, which spells out `I = Ind_P^H τ`).

   Repair: replace "the local relative character `H_σ` of §4.5" by "the local relative character `H_σ(v₁ ⊗ v̄₂) = Σ_{u ∈ B(σ)} ∫_H ⟨π(s)v₁, v₂⟩⟨u, σ(s)u⟩ ds` (B(σ) an orthonormal basis of K_H-isotypic vectors, inner products linear in the first variable)" in both files.

3. **F03** (P3) three locators name sections that do not exist

   Location: `README.md` line 1406 "(NV21 §§28.1–28.3 and (28.1)–(28.6), pp. 187–189)"; line 1438 "(NV21 Theorem 29.1 and §§29.2–29.4, pp. 190–193)"; line 89 "2G the real place, trivial image for definite forms and all square classes for indefinite ones".

   Witness: nv21 §28 has exactly two subsections, 28.1 "Recap" (p. 187) and 28.2 "Cleanup" (p. 188); "(28.3)" is an equation. nv21 §29 has 29.1 (p. 190), 29.2 (p. 190) and 29.3 (p. 190); "(29.4)" is an equation. In `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, item 2G (line 735) is about compactness of `Spin(V_ℝ)` and refers to "the two real rows of 2F"; the real-place images (trivial on SO for either definite sign, all of ℝˣ/(ℝˣ)² when indefinite) are the three ℝ rows of the 2F table at lines 705–707.

   Repair: line 1406 "§§28.1–28.2 and (28.1)–(28.6)"; line 1438 "§§29.2–29.3"; line 89 "2F, real rows: trivial image of SO for definite forms and all square classes for indefinite ones; 2G, compactness of Spin at the real place".

4. **F04** (P3) the §7.7 Check misdescribes the defect of the printed example after nv21 Lemma 24.10

   Location: `README.md` line 1244, "an approximant built for one interval only misses the other (correcting the example after NV21 Lemma 24.10, p. 166)".

   Claim: the printed example is `f_n = α^{−n} + α^{−n+2} + … + α^n` (nv21 p. 166). Its defect is not that it covers one complementary interval only.

   Witness: on the unitary circle α = e^{iθ}, `f_n = sin((n+1)θ)/sin θ`, so `f_n(1) = n + 1 > 2` for every n ≥ 2, violating the first requirement `|f| ≤ 2` on Θ_unit at the tempered point α = 1; on the negative interval α < −1 the exponents are all even when n is even (then f_n ≥ 1 there, both intervals covered) and all odd when n is odd (then f_n ≤ −1 there). So for even n the example covers both intervals and fails the bound; for odd n it fails both.

   Repair: replace the parenthesis by "(the printed example `f_n = α^{−n} + … + α^n` after NV21 Lemma 24.10, p. 166, has `f_n(1) = n + 1 > 2` on the unitary circle, and for odd n is ≤ −1 on the negative interval; the Stone–Weierstrass construction of the proof is what is used)". The Source issues entry below records the erratum.

Head reviewed: `c263049` (the pull request's current head; the checkout was already at it). Package files read in full: `packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md` (1509 lines) and `Suggested.lean` (222 lines, 11 declarations), plus `design/plan.json` (21 gaps), `sources.toml` and the five review/repair reports. No pass-a red-team report exists on the pull request at the time of this pass: its comments are the five review rounds and the four repair notices only, so there is nothing to confirm or contradict from pass a.

The cached extraction of nv21 was still empty (399 bytes, "no PDF text extractor"); the cached PDF was extracted with Ghostscript into the job's scratch directory (9520 lines, printed page headers intact) and every nv21 locator below was checked against that extraction, with printed pages recovered from the running heads.

## Verified sound

Counts: 11 Lean declarations read and instantiated; 63 README targets read (every numbered section §0.1–§9.5 plus the global setting and the Conventions); 71 nv21 locators verified (label and printed page) and 19 of the README's errata claims checked against the extraction; 46 README Checks recomputed; 61 sibling citations resolved (36 at open heads through `roadmaps show`, 22 on main, 3 at the pinned Tau Ceti) and 9 Mathlib declarations located at the pin.

Dependency gate (run from the board checkout, `--movable`): `depcheck: 56 roadmaps, 645 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. This roadmap is at merge-order line 308; AutomorphicSpectralTheory (94), GanGrossPrasadUnitaryGroups (271), SmoothRepresentationsOfLocalGroupsPartII (303, a board package at the design stage, whose design README has SRU.0.6, SRU.2.6, SRU.2.7 at its lines 252, 801, 821) and AlgebraicModuliForArithmeticGeometry (35) are earlier.

### Lean declarations

| Declaration | Context carried | Instances and values | Result |
| --- | --- | --- | --- |
| `IsQuantizationCutoff U χ` | none needed | nv21 §2.2 (p. 25): even, [0,1]-valued, 1 near 0, C_c^∞(𝒢); Lean adds `tsupport χ ⊆ U` for U ∈ 𝓝 0. E = 0: only χ = 1 qualifies (matches §0.5 Check). χ(0) = 1/2: fails `∀ᶠ χ = 1`. | matches source |
| `quantize π χ b v` | `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] [LieGroup 𝓘(ℝ,E) ∞ G] [T2Space G] [CompleteSpace V]`; `volume` is `measureSpaceOfInnerProductSpace` | nv21 (2.1) with a^∨(x) = ∫ a(ξ)e^{−xξ}dξ (p. 25); ξ = 2πi⟨η,·⟩ gives e^{−2πi⟨η,x⟩}, Mathlib `Real.fourier_eq` (line 433 at the pin) has kernel 𝐞(−⟨v,w⟩): a^∨ = 𝓕 b, sign and 2π agree. ℝ, Π_t = e^{itx}, χ = 1 on supp 𝓕b: value b(t/2π) by inversion. E = 0: value χ(0)b(0)v = b(0)v. | correct |
| `exists_norm_quantize_le` | `hG` unimodularity, `0 ≤ δ < 1/2`, `V : Type u` universal, `IsUnitary`, strong continuity explicit | nv21 Prop. 8.7(ii), p. 61: a ∈ S^0_δ, bound uniform in h and continuous in a; Lean hypothesis `h^{δj}(1+‖η‖)^j‖D^j b‖ ≤ M` is Definition 4.3 (4.8) with m = 0 (`⟨ξ⟩^{−|α|}`, `h^{−δ|α|}`), and `fun η ↦ b (h•η)` is a_h (2.2). E = 0, G trivial: ‖quantize‖ = |b(0)|‖v‖ ≤ M‖v‖, C = 1, N = 0. ℝ: Op_h = b(ht/2π) + O(h^∞), bounded by sup|b| ≤ M. M < 0: hypothesis unsatisfiable, vacuously true. Quantifier order ∃U ∀χ ∃C N ∀π h b M matches the README. | correct; unimodularity is unused by the statement (the integral is on E), a P3 note only |
| `IsZariskiClosedMatrixSet S` | field k | `{x : x₁₂x₂₁ = 1}`: ideal (X₁₂X₂₁ − 1). `{x₁₂ ≠ 0}` over infinite k: not closed. ℤ ⊂ ℂ: not closed. | matches §5.2 Checks |
| `ggpBlock h` | `[DecidableEq ι]` | `fromBlocks h 0 0 1`: det = det h; transpose = ggpBlock hᵀ; ι = ∅ gives the 1×1 identity; ι = Unit, h = (c): conjugating [[a,b],[c′,d]] gives [[a, cb],[c′/c, d]] (nv21 p. 97 GL₂ example). | correct |
| `ggpSpectralPolynomial x` | `[Fintype n] [DecidableEq n]` | nv21 §13.4.1 (p. 93): roots of the characteristic polynomial on V⁺, minus one forced 0 in the odd orthogonal case. Size 1, x = 0: X /ₘ X = 1. Size 0: 1. 𝔰𝔬₂: X² + a². 𝔰𝔬₃(a,b,c): (X³ + (a²+b²+c²)X)/X = X² + a² + b² + c². | matches source |
| `InvariantlyEquivalent A Γ x y` | — | Γ = SO₂ on A = 𝔰𝔬₂: conjugation trivial, every f invariant, relation is equality (so [[0,a],[−a,0]] ≁ its negative: the Pfaffian). Γ = GL₂, A = all: [[0,1],[0,0]] ~ 0 (same charpoly). Γ = {1}: equality. Agrees with [x] = [y] in 𝔤//G since restriction k[Mat] → k[A] is G-equivariant and G reductive. | correct |
| `isStable_iff_isCoprime_orthogonal` | `[IsAlgClosed k] [CharZero k]`, `hx : xᵀ = −x` | ι = ∅: x = 0, orbit {0} closed, stabilizer {1}, polys 1 and 1: both sides true. ι = Unit: SO(1) = {1}, every x stable; polys X² + a² and 1: coprime. ι = Fin 2 (SO₃ ⊃ SO₂, x_H = (a), last column (b,c)): polys X² + a² + b² + c² and X² + a², common root iff b² + c² = 0; orbit in coordinates u = b + ic, v = b − ic is {uv = s}: closed hyperbola with trivial stabilizer for s ≠ 0, non-closed line for s = 0, (b,c) = 0 has stabilizer SO₂. ι = Fin 3, x nilpotent in 𝔰𝔬₄ ≅ 𝔰𝔩₂ ⊕ 𝔰𝔩₂ with tr(x_H²) ≠ 0: diagonal PGL₂ acts simply transitively on {(n₁,n₂) : tr(n₁n₂) = c ≠ 0} (U-orbit computation on a = free parameter), stable; polys X⁴ and X² − c′: coprime. | both sides agree on every instance |
| `isStable_iff_isCoprime_unitary` | `[IsAlgClosed k] [CharZero k]` | ι = ∅: trivial group, X − a vs 1. ι = Unit, x = [[a,b],[c,d]]: charpoly(x)(a) = −bc, so coprime iff bc ≠ 0; orbit {(hb, c/h)} closed with trivial stabilizer iff bc ≠ 0, b = 0 ≠ c non-closed, b = c = 0 stabilizer GL₁. | both sides agree |
| `stableFibre_isTorsor_orthogonal` | `[IsAlgClosed k] [CharZero k]`, `hy`, `hz`, `hyz` | ι = Unit: F = {y} (Pfaffian forces equality), SO(1) = {1} acts simply transitively. ι = Fin 2: SO₃-invariants k[a²+b²+c²], SO₂ acts trivially on 𝔰𝔬₂ so a is fixed; F = {b² + c² = q(y) − a′²}, nonzero by coprimality, a G_m-torsor. Dimension count ι = Fin 3: 6 − 3 = 3 = dim SO₃. | matches nv21 Theorem 14.5 |
| `stableFibre_isTorsor_unitary` | same | ι = Unit: F = {x₁₁ = a′, charpoly x = charpoly y} = {b′c′ = p} with p = −charpoly(y)(a′) ≠ 0 by coprimality: GL₁-torsor. ι = ∅: F = {y}, trivial group. | matches |

The `#check` audit of the repair reports (all 11 elaborated types, binders retained) was not rerun here (no Lean is run in this pass); the file is unchanged since `f404589` except for the `specialOrthogonalGroup` substitution recorded at round 2.

### README targets (instances computed)

| Target | Instance tried | Values | Result |
| --- | --- | --- | --- |
| Conventions, Fourier | ℝ, ξ = 2πiη, b = e^{−πη²} | a^∨ = 𝓕b = e^{−πx²}; forward of 1_[0,1] at η = 1/2 is 2i/π, Mathlib's gives −2i/π | sign pinned |
| Conventions, orbit mass | SO(3), sphere radius r | σ = area/r, mass 4πr/2π = 2r; r = l + 1/2 gives 2l + 1 | correct |
| §0.1 j | SU(2) basis −iσ_a/2; ax+b | eigenvalues 0, ±i|x|: j = (sin(|x|/2)/(|x|/2))²; ax+b: j = |(1−e^{−x₁})/x₁|, j(−x) = e^{x₁}j(x) | correct |
| §0.2 Δ | character e^{itx}; regular rep of ℝ | Δ = 1 + t²; δ₀ ∈ π^{−1} since ∫(1+t²)^{−1} < ∞ | correct |
| §0.3 Ψ^m_δ | nv21 Definition 5.2 (p. 37) | θ^δ_u = h^{nδ}θ_u, words of length n | matches |
| §0.4 S^m_δ | nv21 Definition 4.3 (4.8), p. 34 | `|∂^α a| ≤ C h^{−δ|α|}⟨ξ⟩^{m−|α|}`; 1 ∈ S⁰∖S^{−1}; 1 + |ξ|² ∈ S² | matches |
| §0.5 Op, adjoint | ℝ character; χ even | quantize Π_t χ b = b(t/2π); Op(a)* = Op(ā) by x ↦ −x on Lebesgue measure | correct |
| §1.1–§1.2 star product | linear a = ξ(x₀), b = ξ(y₀) | C₁(a,b) − C₁(b,a) = ξ([x₀,y₀]) from {x,y} = ½[x,y] + …; (∂a)^∨ = x a^∨ with e^{−xξ} | correct |
| §1.3 nonstationary phase | φ = ix, ix² on ℝ | O(t^{−∞}) vs t^{−1/2}; L e^{tφ} = e^{tφ} | correct |
| §1.4 Planck localization | δ = 0; ω = 0 | radius ⟨ω⟩/2; width h^{1−δ}, amplitude h^{−n(1−δ)}; ≍ h^{−nδ} centres | correct |
| §1.6 mixed calculus | δ₁ = 0, δ₂ = 0.9 | gain h^{0.1 J} | correct |
| §1.7 cutoff asymptotics | ψ(x) = x | first term +h∂a since (∂a)^∨ = x a^∨; (8.3) needs h^{−|α|} | correct (source misprints confirmed) |
| §1.9 order-zero bound | a = Σ ε_k φ(2^{−k}ξ) | S⁰ seminorms bounded in K, L¹ norm grows | Cotlar–Stein needed; nv21 Lemma 8.10 as printed claims norm convergence (false for rank-one projections) | correct |
| §1.10 polynomial quantization | Heisenberg, orthonormal X,Y,Z | 6 sym(X²Y²) = 6X²Y² − 12ZXY + 3Z², so X²Y² + Y²X² − 2sym(X²Y²) = Z² and sym(⟨ξ⟩⁴) = Δ² − Z² | correct; refutes nv21 §8.7 p. 62 "Op(⟨ξ⟩^{2N}) = Δ^N" |
| §2.1 quotient | 𝔰𝔬(3); GL_n(ℝ) | p = Σξ(X_a)² ≤ 0 on i𝔤^*; quadratic invariant scales by h², |λ| by |h| | correct |
| §2.2 duals | e^{itx} | dual −it, conjugate −it, Hermitian dual it | correct |
| §2.3 temperedness | SL₂(ℝ), ρ(H) = 1 | complementary series λ(H) ∈ (0,1), hλ → 0 | correct |
| §2.4 Casimir shift | quadratic Casimir | γ(sym p) − p = −|ρ|², degree 0 | correct |
| §2.5 division | recursion | b₂ = −(C₂(q,b₀) + C₁(q,b₁))/q from Σ_{l≤j} q⋆_{j−l}b_l = 0 | correct; nv21 p. 79 sign confirmed wrong |
| §2.7 joint localization | G = H = ℝ | functional vanishes unless t = s | consistent; nv21 (10.14) uses hλ_σ for p_G, confirmed |
| §3.1 orbits | 𝔰𝔩₂(ℝ) nilcone; SO(3) sphere | two regular nilpotent orbits; dilation t^{−d}, d = 1, mass 2tr | correct; (6.1) printed with f on 𝔤 confirmed |
| §3.3 Rossmann | SU(2) spin l, r = l + ½ | θ_π j^{1/2} = sin((2l+1)θ/2)/sin(θ/2)·sin(θ/2)/(θ/2) = 2 sin(rθ)/θ = ∫_O e^{xξ}dω | correct |
| §3.6 nilpotent limits | Sp₄(ℝ) holomorphic discrete series | GK dimension 3 < 4 = ½(10 − 2), nongeneric, empty limit | correct; nv21 Lemma 11.6 (p. 86) cites [BV], Rossmann, Kostant 6.7.2 |
| §3.7 trace expansion | nv21 Theorem 12.2 (p. 88) | (12.1) h^{−d}⟨hλ⟩^{d−N}, (12.2) error h^{1−δ}⟨hλ⟩^{d−N−1}, (12.4) pure-degree D_j | matches; "d = maximal dimension" wording on p. 43 confirmed |
| §4.1 K-types | SO(3), L = 2 | (1 + l + l²)² ≥ (2l+1)² with equality at l = 0, 1; Σ(1+l+l²)^{−2} < ∞; L = 1 fails at l = 1 (3 > √3) | correct |
| §4.2 Plancherel–Sobolev | compact group; nv21 Lemma A.3 (p. 138) | Σ dim π dim π^U = |G/U| = vol(U)^{−1}; A.3(i) sup over Ĝ, (ii) ∫ over Ĝ_temp | matches |
| §4.5 relative character | compact H, probability Haar | ∫ conj χ_σ ⟨π(s)v₁,v₂⟩ = ⟨P_σv₁,v₂⟩/dim σ; nv21 (18.2), (18.5) | correct |
| §4.6 disintegration | compact H | Σ_σ dim σ·(dim σ)^{−1}tr(T|π[σ]) = tr T | correct |
| §5.1 fibres | q = x², r = x on ℝ | fibre over (4,2) = {2}, over (1,2) = ∅ | correct; nv21 §16.5 ambient misprint confirmed |
| §5.2 stability | see Lean rows; nv21 Theorem 14.2, Definition 14.3, Lemma 14.4, Lemma 14.8, Remark 14.9 (pp. 97–100) | statements as cited; footnote on the 1-dimensional orthogonal algebra confirmed | matches |
| §5.3 torsor | nv21 Theorem 14.5, Lemmas 14.6–14.7 (pp. 99–100), Theorem 17.1 (p. 117) | principal H-bundle; surjectivity via sphericity (Lemma 13.3, p. 95) | matches; GIT inputs unowned (R01) |
| §5.4–§5.6 forms | 𝔤𝔩₁; 𝔰𝔩₂; nv21 Lemma 16.4, Def. 16.5, (16.3), Theorem 16.7 (pp. 110–111) | γ = β for points; ⟨µ,α^∨⟩dH; three sequences with ±α | matches |
| §5.7 real measures | dx on ℝ; σ = dx∧dy | dx_Leb/√(2π); dxdy/(2π) = §3.1 normalization | consistent |
| §5.8 properness | GL₂ ⊃ GL₁; nv21 Lemma 17.3 (p. 118) | |(hb, c/h)| ≍ max(|h|,|h|^{−1}), ε = 1; source: |s·η| ≥ c₁|s|^{c₂} near a stable ξ | matches |
| §5.9–§5.10 | ℂ^×; nv21 Theorem 17.2 (17.4)–(17.5), Lemma 17.4 (p. 120) "we assume … a complex group" | Riemann-sum ratio → 1 | matches |
| §6.1–§6.4 | nv21 Theorem 19.3 (p. 125): D₀ = 1, order ≤ 2j, degree j, constant Cν(a); (19.9) | as cited; (19.16) printed without h^j confirmed | matches |
| §6.3 tail | GL₂ ⊃ GL₁ over ℝ | Ξ(diag(t,1)) ≍ |t|^{−1/2}(1+log|t|), tail ∫_{|t|>X} |t|^{−3/2}(1+log|t|)dt ≍ X^{−1/2}log X; log weight gives only (1+log X)^{−d} | correct; gaps justified |
| §7.2 | nv21 Theorem 22.2 (pp. 146–147) | (22.10) printed without O(h^N) confirmed; Remark 22.3 keeps absolute values | matches |
| §7.3 | nv21 Lemma 22.4 (p. 148), (22.12)–(22.14) | f, f₁ positive definite supported on 1 + o(1); error O(h^N⟨hλ_σ⟩^{−N}) | matches |
| §7.4 | GL₂(ℚ_p); nv21 Lemma 23.2 (p. 153) | principal congruence J: both constituents have fixed vectors; GL₂(ℤ_p): Steinberg has none | correct |
| §7.6 | nv21 Definition 24.3 (p. 159), (24.3)–(24.4) | tr T₊ ≤ ε, φ₊(1) ≤ ε, all σ ∈ Ĥ | matches |
| §7.7 | PGL₂ unramified component | f_n(1) = n + 1 (R04) | Check wording wrong |
| §8 global setting | nv21 §25.6–25.7 (pp. 170–172) | (U_{n+1},U_n) n ≥ 1 or (SO_{n+1},SO_n) n ≥ 2; τ(G) = τ(H) = 2; G_p compact for p ≠ q; π generic | matches |
| §8.3 | nv21 (26.7), p. 178 | "linear map" O → measures: misnomer confirmed | matches |
| §8.4 | SL₃ principal SL₂ | contains e = E₁₂ + E₂₃ but not e² = E₁₃; centralizer dimension 2 = rank | correct |
| §8.5 | PGL₂(ℝ), SO(p,q) | disconnected | correct |
| §8.6 | nv21 Lemma 27.10 (p. 185) | proof opens "we must show s contains g" and closes "s ≤ g" | misprint confirmed |
| §8.7 | nv21 Lemma 27.3 proof (p. 182) | asserts spinor-norm surjectivity on SO_{n−1}(F_v) for n − 1 ≥ 2; binary anisotropic image is N(E_v^×), global cokernel 𝔸^×/F^×N(𝔸_E^×) ≅ ℤ/2 | README's exclusion justified |
| §8.8 Tamagawa | SO(2) = R¹_{K/F}G_m | τ = 2 (H¹(F, X^*) = ℤ/2, Sha trivial) | correct |
| §9.1–§9.5 | nv21 Theorem 29.1 (p. 190), Theorem 30.1 (p. 194) with the ratio τ(H)/τ(G); Lemma 30.3, Def. 30.2 (p. 195) | as cited | matches (locators R03) |
| Worked examples | all five | recomputed as above | consistent with the targets |

### Sibling and library citations

All of the following exist as cited: AutomorphicSpectralTheory §0.9 (line 252 at its head; it consumes the trace from VonNeumannAlgebras V4, which is an open pull request outside this roadmap's merge-order window, so citing §0.9 is the permitted route), §0.13, §0.14, §4.5, §4.7; AutomorphicFormsOnReductiveGroups Conventions (`G∞ = G(F ⊗ ℝ)`), §0.3 `integrable_height_rpow_neg` with the `vol{H ≤ T} ≤ C T^{r₀+1}` clause, §§2.1–2.4, §2.7 (the `dim Hom_K ≤ dim τ` bound is stated at line 346 for irreducible (𝔤,K)-modules of connected linear groups and proved at line 369 of §2.3); PseudodifferentialOperators P3 (Schwartz kernel theorem at its lines 314–316) and P5 (title "Sobolev, Lp and Hölder mapping estimates"; it promises an almost-orthogonality lemma without a countable or strong-convergence form, which is exactly what `gap:cotlar-stein-strong` asks for); NoncompactQuantumSymmetry M0 items 1 and 2; UnboundedOperators UO-A01–A03, UO-E01; SmoothBanachRepresentations SB2, SB3, SB6; SmoothRepresentationsOfLocalGroups SR.0.3, SR.0.4, SR.1.1, SR.1.4, SR.2.2, SR.2.3, SR.3.1, SR.3.2, SR.3.3 (the tempered-support construction is owned there, lines 2820–2828, and only the Langlands classification is conditional on it), SR.3a.2; ReductiveGroupsPartII RG2.3.6, RG2.4.2 (Iwahori factorization inside it), RG2.4.4; AdelicAlgebraicGroups §§2.2, 2.4, 3.4, 3.5 (local polynomial comparison `‖τ(g)‖_v ≤ c_v‖σ(g)‖_v^N` at its line 3400), 4.2; GeometryOfNumbersAndQuadraticArithmetic §4.2 with 4.2.5 `ratner_measure_classification`, `borel_density_unipotent_generated`, and the ergodic decomposition as `ActionErgodicKernel μ U` (line 1951); GanGrossPrasadUnitaryGroups (rev 1404) §§2.6, 2.7 (log-weighted only, as the gaps say), 3.3, 4.2, 7.4 and the Part II scope sentence at its line 19; LieGroups Layers 0, 1, 3 (`bch`), 5, 7, 9; LieHighestWeight Layers 3, 5, 6, 7 (`pbwSymmetrization : S(L) ≃ₗ[K] U(L)`); CompactGroups Layers 0, 5, 6; NilpotentOrbits N1.1, N2.1, N2.3; HamiltonianReduction R1–R3 with ω_ν(ξ_O,η_O) = ν([ξ,η]); ConvexityToric T4; OperatorIdeals Parts B–C with the three names in its Suggested.lean; DifferentialGeometry 5.2, 5.5; GeometricMeasureTheory G2; OrthogonalSpinGroups 1D, 1E, 2F (binary anisotropic row: index 2), 2H, 3C–3F (2G: R03); Kneser's theorem and local fields beyond ℚ_p are absent there, matching the two declared gaps. Tau Ceti at the pin: `mulInvariantExp` (Exponential/Basic.lean line 55, `[LieGroup I (minSmoothness ℝ 3) G]`), `LieGroup.minSmoothnessThree` (Lie/Basic.lean line 42, a theorem, not a global instance), `TauCeti.ContRepresentation.IsUnitary` (Unitary/Basic.lean line 52: `∀ g v w, ⟪π g v, π g w⟫ = ⟪v, w⟫`), `CliffordAlgebra.spinorNorm` and `range_spinToSpecialOrthogonal_eq_ker_spinorNorm` with the binders the contract states, the Witt directory with `QuadraticMap.IsometryEquiv.exists_extension` and the cancellation theorems. Mathlib at the pin: `ContRepresentation` (a `G →* V →L[R] V`, no orbit continuity), `Real.fourier_eq`, `measureSpaceOfInnerProductSpace`, `RealRMK.integral_rieszMeasure`, `MvPolynomial.zeroLocus`, `Matrix.specialOrthogonalGroup` under `attribute [local instance] starRingOfComm` with `mem_orthogonalGroup_iff'` (`Aᵀ * A = 1`), `SchwartzMap.fourierTransformCLM`, `MeasureTheory.norm_integral_le_integral_norm`.

Duplication by object: `roadmaps grep` for Cotlar, Rossmann, "orbit method", "Nelson operator", quantization/quantize, "relative character", Hilbert–Mumford, microlocal, "Plancherel measure" finds no roadmap on main or at an open head owning a quantization map on unitary representations, Rossmann's formula, orbit trace asymptotics, GGP stability or local relative characters (the "microlocal" hits on main are the hyperfunction roadmap; the "relative character" hits are GanGrossPrasadUnitaryGroups's own Bessel forms, cited here as the unitary supplier). The pinned Tau Ceti has no declaration on any of these objects (its `quantiz` hits are optimal-transport quantizers; its smooth vectors are semigroup-generator smooth vectors). Ownership against open pull requests was checked through `roadmaps grep` over all carried heads.

Policy: the pull request changes only the package folder (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, five reports). No `lemma`, no `set_option`, no pull-request number or process word in README or docstrings, one `import Mathlib` plus two `TauCeti.*` modules that exist at the pin, every target has a locator, no computational algorithm. Gaps: all 21 slugs in `design/plan.json` appear in the README with a named supplier; none asks for something a pin or an earlier roadmap provides (GanGrossPrasadUnitaryGroups declares `local-plancherel`-type gaps of its own on AutomorphicSpectralTheory rather than supplying them). Suggested.lean: no padding (the four definitions are each needed by a stated theorem, no API lemmas, examples or Checks restated); the non-statable headlines are named in the module docstring with the missing carrier for each; no statable headline is missing (Theorem 14.2 and Theorem 14.5 are stated; Lemma 14.8's cyclicity clause is a sub-clause of §5.2, not a separate headline; the composition law §1.1 and the adjoint formula §0.5 are API, not headlines).

## Not verifiable

- nv21 claims the README makes about the proofs of Lemma 7.6 (intermediate estimate ρ^{j−r}, p. 49), Lemma 7.11's exclusion of δ = 0 as a defect (the source fixes δ ∈ (0,1] by choice), §2.5's "mixed rescaled/unscaled notation" (p. 28), Lemma 19.5's narrow-symbol mass and trace prefactor (pp. 129–131), and the end of §19 (p. 136) were not checked line by line; the surrounding statements were.
- Lemma A.1's `κ = −cΣx²` was verified by the round-2 repair against the arXiv text; the Ghostscript extraction of Appendix A was not re-read for it.
- rossmann78, rangarao72, barbasch-vogan80, kostant63, kostant78 are settled uncertified; their locators were not opened. rallis-schiffmann (cached, 220 kB) was not opened: its only use is the Remark 14.9 attribution, which nv21 p. 100 confirms.
- The `#check @name` binder audit requires Lean, which this pass does not run; the round-2 and round-4 reports record it for the 11 declarations.
- The gap `section` strings "Layers 0–2: local spectral extension …" (AutomorphicSpectralTheory) name no section of that roadmap (it has Layers 0–7 and no local Plancherel, Harish-Chandra character or Ξ material); the same label is used by GanGrossPrasadUnitaryGroups's own gap declarations, and a gap's section label is not a finding under the brief.
- SmoothRepresentationsOfLocalGroupsPartII is a board package at the design stage (merge order line 303); its SRU labels were checked in its design README only, as no other version exists.

## Source issues

- **Error** in nv21 at Lemma 8.10, printed p. 61–62: the source says the Cotlar–Stein sum converges in the Banach space of bounded operators with norm at most C; it should be strong convergence (rank-one orthogonal projections on ℓ² satisfy (8.19) with C = 1 and every tail has norm 1); affects the proof (of Proposition 8.7).
- **Error** in nv21 at §8.7, printed p. 62: the source says Op(p) = Δ^N when p(ξ) = ⟨ξ⟩^{2N}; it should be equality modulo lower order only (on the Heisenberg algebra sym(⟨ξ⟩⁴) = Δ² − Z²); affects the proof (order inclusions of Theorem 5.6).
- **Gap** in nv21 at the proof of Lemma 27.3, printed p. 182: the source says the spinor norm is surjective on SO_{n−1}(F_v) for n − 1 ≥ 2 and concludes surjectivity of G(F)H(𝔸) onto G(𝔸)/G(𝔸)⁺; it should exclude the binary anisotropic V_H, whose local image is the index-2 norm group and whose global cokernel is ℤ/2 by class field theory, and treat definite V_H at real places through G(F); affects a stated result (Theorem 27.1, hence Theorem 30.1, for SO(3) ⊃ SO(2) when Π ≅ Π ⊗ (η_{K/F}∘θ)).
- **Gap** in nv21 at Theorem 22.2 (22.10), printed p. 147: the source says |k_h(σ) − H_σ(Op_h(a)²)| ≤ |H_σ(Op_h(a₂)²)| for all tempered σ with hλ_σ ∈ U and O_{π,σ} ≠ ∅; it should carry an O(h^N) term, since both sides are O(h^N) but not zero where a₂ has no fibre mass; affects a stated result.
- **Gap** in nv21 at the proof of Lemma 7.8, printed p. 50: the source says D = |∂φ|^{−2}Δ reproduces e^{tφ} and integrates it by parts; it should use a first-order operator L = t^{−1}|∇φ|^{−2}Σ conj(∂_jφ)∂_j, since Δ e^{tφ} has the extra term tΔφ e^{tφ}; affects the proof.
- **Error** in nv21 at the example after Lemma 24.10, printed p. 166: the source says f_n = α^{−n} + α^{−n+2} + … + α^n satisfies the lemma for large n; it should not, since f_n(1) = n + 1 > 2 on the unitary circle and f_n ≤ −1 on the negative complementary interval for odd n; affects nothing (an illustration).
- **Misprint** in nv21 at Lemma 7.14, printed p. 56: the source says the expansion has coefficients (−h)^j; it should be h^j, since (∂^αa)^∨ = x^αa^∨ and ∂^α(a_h) = h^{|α|}(∂^αa)_h; affects a stated result.
- **Misprint** in nv21 at Lemma 8.1 (8.3), printed p. 57: the source says ∂^α a_h^∨(x) ≪ h^{−dim 𝔤}⟨x/h^{1−δ}⟩^{−N}; it should carry the factor h^{−|α|}; affects a stated result.
- **Misprint** in nv21 at (10.14), printed p. 82: the source says H(Op_h(p)T) = p(hλ_σ)H(T) for every generator p, including the G-invariants; it should be p(hλ_π) for p ∈ {p_G}; affects the proof.
- **Misprint** in nv21 at Theorem 19.4 (19.16), printed p. 128: the source says H(Op_h(a)) = Σ_{j<J} ∫ D_j a + O(h^{(1−2δ)J}); it should carry h^j on the j-th term, as (19.17) and Theorem 19.3 (19.8) do; affects a stated result.
- **Misprint** in nv21 at the proof of Lemma 27.10, printed p. 185: the source concludes s ≤ g; it should conclude g ⊆ s, which is what the proof shows; affects nothing.
- **Misprint** in nv21 at §6.2, printed p. 43: the source says d is the maximal dimension of a coadjoint orbit and every orbit in O_π is 2d-dimensional; it should say d is half the maximal dimension; affects nothing.
- **Misprint** in nv21 at (6.1), printed p. 42: the source says f ∈ C_c^∞(𝔤); it should be C_c^∞(𝔤^∧), where the orbital measures live; affects nothing.
- **Misprint** in nv21 at §16.5, printed p. 110: the source says O^{λ,µ} is a fibre of 𝔤^* × 𝔥^* → [𝔤^*] × [𝔥^*]; it should be a fibre of 𝔤^* → [𝔤^*] × [𝔥^*], x ↦ ([x],[x_H]), as in Theorem 14.5; affects nothing.
- **Misprint** in nv21 at the display defining h^ηS^m_δ after Definition 4.3, printed p. 34: the source says the exponent is m − α; it should be m − |α|; affects nothing.
- **Misprint** in nv21 at the proof of Lemma 10.1, printed p. 79: the source says b₂ = (−q⋆₂b₀ + q⋆₁b₁)/q; it should be −(q⋆₂b₀ + q⋆₁b₁)/q, from the h² coefficient of q ⋆_h Σh^jb_j = a; affects the proof.
- **Misprint** in nv21 at (26.7), printed p. 178: the source calls ξ ↦ [δ_ξ] a G-equivariant linear map from O; it should say a G-equivariant assignment (only the induced map on test functions is linear); affects nothing.
- **Misprint** in nv21 at the proof of Theorem 29.1, printed p. 191: the source writes the Hilbert–Schmidt Cauchy–Schwarz bound with the factor tr(T₁*T₂); it should be tr(T₁*T₁), the factor shown to be O(h^∞) two lines later; affects nothing.
- **Misprint** in nv21 at (7.10), printed p. 51: the source bounds the moments ∫|a_h^∨||x|^n by A^{−n} for a localized a ∈ S^m_δ; it should carry the weight ⟨ω⟩^m that (7.9) displays; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c263049", "job": "RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~1b", "model": "fable", "worker": "fable-rt223"} -->

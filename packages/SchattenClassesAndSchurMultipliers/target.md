Verdict: design
Name: SchattenClassesAndSchurMultipliers
Base: none
Owner: none

## Scope

The roadmap builds Schur multipliers on the Schatten classes of `L²(Ω, μ)` for a σ-finite measure
space, from the kernel description of Hilbert–Schmidt operators up to the Hörmander–Mikhlin–Schur
criterion of Conde-Alonso, González-Pérez, Parcet and Tablate. Scalars are complex throughout.
The Schatten classes themselves are not planned here: they are existing work, imported by section
(see Suppliers). What this roadmap owns:

1. **The Schatten interface on `B(H)`.** The compact endpoint `S_∞(H)` (compact operators with the
   operator norm; the `p = ∞` family of OperatorIdeals OI-B80 is all of `B(H)`, so the compact
   endpoint and the inclusions `S_p ⊆ S_∞` for `p < ∞` are stated here), the comparison of the
   OperatorIdeals carrier `S_p` with NoncommutativeIntegration's `L^p(B(H), Tr)`, and the
   restatement, on that carrier, of the imported facts the multiplier theory uses: trace, cyclicity,
   Hölder, finite-rank density, trace duality `S_p^* = S_{p'}` under `(A, B) ↦ Tr(AB)`, and the
   complex-interpolation identity `[S_{p_0}, S_{p_1}]_θ = S_{p_θ}`. The roadmap states these as
   imports with their owner and section, never re-proves them.
2. **Hilbert–Schmidt kernels.** For σ-finite `(Ω, μ)` and `k ∈ L²(Ω × Ω, μ ⊗ μ)` the integral
   operator `T_k`, `‖T_k‖₂ = ‖k‖_{L²}`, the unitary `L²(Ω × Ω) ≅ S₂(L²(Ω))`, the kernel `k_A` of
   `A ∈ S₂`, the kernel calculus (adjoint, composition, kernel of `D_f A D_g` for multiplication
   operators, finite-rank operators) and the trace formula `Tr(AB) = ∫∫ k_A(x, y) k_B(y, x)`.
   The abstract identifications `S₂(H, K) ≅ K ⊗̄ H̄` and `L²(μ) ⊗̂ L²(ν) ≅ L²(μ ⊗ ν)` are
   VonNeumannAlgebras' (V4.Core, V2.RectangularL2); this roadmap owns their composite with the
   explicit integral formula.
3. **Schur multipliers.** `S_M(A) = T_{M · k_A}` on `S₂` for `M ∈ L^∞(Ω × Ω)`, its norm `‖M‖_∞`,
   dependence on the a.e. class, algebra laws (`S_{MN} = S_M S_N`, adjoint symbol, invariance under
   measure-preserving maps and under passage to an equivalent measure), the `S_p`-norm
   `‖S_M‖_{S_p → S_p}` as a supremum over `S₂ ∩ S_p`, density of `S₂ ∩ S_p` in `S_p` and the
   unique bounded extension, the finite case `Ω` finite with counting measure as the Hadamard
   product, and the completely bounded norm by amplification `M_m(x, i, y, j) = M(x, y)` on
   `Ω × {1, …, m}`, with its agreement with the `Ω × ℕ` form and, at `p = ∞`, with the cb norm of
   CStarAlgebras C3.2 for the map `S_M : S_∞ → S_∞` of operator spaces.
4. **The main theorems** listed under Final targets: transposition duality and the interpolation
   inequalities; the Schur product theorem and the Grothendieck–Haagerup characterisation at
   `p = 1, ∞`; Lafforgue–de la Salle's atomless and continuous-symbol theorems; Toeplitz symbols on
   `ℝⁿ`, Fourier–Schur transference, and the Hörmander–Mikhlin–Schur theorem, together with the
   matrix BMO space and the interpolation `[BMO, S₂]_{2/p} ≅ S_p` its proof needs, which nobody
   else on the board owns.

Boundaries. Schatten classes for `0 < p < 1` are NoncommutativeIntegration §1.5. Noncommutative
`L^p` of general von Neumann algebras, Fourier multipliers on group von Neumann algebras of
non-abelian groups, and approximation properties of groups (Lafforgue–de la Salle §2 onwards) are
outside. Hardy-space Toeplitz operators (OperatorTheory/ToeplitzOperators) are a different object
from the Toeplitz symbols `m(x − y)` here and are not used. Double operator integrals and
operator-Lipschitz functions are consumers, not content.

Placement. The roadmap is a natural ninth member of the OperatorTheory family (alongside
OperatorIdeals and ToeplitzOperators); the design may file it as
`TauCetiRoadmap/OperatorTheory/SchattenClassesAndSchurMultipliers` or at top level. In the merge
order it must sit after NoncommutativeIntegration (its deepest supplier).

Generality. The target form states everything at the generality the open sources support:
arbitrary σ-finite `(Ω, μ)` for the kernel theorem, the multiplier definitions and the atomless
theorem; σ-finite Radon measures on locally compact spaces for continuous symbols; `ℝⁿ` with
Lebesgue measure for the Toeplitz and Hörmander–Mikhlin–Schur results. Two wordings of the form are
special cases and become Checks: the Grothendieck–Haagerup characterisation is stated for σ-finite
`(Ω, μ)` at `p = ∞` and `p = 1` (Lafforgue–de la Salle, Theorem 1.7), the finite matrix case being
the Check; the Schur product theorem is stated for finite `Ω` as a complete-positivity statement,
with the matrix positive-semidefiniteness half already in Mathlib (`Matrix.PosSemidef.hadamard`).

## Final targets

Notation: `(Ω, μ)` σ-finite, `H = L²(Ω, μ)`, `1 ≤ p ≤ ∞`, `p'` the conjugate exponent,
`M ∈ L^∞(Ω × Ω, μ ⊗ μ)`, `M^t(x, y) = M(y, x)`.

- **F1 (kernel theorem).** For `k ∈ L²(Ω × Ω)`, `T_k g(x) = ∫ k(x, y) g(y) dμ(y)` is defined a.e.,
  bounded, Hilbert–Schmidt with `‖T_k‖₂ = ‖k‖_{L²}`; `k ↦ T_k` is a unitary
  `L²(Ω × Ω) → S₂(H)`; every `A ∈ S₂(H)` has a unique kernel `k_A`;
  `k_{A^*}(x, y) = conj k_A(y, x)`, `k_{AB}(x, y) = ∫ k_A(x, z) k_B(z, y) dμ(z)`,
  `Tr(AB) = ∫∫ k_A(x, y) k_B(y, x) dμ(x) dμ(y)` for `A, B ∈ S₂`.
  Locators: lafforgue-delasalle-2011 §1.2, lines 226–232 and Remark 1.2 (line 239);
  reed-simon-1-1980 §VI.6, Theorem VI.23 (uncertified).
- **F2 (multipliers on `S₂`).** `S_M(A) := T_{M · k_A}` is bounded on `S₂(H)` with norm
  `‖M‖_∞`, depends only on the a.e. class of `M`, and `M ↦ S_M` is an isometric
  `*`-homomorphism `L^∞(Ω × Ω) → B(S₂(H))` for the symbol operations `M N` and
  `M̃(x, y) = conj M(y, x)`. Locators: lafforgue-delasalle-2011 lines 230–232, 267–268;
  cgpt-2023 §1.1, lines 224–226.
- **F3 (multipliers on `S_p`).** `‖S_M‖_{S_p → S_p} := sup { ‖S_M(A)‖_p : A ∈ S₂ ∩ S_p, ‖A‖_p ≤ 1 }`;
  `S₂ ∩ S_p` is dense in `S_p` (for `p = ∞`, in the compact operators), so finiteness gives a
  unique bounded extension `S_M : S_p → S_p`. The cb norm
  `‖S_M‖_{cb, p} := sup_m ‖S_{M_m}‖_{S_p(L²(Ω × {1..m}))}` equals the norm of the multiplier with
  symbol `M̃(x, i, y, j) = M(x, y)` on `S_p(L²(Ω × ℕ))`, equals the `Ω × Ω'` amplification for any
  σ-finite `(Ω', ν)` with `L²(ν)` infinite-dimensional, and at `p = ∞` equals the cb norm of
  CStarAlgebras C3.2. Norms are monotone under `ν ≪ μ` and unchanged under equivalent measures and
  measure-preserving isomorphisms. Locators: lafforgue-delasalle-2011 lines 183–190 (cb maps,
  equation (2)), lines 233–238, Lemma 1.5 (line 254), Remark 1.6 (line 262), Lemma 1.9 (line 342);
  cgpt-2023 lines 217–229.
- **F4 (duality and interpolation).** `‖S_M‖_{S_p → S_p} = ‖S_{M^t}‖_{S_{p'} → S_{p'}}` and the same
  for cb norms, through `Tr(S_M(A) B) = Tr(A S_{M^t}(B))`; for `2 ≤ p ≤ q ≤ ∞`,
  `‖M‖_∞ = ‖S_M‖_{S₂ → S₂} ≤ ‖S_M‖_{S_p → S_p} ≤ ‖S_M‖_{S_q → S_q} ≤ ‖S_M‖_{S_∞ → S_∞}`, and the
  same for cb norms, by `[S_p, S_{p'}]_θ = S_q`. Locators: lafforgue-delasalle-2011 Remark 1.3
  (line 244), Remark 1.4 (line 246).
- **F5 (finite `Ω`).** For `Ω` finite with counting measure, `S_M(A) = M ⊙ A` (Mathlib's
  `Matrix.hadamard`). Schur product theorem: if `M` is positive semidefinite then `S_M` is
  completely positive on `M_n(ℂ)` with `‖S_M‖ = ‖S_M‖_{cb} = max_j M(j, j)` (the
  positive-semidefiniteness of `M ⊙ A` is Mathlib `Matrix.PosSemidef.hadamard`).
  Grothendieck–Haagerup characterisation, general form: for σ-finite `(Ω, μ)` and `p ∈ {1, ∞}`,
  `‖S_M‖_{S_p → S_p} = ‖S_M‖_{cb, p} = inf ‖ξ‖_{L^∞(Ω; K)} ‖η‖_{L^∞(Ω; K)}` over separable
  Hilbert spaces `K` and measurable `ξ, η : Ω → K` with `M(x, y) = ⟨ξ(x), η(y)⟩` a.e.; Check:
  finite `Ω`, where it reads `M(j, k) = ⟨ξ_j, η_k⟩` with `sup ‖ξ_j‖ sup ‖η_k‖ ≤ C`.
  Locators: lafforgue-delasalle-2011 Theorem 1.7 (line 274); pisier-grothendieck-2012
  Proposition 3.3 (line 781), Theorem 3.2 (line 776), Remark 13.4 (line 2086);
  paulsen-2002 Ch. 3 and Ch. 8 (uncertified); horn-johnson-topics-1991 Ch. 5 (uncertified).
- **F6 (Lafforgue–de la Salle).** (i) If `μ` has no atoms, `‖S_M‖_{S_p → S_p} = ‖S_M‖_{cb, p}` for
  every `1 ≤ p ≤ ∞`. (ii) For `Ω` locally compact, `μ` a σ-finite Radon measure, `M` continuous
  and `C > 0`: `‖S_M‖_{S_p → S_p} ≤ C` iff for every finite `Σ ⊆ supp μ` the matrix multiplier
  `M|_{Σ × Σ}` on `S_p(ℓ²(Σ))` has norm `≤ C`; the same for cb norms; hence the norm depends only
  on `supp μ`, and equals the cb norm when `supp μ` has no isolated point. The proof tools
  (conditional expectation of symbols along a sub-σ-algebra, Lemma 1.10; the martingale limit
  along a generating filtration, Lemma 1.11; the cb-norm invariance under σ-algebra change,
  Lemma 1.13; the equal-measure refinement lemma, Lemma 1.17) are owned here.
  Locators: lafforgue-delasalle-2011 Theorem 1.18 (line 505), Theorem 1.19 (line 524),
  Lemmas 1.10, 1.11, 1.13, 1.17 (lines 363, 383, 415, 489); cgpt-2023 §1.1 properties i)–ii)
  (lines 231–238).
- **F7 (Toeplitz symbols and transference).** For `m ∈ L^∞(ℝⁿ)` the Toeplitz (Herz–Schur) symbol
  `M(x, y) = m(x − y)` and the Fourier multiplier `T_m` on `L^p(ℝⁿ)` (Mathlib
  `fourierMultiplierCLM` on tempered distributions, restricted to `L^p`) satisfy
  `‖S_m‖_{cb, S_p(L²(ℝⁿ))} = ‖T_m‖_{cb, L^p(ℝⁿ)}` for `1 ≤ p ≤ ∞`, where the right-hand side is
  the cb norm for the natural operator-space structure of `L^p(ℝⁿ)` identified with
  `L^p` of the group von Neumann algebra of `ℝⁿ` by Plancherel; the inequality `≤` holds for every
  locally compact group and the equality for amenable ones. Check: the discrete case `ℤⁿ`
  (Neuwirth–Ricard). Locators: cgpt-2023 (FS), lines 59–72; caspers-delasalle-2015 Theorem 4.2
  (line 485), Theorem 5.2 (line 543), Corollary 5.3 (line 626); neuwirth-ricard-2011 Theorem 2.7
  (line 516).
- **F8 (Hörmander–Mikhlin–Schur, the acceptance theorem).** For `1 < p < ∞` and
  `M ∈ C^{[n/2]+1}(ℝⁿ × ℝⁿ ∖ {x = y})`,
  `‖S_M‖_{S_p(L²(ℝⁿ)) → S_p(L²(ℝⁿ))} ≤ C_n (p²/(p − 1)) |||M|||_{HMS}` with
  `|||M|||_{HMS} = Σ_{|γ| ≤ [n/2]+1} ‖ |x − y|^{|γ|} ( |∂_x^γ M(x, y)| + |∂_y^γ M(x, y)| ) ‖_∞`;
  the same bound holds for the cb norm (atomless case of F6). Optional strengthening: the Sobolev
  form of order `n/2 + ε` (Theorem A′). The proof route the design must plan: Mei's operator-valued
  BMO on `ℝⁿ`, the matrix BMO seminorm on `B(L²(ℝⁿ))` through the twisted embedding
  `π(A) = (e^{2πi⟨·, x−y⟩} A_{xy})`, the complete isomorphism `[BMO, S₂(ℝⁿ)]_{2/p} ≅_{cb} S_p(ℝⁿ)`
  for `2 ≤ p < ∞` with constant `≈ p`, the endpoint estimate `‖S_M : S_∞ → BMO‖ ≤ C |||M|||_{HMS}`
  by twisted Fourier multipliers and Calderón–Zygmund arguments, and interpolation.
  Locators: cgpt-2023 Theorem A (lines 149–154), §1.2 (lines 241–318), Theorem 1.1 (line 313),
  §2 step 1 (lines 560–571), Remark 2.1 (line 1042), Theorem A′ (line 1070);
  grafakos-classical-2014 Theorem 6.2.7 (uncertified) for the classical statement it amplifies.

`Suggested.lean` should state F1, F2, F4, F5 (Haagerup, general form), F6 (both parts), F7
(for `ℝⁿ`) and F8, each with `sorry`, on Mathlib carriers (`MeasureTheory.Lp`, `Measure.prod`,
`Matrix`, `fourierMultiplierCLM`) plus the minimal definitions of `S_p`, `T_k`, `S_M` and the
amplified norms; no sorry'd data.

## Suppliers

All on main unless a pull request is named; sections as in the owner's README.

- **OperatorTheory/OperatorIdeals** (main): Part A approximation numbers and finite-rank
  approximability (OI-A25–A29); Part B the Schatten gauge and families `OI-B76`–`OI-B88`
  (definition, completeness `OI-B24`, two-sided ideal inequality, scale monotonicity and
  inclusions), the Hilbert–Schmidt energy and norm `OI-B32`–`OI-B41`, the trace-class family
  `OI-B29`–`OI-B30`; Part C the column model and `OI-C14` (Hilbert–Schmidt ⇒ compact).
  Note the `p = ∞` family `OI-B80` is `B(H)`; the compact endpoint is defined here.
- **OperatorTheory/PolarDecomposition** and **Majorization** (main): modulus, polar
  decomposition, unitarily invariant norms for the matrix statements.
- **VonNeumannAlgebras** (PR #889; merge order line 5): V4.Core — canonical trace `Tr`, trace
  class iff `Tr|x| < ∞`, cyclicity, Hilbert–Schmidt pairings, `B(H) = S₁(H)^*`,
  `S₂(H, K) ≅ K ⊗̄ H̄`; V2.RectangularL2 — `L²(μ) ⊗̂ L²(ν) ≅ L²(μ ⊗ ν)`; V8.RegularL2 — the
  regular representation and group von Neumann algebra of a locally compact group (for F7).
- **NoncommutativeIntegration** (PR #864; merge order line 281): §1.3 density of bounded
  finite-trace-support elements (finite-rank density in `S_p`), §1.4 Hölder, §1.5 the isometric
  identification `L^p(B(H), Tr) = S_p` with OperatorIdeals' carrier and the commutative
  identification `L^p(L^∞(Ω)) = L^p(Ω)`, §2.1 `L^p`–`L^q` duality and reflexivity, §2.3 the
  complex method, §2.5 interpolation of semifinite `L^p` couples, §2.6 noncommutative
  Riesz–Thorin, §4.4 Bochner spaces `L^p(Ω; L^p(M))` (for Mei's BMO in F8).
- **CStarAlgebras** (PR #860): §3.2 completely bounded maps, amplification and Smith's lemma;
  §4 completely positive maps (F5).
- **BanachSpaceTheory** (main): B1 duality, B4 nuclear operators and the Hilbert
  nuclear/trace-class identification, B6 Grothendieck's inequality (the constant in Pisier's
  Theorem 3.2 form of F5, optional).
- **PDE** (main Lane B items 9–10; PR #93 §2.2–2.3): the scalar Riesz–Thorin theorem, the
  Calderón–Zygmund operator theory and the Mihlin–Hörmander multiplier theorem on `L^p(ℝⁿ)`
  (F7 as the classical half, and the Calderón–Zygmund estimates in F8).
- **Mathlib**: `Matrix.hadamard`, `Matrix.PosSemidef.hadamard` (Schur product theorem, matrix
  half), the Hadamard three-lines theorem, `fourierMultiplierCLM`, `MeasureTheory.Lp`,
  `Measure.prod`, `LinearMap.singularValues`, `IsCompactOperator`.

Related but not suppliers: RandomMatrices §8.3 (continuous kernels on locally compact Polish
spaces), RepresentationTheory/CompactGroups (continuous kernels on compact groups),
UnboundedOperators PR #1027 UO-E01 (absolute-kernel domains on `L²(ℝ)`): none owns the σ-finite
`L²`-kernel theorem F1; the design should state F1 so that those roadmaps could consume it.

## Consumers

- Schur multipliers on noncommutative `L^p` and Fourier multipliers of group algebras: a future
  roadmap on approximation properties by Schur multipliers (Lafforgue–de la Salle §2, their
  `Λ^{Schur}_{p, cb}`), which NoncommutativeIntegration explicitly leaves outside its scope.
- Operator-Lipschitz functions and double operator integrals on `S_p` (potapov-sukochev-2011
  Theorems 1 and 7, lines 76 and 339), which are Schur multipliers with divided-difference
  symbols.
- NoncommutativeGeometry N3 and N5 (Schatten commutator estimates), OperatorAlgebraDynamics
  (matrix Schur multipliers as examples), matrix analysis consumers of F5.
- Any roadmap on Herz–Schur multipliers of groups or on the Arazy conjecture (cgpt-2023 lines
  109–125, 179–191).

## Sources

Recorded in `packages/SchattenClassesAndSchurMultipliers/sources.toml`.

Open (read, certified):
- `lafforgue-delasalle-2011` — V. Lafforgue, M. de la Salle, Duke Math. J. 160 (2011), arXiv
  1004.2327 v3: §1.1 cb maps on `S_p` (lines 180–199), §1.2 definitions and Remarks 1.2–1.4,
  Lemma 1.5, Remark 1.6, Theorem 1.7, Lemma 1.9, §1.4 Lemmas 1.10–1.13 and 1.17, Theorem 1.18,
  §1.5 Theorem 1.19, §2 Notation 2.1 (Herz–Schur symbols, line 597). Arxiv v3 numbering was read;
  the design must check it against the Duke version before citing published numbers.
- `cgpt-2023` — J. M. Conde-Alonso, A. M. González-Pérez, J. Parcet, E. Tablate, Ann. of Math.
  198 (2023), arXiv 2201.05511 v4: introduction (FS) and (HMS) lines 56–100, Theorem A lines
  149–154, §1.1 lines 206–238, §1.2 matrix BMO lines 241–318, Theorem 1.1, §2 lines 560–575,
  Remark 2.1, Theorem A′.
- `pisier-grothendieck-2012` — G. Pisier, Bull. AMS 49 (2012), arXiv 1101.4195 v3: Theorem 3.2
  and Proposition 3.3 (lines 767–800), Remark 13.4 (line 2086).
- `caspers-delasalle-2015` — M. Caspers, M. de la Salle, arXiv 1303.0135 v2 (Trans. AMS 367):
  Theorem 3.1 (line 282), Theorem 4.2, Theorem 5.2, Corollary 5.3, Theorem 6.2 (interpolation).
- `neuwirth-ricard-2011` — S. Neuwirth, É. Ricard, Canad. J. Math. 63 (2011), HAL hal-00451399:
  Theorem 2.1 (line 349), Theorem 2.7 (line 516).
- `potapov-sukochev-2011` — D. Potapov, F. Sukochev, Acta Math. 207 (2011), arXiv 0904.4095 v3:
  Theorem 1 (line 76), Theorem 7 (line 339); consumer-side only.

Paywalled, cited by locator (uncertified): `simon-trace-ideals-2005` Ch. 1–3;
`gohberg-krein-1969` Ch. III; `reed-simon-1-1980` §VI.6 (Theorem VI.23 for F1);
`pisier-similarity-2001` Ch. 5; `paulsen-2002` Ch. 3 and Ch. 8; `grafakos-classical-2014`
Theorem 1.3.4 and Theorem 6.2.7; `horn-johnson-topics-1991` Ch. 5. Every statement they are
cited for is also covered by an open source above, so none blocks the design.

To be fetched by the design (not yet in the manifest): T. Mei, *Operator valued Hardy spaces*,
Mem. Amer. Math. Soc. 188 (2007), no. 881, for the operator-valued BMO space of F8 (cgpt-2023
cites it as [33], lines 252–262); M. Bożejko, G. Fendler, *Herz–Schur multipliers and completely
bounded multipliers of the Fourier algebra of a locally compact group*, Boll. Un. Mat. Ital. (6)
3-A (1984), for the `p = ∞` case of F7 (lafforgue-delasalle-2011 line 602).

## Risks

1. **The acceptance theorem F8 sits far above the library.** Its proof needs operator-valued BMO
   (Mei), the matrix BMO of cgpt-2023 §1.2, the complete isomorphism
   `[BMO, S₂]_{2/p} ≅ S_p` (Theorem 1.1), twisted Fourier multipliers and Calderón–Zygmund
   estimates on `S_∞ → BMO`, and noncommutative Riesz–Thorin. None of the BMO material is owned
   anywhere on the board. The design must either plan it as the roadmap's last layers, with Mei's
   memoir fetched and read, or carve it into a Part II and keep F8 in `Suggested.lean` as the
   acceptance statement with the BMO interpolation as an explicitly planned layer. Stating F8
   without planning its route would violate the "no bypassed theory" principle.
2. **Transference F7 is heavy.** The equality of cb norms needs `L^p` of the group von Neumann
   algebra of `ℝⁿ` identified with `L^p(ℝⁿ)` (VonNeumannAlgebras V8 plus NoncommutativeIntegration
   §1.5 plus Plancherel), the natural operator-space structure of `L^p`, and Caspers–de la Salle's
   Følner-ultraproduct argument with their interpolation Theorem 6.2. The discrete `ℤⁿ` case
   (Neuwirth–Ricard) is a cheaper first stage; the design must decide whether F7 is a final target
   or a stated bridge.
3. **Supplier depth and carriers.** The elementary Schatten facts (Hölder, duality, finite-rank
   density, interpolation) are imported through NoncommutativeIntegration's identification
   `L^p(B(H), Tr) = S_p` (§1.5), which depends on VonNeumannAlgebras Layers 10–11 and sits at line
   281 of the merge order. The roadmap therefore lands late. The design must align three carriers:
   OperatorIdeals' `S_p` family, NoncommutativeIntegration's `L^p(B(H), Tr)` (whose `p = ∞` is
   `B(H)`), and the compact endpoint `S_∞` of the sources.
4. **Three definitions of the cb norm** (amplification over `m`, the `Ω × ℕ` symbol, CStarAlgebras
   C3.2 at `p = ∞`) must be proven to agree (lafforgue-delasalle-2011 equation (2) and Lemma 1.5);
   Pisier's operator-space structure on `S_p` for `p < ∞` is not on the board and should not be
   needed if the amplification definition is primary.
5. **Measure-theoretic fine print.** A.e. classes of symbols on `Ω × Ω`, σ-finiteness for Fubini
   in F1, the notion of atom in F6(i), Radon measures and supports in F6(ii), conditional
   expectations of symbols along `𝒜 ⊗ 𝒜` (Mathlib's `condExp` on the product) and the
   filtration-limit Lemma 1.11 all need careful carriers.
6. **Paywalled textbooks.** Simon, Gohberg–Krein, Reed–Simon, Pisier's LNM, Paulsen, Grafakos and
   Horn–Johnson are uncertified. This is harmless for the design because every main statement is
   corroborated in the open sources, but theorem numbers inside those books (e.g. Reed–Simon
   Theorem VI.23) are cited from memory and must not be relied on without the text.

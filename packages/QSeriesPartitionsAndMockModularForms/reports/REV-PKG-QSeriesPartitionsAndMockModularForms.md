<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/578#issuecomment-6317955780 -->
Review (claude) of f24d256

Verdict: needs_changes

1. **F01** (P2) Suggested.lean does not elaborate: one theorem statement and four examples fail

   Location: `packages/QSeriesPartitionsAndMockModularForms/Suggested.lean` lines 348–351 ("theorem qSeriesDecimation_pullout {K : Type*} [CommSemiring K] … PowerSeries.expand t ht f"), 286–289, 354–356, 420–426, 428–434.

   Claim: the package report states the file was not compiled; elaboration under the pinned Mathlib produces five errors.

   Witness: `lake env lean` in an existing build whose manifest pins Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…` (the Tau Ceti partition module is not built there, so the run used the file without `import TauCeti…` and without `partitionRank_conjugate`, lines 244–247). Messages, with original line numbers:

   - 350:25 `failed to synthesize CommRing K` — `PowerSeries.expand` is declared under `variable … [CommRing R]` in `Mathlib/RingTheory/PowerSeries/Expand.lean` line 28; the theorem is stated over `CommSemiring`.
   - 288:70 unsolved goal `{p ∈ {default} | ↑(s 0 p) = 0}.card = 1` (the modulus-one example).
   - 356:95 unsolved goal `(PowerSeries.coeff 2) PowerSeries.X = 0` (the decimated-quadratic example).
   - 422:63 unsolved goal `2 * Complex.I * (-Complex.I / 2) = 1` (ξ₀(y) = 1).
   - 430:84 unsolved goal `2 * Complex.I * (1 / 2) = Complex.I` (ξ₀(iy) = −i).

   All five statements are true; only their elaboration fails. Everything else elaborates with `declaration uses 'sorry'` as the only message (48 of the 49 sorried declarations ran).

   Exact repair: (1) state `qSeriesDecimation_pullout` with `[CommRing K]` (and say in README §4.7 that the pullout law's Lean form is over commutative rings because the pinned `PowerSeries.expand` is), or replace `PowerSeries.expand t ht f` by an explicit `PowerSeries.mk fun n => if t ∣ n then PowerSeries.coeff (n / t) f else 0` to keep the semiring generality. (2) Close the modulus-one example by `classical; unfold partitionResidueCount; rw [Finset.filter_true_of_mem (fun _ _ => Subsingleton.elim _ _), Finset.card_univ]`. (3) Add `PowerSeries.coeff_X` and `PowerSeries.coeff_X_pow` (with `PowerSeries.coeff_one`, `PowerSeries.coeff_C_mul`) to the simp set of the decimated-quadratic example. (4) Finish the two ξ examples with `linear_combination (-1 : ℂ) * Complex.I_sq` and `ring` respectively. Re-run the elaboration under the pin after the repair, with the Tau Ceti module built, so that `partitionRank_conjugate` is also checked.

2. **F02** (P2) The Rogers–Ramanujan counting theorems, an end result of the Summary, have no Lean headline although they are easy on `Nat.Partition`

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md` line 368, "rogers ramanujan count: Both equalities of finite partition counts"; Summary line 3, "the Rogers–Ramanujan identities and counting theorems".

   Claim: the Summary's end theorem "counting theorems" is statable at the pins with two real-bodied predicates on `Nat.Partition n` (successive parts differ by at least 2, read off `p.parts.sort`; every part ≡ ±1 mod 5), and the file states only the analytic identity `rogersRamanujan_hasSum`.

   Witness: `Mathlib/Combinatorics/Enumerative/Partition/Glaisher.lean` states `card_odds_eq_card_distincts` in exactly this shape (two `Finset.filter` cardinalities on `Nat.Partition n`), so the carrier and the statement form exist at the pin; the brief counts a missing easy headline as a major defect.

   Exact repair: add two light definitions, `IsGapTwo (p : Nat.Partition n) : Prop` (sorted parts pairwise differ by ≥ 2) and `IsPlusMinusOneMod5 (p) : Prop` (∀ i ∈ p.parts, i % 5 = 1 ∨ i % 5 = 4), each with two proved discriminating examples at n = 4 (the partitions 4 and 3+1 versus 2+2), and the sorried headline `rogersRamanujan_count (n : ℕ) : (Finset.univ.filter IsGapTwo).card = (Finset.univ.filter IsPlusMinusOneMod5).card`, with its ±2 mod 5 companion (gaps ≥ 2 and all parts ≥ 2). Name both in README §3.3 beside `rogersRamanujan_hasSum`.

3. **F03** (P3) Two layer milestones statable on existing carriers are absent from the Lean file

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md` line 279, "1ψ1 has sum: The displayed absolutely convergent equality"; line 383, "quintuple product has sum: The displayed absolutely convergent identity".

   Claim: both are `HasSum` statements over `ℤ` with `zpow` and `tprod` factors that need no new carrier; the quintuple product (Gasper1995 line 605, (2.2.10)) is a one-line signature and Ramanujan's summation (Gasper1995 line 502, (2.1.9)) needs only a `fun j : ℤ => if 0 ≤ j then … else …` term.

   Witness: the file already states `euler_qExponential` and `rogersRamanujan_hasSum` in this form; nothing in these two milestones is heavier.

   Exact repair: add `quintupleProduct_hasSum (q z : ℂ) (hq : ‖q‖ < 1) (hq0 : q ≠ 0) (hz : z ≠ 0)` with the term `(-1) ^ n * q ^ (n * (3 * n - 1) / 2) * z ^ (3 * n) * (1 + z * q ^ n)` (all `zpow`) and the product of Gasper (2.2.10), and `ramanujanOnePsiOne_hasSum` with the annulus hypotheses `‖b / a‖ < ‖z‖`, `‖z‖ < 1`, `a ≠ 0` and the displayed quotient term; name both in §§2.5 and 3.4.

4. **F04** (P3) §§8.5–8.6 claim every finite-index Γ while the cited theorems are stated for the full group

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md` line 1005, "This holds for every finite-index Γ and k≠1"; line 987, "every finite-index Γ≤Mp₂(ℤ)".

   Claim: BruinierFunke2003 line 383 fixes `H_{k,L} = H_{k,L}(Γ′)` for the full group before (3.2), Proposition 3.2 and Theorem 3.7 (line 626); the finite-index generalisation is this roadmap's own, obtained by the averaging over a normal torsion-free subgroup that the proof paragraph already describes.

   Witness: BruinierFunke2003 line 383 ("We will mainly work with the full group Γ′ and therefore abbreviate …") and line 626 (Theorem 3.7 for `H_{k,L}`).

   Exact repair: in both subsections add one clause such as "for the full group this is BruinierFunke2003 Theorem 3.7; the finite-index case is proved here by descent from a normal torsion-free subgroup of finite index, averaging over the finite quotient", so the locator and the claim agree.

5. **F05** (P3) One locator line is off by two

   Location: `packages/QSeriesPartitionsAndMockModularForms/README.md` line 170, "(Gasper1995, (1.3.10) and Exercise 1.1(ii), pp. 6–7, lines 313 and 327".

   Claim: Exercise 1.1(ii), the concatenation identity, is at Gasper1995 line 329; line 327 is the exercise's first sentence.

   Witness: Gasper1995 line 329 ("(a;q)n+k = (a;q)n(aqn;q)k, (ii)").

   Exact repair: write "lines 313 and 329".

No previous package review exists; the accepted design review (round 3) raised one P3 (the board path in the References paragraph), which the package repaired: the paragraph now reads "Locators name the editions and versions listed in the roadmap's sources manifest; source text is not included." (repaired).

Acceptance after repair is conditional on the three declared supplier gaps `classical-metaplectic-model` (MetaplecticAutomorphicForms §§2.4b–2.6), `analytic-elliptic-regularity` (PDE Lane E) and `vector-bundle-dolbeault` (ModularForms Layer 10B). Each has the same slug in `design/plan.json` and in the README's supplier subsection, a one-sentence `needs` with its hypotheses, and asks for nothing the suppliers state today (checked against MetaplecticAutomorphicForms §§2.4b–2.6 on its branch, PDE Lane E and ModularForms 10B on main).

## Verified sound

### Principles

No route-specific shortcut: finite products are over arbitrary commutative rings (zero ring and q = 1 allowed), formal products over native `PowerSeries`, bilateral series carry both tail domains, cone data include primitive isotropic boundary vectors, Maass spaces allow every half-integral weight and every cusp, Jacobi decomposition allows every pole order, the rank completion covers every root of unity including the removable order-three case. No existing roadmap is re-planned: ClassicalArithmeticCompletion §§2.31, 4.20, 4.40, 4.60, 4.61, ThetaSeries Layers 1–3, ModularForms Layers 0 and 10B, PDE Lane E, IntegralLattices 0G/1G/1H and ContourIntegration Layers 2–3 were found at those headings on main; MetaplecticAutomorphicForms §§2.4b, 2.5, 2.6, 4.7, 6.18, 6.20, 7.1, 7.2, 7.49 (with `finiteWeil_conjugate` and `jacobi_thetaDecomposition`) and GeometryOfNumbersAndQuadraticArithmetic §4.3 (with `qPochhammer`, `jacobiProduct`, `kronecker_single_identity`, `appell_lerch_difference_identity` and the actual `m(x,q,z)`) were found on their branches. MetaplecticAutomorphicForms names this roadmap only as a consumer of its Layer 7. Statements are the author's words with locators; no copied passages; no algorithms. The Lean file has a single `import Mathlib`, one pinned `TauCeti` module, no `set_option`, no `lemma`, no `#check`/`#eval`, no sorried data (12 real-bodied definitions, 49 sorried theorems, 20 examples). No LaTeX delimiters, process words, pull-request numbers or machine paths in the README (grep). Every Lean declaration name appears in the README (62 names checked mechanically).

### Dependency check

    depcheck: 6 roadmaps, 40 edges, 0 problem(s)

No UPWARD or CYCLE line. The roadmap sits at merge-order line 113, directly after MetaplecticAutomorphicForms (112); every cited supplier is on main or earlier in the order.

### Elaboration

The brief's elaboration command was "not available". The project's configured gate command (`lake env lean` on the file, in an existing build) was run on a scratch copy inside a build pinned to Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…`. The Tau Ceti module `Combinatorics/Enumerative/Partition/Conjugate` exists at that pin (with `conjugate`, `conjugate_parts`, `conjugate_conjugate`, `conjugate_parts_sort` at its lines 157–183) but is not built in any environment on this worker, so the full file stops at its import; the file without that import and without `partitionRank_conjugate` elaborates in 13 s with 48 `sorry` warnings and the five errors of R01. All pinned Mathlib names in the supplier table were found in the pinned source files named there; `Nat.Partition.coeff_genFun` is a `lemma` at `GenFun.lean` line 60 and `ModularForm.eta` is defined at `DedekindEta.lean` line 56. The three `TauCeti.Contour` declarations are at the files named (`Residue/Basic.lean` line 80, `Residue/Theorem.lean` line 349, `HomologyCauchy.lean` line 108), and `CuspFormClass.eichlerIntegral_slash_apply` at `EichlerIntegral/Transformation.lean` line 121.

### Seeded source sample (15 targets, all read at their locators)

| Target | Text | Result |
| --- | --- | --- |
| 2.2 bilateral series | Gasper1995 lines 805–854 | (3.1.11) sign and q-power agree; q ≠ 0, z ≠ 0 are the source's conditions; j = −1 coefficient (q−b)/((q−a)z) and the A=[], B=[0] tail (t₋₁ = −q/z, t₋₂/t₋₁ = −q²/z) recomputed; the negative-tail exponent d(n+1) rederived from the term ratio. |
| 2.5 Ramanujan 1ψ1 | Gasper1995 lines 478–508 | (2.1.9) with a ≠ 0, \|b/a\| < \|z\| < 1, \|q\| < 1 agrees; the b = qⁿ specialisation and analytic continuation are the source's route. |
| 2.7 Bailey transformation | Andrews1986 lines 85–110, 156 | (2.3) agrees; (2.4)–(2.6) are lost in the extraction, so the displayed α′, β′ and the limiting identity were checked against (3.1) at line 156 and by direct computation of the ρ → ∞ limits; the unit-denominator hypotheses are the ones needed. |
| 3.1 Gaussian polynomials | Gasper1995 lines 267–285 | (1.3.4) quotient for 0 ≤ k ≤ n agrees; the rectangle definition is the author's and G(2,1) = 1+Q, G(2,1)(−1) = 0, G(3,1)(1) = 3 were computed. |
| 4.2 weighted vector partitions | AndrewsGarvan1988 lines 24–64 | (1.4)–(1.6), (1.9) and the product (1.11) agree; V₁ = z + z⁻¹ − 1 by enumeration; C = V + (1−z)X from Theorem 1 (n > 1, line 87) and the size-one crank −1. |
| 5.2 eta multiplier | Zwegers2002 lines 734–746 | ν(γ) = η(γτ)/((cτ+d)^{1/2}η(τ)) agrees; ν(T) = e^{πi/12}, ν(S) = e^{−πi/4} with the principal root, ν(−I) = −i and the resulting factor 1 on μ̂ under simultaneous negation recomputed. |
| 5.3 error kernel | Zwegers2002 lines 485–505, 532–567 | Definition 1.6 and Lemma 1.7 agree; the README's bound β(x) ≤ e^{−πx}/(π√x) follows from the integral (stronger than the source's e^{−πx}); ∂ū R was recomputed from the series and equals √(2/y)e^{−2πa²y}·conj ϑ(u;τ) as written. |
| 5.7 completed Lerch | Zwegers2002 lines 734–751; Zagier2009 lines 327–339 | Theorem 1.11 (1)–(5) agree term by term; the S-defect cancellation h/(2i) + (i/2)h = 0 and the Zagier normalisation μ̂_Z = iμ̂ checked. |
| 6.3 torsion completions | Zwegers2002 lines 734–749, 835–849; Zagier2009 lines 340–347 | The stabilizer factor and C_g were rederived from Theorem 1.11(1)–(2) with (α,β)g = (α+k, β+l); the exponent matches the README's C_g. |
| 7.3 boundary convergence | Zwegers2002 lines 1351–1429 | Proposition 2.4, Lemma 2.5 (Q_c) and Lemma 2.6 (Q⁺, two independent negative vectors) agree; the hyperbolic-plane Q⁺ ≡ 0 example and the kernel values 2 and 0 at (1/2, ±1/2) computed. |
| 8.1 real-analytic spaces | BruinierFunke2003 lines 366–374, 461–470; Zagier2009 lines 640–677 | C², the slash growth condition at every cusp, weakly holomorphic/holomorphic/cusp subspaces and ρ* = conj ρ agree. |
| 8.3 harmonic weak Maass | BruinierFunke2003 lines 366–383, 487–501 | Δ_k, exponential growth, H⁺ as ξ-preimage of cusp forms agree; "automatically real analytic" (line 382) is correctly made a supplier gap. |
| 9.3 mixed residues | Zwegers2002 lines 3082–3099 | Definition 3.8 agrees; independence of the pole-order bound s verified from the mixed expansion. |
| 10.3 fifth/seventh functions | Zagier2009 lines 163–243; Zwegers2002 lines 3697–3720, 4085–4120 | All thirteen series agree (Zagier's index j = 1,2 ↔ s = 0,1, ψ₁ with the thesis constant 1); the two χ relations rederived from the 2×7 matrix at lines 205–217; the seventh-order dictionary F₀,F₁,F₂ = A₀,A₁,A₂ matches the Hecke exponents (L, e) = (1,0),(5,1),(3,0). |
| 10.7 seventh-order vector | Zwegers2002 lines 3723–3778 | F₇, H₇ = ζ₁₄⁻¹/(2η)·theta vector, the six C-coefficients and characteristics, B(c₁,c₂) = −28, Q(cᵢ) = −21/2 agree entry by entry; ξH₇ = −√42·(conjugated coefficients) follows from Proposition 4.2(4) at line 3552. |

Further locators read and found correct: Gasper1995 lines 81–84, 127, 135, 294–323, 437, 605–609, 717, 761–784, 1672–1680; Pak2002 lines 442–456, 3703–3755; Zagier2009 lines 898–965 (rank, Theorem 7.1, corollary); BringmannOno2006 lines 270–337 (ω, F, G, H, T₃, S₃); Zwegers2002 lines 1275–1347 (Definition 2.1), 2308–2317 (Corollary 2.9), 2660–2696 ((E), (M), (3.1)–(3.4)), 2750–2754 (Definition 3.2), 2880–2915 (Definition 3.4, Proposition 3.5 with the indefinite-theta identification and residue −1/(2πi)), 3101–3131 (Theorem 3.9 with its constants −2πi and −πi), 3531–3554 (Definition 4.1, Proposition 4.2), 3603–3616 (Proposition 4.3), 4081–4126 (fifth-order identities and the corrected third and eighth), 5104–5121; Atkin1967 lines 24–28, 57–60, 375–410; Watson1938 lines 76, 107–108 (p(243) ≡ 245 mod 343), 123–126 (Hauptsätze 3–4); BevilacquaChandranChoi2019 lines 39–44; KnoppMason2009 lines 188–241; Garvan1988 lines 687–729 and 747–748 (the A₉ reading in (6.24) is visible in the extraction).

### Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 1.1–1.3 finite and integer products | n = 0, 1, 2; q = 0, 1; zero ring; a = 3, q = 2; a = q = 2; Q₋₁ values | P₂ = 1 − a − aq + a²q; P₋₁ = −2; Q₋₁([3];[1];2) = −1, Q₋₁([3];[2];2) = 0; forbidden factors stay outside the domain | none |
| 1.4 formal products | a = 0, 1; coefficients 0–2; 𝔽₂ | tail at 0 is 1, full product at 1 is 0, coefficients (1−a), −a(1−a), −a(1−a); 𝔽₂ tail 1 + X + X² | none |
| 1.5–1.6 inversion and limits | n = 2 inversion; a = 0; a = q⁻¹ | triangular exponent agrees; unit guard and zero tail needed | none |
| 2.1–2.3 normalisation and convergence | empty lists; A = [1]; B = [1]; q = 2 with a = ∓1/2; q = 0; A = [], B = [0] | c₁ = −1/(1−q); radius 4 versus polynomial 1 − z/2; q = 0 values 1 + Cz/(1−z) and 1 + (−1)^e Cz; negative-tail ratio exponent d(n+1) | none |
| 2.4 binomial and Euler | q = 0; q = 1/2 coefficients 1, 2, 8/3; a = 0 in the large-base form | all agree; the large-base statement is valid for a = 0 since its hypothesis is then vacuous and the Euler product gives the right side | none |
| 2.6–2.7 Bailey | zero pair; δ₀ pair; a = q = 0; ρ₁ = aq; ρ → ∞ limits | β₀ = α₀; n + r index needed; both limiting identities rederived from the finite transform | none |
| 3.1–3.4 polynomials and products | n = 0, 1, 2 in both Schur identities (values 1, 1, 1+Q and 1, 1, 1+Q²); signed floor indices; z = 1 and z = 0 in the quintuple product | finite identities hold; RR coefficients 1,1,1,1,2 and 1,0,1,1,1 | R03 (Lean milestone only) |
| 4.1–4.3 statistics | (), (1), (3,2,1,1), (3,3) and (2,2,2) | rank 0, 0, −1, 1, −1; crank 0, −1, −1, 3; C = V + (1−z)X at size 1 | none |
| 4.4–4.5 residue counts | t = 1, 2; constant statistic; sizes 4, 5, 6; rank 1 at size 6 | fibres sum to p(n); size-6 rank-1 count is 2 ((4,1,1) and (3,3)); crank classes of size 1 | none |
| 4.4a dissections | sizes 1, 2, 3, 4, 5 of V(ζ₅;q); q = 0 theta addition; size 49 | coefficients ζ+ζ⁻¹−1, ζ²+ζ⁻², −(ζ+ζ⁻¹), 0, 2 all match the displayed A, B, C, D; the q = 0 addition law is an identity; 11·15775 = p(49) = 173525; A₃B₂ − XA₉B₇ = 1 − X − X³ − X⁴ + … with X⁴ coefficient 0 after division by E | none |
| 4.6–4.9 congruences | δ(5,1), δ(7,1), δ(11,1), δ(5,2) = 24, δ(7,3) = 243; ℓ = 2, 3; Ω₅(B⁻¹) = 5b₅; Ω₇(B⁻¹) = 7b₃ + 49b₇; p(243) | offsets and both first steps agree with Ramanujan's identities (exponents 19 and 17 in x); 49 ∣ p(243), 343 ∤ p(243); ⌊r/2⌋+1 for odd r follows from the even case | none |
| 5.1–5.7 theta, eta, kernels, μ | ν = ±1/2 pair; τ = i; S, T, −I; u = 0; u ↦ u + 1; u → 0; u ↦ u + τ | pair i·e^{πiτ/4}(e^{πiz} − e^{−πiz}); h(±1/2; i) = 1; R even with the displayed pair; residue −1/(2πiϑ(v)); τ-shift factor −e^{πiτ+2πi(u−v)}; S-defect cancels | none |
| 6.1–6.3 unary theta | a = b = 0; a = 1/6; d > 0 scaling; β ↦ β + 1 | g(0,0) = 0; g(1/6,0) leads with (1/6)q^{1/72}; ξ_{1/2}C(a,b;dτ) = −√(2d) g(a,b;dτ) from Proposition 4.2(4); H changes sign | none |
| 7.1–7.5 indefinite theta | hyperbolic plane with c₀ = (1,−1); A = [−2] with c = 1, 2; a = 1/4 | boundary data (1,0), (0,−1) admitted, (−1,0) rejected, a = (0,1/2) excluded; kernel 2 and 0; Q⁺ ≡ 0 for two boundary vectors; −C(1/4,0;2τ) = −C(1/8,0;8τ) − C(5/8,0;8τ) by splitting 1/4 + ℤ into two cosets of 2ℤ | none |
| 8.1–8.7 Maass theory | k = 0, 1, 1/2; y, iy, y², log y; conj(q⁻¹); M = 2, i, 1 and a unipotent block; rank-zero lattice and ⟨2⟩ | ∂ȳ = i/2, ξ₀y = 1, ξ₀(iy) = −i, Δ₀y² = −2y², Δ₁ log y = 0, Δ_k y^s = −s(s+k−1)y^s, −ξ_{2−k}ξ_k = Δ_k verified symbolically; ξ₀ conj(q⁻¹) = 4πq⁻¹; H₀(w) = e^w; the K/H comparison with δ_{β>0} rederived from the upper-bank contour; ξ-coefficients (1−k)conj a⁻(h,0) and 4πn conj(a⁻)conj((−4πn)^{−k}) agree with −conj(a⁻)conj((−4πn)^{1−k}); Eichler-integral constant −(2i)⁻¹ gives ξF⁻ = g; central parity 2k ≡ σ mod 2 | R04 (finite-index wording) |
| 9.1–9.5 Jacobi decomposition | m = 1, l = 0, 1; m = 0; constant at m > 0; f = 1 + v + v̄ with g = v⁻²; R_{m,0}(0) and R_{m,m}(0) | first terms 1 + q(e(2z)+e(−2z)) and q^{1/4}(e(z)+e(−z)); residue 1 for the double pole; R_{m,0}(0;τ) = 1 and R_{m,m}(0;τ) = 0 by ±λ cancellation; Theorem 3.9 constants | none |
| 10.1–10.8 mock vectors | q = 0; f to q³ (1 + q − 2q² + 3q³); ω to q³; (q)∞f₀ = 1 − 3q² + q³ from both sides; χ relations; leading exponents −1/168, 47/168, 143/168; M₅² = (5/4)I so ((2/√5)M₅)² = I; first correction −2C(1/6,0;3τ) with shadow 2√6 g(1/6,0;3τ) | all agree; the seventh-order T-phases match the leading exponents | none |
| 11.1–11.3 rank completions | q = 0; z = −1; α = 1/2; ξ = 1; t = 1, 2; N = 10368 lower unipotent | F_{1/2} = q^{−1/24}f − 2C(1/6,0;3τ) rederived from Proposition 4.2(1) and the unary shifts; the shadow formula at ξ = −1 reduces to √(2/3)Σ_{n≡1 (6)} n q^{n²/24}; ν_eta values 1 and phase 7776 even | none |

### Duplication audit (by object)

Native partitions, their weighted series, Glaisher and odd/distinct counts, pentagonal series, power-series units, the two-variable theta, eta, summable products: all consumed from the pinned Mathlib files named in the supplier table (each file and declaration found). Partition conjugation and the holomorphic Eichler integral: Tau Ceti. The analytic q-product, triple product, Kronecker and Appell–Lerch identities: GeometryOfNumbersAndQuadraticArithmetic §4.3 (the package deleted its duplicate zero-divisor entry). Formal specialisation and formal triple/cubic products: ClassicalArithmeticCompletion. Cover, finite Weil operators, holomorphic Jacobi decomposition, theta multiplier: MetaplecticAutomorphicForms. Residues and Cauchy: ContourIntegration. No open pull request among CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers, ArithmeticDynamics states a q-product, partition statistic, error-function theta, Maass space or Jacobi-coefficient target. The three `Habiro…` consumers named at README line 1349 have no folder on main, in the board's packages or in the merge order yet (they are named the same way in the QWittVectors package); naming planned consumers is not a dependency and is not a finding.

### Shape and completeness

Every definition or construction has at least three Checks (counted for all 39 defining subsections); every theorem subsection carries its hypotheses and a locator; every layer ends with `### Examples` and `### Dependencies`; headings follow the house shape; the References section names only works recorded in `sources.toml` (18 entries: 13 certified, 3 uncertified, 2 waived; no entry was altered, and no fetch was needed).

## Not verifiable

- Andrews1986 (2.4)–(2.6), the displayed Bailey transform itself: the extraction at lines 99–102 contains only the equation labels; the README's formulas were checked against (2.3), (3.1) and the standard limits instead.
- Hickerson1988 pp. 665–666 and AtkinSwinnertonDyer1954 pp. 84–106: uncertified (paywalled) and settled in the manifest; the seventh-order identities were instead checked at Zwegers2002 lines 3697–3720, and the complete rank-difference evaluations of §4.4a remain targets with a locator-only citation.
- Watson1938 §§3 and 5 weighted-module data (the exponents 5^{5n}, 5^{5n+2}, 7^{7n}, … at README §4.8a): the OCR of the German text is too degraded to read the filtrations line by line; only the first steps, p(243) and the Hauptsätze were verified.
- `partitionRank_conjugate` could not be elaborated because no environment on this worker has the pinned Tau Ceti partition module built; its carriers exist at the pin by source inspection.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f24d256e9e67809bc6c1f5fdb575698d9def8899", "job": "REV-PKG-QSeriesPartitionsAndMockModularForms", "model": "fable", "worker": "chris-f"} -->

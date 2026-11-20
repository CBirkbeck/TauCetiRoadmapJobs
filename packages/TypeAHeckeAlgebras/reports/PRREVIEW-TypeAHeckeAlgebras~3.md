# Review of TypeAHeckeAlgebras (pull request #2716 at 4571a5d)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. Both blocking findings of the previous review are repaired. §§1.2 and 1.4 now consume TemperleyLieb Layer 5 and Tau Ceti's cellular bases, and keep here only Murphy's cellular basis of Hₙ(q) and its Gram determinants. The atomic-model headline is now stated in `Suggested.lean`; it also holds for negative q, which I checked through the sign twist. Two small corrections remain, neither blocking: the standard Hecke inputs of §§1.2 and 1.6 still have no source (carried from the previous review), and §§3.6 and 3.14 each list the other under *Needs*. There are no format notes. For the human reviewers: Jones 1987 and Sawin 1995 could not be read legally.

## C01 — Murphy's cellular basis, the semisimplicity criterion over every field and the Jucys–Murphy triangularity in §§1.2 and 1.6 still have no source

An implementer has no reference for these statements at the generality the text asserts. §1.2 (lines 173–193) asks for:
- a cellular basis `T_(d(s))* x_λ T_(d(t))` of Hₙ(q) over every commutative ring;
- the criterion `∏ [r]_Q ≠ 0` over every field, in both directions;
- through the Gram determinants of the cell forms.

§1.6 (lines 316–320) adds that the Jᵢ are triangular on that basis with diagonal entries `Q^c`. The only source cited is Wenzl, Theorem 2.2 (Wenzl1988 line 667). That theorem is over ℂ, assumes Q is not an l-th root of unity for 2 ≤ l ≤ n, and gives only the direction from the criterion to the structure. The route through Gram determinants is right. I checked it at n = 2: Gram determinants `[2]_Q` and 1. I also checked the triangularity at Q = 1 on S^(2,1): L₃ has diagonal −1 and +1 and one off-diagonal entry.

The fix is to cite Murphy's paper on the representations of Hecke algebras of type A_n (J. Algebra, 1995) for the basis and the Jucys–Murphy action, and a source for the criterion over every field, for instance Gyoja–Uno (1989) or Mathas's monograph (1999), each with its theorem number. This is the part of the previous review's C01 that remains open.

## C02 — §§3.6 and 3.14 each list the other under *Needs*, so the Layer 3 build order has a cycle

An implementer who follows the *Needs* lines cannot start either section. The *Needs* of §3.6 (line 909) includes §3.14, and the *Needs* of §3.14 (lines 1196–1197) includes §3.6. Underneath, the dependencies run between different targets:
- §3.6 uses the models of §3.14 for sufficiency: a product state is positive.
- `exists_signedCheckedRep_trace_eq_ocneanuTrace` and the exhaustion statement of §3.14 use §3.6 for necessity.

The last API bullet of §3.5 (lines 867–868) is of the same kind. It refers to "the Schur specializations of §3.14", while §3.14 needs §3.5.

Either of two changes would fix it:
- split the *Needs* of §3.14, so that the construction of the models, their positivity and their Markov identity need §§1.5, 3.5, 3.12 and 3.13, and only the realization theorem and the exhaustion of §3.6 need §3.6 as well;
- or drop §3.14 from the *Needs* of §3.6 if sufficiency is to come from the positivity of Wenzl's weights.

## Questions for the author

- In §4.7, the weak-closure equality `M_Q = K_Q = (E_Q)^T` rests on Sawin 1995 (§3, Theorem 3 and Proposition 9). Does Sawin prove it for every r ≥ 2 and every Q > 0 with Q ≠ 1, in the quantum-trace normalization used here? The text is behind the JSTOR paywall and no legal copy was found, so I could not check the theorem's hypotheses.

## Verified sound

Earlier findings at this head:
- R01 (cellular theory owned by TemperleyLieb): repaired. The changes are:
  - §1.2 (lines 178–189) builds the cellular basis on `TauCeti.CellularBasis` and consumes TemperleyLieb Layer 5;
  - §1.4 (lines 247–251) applies Layer 5's classification of simple modules;
  - the *Needs* lines are at 205–209 and 257;
  - the contract is at lines 2487–2493 and the scope clause at lines 2329–2333.

  TemperleyLieb Layer 5 on main states both theorems over a field, and its open revision keeps them as §5.1. Neither copy cites this roadmap.
- R02 (atomic-model headline): repaired. `exists_signedCheckedRep_trace_eq_ocneanuTrace` is at Lean lines 140–163, is named in §3.14 (lines 1178–1194) and appears in the docstring list (lines 36–39).
- C01 (locator for the criterion over every field): not repaired. It is carried as C01 above.
- C02 (§1.6 basis): repaired, lines 316–320. The fixed basis is triangular, and the seminormal basis is diagonal.
- C03 (Kerov citation): repaired. Line 1561 now cites Féray–Méliot §4.3, p. 16 of arXiv v2, which I checked at FerayMeliot2012 lines 840–868.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 criterion (Lean) | n = 0, 2; Q = 1, n = 3; q = i | empty product 1 and H₀ = K; 1 + Q; 6, zero in char 2, 3; (T − i)² = 0 | holds | C01 |
| §1.2 Wedderburn (Lean) | n = 0, 3 | one partition, M₁(K) = K; f^λ = 1, 2, 1, sum of squares 6 = 3! | holds | none |
| §1.2 cellular basis | n = 2, cells ordered by reverse dominance | T₁x₍₂₎ = qx₍₂₎; T₁·1 ≡ −q⁻¹ mod x₍₂₎; x₍₂₎² = (1+Q)x₍₂₎; Gram dets [2]_Q, 1 | holds | C01 |
| §1.3 branching | S^(2,1)↓, S^(2)↑ | 1 + 1 = 2; 1 + 2 = 3, the rank of H₃ over H₂ | holds | none |
| §1.4 heads | n = 2, Q = −1 | q = −q⁻¹, S^(2) = S^(1,1), H₂ = K[T]/(T − q)², quotient K | holds | none |
| §1.5 cocenter | H₃; χ^(3,1)/3 on S₄ | basis 1, g₁, g₂g₁; g₂ conjugate to g₁; τ(s₁s₃) = −1/3 ≠ 1/9 | holds | none |
| §1.6 JM on the fixed basis | Q = 1, S^(2,1), basis x, s₂x modulo Σ_w w | L₃x ≡ −x; L₃s₂x ≡ s₂x + x: triangular, diagonal = contents −1, +1 | holds | none |
| §2.4 Jimbo comparison | N = 1, 2 | z = q; η = (1+Q+Q²)/(1+Q)² = a₂(Q); Cλz = 1 and Cλ⁻¹(z − (q − q⁻¹)) = 1 | holds | none |
| §3.2 Jones quotient | q = 1 | e₁e₂e₁ = e₁/4 + Σ_w w/8; quotient 6 − 1 = 5 = C₃; labels (2,1), (1,1,1) | holds (Jones unread) | none |
| §3.3 balanced carrier | generic t; complement | g² = (t−1)g + t; braid defect (1+t)³[…] using (1+t)³τ = t(1+t); complement negates the defect | holds | none |
| §3.5 a_d | Q = 2, 1; d = ±1 | a₋₂(2) = 2/9, a₋₄(2) = 14/45, a₂(1) = 3/4, a₋₁ = 0, a₁ = 1 by norm_num; a_d + a₋d = 1 | holds | none |
| §3.6 / Lean real | Q = 2; Q = 1, q = ±1 | [1/3, 2/3], a₋ᵣ(2) increasing to 1/3, η = 0.3 rejected; residues force z ∈ {0, ±1/k}; q = −1 gives the same set | holds | C02 |
| §3.7 / Lean unit circle | l = 3, 4, 5 | l = 3: {1, 0}; a₂(i) = 1/2; a₃(e^(2πi/5)) = 1/(4cos²(π/5)) ≈ 0.382; a₍ₗ₋₁₎ = 0 | holds | none |
| §3.8 hyperbolic | exceptional line; point; l = 4 | η = (Q − Q^k)/((1+Q)(1 − Q^k)) = a₋ₖ; point ½(1 − cot(kπ/l)tan(π/l)) = 1 − a_k; ½ at l = 4 | holds | none |
| §3.12 densities | r = 3, Q = 2; one-site slices | weights (4,2,1)/7; D⊗D scalar on each swap pair; scalar left slice forces p_j = Qp₍ⱼ₊₁₎ for positive letters | holds | none |
| §3.14 / Lean atomic | n = 0, 1; σ₁ with weights (2/3, 1/3); one letter; q = −√2 | 1 = 1; q⁻¹·4/3 with η = 7/9 = a₂(2); q⁻¹Q = q; negative q: Uₙ and the sign twist give (−1)^e(b) on both sides | holds | C02 |
| §4.2 Wenzl subfactors (not statable) | k = 2, λ = (1,0); l = 5 | d = 2cos(π/l); d_λ = d, trace 1; index φ²; Wenzl1988 lines 1278–1280 | holds, named in docstring | none |
| §4.6 index and entropy (not statable) | weights (2/3, 1/3); geometric | 9/2, H ≈ 1.273 < 1.504; Σ 1/w_j = ∞ while the entropy is finite | holds, named in docstring | none |
| §4.8 path law | one positive or negative letter; n = 2 | s₂ = 1, s₁₁ = 0; p₂ = −1 gives s₂ = 0, s₁₁ = 1; Σ f^λ s_λ = p₁² = 1 | holds | none |
| §4.9 Thoma limits | one positive letter; q-Plancherel endpoint | λ₁/n = 1; addable contents λ_i + 1 − i and j − λ′_j − 1; FM rows (1 − q)q^(i−1), in probability | holds | none |
| §4.12 (H), (B) | λ = (1), (2), (1,1); λ = ∅, (1) | (A+B)/(1−t); (A+B)(A+Bt)/((1−t)(1−t²)) = (p₁²+p₂)/2; r₁ + r₂ = 1; P₁ = 1/(1−t²) | holds | none |
| §4.13 (W) | λ = ∅, Λ = (1) | π(∅) = A, π((1)) = 1 − A; D₁ = 1, 0; c₁ = A | holds | none |
| §4.15 gauge | u = ab, v = ba, any tail c | inv(abc) − inv(bac) = −1 = inv(ab) − inv(ba) | holds | none |
| §4.16 complement and rescaling | ascending pair | reversed Q − 1 − R = [[Q−1, √Q], [√Q, 0]]; −R/Q = [[Q′−1, √Q′], [√Q′, 0]]; diagonals −1, Q and −1, Q′ | holds | none |

- **Source locators checked against the text: 19.**
  - Wenzl1988: Thm 2.2 (line 667); Thm 3.6(a)(b) (lines 1207–1223); (3.5) (line 1094); Thm 3.7(a)–(c) and its proof (lines 1278–1308).
  - Neretin2021: §1.4 (lines 186–199); Thm 1.1 with (1.7)–(1.8) (lines 211–237); the Remark on p. 6 (lines 241–251); §§1.6–1.7 (lines 338–380); §3.1 (lines 688–715); §3.3 and the proof of Lemma 3.5 (lines 899–902 and 1163–1199).
  - FerayMeliot2012: Thm 1 (lines 69–73); Remark 3 (line 831); §4.3 (lines 840–868).
  - HOMFLY1985: relation (1) (line 60); p. 245 (lines 273–302); p. 246 (lines 306–309).
- **Library declarations opened at the pins:**
  - `signedCheckedR`, `signedCheckedRep` and `signedCheckedR_eq_jimboGenerator` (SignedCheckedR.lean:86, 303, 334). σᵢ goes to the g-level R-matrix.
  - `InfiniteTypeAHeckeAlgebra.braidHom` (Infinite.lean:556). σᵢ goes to Tᵢ.
  - `ArtinGroup.exponentSum` (Coxeter/Artin.lean:226).
  - `CellularBasis` with `lowerSpan`, `cellRep`, `gramMatrix`, `isSymm_gramMatrix` and `cellRep_transpose_mul_gramMatrix` (Cellular/Basic.lean:93, 128, 230, 292, 318, 332).
  - `parabolicEigenSum` (Symmetrizer.lean:45), which is `Σ a^ℓ(w) T_w`.
  - `TypeAHeckeAlgebra.negEquiv` (Finite.lean:453).
- **Cross-roadmap citations resolved:**
  - TemperleyLieb Layer 5 on main, and §5.1 at its open revision;
  - the downstream mentions in SchurWeyl, Subfactors, TemperleyLiebOperatorAlgebras, VonNeumannAlgebras and GeometricTopology, none of which is a supply edge back.
- **Automatic checks:** all passed. The dependency check gives `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`, with no UPWARD and no CYCLE line, and every supplier is on main.
- **Elaboration:**
  - `Suggested.lean` gives five `sorry` warnings and nothing else.
  - `#check @` of all seven declarations matches the README, and no binder is lost.
  - With `pp.explicit`, the atomic theorem uses `InfiniteTypeAHeckeAlgebra.instStarRing`.
  - `simp` does not close the atomic theorem, and `norm_num` confirms five values of `wenzlParameter`.
- **Overlap check:** read TemperleyLiebOperatorAlgebras, Subfactors, TemperleyLieb (main and its open revision), SchurWeyl and QuantumGroups, and also QuantumEnvelopingAlgebras, VonNeumannAlgebras and GeometricTopology. Shared objects and their owners:
  - cellular algebras and the Graham–Lehrer theorems: TemperleyLieb Layer 5, cited;
  - Temperley–Lieb positivity and the Jones quotients: TemperleyLiebOperatorAlgebras and Subfactors, cited;
  - symmetric-group Specht modules, Λ and RSK: SchurWeyl, cited;
  - the higher-rank Drinfeld–Jimbo algebra: QuantumEnvelopingAlgebras, cited;
  - Hecke algebras, Ocneanu traces, positive Markov traces, atomic models and Hecke subfactors: this roadmap, with TemperleyLiebOperatorAlgebras and GeometricTopology deferring to it.

  No other roadmap, on main or open, plans a cellular basis of the Hecke algebra.
- **Source independence:** 17 passages compared with 4 sources (Wenzl1988, Neretin2021, FerayMeliot2012, HOMFLY1985). None shares wording beyond formulas and the seven-word naming of "the subfactor generated by e₂, e₃, …", which the mathematics forces.
  - Largest share: Wenzl1988, 6 of 23 locators.
  - Contents compared with Wenzl1988 (§1 inclusions and Markov traces, §2 representations of Hₙ(q), §3 Schur functions, positive traces and subfactors): independent. Layer 2 and §§4.3–4.16 have no counterpart there, and the order of Layers 1–4 is the one the *Needs* lines force.
- **Research link:** Layers 3–4 are Wenzl's classification of positive Markov traces on H∞(q) and his Hecke subfactors of index (sin(kπ/l)/sin(π/l))^(2m) (Wenzl 1988). They come with signed product-state models of the Vershik–Kerov traces (Neretin 2021, Theorem 1.1, §§1.6–1.7) and are checked against the q-Plancherel limits of Féray–Méliot (2012). This rests on the README's References and on Wenzl1988 §3 and Neretin2021 §1.

## Not verifiable

- Jones 1987, Ann. Math. 126 (Theorem 5.1, §§11–14, (11.6); cited in §§2.1, 3.2 and 3.4): the DOI resolves only to the JSTOR page, and no legal copy was found. I checked (11.6) by computation at q = 1.
- Sawin 1995, Amer. J. Math. 117 (§1 Theorem 1, §3 Theorem 3, Proposition 9; cited in §4.7): JSTOR only, and no legal copy found. I checked the trace formula of §4.7 by computation.
- Macdonald, Ch. I §3 Ex. 3, and Geck–Pfeiffer §8.2: cited only through Wenzl1988 and Neretin2021, and not opened.

## Source issues

- **Misprint** in Wenzl1988 at Theorem 3.7(a), p. 380: the source says the index has denominator sin²(π/l) for every m; it should be sin^(2m)(π/l), as the proof on p. 381 computes; affects a stated result.
- **Misprint** in HOMFLY1985 at the second theorem, p. 245: the source says η = ½(1 − tanh α tan θ); it should be ½(1 − tanh α tanh θ); affects a stated result.
- **Misprint** in HOMFLY1985 at the first theorem, p. 245: the source says the exceptional values are (4cos(π/n))⁻¹; it should be (4cos²(π/n))⁻¹; affects a stated result.
- **Error** in HOMFLY1985 at the first theorem, p. 245: the source says the free C*-algebra is nonzero only for the listed τ; it should concern nonscalar states, since eₖ ↦ 0 satisfies the relations for every τ; affects a stated result.
- **Error** in HOMFLY1985 at the third theorem, p. 245: the source says P_b is evaluated at (e^α, −e^(−α), 2i sinh θ); it should be (e^α, e^(−α), 2i sinh θ), since relation (1) on p. 239 needs e^αγ + e^(−α)γ⁻¹ + 2i sinh θ = 0; affects a stated result.
- **Gap** in HOMFLY1985 at the second theorem, p. 245: the source says the exceptional points have k ≤ [(m−1)/2], yet it places the Arf invariant at m = 4, k = 2; it should allow 1 ≤ k ≤ m − 1, as Wenzl Theorem 3.6(b) does; affects a stated result.
- **Misprint** in Neretin2021 at §1.6, p. 8: the source defines e_αβ v_i = v_β under the condition i ≠ α in both cases; the second case should be i = α; affects nothing.
- **Misprint** in Neretin2021 at formula (1.10), p. 8: the source says the diagonal term is (q − 1)Σ_(i<j) e_ij ⊗ f_ij; it should be e_ii ⊗ f_jj; affects nothing.
- **Misprint** in Neretin2021 at the proof of Lemma 3.5, p. 21: the source says G(z) = 1 + (q − 1)z + Σ_(m≥2) z^m χ(ζ_m); the sum should carry the factor q − 1, as (1.7) gives (one positive letter: z² coefficient (q − 1)q); affects the proof.

## For the human reviewers

- Not tested: Jones 1987 and Sawin 1995 are behind the JSTOR paywall and are not in the roadmap's sources manifest. Their locators (§§2.1, 3.2, 3.4, 4.7) were not compared with the text, and no wording comparison was made against them.

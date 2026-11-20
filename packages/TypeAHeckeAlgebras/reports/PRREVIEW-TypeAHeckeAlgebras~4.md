# Review of TypeAHeckeAlgebras (pull request #2716 at 4571a5d)

**Verdict:** accepted

**Summary.** Accepted: no finding. The head is the one the previous review read, and an independent pass (every Check and formula recomputed, five sources read at their locators, the Lean file elaborated and probed) found no false statement and no unsupported headline. Three small corrections remain, none blocking: the standard Hecke inputs of §§1.2 and 1.6 have no source, §§3.6 and 3.14 list each other under *Needs*, and §3.7 cites Wenzl by section where a theorem and a proposition of another section carry the statement. There are no format notes. For the human reviewers: Jones 1987 and Sawin 1995 could not be read legally.

## C01 — The cellular basis over every ring, the semisimplicity criterion over every field and the Jucys–Murphy triangularity of §§1.2 and 1.6 have no source

An implementer has no reference for these statements at the generality the text gives them. §1.2 (lines 173–193) asks for a cellular basis `T_(d(s))* x_λ T_(d(t))` of Hₙ(q) over every commutative ring and for the criterion `∏ [r]_Q ≠ 0` over every field, in both directions; §1.6 (lines 316–320) adds that the Jᵢ are triangular on that basis with diagonal entries `Q^c`. The only source cited is Wenzl, Theorem 2.2 (Wenzl1988 line 667), which is over ℂ, assumes that Q is not an l-th root of unity for 2 ≤ l ≤ n, and gives only the direction from the hypothesis to the structure. The statements themselves pass the tests I could make: at n = 2 the cell order, the cellular axiom and the Gram determinants `[2]_Q` and 1 are as the Check says, and J₂ acts by Q and Q⁻¹.

The fix is one citation each, with its theorem number: Murphy's paper on the representations of Hecke algebras of type A_n (J. Algebra, 1995) for the basis and the Jucys–Murphy action, and a source for the criterion over every field, for instance Gyoja–Uno (1989), Dipper–James (1986) or Mathas's monograph (1999). This is carried from the previous review.

## C02 — §§3.6 and 3.14 each list the other under *Needs*, so the build order of Layer 3 reads as a cycle

An implementer who follows the *Needs* lines cannot start either section: the line of §3.6 (line 909) includes §3.14, and the line of §3.14 (lines 1196–1197) includes §3.6. The dependencies underneath are between different targets and are not circular: §3.6 uses the models of §3.14 only for sufficiency (a product state is positive), while the realization theorem `exists_signedCheckedRep_trace_eq_ocneanuTrace` and the exhaustion statement of §3.14 use §3.6 for necessity. The last API bullet of §3.5 (lines 867–868) points forward in the same way, to "the Schur specializations of §3.14", while §3.14 needs §3.5.

Either change removes it: split the *Needs* of §3.14, so that the construction of the models, their positivity and their Markov identity need §§1.5, 3.5, 3.12 and 3.13, and only the realization theorem and the exhaustion need §3.6 as well; or drop §3.14 from the *Needs* of §3.6 if sufficiency is to come from the positivity of Wenzl's weights. This is carried from the previous review.

## C03 — §3.7 cites "Wenzl, §3" for the unit-circle classification, but its two halves are Theorem 3.6(b) and Proposition 2.9, the second in §2

A reader who opens Wenzl's §3 finds the classification only at `Q = e^(±2πi/l)`: Theorem 3.6(b), p. 379 (Wenzl1988 lines 1218–1223), with 1 ≤ k ≤ l − 1 and the parameter `a_(−k)`. The other half of the statement of §3.7 (line 922, and the bullet at lines 938–939: at every other unit-circle parameter only the two scalar Markov states are positive) rests on Proposition 2.9, p. 370 (Wenzl1988 lines 890–894), which shows that for `Q = e^(2πix)` off those values the C*-representations of Hₙ(q) are sums of the two characters once n is large. §3.6 already cites its theorem and pages exactly.

Replace "(Wenzl, §3)" in §3.7 by "(Wenzl, Theorem 3.6(b), p. 379, with Proposition 2.9, p. 370, for the remaining unit-circle parameters)"; the same pair fits the docstring of `ocneanuTrace_nonneg_iff_of_mem_unitary`.

## Questions for the author

- In §4.7, the weak-closure equality `M_Q = K_Q = (E_Q)^T` rests on Sawin 1995 (§3, Theorem 3 and Proposition 9). Does Sawin prove it for every r ≥ 2 and every Q > 0, Q ≠ 1, in the quantum-trace normalization used here? The text is behind the JSTOR paywall and no legal copy was found, so the hypotheses could not be checked.
- The References say that Wenzl's Theorem 3.7 prints `q = e^(±πi/l)`. The line of the theorem's hypothesis did not survive the text extraction of the scan (between Wenzl1988 lines 1274 and 1278), so the printed angle could not be confirmed; is it as quoted?

## Verified sound

Earlier remarks at this head (the head is unchanged since the previous review, which had no finding):
- C01 of the previous review (sources for §§1.2 and 1.6): not repaired; "the non-isomorphism of the tableau representations and the faithfulness of their sum are Wenzl, Theorem 2.2 (p. 365)" is still the only citation. Carried as C01.
- C02 of the previous review (§§3.6 and 3.14): not repaired; "*Needs:* §§1.2, 1.5, 1.7, 2.1, 2.2, 3.1, 3.5, 3.13, 3.14" (line 909). Carried as C02.
- R01 and R02 of the review before it (cellular theory consumed from TemperleyLieb Layer 5; the atomic-model headline in `Suggested.lean`): still repaired, lines 187–189 and Lean lines 150–163.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 criterion (Lean) | n = 0, 1, 2; Q = 1, n = 3; Q = −1 | empty product 1, H₀ = K; `[2]_Q = 1 + Q`; 6 = 0 in char 2, 3; (T − q)² = 0 | holds | C01 |
| §1.2 Wedderburn (Lean) | n = 3 | f^λ = 1, 2, 1; 1 + 4 + 1 = 6 = 3! | holds | none |
| §1.2 cellular basis | n = 2 | T₁·1 = q⁻¹x₍₂₎ − q⁻¹; x₍₂₎² = (1 + Q)x₍₂₎; Gram determinants 1 + Q and 1 | holds | C01 |
| §1.4 heads (sampled) | n = 2, Q = −1 | q = −q⁻¹; both characters equal; H₂ = K[T]/(T − q)²; semisimple quotient K | holds | none |
| §1.6 Jucys–Murphy (sampled) | H₂; Q = e^(2πi/3), n = 3 | J₂ = Q, Q⁻¹; L₂ = 1, −Q⁻¹ = [−1]_Q; Q² = Q⁻¹ so contents 2, −1 collide | holds | C01 |
| §1.7 Ram | q₂; one variable | q₂ = (Q+1)p₂/2 + (Q−1)p₁²/2 = Qs₍₂₎ − s₍₁,₁₎; q_m(1) = Q^(m−1); agrees with Ram's `Σ Q^(r−ℓ)(Q−1)^(ℓ−1) m_μ` | holds | none |
| §1.10 Pieri (sampled) | k = 2, ν = (1); k = l = 1 | (3), (2,1): 1 + 2 = 3 = C(3,2); block trace Q − 1, det −Q, eigenvalues Q, −1 | holds | none |
| §2.1 Ocneanu trace (sampled) | T₁², braid words, complement | (q − q⁻¹)z + 1; both sides z((q − q⁻¹)z + 1); T ↦ −T⁻¹ gives q − q⁻¹ − z | holds | none |
| §2.2 radical | H₂ | Gram determinant −(z − q)(z + q⁻¹) | holds | none |
| §2.3 invariant (sampled) | σ₁, σ₁⁻¹, σ₁²; z = q | Cλz = 1 = Cλ⁻¹(z − (q − q⁻¹)); skein Cλ(q − q⁻¹)z = q − q⁻¹; λ = q⁻¹, C = 1, F ≡ 1 | holds | none |
| §2.4 Jimbo comparison | N = 1, 2 | z = q; [N]q^N(q^N/[N] − (q − q⁻¹)) = 1; η = (1+Q+Q²)/(1+Q)² = a₂(Q) | holds | none |
| §2.5 hyperbolic | both eigenvalues of γ | e^αγ + e^(−α)γ⁻¹ = −2i sinh θ twice; printed sign gives 2i cosh θ; η = cosh(α−θ)/(2cosh α cosh θ); C = i cosh α/sinh θ | holds | none |
| §3.1 involutions (sampled) | q = i; unit circle | (T − i)² = 0, normal nilpotent is 0; e* = (T⁻¹ + q)/(q + q⁻¹) = e | holds | none |
| §3.3 balanced carrier | generic t; complement | g² = (t−1)g + t; braid defect (1+t)³[…] with (1+t)³τ = t(1+t); complement negates the defect | holds | none |
| §3.5 a_d | Q = 1, 2, 5; d = ±1, ±2 | 3/4, 1/4, 2/3; a₋₂(2) = 2/9; a₁ = 1, a₋₁ = 0 (elaborated); [d+1] + Q[d−1] = (1+Q)[d] | holds | none |
| §3.6 / Lean real | Q = 2; Q = 1, q = ±1 | [1/3, 2/3]; 2/9, 2/7, 14/45, 30/93 ↑ 1/3; 0.3 excluded; z ∈ {0, ±1/k} ↔ η = 1/2, (k ± 1)/(2k) | holds | C02 |
| §3.7 / Lean unit circle | l = 3, 4, 5; Q = e^(4πi/5), e^(4πi/7) | {1, 0}; a₂(i) = 1/2; a₃ = 0.382; l = 5 non-principal: a₋₂ = 2.618 ∉ [0,1]; l = 7: Jones τ = 0.643 not admissible | holds | C03 |
| §3.8 hyperbolic (sampled) | exceptional line; point; l = 4; α → ±∞ | (Q − Q^k)/((1+Q)(1 − Q^k)) = a₋ₖ; ½(1 − cot(kπ/l)tan(π/l)) = a₋ₖ; ½; Q/(1+Q), 1/(1+Q) | holds | none |
| §3.9 collapse | τ = 0; τ < 0, = 1, > 1; matrices | (ef − fe)*(ef − fe) = 0; d³ = (1 − τ)d forces d = 0; efe = fef = 0, ef ≠ fe | holds | none |
| §3.11 slices (sampled) | r = 2, both densities | left slice (Q²+Q−1)/(Q+1), Q/(Q+1); right slice Q²/(Q+1) twice; swapped density: left Q²/(Q+1) twice | holds | none |
| §3.12 orders (sampled) | positive, negative, junction | scalarity forces p_k = Qp₍ₖ₊₁₎, p₍ₖ₊₁₎ = Qp_k; junction value (Q − 1)·s/(Q − 1) = s = Qp₁ | holds | none |
| §3.13 generating identity | one positive, one negative letter; geometric lists | (1 − x)/(1 − Qx); (1 + Qx)/(1 + x); (1 + BQx)/(1 − AQx) with (A + B)Q = Q − 1 | holds | none |
| §3.14 / Lean atomic | n = 0; one letter; r = 2, Q = 2; Q < 1; q < 0 | 1 = 1; q⁻¹Q = q = z; η_W = 2/9 = p₁p₂; mass (−c − s)/(1 − Q) = 1; sign twist gives (−1)^e(b) both sides | holds | C02 |
| §4.2 Wenzl subfactors (not statable) | k = 2; λ = (1,0) | d = 2cos(π/l), d² = φ² at l = 5; d_λ = d, trace 1; exponent 2m as in Wenzl's proof | holds, named in docstring | none |
| §4.3 Q = 1 colours (sampled) | k = 2, μ = (1); n = 3 | 3/4 + 1/4 = 1; 3/4 = a₂(1); image of ℂ[S₃] has dimension 5 | holds | none |
| §4.4 regular trace (sampled) | L(H) ⊂ L(S_∞) | infinitely many cosets; every nonidentity H-class infinite; atom 1 with corner index ∞ | holds | none |
| §4.5 entropy | atoms of B_m | log(d_λ²/(d_λ/d^m)²) = 2m log d for every λ | holds | none |
| §4.6 index and entropy (not statable) | (2/3, 1/3); (1/2, 1/2); geometric | 9/2; 1.273 < 1.504; 4 and log 4; Σ 1/w_j = ∞ with finite entropy | holds, named in docstring | none |
| §4.7 exterior square | general r; r = 2 | (1 − Z_r(Q²)/Z_r(Q)²)/2 = (Q^r − Q)/((1+Q)(Q^r − 1)); Q/(1+Q)² | holds | none |
| §4.9 Thoma limits (sampled) | one positive letter; addable cells; q-Plancherel | λ₁/n = 1; contents λ_i + 1 − i, j − λ′_j − 1; rows (1 − t)t^(i−1), in probability in the source | holds | none |
| §4.12 (H), (B) (sampled) | λ = (1), (2), (1,1); λ = ∅, (1) | (A+B)/(1−t); (A+B)(A+Bt)/((1−t)(1−t²)); P₁ = 1/(1−t), 1/(1−t²); r₁ + r₂ = 1; tail 1/(1 − t^(c+L)) | holds | none |
| §4.12 (B1), §4.13 (T), (W) | bounds; λ = ∅ | Σ perturbations ≤ (1+t)t^G/(√t(1−√t)); ratio ≤ ρ iff ((B/A) + ρt)t^L ≤ (1−t)/2; c₁ = A·1 + (1−A)·0 | holds | none |
| §4.14 deletion | swap; mass; parameters | coefficient (−q⁻¹)(−√Q) = 1; negative binomial sum 1; A_new + B_new = (1−t)(1−A)/(1−A) | holds | none |
| §4.16 reductions | complement; −R/Q | [[0, √Q], [√Q, Q−1]]; [[Q′−1, √Q′], [√Q′, 0]]; diagonals −1, Q and −1, Q′ | holds | none |
| §4.17 endpoints (sampled) | η = 0; p. 246 remark | τ(eₙ*eₙ) = 0; the source names the subfactor generated by e₂, e₃, … | holds | none |

- Source locators checked against the text: 22, in five sources. Wenzl1988: Theorem 2.2 (line 667), Definition 2.8 and Proposition 2.9 (868–894), Proposition 2.10 (922–927), (3.5) (1092–1096), the definition of `a_(−k)` (1157), Theorem 3.6(a), (b) (1207–1223), Theorem 3.7(a)–(c) and proof (1278–1308). HOMFLY1985: relation (1) (60–63), p. 245 (273–302), p. 246 (306–309). Neretin2021: §1.4 (186–199), Theorem 1.1 with (1.7)–(1.8) (211–237), the Remark (241–251), §§1.6–1.7 (338–380), §3.1 (688–694), Lemma 3.5 and its proof (899–902, 1163–1199). FerayMeliot2012: Theorem 1 (69–73), §4.3 (840–868). Ram1991: Theorem 4.13 and its proof (557–596), the definition of q_r and Theorem 4.14 (625–637).
- Library declarations opened at the pin: `signedCheckedR`, `signedCheckedRep`, `signedCheckedR_eq_jimboGenerator` (`TauCeti/Algebra/TypeAHeckeAlgebra/SignedCheckedR.lean`:86, 303, 334); `InfiniteTypeAHeckeAlgebra.braidHom` (`Infinite.lean`:556); `parabolicEigenSum` (`Symmetrizer.lean`:45); `jucysMurphy`, `additiveJucysMurphy` (`JucysMurphy.lean`:106, 149); `cycleWord` (`CycleWord.lean`:82); `TemperleyLieb.markovTrace` (loop value −(q + q⁻¹), by `#check`). No semisimplicity or positivity theorem for the Hecke algebras exists at the pin.
- Cross-roadmap citations resolved on main: TemperleyLieb Layer 5; TemperleyLiebOperatorAlgebras §§1.3, 1.5, 2.1; Subfactors §§2.2, 2.5, 2.6, 3.2, 3.3, Layer 4; VonNeumannAlgebras Layers 0, 1, 2, 6, 8, 10, 11, 13; QuantumEnvelopingAlgebras Layer 1, §2.3; QuantumGroups Layer 8; SchurWeyl Layers 3–8, §§7.2, 7.5, 7.6; GeometricTopology Layer 4; SpringerResolutionAndCharacteristicCycles §11.3. The former ids H1–H4a that four roadmaps on main cite are mapped in the reading guide.
- Automatic checks: all passed. Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no UPWARD or CYCLE line; nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives five `sorry` warnings and nothing else. `#check @` of the seven declarations matches the README; no binder is lost. One-tactic probes (`simp`, `rfl`, `infer_instance`, `decide`) close none of the five theorems. Five values of `wenzlParameter` and of the interval were confirmed by `norm_num`.
- Headlines: semisimplicity and the Wedderburn form, the two classifications and the atomic realization are stated; branching, Pieri, the subfactor index, the Q = 1 inclusions, index and entropy, and the Thoma limits are named in the module docstring with the carrier each lacks. No padding.
- Overlap check: read TemperleyLiebOperatorAlgebras, Subfactors, TemperleyLieb (main and its open revision), SchurWeyl and QuantumGroups, and also QuantumEnvelopingAlgebras, VonNeumannAlgebras and GeometricTopology. Cellular algebras: TemperleyLieb Layer 5 (kept as §5.1 in its open revision), cited. Temperley–Lieb positivity and Jones quotients: TemperleyLiebOperatorAlgebras and Subfactors, cited. Symmetric-group Specht modules, Λ and RSK: SchurWeyl, cited. The Drinfeld–Jimbo algebra: QuantumEnvelopingAlgebras, cited. Hecke module theory, Ocneanu traces, positive Markov traces, atomic models and Hecke subfactors: this roadmap; no other roadmap, on main or open, plans them. Ownership against the open revisions of roadmaps on main was read through the roadmap tools, not from checkouts.
- Source independence: 16 passages compared with 5 sources (Wenzl1988, HOMFLY1985, Neretin2021, FerayMeliot2012, Ram1991), none shared beyond formulas and the naming of "the subfactor generated by e₂, e₃, …"; largest share Wenzl1988, 6 of 21 locators in the layers; contents compared with Wenzl1988 (§1 subfactors from AF algebras, §2 representations of Hecke algebras, §3 Schur functions, positive traces and subfactors): independent, Layer 2 and §§4.3–4.16 have no counterpart there and the order of the layers is the one the *Needs* lines force. Jones 1987 and Sawin 1995 could not be read.
- Research link: Layers 3–4 are Wenzl's classification of positive Markov traces on H∞(q) and his subfactors of index (sin(kπ/l)/sin(π/l))^(2m) (Wenzl 1988), with product-state models of the Vershik–Kerov traces (Neretin 2021, Theorem 1.1) and Ram's character formula (Ram 1991); rests on the README's References and on the sources read.

## Not verifiable

- Jones 1987, Ann. Math. 126 (Theorem 5.1, §§11–14, (11.6); §§2.1, 3.2, 3.4): JSTOR only, no legal copy found; relation (11.6) was checked by computation at q = 1.
- Sawin 1995, Amer. J. Math. 117 (§1 Theorem 1, §3 Theorem 3, Proposition 9; §4.7): JSTOR only, no legal copy found; the trace formula of §4.7 was checked by computation.
- Macdonald, Ch. I §3 Ex. 3, and Geck–Pfeiffer §8.2: cited through Wenzl1988 and Neretin2021 and not opened; (H) was checked on three shapes.
- The angle printed in the hypothesis of Wenzl's Theorem 3.7: the line is missing from the extracted text of the scan.

## Source issues

- **Misprint** in Wenzl1988 at Theorem 3.7(a), p. 380: the source says the index has denominator sin²(π/l) for every m; it should be sin^(2m)(π/l), as the proof on p. 381 computes; affects a stated result.
- **Misprint** in HOMFLY1985 at the second theorem, p. 245: the source says η = ½(1 − tanh α tan θ); it should be ½(1 − tanh α tanh θ), from equating the two stabilization constants; affects a stated result.
- **Misprint** in HOMFLY1985 at the first theorem, p. 245: the source says the exceptional values are (4cos(π/n))⁻¹; it should be (4cos²(π/n))⁻¹; affects a stated result.
- **Error** in HOMFLY1985 at the first theorem, p. 245: the source says the free C*-algebra is nonzero only for the listed τ; it should concern nonscalar states, since eₖ ↦ 0 satisfies the relations for every τ; affects a stated result.
- **Error** in HOMFLY1985 at the third theorem, p. 245: the source says P_b is evaluated at (e^α, −e^(−α), 2i sinh θ); it should be (e^α, e^(−α), 2i sinh θ), which relation (1) and the unlink value on p. 239 require; affects a stated result.
- **Gap** in HOMFLY1985 at the second theorem, p. 245: the source says the exceptional points have k ≤ [(m−1)/2], yet it places the Arf invariant at m = 4, k = 2; it should allow 1 ≤ k ≤ m − 1, as Wenzl's Theorem 3.6(b) does; affects a stated result.
- **Misprint** in Neretin2021 at §1.6, p. 8: the source defines the matrix unit e_αβ on v_i under the condition i ≠ α in both cases; the second case should be i = α; affects nothing.
- **Misprint** in Neretin2021 at formula (1.10), p. 8: the source says the term with coefficient q − 1 is a sum of e_ij ⊗ f_ij over i < j; it should be e_ii ⊗ f_jj, a diagonal term; affects nothing.
- **Misprint** in Neretin2021 at the proof of Lemma 3.5, p. 21: the source says G(z) = 1 + (q − 1)z + Σ_(m≥2) z^m χ(ζ_m); the sum should carry the factor q − 1, as (1.7) gives; affects the proof.

## For the human reviewers

- Not tested: Jones 1987 and Sawin 1995 are behind the JSTOR paywall and are not in the roadmap's sources manifest; their locators (§§2.1, 3.2, 3.4, 4.7) and wording were not compared with the text.

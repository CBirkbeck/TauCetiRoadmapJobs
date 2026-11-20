# Review of TypeAHeckeAlgebras (pull request #2716 at a231751)

**Verdict:** needs changes

**Summary.** Changes are needed for two reasons, and neither concerns the truth of a stated result. First, §§1.2 and 1.4 plan for Hₙ(q) the general cellular-algebra theorems that TemperleyLieb Layer 5 owns for every cellular algebra over a field, and they cite neither that roadmap nor Tau Ceti's cellular bases. Second, the product-state realization in the atomic-models headline can be stated at the pins but is missing from `Suggested.lean`, and its docstring does not name it among the headlines that cannot be stated. All four blocking findings of the previous review are repaired, and so are six of its eight other remarks; the remaining two are partly repaired and carried below as C01 and C03. The stated headlines, the sampled source locators and every Check recomputed here hold. There are three small corrections, no format notes, and two items for the human reviewers.

## R01 (P2) — §§1.2 and 1.4 plan for Hₙ(q) the Graham–Lehrer theorems that TemperleyLieb Layer 5 owns for every cellular algebra over a field, and cite neither it nor Tau Ceti's cellular bases

As written, the general results have two owners, and the supplier contracts leave out a roadmap that the plan depends on.

§1.4 (lines 232–235) asks the implementer to "prove: the radical of each form is a submodule; the nonzero heads `D^λ = S^λ / rad S^λ` are simple, pairwise non-isomorphic and exhaust the simple modules". §1.2 (line 176) proves the criterion "from the cellular bilinear forms of the Specht modules". TemperleyLieb is on main, and its Layer 5, "Cellular algebras (reusable infrastructure)", owns these results for every cellular algebra:
- over a commutative ring: the cell modules, their forms and their radicals;
- over a field: the classification of the simple modules as the nonzero heads, and the criterion that the algebra is semisimple iff every cell form is nondegenerate.

That layer also says that Hecke, Brauer and partition algebras reuse these results. Its open revision keeps them as §5.1. Tau Ceti at the pin has the cell datum `TauCeti.CellularBasis` with `TauCeti.CellularBasis.cellRep` and `TauCeti.CellularBasis.gramMatrix` (`TauCeti/Algebra/Cellular/Basic.lean`, lines 93, 230 and 292). The README names neither of them. TemperleyLieb does not depend on this roadmap, so citing it creates no cycle.

The fix is to consume TemperleyLieb Layer 5 and `TauCeti.CellularBasis` in §§1.2 and 1.4 for the general statements, and to keep here what is specific to Hₙ(q):
- a cellular basis of Hₙ(q) built from the row symmetrizer `parabolicEigenSum`;
- the identification of its cell modules with the S^λ;
- the Gram determinants that turn the general criterion into `∏ [r]_Q ≠ 0`;
- if wanted, the description of which λ have D^λ ≠ 0.

Then add TemperleyLieb Layer 5 to the *Needs* lines of §§1.2 and 1.4, add a "From TauCetiRoadmap.TemperleyLieb" contract, and add one clause to the scope section.

## R02 (P2) — The product-state realization of the atomic-models headline can be stated at the pins, but `Suggested.lean` neither states it nor names it among the unstatable headlines

The acceptance test leaves out the theorem that §3.14 is built to reach. The Summary's fourth headline begins: "every positive Markov trace is the restriction of a product state on an infinite tensor product of ℓ²(J)". Restricted to Hₙ(q), that product state is `Tr(D^(⊗n) ρₙ(·))`, and the pins have every carrier this needs:
- the signed R-matrix representation `TauCeti.signedCheckedRep` on `(Fin n → ι) →₀ ℂ` (`TauCeti/Algebra/TypeAHeckeAlgebra/SignedCheckedR.lean`, line 303);
- `TauCeti.InfiniteTypeAHeckeAlgebra.braidHom`, whose image spans the algebra;
- `ArtinGroup.exponentSum`, for the factor `q^(−e(b))` that converts σᵢ ↦ gᵢ into σᵢ ↦ Tᵢ = q⁻¹gᵢ.

The module docstring names only the Specht and branching, subfactor-index, entropy and path-law headlines as unstatable.

The statement below elaborates at the pins, with `sorry` the only warning, once `import TauCeti.Algebra.TypeAHeckeAlgebra.SignedCheckedR` is added. It gives the right values in the small cases:
- at n = 2 and b = σ₁, the right side is q⁻¹ times the scalar left slice s = qz, that is z;
- with a single letter it gives the index or the sign character.

```lean
open scoped ComplexOrder in
theorem exists_signedCheckedRep_trace_eq (q : ℂˣ) [Fact (IsSelfAdjoint (q : ℂ))]
    (hq : 0 < (q : ℂ).re) (hq1 : (q : ℂ) ≠ 1) (z : ℂ)
    (hz : ∀ x : InfiniteTypeAHeckeAlgebra ℂ q,
      0 ≤ InfiniteTypeAHeckeAlgebra.ocneanuTrace ℂ q z (star x * x)) :
    ∃ (ι : Type) (_ : LinearOrder ι) (_ : Countable ι) (pos : ι → Prop) (_ : DecidablePred pos)
      (p : ι → ℝ), (∀ i, 0 < p i) ∧ HasSum p 1 ∧
      ∀ (n : ℕ) (b : BraidGroup n),
        InfiniteTypeAHeckeAlgebra.ocneanuTrace ℂ q z
            (InfiniteTypeAHeckeAlgebra.braidHom ℂ q n b : InfiniteTypeAHeckeAlgebra ℂ q) =
          ((q : ℂ) ^ (-(Multiplicative.toAdd (ArtinGroup.exponentSum _ b)))) *
            ∑' w : Fin n → ι, (∏ i, (p (w i) : ℂ)) *
              ((signedCheckedRep pos q b : Module.End ℂ ((Fin n → ι) →₀ ℂ))
                (Finsupp.single w 1)) w := by
  sorry
```

The fix is to state this theorem, under a name of the author's choosing, and to name it in §3.14. The docstring bullet on the index and entropy of §4.6 stays as it is.

## C01 — The semisimplicity criterion over an arbitrary field, the first Lean headline, still has no locator

§1.2 now cites Wenzl, Theorem 2.2, only for the complex tableau representations when Q is "n-regular" (Wenzl1988 line 667: Q is not an l-th root of unity for 2 ≤ l ≤ n). That theorem covers neither positive characteristic nor the direction from semisimplicity to the nonvanishing of the product, both of which `isSemisimpleRing_typeAHeckeAlgebra_iff` asserts. A source that proves the criterion over every field and in both directions would close this, for instance Dipper and James (1986) or Gyoja and Uno (1989), cited with a theorem number. This is the half of the previous review's C02 that the repair left open; the other half (Thoma's theorem at Q = 1, §3.6) is repaired.

## C02 — §1.6 needs the fixed tableau basis of §1.2 to be the seminormal one, which §§1.2–1.3 do not say

§1.6 (line 300) says that "on the fixed tableau basis of S^λ, Jᵢ acts diagonally". §1.2 leaves that basis to be chosen. §1.3 describes its branching only "modulo the summands of the boxes below it", which is how a Specht (Murphy-type) basis behaves, and on such a basis the Jucys–Murphy elements are only triangular. Example: at Q = 1, take S^(2,1) with the polytabloid basis e₁, e₂ of the tableaux 12/3 and 13/2. Then L₃ = (1 3) + (2 3) gives L₃e₁ = e₂ − e₁ and L₃e₂ = e₂. Either of two changes would fix it: say in §1.2 that the fixed basis is the seminormal basis, or say in §1.6 that Jᵢ is triangular on the fixed basis and diagonal on the seminormal basis obtained from it.

## C03 — The Kerov citation of §4.8 still gives no venue or year

The reference "S. V. Kerov, *A q-analogue of the hook walk algorithm*, §4.2 'Random knot tableaux', printed pp. 128–129" names no journal, book or year, so the locator for the coherent transition `s_Λ(α;β)/s_λ(α;β)` cannot be checked. The fix is to give the venue and year. This is the half of the previous review's C03 that the repair left open; the course-note half is repaired.

## Questions for the author

- In §4.7, the weak-closure equality `M_Q = K_Q = (E_Q)^T` rests on Sawin 1995, §3, Theorem 3 and Proposition 9. Does Sawin prove it for every r ≥ 2 and every Q > 0 with Q ≠ 1, and in the quantum-trace normalization used here? The text is behind the JSTOR paywall, so I could not check the theorem's hypotheses.

## Verified sound

Earlier findings at this head:
- R01 (§3.9 range): repaired. Line 981 reads "τ ∈ (1/4, 1) with `τ ≠ (4cos²(π/l))⁻¹` for every l ≥ 4", and the *Needs* line now has §3.7.
- R02 (QuantumEnvelopingAlgebras): repaired. §4.7 (lines 1411–1416), §4.11 (lines 1658–1661), the scope section (lines 2301–2309) and the new contract (lines 2457–2464) consume its Layer 1 and §2.3.
- R03 (three Checks): repaired. Line 1168 reads "unless 2(q − q⁻¹) = 0"; lines 1403–1405 read "the weights are unequal, so H < log[B : A]"; line 2002 reads "ν ranges over ∅ and (1)".
- R04 (Wedderburn form): repaired. `nonempty_algEquiv_pi_matrix_of_prod_ne_zero` is stated (Lean lines 71–76), and the docstring is narrowed.
- C01 (old numbering): repaired, lines 58–59.
- C02 (sources for the Lean headlines): partly repaired. §3.6 now cites Thoma at Q = 1 (lines 870–875); the criterion over every field still has no source (C01 above).
- C03 (unidentified texts): partly repaired. The course notes became Freyd et al., p. 245; Kerov still has no venue (C03 above).
- C04 (the remark on p. 246): repaired, lines 2176–2178.
- C05 (missing locators): repaired. Ram is cited at line 340, Neretin at line 261, and Wenzl's (3.5) at line 1748.
- C06 ("describe the blocks"): repaired, line 234.
- C07 (description of the §1.7 Checks): repaired in the description.
- N01 (§2.5 heading): repaired.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 sign-twist Check | 𝔽₄ with q = ω; ℚ with q = 2 | char 2: 2(q − q⁻¹) = 0 and T ↦ −T is the identity; over ℚ, 2(2 − ½) = 3 ≠ 0 | holds | none |
| §1.2 criterion (Lean) | n = 0, 2, 3; q = i; Q = 1 | n = 0: empty product 1; n = 2: 1 + Q; q = i: (T − i)² = 0; Q = 1, n = 3: 6, zero in char 2, 3 | holds | C01 (locator) |
| §1.2 Wedderburn (Lean) | n = 0, 3 | n = 0: one partition, M₁(K) = K; n = 3: 1 + 4 + 1 = 6 = 3! | holds | none |
| §1.4 cellular heads | n = 2, Q = −1 | q = −q⁻¹, S^(2) = S^(1,1), one block, head K | holds; general theory owned by TemperleyLieb Layer 5 | R01 |
| §1.5 cocenter | H₃; S₄ with χ^(3,1)/3 | basis {1, g₁, g₂g₁}; g₂ conjugate to g₁; τ(s₁s₃) = −1/3 ≠ 1/9 | holds | none |
| §1.6 JM on the fixed basis | Q = 1, S^(2,1), polytabloids 12/3, 13/2 | L₃e₁ = e₂ − e₁, L₃e₂ = e₂: triangular, not diagonal | basis unspecified | C02 |
| §1.7 Ram | q₂; one variable | q₂ = Q s₂ − s₁₁; q_m(1,0,…) = Q^(m−1) = χ^(m)(ζₘ); Ram Thm 4.14, p. 475 | holds | none |
| §1.9 regular carrier | H₂ | matrix of g₁: [[0, √Q], [√Q, Q − 1]]; [0]_Q − [−1]_Q = Q⁻¹ | holds | none |
| §2.2 Gram Check | H₂ | det [[1, z], [z, (q − q⁻¹)z + 1]] = −(z − q)(z + q⁻¹) | holds | none |
| §2.4 Jimbo comparison | N = 1, 2 | z = q; η = (1 + Q + Q²)/(1 + Q)² = a₂(Q); Cλz = 1 and Cλ⁻¹(z − (q − q⁻¹)) = 1 | holds | none |
| §2.5 hyperbolic | both eigenvalues of γ | each gives −2i sinh θ; a = b gives η = ½(1 − tanh α tanh θ); a = −i sinh θ/cosh α | holds | none |
| §3.2 Jones quotient | q = 1 | ideal of the S₃-sum has dim 1; quotient 5 = C₃; labels (2,1), (1,1,1) | holds | none |
| §3.4 Jones range | t = 1; m = 4, 6 | τ = 1/4; index 2; index 3; 2 + 2cos(2π/m) = 4cos²(π/m) | holds (Jones unread) | none |
| §3.6 / Lean real | Q = 2; Q = 1; q < 0 | [1/3, 2/3]; a₋₃ = 2/7, a₋₄ = 14/45, 0.3 rejected; Thoma forces z ∈ {0, ±1/k}; negEquiv keeps η | holds | none |
| §3.7 / Lean unit circle | l = 3, 4, 5 | l = 3: {1, 0}; a₂(i) = 1/2; a₃(e^(2πi/5)) = 1/φ² ≈ 0.382; a_(l−1) = 0 | holds | none |
| §3.9 exclusion | τ < 0, τ ≥ 1, nonreal τ; τ ∈ (1/4, 1) | d³ = (1 − τ)d forces d = 0; (τ̄ − τ)(e − f) = 0; τ ∈ (1/4, 1) puts t on the unit circle | holds | none |
| §3.10 R_Q | two labels | trace Q − 1, det −Q, eigenvalues Q and −1; the library definition matches (SignedCheckedR.lean:86) | holds | none |
| §3.11 Jimbo block | r = 2 | q·jimboGenerator block [[0, q], [q, Q − 1]] (Jimbo/Basic.lean:95); slices (Q² + Q − 1)/(Q + 1), Q/(Q + 1) and Q²/(Q + 1) | holds | none |
| §3.12 junction | Q > 1, ω followed by ω* | left slice p₁Q on positive letters, (Q − 1)P₊ = p₁Q on negative letters | holds | none |
| §3.13 generating identity | geometric lists, t = 1/Q | telescopes to (1 + BQx)/(1 − AQx); equals the Markov side iff qz = AQ | holds | none |
| §3.14 models | endpoint; r = 2, Q = 2; Q < 1 | α_i = (Q − 1)/Qⁱ has mass 1; p₁p₂ = 2/9 = a₋₂(2); (1 − Ax)/(1 + Bx) = (1 + cx)/(1 − sx) | holds | none |
| Atomic realization (headline 4) | n = 0, 1, 2; one letter | n = 2: q⁻¹ Σ p_a p_b R = q⁻¹s = z; one letter gives the index or sign character; the probe elaborates | statable, absent | R02 |
| §4.2 / Wenzl subfactors | k = 2; λ = (1, 0); l = 5 | d = 2cos(π/l); d_λ = d, trace 1; φ² ≈ 2.618; Wenzl Thm 3.7(a)(b), p. 380 | holds; not statable, named | none |
| §4.5 entropy | atoms of trace d_λ/d^m, corner index d_λ² | Σ n_λ (d_λ/d^m) log d^(2m) = 2m log d | holds | none |
| §4.6 index and entropy | weights (2/3, 1/3); equal weights; geometric | 9/2 and 1.273 < 1.504; both log 4; Σ 1/w_j = ∞, entropy finite | holds | none |
| §4.7 quantum trace | general r; r = 2 | (1 − Z_r(Q²)/Z_r(Q)²)/2 = (Q^r − Q)/((1 + Q)(Q^r − 1)); r = 2: Q/(1 + Q)² | holds | none |
| §4.8 path law | one positive or one negative letter; n = 2 | s₂ = 1, s₁₁ = 0; p₂ = −1 gives s₂ = 0, s₁₁ = 1; Σ f^λ s_λ = p₁² = 1 | holds (Kerov unread) | C03 |
| §4.12 (H) and (B) | λ = (1), (2), (1,1); λ = ∅, (1) | equal to p₁ and (p₁² ± p₂)/2; r₁ + r₂ = 1; Wenzl (3.5), p. 376, with a = A, b = −B | holds | none |
| §4.13 (W) Check | Λ = (1) | π = (A, 1 − A); D₁ = (1, 0); c₁ = A | holds | none |
| §4.14 deletion | the swap; negative binomial | −q⁻¹·(−√Q) = 1; Σ C(L−1, m−1)(1 − p)^m p^(L−m) = 1 | holds | none |
| §4.16 complement and rescaling | an ascending pair | Q − 1 − R reversed is [[Q − 1, √Q], [√Q, 0]]; −R/Q gives Q′ − 1 and √Q′ | holds | none |
| §4.17 remark and endpoints | Freyd et al., p. 246; η = 0 | the remark concerns ⟨e₂, e₃, …⟩ in R_(α,θ); τ(e*e) = 0 gives e = 0, the sign character | holds | none |
| §4.18 endpoint Check | B = 0, Q > 1 | weights (1 − t)t^(j−1): index ∞, entropy finite | holds | none |

- Source locators checked against the text: 15.
  - Wenzl1988: Theorem 2.2 (p. 365, line 667), Theorem 3.6(a)(b) (pp. 378–379, lines 1207–1223), Theorem 3.7(a)–(c) and its proof (pp. 380–382, lines 1278–1308) and (3.5) (p. 376, line 1094).
  - Neretin2021: §1.4 (p. 5, lines 194–199), Theorem 1.1 with (1.7)–(1.8), the Remark on p. 6 (lines 241–251) and §§1.6–1.7 (lines 338–411).
  - Ram1991: Theorem 4.14 (p. 475, line 633) and the proof of Theorem 4.13(b) (p. 474).
  - HOMFLY1985: the three theorems on p. 245 (lines 273–302) and the remark on p. 246 (lines 306–309).
  - FerayMeliot2012: Theorem 1 (line 69).
- Library declarations opened at the pins:
  - `TauCeti.KnotTheory.jimboGenerator` (Jimbo/Basic.lean:95);
  - `TauCeti.signedCheckedR` and `TauCeti.signedCheckedRep` (SignedCheckedR.lean:86, 303);
  - `jonesRelator_ne_zero` (TypeAHeckeAlgebra/TemperleyLieb.lean:118);
  - `IsMarkovTrace.map_cycleWord` (CycleWord.lean:223);
  - both `instStarRing` instances (Star.lean:90, UnitaryStar.lean:104);
  - `InfiniteTypeAHeckeAlgebra.braidHom` (Infinite.lean:556);
  - `ArtinGroup.exponentSum` (Coxeter/Artin.lean:226);
  - `TauCeti.CellularBasis`, `cellRep` and `gramMatrix` (Cellular/Basic.lean:93, 230, 292);
  - the trace-radical lemmas (TraceRadical.lean:49–137).

  The pins have no semisimplicity, Specht or positivity theorem for these algebras and no Jones index.
- Cross-roadmap citations resolved on main:
  - SchurWeyl Layers 0–8 and §§7.2, 7.5 (the rational power-sum presentation) and 7.6;
  - Subfactors §§2.2 (local-index and sum formulas), 2.5, 2.6 (no finite-index hypothesis) and 3.2–3.3, and Layers 2 and 4;
  - TemperleyLiebOperatorAlgebras §§1.3, 1.5 and 2.1;
  - VonNeumannAlgebras Layers 0–2, 6, 8, 10, 11 and 13;
  - QuantumEnvelopingAlgebras Layer 1, §2.3 and its Conventions (any field, q not a root of unity);
  - QuantumGroups Layer 8;
  - the consumers GeometricTopology (§4.6.3 and its contract) and SpringerResolutionAndCharacteristicCycles §11.3, whose old ids line 59 maps.
- Automatic checks: all passed. Dependency check output: `depcheck: 182 roadmaps, 2073 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line, and every supplier is on main.
- Elaboration:
  - `Suggested.lean` gives the four `sorry` warnings and nothing else.
  - `#check @` of all six declarations matches the README statements, and no binder is lost.
  - With `pp.explicit`, the real statement uses `InfiniteTypeAHeckeAlgebra.instStarRing` and the unit-circle statement uses `UnitCircle.instStarRing`.
  - `norm_num` confirms seven values of `wenzlParameter`.
  - `simp` and `exact?` find no proof of the criterion.
  - The R02 statement elaborates.
- Overlap check: read TemperleyLiebOperatorAlgebras, Subfactors and SchurWeyl (on main and in their open revision), TemperleyLieb (on main and in its open revision) and QuantumGroups, and also QuantumEnvelopingAlgebras, VonNeumannAlgebras and GeometricTopology. Shared objects and their owners:
  - Temperley–Lieb positivity and the Jones quotients: TemperleyLiebOperatorAlgebras and Subfactors, cited.
  - Symmetric-group Specht modules, Λ and RSK: SchurWeyl, cited.
  - The higher-rank quantized enveloping algebra: QuantumEnvelopingAlgebras, cited.
  - Cellular algebras and the Graham–Lehrer theorems over a field: TemperleyLieb Layer 5, not cited (R01).
  - Hecke algebras, Ocneanu traces, positive Markov traces and Hecke subfactors: this roadmap, with TemperleyLiebOperatorAlgebras, GeometricTopology and VonNeumannAlgebras deferring to it.
- Source independence: 12 passages compared with 5 sources, none shared beyond formulas and the printed literals quoted as provenance; largest share Wenzl1988, 6 of 23 locators; contents compared with Wenzl1988 (§1 inclusions and Markov traces, §2 representations of Hₙ(q), §3 Schur functions, positive traces and subfactors): independent. Layer 2 and §§4.6–4.16 have no counterpart in it, and the order of Layers 1 to 4 is the one the *Needs* lines force.
- Research link: Layers 3–4 are Wenzl's classification of positive Markov traces and his Hecke subfactors of index sin²(kπ/l)/sin²(π/l) (Wenzl 1988), together with signed product-state models of the Vershik–Kerov traces of H∞(q) (Neretin 2021, Theorem 1.1, §§1.6–1.7), checked against Féray–Méliot's q-Plancherel limits (2012). This rests on the README's References, Wenzl1988 §3 and Neretin2021.

## Not verifiable

- Jones 1987 (Ann. Math. 126), Theorem 5.1, §§11–14 and (11.6), cited in §§2.1, 3.2 and 3.4: behind the JSTOR paywall at its DOI, and not in the sources manifest. I checked (11.6) by computation at q = 1.
- Sawin 1995 (Amer. J. Math. 117), §1 Theorem 1, §3 Theorem 3 and Proposition 9, cited in §4.7: behind the JSTOR paywall at its DOI, and not in the manifest. I checked the trace formula of §4.7 by computation.
- Kerov, §4.2, pp. 128–129, cited in §4.8: the README gives no venue or year, so the text could not be identified.
- Macdonald, Ch. I §3 Ex. 3, and Geck–Pfeiffer §8.2: cited only through Wenzl1988 and Neretin2021; not opened.
- The setup of Wenzl's Theorem 3.7 on p. 380 (its hypothesis on q and the label a_k): the recognised text there (Wenzl1988 lines 1274–1277) is garbled.

## Source issues

- **Misprint** in Wenzl1988 at Theorem 3.7(a), p. 380: the source says [B : A] has denominator sin²(π/l) for every m; it should be sin^(2m)(π/l), as the proof on p. 381 computes; affects a stated result.
- **Error** in HOMFLY1985 at the third theorem, p. 245: the source says P_b is specialised at (e^α, −e^(−α), 2i sinh θ); it should be (e^α, e^(−α), 2i sinh θ), which the unlink value i cosh α csch θ of the normalised trace requires; affects a stated result.
- **Misprint** in HOMFLY1985 at the second theorem, p. 245: the source says η = ½(1 − tanh α tan θ); it should be ½(1 − tanh α tanh θ); affects a stated result.
- **Misprint** in HOMFLY1985 at the first theorem, p. 245: the source says the exceptional values are (4cos(π/n))⁻¹; it should be (4cos²(π/n))⁻¹; affects a stated result.
- **Error** in HOMFLY1985 at the first theorem, p. 245: the source says the free C*-algebra is nonzero only for the listed τ; eₖ ↦ 0 satisfies the relations for every τ, so the statement should concern nonscalar Markov traces; affects a stated result.
- **Gap** in HOMFLY1985 at the second theorem, p. 245: the source says the exceptional points have k ≤ [(m−1)/2], yet places the Arf invariant at m = 4, k = 2; it should allow 1 ≤ k ≤ m − 1, as Wenzl Theorem 3.6(b) does; affects a stated result.
- **Misprint** in Neretin2021 at §1.2, relation (1.2), p. 3: the source writes σ_k on the right of the quadratic relation for σ_m; it should be σ_m; affects nothing.
- **Misprint** in Neretin2021 at §1.6, p. 8: the source defines e_αβ v_i as v_β under the condition i ≠ α in both cases; the second case should be i = α; affects nothing.
- **Misprint** in Neretin2021 at §1.6, formula (1.10), p. 8: the source says the diagonal term is (q − 1)Σ_(i<j) e_ij ⊗ f_ij; it should be e_ii ⊗ f_jj; affects nothing.
- **Misprint** in Neretin2021 at footnote 6, p. 4: the source says Kerov died in 2020; it should be 2000; affects nothing.

## For the human reviewers

- Not tested: Jones 1987 and Sawin 1995 are behind the JSTOR paywall. Their locators (§§2.1, 3.2, 3.4, 4.7) were not compared with the text, and no wording comparison was made against them.
- Licence: the Kerov text cited in §4.8 and the References (pp. 128–129) is not identified (no venue or year), so its host and status could not be settled.

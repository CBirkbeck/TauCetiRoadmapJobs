# Review of TypeAHeckeAlgebras (pull request #2716 at 78aca1e)

**Verdict:** needs changes

**Summary.** Changes are needed for four reasons. First, the §3.9 target excluding nonscalar Markov states is now false at the root-of-unity values τ = (4cos²(π/l))⁻¹. Second, the quantum-group route of §§4.7 and 4.11 plans again the higher-rank quantized enveloping algebra that QuantumEnvelopingAlgebras on main owns. Third, three Checks assert false statements, one of them in the coefficient identity (W) of §4.13. Fourth, `Suggested.lean` leaves out the split-semisimple Wedderburn form of the first headline, although it can be stated at the pins. The three stated headlines are correct as written, and the cited Wenzl and Freyd et al. passages say what the README claims, apart from the §4.17 remark. There are seven small corrections and one format note, and two items for the human reviewers.

## R01 (P2) — The §3.9 target excluding nonscalar Markov states "outside the positive range of §3.6" is false at τ = (4cos²(π/l))⁻¹, l ≥ 4

An implementer is asked to prove a statement that fails at known values. This revision changed the wording: main read "outside the full Hecke positive-state range". The sentence in §3.9 (line 966) reads: "For the remaining positive real τ outside the positive range of §3.6, derive the same exclusion of Markov states". Section 3.6 covers real t > 0, that is τ = t/(1 + t)² ∈ (0, 1/4]. Every τ ∈ (1/4, 1) has |t| = 1, which is the unit-circle case of §3.7. At τ = 1/2 (t = i, l = 4) the balanced carrier has the positive Ising state η = 1/2: §3.3's own bullet says so, and §3.7's Check computes a₂(i) = 1/2. At τ = 1/φ² (l = 5), Layer 3's Examples give η ∈ {a₂, a₃}. Both values lie outside the range of §3.6, and their states are not scalar.

The fix is to write "outside the positive ranges of §§3.6–3.7, that is τ ∈ (1/4, 1) with τ ≠ (4cos²(π/l))⁻¹ for every l ≥ 4", and to add §3.7 to the *Needs* line (line 971).

## R02 (P2) — §§4.7 and 4.11 and the scope section plan the higher-rank algebra `U_Q(sl_r)` and its highest-weight theory, which QuantumEnvelopingAlgebras on main owns

As written, the object has two owners, and the text tells the implementer that no supplier exists. In §4.7 (line 1396) the README says the QuantumGroups interfaces "are rank one and do not supply the higher-rank package. If the quantum-group route is used, construct the type-A quantized enveloping Hopf *-algebra and every finite-dimensional type-1 module…". Section 4.11 (line 1639) repeats this, and the scope section (lines 2281–2283) says this theory "is built there in full". QuantumEnvelopingAlgebras, on main, owns the algebra `U_v(A, X, Y)` for every finite-rank symmetrizable datum, so for type A_(r−1) as well. Its scope section and §§1.1–1.2 and 2.3 give that algebra's Hopf structure, its Verma and integrable highest-weight modules, the quantum Casimir and the character formula. Its Conventions put these theorems over any field with q not a root of unity, which includes ℂ with q = √Q and Q ≠ 1.

The fix has three parts:
- In the quantum-group routes of §§4.7 and 4.11 and in the scope section, cite QuantumEnvelopingAlgebras Layer 1 and §2.3 for the algebra, the coproduct, the highest-weight modules and the characters.
- Add a "From TauCetiRoadmap.QuantumEnvelopingAlgebras" contract.
- Keep here only what that roadmap does not own: the compact real form, the positive quantum trace, the normalized Clebsch maps and Sawin's weak-closure estimates. Complete reducibility of the tensor powers can also stay here as a stated target. QuantumEnvelopingAlgebras assigns it to a "KacMoody, Part II" that is not on main.

## R03 (P2) — Three Checks assert false statements

- **§4.13, second Check (line 1978).** It says "ν ranges over ∅ only". The partition ν = (1) also interlaces Λ = (1), with π_Λ((1)) = s_(1)(At; B)/s_(1)(A; B) = (At + B)/(A + B) = 1 − A. The Check's own value π_Λ(∅) = A ≠ 1 already contradicts the claim that π is a probability law. The conclusion c₁ = A survives only because D₁(∅, (1)) = 0, since ν₁ = Λ₁. Suggested wording: "ν ranges over ∅ and (1); π_Λ(∅) = A, π_Λ((1)) = 1 − A, D₁(∅, ∅) = 1 and D₁(∅, (1)) = 0, so c₁ = A."
- **§4.6, first Check (line 1388).** It says "the relative commutant is not ℂ, so H < log[B : A]". At equal weights the relative commutant is still ℂ², yet H = log 4 = log[B : A], as the Check's last sentence says. By Subfactors §2.6 (Pimsner–Popa, Corollary 4.5), equality holds exactly when 1/w_j² = Σ_i 1/w_i for every j. The strict inequality therefore comes from the unequal weights. Suggested wording: "the weights are unequal, so H < log[B : A]".
- **§1.1, third Check (line 167).** It says "not a homomorphism unless q − q⁻¹ = 0". The map T ↦ −T is a homomorphism exactly when 2(q − q⁻¹) = 0. Over 𝔽₄ with q a primitive cube root of unity, q − q⁻¹ = 1, yet T ↦ −T is the identity, so it is a homomorphism. Suggested wording: "unless 2(q − q⁻¹) = 0 (in characteristic 2 it is the identity)".

## R04 (P2) — The split-semisimple Wedderburn form of the first headline can be stated at the pins, but `Suggested.lean` leaves it out and its docstring says it cannot be stated

The acceptance test leaves out the strongest part of the first headline that can be stated. The docstring (`TauCetiRoadmap/TypeAHeckeAlgebras/Suggested.lean`, line 36) lists "its Wedderburn decomposition" among the statements that cannot be made because "the pins have no Specht module". The abstract form does not need a Specht module. The following elaborates at the pins, with `sorry` the only warning:

```lean
theorem nonempty_algEquiv_pi_matrix_of_prod_ne_zero (K : Type*) [Field K] (q : Kˣ) (n : ℕ)
    (h : ∏ r ∈ Finset.range n, ∑ j ∈ Finset.range (r + 1), ((q : K) ^ 2) ^ j ≠ 0) :
    Nonempty (TypeAHeckeAlgebra K q n ≃ₐ[K]
      Π μ : Nat.Partition n, Matrix (Fin (standardCount (YoungDiagram.ofPartition μ)))
        (Fin (standardCount (YoungDiagram.ofPartition μ))) K) := by
  sorry
```

This statement carries the split semisimplicity, the labelling of the simple modules by partitions and dim = f^λ, which the Summary's first headline asserts. The fix is to state it, under a name of the author's choice, and name it in §1.2. The docstring bullet would then be narrowed to identifying the blocks with the Specht modules, to one-box branching and to the Pieri rule.

## C01 — The revision renames H1–H4a without an old → new mapping, so citations in four roadmaps on main lose their target

On main, GeometricTopology (seven lines, for example "TypeAHeckeAlgebras H1–H2" and "H1–H4a") and SpringerResolutionAndCharacteristicCycles (four lines, "TypeAHeckeAlgebras H1" in §11.3) cite the old ids. So do TemperleyLiebOperatorAlgebras ("H3 and H4a" in its scope section) and VonNeumannAlgebras (two lines, "H3"). The README contains no mapping. The description says "The table that maps every item of the old README to its new place accompanies this update", but the change contains no such table. One sentence in "How to read the build" would fix both: "In the earlier numbering these layers were H1–H4, and §§4.6–4.16 were H4a."

## C02 — The source cited for each of the first two Lean headlines does not cover its full statement

The §1.2 locator, Wenzl1988 Theorem 2.2 (p. 365), works over ℂ for q not an l-th root of unity, 2 ≤ l ≤ n, and proves only that Hₙ(q) is then semisimple. By contrast, `isSemisimpleRing_typeAHeckeAlgebra_iff` holds over every field and in both directions, so it needs a source that proves the criterion over an arbitrary field.

The §3.6 locator, Wenzl1988 Theorem 3.6(a) (p. 378), assumes that Wenzl's q (our Q) is not a root of unity. It therefore excludes the case Q = 1, which `ocneanuTrace_nonneg_iff_of_isSelfAdjoint` includes (q = ±1). The statement is true there: a Markov trace is multiplicative, and by Thoma p_m = z^(m−1) forces z ∈ {0, ±1/k}, which is exactly `positiveMarkovSet 1`. Cite Thoma's theorem for this case (Neretin2021, Remark after Theorem 1.1, p. 6).

## C03 — Two cited texts cannot be located by a reader

- **The course notes.** "The course notes transcribing Freyd et al. (physical pp. 87–89)" (§2.5, line 598; §3.3, line 740; References) are never identified. Every passage cited from them is printed in HOMFLY1985, p. 245:
  - the balanced relation and the "nonzero if and only if" theorem;
  - τ = (4cosh²θ)⁻¹ with η printed using tan θ;
  - the exceptional points k ≤ [(m−1)/2];
  - γ(σ_k);
  - `P_b(e^α, −e^(−α), 2i sinh θ)`.

  Citing those pages directly would make the citation checkable.
- **Kerov.** The Kerov entry (line 2461) gives no journal, book or year, so "printed pp. 128–129" cannot be checked. Give the venue and year.

## C04 — §4.17 misreports the remark it discusses: it is Freyd et al.'s, and it prints R_{α,θ}, not R_(α,0)

Line 2151 reads "Wenzl's final remark (printed p. 246) reads `R_(α,0)`". Wenzl's paper runs over pp. 349–383. Page 246 is the last page of HOMFLY1985, and its final Remark, about Wenzl's work, refers to the subfactor generated by e₂, e₃, … "in R_{α,θ}". These are the hyperbolic parameters (α, θ) of the same section. The discussion of a "literal assignment τ = α, η = 0" (lines 2151–2159) and §4.18's clause "for the literal source assignment τ = α, η = 0" (line 2175) therefore rest on a reading that the print does not contain. Replace the paragraph with one sentence: the remark of Freyd et al. (p. 246) concerns ⟨e₂, e₃, …⟩ ⊂ R_{α,θ}, whose index and entropy are those of §§4.2–4.18. Drop the clause in §4.18; the η = 0, 1 endpoint computation stays.

## C05 — Three named results carry no locator

- **Ram's formula (§1.7, line 332).** It is attributed to Ram, but nothing is cited and Ram is not in the References.
- **The cycle-block cocenter basis (§1.5, line 254).** Neretin2021 §1.4 (p. 5) states it and cites Geck–Pfeiffer §8.2.
- **The hook product (H) of §4.12 (line 1718).** It is Wenzl1988 (3.5), p. 376, which itself cites Macdonald I §3 Ex. 3.

## C06 — "describe the blocks" in §1.4 (line 228) asks for no statement

Either state the block theorem to be proved, or drop the phrase.

## C07 — The description's §1.7 bullet names Checks the head does not have

The description says Ram's formula is "checked on H₂(q), on the sign character and on the regular trace of ζ₃". In the head, the §1.7 Checks are on H₂(q) and on the index character (one variable x₁ = 1). There is no sign-character Check and no ζ₃ Check. It would read correctly as "checked on H₂(q) and on the index character".

## N01 — The heading of §2.5, "The course-note specialization and the hyperbolic parameters", names a source

A heading named by its mathematics would fit the rest of the README, for example "The hyperbolic specialization of the braid invariant".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 / Lean criterion | n = 0, 1, 2; q = i; q = e^(iπ/3); Q = 1, n = 3 | n = 2: product 1 + Q; q = i: (T − i)² = 0 and 1 + Q = 0; e^(iπ/3): 1 + Q ≠ 0 | holds | C02 (locator) |
| §1.2 Wedderburn | n = 3; probe signature | 1 + 4 + 1 = 6 = 3!; abstract `≃ₐ` to Π M_(f^λ)(K) elaborates | statable, absent | R04 |
| §1.1 sign Check | 𝔽₄, q = ω | q − q⁻¹ = 1; T ↦ −T is the identity, so a homomorphism | Check false | R03 |
| §1.3 branching | S^(2,1)↓, S^(2)↑ | 2 = 1 + 1; 1 + 2 = 3 = rank of H₃ over H₂ | holds | none |
| §1.5 cocenter | H₃; S₄ χ^(3,1)/3 | basis {1, g₁, g₂g₁}; g₂ = (g₁g₂)g₁(g₁g₂)⁻¹; τ(s₁s₃) = −1/3 ≠ 1/9 | holds | C05 |
| §2.5 hyperbolic | both eigenvalues of γ | e^αγ + e^(−α)γ⁻¹ = −2i sinh θ; printed sign gives 2i cosh θ; a = −i sinh θ/cosh α | holds; source misprints | errata |
| §3.1 q = i | unitary T | (T − i)² = 0 and T normal, so T = i; index = sign character | holds | none |
| §3.2 (11.6) | g = (1+t)e − 1 | relator = (1+t)³(e₁e₂e₁ − τe₁); q = 1 quotient dimension 5 = C₃ | holds | none |
| §3.3 balanced | g², g⁻¹, f = 1 − e | g² = (t−1)g + t; g⁻¹ = g* if \|t\| = 1; complement negates the defect | holds | none |
| §3.6 / Lean real | Q = 1 (Thoma); Q = 2; non-real z | z ∈ {0, ±1/k}; a₋₃(2) = 2/7, a₋₄(2) = 14/45; positivity forces 2z real | holds | C02 (Q = 1) |
| §3.7 / Lean unit | l = 3, 4, 5; Q = e^(4πi/5) | l = 3: {1, 0}; a₂(i) = 1/2; a₃ = 1/φ²; Wenzl Prop. 2.9 gives scalars only | holds | none |
| §3.9 exclusion | τ = 1/2 (t = i), τ = 1/φ² | Ising η = 1/2 and η ∈ {a₂, a₃} positive, non-scalar | target false | R01 |
| `wenzlParameter` | `norm_num` on 5 values | a₂(1) = 3/4, a₋₂(1) = 1/4, a₋₃(2) = 2/7, a₋₁ = 0, a₁ = 1; a_d + a_(−d) = 1 | holds | none |
| §4.2 subfactors | k = 2; λ = (1); Wenzl Thm 3.7 | d = 2cos(π/l); d_λ = d, tr = 1; print has sin²(π/l), proof sin^(2m) | holds | errata |
| §4.6 index/entropy | weights (2/3, 1/3); equal weights | 9/2 = (1+Q)²/Q at Q = 2; H = 1.273 < 1.504; equal weights: both log 4 | values hold; inference false | R03 |
| §4.7 quantum trace | general r; r = 2 | Σ_(i<j) p_i p_j = (Q^r − Q)/((1+Q)(Q^r − 1)); r = 2: Q/(1+Q)² | holds | R02 (owner) |
| §4.9 limits | one letter; FerayMeliot2012 Thm 1 | λ(n) = (n); (1 − q)q^(i−1) for q < 1, in probability | holds | none |
| §4.10 shift | n = 3 braids | δ₃σ₁δ₃⁻¹ = σ₂ | holds | none |
| §4.12 (H), (B) | λ = (1), (2), (1,1); λ = ∅, (1) | match p₁ and (p₁² ± p₂)/2; r₁ + r₂ = (A+B)/(1−t) = 1 | holds | C05 |
| §4.13 Check | Λ = (1) | ν ∈ {∅, (1)}; π = (A, 1 − A); D₁ = (1, 0); c₁ = A | Check false | R03 |
| §4.15 gauge | u = ab, v = ba, any tail c | inv(abc) − inv(bac) = −1 = inv(ab) − inv(ba) | holds | none |
| Atomic-models headline | geometric weights | Σ 1/w_j = ∞; entropy finite; no Jones index at pins | not statable, named | none |
| §4.17 remark | HOMFLY1985 p. 246 image | prints R_{α,θ}, not R_(α,0) | misreported | C04 |

- Source locators checked against the text: 14. These are Wenzl1988 Thm 2.2 (p. 365), Prop. 2.9 (p. 370), (3.5) (p. 376), Thm 3.6(a)(b) (pp. 378–379), the p. 380 setup with Fig. 2, and Thm 3.7 with its proof (pp. 380–382); HOMFLY1985 three theorems (p. 245) and the final Remark (p. 246), both read on the page image; Neretin2021 §1.4, Thm 1.1 with (1.7)–(1.8), and §§1.6–1.7; FerayMeliot2012 Thm 1.
- Tau Ceti declarations opened at the pin: `jimboGenerator` (KnotTheory/Jimbo/Basic.lean:95), `cycleWord` and `IsMarkovTrace.map_cycleWord` (TypeAHeckeAlgebra/CycleWord.lean:82, 223), `jonesRelator_ne_zero` (TemperleyLieb.lean:118), `heckeEquiv` and `map_heckeEquiv_mul_e` (BalancedProjection.lean:344, 408), `canonicalTrace_star_rescaled_Tw_mul_rescaled_Tw` (Regular/Form.lean:92), `continuous_heckeLeftMatrix_sqrt` (GroupTheory/Coxeter/Hecke/Matrix.lean:290), `signedCheckedR_eq_jimboGenerator` (SignedCheckedR.lean:334), `IsMarkovTrace.comp_complementEquiv` (Complement.lean:173), `ocneanuTrace` (OcneanuTrace.lean:438), `groupAlgebraEquiv` (GroupAlgebra.lean:86), `injOn_zpow_cellContent_iff` (Combinatorics/Young/Addable.lean:385), `tendsto_empiricalMeasure_apply_ae_forall` (Probability/Exchangeability/ConditionallyIID/StrongLaw.lean:190), `standardCount` (Combinatorics/Young/StandardTableau/Basic.lean:213).
- README Lean names: all 298 backticked tokens were searched at the pins, and every Lean name resolves. The pin has no semisimplicity or positivity theorem for these algebras and no Jones index.
- Cross-roadmap citations resolved on main: SchurWeyl Layers 3–5, §§7.2, 7.5, 7.6 and Layer 8; TemperleyLiebOperatorAlgebras §§1.3, 1.5, 2.1; Subfactors §§2.2, 2.5, 2.6 (the formula and the "no finite-index hypothesis" read), 3.2–3.3 and Layer 4; VonNeumannAlgebras Layers 0–2, 6, 8, 10, 11, 13; QuantumGroups Layer 8; GeometricTopology Layer 4 and SpringerResolutionAndCharacteristicCycles §11.3 (consumers).
- Automatic checks: all passed. Dependency check output: `depcheck: 178 roadmaps, 2031 edges, 0 problem(s)`; there is no UPWARD and no CYCLE line, and every supplier is on main.
- Elaboration: `Suggested.lean` gives only the three `sorry` warnings. `#check @` of all five declarations matches the README statements, and no binder is lost. One-tactic probes (`simp`; `constructor` with `infer_instance`/`simp_all`) leave the criterion open. The Wedderburn signature above elaborates.
- Overlap check: read TemperleyLiebOperatorAlgebras, Subfactors and SchurWeyl (open and main), TemperleyLieb (open revision), QuantumGroups (open revision and main), and also QuantumEnvelopingAlgebras, VonNeumannAlgebras and GeometricTopology. Shared objects and their owners:
  - Temperley–Lieb positivity and the Jones quotients: TemperleyLiebOperatorAlgebras §§1.3, 1.5 and Subfactors §§3.2–3.3, cited.
  - Symmetric-group Specht modules, Λ and RSK: SchurWeyl, cited.
  - The generic higher-rank quantized enveloping algebra and its highest-weight modules: QuantumEnvelopingAlgebras, not cited (R02).
  - The Hecke algebras, the Ocneanu trace and the Hecke subfactors: this roadmap, with GeometricTopology and TemperleyLiebOperatorAlgebras agreeing.
- Source independence: 19 passages compared with 4 sources; nothing shared beyond formulas and the printed literals quoted as provenance. Largest share Wenzl1988, 5 of 17 locators. Contents compared with Wenzl1988 (§1 AF subfactors, §2 orthogonal representations, §3 Markov traces): independent. Layers 1–4 follow the order the *Needs* lines force (module theory, then trace, then positivity, then subfactors).
- Research link: Layers 3–4 are Wenzl's classification of positive Markov traces and his Hecke subfactors with index sin²(kπ/l)/sin²(π/l) (Wenzl 1988). They also realise the Vershik–Kerov traces of H∞(q) as product states (Neretin 2021, Theorem 1.1, §1.7), with the q-Plancherel endpoint of Féray–Méliot (2012). Basis: README References, Wenzl1988 §3, Neretin2021.

## Not verifiable

- Jones1987 (Ann. Math. 126), Theorem 5.1, §§11–14 and (11.6), cited in §§2.1, 3.2 and 3.4: behind the JSTOR paywall, and the sources service found no open copy. The (11.6) identity was checked by computation instead.
- Sawin1995 (Amer. J. Math. 117), §1 Theorem 1, §3 Theorem 3 and Proposition 9, cited in §4.7 (a sampled target): behind the JSTOR paywall, and no arXiv copy was found. The §4.7 trace formula was checked by computation.
- Kerov, "A q-analogue of the hook walk algorithm", §4.2, pp. 128–129, cited in §4.8: no venue or year is given, and no legal copy was found.
- The "course notes" (pp. 87–89): not identified. Their content was checked in HOMFLY1985 instead.

## Source issues

- **Misprint** in Wenzl1988 at Theorem 3.7, p. 380: the source says the hypothesis is q = e^(±πi/l); it should be q = e^(±2πi/l), as in Theorem 3.6(b) and Fig. 2; affects a stated result.
- **Misprint** in Wenzl1988 at Theorem 3.7(a), p. 380: the source says [B:A] = sin^(2m)(kπ/l)/sin²(π/l); it should be sin^(2m)(kπ/l)/sin^(2m)(π/l), as the proof on p. 381 computes; affects a stated result.
- **Misprint** in Wenzl1988 at the setup of Theorem 3.7, p. 380: the source pairs π^(k,l) with the trace η = a_k(q); by Theorem 3.6(b) that representation carries η = a_(−k)(q) = a_(l−k)(q); affects nothing.
- **Error** in HOMFLY1985 at the third theorem of the Ocneanu section, p. 245: the source says P is specialised at (e^α, −e^(−α), 2i sinh θ); it should be (e^α, e^(−α), 2i sinh θ), which the paper's unlink formula and φ's normalisation i cosh α csch θ require; affects a stated result.
- **Misprint** in HOMFLY1985 at the second theorem, p. 245: the source says η = ½(1 − tanh α tan θ); it should be ½(1 − tanh α tanh θ); affects a stated result.
- **Misprint** in HOMFLY1985 at the first theorem, p. 245: the source says the exceptional values are (4cos(π/n))⁻¹; it should be (4cos²(π/n))⁻¹; affects a stated result.
- **Error** in HOMFLY1985 at the first theorem, p. 245: the source says A_τ is nonzero only for the listed τ; e_k ↦ 0 satisfies the relations for every τ, so the statement should concern nonscalar Markov traces; affects a stated result.
- **Gap** in HOMFLY1985 at the second theorem, p. 245: the source says the exceptional points have k ≤ [(m−1)/2], yet places the Arf invariant at m = 4, k = 2; it should allow 1 ≤ k ≤ m − 1 (Wenzl Theorem 3.6(b)); affects a stated result.
- **Misprint** in Neretin2021 at §1.6, formula (1.10), p. 8: the source says the diagonal term is (q − 1)Σ_(i<j) e_ij ⊗ f_ij, which sends v_i ⊗ v_i to v_j ⊗ v_j; it should be e_ii ⊗ f_jj; affects nothing.
- **Misprint** in Neretin2021 at footnote 6, p. 4: the source says Kerov died in 2020; it should be 2000; affects nothing.

## For the human reviewers

- Licence: README §§2.5 and 3.3 and the References cite unnamed "course notes transcribing Freyd et al." (physical pp. 87–89). Their host and licence could not be identified. Everything cited from them is printed in Freyd et al., Bull. AMS 12 (1985), p. 245.
- Not tested: Jones 1987 and Sawin 1995 are behind the JSTOR paywall. Their locators (§§2.1, 3.2, 3.4, 4.7) were not compared with the text, and no wording comparison was made against them.

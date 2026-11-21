# Review of HermitianFormsAndLattices (pull request #2882 at 4e39735)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example I recomputed holds, the new clauses included (weak approximation and general strong approximation in 2.5, the conjugacy of norm-maximal lattices at dyadic ramified places in 4.4, the third small-level case of 5.2(d), the metric neighbour chain of 5.4, the rank-one density of 6.1a(a), and each bound stated as a form of the formal proof against the general bound it is derived from), and the 22 locators into Kirschmer's text match it. The three small corrections of the previous review are repaired, one in part. There are five small corrections (the description still announces two Lean statements; the CM declaration is a one-term corollary and is not the form the README describes; 6.2(c) has no route although the constant it leaves open is `β_∞`; one sentence on F5.7 contradicts the Scope section; five statements still lack a locator) and four format notes, none blocking. The human reviewers decide the provenance of the statements labelled as forms of the formal proof, which I could not read.

## C01 — The description announces two Lean statements and does not mention the forms of the formal proof; the head has three declarations and states such forms in twenty-odd places

A reader of the description expects `Suggested.lean` to hold Landherr's two statements only, and the README to hold the classical statements only. The description says "`Suggested.lean` states 2 headline theorems with `sorry` proofs … (`hermitian_congr_iff_forall_place`, `exists_hermitian_localizations_iff`)". The head adds `hermitian_congr_iff_forall_place_of_cm` (`Suggested.lean`, line 86), proved from the first, and the README now carries a paragraph in the Summary (lines 50–55), the compact-dual measure in the Conventions (lines 209–215), target 6.2(c), and clauses labelled *The form of the formal proof* in 2.5, 3.1, 4.0a, 4.0b, 4.1, 4.9, 4.11, 5.4, 5.9, 6.3, 6.4a, 6.4b, 6.4c and 6.5.

The text that would be right: "`Suggested.lean` states 2 headline theorems with `sorry` proofs and the case of the first for CM extensions, proved from it", and one sentence saying that targets carry, where the two differ, the form in which the formal proof has the statement, with 2.5(d) for an arbitrary finite set `S`, 2.5(f) and 6.2(c) as new targets.

## C02 — `hermitian_congr_iff_forall_place_of_cm` is closed by one term and is not the statement that 3.1 calls the form of the formal proof

As a target it asks an implementer for nothing: its proof is `hermitian_congr_iff_forall_place σ hσ H H' hH hH' hdet hdet'` (`Suggested.lean`, line 102), the classical theorem with two instance hypotheses added. The README says of it "`hermitian_congr_iff_forall_place_of_cm` is the Gram-matrix form for CM extensions" (line 729), directly after a form with other hypotheses and one direction only: `τ(H)`, `τ(H′)` congruent over `ℂ` for every embedding `τ : E → ℂ`, and `det H′/det H` a local norm at every finite place (lines 724–728). A reader who matches the prose to the Lean finds two different statements.

The docstring already says that the declaration follows from the classical one, so it can stay as a marked corollary; then line 729 would say that it is the classical equivalence restricted to CM extensions, not the form just displayed. If the comparison is what is meant, state that form instead: it is statable at the pins (embeddings `E →+* ℂ`, `Matrix.conjTranspose`, the norm condition as in `exists_hermitian_localizations_iff`) and does not close in one step.

## C03 — 6.2(c) is left without a route, but the constant it declines to compute is `β_∞(L)` of 6.1b for every signature, so (c) follows from (b) and 6.3(c)

An implementer meets a target with neither route nor source: "The fibre measure of (b) and `μ^c` differ by a positive constant factor, which is not computed here; so (c) is not derived from (b) here" (lines 2774–2776), and "(c): not given here" (line 2791).

The factor does not depend on `(p, q)`. At a real place take a basis with Gram matrix `H = I_{p,q}`. The differential of `X ↦ X^*HX` at `1` vanishes on `𝔲(H)` and is `Z ↦ 2HZ` on `i𝔲(H)`. Left multiplication by `H` preserves Lebesgue measure of `M_n(ℂ)` (`|det H| = 1`), commutes with `i`, and maps `𝔲(H)` onto `𝔲(n)` and `i𝔲(H)` onto `Herm_n`; so it carries the measure `λ` of `𝔲(H)` (Conventions, lines 211–213) to that of `𝔲(n)`, and the density of the fibre measure at the identity with respect to `λ` is the same for every signature. The lattice normalisations depend only on `𝔳(L)` (route of 6.1b). Hence the fibre measure is `β_∞(L)·μ^c`, with `β_∞(L)` the value of 6.1b (the definite case, where `μ^c` has mass one), and (b) divided by `β_∞(L)` is `mass(O_E^n)` by 6.2(a) and 6.3(c) for unimodular `L`. Two sentences to this effect in the route would replace "not given here"; 6.1b would join the Needs of (c).

## C04 — 6.2 says that AbelianSchemesAndArithmeticModuliPartII F5.7 takes the mass formula as an input, while the Scope section and F5.7 itself say that F5.7 owns it

A reader cannot tell who proves the unitary mass formula over an imaginary quadratic field of class number one. In 6.2: "(a) is the mass formula that AbelianSchemesAndArithmeticModuliPartII F5.7 takes as an input" (lines 2766–2767). In the Scope section: "the unitary mass formula for them and the growth of their total mass in the rank are AbelianSchemesAndArithmeticModuliPartII F5.7's" (lines 3446–3447). F5.7 at its open head lists the formula among what it proves ("with the unitary mass formula under specified measures including all ramified and dyadic local factors", `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md`, line 2786), says "F5.7 owns CM unitary mass" (line 3168), and its Needs line does not name this roadmap.

The smallest change is in 6.2: "(a) contains the mass formula that F5.7 states for that case", as the Scope section has it. The clause that F5.7's local factors are the densities of 6.1 compares two normalisations; I could not check it against F5.7's source, and it would be safer as "in the normalisation of 6.1".

## C05 — Siegel's main theorem (6.5), Weil's rank-one identity (6.0a), Jacobson's theorem (1.3), the theta inversion (7.1) and the new general case of strong approximation (2.5(d)) have no locator at the claim

The hypotheses of these statements cannot be checked against a source: for instance whether [Weil65] has the mean-value identity of 6.5(a) for every signature and every `1 ≤ k ≤ n − 1`. Sections 6.5, 6.0a, 1.3 and 7.1 name no source in their text; [Weil65], [Braun], [Jacobson] and [CohenResnikoff] appear only in the References against lists of sections (lines 3643, 3667–3672, 3703). Each of the four has a complete route, so nothing is unsupported. 2.5(d) for a set `S` that does not contain the archimedean places has neither: "it is the classical theorem in this generality (Kneser, Platonov), not given here" (lines 674–675), and the References have no entry for it ([Kneser] there is the 1957 paper on class numbers, cited for 5.4). The statement is the standard one, for `SU(V)` simply connected and absolutely almost simple with `SU(V)(F_S)` noncompact.

One clause at each statement with the theorem or section number and the page would settle it, as was done at 4.4(d) and 6.1a(d); for 2.5(d), a References entry with the theorem number.

## N01 — Two attributions to [Kirschmer] are a little wider than its statements

In 2.1 (lines 564–565) "In characteristic zero these are … Theorem 3.2.3 and Corollary 3.2.4" covers (a) and the isotropy criterion of (c); that both classes occur and that a binary space represents every `c` are not stated there, and the source's chapter is over a complete discretely valued field with finite residue field, not only in characteristic zero. In 5.4 (lines 1912–1914) Proposition 5.2.5 is for neighbours at one prime `𝔓` of `E` and has an extra hypothesis at a split place (Kirschmer lines 2941–2946); the `w`-neighbours of (a) allow both primes.

## N02 — In the third Check of 6.3 the `1/72` in "`2·(1/72) = 1/36`" is the mass of `O_E²` in `⟨1, 1⟩`, not the norm-maximal mass `1/72` in `⟨1, 2⟩` named just before it

Lines 2866–2868. The sentence is true; "has mass `2·mass(O_E²) = 1/36`" would say which mass is meant.

## N03 — In 6.1a(a) and its route `η_v^n` is used as a number

Lines 2513–2514 and 2548–2550: `η_v` is a character of `F_v^×` in the Conventions, and `η_v^n q_v^{−n}` means `η_v(ϖ_v)^n q_v^{−n}` (`(−1)^n` at an inert place, `1` at a split one). Writing the value, or a sign `χ_v` as in 6.0a (line 2239), would remove the ambiguity.

## N04 — "The formal proof that the family follows" is identified nowhere in this README

Lines 50–55 and every clause labelled *The form of the formal proof* refer to it; the family index names it, this README and its References do not. One clause in the Summary pointing to the family index would let a reader of this file alone find what is meant.

## Earlier findings

- C01 (no locator at 6.5, 6.0a, 1.3, 7.1, 4.4(d), 6.1a(d)): partly repaired. 4.4(d) now has "the volumes `𝔳(L_v)` of the norm-maximal forms are [Kirschmer], Lemma 3.5.3 (2), (3), p. 43" (lines 1253–1254) and 6.1a(d) "these are the values of its Lemma 4.2.9, pp. 55–56, at the dual `L_v^∨ = ΠL_{−1} ⊥ L_0`" (lines 2528–2531); both verified. The rest is C05.
- C02 (two contracts of other roadmaps point elsewhere): repaired. "2.1(a) is the local classification that EndoscopicTransferAndUnitaryTraceComparisonPartII asks of GeometryOfNumbersAndQuadraticArithmetic, and 3.1–3.2 are the Hasse classification and existence … those requests are met here" (lines 3392–3396), and the last bullet of the Downstream consumers (lines 3355–3358).
- C03 (4.4(e) narrower than the cited source): repaired. "(e) the norm-maximal lattices of a global `V` form one genus, and, if no dyadic place of `F` ramifies in `E`, so do the scale-maximal ones" (lines 1255–1256), with (c) "at every finite place, so are any two norm-maximal ones" and a route at dyadic ramified places (lines 1279–1292), which I checked step by step.
- N01, N02: not changed; they are N01 and N02 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.5 finite fields | `q = 2, 3`; `n = 1, 2, 3` | `|U_1(𝔽_3)| = 4`, `|U_2(𝔽_2)| = 18`, `|U_2(𝔽_3)| = 96`, `|U_3|/|U_2| = 252` at `q = 3`; `P_2(−q) = (q²−1)(q²+q)` | holds | none |
| 1.6 skew-Hermitian and trace forms | `ℂ`, `w = i x̄y`; `𝔽_2 × 𝔽_2`; PELModuli M0.22 | `Tr(i x̄y) = −2(x_1y_2 − x_2y_1)`; `Tr w(x, x) = 2ab = 0`; M0.22: `Tr_{A/R}(δH)`, linear in the first variable | holds; citation resolves | none |
| 2.3 split places | `n = 3`; `⟨1, 1⟩` | Witt index `1`, kernel `⟨1⟩`; `−1 = N((1, −1))`; `GL_3(F_v)` noncompact | holds | none |
| 2.4 Witt index and sign | `H^r`; `n = 2` | `(−1)^{r(2r−1)}(−1)^r = 1`; `ε = η(−det)` is `1` exactly for `H` | holds | none |
| 2.5 compactness, approximation | Cayley map; `S = {∞}` definite; `ζg` | `h((1−X)u, (1−X)w) = h(u,w) + h(Xu,Xw)`; `1 + c(X) = 2(1+X)^{−1}`; `SU(V)(F)` discrete in `SU(V)(𝔸_f)` | holds; general `S` has no locator | C05 |
| 4.0b indices and lengths | `A = O²`, `B = O ⊕ ϖ²O`, `C = ϖ^{−1}O ⊕ ϖO`; `d = 1`; `Θ = ϖO` | `idx`: `2`, `−2`, `0`; sup over `W`: `1, 0, −1`, colength `1`; (ii) fails `0` against `1` without `Y ⊆ Θ` | holds | none |
| 4.1 Jordan splittings | split `(u_i, ϖ^{c_i}u_i^*)`; ramified `Π`-modular line; source | `h(b_i, b_i) = ϖ^{c_i} ∈ F_v`; `v_𝔓(h(x,x))` even; Kirschmer 3.3.3 line 1093, 3.3.5 (3), (5) lines 1132–1136 | holds | none |
| 4.2 unimodular lattices | `ℚ_3(√−3)`; `ℚ_2(i)`, `x = e_1 + e_2` | residue forms `x²+y²` (anisotropic, `−1` nonsquare), `x²−y²`; `h(f,f) = Tr(b) + 1` odd | holds | none |
| 4.4 maximal lattices | dyadic ramified, isotropic and anisotropic; source | `h(L, x) = 𝔇^{−1}`, `Tr(𝔇^{−1}) = O_v`; binary form `a·N_K`; Kirschmer 3.5.3: `v = −(m−1)/2, −m/2, 1 − m/2` | holds | none |
| 4.6 integral models | `ℤ[i]` at `5`, `3`; `ℚ_3(√−3)` | `G_m`; `|U_1(𝔽_3)| = 4`; `N(a + bΠ) = a² + 3b² ≡ a²`, fibre `μ_2 × 𝔾_a` | holds | none |
| 4.10 sublattices | `ℤ[i]²`; bounds | `[2 1]_9 = 10`, `6 + 6 = 12`, `3`, `7`, `[2 1]_4 = 5`; compositions `≤ (e+1)^{j−1}`, `C(a+d−1, a) ≤ d^a` | holds | none |
| 5.2(d)(iii) small levels | `ℓ = p`, `ℓ ≠ p`, `p = 2` | `v(py) = v(p) + v(y) < p·v(y)` as `(p−1)v(y) ≥ 2v(p)`; `v(y²) > v(2y)` iff `v(y) > v(2)` | holds | none |
| 5.4 neighbours | metric form; split `𝔓`; source | `[L : L_x] = [L(x) : L_x] = N𝔓`; `L_0 ∩ L(x) = (L_0 ∩ L) + O_Ex`; `(q^n − 1)/(q − 1)` hyperplanes; Kirschmer lines 2887–2946 | holds; attribution wide | N01 |
| 5.7 dimension formula | `ℚ(√−3)`, `O_E²`, `det^a`; level at `7` | `det U(L) = μ_6`; roots `3, 5` of `x² − x + 1` mod `7`; `1 = 6·(1/6)·1`; discriminant `−64/25` | holds | none |
| 5.9 subspaces of given discriminant | `ℚ(ζ_12)/ℚ(√3)`, `n = 16, 4`; `⟨1, 11⟩` | `2 = 𝔭²`, `𝔭` inert (`e = f = 2` in `E`); `#A_P = 4² = 16`; `3 ≡ 5²`, `11 ≡ 3 mod 4`; bound `16^{1/2}` | holds | none |
| 6.1a(a), `k = 1` | inert `q = 2`, `n = 2`, `ν = 1, 2, 4, 8`; `n = 1` | counts modulo `16`, `32`: `3/4, 9/8, 21/16, 45/32`, the formula; `n = 1`: `(1 + q^{−1})·[a even]`; split: `(a+1)(1 − q^{−1})` | holds | N03 |
| 6.1a(d) against Kirschmer 4.2.9 | `n` odd; even, `ε = ±1` | `1/2`; `(1/2)(1 + 1) = 1 = q^{n/2}·q^{−n/2}`; `(1/2)(q − 1)(q^n − 1)/(q² − 1) = (q^n − 1)/(2(q + 1))` | holds | none |
| 6.1b archimedean densities | `n = k = 1`; Gamma integral; closed form | `π·2/(|d_E|^{1/2}N𝔳)`, `π` for `ℤ[i]`; `c = π^{nk − k(k−1)/2}/∏Γ(n−j)`; `|d_E| = |d_F|²N𝔡` gives `|d_F|^{n²/2}` | holds | none |
| 6.0b `τ(U(V)) = 2` | `n′ = 3`, `q = 5, 2`; source | `124·26 = 3224`, `248`, `49/625`; `7/16`; Kirschmer line 1873: `τ = 2` for `dim_K E = 2` | holds | none |
| 6.2, 6.3 mass formula | `O_E^n` over `ℚ(√−3)`, `n = 1..8`; `c_n` | `1/mass`: `6, 72, 1296, 31104, 933120`; `×235146240 = 13`; `×48372940800 = 41`; `Σ(2j−1) = n²` | holds | N02 |
| 6.2(c) compact-dual form | `H = I_{p,q}` | differential `Z ↦ 2HZ` on `i𝔲(H)`; `|det H| = 1`; factor `β_∞(L)` for every `(p, q)` | holds; route missing | C03 |
| 6.4 ratios | `n = 2..6` | `0.083333, 0.055556, 0.041667, 0.033333, 0.051587 = 13/252` | holds | none |
| 6.4a unimodular lattices over `M` | `⟨1,1⟩`, `⟨1,1,1⟩` over `ℚ(√−3)`; `ℚ(√5)` | closed forms `0.5` and `0.083333 = 3·(1/36)`; `ε^6 = 5 + 8ε` | holds | none |
| 6.4b total mass | `ℚ(ζ_12)`, `j = 2`, `n = 16` | `β_𝔭 = 9, 18`; masses `2m_2, m_2`; `s_2(4) = 5`; `2·1 + 1·3 = 5`; `(q^j − (−1)^j)/(q+1) ≤ q^{j−1}` | holds | none |
| 6.4c weighted count | exponents | `l + (s+l+2)/2 + 2s = (5s+2+3l)/2`; `4s+2 + 1+l + l/2 + (s+l+2)/2 = (9s+8+4l)/2`; `24 + 18 = 42` | holds | none |
| 6.5 Siegel's main theorem | `O_E²`, `T = 1`, `T = 4` | `(4π²/3)(27/4π²)(4/3) = 12`; `64·9/8 = 72`, `64·21/16 = 84` | holds; no locator | C05 |
| 3.1 Landherr, Hasse principle (Lean, two declarations) | `n = 0`; CM instance; one-term probe | `n = 0`: both sides true; `_of_cm` is the first with two instances; `rfl`, `simp`, `decide` leave the first open | holds; README and Lean agree | C02 |
| 3.2 Landherr, existence (Lean) | `⟨1, 2⟩` over `ℚ(√−3)`; complex and split places | non-norm places `{2, 3}`, even; determinant always a norm where `E_v` splits | holds; README and Lean agree | none |
| 4.9, 4.11 forms of the formal proof | bounds | `(#A_M·#A_{M′})^{s} ≤ (n·nN_0)^{2s+1}`; local number `0` or `#O(A_{M′})` | implied by (c) | none |

- Source locators checked against the text: 22, all in Kirschmer (Theorems 2.4.1, 3.2.3, 3.3.3, 3.3.18, 4.2.3, 4.2.4, 5.4.14; Corollary 3.2.4; Algorithm 3.3.2; Propositions 3.3.5, 4.2.7 (3), 5.2.4, 5.2.5; Remark 3.4.2 (3); Definitions 2.3.3 (7), 4.2.2, 4.2.6, 5.2.1; Lemmas 3.5.2, 3.5.3, 4.2.5, 4.2.9); the three new ones (3.5.3, 4.2.6, 4.2.9) and those of the sampled sections read line by line this round, statement and printed page agreeing.
- Tau Ceti at the pin: `NumberTheory/ClassFieldTheory/Local/Reciprocity.lean:85` (`localArtinEquiv`), `Global/HasseNorm/Basic.lean:154, 170`, `NumberTheory/QuadraticForm/Global/SignPrescription.lean:154`, `NumberTheory/NumberField/Global/Approximation/Weak.lean:208`. Mathlib: `NumberField.IsTotallyComplex` at `NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:210`.
- Cross-roadmap citations resolved at this head: PELModuli M0.22 (lines 1042–1062), MetaplecticAutomorphicForms §§3.2a, 6.7 (line 1589), ClassFieldTheory §§6.1, 13.1, IntegralLattices 3B, 4A, 4B, 4G, ThetaSeries 1A, 3A, GeometryOfNumbersAndQuadraticArithmetic 2.2.3, 2.2.4, 3.2.4, EndoscopicTransferAndUnitaryTraceComparisonPartII (both gaps, lines 888, 897), AdelicAlgebraicGroups §4.2 (line 4073: `S` contains the archimedean places), AbelianSchemesAndArithmeticModuliPartII F5.7, OrbitMeasuresOnAdelicGroups §§2.6, 3.4a (six slugs), DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5c.
- Dependency check: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`. Every automatic check passed; no change outside the folder and the family index.
- Elaboration of `Suggested.lean`: two `sorry` warnings and nothing else. The elaborated types of the three declarations compared with README 3.1 and 3.2: no binder lost, same generality.
- Padding probe: `first | rfl | simp | infer_instance | decide | trivial | exact?` closes neither sorried theorem; the third declaration is proved in the file by one term (C02).
- Computations in plain Python: the masses of 6.3 for `n = 1, …, 8`, the ratios of 6.4, the Gaussian binomials of 4.10 and 6.4b, the closed forms of 6.4a, and the counts of `N(x) + N(y) ≡ ν` modulo `16` and `32` over `ℤ_2[ω]` for 6.1a(a).

Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, IntegralLattices, BesselPoincareSeriesAndGramBounds, GeometryOfNumbersAndQuadraticArithmetic, EndoscopicTransferAndUnitaryTraceComparisonPartII, AdelicAlgebraicGroups. Hermitian carriers, integral Hermitian lattices and unramified densities: GeometryOfNumbersAndQuadraticArithmetic, cited. Tamagawa and orbit measures, strong approximation for `S` containing the archimedean places: AdelicAlgebraicGroups and OrbitMeasuresOnAdelicGroups, cited. Jordan splittings, class sets and neighbours of quadratic lattices over `ℤ`, discriminant forms and gluing: IntegralLattices and Tau Ceti, compared. The theta roadmaps and BesselPoincareSeriesAndGramBounds consume this roadmap and own none of its objects. The local and global classification asked of other suppliers by EndoscopicTransferAndUnitaryTraceComparisonPartII: owned here, recorded in the Scope section. The unitary mass over imaginary quadratic fields of class number one: AbelianSchemesAndArithmeticModuliPartII F5.7, recorded in the Scope section (C04 for one sentence in 6.2).

Source independence: 26 passages compared with 1 source (Kirschmer), none shared; largest share Kirschmer, 22 of 33 in-text locators; contents compared with Kirschmer: independent (Layer 3 ↔ its 2.4 and 3.4, Layer 2 ↔ 3.2, Layer 4 ↔ 2.3, 3.3, 3.5, Layer 5 ↔ 5.2, 5.4, Layer 6 ↔ 4.2, not in its order: its mass formula precedes its neighbours; Layers 0, 1, 7 have no counterpart). The other cited texts were not read (below).

Research link: Layers 5–6 state Siegel's mass formula for Hermitian lattices as in Kirschmer 2016 (Theorem 4.2.3, Proposition 4.2.7), with the local densities of Gan–Yu 2000 and Weil's `τ(U(V)) = 2` (Weil 1965); Layer 3 is Landherr 1936. The family's theta-lift roadmaps consume them. Rests on Kirschmer's text and the README's Downstream consumers.

## Not verifiable

- The formal proof the README refers to: not among the texts at hand. Every sentence of the shape "the formal proof uses …" or "has … in the form …" is unchecked; what I checked is that each such form follows from the general target it is attached to.
- [Weil65] (6.0a, 6.0b, 6.5): paywalled at the previous reviews; not tried again. The statements were checked by computation and through Kirschmer, Theorem 4.2.3.
- The source of AbelianSchemesAndArithmeticModuliPartII F5.7 (its local factors (38)–(40)): not read, so the clause of 6.2 that identifies them with the densities of 6.1 is unchecked (C04).
- The general theorem of strong approximation (2.5(d) for `S` not containing the archimedean places): the README gives no reference, so there was no text to open; AdelicAlgebraicGroups §4.2 states the case where `S` contains the archimedean places.
- [GHY], [HashimotoKoseki], [Feit]: no legal copy was found at an earlier review; the values they are cited for were recomputed.
- [Landherr], [Jacobowitz], [Shimura64], [GanYu], [Scharlau]: read only through the theorem numbers Kirschmer quotes, which match the README's.
- [Nikulin], Proposition 1.6.1, and O'Meara 71:19a, §91: not read; the Tau Ceti declarations they are attached to exist at the pin.
- [Braun], [Jacobson], [Shimura97], [Hironaka], [CohenResnikoff], [Gross], [Knus], [Schiemann], [Weil61], [Minkowski], [Tate], [Ono], [Siegel], [Kneser]: no locator to check (C05 for the first two and for [CohenResnikoff]).
- [Cho]: its text is at hand, but the README gives no locator into it.

## Source issues

- **Misprint** in Kirschmer at Proposition 3.3.5 (3), p. 32: the source says the last diagonal entry has the exponent `i(1 − r)/2`, with `r` undefined there; it should be `i(1 − m)/2`, `m` the rank, as in item 1 (the product of the entries is then `det(L)`); affects nothing.

## For the human reviewers

- Provenance: the README states "forms of the formal proof" in about twenty places and `Suggested.lean` adds a CM declaration for it; the formalisation is named only in the family index and the description, and I could not read it or compare the Lean with it.
- Scope: explicit results exclude the dyadic places that ramify in `E` (4.1, 4.2(b), (d), scale-maximal lattices in 4.4, 6.1a(b), (d), 6.1d, 6.3(a), (b)); the Scope section says so (README lines 3433–3435). 6.1, 6.2 and the first formula of 6.3 cover every place.
- Licence: Kirschmer's Habilitationsschrift (2016), which carries 22 of the 33 in-text locators, is read from its author's page; the journal articles it quotes and [Weil65] were not read.

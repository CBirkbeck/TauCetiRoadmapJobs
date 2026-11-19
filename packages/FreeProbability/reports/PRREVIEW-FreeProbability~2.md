# Review of FreeProbability (pull request #2575 at 87d99bf)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. The head repairs both earlier findings: RandomMatrices Layer 6 is now the single owner of the bounded scalar core, and `Suggested.lean` now states Dykema's theorem and the free Lévy–Khintchine theorem. Every Check and headline statement recomputed below holds, the file elaborates with `sorry` as its only warning, and the dependency check is clean. There are four small corrections and two format notes, none blocking:
- a Speicher locator cited for more than the theorem states;
- a Blanchard–Dykema theorem narrowed to a single base algebra;
- the integral form of free Lévy–Khintchine missing from the acceptance test;
- no locator for Biane's geodesic characterization.

Two points are left for the human reviewers: Nica–Speicher, the source cited most, could not be read, and the licence of a linked external formalization was not checked.

## C01 — §8.6 cites Speicher's Theorem 7.5 for families with adjoints, but the theorem covers one matrix in each family and moments without adjoints

A reader who checks the separate-limits form of `tendsto_integral_trace_haar_conj_word` at this locator finds a narrower statement. Theorem 7.5 (Spe19 lines 3319–3324, p. 81) takes single matrices `A_N`, `B_N` converging in distribution. Its proof (Spe19 lines 3352–3358, p. 83) computes only `(tr ⊗ E)` of products `U_N A_N^q(n) U_N* B_N^p(n)`, which are powers with no adjoints.

The claim still stands. The step the route uses is the expansion of Spe19 line 3401 into `tr_α` of the A-letters and `tr_(β⁻¹γ)` of the B-letters. That expansion holds verbatim when each `A_N^q(n)` is replaced by a word in a family and its adjoints. The fix is to cite, in §8.6 (README line 1450) and in the docstring of `tendsto_integral_trace_haar_conj_word` (`Suggested.lean` line 238): "Speicher, Theorem 7.5, for one matrix in each family, and its proof, pp. 83–84, applied to words in the families and their adjoints".

## C02 — The embedding theorem of §4.5 is stated for one base algebra `B`, while Blanchard–Dykema, Theorem 1.3, allow a change of base `B ⊆ B̃`

The general library statement loses the change of base algebra. That change is what the source proves, and what a consumer embedding products over different subalgebras would need.

Blanchard–Dykema (arXiv math/9911012v2), lines 207–229 (pp. 4–5), state Theorem 1.3 for the following data:
- inclusions `B ⊆ B̃` and `A_ι ⊆ Ã_ι`;
- `φ̃_ι(A_ι) ⊆ B`;
- faithful GNS representations of both `φ̃_ι` and its restriction to `A_ι`.

The induced `κ` is unique and necessarily injective. README line 708 instead speaks of embeddings "into other systems with the same B". The fix is to state the target for `B ⊆ B̃` with `φ̃_ι(A_ι) ⊆ B`, as the source does. The same-`B` case can then stay as a Check.

## C03 — `forall_exists_isFreelyIndependentElements_law_sum_iff` states only the first equivalence of the free Lévy–Khintchine headline; the integral form is statable but neither stated nor named in the module docstring

The overview (line 23) and §6.7 (line 1111) make `R_μ(z) = κ₁ + ∫ z/(1 − tz) dρ(t)`, for a finite compactly supported `ρ`, part of the theorem. That formula is the Lévy–Khintchine representation proper, and the acceptance test does not check it.

It is statable at the pins. In coefficients it reads `κ_(k+2)(a) = ∫ tᵏ dρ(t)` for every `k`, with `ρ` a finite measure on `ℝ` that vanishes off a compact set. Every carrier exists: `TauCeti.freeCumulant`, `MeasureTheory.Measure`, `IsFiniteMeasure` and `IsCompact`. The fix is one of the following:
- add this form as a further equivalent condition or as a second theorem;
- or say in the docstring that it is left to the README because it follows from the stated form by the classical moment problem.

## C04 — The geodesic characterization of §2.2 is attributed to "(Biane)" with no theorem or page

A reader cannot locate the statement. The References entry (lines 1900–1901) gives the paper but no result, and the paper resolves only to a paywalled page. The fix is to add the theorem or section of Biane (1997) that states the characterization, or a locator in a text that states it.

## N01 — Several targets cite a range of Nica–Speicher lectures, not a numbered result

Examples are "Lectures 1–7" in §§1.1, 1.2, 6.1 and 6.3, and "Lectures 16–18" in §§5.4–5.7, including the S-transform headline `sSeries_momentSeries_mul`. A theorem number would let a reader find each statement.

## N02 — The first Example of Layer 1 (lines 198–199) cites `TauCeti.IsFreelyIndependent.apply_mul_mul_mul_of_ne` for both identities

The second identity, `φ(a²b²) = φ(a²)φ(b²)`, is `TauCeti.IsFreelyIndependent.apply_mul_of_ne`. The Tau Ceti docstring at `Probability/FreeProbability/Independence.lean:265–266` says so.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 2.1 plane trees | n = 3; depth-first vs breadth-first | path → {1}{2}{3}; star → 1₃; depth-first {1,3}{2}, {1,2}{3}; breadth-first {1,2}{3} twice | holds; KM15 Prop. 4, lines 433–439 |
| 2.2 geodesic characterization | (1 3), (1 3)(2 4), (1 2 3), (1 3 2) in S₄ | σ⁻¹γ = (1 2)(3 4), (1 4 3 2), (3 4), (1 3 4 2); totals 5, 3, 5, 3 | holds; no locator (C04) |
| 2.3 Möbius on intervals | {1,2}{3}{4}, {1,3}{2}{4}, 0₄ | K = {1}{2,3,4} gives 2; K = {1,2}{3,4} gives 1; −5 against −6 for all partitions | holds |
| 2.4 κ₃, κ₄ | coefficient sum; inverse formula; semicircle, Gaussian | 1−4−2+8+2−5 = 0; 1+4+2+6+1 = 14 terms; free κ₄ 0, 1 against classical −1, 0 | holds |
| 3.2 full C*-free product | C(𝕋) ∗ C(𝕋); factor embedding | trivial character gives 4, reduced norm 2√3; ker λ_i = ker π_i makes faithful π_i embed | holds |
| 3.5 Dykema (README and Lean) | M₂ with x₁₁; C*(F₂) with pulled-back trace | φ(e₂₂) = 0, GNS faithful; state kills ker(C*(F₂)→C*_r(F₂)); restrictions inherit faithful GNS via H = H_i ⊗ H(i) | holds; Dyk97 lines 17–29, 43–50 |
| 3.5 tracial (Lean) | ℤ/2 ∗ ℤ/2, uniform states | free product of traces is tracial on generated algebra; continuity extends; closedness unused | holds |
| 3.6 Kesten | h = 2; ℤ² | 4 · √3/2 = 2√3 ≈ 3.46 < 4; ℤ² gives 4 | holds; Kes59 Thm 3, lines 423–435 |
| 4.5 embeddings | ℂ⊕ℂ ↪ M₂ with x₁₁ | source kills (0,1), target keeps e₂₂; source allows B ⊆ B̃, README same B | holds; narrower (C02) |
| 4.6 tracial amalgamated | B = ℂ; B = M_i = M | gives §3.7; returns M; BD's normal ψ with faithful GNS met by τ on B | holds; BD lines 562–585 |
| 4.7 group algebras | ℤ ∗_(2ℤ) ℤ | τ(u_a u_b⁻¹) = 0 since ab⁻¹ ≠ 1 while a² = b²; HR covers two factors, as stated | holds; HR16 lines 575–577 |
| 5.3 analytic transforms | semicircle v; δ_c; Poisson kernel | K² − 4v = (1/w − vw)², G(K(w)) = w; −G inverts to −1/w − vw; K = 1/w + c | holds |
| 5.6 S-transform (Lean) | constant c; free Poisson λ; order-one coefficient | S = 1/c; 1/(λ+w); −κ₂(ab)/κ₁(ab)³ = −α₂/(α₁³β₁) − β₂/(α₁β₁³), the coefficient of S_aS_b | holds |
| 6.2 Gaussian algebras | F at v = 1; Γ(ℝ²) | F(0) = 1/2, F(1) ≈ 0.804; τ(s₁s₂s₁s₂) = 0 ≠ 1 = τ(s₁²s₂²) | holds |
| 6.6 compound free Poisson | ν = δ₁, δ₀ | R = λ/(1−z), the free Poisson law; R = 0, δ₀ | holds; Spe19 lines 4599–4606, 4636–4640 |
| 6.7 free Lévy–Khintchine (README and Lean) | β; semicircle; Poisson; δ_c; r = 0 | Hankel [[1,0],[0,−1]] not PSD; ρ = σ²δ₀, λδ₁, 0; empty sum 0; N·m_n(μ_N) → κ_n gives ⇒ | holds; ρ-form absent (C03) |
| 7.1 compression (Lean) | n = 0, 1, 2 | κ_∅ = 1 = t⁰·1; φ(a) = φ(a); t⁻¹φ(papbp) − t⁻²φ(pap)φ(pbp) = t(φ(ab) − φ(a)φ(b)) | holds |
| 7.2 matrix units | n = 1; d = 1 | φ(e_1i a e_j1) = δ_ij φ(a)/d, corner mean δ_ij φ(a); p = 1 gives identity | holds |
| 7.5 polar models | circular c in L(F₂) | c*c free Poisson of rate 1, atom max(1−1,0) = 0, ker c = 0; |c| quarter-circular | holds |
| 8.3 genus expansion | G⁴, G⁶; Ginibre | 2 + N⁻²; 5 + 10N⁻²; E tr((ZZ*)²) = 2, E tr(Z²Z*²) = 1 + N⁻² | holds |
| 8.4 GUE (Lean) | GDGD, G²D; D = diag(log N, 0, …); empty word | (tr D)², tr D exactly; (log N)ᵏ/N → 0; N⁻¹ tr 1 = 1 = ψ 1 | holds |
| 8.5 Weingarten (Lean) | k = 0, 1, 2, 3 | 1 − 1 = 0; N·N⁻¹ − 1 = 0; N³Wg((12)) + 1 = −1/(N²−1); N⁵Wg((123)) → 2 | holds; CS04 Cor. 2.7, line 322 |
| 8.6 Haar (Lean) | UAU*B; separate limits | E tr = tr A · tr B; expansion uses A-word and D-word traces only, each bounded by convergence | holds; locator scope (C01) |
| 8.7 expected spectral measures | projections of rank N/2 | ½ + 2·¼ + ½ = 3/2, second moment of arcsine on (0, 2) | holds; Spe19 lines 3330–3340 |
| Earlier R01: ownership against RandomMatrices | RandomMatrices §§6.2–6.5 on main and at the layout pull request's head | cited here as owner; RandomMatrices line 81 says this roadmap extends Layer 6 | repaired |
| Earlier R02: Dykema and free Lévy–Khintchine | `Suggested.lean` lines 80–88, 137–146 | both stated; elaboration warns only `sorry` | repaired |
| Layer 1 Example | Tau Ceti `Independence.lean:265–266` | φ(a²b²) identity is `apply_mul_of_ne` | wording (N02) |

- **Earlier remarks:** R01, R02, C01–C04, N01 and N02 of the previous review are all repaired.
  - §§2.1, 3.6, 4.7, 6.6 and 8.7 now carry locators.
  - §1.2 now assumes only a normal state.
  - Line 1273 now reads "each R-diagonal with α = β".
  - The description's sentence on locators now holds.
  - "OperatorKTheory §7.3 (K7.FreeGroups)" is cited.
  - The former Lean names are gone from the table.
  - The earlier question on separate limits is answered by Speicher, Theorem 7.5.
- **Source locators checked:** 23 locators in 8 sources:
  - Dyk97: Theorem 1.1 and p. 1;
  - HR16: Proposition 2.22 and its proof;
  - Kes59: Theorem 3;
  - KM15: §2.1 and Proposition 4;
  - Spe19: Theorem 7.5, its proof, the example after it, Assignment 8 Exercise 3 and Assignment 9 Exercise 3;
  - Col02: Theorem 3.1, Propositions 3.2–3.3 and Corollary 3.4;
  - CS04: Proposition 2.2, Corollaries 2.4 and 2.7, and Proposition 2.6;
  - Blanchard–Dykema: Theorems 1.3 and 2.2, Construction 3.1 and Lemmas 3.3–3.6.
- **Library declarations opened at the pins:**
  - Tau Ceti, 15: `freeCumulant` (Cumulant/Basic.lean:166), `momentSeries` (Cumulant/Series.lean:85), `IsFreelyIndependent` (Independence.lean:93), `apply_mul_mul_mul_of_ne` (Independence.lean:269), `IsFreelyIndependentElements` (Variables.lean:43), `IsSemicircular` (Semicircular/Basic.lean:70), `law` (Law/Basic.lean:129), `haarProb` (Compact/Haar.lean:93), `orbitCount` (OrbitCount/Basic.lean:100), `norm_freeCumulant_const_le` (Cumulant/Bounds.lean:38), `IsFreelyIndependent.topologicalClosure` (Topology.lean:38), `gnsVector` (CStarAlgebra/GNS.lean:72), `semicircleReal` (LocationScale.lean:39), `marchenkoPastur` (MarchenkoPastur/Basic.lean:62), and `partitionCumulant`.
  - Mathlib: `PowerSeries.substInvOfIsUnit` (Substitution.lean:567) with its left and right inverse lemmas.
  - Neither pin has group von Neumann algebras, C*-conditional expectations or normal states, as the module docstring says.
- **Cross-roadmap citations resolved on main (about 35):**
  - RandomMatrices §§3.1, 3.4, 5.1 and 6.2–6.5, also at the head of the open layout pull request, where the numbering is unchanged;
  - VonNeumannAlgebras Layers 0, 1, 2, 4, 6 and 8 (V8.SubgroupCosets), 10, 11 (Takesaki's theorem specialized to traces, line 4017) and §13.1;
  - NoncommutativeIntegration §4.3;
  - HilbertModules H1–H3;
  - SelfAdjointSpectralTheory Part B (SA-B05, B31, B35);
  - OperatorAlgebraDynamics D1, D2, D2.FreeGroups and D6;
  - OperatorKTheory §§4.3, 7.3 and 7.6;
  - StandardDistributions 5.3;
  - IntegralHeckeAndGaloisDeterminants §0.2;
  - CStarAlgebras Layers 1–5;
  - downstream: FactorRigidity, Subfactors, CategoricalOperatorAlgebras, QuantumGroups and TemperleyLieb. The removed `FreeProbability.NoncrossingPartition` is mapped to Tau Ceti's carrier at line 1522.
- **Automatic checks:** every check passed. The dependency check printed `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gave eight `sorry` warnings and nothing else. A scratch file with `#check @name` for all 12 declarations shows types that match the README. The file has no section variables, and nothing was changed.
- **One-tactic probe:** `rfl`, `simp`, `infer_instance`, `decide` and `intro; simp_all` close none of the eight theorems. The four definitions are needed by the statements, so there is no padding.

Overlap check: read RandomMatrices, AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics, OperatorKTheory and Subfactors.
- RandomMatrices §§6.2–6.5 owns the bounded scalar core: the reduced-word free product with positive state, ⊞ and ⊠ with their analytic transforms, the jump-one free Poisson limit and the Weingarten formula. It is cited here, and both READMEs agree.
- This roadmap owns the F₂ norm obstruction with its shift and radial bounds, and OperatorKTheory (line 57) and OperatorAlgebraDynamics (line 124) agree.
- Subfactors only consumes; AmenableTracesOnCStarAlgebras shares nothing.
- Searches of main and every open head for Weingarten, R-diagonal, boxed convolution, Fock space, reduced and amalgamated free products, the S-transform and free Poisson found no other owner.

Source independence: I compared 17 passages with 8 sources (Dyk97, HR16, Kes59, KM15, Spe19, Col02, CS04 and Blanchard–Dykema) and found no shared wording beyond forced phrases of at most three words. The largest share of locators is Nica–Speicher, 35 of about 80. I compared the layers with its table of contents (Cambridge Core page), and the arrangement is independent:
- Layer 4 has no counterpart.
- Layer 3 joins Lectures 6–7 with Lecture 21.
- Layer 5 (Lectures 12, 14, 16–18) precedes Layer 6 (Lectures 8, 12–13).
- The rest of the order is forced by the `*Needs:*` lines.

Research link: The headlines of Layers 3 and 8 are Dykema's faithfulness theorem (Dykema 1997, Theorem 1.1), asymptotic freeness of Haar unitaries without norm bounds (Collins 2002, Theorem 3.1) and the Weingarten asymptotics (Collins–Śniady 2004, Corollary 2.7). Layers 3–4 build the reduced and amalgamated free products of Blanchard–Dykema (1999) that FactorRigidity and Subfactors consume. This rests on sources read and the README's References.

## Not verifiable

- Nica–Speicher, *Lectures on the Combinatorics of Free Probability* (Cambridge University Press, 2006). The sources service found no legal copy; the publisher's landing page has no licence class. This leaves unverified the sampled locators of §§2.3, 2.4, 5.3, 6.7, 7.2, 7.5 and 8.3, and the Nica–Speicher parts of §8.6.
- Voiculescu–Dykema–Nica, *Free Random Variables* (AMS CRM Monograph Series 1, 1992). There is no legal copy. This leaves §3.2 (§1.4 there) and §6.2 (Theorem 2.6.2) unverified.
- Biane, *Some properties of crossings and partitions* (Discrete Math. 175, 1997). Its DOI resolves only to a paywalled page; §2.2 has no locator in any case (C04).

Automatic checks set aside as false positives: the overlap report lists FreeProbability §F3 and §F4, cited by FactorRigidity, as dropped. The guide to the build (line 57) maps every former section Fk to Layer k in one sentence written with a variable k, which the scanner does not read.

## Source issues

- **Misprint** in Col02 at Proposition 3.2, p. 19: the source defines the set T_j by a condition on indices equal to k, the number of unitaries; it should be the index j of the set itself; affects nothing.
- **Misprint** in Col02 at the proof of Proposition 3.3, p. 20: the source counts the points moved by a permutation called φ, which is not defined there; it should be the product of α with the ξ_i; affects nothing.
- **Misprint** in CS04 at the discussion after Corollary 2.4, p. 5: the source says the earlier result and the simplified Weingarten formula (13) hold when n ≥ d; it should be d ≥ n, when every partition of n has at most d rows; affects nothing.
- **Misprint** in HR16 at the proof of Proposition 2.22, p. 15: the source centres each approximant by subtracting the expectation onto L(G_j) and says it vanishes on the letter; it should be the expectation onto L(H), since the letters lie in L(G_j) ⊖ L(H); affects nothing.

## For the human reviewers

- Not tested: Nica–Speicher, the source cited most (35 of about 80 locators), could not be read legally. The wording comparison was not made against it, and the arrangement was compared using its public table of contents only.
- Licence: Scope and ownership (README lines 1640–1646) links an external Lean project (SemicircleLaw on GitHub) and a Zulip thread as related formalizations. I did not compare `Suggested.lean` with that repository or read its licence.

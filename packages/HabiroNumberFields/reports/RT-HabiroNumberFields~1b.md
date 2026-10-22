<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/155#issuecomment-6335931176 -->
Red team round 1 pass b (claude) of c15e8c6

Verdict: needs_changes

1. **F01** (P2) The KMS identity is narrowed to odd orders although it holds at every positive order

   **Location:** `packages/HabiroNumberFields/README.md:215`: “For a field B, odd n≥3 invertible in B, a primitive ζ, and x,y,z∈Bˣ”; `packages/HabiroNumberFields/Suggested.lean:81`–`82`: `theorem kms_odd … (hn : 3 ≤ n) (hodd : Odd n)`; `packages/HabiroNumberFields/README.md:240` tests only (n,ℓ)=(3,19),(5,31),(7,43),(9,73).

   **Claim:** The cleared identity `f^n D(1/x) D(ζy) D(ζ/z) = (ζy)^(n(n−1)/2) D(1) D(ζy/x) D(x/(yz))` is stated, named and tested only for odd n ≥ 3. The source states it for a primitive m-th root of unity of any order, and the statement as typed in Suggested.lean (with `hodd` deleted and `hn : 0 < n`) is true at even orders too: n = 2 gives the rational identity `(1+x+(1+y)z)²(1−y)(z−1) = −2(x−y)(yz+x)(1+x)` on the hypersurface, and n = 4, 6 pass exhaustive finite-field tests. A roadmap statement must not be narrower than its source; the odd case is where the phase formula for D(1)² is used, not where the identity lives.

   **Witness:** GZ line 852–855 (Proposition 8.1: “ζ a primitive mth root of unity”, no parity). Exhaustive tests of the Lean statement with `hodd` removed, over 𝔽_ℓ with ζ of exact order n and every triple satisfying the stated hypotheses: n=2 over 𝔽₁₁, 𝔽₁₃, 𝔽₁₇ (240 admissible triples), n=4 over 𝔽₁₇, 𝔽₂₉, 𝔽₃₇ (896), n=6 over 𝔽₃₇ (864): no failure (odd controls n=3,5,7 over 𝔽₁₃, 𝔽₁₉, 𝔽₃₁, 𝔽₂₉: 1,888 triples, no failure). The order-two instance below elaborates against the pinned Mathlib in a probe copy.

   **Exact repair text:** In Suggested.lean replace lines 80–90 by

   ```lean
   /-- The Kashaev–Mangazeev–Stroganov identity at every positive order, with every
   denominator cleared. -/
   theorem kms (n : ℕ) (ζ x y z : K)
       (hn : 0 < n) (hnK : (n : K) ≠ 0)
       (hζ : IsPrimitiveRoot ζ n) (hx : x ≠ 0) (hy : y ≠ 0) (hz : z ≠ 0)
       (hX : x ^ n ≠ 1) (hY : y ^ n ≠ 1) (hXY : x ^ n ≠ y ^ n)
       (hrel : (1 - y ^ n) * z ^ n = 1 - x ^ n) :
       cyclicHypergeom n ζ x y z ^ n *
           cyclicDilog n ζ x⁻¹ * cyclicDilog n ζ (ζ * y) * cyclicDilog n ζ (ζ / z) =
         (ζ * y) ^ (n * (n - 1) / 2) * cyclicDilog n ζ 1 *
           cyclicDilog n ζ (ζ * y / x) * cyclicDilog n ζ (x / (y * z)) := by
     sorry

   /-- The identity at the even order two, where the sum has two terms and every D is linear. -/
   example (x y z : ℚ) (hx : x ≠ 0) (hy : y ≠ 0) (hz : z ≠ 0) (hX : x ^ 2 ≠ 1)
       (hrel : (1 - y ^ 2) * z ^ 2 = 1 - x ^ 2) :
       cyclicHypergeom 2 (-1 : ℚ) x y z ^ 2 * cyclicDilog 2 (-1) x⁻¹ * cyclicDilog 2 (-1) ((-1) * y) *
           cyclicDilog 2 (-1) ((-1) / z) =
         ((-1) * y) ^ (2 * (2 - 1) / 2) * cyclicDilog 2 (-1) 1 * cyclicDilog 2 (-1) ((-1) * y / x) *
           cyclicDilog 2 (-1) (x / (y * z)) := by
     have h1 : (1 : ℚ) + x ≠ 0 := by
       intro h
       apply hX
       have : x = -1 := by linarith
       rw [this]; norm_num
     have key : (1 + x + (1 + y) * z) ^ 2 * (1 - y) * (z - 1) =
         -2 * (x - y) * (y * z + x) * (1 + x) := by
       linear_combination ((1 + y) * z + 1 + 2 * x - y) * hrel
     simp only [cyclicHypergeom, cyclicDilog, Finset.sum_range_succ, Finset.prod_range_succ,
       Finset.sum_range_zero, Finset.prod_range_zero]
     norm_num
     field_simp
     linear_combination (x + 1) * key
   ```

   In README §1.3 replace “For a field B, odd n≥3 invertible in B” by “For a field B, n≥1 invertible in B”, rename `kms_odd` to `kms` (also in §Scope line 7 “the odd-order KMS identity” → “the KMS identity”), replace “The n=1 boundary reduces to 1=1 but is separate from the odd n≥3 headline; no assertion is made at noninvertible n.” by “The n=1 boundary is the identity 1=1; no assertion is made at noninvertible n.”, and extend the Check at line 240 to “(n,ℓ)=(2,11), (3,19), (4,17), (5,31), (6,37), (7,43), (9,73)”, adding “The order-two instance over ℚ is proved in Suggested.lean.” Keep “For n odd and invertible” only in §1.1 for the phase formula of D(1)².

2. **F02** (P2) QSeriesPartitionsAndMockModularForms is cited for a Pochhammer asymptotic it does not state

   **Location:** `packages/HabiroNumberFields/README.md:53`: “require normal convergence of the bilateral ₁ψ₁ sum on its annulus, root-of-unity Pochhammer asymptotics with uniform tails, and the eta multiplier”; consumed at `README.md:222` (“Needs: … QM.0–QM.1”) and `README.md:228`.

   **Claim:** The product side of the §1.3 proof route needs the radial asymptotic of `(x; ζe^(−ε/n))_∞^(−n)` at a root of unity (GZ (57)). The roadmap that exists for this supplier contains no such target: its asymptotics are the Maass Fourier kernels of its Layer 8, its only Pochhammer limits are locally uniform finite-prefix limits for |q|<1, and it has no statement at a root of unity. The ₁ψ₁ convergence and the eta multiplier are there; the asymptotic is unowned. This is distinct from pass a F02 (absence of the supplier from the trees): the supplier exists at an open head and does not make the statement.

   **Witness:** The QSeriesPartitionsAndMockModularForms roadmap at its open pull-request head 8fe91e0, `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md`: “asymptotic” occurs only at lines 254, 1002, 1004, 1041 (hypergeometric convergence domains and `maassFourierKernel_asymptotic`); line 196 (`qPochhammerFin_tendsto`, |q|<1 only); line 683 (`etaMultiplier`), lines 236–266 and 286–303 (bilateral series, `psi_summable_iff`, `ramanujanOnePsiOne_hasSum`). GZ line 865–869 ((57) and Lemma 2.1) is the statement needed.

   **Exact repair text:** At line 53 delete “root-of-unity Pochhammer asymptotics with uniform tails,” and in §1.3, after the sentence ending “uniform tails or fix their sign, scaling and phase issues.”, add: “Prove `pochhammer_rootOfUnity_asymptotic`: for a primitive n-th root ζ, x∈ℂ with x^n∉[1,∞) and q=ζ exp(−ε/n), `(x;q)_∞^(−n) = D_ζ(x) (1−x^n)^(n/2) exp(Li₂(x^n)/ε)(1+o(1))` as ε↓0, uniformly for x in compact subsets of the stated domain, with the branch of the half power fixed by continuity from x=0 (GZ Lemma 2.1 and (57), p. 235). This is the leading term of the supplier's all-orders expansion; only this term is used.” Add `pochhammer_rootOfUnity_asymptotic` to the Needs line of `kms_product_limit`.

3. **F03** (P3) Supplier citations use stage ids that are not the suppliers' section numbers

   **Location:** `packages/HabiroNumberFields/README.md:41` “K3BlochGroups V.2–V.6”; `:46` “ArithmeticKTheory N.3–N.6”, “MotivicEtaleKTheory M.1, M.3, M.7 and the early finite-Chern prefix of M.8”, “KTheoryFiniteLocalFields L.2 and L.7”; `:48` “PadicHodgeRegulators D.1, D.3 and D.4”; `:50` “HabiroCyclotomicCompletions HC.1 and HC.3–HC.5”; `:53` “QSeriesPartitionsAndMockModularForms QM.0–QM.1”, “PolylogarithmFunctions PF.1 and PF.3”; `:42` “StableHomotopyKTheory H.6”, “GeneralAlgebraicKTheory K.2, K.3, K.7”; the same ids throughout the Needs lines.

   **Claim:** The ids `V.n`, `N.n`, `D.n`, `K.n`, `QM.n` (and the unreachable `HC.n`, `PF.n`, `H.n`, `L.n`, `M.n`) are planning-stage labels. The suppliers' READMEs number their material “Layer k” and “§k.n”; the cited strings occur nowhere in them, so a reader cannot find the consumed section. The consumed content does exist under other numbers where the supplier is reachable, so this is a locator defect, not drift of content.

   **Witness:** Occurrences of the cited id pattern in the supplier README: `N.<n>` 0 in ArithmeticKTheory (board package head a6cca4e), `D.<n>` 0 in PadicHodgeRegulators (7a3e546), `K.<n>` 0 in GeneralAlgebraicKTheory (open roadmap head 5705674), `QM.<n>` 0 in QSeriesPartitionsAndMockModularForms (8fe91e0); K3BlochGroups (8ef92f5) has only Weibel locators `VI.4.3.2` and `V.11.3.2`. Actual locations: K3BlochGroups Layers 2–6, the diagram `B → B_new → B_old` with its kernel/cokernel in §3.16 and the `B_new(F₁₁)≅ℤ/3`, `B_old(F₁₁)≅ℤ/6` Check in §3.15; ArithmeticKTheory Layers 3–6, Keune's injection `cyclotomicPicardInjection` in §6.13 (its twisted coinvariants `(Pic(O_L[1/p])/pⁿ ⊗ μ_(pⁿ))_G` are the README's quotient); PadicHodgeRegulators Layer 3 “local logarithms and dilogarithms” (§3.6 norms to traces) and Layer 5 “the unramified local K₃ isomorphism”; GeneralAlgebraicKTheory Layer 7 “Products and transfers”, §7.7 `transfer_projectionFormula`; QSeriesPartitionsAndMockModularForms §2.3, §2.5, §5.2.

   **Exact repair text:** Replace each id by the supplier's own numbering at its current head: “K3BlochGroups Layers 2–6 (§3.16 for the convention maps)”, “ArithmeticKTheory Layers 3–6 (§6.13 `cyclotomicPicardInjection` for the Keune injection)”, “PadicHodgeRegulators Layers 3 and 5 (§3.6 for norm–trace compatibility)”, “GeneralAlgebraicKTheory Layer 7 (§7.7 for transfer and the projection formula) and the functoriality sections of Layers 2–3”, “QSeriesPartitionsAndMockModularForms §2.3, §2.5 and §5.2”; for HabiroCyclotomicCompletions, PolylogarithmFunctions, StableHomotopyKTheory, KTheoryFiniteLocalFields and MotivicEtaleKTheory cite the section titles of the consumed material (“the cyclotomic completion and its Taylor maps”, “the principal dilogarithm and its five-term identity”, …) until a head with section numbers exists, and apply the same replacement in every `Needs:` line and in §Scope lines 9–11.

4. **F04** (P3) “current” and “pinned” library qualifiers are process narrative

   **Location:** `packages/HabiroNumberFields/README.md:11`: “is current Tau Ceti's `ContinuousCohomology.map_eq_id_of_inner`”; `:13` (three times: “already available in current Tau Ceti”, “Current Tau Ceti also supplies the Kummer isomorphism”, “Current Tau Ceti's `TauCeti.frobeniusAlgEquiv`”); `:39`: “The pinned `TauCeti.kummerClassMap` … Current `TauCeti.kummerIso`”; `:53`: “From **current Tau Ceti's inner-conjugation theorem**”; `:95`: “Needs: the current inner-conjugation theorem”; `:558`: “current Tau Ceti's local Frobenius”.

   **Claim:** The README distinguishes a “pinned” from a “current” Tau Ceti to record which declarations post-date the pin it was written against. That is a statement about the moment of writing: a reader a year from now cannot tell which library version is meant, and the roadmap repository's rules exclude “current” from timeless prose.

   **Witness:** Eight occurrences at the lines above; the rules list “current” among the process words.

   **Exact repair text:** Delete “current”, “Current” and “The pinned” at the eight places, writing “Tau Ceti's `ContinuousCohomology.map_eq_id_of_inner`, in `RepresentationTheory.Homological.ContCohomology.InnerConjugation`”, “Tau Ceti supplies the Kummer isomorphism in `TauCeti.FieldTheory.GaloisCohomology.Kummer`”, “`TauCeti.frobeniusAlgEquiv`, in `TauCeti.NumberTheory.LocalField.ResidueCorrespondence`, is the Frobenius automorphism”, “`TauCeti.kummerClassMap` and `TauCeti.kummerClassMap_injective` give the positive Kummer map and injectivity when n is invertible; `TauCeti.kummerIso`, `TauCeti.kummerMap_surjective` and `TauCeti.kummerIsoTransport` additionally give surjectivity and transport”, “From **Tau Ceti's inner-conjugation theorem**”, “Needs: the inner-conjugation theorem”, “Tau Ceti's local Frobenius”.

5. **F05** (P3) `halfShiftLinearCoeff` is stated over a characteristic-zero field in the README but over every field in Lean

   **Location:** `packages/HabiroNumberFields/Suggested.lean:100`: `variable {K : Type*} [Field K] [CharZero K]`; `packages/HabiroNumberFields/README.md:632`: “For a characteristic-zero field define the light rational function”.

   **Claim:** A `def` keeps only the section variables its body or type uses, so `[CharZero K]` is dropped from the elaborated signature and the definition exists over every field, including characteristic 2 and 3 where `24 = 0` and the value is the junk `0`. README and Lean must agree on generality; the `[CharZero K]` binder is dead.

   **Witness:** In a probe copy, `#check @halfShiftLinearCoeff` prints `{K : Type u_3} → [Field K] → K → K → K`.

   **Exact repair text:** In Suggested.lean line 100 write `variable {K : Type*} [Field K]`. In README §3.5 replace “For a characteristic-zero field define the light rational function `halfShiftLinearCoeff z r = −z/(24r(1−z))`, used only with r≠0 and z≠1.” by “For a field define the light rational function `halfShiftLinearCoeff z r = −z/(24r(1−z))`; it is used only when 24, r and 1−z are nonzero, and its value is the junk 0 in characteristic 2 or 3.”

## Verified sound

- Read all 844 README lines (54 numbered subsections in Layers 0–3, the supplier contracts, downstream consumers and references) and all 138 lines of Suggested.lean: 13 declarations (3 definitions, 4 `sorry`'d theorems, 6 proved examples).
- Elaboration of Suggested.lean as submitted in a probe copy: exit 0, exactly four `declaration uses 'sorry'` warnings (lines 44, 51, 72, 81), nothing else. `#check` of the four sorried signatures matches the README hypotheses (`cyclicHypergeom_shift` and `kms_odd` carry every nonvanishing and hypersurface hypothesis explicitly).
- Trivial-proof probe of the four sorried theorems (`simp [cyclicDilog, …]`, `simp [cyclicHypergeom, …]`, `exact?`): none closes; they are genuine targets. `cyclicDilog_quasiPeriodicity` and `cyclicDilog_one_pow_twentyFour` were checked by hand (reindexing k ↦ k+s against `∏_(k<n)(1−ζ^k x)=1−x^n`; `D(1)² = (−1)^(n(n−1)/2) ζ^(−n(n²−1)/6) n^n`, which agrees with CGZ-v3 (23) modulo n and gives `D(1)^24 = n^(12n)` for every n ≥ 1). `cyclicHypergeom_shift` and `kms_odd` as typed were tested exhaustively over 𝔽_ℓ: shift identity 15,402 admissible triples at n = 2,…,10, KMS 1,888 odd-order triples, all passing (the even-order results are F01).
- Checks recomputed (about 45): §0.2 M, M′ for ℚ and ℚ(i); §0.5 finite-endomorphism criterion (Fitting decomposition; `A = f(A)+nA` forces the nilpotent part to vanish) and the ℚ/ℤ control; §0.8 multiplicities r₂(F), r₁+r₂−1 and the p=3 torsion term; §1.1 D(1)² phase, cube class ζ at n=3, ninth-power class ζ³, D(1)^72=3^108; §1.2 n=2 value, 23/3, cubic geometric sum; §1.3 center annulus 1/10<4/5<1, S=4/9, the five-term dilogarithm combination 0.110452 = ½(log 8/5)², the (9/10,2) negative control; §1.4 P(1), P(0), P(∞) against CGZ-v3 line 434 and 514; §1.5 root law R_(ζ^k)=R_ζ^(k⁻¹); §1.6 32∧(1−32)=5(2∧−31), tame symbol at 31, valuations 1,2,3,4; §1.7 eta at n=3 ([∞]+2[0]=[0] by CGZ-v3 line 395) and n=5 ([∞]+2[0]+2[−φ]); §1.8 ∂α₂=3[t], ∂α₃=0; §1.9 the SL₂ diagonalisation with d=ζ−ζ⁻¹; §1.10 cubes {1,6} in 𝔽₇; §1.11 gcd(n,ℓ−1)=1; §1.12 v₃(6)=1, v₃(18)=2; §1.15 K₃(ℚ)=ℤ/48; §2.1 ζ₆=exp(5πi/3), ω₆−ω₃=1, CRT exponent 6 at (2,5), valuations 1, 1/2, 1/6; §2.2 idempotent (1−i⊗ζ₄)/2, Frobenius i↦−i at 3 and i↦i at 5, x³−2≡(x−3)(x²+3x+4) mod 5, 2³−2∈3ℤ₃, φ_R⊗id(e)=1−e; §2.4 constant family i at p=3; Kontsevich–Zagier jets 1,−1,2,−5,15,−53,217 and 3,11,72 recomputed exactly, constants 5−ζ₃ and 8−3ζ₄; §2.6 Φ₃(ζ₃+x)=(2ζ₃+1)x+x², (2ζ₃+1)²=−3, Φ₃≡(q−1)² mod 3; §2.8 N=4 jet list; §2.10 components of 5, 35, 10, 18; §2.11 exponent 3 at m=2 and the inverse forced by GSWZ (13) against the footnote on p. 6; §3.1 polar coefficient ζ_m(φ_R D_p−p²D_p)/(pm²) and the 8/5 defect of 1+x/5; §3.2 (1+x)^(1/p) quotient 1; §3.3 residue of the Pochhammer defect (confirms pass a F09: −p Li₂^(p)); §3.4 pole cancellation of U_(ζ,m) via the Bernoulli expansion (k=0 term Li₂(ζ)/(m²h), k=1 term zero); §3.5 the four rational values and B₂(1/2)=−1/12; §3.7 2−2⁻¹=3/2; §3.8 (1−q²)²(1−q⁻¹); §3.12 inversion jets and the τ of the KZ family; §3.18 split-quadratic norm. All correct.
- Locators verified against the cached legal copies (more than 50 locators in 9 texts, with printed page numbers where the README cites pages): CGZ-pub Remark 1.4 (line 115–117, p. 385: 6Δ_F|K₂| and 2Δ_F|K₂| when 9∤n) and Theorems 1.5–1.6 (lines 157, 170, p. 386); CGZ-v3 Theorem 1.7 (218, p. 5), Lemma 2.3 (418, p. 9), Lemma 2.4 and (23) (435, 475, p. 10), Proposition 2.5 (521, p. 11), Lemmas 2.7–2.8 (640, 673, p. 14), Lemma 2.10 and Theorem 2.11 (686, 699, p. 15), Proposition 2.12 (747, p. 16), Lemma 3.1 and Theorem 3.2 (830, 856, p. 18), Lemmas 3.3–3.4 (866, 882, p. 19), Lemma 3.5 (901, p. 20), Lemma 4.1 (964, p. 21), Proposition 4.2 (1004, p. 22), Remark 4.3 (1042, p. 23), Lemma 4.4 (1128, p. 24), Lemma 5.1 and (34) (1197, 1220, p. 26), Theorem 5.2 (1228, p. 26), Lemmas 5.3–5.4 (1236, 1260, p. 27), Theorem 7.4 (1742, p. 37); GZ Proposition 8.1, (55)–(60) (852–953, pp. 235–237), with f and the cleared form matching `kms_odd` and `cyclicHypergeom` exactly; GSWZ Definition 1.1 and (13) (260, 273, pp. 6–7), Remark 1.2 (311, p. 7), (16) (349, p. 8), (21)–(22) and Theorem 1 (391–400, p. 9), Theorem 2 (443, p. 10), Proposition 1.5 (465, p. 11), (46)–(50) (796–816, p. 18), Lemma 2.1, Proposition 2.2, (56), (60) (826–884, p. 19), Lemma 3.4 (2034, printed p. 39), Corollary 3.5 (2080, p. 40), Lemma 3.6, Corollary 3.7, (195)–(204) (2102–2149, p. 41), Definition 3.9, (205)–(208), Theorem 10 (2168–2182, p. 42), Corollary 3.10 and the proof of Theorem 2 (2208, 2213, p. 43), proof of Proposition 1.5 (2285, p. 45), (298)–(300) (2971–2994, pp. 59–60), §5.2 and (324)–(330) (3292–3337, pp. 64–65), Proposition 5.3 (3345, p. 65), Example 5.6 (3372, p. 65); the “73-page version” wording is right: the arXiv v2 file has 90 physical pages with unnumbered figure pages and printed numbering 1–73; H2024 Lemma 2.1, Corollary 2.2 (57, 80, p. 2), Proposition 2.4 (121, p. 3), Theorem 2.8 (152, p. 4), Theorem 2.12, Corollary 2.13 (187, 194, p. 5), Theorem 3.1 and Lemma 4.1 (271, 296, p. 6), Proposition 4.6 (353, p. 7); H2013 §6.2 (1506, p. 31), §§6.3–6.4 (1530, 1554, p. 32); BG §7 (1242, p. 24); W-thesis 2.7 (1313, printed p. 29), 2.11 and Lemma 2.12 (1400, 1413, printed p. 31); Q 2.7 (647, p. 15), Lemma 2.12 (750, p. 18). CGZ-v3 line 434 and 514 give P(1)=1, P(0)=D(1)⁻¹, P(∞)=D(1) as in §1.4; CGZ-v3 line 437–438 gives the odd/even D(1) classes as in §1.1 and §1.4.
- Supplier citations checked by content where a head is reachable: K3BlochGroups (board package 8ef92f5) §3.16 states `B → B_new → B_old` with kernel `B∩H` killed by 2 and cokernel killed by 2, and §3.15 the `B_new(F₁₁)≅ℤ/3`, `B_old(F₁₁)≅ℤ/6` boundary values of README line 44; ArithmeticKTheory (a6cca4e) §6.13 constructs the Keune injection with the twisted coinvariants the README demands; PadicHodgeRegulators (7a3e546) owns the finite-residue dilogarithm argument for the local K₃ theorem (Layer 5) and `D_p(z)=Li₂(z)+½log(z)log(1−z)` with log of a root of unity zero (its Conventions); GeneralAlgebraicKTheory (5705674) §7.7 has transfer and the projection formula; QSeriesPartitionsAndMockModularForms (8fe91e0) has the ₁ψ₁ domain and Ramanujan summation (§2.3, §2.5) and the eta multiplier (§5.2). Chebotarev Layer 10 exists on `main` (`TauCetiRoadmap/Chebotarev/README.md:410`). The K3BlochGroups package names this roadmap's Layer 1 nowhere in its own supplier contracts that I read; the reciprocal edge is pass a F03.
- Policy: title lower-case with “Habiro” capitalised; no `set_option`, no `lemma` declaration, no pull-request or issue numbers, single `import Mathlib` and no `TauCeti.*` import (none used); two proved examples per definition; no `def := sorry`; the package diff touches only its folder. `kms_odd`, `cyclicHypergeom_shift`, `cyclicDilog`, `cyclicHypergeom`, `halfShiftLinearCoeff` appear in the README (the two missing names are pass a F05).
- Dependency check, run on the clone:

```text
NOT IN ORDER: HabiroNumberFields (insert it after its last supplier)
depcheck: 9 roadmaps, 70 edges, 1 problem(s)
```

  No UPWARD or CYCLE line; `grep -nx HabiroNumberFields merge-order/ORDER.txt` finds nothing (an imported package, not a defect). Of the cited suppliers, StableHomotopyKTheory, GeneralAlgebraicKTheory, PolylogarithmFunctions, KTheoryFiniteLocalFields and HabiroCyclotomicCompletions are in `merge-order/ORDER.txt` (lines 3, 4, 34, 62, 63); Chebotarev is on `main`; the other five are pass a F02.
- Not re-raised (pass a, same head): F01 nonlinear global definition, F02 unavailable suppliers, F03 K3BlochGroups cycle, F04 missing Layer 0 milestone, F05 two unlisted Lean names, F06 trailing catalogue comment, F07 missing `sources.toml` (confirmed: the folder has README.md, Suggested.lean, metadata.toml, review.json only), F08 missing Lean mirrors, F09 Pochhammer residue sign (independently confirmed by the coefficient-of-t computation), F10 too few Checks, F11 étale Bloch locator, F12 eta calibration domain.

## Not verifiable

- `sources.toml` is absent (pass a F07), so the sha256 keys could not be read from the package; the nine cited texts were identified in the cache by their recorded URLs (arXiv 1712.04887v3, 1107.0264v2, 2104.14413v4, 2412.04241v2, 2510.04782v2, the author-hosted CGZ, Belabas–Gangl, Garoufalidis–Zagier and Wagner-thesis files).
- HabiroCyclotomicCompletions HC.1/HC.3–HC.5, PolylogarithmFunctions PF.1/PF.3, StableHomotopyKTheory H.6, KTheoryFiniteLocalFields L.2/L.7 and MotivicEtaleKTheory M.1/M.3/M.7/M.8: no README reachable on `main`, on the board, or in an open roadmap pull request, so their section contents could not be compared.
- The analytic targets of §1.3 (`kms_gaussian_limit`, `kms_product_limit`, `kms_phase_match`), the all-order extension of §3.7, effective descent of §3.10 and the transfer theorems of §3.19 were read for consistency only; no independent proof was attempted. The Gaussian scaling `√(2π/n)√S` of §1.3 is consistent with summing the residue classes of GZ line 905–925, which prints no 1/√m; the README flags this.
- The K3BlochGroups boundary values `B_new(F₁₁)≅ℤ/3`, `B_old(F₁₁)≅ℤ/6` were checked against that package's own Check, not recomputed.

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/170#issuecomment-6335732998 -->
Red team round 1 pass b (claude) of c17d319

Verdict: needs_changes

1. **F01** (P2) Cubical differential has the opposite sign from the supplier's higher Chow complex

   **Location:** `packages/Polylogarithms/README.md:766`: “compatibility with the normalized cubical differential `δ=∑_{i=1}^m(-1)^i(δ₀ⁱ-δ_∞ⁱ)` … The cycle carrier, normalization and comparison to the unnormalized higher Chow complex are supplied by M.4.” Also `README.md:750` (the `d_D[W_m]` face identity with `j=0` the zero face, `j=1` the infinity face) and `README.md:815` (mixed signs).

   **Claim:** `cubicalRegulator_chainMap` (§5.8), the normalized-current boundary identities of §5.7 and the mixed form signs of §5.10 are all stated for the Burgos–Feliu–Takeda differential `Σ(−1)^i(∂⁰ᵢ − ∂^∞ᵢ)`, while the cycle complex the roadmap says it consumes from MotivicEtaleKTheory carries the opposite differential `Σ(−1)^i(∂^∞ᵢ − ∂⁰ᵢ)`. With the supplied complex, `P_c` is a chain map only after the sign transport `J_q = (−1)^q` on cube degree `q` that the supplier itself prescribes; the README neither names this transport nor states which of the two differentials its chain-map targets use. Defect class 7 (convention mismatch between roadmaps); a chain-map target that is false for the supplied complex as written.

   **Witness:** MotivicEtaleKTheory package README at the explorer head (explorer main `70ebc90e8e1f499419105a028d96bc160a868161`, README blob `9c67f153d0d50088ebbab3f2fa123c706a8d9ed3`), line 357: the cubical quotient uses `d=Σ_{i=1}^n(−1)^i(∂_i∞−∂_i0)`; line 1246: the standing boundary is `∂_M=Σ_i(−1)^i(∂_i^∞−∂_i^0)`, “opposite to the source's ∂_BF”, with `cubicalOrientationChange J_q=(−1)^q` applied on cycles and both total complexes. Compare `README.md:766` and `README.md:750`.

   **Exact repair text:** Add to the Conventions after the shift paragraph: “The cubical cycle complex consumed from MotivicEtaleKTheory has differential `∂_M = Σ_{i=1}^m (−1)^i (∂ᵢ^∞ − ∂ᵢ^0)`. The chain identities of §§5.7–5.10 are stated for the Burgos–Feliu–Takeda differential `δ = −∂_M`. Define `cubicalOrientationChange J_q = (−1)^q` on cube degree `q`; then `δ ∘ J_q = J_{q−1} ∘ ∂_M`, and every chain-map target of §§5.8–5.10 is stated on the supplied complex after composing with `J_q`.” In §5.8 replace “compatibility with the normalized cubical differential `δ=…`” by “compatibility with `δ = −∂_M` after `cubicalOrientationChange`, so that `P_c ∘ J_q` is a chain map on the supplied normalized complex”, and add the Check: “On a cubical one-chain the supplied boundary is `∂₁^∞ − ∂₁^0`, the negative of the `−δ₀+δ_∞` convention used for `d_D[-log|t|]`; `J_1 = −1` reconciles them, and omitting it reverses the sign of every odd-degree regulator.”

2. **F02** (P3) A consumed PolylogarithmFunctions declaration does not exist at that roadmap's head

   **Location:** `packages/Polylogarithms/README.md:67`: “`PolylogarithmFunctions.singleValued_inversion` (`Lₙ(z)+(-1)^nLₙ(1/z)=0` for `z≠0`)”; also `README.md:79` and `Suggested.lean:25–46` (the restated `polylog`, `singleValued`, `blochWigner`).

   **Claim:** The supplier's inversion lemma is named `singleValued_inv`; no `singleValued_inversion` exists in its README or Suggested.lean. The other four consumed names (`singleValued_differential`, `singleValued_two`, `blochWigner_differential`, `blochWigner_fiveTerm`) exist with the hypotheses the README states. In addition the supplier's `polylog` is `ℤ → ℂ → ℂ` and its `singleValued`/`blochWigner` carry explicit `z = 0`, `z = 1` branches, whereas the restatements here are `ℕ`-indexed and branch-free; the values agree (checked: `Lₙ(0)=0`, `Lₙ(1)=ζ(n)` or `0`, `D(0)=D(1)=0` follow from the integral formula and `Real.log 0 = 0`), but the README's “which agree with these formulas” should say on which index set.

   **Witness:** TauCetiRoadmap pull request 1320 head `6e452e5b0066b40aa0002f81b226fca2d5b6a964`, `TauCetiRoadmap/PolylogarithmFunctions/Suggested.lean:426` (`theorem singleValued_inv (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : z ≠ 0) : singleValued n z + (-1 : ℝ) ^ n * singleValued n z⁻¹ = 0`), `:46` (`def polylog : ℤ → ℂ → ℂ`), `:355–361`, `:477–478`.

   **Exact repair text:** In `README.md:67` replace “`PolylogarithmFunctions.singleValued_inversion`” by “`PolylogarithmFunctions.singleValued_inv`”. In `README.md:79` replace “which agree with these formulas” by “which agree with these formulas for natural-number indices `n ≥ 2`, including the endpoint branches `z = 0, 1` that the supplier states separately”.

3. **F03** (P3) Supplier sections are cited by design labels that do not exist at the suppliers' current heads

   **Location:** `packages/Polylogarithms/README.md:12`: “**K3BlochGroups**, Layers V.3–V.4, owns the pre-Bloch group”; `README.md:14`: “**BorelRegulators**, Layers R.3–R.5”; `README.md:17`: “**MotivicEtaleKTheory**, Layers M.4 and M.6 and the universal-regulator part of M.8”; `README.md:99`: “The specific M.8 targets `motivic-chern-character` and `deligne-regulator` … their prerequisite chains use HodgeStructures Layer 2 and MotivesAndAlgebraicCycles MC.2”; `README.md:635` (“MC.4, `equidimensional-cycles-transfers`”); `README.md:647` (“M.5a request”).

   **Claim:** The K3BlochGroups package on the board, and the BorelRegulators, MotivicEtaleKTheory and MotivesAndAlgebraicCycles packages in the explorer, are organised as `## Layer n` with no `V.n`, `R.n`, `M.n` or `MC.n` labels; MotivicEtaleKTheory's layering differs from the design (cubical/simplicial complexes are Layer 4, the rational Chern character is §9.1, the Deligne regulator roof is §12.2, and there are no targets named `motivic-chern-character`, `deligne-regulator` or `M.5a`); MotivesAndAlgebraicCycles has no target `equidimensional-cycles-transfers`; Completed HodgeStructures has no `Layer 2` heading (it uses `L0`-style labels). The statement at `README.md:99` that the supplier's prerequisite chain “use[s] HodgeStructures Layer 2” is contradicted by the supplier, which declares its logarithmic Deligne–Beilinson complex a supplier gap and says HodgeStructures supplies linear structures only. Defect class 6 (supplier drift).

   **Witness:** Board pull request 162 head `8ef92f515095aca69c61ab2ac26d5f39da02c341`, `packages/K3BlochGroups/README.md:405` (“## Layer 3: Bloch presentations with integral conventions”), `:860` (“## Layer 4: Configuration homology and the Suslin sequence”), `:1676` (“## Layer 6: Certificates and coefficient comparisons”); explorer BorelRegulators README (blob `7c5f47f207271b6cd54695b08b378bd18120943d`) lines 308, 566, 912, 1180; explorer MotivicEtaleKTheory README (blob `9c67f153d0d50088ebbab3f2fa123c706a8d9ed3`) lines 61, 340, 901, 1234; explorer MotivesAndAlgebraicCycles README (blob `75b554275bebd4a3ab8bccf5335431ac99d2e0c2`) layers 0–7.

   **Exact repair text:** Replace “Layers V.3–V.4” by “Layers 3–4”, “V.6” by “Layer 6”, “K3BlochGroups V.3 supplies” by “K3BlochGroups Layer 3 supplies”, “V.4 supplies” by “Layer 4 supplies”; “Layers R.3–R.5” by “Layers 3–5”; “Layers M.4 and M.6 and the universal-regulator part of M.8” by “Layer 4, §9.1 and §12.2”; at `README.md:99` replace “The specific M.8 targets `motivic-chern-character` and `deligne-regulator` supply the universal real Deligne complex and Chern regulator, unit logarithm and cup product before the explicit formulas of this roadmap are used; their prerequisite chains use HodgeStructures Layer 2 and MotivesAndAlgebraicCycles MC.2, rather than this roadmap's explicit comparison.” by “Its §12.2 (`cubicalDeligneRegulator`, `beilinsonRegulatorComparison`) supplies the universal real Deligne regulator, unit logarithm and cup product before the explicit formulas of this roadmap are used; that roadmap declares its logarithmic Deligne–Beilinson complex as a supplier gap, and this roadmap's explicit comparison is not an input to it.”; at `README.md:635` replace “MC.4, `equidimensional-cycles-transfers`” by “Layer 4 (transfer foundations)”; at `README.md:647` delete “for the existing MotivicEtaleKTheory M.5a request”. Where a cited explorer package is not yet on the board, cite the design label and the package heading together until the package lands.

4. **F04** (P3) Three admitted theorems close in one tactic or three lines from the pinned Mathlib

   **Location:** `packages/Polylogarithms/Suggested.lean:308–312` (`normalizedPeriod_empty`), `:286–293` (`cycleLift_iff`), `:298–305` (`cycleLift_of_injective`).

   **Claim:** Stated as targets but immediate: the empty determinant is `Matrix.det_fin_zero`, and the two lifting statements are kernel/range bookkeeping. `cycleLift_iff` also carries two hypotheses (`hsquare`, `hy`) that its proof never uses; once proved, the unused-variable linter flags both. Probe outcome: a copy of the three statements with the proofs below elaborated with no errors (exit 0), the only diagnostics being the two unused-variable warnings on `cycleLift_iff`.

   **Witness:** A probe copy; `Matrix.det_fin_zero` at the pinned Mathlib.

   **Exact repair text:**
   ```lean
   theorem normalizedPeriod_empty (F : Type u) [Field F] [NumberField F]
       (σ : Fin 0 → F →+* ℂ) (c : Fin 0 → F →₀ ℚ) (n : ℕ) :
       normalizedPeriod n σ c =
         Real.pi ^ (n * Module.finrank ℚ F) / Real.sqrt |(NumberField.discr F : ℝ)| := by
     simp [normalizedPeriod, Matrix.det_fin_zero]

   theorem cycleLift_iff {C D E J : Type*}
       [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
       [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]
       (p : C →ₗ[ℚ] D) (a : C →ₗ[ℚ] E) (y : D) (x : C) (hx : p x = y) :
       (∃ z : C, p z = y ∧ a z = 0) ↔ ∃ k : C, p k = 0 ∧ a k = a x := by
     constructor
     · rintro ⟨z, hz, haz⟩
       exact ⟨x - z, by simp [map_sub, hx, hz], by simp [map_sub, haz]⟩
     · rintro ⟨k, hk, hak⟩
       exact ⟨x - k, by simp [map_sub, hx, hk], by simp [map_sub, hak]⟩

   theorem cycleLift_of_injective {C D E J : Type*}
       [AddCommGroup C] [Module ℚ C] [AddCommGroup D] [Module ℚ D]
       [AddCommGroup E] [Module ℚ E] [AddCommGroup J] [Module ℚ J]
       (p : C →ₗ[ℚ] D) (a : C →ₗ[ℚ] E) (b : D →ₗ[ℚ] J) (q : E →ₗ[ℚ] J)
       (hsquare : q.comp a = b.comp p) (hp : Function.Surjective p)
       (hq : Function.Injective q) (y : D) (hy : b y = 0) :
       ∃ x : C, p x = y ∧ a x = 0 := by
     obtain ⟨x, hx⟩ := hp y
     refine ⟨x, hx, hq ?_⟩
     rw [map_zero, ← LinearMap.comp_apply, hsquare, LinearMap.comp_apply, hx, hy]
   ```
   In `README.md:546` drop the words “for a presentation square” from the description of `cycleLift_iff` (it holds for any `p`, `a`, `x`, `y` with `p x = y`), or keep `b`, `q` and the square only in `cycleLift_of_injective`.

5. **F05** (P3) The Goncharov 2000 locator for `β₂ = 1/3` names the wrong equation

   **Location:** `packages/Polylogarithms/README.md:1106`: “(Goncharov [G00], Proposition 4.1, (28), pp.17–20, with `β₂=1/3` in (15), p.3”.

   **Claim:** In the cached legal copy, equation (15) is the definition of the forms `L̂_{p,q}` on printed page 7, not a statement about `β₂`; the generating-function definition of the `β_k` and the value `β₂ = 1/3` are the unnumbered displays on printed page 3 immediately after the definition of `L̂ₙ`. Proposition 4.1 and (28) are on pp.17–18 as cited.

   **Witness:** G00 line 143 (printed p.3, `β₂ = 1/3`, unnumbered); G00 line 326 (printed p.7, equation (15)); G00 lines 767–771 (Proposition 4.1, (28)).

   **Exact repair text:** Replace “with `β₂=1/3` in (15), p.3” by “with the generating function of the `β_k` and `β₂=1/3` displayed after the definition of `L̂ₙ`, p.3”.

6. **F06** (P3) The Lean file ends with a catalogue of names

   **Location:** `packages/Polylogarithms/Suggested.lean:376–400`: “README targets whose carriers require further construction: Bloch–Wigner descent, embedding regulators and the Borel comparison; …”.

   **Claim:** A 25-line comment listing deferred README targets by name is the “catalogue of names” the Lean-form rules exclude; the README already owns this list (§§2.1–6.3), and the module docstring already says the file is not exhaustive.

   **Witness:** `Suggested.lean:376–400`; `Suggested.lean:6–7` (“is not exhaustive”).

   **Exact repair text:** Delete lines 376–400. If the three derivative names are wanted in Lean, state them as admitted theorems (pass a, F04) rather than in a comment.

## Verified sound

- Elaboration of `Suggested.lean` as submitted at the pinned Mathlib: exit 0, exactly twelve `declaration uses 'sorry'` warnings (lines 114, 130, 141, 146, 243, 286, 298, 308, 325, 349, 362, 371), no other diagnostic. The file imports only `Mathlib`; no `TauCeti.*` module is imported, so the missing-objects rule did not apply.
- Declarations read: all 52 (18 definitions, 12 admitted theorems, 22 proved examples). Policy: single `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`/`True` placeholders, no sorried data, at most two examples per definition (22 over 15 definitions), lower-case title with “Zagier” capitalised, no LaTeX delimiters, no process words or pull-request numbers in the README (the only hit for “lemma” is the English word at `README.md:991`).
- README read in full (1169 lines; 42 numbered subsections, both bold targets, 47 Checks blocks). Adversarial instances tried on every Lean statement: `n = 0,1,2`, `z = 0, 1, −1, i, 1/2, 2`, real points on the cut, `|z| = 1`, `Fin 0` rows, `ℚ`, `ℚ(i)`, `ℚ(√2)`, `ℚ(√−3)`, zero and doubled columns, singular column change, `ZMod 2`, zero modules, the one-dimensional obstruction square. No false statement found beyond pass a's findings; the Lean signatures carry their hypotheses explicitly (no `variable` block), and `zagier_three_exists`'s row equivalence is satisfiable (`card (InfinitePlace F) = r₁ + r₂`).
- Analytic identities in the Lean statements verified numerically to 30 digits on a probe copy: the five-term relation and Kummer's three-point identity for `D`; `D(z) = Λ(arg z)+Λ(arg 1/(1−z))+Λ(arg(1−1/z))` on the upper half-plane; `Λ(π/2)=Λ(π)=0`, `D(i)=2Λ(π/4)=G`, `D(e^{iπ/3})=3Λ(π/3)`; inversion and the three-term relation for `L₃`; the coordinate 22-term relation exactly as transcribed in `trilogCyclic`/`TrilogRelationFunction` at four random complex triples and at `(1,1,1)`; `L₃(−1)=−3ζ(3)/4`, `L₃(1/2)=L₃(2)=7ζ(3)/8`; the derivative formula of `singleValued_three_differential` against finite differences at `1/2, 2, −1, i` and a generic point, with the values `(4/3)log²2` and `−(1/3)log²2`; `S₃(i)=8/9`, `S₆(i)=209/225`, and the `1/N` tail on a circle point.
- Checks recomputed by hand or exactly (about 70): the matrix-unit trace calibration `−3, −3/2, 1/2` and its reversal; the Christoffel symbols and curvature `−1`; the Möbius action on `H³`, `J > 0`, the diagonal action `(a²w,a²h)`; the circumcenter formula and the `(1+i)/4` height test; the cusp tail `A/(2H²)`; `r = 1/z` for `(0,∞,1,z)`; the rational shapes at `i`, `(1+i)/2` and real `z`; `R(1,1,1)=3[1]+4[−1]`, the `(2,2,2)` expansion, `R(1,1,c) ≡ −[c²]+4[c]+4[−c]` (the duplication relation); `δ₂[3]`, `δ₂[2]`, `[3]₂⊗u(5)`; the residue Checks of §3.3; `BC₃³`, `BC₄³`; and the whole of §3.5 by exact rational arithmetic over all 120/720 permutations: `r(1|2345)=6/5` and `5/6`, `r₄ = 18 u(5)∧u(67)∧u(197)` on the four-vector witness, `δr₅ = 36 u(2)∧u(3)∧u(5) = r₄∂` on the moment curve, agreement of the alternative `−(3/2)Alt₅` expression for `r₅` after `δ₂⊗id`, `T = 10/9` and `T = 1`, and the coefficients `−60` and `+300` (all six components of the two iterated boundaries agree after the factor `−1/5`); the triangle determinants `z, −z, z, −1` and parameters `2`, `1`; the Gale dual of the rank-two tuple; `Z₂(ℚ(i))=3ζ_F(2)`, `Z₃(ℚ(i))=16ζ_F(3)`, `Z₂(ℚ(√2))=24ζ_F(2)`, `Z₂=6ζ(2)`, `Z₄=90ζ(4)`; the exponents `eₙ = n(N−dₙ)`, `−2r₁−5r₂ → −3r₂`; `[2]` is not a weight-four cycle; the obstruction square; `η(f,1−f)=dD(f)`, `etaJet 2 i 0 (−1) = log 2`, `η(z,c)`; the tame products on `ℙ¹` (`−a, a⁻¹, 1`; signed product `1`); `P₂((1−t)∧t∧(t−a))=D(a)`; `Res(t∧(t−1)∧(t−3))=3∧2`; `r(0,1,a,∞)=a/(a−1)` with `D`-value `−D(a)`; the line-swap negation in §5.16; `ρ₂({f}₂⊗f) = −dL₃(f)` (symbolically, from the stated differential); the `−4/3` pairing identity and the constants `iA³/(4π²)`, `−iA³/(3π²)` (symbolically, from the Fourier coefficient and `∂χ_γ`); the kernel scaling `1/32`; `T₁`, `T₂`, `r₁ = iη`, `r₂`; the `7`-adic congruences `10²≡2`, `11⁶≡15 (mod 49)` and row sums for totally real fields.
- Locators verified against the cached legal copies (about 100 theorem/equation anchors with page markers, 14 with content read): Z07 (2) pp.10–11 (the three Kummer arguments as in `blochWigner_kummer`), §4 pp.13–16; Z90 (33)–(36) and Proposition 3 pp.413–414; G95 Theorem 1.1 and (1.6) p.203, (1.16)–(1.17) pp.208–210, Definition 1.5 relation (R3) p.211 with the factor 3, Lemma 1.7 p.212, Lemma 1.16 pp.221–222, Corollary 1.19 p.224, the §3 restatement with `η/3` p.263, (3.5) p.266, Lemma 3.3 p.264, §5.2 case (e) p.287 with `(−1)^i` and the auxiliary point last, Proposition 5.3/Lemma 5.4 pp.287–288, Proposition 5.6 p.291, (5.20) p.293, Lemma 7.5/Corollary 7.6 pp.302–303, Theorem 8.1 p.304; G04: 28 anchors on the cited pages, including (13)–(18) pp.14–16, Corollary 2.9/(26) p.21, Theorem 5.7 p.45, Theorem 5.11 p.49, Conjecture 6.2 p.53, Conjecture 6.3/Lemma 6.4/Theorem 6.5 (with the six-torsion qualification) p.54, Lemma 6.9/(85) p.57, Theorem 6.14/Lemma 6.15 p.62, Proposition 6.17 p.63, Proposition 6.18 p.64, (75) p.52; G00 Proposition 4.1/(28) pp.17–18; BFT 16 anchors incl. (5.1)–(5.2) p.8 (as in §5.7) and (6.3) p.16; D96 Theorem 2.1 p.7, Theorems 3.3–3.4 pp.20–21 (with the unspecified rational constant the README mentions); DEM Theorem 2.15 p.143, Corollary 2.11 p.141, Theorem 2.24 p.20; BUR Proposition 3.1 p.73, Corollary 3.8 p.77, Theorem 4.3 and Lemma 4.5 p.80; SV eight anchors incl. Definition 3.1.3 p.16; NEK (7.3.2) p.23, (7.4.1) p.24 and the `η` sign in 7.5; WEI Theorem 6.2 p.40, (6.6) p.41, Theorem 6.7/Corollary 6.7.1 pp.42–43, Lemma 6.7.3 p.43; WEI4 §1 pp.11–12; SHA Proposition 1.5.6, Theorem 1.5.7, Definitions 1.5.9–1.5.10, Remark 1.5.11 pp.31–32; BOR77 Remark 6.3 p.632 (its index is shifted by one relative to the README's `n`, consistently).
- Supplier citations checked at existing heads: PolylogarithmFunctions (five names; one drift, F02; `bernoulliCoeff k = 2^k B_k/k!` agrees); K3BlochGroups board PR 162 (`preBloch`, `blochBoundary` with value `x ∧ (1−x)`, the Suslin layer, the certificate layer); BorelRegulators §7.1 statement; K2SymbolsBrauer §§5.4, 7.2, 8.2–8.3, 9.5, 9.11, 9.16, 10.5, 10.9, 10.24, 10.29–10.30, 11.3, 11.5 and the tame convention `∂{π,u}=ū⁻¹`; GeneralAlgebraicKTheory §§3.12–3.14 (PR 1212 and explorer); StableHomotopyKTheory §4.14; SchemeKTheoryOperations §§3.3, 4.5, 5.1–5.2, Layer 6; ComplexComparisonPartII C5.4 with `AnalyticCycleIntegration`, `closedCurrentExtension`; AlgebraicModuliForArithmeticGeometry §1.6, §7.10.1 with `complexSchemeAnalytification.map`/`.fibreProduct`, Layer 9 `localIsomorphismResolution`, §9.7; IntegralIwasawaTheory §2.2, §§4.1–4.4; ColemanIntegration L0.F, L0.15–L0.18; on main GeometricTopology Layer 7 with `TauCeti.riemannianVolume`, DifferentialGeometry Layers 0–2, 5–6, 8, SchemeAndStackFoundations Layer 5 with `Chow.properPushforward`, `Chow.flatPullback`, `Chow.c1`, AlgebraicVectorBundles, Completed EffectiveBounds; MotivesAndAlgebraicCycles design MC.2/MC.4.
- Dependency check, verbatim:

```text
NOT IN ORDER: Polylogarithms (insert it after its last supplier)
depcheck: 8 roadmaps, 58 edges, 1 problem(s)
```

  Exit status 1; no UPWARD or CYCLE line. `grep -nx Polylogarithms merge-order/ORDER.txt` finds nothing: the package is imported and not yet in the order, which is not a defect. No declared gaps (`What X must provide (gap:…)`) appear in the README.
- Not re-raised (pass a, round 1): F01 (computational algorithm in §2.5/§6.3), F02 (sixth-root kernel Check), F03 (every-family headline), F04 (missing Lean mirrors; the two mirrors `circlePartial 6 I = 209/225` and `¬FiveTermFunction (fun _ => 1)` elaborate on a probe copy), F05 (missing `sources.toml`), F06 (forward dependencies and the §5.3/§5.9 cycle), F07 (Green coefficient closedness), F08 (characteristic restriction in §5.16), F09 (arbitrary-curve rigidity adapter), F10 (primitive-to-K comparison).

## Not verifiable

- G94 (Seattle manuscript), MIL (Thurston notes, chapter 7), GR (arXiv 1803.08585v5) and SCH (Schneider's introduction) are not in the cached legal copies under the README's URLs or by content fingerprint; their locators (G94 §§3.1–3.10, Theorem 3.12, Theorem 5.11; MIL Theorem 7.2.1, Lemma 7.2.2; GR Theorems 1.1–1.2, §1.2, §5.1, §7.1, (142)/(144), Proposition 7.2; SCH §4 p.28) were not checked here.
- Without `sources.toml` (pass a, F05) the sources were identified by the README's URLs against the cache headers; SHA was matched to the author's notes at a different path of the same site.
- Supplier ownership at board level: K3BlochGroups exists only as board pull request 162 (another author's open pull request adding a folder: allowed); BorelRegulators and MotivicEtaleKTheory exist only as explorer packages, neither on main, in `merge-order/ORDER.txt`, nor as open pull requests. Pass a listed them as unavailable; not raised as unowned here, but F01 and F03 are stated against those explorer heads. BorelRegulators §7.1, on which `zagierExistence_totallyRealEven` rests, itself records a missing Tamagawa-measure input (its README line 1040).
- Truth of `zagier_three_exists`, `zagierExistence_totallyRealEven`, `circlePartial_error`, `blochWigner_lobachevsky`, `blochWigner_kummer`, `singleValued_three_relations`, `etaJet_steinberg`, `singleValued_three_differential` and `singleValued_three_derivative_half` is checked numerically or by hand, not in Lean; `singleValued_three_relations` additionally assumes the 22-term relation at the admissible non-generic points by continuity, which the README names as `coordinateRelation_specialize`.
- The §5 current-theoretic targets (LF topology, Poincaré–Lelong extension, h-descent of relative cycles, logarithmic estimates) were checked for internal consistency of signs and degrees only.

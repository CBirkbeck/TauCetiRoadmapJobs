<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/162#issuecomment-6335957552 -->
Red team round 1 pass b (claude) of 8ef92f5

Verdict: needs_changes

1. **F01** (P3) Process narrative: "current" and "deferred" date the text

   **Location:** `packages/K3BlochGroups/README.md:17`: “The current Tau Ceti theorem `TauCeti.crossRatio_comp_eq_of_sub_eq_div` in `TauCeti/Algebra/Field/LinearFractional.lean` supplies affine cross-ratio invariance”; the same wording at lines 19 (“Current Tau Ceti also supplies”), 39 (“Current Tau Ceti additions cited in the ownership paragraph”), 51 (“deferred in Scope and ownership”), 1261 (“(current `GroupCohomology/FiniteCyclic`)”) and 1466 (“Current `TauCeti.ContinuousCohomology.corestriction_mackey`”).

   **Claim:** The README is required to be timeless; "current" and "deferred" are process words that tell a reader a year from now which declarations were recent additions and which items were postponed. The six occurrences all qualify declarations that simply exist at the pins, so the word carries no mathematical content.

   **Witness:** All eight Tau Ceti declarations named at lines 17, 19 and 1466 exist at the pinned Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (`TauCeti/Algebra/Field/LinearFractional.lean`, `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean`, `GroupHomology/Shapiro.lean`, `GroupHomology/Transfer/Basic.lean`, `GroupHomology/Transfer/Trans.lean`, `GroupHomology/LongExactSequence.lean`, `ContCohomology/Corestriction/Mackey/AllDegrees.lean`), and Mathlib's `GroupCohomology/FiniteCyclic.lean` exists at the pinned Mathlib; nothing about them is "current". The stale baseline shas at line 39 are pass a's F06 and are not re-raised here.

   **Exact repair text:** Line 17: “The Tau Ceti theorem `TauCeti.crossRatio_comp_eq_of_sub_eq_div` in `TauCeti/Algebra/Field/LinearFractional.lean` supplies affine cross-ratio invariance from a difference formula over any field.” Line 19: “Tau Ceti also supplies `TauCeti.groupHomology.indIso_inv` …”. Line 39, second sentence: “The Tau Ceti declarations cited in the ownership paragraph are suppliers for the eventual implementation, not imports of the representative file.” Line 51: replace “deferred in Scope and ownership” by “assigned to their owners in Scope and ownership”. Line 1261: replace “(current `GroupCohomology/FiniteCyclic`)” by “(Mathlib's `GroupCohomology/FiniteCyclic`)”. Line 1466: replace “Current `TauCeti.ContinuousCohomology.corestriction_mackey`” by “Tau Ceti's `TauCeti.ContinuousCohomology.corestriction_mackey`”.

2. **F02** (P3) Four sorried theorems are one tactic from Mathlib, and one of them is unnamed in the README

   **Location:** `packages/K3BlochGroups/Suggested.lean:29` (`comparison_apply`), `:46` (`comparison_eq_zero`), `:157` (`rankTwoFaceMatrices_det`), `:265` (`rootCoefficient_toPre`), each ending “:= by sorry”; `packages/K3BlochGroups/README.md:1122`: “The API of `rankTwoFaceMatrices` consists of the three determinant formulas, its action on t and the four-face boundary identity.”

   **Claim:** These four statements are stated as targets although each closes by a single tactic from the pinned Mathlib: two are definitional unfoldings of a four-fold `AddEquiv.trans`, one is a 2×2 determinant computation, and one is `tmul_smul` plus the unit equation. A representative file holds end theorems and milestones; a target that is `rfl` or `simp` is neither. Separately, the Lean name `rankTwoFaceMatrices_det` does not occur in the README (its content is described at line 1122 without the name), against the rule that every Lean name appears in the README.

   **Witness:** In a probe copy against the pinned Mathlib the four proofs below elaborate with no diagnostics (exit 0). The other twelve sorried theorems were probed with the same recipe and did not close (`eval3_surjective` has no `groupHomology.π_surjective` at the pin; `bar_four_identity_boundary` leaves the signed `contractNth` sum after `simp`; `unique_difference` needs a two-step argument), so they stay targets.

   **Exact repair text:** Replace the four proof bodies:
   ```lean
   theorem comparison_apply (q : P ≃+ K) (h : P ≃+ H) (j : J ≃+ H)
       (b : J ≃+ S) (x : K) : comparison q h j b x = b (j.symm (h (q.symm x))) :=
     rfl

   theorem comparison_eq_zero (q : P ≃+ K) (h : P ≃+ H) (j : J ≃+ H)
       (b : J ≃+ S) (x : K) : comparison q h j b x = 0 ↔ x = 0 := by
     simp

   theorem rankTwoFaceMatrices_det {F : Type*} [Field F] (a : F) :
       (rankTwoFaceMatrices a 0).det = 1 - a ∧
       (rankTwoFaceMatrices a 1).det = a * (1 - a) ∧
       (rankTwoFaceMatrices a 2).det = a := by
     simp [rankTwoFaceMatrices, Matrix.det_fin_two]; ring

   theorem rootCoefficient_toPre (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
       (u : Rˣ) (hu : (u : R) = (m : R)) :
       TensorProduct.map δ.ker.subtype.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
         (rootCoefficient δ x m h u hu) = x ⊗ₜ[ℤ] (1 : R) := by
     simp [rootCoefficient, rootMultiple, ← hu, TensorProduct.smul_tmul]
   ```
   and in the README at line 1122 write “The API of `rankTwoFaceMatrices` consists of the three determinant formulas `rankTwoFaceMatrices_det`, its action on t and the four-face boundary identity.”

## Verified sound

Read all 1,931 README lines (62 numbered subsections, 6 layers, every Check bullet) and all 398 lines of `Suggested.lean` (16 definitions/abbreviations, 16 sorried theorems, 23 proved examples; no `lemma`, no `set_option`, no `def := sorry`, single `import Mathlib`, at most two examples per definition; every Lean name except `rankTwoFaceMatrices_det` occurs in the README). The file as submitted elaborates in a probe copy against the pinned Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` with exactly 16 `declaration uses 'sorry'` warnings and no other diagnostic (exit 0). The Mathlib differential convention was checked against the file's two bar-complex targets: `inhomogeneousChains.d` is the first-entry-action term plus `Σ_j (−1)^{j+1}` contractions, so d₄[1|1|1|1]=[1|1|1] and d₃[g|1|1]=[1|1]−[g|1] as the README states (§1.3, §6.5).

Statements tested for truth: `rootCoefficient_denominator_independent` (cross-multiplication inside the kernel, no flatness), `SuslinLift.unique_difference`, the two trivial-group `BarLiftCertificate` targets, `fiveTermRaw_oneSub` (the two displayed fractions coincide), `cyclicHomology_power_map` (a^j on H_{2j−1}), `finite_sl2_localized_homology` at q=2,3 (ℤ/3, ℤ/8), the example at line 37 (2·3=1 in ℤ/5).

Checks recomputed (independent integer-lattice computation of the presentations over F_q, q=4,5,7,8,9,11,13, and over the projective line for q=2,3,5,7,11): P(F_q)=ℤ/5, ℤ/6, ℤ/8, ℤ/9, ℤ/10, ℤ/12, ℤ/14 and B(F_q)=ℤ/5, ℤ/3, ℤ/4, ℤ/9, ℤ/5, ℤ/6, ℤ/7 (the §5.5 order formula at seven values of q including both parities); c independent of x, 3c=⟨−1⟩, 6c=0 in all seven fields; order of c equal to 1, 3, 2, 3, 1, 6, 1 (so c=0 exactly when both hypotheses of §3.6 hold, and c generates B(F₁₁)); ⟨y⟩−⟨x⟩=⟨y/x⟩ and 2⟨x⟩=0 for every admissible pair in six fields; c=⟨ζ⟩ and 2c=0 at every root ζ of t²−t+1 (q=7,9,13); §3.7 in full ([2]=2[3], [4]=0, c=[2], [−1]=0 over F₅; [−1]=2[3], c=2[−1]=2[4]≠[4], [4]=6[3] over F₇); §3.13–3.16: B_old(F_q)=ℤ/3, ℤ/2, ℤ/3, ℤ/4, ℤ/6 and B_new(F_q)=ℤ/3, 0, ℤ/3, ℤ/2, ℤ/3 for q=2,3,5,7,11, with [0] of order 3 at q=2,5,11, [1]=0, [∞]=−[0], 3[0]=0, κ_new(c)=[0], and C_ext ⊆ ker d_new (the same results with or without the diagonal X=Y); Q_neg(F₃)=ℤ/2, Q_neg(F₅)=0, Q_neg(F₇)=Q_neg(F₁₁)=ℤ/2; the Exercise VI.5.5 identities (i) and the roadmap's (ii) hold at every x∉{0,1,−1} over F₇, F₈, F₉, F₁₁, F₁₃ while the K-book's printed (ii) fails at 3, 6, 6, 6 and 9 values respectively; the ψ′ rotation sum Σᵢ[cr(tⁱ[a;x])] equals 2c for all 72 admissible pairs over F₁₁ (and all 20 over F₇, 110 over F₁₃), which with the displayed cone differential (weibel line 29977) forces ψ′(P)=−2c as §4.14 says; configuration homology H₀,H₁,H₂=ℤ,0,ℤ² for |X|=3, H₁=ℤ for |X|=2, and H₂(Cᵃ) of rank 3 for |X|=3, H₃(Cᵃ) of rank 8 for |X|=4. By hand: the determinant cross-ratio formula gives cr(0,∞,1,x)=x; the face matrices carry t to the four faces of (0,∞,1,a) in the stated order and have determinants 1−a, a(1−a), a; the (v₂,v₃) pairing sends 3∧(−2) to −1; the fiveTerm inverse-sum identity and fiveTerm(ω,ω²)=3[ω]−2[ω²] over F₄; the §6.2 certificate components for [2]+[−1], [2] and [ω]; the Rogers values π²/12, −π²/4, −π²/12 and ρ(c)=−π²/6 and their consistency with reflection; the §5.4–5.6 kernel orders 40/8, 12, 6/3 and the q=7, n=3 non-example; {2,−31}∈K₂(ℚ)[5] with residue 2 of order 5; μ̃(F₅)=μ₈⊂F₂₅ˣ; T̃(ℚ)=ℤ/4 against 4·6=24; H₂(GL₂(F₄))=ℤ/2 (GL₂(F₄)≅ℤ/3×A₅), confirming §4.12's remark on Theorem VI.5.7; Γ conjugation identities (decided in Lean) match the block description of §4.15.

Locators verified against the cached legal copies (ids weibel, weibel3–6, hutchinson2013, hutchinson2024, cgz2021, cgz2023, goncharov, zagier, kerz, hatcher, levine, mirzaii; the package has no `sources.toml`, pass a's F10, so the copies were located by content): all 23 combined-K-book "PDF p." locators (IV Ex. 1.9 p.282, Ex. 1.10.1 p.274, VI.2.1.2 p.478, VI.5.1–5.2 p.495, 5.2.1/5.3/5.4 p.496, 5.4.1/5.5 p.497, 5.6/5.7 p.498, 5.8.1 p.499, 5.9 p.500, 5.10/5.11 p.501, 5.12/5.14 p.502, 5.15 p.503, 5.16 p.504, 5.16.1/5.17 p.505, 5.18 p.506, 5.20 p.507, Ex. 5.1–5.5 p.508, Ex. 5.9 p.509, V.11.13 p.466, VI.4.3 p.489, 4.3.1–4.3.2 p.490, IV.4.10.1 p.316, V.6.7 p.418, V.6.7.1 p.419); chapter-PDF locators III.7.2(c–d) pp.61–62, III.7.8 pp.67–68, III.6.4.1 p.52, Ex. 7.3 p.72, Ex. 7.12–7.13 p.73, IV.1.1.2 p.3, IV.1.13 p.10, IV.1.19–1.20 pp.13–14, IV Ex. 1.9/1.11/1.12 p.15, IV.4.9.3 p.43, V.11.3 p.81, 11.3.2 p.82, 11.11 p.85, 11.13 p.86, Ex. 11.5 p.89, VI.1.3.1 p.3, 1.6 p.4, 2.1 p.6, 2.1.2 p.7, 4.3.1–4.3.2 pp.17–18, 5.2.1/5.3 p.24, 5.12 p.29, 5.17 p.33, 5.19 p.34, Ex. 5.8 p.35; Hutchinson 2013 Lemma 2.1/Cor. 2.2 p.6, Thm 2.9 p.9 (hypothesis "at least 10 elements", compatible with §4.5's infinite F), Lemma 2.12 p.11, Thm 3.1/Lemma 3.4 p.12, Lemma 3.5 p.13, Cor. 3.6 p.14, Cor. 3.7/Lemma 3.8 p.15, Lemma 3.14 p.17 (the seven exceptional q), Thm 4.3/Lemma 4.4 p.19, Lemma 4.6 p.20, Lemma 4.7/Cor. 4.8 p.27, §6.2 p.31, §6.3 p.32, §6.5 p.33, Lemma 7.1/Rem. 7.2/Lemma 7.3/7.4 p.34, Cor. 7.5 p.35; Hutchinson 2024 §2.1 p.2 and Thm 2.10 p.4; CGZ 2021 Def. 1.1 p.2, (14) p.5, Def. 2.1 p.8, Lemma 2.2 p.9, Thm 2.11 p.15, Lemma 4.4 pp.24–25, circular units p.33; CGZ 2023 Def. 2.1/Lemma 2.2 printed p.391, Lemma 4.4 p.407, §6 pp.414–416; Goncharov Lemma 1.16/(1.25a) and Prop. 1.22/Conj. 1.20 at the pages corresponding to 222 and 225; Zagier II.1.A; Kerz Thms 1–2 pp.1–2; Hatcher Ex. 4.51–4.52 and Ex. 37 at the pages corresponding to 380–381 and 392; Levine Thms 4.11–4.12 at the pages corresponding to 335–336; Mirzaii Lemma 4.1 p.8. The three source corrections made by the roadmap were read in the copies and are right: weibel line 29666 states Lemma 5.4(c) with target B(F) (the roadmap's P(F) is correct, since ⟨2⟩∉B(F₅)); weibel line 30484–30485 prints c=[4] for F₇ and weibel line 30490 prints Exercise 5.5(ii) with [−x²] and [1/x²], both refuted by the computations above; weibel line 29988 prints ψ′(P)=2c.

Supplier citations checked: GeneralAlgebraicKTheory §§1.8, 3.2–3.4, 3.12, 7.4, 13.8a–c exist at head 5705674; K2SymbolsBrauer §§5.4, 5.6, 5.12–5.14, 7.2, 8.1–8.4, 10.5, 10.32 and Layers 2, 4, 5, 9, 10 at a969ec1; AlgebraicKTheory A5 at e5df75b (another author's open pull request adding the folder, hence eligible); KTheoryFiniteLocalFields §1.5 at its moved head 0c71b44; SchemeKTheoryOperations §§3.6, 4.7, 5.5, 6.4 at 03713e1; AlgebraicTopology Stages 2–5 and 8 and GlobalNumberFields Layer 1 (weak approximation) on main; AlgebraicCurves Layer 12 sublayer 12A on main; UniversalCovers Stages 2–3 under `Completed/` (cited by name only, not under a `TauCetiRoadmap.` heading); PolylogarithmFunctions §§6.1–6.5 at 6e452e5 (PF.6 absent: pass a's F13). The eight Tau Ceti declarations and the fourteen Mathlib declarations named in the README exist at the pins. Package diff confined to its folder. README title keeps "Bloch" capitalised; no issue or pull-request numbers, no `$…$`, no `set_option`, no `lemma`.

Dependency check, verbatim:
```text
NOT IN ORDER: K3BlochGroups (insert it after its last supplier)
depcheck: 9 roadmaps, 75 edges, 1 problem(s)
```
No UPWARD or CYCLE line; the package is absent from `merge-order/ORDER.txt`, which is expected for an imported package and not raised.

Pass a (codex) findings not re-raised: F01 (order of a root of t²−t+1 in characteristic two), F02 (model completeness unowned), F03 (easy `antisymSquare`/`FiveTermCertificate` headlines omitted), F04 (finite-to-infinite naturality), F05 (StableHomotopyKTheory section drift), F06 (stale baseline shas), F07 (MotivicEtaleKTheory/ArithmeticKTheory contracts; corroborated: `MotivicEtaleKTheory` exists nowhere, and the jobs board's `packages/ArithmeticKTheory` holds only `reports/` and `sources.toml`, no README), F08 (internal cycles), F09 (Checks without Lean mirrors), F10 (no `sources.toml`), F11 (KTheoryFiniteLocalFields duplicates), F12 (finite Chern additivity), F13 (PolylogarithmFunctions PF.6), F14 (trailing name catalogue).

## Not verifiable

- Suslin 1984 and Suslin 1991 (every §4.2–4.8, §4.15–4.18 and §5.8 locator into them) and Bloch's Lecture 6: no cached legal copy; the earlier pass's fetch record shows both Suslin retrievals timed out and no legal source for Bloch. The K-book and Hutchinson copies corroborate the statements but not the primary lemma numbers or pages.
- The seven-term reduction table and the eight-term chain u of §4.11, the hyperhomology arguments of Layer 4 and the refined finite configuration argument of §5.4: not recomputed beyond the consistency checks listed above (face matrices, signs, splitting change).
- `AlgebraicTopologyPartII` (README lines 21, 216) is a design-stage package on the jobs board whose design README contains `AT2.4/hilton-wedge`; it is cited as a related statement, not consumed, and has no merge-order position. The consumers named at line 15 and under "Downstream consumers" (`Polylogarithms`, `PadicHodgeRegulators`, `HabiroNumberFields`, `EllipticKTheory`) are board packages without merge-order positions, and `BorelRegulators` and `ArithmeticQuantumTopology` exist nowhere I could read; the claims about what those roadmaps construct could not be checked.
- Goncharov page citations 202–203 and 253–254: the cached copy's OCR did not let me locate those passages; only the §1.9 items were matched.
- The `Suggested.lean` baseline named at README line 39 differs from the pinned libraries (pass a's F06); the probes here ran at the pinned Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

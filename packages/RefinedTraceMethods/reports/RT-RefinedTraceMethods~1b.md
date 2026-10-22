<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/175#issuecomment-6336427475 -->
Red team round 1 pass b (claude) of 86b0104

Verdict: needs_changes

1. **F01** (P3) `Suggested.lean` does not elaborate as submitted: the `no_vf_axiom` example fails

   **Location:** `packages/RefinedTraceMethods/Suggested.lean:79`: “example (p : ℕ) [Fact p.Prime] : ∃ c : CartierStructure p (ZMod p × ZMod p), c.verschiebung.comp c.frobenius ≠ p • AddMonoidHom.id (ZMod p × ZMod p)”.

   **Claim:** The statement is well-typed and true, but its proof script (lines 83–86) does not compile against the pinned Mathlib: `ext x <;> simp` leaves both component goals untouched and `simp at h1` does not reduce the coercion of the composite, so the file ends with two `simp made no progress` errors (83:14) and an `unsolved goals` error (84:2). The only acceptable diagnostics are `declaration uses 'sorry'` warnings; the file as submitted has three errors.

   **Witness:** Elaboration of a probe copy of the file against the pinned Mathlib: `probe:83:14: error: simp made no progress` (twice) and `probe:84:2: error: unsolved goals … ⊢ False`, besides the six expected sorry warnings at lines 60, 105, 112, 143, 200, 209. With the proof below substituted, the whole file elaborates with exactly the six sorry warnings and exit code 0.

   **Exact repair text:** Replace lines 83–86 by
   ```lean
     · refine AddMonoidHom.ext fun z => ?_
       obtain ⟨x, y⟩ := z
       change ((0 : ZMod p), (0 : ZMod p)) = (p • x, p • y)
       rw [nsmul_eq_mul, nsmul_eq_mul, ZMod.natCast_self, zero_mul, zero_mul]
     · intro h
       have h1 := congrArg Prod.snd (DFunLike.congr_fun h ((1 : ZMod p), (0 : ZMod p)))
       change (1 : ZMod p) = p • (0 : ZMod p) at h1
       rw [smul_zero] at h1
       exact one_ne_zero h1
   ```

2. **F02** (P3) `diagonalNumerator_one` is stated as a target but is one tactic from Mathlib

   **Location:** `packages/RefinedTraceMethods/Suggested.lean:112`: “theorem diagonalNumerator_one (d : ℕ) : aeval ![X 0, X 1, (1 : MvPolynomial (Fin 3) ℤ)] (diagonalNumerator d) = (X 0 - X 1) ^ d := by sorry”.

   **Claim:** The admitted theorem closes by a single `simp` call (the product is mapped termwise by `map_prod`, `aeval_X` evaluates the variables and `one_pow`, `one_mul` and `Finset.prod_const` finish), so it is not a representative end statement but a proved fact; README line 3212 lists it among the targets of §6.10.

   **Witness:** A probe copy containing `example (d : ℕ) : aeval ![X 0, X 1, (1 : MvPolynomial (Fin 3) ℤ)] (diagonalNumerator d) = (X 0 - X 1) ^ d := by simp [diagonalNumerator]` elaborates without error against the pinned Mathlib. (The sibling `diagonalNumerator_shift` is not one tactic: `induction d` with `Finset.prod_range_succ` and `ring` does not close it, so it stays a target.)

   **Exact repair text:** Replace `:= by\n  sorry` at lines 113–114 by `:= by\n  simp [diagonalNumerator]`, and in README line 3212 keep `diagonalNumerator_one` as a proved API item rather than a sorried target (it may stay listed under "Provide the following operations and identities").

3. **F03** (P3) The Blumberg–Mandell sign quotation does not match the source

   **Location:** `packages/RefinedTraceMethods/README.md:2073`: “Blumberg–Mandell §9 uses the opposite generator and writes −t^{−1}σt; transporting that comparison reverses the sign.”

   **Claim:** The cited passage does not contain the formula `−t^{−1}σt`. The cached legal copy writes, on the page before the proof of Theorem 9.1, that the inclusion R[t^{−1}] → R[t,t^{−1}] sends `σt^{−1}` to `−t^{−2}σt`, and on the next page that the class `t^{−1}σt` (without a sign) induces the isomorphism onto the cokernel; the locator "p. 41" also points one page past the formula. As written the README attributes to the source a sign convention it does not state, and the conclusion "reverses the sign" rests on that misquotation.

   **Witness:** blm line 1883–1884 (printed p. 40, running head "40 ANDREW J. BLUMBERG AND MICHAEL A. MANDELL" at line 1844): "sends 1 to 1 and σt^{−1} to −t^{−2}σt"; blm line 1889 (printed p. 41): "multiplication by t^{−1}σt induces an isomorphism".

   **Exact repair text:** Replace the sentence by “Blumberg–Mandell §9 (pp. 40–41) writes the Bass–Heller–Swan class as t^{−1}σt and records that the inclusion R[t^{−1}] → R[t,t^{−1}] sends σt^{−1} to −t^{−2}σt; this agrees with d log t = t^{−1}dt in the convention above, so no sign is reversed.” and change the locator at line 2077 to “paragraph before and the first paragraph of the proof of Theorem 9.1, pp. 40–41”. If a genuine sign difference with the source is intended, state the source's generator and formula verbatim as locators and give the two-term computation that exhibits the reversal.

4. **F04** (P3) A named supplier exists nowhere

   **Location:** `packages/RefinedTraceMethods/README.md:11`: “OrthogonalSpinGroups and SpinRepresentations supply their algebraic Clifford results.”

   **Claim:** `SpinRepresentations` is not a roadmap on `main` (neither `TauCetiRoadmap/SpinRepresentations` nor `Completed/SpinRepresentations` exists; `main` has `OrthogonalSpinGroups` and `SpinGeometry`), it is not in `merge-order/ORDER.txt` on `main` (191 lines), and no open roadmap pull request adds it (316 open pull requests searched by title). No target of this roadmap consumes it, so the sentence is a stale scope pointer rather than an unowned prerequisite.

   **Witness:** `TauCetiRoadmap/` and `Completed/` on `main` at a0af4de contain no `SpinRepresentations` folder; `grep -nx SpinRepresentations merge-order/ORDER.txt` on `main` is empty.

   **Exact repair text:** Replace the sentence by “OrthogonalSpinGroups supplies its algebraic Clifford results.” (or, if a different roadmap is meant, name it as it is on `main`).

5. **F05** (P3) Two roadmaps named as downstream consumers precede this roadmap in the merge order

   **Location:** `packages/RefinedTraceMethods/README.md:19`: “KTheoryFiniteLocalFields, GeneralAlgebraicKTheoryPartII and ChromaticHomotopyTheory build on Layers 1–5 here”; line 15: “HabiroCohomologyFoundationsPartII, which builds on this roadmap”; lines 4190 and 4192 repeat both claims.

   **Claim:** The merge order on `main` places `RefinedTraceMethods` at line 165, but `KTheoryFiniteLocalFields` at line 65 and `HabiroCohomologyFoundationsPartII` at line 160, i.e. before their claimed supplier. A roadmap earlier in the order cannot consume a later one (single direction of supply), so either these consumer claims are wrong or the order is; the package's own text should not assert a supply direction the order contradicts. (The dependency check of this package reports no UPWARD line because the package cites neither roadmap as a supplier.)

   **Witness:** `merge-order/ORDER.txt` on `main`: line 65 `KTheoryFiniteLocalFields`, line 160 `HabiroCohomologyFoundationsPartII`, line 165 `RefinedTraceMethods`.

   **Exact repair text:** In lines 15, 19, 4190 and 4192 drop the statements that `KTheoryFiniteLocalFields` and `HabiroCohomologyFoundationsPartII` build on this roadmap, or, if the consumption is intended, flag the merge-order placement to the board so that both are moved below line 165 before the package is accepted; keep `GeneralAlgebraicKTheoryPartII` and `ChromaticHomotopyTheory` only as motivation for future roadmaps (neither is on `main`, in the order, or in an open pull request).

## Verified sound

- Read in full: all 4,352 README lines (208 bold targets, every Checks list, every `*Needs:*` line) and all 270 lines of `Suggested.lean` (23 declarations: 8 definitions/structures/abbreviations, 6 admitted theorems, 9 proved examples).
- Elaboration: the file as submitted fails (F01); with the F01 repair substituted it elaborates with exactly six `declaration uses 'sorry'` warnings (lines 60, 105, 112, 143, 200, 209) and exit code 0. Trivial-target probes: `diagonalNumerator_one` closes by one tactic (F02); `diagonalNumerator_shift`, `HighPowered.fourthPower`, `TracePresentation.lift`, `can_and_frobenius` and `CartierModule.isogeny_iff_underlying` do not close by a one-tactic attempt and remain honest targets. The six admitted statements are true on their carriers (the `n • g` isogeny argument checked for every natural `p`; `FV = p` without `VF = p` checked on `(ℤ/p)²` including `p = 2`; the numerator identities checked for `d = 0, 1, 2`; the quotient relations checked at `ξ = 0, 1` and for `φ(z) = z²`).
- Locators: no `sources.toml` ships with the package (pass a F10), so sources were identified in the cache by title and URL. About 400 numbered-item locators were checked across 46 of the 52 cited works: NS (Acta copy, printed running heads: 60 items, all pages agree), AN (25), AMMN (22), BMS published (printed = PDF+198: 22) and BMS arXiv (12), BGT (20), BGT-mult (15), Raskin (15), CMM (26), LT (9), LQ (OCR scan, printed = PDF+563: 9), WG (Theorem 2.1 on p. 374), HKR (Theorem 5.2 on p. 395), Hoyois (2), Ginzburg (4), KN (5, Theorem 1.1 is the free-E₁ statement as cited), HM97 (Theorem 2.3 on manuscript p. 18), H05 (3), He (4), Du, McC, LMMT (4), HN (2), BlM (8; F03), E-cont (7), E-mot (7), MW (author-page copy whose numbering matches the README: 34), Ram (2), P (15), HRW (2), AR (7), R-Gal (3), DR (4), HA (3), L20 (2), Pri (2), BS (4), BM (1), KB (IV.2.10 on printed p. 283), WeiK (Example 4.3.1, Dayton's triangle ring, p. 31), EC2 (§6.5 on p. 273), Hatcher (Theorem 2.20 on printed p. 62), GS (1), Co (displays (5)–(6)). W and W-Hab are not in the cache; both arXiv PDFs were fetched from arXiv and their text extracted in an isolated directory: all 70 W locators (Theorems 1.2, 4.8, 4.14, 4.16, 4.17, 4.27, 5.51, 5.63, 6.10, Lemma 6.11, 6.12–6.13, Remark 6.14, Corollary 6.15, Examples 6.7–6.8, paragraphs 1.7, 1.11, 2.1–2.6, 3.1–3.2, 3.8, 4.7, 4.18, 4.21–4.25, 5.20, 5.32–5.33, 5.43–5.47, 5.59, Lemmas 2.14–2.15, 3.7, 4.22, 4.24, 4.29, 5.28, 5.44, 5.61, Corollaries 2.17, 3.14–3.24, Propositions 3.11, 5.26, 5.42) sit on the cited printed pages (the §6 pages were cross-checked against the printed page numbers because the PDF has four unextractable figure pages); W-Hab Corollary 3.13 (p. 27), Example 3.12 (p. 25) and Remark 3.6 (p. 22) agree. The AMMN Proposition 3.1 proof does print `V(g(z)) − g(F(z))`, as the README says; the MW definition of high-powered integers (3.3, p. 30) is exactly the Lean predicate; the CMM "variant" cited at §5.2 p. 42 exists.
- Checks recomputed (about 60): K₋₁ of the triangle ring; the W₂(ℤ) ghost image at p = 3; FV = 0, VF(1,0) = (0,1) on (ℤ/p)²; HH and relative HC of dual numbers (HC₂(ℚ[ε],(ε)) = ℚ); HC of ℚ[x]; Tate cohomology parities for C_n and C₂; the C₂ spectral sequence of KU₂ (d₃(u²) = a³, π₀…π₄), π₁ orders of fib(ψ³−1) on KU₂ and B₂, the π₀J₂ extension, r = 2 versus r = 10 modulo 9, π₃j and π₁₁j at p = 3; the degree-two shift identity and the (q−1)²xy residue; λ² of (x−y)/(q−1); the Pochhammer sign; ∇_{q,x} of the classical square; [n]_q and the q-Leibniz rule; HighPowered on 0, 1, 3, 8, 9, 16, 32, 64 and d⁴; the uv relations at ξ = 0, 1; (HZ⊗ℚ)^∧_p = 0; 1 − pⁱ a unit; ℤ_p(1)(ℤ_p) ≃ pℤ_p[−1]; π₁ of the Beilinson fibre for ℤ versus ℤ_p; K^inv(𝔽_p) in degrees −1, −2; π₋₂HP(ℤ_p;ℚ_p); the HKR composite πε = n!; Ω² of dual numbers; the quadratic Goodwillie derivative and cross-effect; ℤ/4 → 𝔽₂; Tor₁ for HZ/p and H(ℚ/ℤ); ⊕ versus ∏ in CC₀/CN₀; the non-compact unit of ∏ D(k); the Prüfer derived completion ℤ_p[1]; H^i(C₂;ℤ); LBG = ⊔ BC_G(g); homotopy orbits of T with translation versus trivial action.
- Suppliers: every roadmap cited as a supplier is on `main` (EnhancedDerivedSheaves, GeneralizedCohomology, DGAInfinity, BordismFormalGroups, NoncommutativeGeometry, AlgebraicVectorBundles, OrthogonalSpinGroups, OperatorTheory), is an open pull request adding its own folder (#894 TopologicalKTheory, #896 CharacteristicClasses, #1044 AInfCohomology, #1057/#1065/#1070 PrismaticCohomology I–III, #1064 CohomologyComparisons; all OPEN, each touching only `TauCetiRoadmap/<Name>/`), or sits above line 165 of `main`'s ORDER.txt (StableHomotopyKTheory 3, GeneralAlgebraicKTheory 4, DerivedDeRhamCohomology 17, CrystallineCohomology 18, KTheoryLowDegrees 34, K2SymbolsBrauer 35, AInfCohomology 53, PrismaticCohomology 54–56, VStackSheavesAndLisseCategories 113, CohomologyComparisons 158, HabiroCohomologyFoundations 159, HabiroRings 164) — except SpinRepresentations (F04). No `gap:` is declared. `RefinedTraceMethods` is absent from the branch's `merge-order/ORDER.txt` (147 lines) but present at line 165 of `main`'s; the gate run from the clone printed
  ```text
  depcheck: 9 roadmaps, 88 edges, 0 problem(s)
  ```
  with exit code 0 and no UPWARD or CYCLE line.
- Policy: title lower-case with no proper names; `import Mathlib` only; no `set_option`, no `lemma`, no `def := sorry`, no LaTeX delimiters; at most two proved examples per kept definition; no process words beyond those already raised by pass a.
- Not re-raised (pass a, F01–F17): continuous K versus connective K (F01), pull-request URLs in supplier links (F02), the Lean catalogue and the undocumented identity example (F03), the NodeAlgebra duplication (F04), missing Lean mirrors of Checks (F05), the DGAInfinity properness qualification (F06), the finite-coefficient base-change bridge at p = 2 (F07), two prerequisites after their consumers (F08), the Beilinson weight shift Check (F09), the missing `sources.toml` (F10), stale process labels (F11), the p-complete embedding's unit (F12), π₀(BU) (F13), commutativity in §8.3/§8.5 (F14), the NS II.2.4 / MW 2.15–2.17 / BMS 4.29 / Keller page locators (F15), definition-restating Checks (F16), the Banach almost-module ring hypothesis (F17).

## Not verifiable

- Supplier contents: the cited sections and declaration names of AInfCohomology §AI.7.2, PrismaticCohomology I–III, CohomologyComparisons §3.7, TopologicalKTheory T1–T5, CharacteristicClasses C3/C5/C6, HabiroRings HR.1–HR.5, HabiroCohomologyFoundations Layers 1–5 (§§1.14, 1.17, 4.1–4.28, 5.26), VStackSheavesAndLisseCategories VS2, KTheoryLowDegrees, K2SymbolsBrauer and GeneralAlgebraicKTheory were not read at their heads; only their existence and position were checked.
- Six cited works were not located in the cache and were not fetched: D-thesis page numbers, Stacks Tag 07L7, May, Ke's unnumbered "Theorem" cited as "Theorem 2.4", WG Theorem 0.1 (OCR scan without the introduction page), Co "Main theorem 0.1" (its displays (5)–(6) were found).
- The full coherent constructions of Layers 2–8 (Barwick–Glasman model theorem, light solid foundations, framed Čech resolution multiplicativity, global Adams gluing, Theorem 5.63's limit identification) were checked only through degenerate instances and locators, not reproduced.
- `GeneralAlgebraicKTheoryPartII` and `ChromaticHomotopyTheory` (named as consumers) exist nowhere on `main`, in the order, or among open pull requests; as consumers this is not a defect of the package.

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6394296888 -->
Review (claude) of 0e276b6

Verdict: needs changes

1. **F01** (P2) Suggested.lean states an input lemma of the Layer 9 headline

   - **Location:** `packages/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` lines 117–135, `isogenyClass_descends_intersection`. README line 13 calls it the "native-carrier headline signature", and line 1488 calls it "The acceptance signature".
   - **Claim:** Xie–Yuan Proposition 3.2, descent of an isogeny class to the intersection of two constant fields, is one of the roadmap's headline theorems.
   - **Witness:** According to xy-2022 lines 459–461, the main result of XY §3 is Proposition 3.1. Proposition 3.2 (line 478) is a field-of-definition tool for Corollary 3.5 and Proposition 3.6 (lines 611–622). The README chain is §9.3 → §9.5 → §9.6 → §9.9 → §9.19 (XY Theorem 1.1).
   - **Why it blocks:** No single tactic closes it (the probe failed). It is still an input lemma of the headline §9.19, which is not statable at the pins, and the docstring already says so. Under the standing rule, an input lemma in Suggested.lean is padding and blocks.
   - **Repair:**
     - Delete the declaration, its `/-! ## Layer 9 … -/` header and `import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`.
     - Delete the docstring sentence "Intersection-field descent of abelian isogeny classes is statable on the native abelian-variety and intermediate-field carriers."
     - README line 13: end the sentence at "the linear-algebra argument is a supporting result".
     - Delete the "acceptance signature" paragraph of §9.3 (line 1488). §9.3 stays a prose target.
     - Tested: the file without the declaration and the import elaborates, with `sorry` warnings only.

2. **F02** (P2) The rational-point bound is weaker than what the roadmap proves and the pins can state

   - **Location:** Suggested.lean lines 99–101: "(g d : ℕ) (hg : 2 ≤ g) (hd : 1 ≤ d) : ∃ B : ℕ, 1 ≤ B ∧ ∀ (F : Type u) [Field F] [NumberField F], Module.finrank ℚ F ≤ d →". Also README §6.12, line 1211.
   - **Claim:** The uniform bound for #C(F) is stated with a constant B(g, d) that depends on the field degree.
   - **Witness:** README §6.8 (line 1143) proves #C(K) ≤ c(g)^(1+rk) for every number field K, and line 1217 says the Mordell–Lang theorem removes the dependence on d. kuhne-2021 lines 330–333 derive this degree-free bound from Kühne's Theorem 4. The degree-free statement elaborates at the pins.
   - **Repair:**
     - Make the binders `(g : ℕ) (hg : 2 ≤ g)` and delete `Module.finrank ℚ F ≤ d →`.
     - Docstring: say the bound is B(g)^(1+ρ) for every number field (Kühne, Theorem 4 and the remark after it), which implies Dimitrov–Gao–Habegger Theorem 1.1.
     - README line 1211: say the acceptance theorem states the degree-free bound of §6.8. §6.12 keeps DGH's degree-dependent bound, with polynomial growth in d, as a prose target.
     - Add an API bullet to §6.8 naming `uniform_rationalPoints_curves`.
     - Tested: the restated declaration elaborates (`sorry` only).

3. **F03** (P2) A §5.2 Check is false: O_E(4·0) is a fourth power

   - **Location:** README line 862: "Symmetric ample bundles which are not powers `M^{⊗k}`, k ≥ 3, can still be projectively normal (for example O_E(4·0))".
   - **Claim:** O_E(4·0) is a symmetric ample bundle that is not of the form M^{⊗k} with k ≥ 3.
   - **Witness:** O_E(4·[0]) = O_E([0])^{⊗4}, so k = 4. More generally, since Pic⁰(E) is divisible, every line bundle of degree d on an elliptic curve is the d-th power of a bundle of degree one. No elliptic example can exist.
   - **Repair:** Replace the Check with: "O_E(2·0) = O_E(0)^{⊗2} is symmetric and ample but not very ample: its two sections give a 2:1 map to ℙ¹, so k = 2 does not suffice. O_E(3·0) = O_E(0)^{⊗3} embeds E as a plane cubic, which is projectively normal." Tested: h⁰(O_E(2·0)) = 2 with map degree 2, and h⁰(O_E(3·0)) = 3 with a plane cubic image.

4. **F04** (P3) The new nef gap asks for more than Layer 9 uses, and §9.17 omits its nef input

   - **Location:** README line 48 (`gap:nef-effective-cycle-nonnegativity`, a slug the repair created), line 1565 (§9.8 route), lines 1719 and 1726 (§9.17 route and *Needs:*), line 1765 (Layer 9 Dependencies), and `design/plan.json` gaps.
   - **Claim:** §§9.8 and 9.17 need a general theorem from SchemeAndStackFoundations: nef bundles meet effective cycles nonnegatively.
   - **Witness:**
     - §9.8's step (xy-2022 lines 703–705) uses an ample L and a pulled-back ample M.
     - §9.17's step (lines 1014–1016) uses XY Lemma 4.1(4).
     - AbelianSchemesAndArithmeticModuli A2.7 `ampleIntersectionPositive` and A2.9 `nefNormalizedLines` (XY Lemma 4.1(2)–(4), with nef classes as explicit limits of ample ℚ-classes) supply both.
     - §9.17's *Needs:* cites neither section.
   - **Repair:**
     - §9.8: cite AbelianSchemesAndArithmeticModuli A2.7, with SchemeAndStackFoundations §§4.13, 5.3 for cutting by general members of the base-point-free |π^*M|.
     - §9.17: add to the route "aℒ_ℬ − h^*ℒ_{𝒜′} is nef (AbelianSchemesAndArithmeticModuli A2.9), and ample intersections are positive (A2.7)".
     - Add AbelianSchemesAndArithmeticModuli A2.7, A2.9 to the *Needs:* of §§9.8 and 9.17.
     - Delete the slug from line 48, line 1765 and plan.json `gaps`.

5. **F05** (P3) Five citations rewritten in the repair point to the wrong section

   - **Locations (current text → correct section):**
     - Line 505 (§2.6), "bounded below off the base locus of that section (HeightsRationalPointsAndObstructions §0.16)" → §0.17.
     - Line 824 (§5.1), "The Néron–Tate pairing (HeightsRationalPointsAndObstructions §0.16)" → §0.21.
     - Line 1071 (§6.3), "directions B of bounded degree (HeightsRationalPointsAndObstructions §5.8, …)" → §§5.4a–5.4b.
     - Line 1116 (§6.6), "(HeightsRationalPointsAndObstructions §5.18, Ueno locus: …)" → §§5.4a–5.4b.
     - Line 724 (§4.4), "Apply §2.7" → "Apply §2.8".
   - **Witness:** In the parent at its open head, the headings are:
     - §0.17 "Lower bounds off the base locus"
     - §0.21 "The symmetric bilinear form"
     - §5.4a "Bounding maximal coset directions"
     - §5.4b "Finitely many bounded abelian directions"
     - §5.8 "Uniformity in families", about torsion closures
     - §5.18 "Bogomolov over number fields"

     §2.7 assumes a regular base. S′ in §4.4 is a reduced component of a closure, and §4.4's own *Needs:* lists §2.8.
   - **Repair:** Replace each citation as listed above.

6. **F06** (P3) Locator and manifest slips

   - **Locations and repairs:**
     - Line 2064, "dky-2020 line 41, Theorem 1.1, p. 949": should be p. 950. dky-2020 line 40 is the running head 950.
     - Line 147, "dgh-2021 line 1137, §6.1, p. 25": should be line 1241. Line 1137 opens §6.1 on p. 23, while the degree convention is at line 1241 on p. 25.
     - `sources.toml`: dky-2020 `cited_for` lacks "Section 3.6" (Remark 1.2 is cited at line 657). kuhne-2021 lacks "Section 12.4" (line 2103 cites the remark after Theorem 2). Add both.

7. **F07** (P3) Prose and Check defects

   - **Locations and repairs:**
     - Line 2072, a residue of the repair: "Stoll’s curve the bielliptic genus-two curve in DKY Remark 1.2, which is bielliptic, has 34 torsion points". Replace with "Stoll’s bielliptic genus-two curve (DKY Remark 1.2) has 34 torsion points on its Weierstrass Abel–Jacobi image, so B ≥ 34."
     - Line 1724, "which is all §5.3 uses": this means XY §5.3, but this roadmap's §5.3 is the c_NT bound. Write "§9.18".
     - Line 1415 is a Check that only comments on the source ("This is a sketch in the source …") and tests nothing. Delete it; §8.5 is a theorem and keeps one Check. In the same spirit, delete "The source calls this a sketch;" at line 1425.
     - Lines 194, 884, 900, 930, 945, 1054, 1828 and 1843 contain ".;". Use ";".
     - Blank lines split the Checks lists after lines 655, 1153 and 1779, and the References list after line 2131. Remove them.

Seven findings: three blocking (R01–R03, all P2) and four non-blocking (R04–R07, all P3). Of the 14 round-1 findings, 13 are repaired and F09 is partly repaired (R05). Files reviewed: `packages/HeightsRationalPointsAndObstructionsPartII/README.md` (2137 lines), `Suggested.lean` (137 lines, 4 declarations), `metadata.toml`, `sources.toml` (16 entries) and the `gaps` list of `design/plan.json`. I compared the README with the round-1 package (8a8594b) word by word and gave every changed passage an adversarial pass.

## Verified sound

### Round-1 findings, one by one

| Id | Status | Repaired passage (quoted, ≤ 40 words) and check |
|---|---|---|
| F01 | repaired | Suggested.lean line 78: "theorem uniform_mordellLang_curves (g : ℕ) (hg : 2 ≤ g)". The three curve theorems elaborate. Sign Check at line 655: a(Q)·a(Q)⁻¹ = 1. The degree form of the third theorem is refined by R02. |
| F02 | repaired | Line 58: "take the arithmetic intersection of r+1 copies of O(1), with the Fubini–Study metric at infinity … divided by [K:ℚ]". This matches the parent §5.9b API and its Check ([1:2] ↦ ½ log 5). The Galois-invariance and Northcott claims are gone. |
| F03 | repaired | Line 46: "§§4.11, 4.13 supply blow-ups of pencil base loci and Bertini". On main, SchemeAndStackFoundations §4.11 is "Modifications and strict transforms" and §4.13 includes Bertini. No §4.4 citation remains. |
| F04 | repaired | Line 699: "D_M(C^(M+1))=(C−P)^M=E₀^M … the counted set is empty: 0≤84(g−1)=0". Recomputed. |
| F05 | repaired | Line 1061: "P=(2,μ). The equation gives 2·1·(2−λ)=μ²". At λ = 2, P has order 2. Generic non-torsion follows from constancy of the order over connected V. |
| F06 | repaired | Line 2117 no longer names ArithmeticDynamicsPartII. |
| F07 | repaired | Lines 48, 50 and 133 give two intersection slugs and a four-item tropical contract with Yamaki locators. The README and plan.json `gaps` match string for string for all 5 slugs. R04 comments on the new nef slug. |
| F08 | repaired | The Rémond (lines 187/223), Masser (line 127), Yuan (lines 1043/2387), ArithmeticDynamics §6.64, §2.8 and §7.3 locators all verify. The sextic equations are gone. One residue is R07, at line 2072. |
| F09 | partly repaired | No RP/SF/DY/JC/UB/AH labels remain (grep). Five replacements point to the wrong section (R05). |
| F10 | repaired | All seven broken clauses are completed. "c₅ chosen strictly larger" appears at line 943, and "d_y=codim … Z_y" at line 1775; the latter matches yuan-2026 lines 2235–2238. |
| F11 | repaired (differently) | §0.2, §8.1 and §11.1 now exist, "former" is gone (line 1694) and the source commentary is removed. The errata went into the fix report because `sourceIssues` is not editable; that reason is sound. The leftover at line 1415 is R07. |
| F12 | repaired | Lines 250, 494, 638, 1463 and 540 are corrected. |
| F13 | repaired | Line 207 states the result as `Metric.coveringNumber`, with the pinned lines (74, 288, 351, 43) verified. |
| F14 | repaired (differently) | yamaki-2018 lines 1540–1541 show that [22] is "Strict support …". Theorem E is at yamaki-strict-support line 104 (p. 3), Corollary 7.22 at line 1836 (p. 41) and Proposition 5.12 at line 1236 (p. 29). The new manifest entry is certified. |

### Lean form (elaborated)

- **Build:** `lake env lean` on `Suggested.lean`, run from the content checkout, exits 0. There are four warnings, all "declaration uses `sorry`" (lines 60, 78, 99, 122), and no errors. One `import Mathlib` plus two existing Tau Ceti modules. No `set_option`, `lemma`, sorry'd data or definitions.
- **Binder audit:** I ran `#check @…` on all four declarations. The elaborated types carry every hypothesis of their README statements; the only section variable is `universe u`.
- **One-tactic probe:** `first | rfl | infer_instance | simp | aesop` closes none of the four.
- **Derivation test:** `uniform_maninMumford_curves` follows from `uniform_mordellLang_curves` in six lines, taking ρ = 0, s = ∅ and Γ = `CommGroup.torsion`. That uses `Hom.commGroup` (Grp.lean:310) and `AbelianVariety.isCommMonObj` (Basic.lean:144). I counted it as a headline (Kühne Theorem 2), not padding. kuhne-2021 line 330 records the same specialisation.
- **Repair test:** the file repaired for R01 and R02 elaborates (three `sorry` warnings).

### Headline theorems

- **Stated (statable at the pins):** Kühne Theorems 2 and 4, and the uniform rational-point bound (R02).
- **Covered by another statement:** DKY Theorem 1.1 is the genus-two case of Kühne Theorem 2.
- **Not statable:** GGK Theorems 1.1, 1.1′, 1.2 and 1.3 need degrees and canonical heights. DGH Theorems 1.6 and B.1 need Betti forms. GH Theorems 1.1 and 1.4, XY Theorem 1.1 and Yamaki Theorem E need function-field heights and the trace. Yuan Theorems 1.1, 4.10 and 4.19 need adelic bundles. DKY Theorem 1.10 needs the diagonal-lift polarization. The module docstring names each of these with its missing carrier.

### Seeded sample (15 of 15 read at the locator)

- **§0.1:** matches ggk-2026 lines 332–335 (definition, p. 196) and (2.6) at line 361. The DGH locator slip is R06.
- **§1.7:** matches (3.9) at ggk lines 646–652, p. 203.
- **§3.2:** matches kuhne Theorem 1 at line 119, p. 3: a generic small sequence and compactly supported tests.
- **§3.5:** matches ggk Theorem 1.3 at line 165, p. 192, for the generating case. The extension to non-generating X via P₀ + Y′ and dimension induction checks out (threshold c₃ ≤ c″₃/4).
- **§3.6:** matches kuhne Theorem 2 at lines 242–249, over ℂ and for any degree-one D.
- **§5.5:** matches ggk Proposition A.2 at lines 1771–1787, p. 228.
- **§5.11:** matches ggk Proposition 7.2 at lines 1518–1560, pp. 222–223. The README's c₀ = max{1/c₁, c₃} corrects the source (see Source issues).
- **§6.4:** matches ggk Lemma 7.3 at lines 1580–1623, pp. 223–224.
- **§8.2:** matches gh Proposition 3.1 at line 512, p. 12, and Proposition B.3 at line 2730, p. 59.
- **§8.5:** matches gh Theorem A.3 at line 2603, p. 56.
- **§9.6:** matches xy Proposition 3.6 at line 588, pp. 15–16.
- **§9.7:** matches xy Lemma 3.7 at lines 626–638, pp. 16–17.
- **§9.17:** matches xy Proposition 5.4 at line 972, p. 25. The proof's prime-to-p restriction is at line 996.
- **§11.2:** matches yuan Lemma 4.8 at lines 2495–2499, p. 74, and the Picard criterion at lines 2525–2531, p. 75.
- **§12.2:** matches dky Theorem 1.1 at line 41. Its page is 950 (R06). The 34-point example is Remark 1.2, at lines 53–55.

### Supplier order and citations

- **Dependency check output:** `depcheck: 48 roadmaps, 552 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Citations resolved at the current heads:**
  - HeightsRationalPointsAndObstructions (open pull request): §§0.10–0.12, 0.16–0.35, 1.7–1.11, 5.1–5.19, 5.4a–c, 5.9a–f, 5.13c, 5.15, 5.17f.
  - SchemeAndStackFoundations (main): §§0.3, 0.8, 4.11, 4.13, 4.14, 5.1–5.6, 5.12.
  - TropicalAndBerkovichArithmetic (open pull request): §§6.2–6.4, 7.0.
  - ArakelovGeometryAndAbelianHeights (open pull request): §§1.14, 2.7, 3.4, 4.2–4.4, 5.5–5.8, 6.3.
  - ArakelovGeometryAndAbelianHeightsPartII (board design, merge-order line 269): §§3.1–3.3, 4.7–4.9, 5.1–5.5, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7. Its §12.4 also states the codimension exponent 1/d.
  - AbelianSchemesAndArithmeticModuliPartII (open pull request): B0.1–B0.2, B1.1–B1.5, B2.3, B2.13, B2.21–B2.23, B3.7–B3.9, B4.2–B4.6.
  - AbelianSchemesAndArithmeticModuli (open pull request): A1, A2.7, A2.9, A3, A6.
  - JacobianChallengePartII (open pull request): §§0.2–0.4, 1.1–1.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2.
  - PELModuli (open pull request): M5.1–M5.3, M6.9–M6.10.
  - NeronModelsAndSemistableAbelianVarieties (open pull request): §§1.1–1.10, 3.10, 3.13–3.14, 5.1–5.2.
  - ComplexComparisonPartII (open pull request): C5, C5.4.
  - AlgebraicModuliForArithmeticGeometry (open pull request): §§1.5–1.6, 2.1.
  - InverseGaloisAndArithmeticFundamentalGroups (open pull request): IG.2.
  - StableReductionPartII (board design): all seven quoted MC.4, MC.6 and MC.7 headings.
  - ArithmeticDynamics (open pull request): §§6.57–6.64, 6.93, 6.110–6.112. Its §6.111 Check "34 ≤ 16B" agrees with §12.2.
  - AlgebraicCurves and JacobianChallenge (main).
- **Resolver lead:** the resolver's only lead, ArakelovGeometryAndAbelianHeightsPartII, is a false positive. It is a board design and appears in the merge order.

### Declared gaps

All five slugs agree word for word between the README and plan.json, and each has a supplier earlier in the merge order.

- **flat-nonproper-intersection** matches XY Proposition 2.1 with its exact hypotheses (xy-2022 lines 262–282). It is statable in SchemeAndStackFoundations §5, not an open problem, and not present there.
- **arithmetic-interpolation** is absent from the parent; the parent's only "interpolation" is a polynomial grid in §5.9b.
- **controlled-polarization-embeddings** is precise.
- **abelian-tropical-measures** now names §§6.2–6.4 and 7.0. Each of its four items has hypotheses and a locator.
- **nef-effective-cycle-nonnegativity** is covered by R04.
- **Kleiman-type positivity:** the AbundanceStatement open pull request, Layer 4D item 2, has the top-power form only.

### Duplication and ownership

I ran `roadmaps grep` over main and all 352 open heads.

- **Lean names:** none of the four names is declared elsewhere.
- **Uniform Manin–Mumford / Mordell–Lang for curves:** no other owner. AbelianSchemesAndArithmeticModuliPartII B2.3 is uniformity inside one ambient abelian variety, a different object.
- **Other objects:**
  - "maximal nowhere-degenerate": found nowhere else.
  - "defined over … up to isogeny": found nowhere else.
  - Torsion multisections: also appear in AbelianSchemesAndArithmeticModuli A1.7 and A2.9, as restrictions there. §9.10's definition is a curve-base predicate that those sections use rather than redefine; R04 asks to cite them.
- **Mathlib:**
  - Covering numbers are cited (F13).
  - There is no uniqueness theorem for reduced row echelon form at the pin; `Echelon/Basic.lean`, `Pivot.lean` and `Decomposition.lean` were read. The README claim is correct.

### Shape

- Every layer 0–12 has `### Examples` and `### Dependencies`.
- Definitions touched by the repair keep at least three Checks: §0.4 has 4, §1.1 has 4, §9.1 has 3 and §11.1 has 3.
- No LaTeX, process words or pull-request numbers (grep).
- Note: `metadata.toml` holds only `topic = "math.NT"`. Its layout is the standard one and was not reviewed further.

### Library declarations opened at the pins

**Mathlib:**

- `Metric.coveringNumber` (Topology/MetricSpace/CoveringNumbers.lean:74). It infimizes over covers inside the set, using `IsCover`, which is `edist ≤ ε` (Cover.lean:47).
- `Metric.maximalSeparatedSet` (:288) and `Metric.coveringNumber_le_packingNumber` (:351, same ε).
- `Metric.IsSeparated` (MetricSeparated.lean:43). It is strict (ε < edist), so balls of radius r/2 are disjoint.
- `MeasureTheory.Measure.addHaar_closedBall` (EqHaar.lean:500), `EuclideanSpace` (PiL2.lean:111) and `Metric.closedBall` (Pseudo/Defs.lean:418).
- `Projectivization.logHeight` (Height/Projectivization.lean:51), `Matrix.IsReducedRowEchelon` (Echelon/Basic.lean:87) and `Algebra.trdeg` (AlgebraicIndependent/Basic.lean:45).
- `IntermediateField` (IntermediateField/Basic.lean:52), `Module.finrank` (Finrank.lean:61) and `Submodule.span` (Span/Defs.lean:46).
- `CategoryTheory.MonObj.Hom.group` (Monoidal/Cartesian/Grp.lean:58) and `Hom.commGroup` (:310).

**Tau Ceti:**

- `AbelianVariety` (AbelianVariety/Basic.lean:95). It bundles a group object, properness and geometric integrality.
- `AbelianVariety.dim` (:118), which is `topologicalKrullDim` and takes values in `WithBot ℕ∞`; `isCommMonObj` (:144); `baseChange` (:281).
- `AbelianVariety.IsIsogeny` (Isogeny.lean:61), meaning finite and surjective.
- `AbelianVariety.IsAlbanese` (Albanese.lean:84). Its fields are `comp_eq_one` and `existsUnique_fac`; it includes no curve hypothesis.

### Adversarial table

| Statement | Instances tried | Values computed (README side vs instance or source) | Result | Change |
|---|---|---|---|---|
| `uniform_maninMumford_curves` | g=1; X=ℙ¹; D=[Q]; ρ=0 reduction | g=1 excluded by hg; ℙ¹ has J.dim=0≠g; c=a(Q)⁻¹ gives a(Q)·c=1 (order 1), wrong sign gives a(Q)² (infinite order if a(Q) is); derivation from ML compiles | true | — |
| `uniform_mordellLang_curves` | ρ=0, s=∅; n=0; Γ=J(ℂ) | closure ∅=⊥ so condition is pⁿ=1, n>0, i.e. torsion; n=0 would admit every p; J(ℂ) has infinite rank, so no finite s exists and the case is vacuous; bound B¹=B | true | — |
| `uniform_rationalPoints_curves` | F=ℚ (d=1) vs a quadratic F (d=2) | constants B(g,1), B(g,2) vs Kühne's c(g) for both (kuhne lines 330–333); degree-free variant elaborates | weaker than statable | R02 |
| `isogenyClass_descends_intersection` | k₁=k₂=k; k₁=k₂=K⊋k | A=A₁, identity isogeny; second violates `hinter`; uniqueness by XY Lemma 3.3 (line 485) | true, input lemma | R01 |
| Conv. l.23 / contract l.58 / Check l.62 | [2:1] | Fubini–Study ½log 5 ≈ 0.805 vs coefficient log 2 ≈ 0.693; parent §5.9b Check [1:2] ↦ ½log 5 | consistent | — |
| Check l.63 | [1:0], [7:0] | 0 and 0; an unnormalized norm gives log 7 | ok | — |
| Check l.64 / Conv. l.23 | [1:1/(t²+1)] over ℝ(t), ℂ(t) | ℝ(t): place t²+1 of degree 2, valuation −1, gives 2; ℂ(t): 2+2=4, ÷2 = 2; without residue degree: 1 | ok | — |
| Check l.65 | double point cycle, height a | unnormalized 2a; normalized a | ok | — |
| Gap flat-nonproper (l.50) | B=ℙ¹×ℙ¹, g=pr₁, X=B, V=point | e=1, Y₂=∅, one fibre Z with m=1: [Z]=g*[V]·[X] | precise | — |
| Gap nef (l.48) | uses in §9.8, §9.17 | XY lines 703–705 ample; 1014–1016 Lemma 4.1(4) = AbelianSchemesAndArithmeticModuli A2.9; O(1)·[ℙ¹]=1>0 (A2.7) | broader than needed | R04 |
| Gap tropical (l.133) | good-reduction E; Tate E | torus rank 0 gives a point; rank 1 gives a circle; Proposition 5.12 at line 1236, p. 29; small-net argument at lines 1327–1338, p. 31 | precise | — |
| §0.1 (seeded) | line ∪ exterior point; line ∪ point on it; Abel curve g=2 | 1+1=2; 1<2; deg_Θ C=g=2 | ok | R06 locator |
| §0.4 (F13) | S=[−r,r], R=r; S=∅; ρ=0; separated set | 1≤3; 0; ≤1; #S₀≤((R+r/2)/(r/2))^ρ=(1+2R/r)^ρ | ok | — |
| §1.1 Check (F12) | E with O(3[0]) | χ(O(3n[0]))=3n; a point gives 1 and dimension 0 | ok | — |
| §1.7 (seeded) | E×{0}⊂E²; X=A; genus-2 Abel curve | Stab infinite; Stab A, not in S_gen; finite Stab, generating | ok | — |
| §2.2 route (F10) | ϑ with compact support K⊂Δ | extension by zero smooth; [2]^*θω=4θω | ok | — |
| §2.5 Check (F12) | d=2 | exponents 2 vs 4, difference 2 | ok | — |
| §2.6 route | citation | §0.16 (height machine) vs §0.17 (lower bound off base locus) | drift | R05 |
| §2.8 Check (F12) | route vs supplier | route imports ArakelovGeometryAndAbelianHeightsPartII §5.4; "independent" removed | ok | — |
| §3.2 (seeded) | S=pt, X=A; torsion section | Haar; (ω\|X)=0 is degenerate | ok | — |
| §3.5 (seeded, F12) | P−P₀; torsion coset | ĥ(P−P₀)≤2c₃+2c₃=4c₃≤c″₃; coset of positive dimension has infinitely many height-0 points | ok | — |
| §3.6 (seeded, F01) | D=[Q]; Stoll; g=1 | c=[x₀]−[Q]; c(2)≥34; E_tors infinite | ok | — |
| §4.2 Check (F04) | C=E₀+P₀ | D_M=E₀^M=(C−P)^M, so the count is 0=84(1−1) | ok | — |
| §4.4 route | S′ singular | §2.7 needs a regular base; Needs lists §2.8 | drift | R05 |
| §5.1 route | citation | §0.16 vs §0.21 (neronTateForm, unhalved b(P,P)=2ĥ) | drift | R05 |
| §5.2 Check l.862 | O_E(4·0) | equals O_E(0)^{⊗4}, k=4≥3 | false | R03 |
| §5.4 (F08) | locators | Théorème 1.1 at line 187 (p. 105); 1.2 at line 223 (p. 106) | ok | — |
| §5.5 (seeded) | P₀=P_i of norm 1 | ⟨P₀,P_i⟩=1≥1−1/c₄; norm difference 0 | ok | — |
| §5.8 (F10) | contradiction constant 10 | cutoff 20 avoids equality at 10 | ok | — |
| §5.11 (seeded) | c₁=1/4, c₃=2 | README c₀=4, so 1/c₀=1/4≤c₁; source max{c₁,c₃}=2 gives 1/2>1/4 | README ok | source issue |
| §6.2 Check (F05) | P=(2,μ) on μ²=2(2−λ) | 2·1·(2−λ)=μ²; μ=0 ⇔ λ=2, P=(2,0) of order 2 | ok | — |
| §6.3 / §6.6 routes | citations | §5.8 (torsion closures), §5.18 (Bogomolov) vs §§5.4a–5.4b (directions) | drift | R05 |
| §6.4 (seeded) | F=ℚ̄; rank Γ_v≤ρ | identity; c^{1+rk Γ_v}≤c^{1+ρ} since c≥1 | ok | — |
| §6.5 route (F10) | swap on E×E | ℤ(P,0) has rank 1; End·Γ₀ ∋ (0,P) gives rank 2 | ok | — |
| §6.8 Check (F01) | ρ=0 | s=∅ admits all torsion; B^{1+0}=B | ok | — |
| §6.12 (F01) | see R02 | DGH c(g,d) vs Kühne c(g) | weaker | R02 |
| §7.1 (F08) | locators | yuan Proposition 2.6 at line 1038–1043 (p. 31); §4.3.1 at line 2387 (p. 71), with ĥ=½ĥ_Θ | ok | — |
| §8.2 (seeded) | V₀=pt; constant A₀, diagonal | MM over K; dense torsion without product shape | ok | — |
| §8.5 (seeded) | k₀ a number field | Moriwaki height = Weil height | ok | R07 Check |
| §9.1 Check (F12) | Legendre, char 0 vs 2 | j=256(t²−t+1)³/(t²(t−1)²) has a pole at 0; Δ=16t²(t−1)²≡0 in char 2 | ok | — |
| §9.6 (seeded) | torsion X; C₀⊗K̄ with A constant | k_{A,X}=k in both | ok | — |
| §9.7 (seeded) | S=ℙ², u=y/x, v=z/x | trdeg k(u,v)=2, k(u)∩k(v)=k | ok | — |
| §9.8 route | positivity input | XY lines 703–705 use ample L and M | covered by AbelianSchemesAndArithmeticModuli A2.7 | R04 |
| §9.12 (F14) | locators | Theorem E at line 104 (p. 3); Corollary 7.22 at line 1836 (p. 41) | ok | — |
| §9.15 Check (F11) | elliptic curve through 0 | it is a subgroup; r=1 | ok | — |
| §9.17 (seeded) | subgroup X=B, t=0; char 2 | f⁻¹(0)={(0,0)} of height 0; order 3 is étale, order 2 excluded | ok | R04, R07 |
| §10.1 (F10) | {a,b,c}×C⊂C²; 3×3 grid | codim 1, deg 3: 3≤3¹ (1/m gives √3≈1.73); codim 2, deg 9: ≤3 | ok | — |
| §10.7 Checks (F11) | m=2; m=0 | coordinate heights ε/4 sum to ε/2<ε; empty sum 0 | ok | — |
| §11.2 (seeded, F11) | g=2, deg α=1 | shift 2α−ω; generic α=O(x) on C₀ is non-constant under finite [2]∘Abel | ok | — |
| §11.3 route (F10) | stratum T | dim T replaces dim S in base positivity | ok | — |
| §11.7 Check (F10) | x−α torsion | ĥ(x−α)=0 ≤ every positive threshold | ok | — |
| §12.2 (seeded) | 4 lifts × 4 preimages | 16 per coordinate; 16B₀≥34 needs B₀≥3 (48≥34) | ok | R06, R07 |
| Downstream (F06) | consumer list | no false consumer | ok | — |

## Not verifiable

- **remond-2000-decompte** (Lemma 3.1, Propositions 3.3–3.4): paywalled and settled as uncertified. I checked the GGK restatements instead: Lemma A.4 at ggk-2026 line 1823 and Propositions A.2–A.3 at lines 1771–1794.
- **david-philippon-2007** (Theorem 6.8, (6.41)): uncertified. I checked the GGK restatement (A.1) at ggk-2026 lines 1749–1751.
- **§5.4's explicit constants:** the values of c₁, c₂, c₃ in §5.4's route were not checked. Rémond's Théorème 1.1–1.2 constants are displayed formulas that the extraction drops (remond-2000-vojta lines 188–191, 223–225).
- **XY Proposition 3.2 proof:** I did not re-read the defect induction for dependent fields; round 1 checked it.
- **Ownership against open pull requests:** checked with `roadmaps grep` across all indexed heads. The two board designs (ArakelovGeometryAndAbelianHeightsPartII, StableReductionPartII) were read in the board checkout, which may lag their pull-request heads.

## Source issues

- **Misprint** in ggk-2026 at Proposition 7.2, proof, p. 223: the source sets c₀ to the larger of c₁ and c₃; it should take the larger of 1/c₁ and c₃, so that the cutoff 1/c₀ stays below the gap threshold c₁; affects the proof.
- **Misprint** in ggk-2026 at Theorem 1.3, p. 192: the source names both constants c₃; it should call the counting bound c₄; affects nothing.
- **Error** in ggk-2026 at §7.3, proof of Theorem 1.1′, p. 224: the source says the rank-ρ group Γ₀ may be chosen stable under End(A); it should drop that stability, since End(A)·Γ₀ can have larger rank (swap on E×E); affects nothing.
- **Misprint** in ggk-2026 at Proposition A.3(ii), p. 228: the source gives a strict bound for the degree of the exceptional set; it should be non-strict, as the Bézout count in its proof gives; affects nothing.
- **Gap** in xy-2022 at Proposition 5.4, pp. 25–26: the source states the conclusion for every torsion point off the jump locus; the proof uses an étale torsion multisection, so only orders prime to the characteristic are covered; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0e276b6", "job": "REV-PKG-HeightsRationalPointsAndObstructionsPartII~2", "model": "opus", "worker": "fable-rev94"} -->

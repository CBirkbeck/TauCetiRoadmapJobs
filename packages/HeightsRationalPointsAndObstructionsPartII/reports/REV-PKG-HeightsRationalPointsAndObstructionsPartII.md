<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1129#issuecomment-6383549144 -->
Review (claude) of 8a8594b

Verdict: needs changes

1. **F01** (P2) Three curve headlines that can be stated at the pins are missing from Suggested.lean

   Location: `Suggested.lean` lines 21–22: "Uniform Manin–Mumford, curve Mordell–Lang and the DGH rational-point bound lack general Jacobians with their Abel–Jacobi curve embeddings and point groups." README §3.6 (line 638), §6.8 (line 1132), §6.12 (line 1192).

   Claim: the docstring says these headlines need carriers that the pins lack.

   Witness: the pins have them. `TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese` (TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84) gives the Abel–Jacobi universal property. `CategoryTheory.MonObj.Hom.group` (Mathlib/CategoryTheory/Monoidal/Cartesian/Grp.lean:58) gives the group of points. TauCetiRoadmap/JacobianChallenge/Suggested.lean on main already uses this curve carrier.

   Repair: state Kühne Theorem 2, Kühne Theorem 4 and Dimitrov–Gao–Habegger Theorem 1.1 on the native carriers. Take the genus to be the dimension of the Albanese, `J.dim = g`. For an arbitrary degree-one D, add a translation `c` of the point group. Remove the docstring bullet, add these names to the README API bullets of §§3.6, 6.8 and 6.12, and keep §12.2 as a README target, since it is the g = 2 case of §3.6. Tested: the three statements below, written in a scratch copy, elaborate at the pins with `lake env lean` and give only `sorry` warnings. In the second one, a rank of at most ρ is written as division-hull containment.

   ```lean
   theorem uniform_maninMumford_curves (g : ℕ) (hg : 2 ≤ g) :
       ∃ c : ℕ, ∀ (F : Type u) [Field F] [IsAlgClosed F] [CharZero F]
         (X : Over (Spec (.of F))) [Smooth X.hom] [IsProper X.hom]
         [GeometricallyIntegral X.hom] (_ : topologicalKrullDim X.left = 1)
         (x₀ : 𝟙_ (Over (Spec (.of F))) ⟶ X) (J : AbelianVariety F) (a : X ⟶ J.toOver),
         AbelianVariety.IsAlbanese x₀ a → J.dim = g →
         {x : 𝟙_ (Over (Spec (.of F))) ⟶ X | IsOfFinOrder (x ≫ a)}.encard ≤ c := by
     sorry
   -- Kühne Thm 4: same binders, then
   --   ∀ ρ (s : Finset (𝟙_ _ ⟶ J.toOver)) (Γ : Subgroup _), s.card ≤ ρ →
   --   (∀ p ∈ Γ, ∃ n, 0 < n ∧ p ^ n ∈ Subgroup.closure s) →
   --   {x | x ≫ a ∈ Γ}.encard ≤ c ^ (1 + ρ)
   -- DGH Thm 1.1: [NumberField F] (Module.finrank ℚ F ≤ d), the whole point group in
   --   the division hull of `s`, and (Set.univ : Set (𝟙_ _ ⟶ X)).encard ≤ c ^ (1 + ρ)
   ```

2. **F02** (P2) The contract for parent §5.9b describes a height the parent does not define

   Location: README line 53: "Section 5.9b supplies the Chow coefficient height: … the absolute maximum-coefficient height of its projective Chow form. Its API is …, Galois invariance and Northcott for fixed n,r,D and bounded field degree." Checks at lines 57–59.

   Claim: the parent supplies a Chow-coefficient height that has Galois invariance and cycle Northcott.

   Witness: parent §5.9b (#1017 head) defines `projectiveCycleHeight`, the Fubini–Study arithmetic intersection divided by [K:ℚ]. Its API has no Galois invariance or Northcott, and its Check gives [1:2] the value ½ log 5. README line 23 also uses Fubini–Study.

   Repair: restate line 53 as the parent's `projectiveCycleHeight` (Fubini–Study, absolute) with exactly that API. Recompute Check 57 as [2:1] ↦ ½ log 5, giving log 2 only as the coefficient-height value under the parent's comparison. Delete the Galois-invariance and cycle-Northcott claims and Check 59. No target consumes them; a later target that needs them should own them with a locator.

3. **F03** (P2) SchemeAndStackFoundations §4.4 is cited for pencil blow-ups, but §4.4 is Schlessinger theory

   Location: README line 43, "§4.4 supplies blowing up a pencil base locus". The same `§§0.3, 4.4, 4.14, 5.1–5.6, 5.12` block appears in the *Needs:* lines 168, 184, 492, 538, 677, 1542, 1557, 1612 and 1711, and in the Layer 9 Dependencies (line 1750).

   Claim: SF §4.4 supplies the blow-up of a pencil's base locus that §9.7 uses.

   Witness: in SchemeAndStackFoundations/README.md on main, §4.4 (line 5195) is "Versality, hulls and Schlessinger's theorem". Blow-ups and strict transforms are §4.11 (line 5529), and Bertini is §4.13 (line 5644).

   Repair: in line 43, replace "§4.4" by "§§4.11, 4.13". In the *Needs:* lines of §§9.7–9.8, cite §§4.11, 4.13. In §§0.1, 0.3, 2.5, 2.8, 4.1, 9.11 and 9.17, remove §4.4 and trim the copied block to the sections each target uses (§5.12 Bézout, §§5.1–5.6 intersections).

4. **F04** (P2) The §4.2 Check about genus one is false

   Location: README line 690: "For an elliptic curve (g = 1) every point stabilizes C − P and the lemma fails".

   Claim: DGH Lemma 6.4 fails for genus one.

   Witness: take C = E₀ + P₀ with E₀ an elliptic subgroup. Then D_M(C^{M+1}) = E₀^M = (C−P)^M has dimension M. No proper Z ⊊ E₀^M contains (C−P)^M, so the counted set is empty: 0 ≤ 84(g−1) = 0.

   Repair: replace the Check with this true one: "For g = 1, D_M(C^{M+1}) = (C−P)^M = E₀^M, so the set is empty. Genus ≥ 2 makes the image (M+1)-dimensional and the stabilizer of C finite." Tested on C = E₀: the count is 0.

5. **F05** (P2) The §6.2 Check uses a non-torsion section of the Legendre family, and there is none

   Location: README line 1052: "For the Legendre family and Γ generated by a non-torsion section, specialization at a parameter where the section becomes torsion is not injective".

   Claim: the Legendre family has a non-torsion section over its λ-line.

   Witness: y² = x(x−1)(x−λ) is a rational elliptic surface with fibres I₂, I₂, I₂* (Euler number 2+2+8 = 12). By Shioda–Tate its rank is 10 − 2 − (1+1+6) = 0, so its Mordell–Weil group over ℚ̄(λ) is (ℤ/2)².

   Repair: base change to V: μ² = 2(2−λ) and use the section P = (2, μ). It satisfies 2·1·(2−λ) = μ² and is non-torsion (Masser–Zannier's example). Restate the Check over V.

6. **F06** (P2) The README names an earlier roadmap as a downstream consumer, and that roadmap does not consume it

   Location: README line 2099: "ArithmeticDynamicsPartII consumes the Chow-height convention and product-set lemma for its bifurcation programme".

   Claim: ArithmeticDynamicsPartII consumes §0.3 and the height convention.

   Witness: ArithmeticDynamicsPartII (board design README) is "Markoff dynamics over finite fields". `roadmaps grep` finds no citation of this roadmap anywhere. ORDER.txt places it at line 277, before this roadmap (line 291), so consuming it would be an upward edge.

   Repair: delete the sentence. Name a later consumer only if one cites §0.3.

7. **F07** (P2) Two declared gaps are compound or vague

   Location: README line 45 (gap:nef-nonproper-intersection) and line 129 (gap:abelian-tropical-measures). In `design/plan.json`, the tropical gap's `section` is "nonarchimedean abelian uniformization and canonical measures".

   Claim: each gap states exactly what the supplier must provide.

   Witness: the first gap bundles nef nonnegativity with Xie–Yuan Proposition 2.1, whose hypothesis is V ∩ Y_{e+1} finite inside V^sm (xy-2022 line 277), not "generic proper intersection". The second asks for four assertions "in the form used by Yamaki's reduction", naming no section.

   Repair: split the first gap into two slugs. (i) Nef line bundles L₁,…,L_d on a projective variety meet every effective d-cycle nonnegatively. (ii) Xie–Yuan Proposition 2.1 with its exact hypotheses: g : B → Y flat between smooth projective varieties over an algebraically closed field, X ⊆ B with g|X surjective, V ∩ Y_{e+1} finite and inside V^sm; conclusion Σ mᵢ[Zᵢ] ≤ g*[V]·[X] in CH_{dim V+e}(B)_ℚ. For the second gap, name a numbered target section of TropicalAndBerkovichArithmetic and list each assertion with its hypotheses and the locator in Yamaki's Theorem E paper it serves (see R14). Update `plan.json` and README lines 45 and 129 together.

8. **F08** (P3) Locator and cross-reference errors

   - Line 873 cites "remond-2000-vojta line 1110". Line 1110 is Théorème 7.1 (p. 149). Théorème 1.1 is at line 187 (p. 105) and Théorème 1.2 at line 223 (p. 106).
   - Line 1043 cites "masser-1996 line 617". Line 617 is the proof of Lemma 5.1 (p. 471). The Theorem is at line 127 (p. 459).
   - Line 1219 cites "yuan-2026 line 1234, §2.3, p. 33". Line 1234 is §2.3.3 on p. 37, which gives pull-back formulas. The invariant extension is at line 1043 (§2.2, Proposition 2.6, p. 31); the normalization is at line 2387 (§4.3.1, p. 71).
   - Line 133 attributes h_E = ĥ_Lattès/2 to ArithmeticDynamics §§6.57–6.63. That identity is in ArithmeticDynamics §6.64.
   - Line 11 says "Section 2.7 compares the general adelic export"; the comparison is §2.8.
   - The Check at line 1540 refers to "a polarization in the sense of §1.1". Polarizations are defined in §7.3 and the Conventions.
   - Lines 648 and 2054 attribute the equation y² = x⁶+130x³+13 to DKY Remark 1.2. The remark (dky-2020 line 53) gives Stoll's count of 34 but no equation. Cite Stoll for the equation, or drop it.

   Repair: correct each locator as listed.

9. **F09** (P3) Citations use invented labels instead of roadmap sections

   Location: "parent RP.0/RP.1/RP.5" on 34 lines (for example lines 446, 500, 585, 815, 1062, 1719), "SF.0/SF.5" (lines 147, 156, 530, 670, 1550, 1704), "ArithmeticDynamics DY.6" (lines 2042–2087), "JacobianChallengePartII JC2, JC5" (line 1828), "UB.2" (lines 526, 715), and "AH.5/non-degenerate-height-inequality" (line 526).

   Witness: the parent, SchemeAndStackFoundations, ArithmeticDynamics and JacobianChallengePartII number by "Layer k" and "§k.n". UB.2 and the slash node ids come from the plan.

   Repair: cite by roadmap and section. For example, "parent RP.5, Ueno locus" becomes HeightsRationalPointsAndObstructions §5.4, "DY.6" becomes ArithmeticDynamics §§6.110–6.112, and "UB.2" becomes §2.8.

10. **F10** (P3) Truncated sentences and undefined symbols

   Location: line 422 "as recorded in)."; line 530 "as in." and "(v)–(vi))."; line 877 "for some x_i to lie in Z_X"; line 1092 "is needed·Γ₀ can change the rank and is dropped)."; line 1945 "with dim T for dim S as in);"; line 2015 "Γ = torsion" (§11.9 has no Γ); line 934 uses an undefined "C₅"; line 1760 has an undefined exponent "1/d".

   Repair: finish or delete each sentence, and define C₅ and d (presumably c₅ and the fibre-power exponent m).

11. **F11** (P3) Process residue and source commentary in the README

   Location:
   - Numbering gaps: there is no §0.2, §8.1, §11.1 or §11.2.
   - Line 1679 refers to "the former non-subgroup elliptic example".
   - Source commentary appears in prose and Checks at line 624 ("as printed"), line 644 ("its printed proof lacks"), line 1012 ("this repairs"), line 1183 ("the paper says"), line 1475 ("the printed proof"), line 1700 ("the printed proposition allows"), line 1871 (Check "misprinted as π") and line 1935 (Check on "μ_N in clause (3)").

   Repair: renumber the subsections, remove "former", and move the source remarks into the errata register (the plan's `sourceIssues`). The Checks at lines 1871 and 1935 test nothing, so replace them with discriminating Checks.

12. **F12** (P3) Checks that are imprecise or test the wrong case

   - Line 245 tests r = 0, but §1.1 assumes r, d ≥ 1.
   - Line 489 says "2(d−1) is one less than" 2d; it is two less (one less power of N²).
   - Line 633 says "a positive-dimensional coset contains infinitely many torsion points". This fails for x + B with x non-torsion modulo B; say "torsion coset".
   - Line 1448 states the Legendre Check for every algebraically closed k. In characteristic 2 the discriminant 16t²(t−1)² vanishes, so add char k ≠ 2.
   - Line 535 says the two proofs are independent, while §2.8's own route (line 530) imports AH.5.

   Repair: correct each Check as indicated.

13. **F13** (P3) §0.5 does not cite Mathlib's covering numbers

   Location: §0.5 (lines 201–215) and the Mathlib contract (line 33).

   Witness: `Metric.coveringNumber` (Mathlib/Topology/MetricSpace/CoveringNumbers.lean:74) is exactly the count of closed balls centred in the set. `Metric.coveringNumber_le_packingNumber` (line 351), `Metric.IsSeparated` and `Metric.maximalSeparatedSet` cover the maximal-separated-set step. The volumetric bound (1+2R/r)^ρ is not at the pin.

   Repair: state §0.5 as `coveringNumber r S ≤ (1+2R/r)^ρ` for S ⊆ `closedBall x₀ R`, and cite these declarations in the contract and the *Needs:* line.

14. **F14** (P3) §9.12 relies on a restatement instead of the primary source

   Location: line 1620, "Yamaki Theorem 1.3 gives reduction from A to that part".

   Witness: yamaki-2018 line 216 restates its Theorem 1.3 as "Theorem E in [22]", which is Yamaki's earlier paper on the geometric Bogomolov conjecture with some degeneration. That paper is not in `sources.toml`.

   Repair: add that paper to the manifest with the Theorem E locator. Cite it in §9.12 and in the tropical gap's needs.

Files reviewed: `packages/HeightsRationalPointsAndObstructionsPartII/README.md` (2118 lines, 108 targets), `packages/HeightsRationalPointsAndObstructionsPartII/Suggested.lean` (68 lines), `metadata.toml`, `sources.toml`, and `design/plan.json` (the `gaps` list only). Seven blocking findings (all P2), seven P3 notes.

## Verified sound

- **Principles.**
  - `Suggested.lean` has a single `import Mathlib` plus one existing Tau Ceti module. It has no `set_option`, no sorry'd data, no `lemma`, no LaTeX, and no pull-request numbers or paths.
  - The README contains no algorithms.
  - The roadmap is a genuine Part II: the parent stops at qualitative Mordell–Lang (#1017 §5.13), number-field Bogomolov (§5.18) and fixed-variety equidistribution (§5.19).
  - Ownership was checked by object with `roadmaps grep`, across main and all 338 open roadmap pull requests, for "uniform Mordell", "uniform Bogomolov", "geometric Bogomolov", "new gap principle", "Hyp pack", "relative Bogomolov" and "Yamaki". The only hits are reference lists, so this roadmap is the owner. The name `isogenyClass_descends_intersection` is declared nowhere else.
- **Elaboration.**
  - `lake env lean` on `Suggested.lean` gives a single warning, `declaration uses sorry` (53:8), and no errors.
  - `#check @isogenyClass_descends_intersection` in a scratch copy shows every hypothesis of README §9.3 in the signature (single universe, `IsAlgClosed ↥k₁`/`↥k₂`, `k₁ ⊓ k₂ = ⊥`, `trdeg < ℵ₀`), with no section variables. No change was needed.
  - One-tactic probe (`simp`/`rfl`/`infer_instance`/`aesop`): none closes it, so it is not padding.
- **Dependency check output:** `depcheck: 34 roadmaps, 315 edges, 0 problem(s)` — there is no UPWARD or CYCLE line.
- **Seeded sample (15 of 15 read at their locators):**
  - §5.4: matches GGK Theorem A.1 (ggk-2026 line 1755, p. 227). Rémond's setting (line 162) requires a symmetric, projectively normal embedding.
  - §5.7: matches GGK Lemma A.4 (line 1823, p. 229).
  - §5.12: matches David–Philippon p. 643 (line 183, exponent (r+1)g^{5(dim X+1)²}; setting at lines 54–57 and 93–94, with h₀ from Théorème 1.4 at line 131).
  - §6.2: matches GGK Lemma 7.3 (line 1580, p. 224), Masser 1989 (Main Theorem and Scholium 1, lines 45–56) and Masser 1996 (Theorem, line 127).
  - §7.1: matches XY (1.1)–(1.3) (lines 43–65).
  - §7.3: matches XY (1.4), including independence of (S, M) (lines 78–84).
  - §8.4: matches GH Theorems 1.4 and 1.4′ (lines 151, 190).
  - §9.1: matches XY §3.1 (line 476).
  - §9.3: matches XY Proposition 3.2 (line 478). I checked the README's defect induction for dependent fields: δ′ = 2δ−d₁+a ≤ δ, equality forces a k-defined locus of dimension d₁−δ < d₁, and k₂ ∩ τk₂ ⊆ K ∩ τK ∩ k₂ = k.
  - §9.5: matches XY Corollary 3.5 (line 559).
  - §9.10: matches XY §4.1 (line 737).
  - §9.16: matches XY §5.2 (line 969). The README's codimension-2 argument checks out: dim Z + e + 1 ≤ dim A′ + e − 1.
  - §9.17: matches XY Proposition 5.4 (line 972; the prime-to-p restriction is at line 996).
  - §10.2: matches Yuan p. 82 (line 2763).
  - §10.6: matches Yuan §4.6.3 (lines 3383–3401).
  - Also read: GGK Theorems 1.2–1.3, A.2, A.3, 7.1 and Proposition 7.2; DGH Theorems 1.6 and B.1, Propositions 4.1–4.3, Lemma 6.4 and the proof of Theorem 1.1 with its remark on polynomial growth; Kühne Theorems 2–4; Yuan Theorems 1.1, 4.10, 4.19 and Lemma 4.8; DKY Theorem 1.1 and Remarks 1.2–1.3; Yamaki Theorems 1.3–1.5.
- **Library declarations opened at the pins (14):**
  - Mathlib: `EuclideanSpace` (PiL2.lean:111), `Metric.closedBall` (Pseudo/Defs.lean:418), `addHaar_closedBall` (EqHaar.lean:500), `Module.finrank` (Finrank.lean:61), `IntermediateField` (IntermediateField/Basic.lean:52), `Algebra.trdeg` (AlgebraicIndependent/Basic.lean:45), `Submodule.span` (Span/Defs.lean:46), `Matrix.IsReducedRowEchelon` (Echelon/Basic.lean:87; the Echelon files have no uniqueness theorem, as the README says), `Projectivization.logHeight` (Height/Projectivization.lean:51).
  - Tau Ceti: `AbelianVariety` (Basic.lean:95), `AbelianVariety.baseChange` (Basic.lean:281), `IsIsogeny` (Isogeny.lean:61; it requires finite and surjective), and `canonicalHeight` (CanonicalHeight/Basic.lean:119). The last uses the x-height, which is twice the (O)-height, so README line 39 is correct.
  - There is no general Néron–Tate or Faltings height on `AbelianVariety` at the pin, so the docstring's other "not statable" bullets are correct.
- **Cross-roadmap citations resolved (all sections exist):**
  - HeightsRationalPointsAndObstructions (#1017): §§0.10–0.12, 0.16–0.35, 1.7–1.11, 5.1–5.19, 5.9a–f, 5.13c, 5.17a–g.
  - ArakelovGeometryAndAbelianHeights (#1000): §§2.7, 3.4, 4.2–4.4, 5.5–5.8, 6.3.
  - ArakelovGeometryAndAbelianHeightsPartII (board design): AH.3–AH.13, §§3.1–3.3, 4.7–4.9, 5.1–5.5, 6.1–6.4, 8.4, 9.1–9.2, 12.1–12.6, 13.1, 13.7.
  - AbelianSchemesAndArithmeticModuli (#849): A1, A2 (A2.9 nefness), A3, A6 (A6.5, A6.25).
  - AbelianSchemesAndArithmeticModuliPartII (#1405): B0.1–B0.2, B1.1–B1.5, B2.3, B2.13, B2.21–B2.23, B3.7–B3.9, B4.2–B4.6.
  - PELModuli (#966): M5.1–M5.3, M6.9–M6.10.
  - ComplexComparisonPartII (#848): C5, C5.4.
  - StableReductionPartII (board design): MC.4, MC.6 and MC.7, with all seven quoted subsection titles.
  - JacobianChallengePartII (#1225): §§0.2–0.4, 1.1–1.4, 2.1–2.7, 3.2–3.13, 5.1–5.6, 7.1–7.2.
  - NeronModelsAndSemistableAbelianVarieties (#852): §§1.1–1.10, 3.10, 3.13–3.14, 5.1–5.2.
  - AlgebraicModuliForArithmeticGeometry (#853): §§1.5–1.6, 2.1.
  - InverseGaloisAndArithmeticFundamentalGroups (#850): IG.2.
  - SchemeAndStackFoundations (main): §§0.3, 4.14, 5.1–5.6, 5.12. §4.4 is wrong (R03).
  - ArithmeticDynamics (#1335): §§6.57–6.63, 6.93, 6.110–6.112 (but see R08).
  - AlgebraicCurves and JacobianChallenge on main.
  - The lead in `citations.md` (ArakelovGeometryAndAbelianHeightsPartII not found) is a false positive: that roadmap is a board package and sits at ORDER line 269.
- **Declared gaps.** All four slugs are declared identically in `plan.json` and the README. arithmetic-interpolation and controlled-polarization-embeddings are precise and minimal: the parent and ArakelovGeometryAndAbelianHeights lack interpolation and c_NT/h₁ control. The other two are covered by R07.
- **Shape.**
  - All 20 definitions have an API list and at least three Checks.
  - All 108 targets have a locator and a *Needs:* line.
  - Every layer has Examples and Dependencies.
  - Conventions are recomputed in the table below.
- **Adversarial pass.** 108 target rows and 6 convention rows, with computed values in the table below.

## Not verifiable

- remond-2000-decompte (Lemma 3.1, Propositions 3.3–3.4, Lemma 6.1) is paywalled and settled as uncertified. Their GGK restatements (Lemma A.4, Propositions A.2–A.3) were verified instead.
- david-philippon-2007 (Theorem 6.8, (6.41)) is uncertified. The GGK restatement (A.1) at ggk-2026 line 1750 was verified.
- Rémond's Vojta inequality: the explicit constants at line 187 (Théorème 1.1) and line 223 (Théorème 1.2) are formula images that the text extraction drops, so the values in §5.4's proof route (c₁ = c₂ = …, c₃ = …) could not be checked.
- The equation of Stoll's 34-point curve is not in DKY (see R08).
- Yamaki's Theorem E paper is not in the manifest and was not fetched (R14).
- The design's source issue E20 (whether XY's closure B is an abelian scheme) was not adjudicated. The README's Néron-model route avoids it.

## Source issues

- **Gap** in xy-2022 at Proposition 3.2, proof, pp. 13–14: the source says a model maps flatly and quasi-finitely onto S₁×S₂ with function field K; this needs k₁, k₂ algebraically independent; it should be supplemented by an argument for dependent intersecting fields (as in README §9.3); affects the proof.
- **Gap** in xy-2022 at Proposition 5.4, pp. 25–26: the source says every torsion t off the jump locus works, but the proof uses an étale multisection, so only orders prime to the characteristic; it should be restricted to prime-to-p torsion, which is still dense; affects the proof.
- **Misprint** in xy-2022 at Corollary 3.5, proof, p. 15: the source says the intersection k′∩k_A is a subset of the index set I; it should be an element of I; affects nothing.
- **Gap** in xy-2022 at Corollary 3.5, proof, p. 15: the source says it applies Proposition 3.2 inside an ambient field of possibly infinite transcendence degree; it should first pass to the algebraic closure of k′k_A, of finite degree; affects the proof.
- **Error** in ggk-2026 at §7.3, proof of Theorem 1.1′, p. 224: the source says the rank-ρ finitely generated Γ₀ may be chosen End(A)-stable; it should drop stability, since the swap on E×E sends rank-one ℤ(P,0) to rank two; affects nothing.
- **Misprint** in ggk-2026 at Theorem 1.3, p. 192: the source says both constants are c₃; it should name the cardinality bound c₄; affects nothing.
- **Misprint** in ggk-2026 at §7.1, (7.4), p. 221: the source says each covering ball holds at most c₀ points; it should be c₀^{rk Γ+1} by (7.1); affects nothing.
- **Misprint** in ggk-2026 at Proposition A.3(ii), p. 228: the source says the exceptional degree is strictly below (deg X)^{2 dim X}; it should be at most, which is what the proof gives; affects nothing.
- **Misprint** in yuan-2026 at Proposition 4.18, p. 100: the source says the pairing is pushed forward along π restricted to Y, π undefined there; it should be ψ∘ι; affects nothing.
- **Error** in yuan-2026 at Theorem 4.19, p. 101: the source says maximal variation (moduli map over K) suffices for function fields; a constant genus-two curve over S = Spec K refutes this; it should require maximal variation over the constant field k; affects a stated result.
- **Misprint** in yuan-2026 at §4.3.2, pp. 73–74: the source says k̄ embeds in K, and μ_N(k) appears for triples over F; it should be K̄ and μ_N(F); affects nothing.

## Adversarial table

Each row: target | instance tried | values computed (README side vs instance or source) | result | change.

| § | instance | values computed | result | change |
|---|---|---|---|---|
| Conv. l.21 | P with ĥ(P)=1 | ⟨P,P⟩=(4−1−1)/2=1; unhalved form gives 2 | ok | — |
| Conv. l.23 | [2:1] over ℚ, ℚ(i); FS | h=log 2 both; relative ℚ(i) 2log 2; FS ½log 5 | ok | — |
| Conv. l.23 | [1:1/(t²+1)] over ℝ(t), ℂ(t) | ℝ(t): pole deg 2 → 2 (1 without residue degree); ℂ(t): 2·1·2/2=2 | ok | — |
| Conv. l.25 | 𝔏_g=2L, genus-2 Abel curve | 𝔏⁴=8L: deg 8^r d → 8·2=16; ĥ_{𝔏⁴}=4ĥ_{L⁺} | ok | — |
| Conv. l.17 | 2x=s on E×E over E | T×_S T = {x′−x∈E[2]}: 4 components | ok | — |
| Contract l.53 | [2:1] in parent normalization | parent FS ½log 5 vs README "Chow height log 2" | drift | R02 |
| 0.1 | line ∪ point in ℙ²; on/off line | off: total 2, top-dim 1; on: 1 < 1+1 | ok | — |
| 0.3 | ℙ¹, M=2, Z=Δ; dim X=0 | \|Σ\|≤1, X′=pt deg 1; Z=∅ ⇒ Σ=∅ | ok | — |
| 0.4 | M=1 | B=deg C·deg Z+1 by Bézout | ok | — |
| 0.5 | ρ=0; ρ=1, R=r, S={−r,r} | bound 1; bound 3 vs needed 2 | ok | R13 |
| 1.1 | E×E, O(3·0)⊠O(3·0), Δ | deg Δ=3+3=6; translates Δ+(a,0), 1-dim | ok | R12 (r=0) |
| 1.2 | g=1 X=E; g=2 Abel curve | 8·1=8; 8·2=16 | ok | — |
| 1.3 | dim S=1, fibres curves | fibre square 3 vs absolute 4 | ok | — |
| 1.4 | translates E×{b} | point (0,b) cuts to 1 member | ok | — |
| 1.5 | S a point | X^m→A^m injective, m₀=1 | ok | — |
| 1.6 | X_s=A_s, dim S>0 | dim mg+dim S, real target 2mg < 2(mg+dim S) | ok (degenerate) | — |
| 1.7 | Abel curve; B proper; A | in; Stab=B; Stab=A | ok | — |
| 1.8 | S_gen=∅ | no components, vacuous | ok | — |
| 2.1 | Legendre level 2 | [−1] fixes level-2 structure; ℓ=3 rigid | ok | — |
| 2.2 | [2]^* | [N]^*θω=N²θω, N=2 → 4 | ok | — |
| 2.3 | N=1 | diagonal, F restricts to O(1,1) | ok | — |
| 2.4 | constant non-torsion section, d=1 | F¹=deg S̄ constant < κN² for large N | ok (degenerate excluded) | — |
| 2.5 | d=1 | (M)=deg(X→S)·deg M, N-free; exponent gap 2 not 1 | ok | R12 |
| 2.6 | c₁cd<κ | F^d ≥ κN^{2d} > d·c₁N²·cN^{2(d−1)} ≥ d c₁N²(M·F^{d−1}) | ok (Siu) | — |
| 2.7 | N²≥2c₀/c₁ | ĥ ≥ (c₁−c₀/N²)h −(c₂+c₀)/N² ≥ (c₁/2)h − … | ok | — |
| 2.8 | DGH B.1 hypotheses (line 1978) | not closed, S not regular: matches | ok | R12 (l.535) |
| 3.1 | S pt, X=A; torsion section | Haar; ω\|X=0 so no measure | ok | — |
| 3.2 | uniform form | enumeration: x_i avoids first i closed subsets ⇒ generic | ok | — |
| 3.3 | dim S=0 | Ullmo–Zhang case | ok | — |
| 3.4 | n=l/g!=2, dim X′=1 | c″₃·4, c″₂·4 | ok | — |
| 3.5 | P−P₀ threshold | ĥ(P−P₀)≤2c+2c=4c ≤ c″₃ iff c ≤ c″₃/4 | ok | R12 (coset) |
| 3.6 | g=1, D degree 1 | every point is ι_D(q); E_tors infinite | ok (g≥2 needed) | R01 |
| 4.1 | P of large height | h(C_s−P) unbounded; P_s chosen | ok | — |
| 4.2 | C=E₀+P₀ (g=1) | D_M=E₀^M, dim M; set empty, 0 | Check false | R04 |
| 4.3 | constants | c₃=2M/c, threshold grows with h | ok | — |
| 4.4 | dim S=0 | constant h_M: large c′₃ empties set | ok | — |
| 4.5 | normalization | deg_{𝔏⁴}=8^r d, ĥ_{𝔏⁴}=4ĥ_{L⁺} | ok | — |
| 4.6 | n=2, k=1 | factor n^{2k}=4 | ok | — |
| 4.7 | c′₁=c′₃=c″₃=1 | B=2, c₁=1/2, c₂=max | ok | — |
| 4.8 | GGK Thm 1.2 (line 150) | dim g, generating, deg ≤ d | ok | — |
| 4.9 | normalization | ĥ_{L⊗[−1]^*L}=2ĥ_L=ĥ_{Θ₂} | ok | — |
| 5.1 | division hull of ℤP; A_tors | rank 1, Γ_ℝ=ℝ; 0 | ok | — |
| 5.2 | definitions | c_NT ≥ 0, h₁ ≥ 0 | ok | — |
| 5.3 | GGK (A.1) | c_NT, h₁ ≤ c′max{1,h_Fal} | ok | — |
| 5.4 | GGK Thm A.1 | same hypotheses and bound | ok | R08 |
| 5.5 | GGK Prop A.2 | isolated, angle, norm conditions | ok | — |
| 5.6 | dim X=1 | ≤(deg X)² points; source "<" vs proof "≤" | ok (≤ kept) | — |
| 5.7 | dim X=0 | codim −1 excluded; h(X)=h(x) | ok | — |
| 5.8 | rk Γ=0 | no positive heights, count 0 | ok | R10 (C₅) |
| 5.9 | Weierstrass Abel curve, Γ={0} vs {0,T} | 1 ≤ 1¹; 2 > 1¹ | ok | — |
| 5.10 | 3 balls, c₀=2, ρ=1 | 3·2²=12 | ok | — |
| 5.11 | c₁=1/4, c₃=2 | c₀=max{4,2}=4 | ok | — |
| 5.12 | DP p. 643 (line 189) | (2^{34}h₀deg X)^{(r+1)g^{5(dim X+1)²}} | ok | — |
| 6.1 | X=A, g≥1 | X°=∅, count 0 | ok | — |
| 6.2 | Legendre over ℚ̄(λ) | Shioda–Tate rank 10−2−8=0; MW (ℤ/2)² | Check false | R05 |
| 6.3 | genus-2 curve | Ueno locus empty generically and fibrewise | ok | — |
| 6.4 | F=ℚ̄ | identity | ok | — |
| 6.5 | Γ=0 | ≤1 point, so c ≥ 1 is chosen | ok | — |
| 6.6 | X°=X | cosets are points | ok | — |
| 6.7 | Γ=A_tors | torsion cosets ≤ c | ok | — |
| 6.8 | arbitrary D | rank ≤ ρ+1, c^{2+ρ} ≤ (c²)^{1+ρ} | ok | R01 |
| 6.9 | general P₀ | Γ′ rank ≤ ρ+1 | ok | — |
| 6.10 | ρ=0 | Corollary 1.3 | ok | — |
| 6.11 | unbounded degree | roots of unity, height 0 | ok | — |
| 6.12 | ρ=0 | #C(F) ≤ c(g,d) | ok | R01 |
| 7.1 | X a point | (L̄\|x)/(1·1)=ĥ(x) | ok | R08 |
| 7.2 | dim X=1 | e₁ ≥ ĥ ≥ e₁/2 | ok | — |
| 7.3 | constant E₀, k≠𝔽̄_p | non-torsion constant point, ĥ=0 | ok | — |
| 7.4 | constant A, curve C₀ | C₀⊗K̄ special, not torsion | ok | — |
| 7.5 | torsion point | dense trivially | ok | — |
| 8.2 | constant A | all A₀(k)_tors rational, orders unbounded | ok | — |
| 8.3 | constant A, diagonal | dense torsion, not a product | ok | — |
| 8.4 | torsion multisection | ĥ=0, h(π) unbounded, excluded by X* | ok | — |
| 8.5 | special X | dense small points | ok | — |
| 8.6 | k₀ a number field | reduces to 8.4 | ok | — |
| 8.7 | char 0 | trace stable under constant extension | ok | — |
| 9.1 | Legendre, char 2 | Δ=16t²(t−1)²=0 | Check needs char≠2 | R12 |
| 9.2 | k algebraically closed | k-point of model exists | ok | — |
| 9.3 | k₁=k₂⊋k; dependent fields | hypothesis fails; δ′=2δ−d₁+a<δ | ok | — |
| 9.4 | line y=ax | RREF (1,−a), a∈k₁∩k₂=k | ok | — |
| 9.5 | constant A | k_A=k | ok | — |
| 9.6 | torsion X | k_{A,X}=k | ok | — |
| 9.7 | S=ℙ², ratios y/x, z/x | independent, intersection k | ok | R08 (§1.1) |
| 9.8 | constant E, K=k(E) | height >0 over k, 0 over k(E) | ok (inequality) | — |
| 9.9 | two pencils | k₁∩k₂=k | ok | — |
| 9.10 | zero section | order 1, degree 1 | ok | — |
| 9.11 | g=1, O(2·0) | [ℒ] ≡ 2[0] | ok | — |
| 9.12 | good reduction, trace 0 | 𝔪=A, t=0 | ok | R14 |
| 9.13 | reduction steps | hypothesis and conclusion preserved | ok | — |
| 9.14 | Abel curve through 0 | dim C_m=min(m,g); C_g=J | ok | — |
| 9.15 | X=B; genus-2 curve | r=1; r=2 | ok | — |
| 9.16 | dimension count | dim Z+e+1 ≤ dim A′+e−1 | ok (codim ≥ 2) | — |
| 9.17 | X=B, t=0 | f⁻¹(0)={(0,0)}, height 0 | ok | — |
| 9.18 | torsion coset | immediate | ok | — |
| 9.19 | constant A, Y⊗K̄ | special through the trace | ok | — |
| 10.1 | C×S, L̄ from C | infinitely many points once c₁h(y)>e₁(C) | ok | R10 (d) |
| 10.2 | k=ℝ, K=ℂ(t), point i | factors through Spec ℂ | ok | — |
| 10.3 | isotrivial y | deĝ=0 | ok | — |
| 10.4 | S=Spec k | geometric bigness | ok | — |
| 10.5 | thresholds | dim S, +1, +g (Yuan Thm 4.17) | ok | — |
| 10.6 | zero section | heights 0, property fails | ok | — |
| 10.7 | constant family over function field | not big over k | ok | R11 |
| 10.8 | S a point, g=2 | (1) m≥1; (4) m≥2; C−C=J | ok | — |
| 11.3 | C₀, α=O(generic point) | C isotrivial, pair not | ok | — |
| 11.4 | (C,α) constant | Pic[N] and Pic[2g−2] constant | ok | R11 |
| 11.5 | restriction to strata | potential bigness part (4) | ok | R10 |
| 11.6 | g=2, y=ω−2α | 2ĥ(2(x−α))=8ĥ(x−α) | ok | — |
| 11.7 | deg N on a curve | ≥1 | ok | — |
| 11.8 | p=2, 3 | levels 3, 4 prime to p | ok | — |
| 11.9 | constant pair | infinitely many height-0 points | ok | R10 (Γ) |
| 12.1 | ker Φ | (ℤ/2)², 3 nonzero, one per common branch value | ok | — |
| 12.2 | common-coordinate bound B₀ | ≤4·4=16 per coordinate; 16B₀≥34 | ok | R08 |
| 12.3 | translation by 2-torsion T | ĥ(x+T)=ĥ(x) for symmetric L_X | ok | — |
| 12.4 | finite ker Φ | order(w) ≥ order(Φ(w)) ≥ N | ok | — |

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8a8594b", "job": "REV-PKG-HeightsRationalPointsAndObstructionsPartII", "model": "opus", "worker": "fable-rev58"} -->

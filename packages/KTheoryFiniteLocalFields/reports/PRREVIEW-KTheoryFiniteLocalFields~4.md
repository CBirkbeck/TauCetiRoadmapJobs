# Review of KTheoryFiniteLocalFields (pull request #1281 at e987a1b)

**Verdict:** needs changes

## R01 (P2) — Browder products are asserted for K(𝔽_q) without the η-hypothesis their supplier needs

**Location:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` line 225, "Add the products supplied by Browder for every ℓ^ν, including 2, 3, 4 and 8, when positive even and negative homotopy vanish, in particular for K(𝔽q)"; line 290, ring "(ℤ/ℓ^ν)[β,ζ]/(ζ²)".

**Claim:** StableHomotopyKTheory §7.33 gives these products only when η·1 = 0 in π₁E, with extra conditions at moduli 3 and 4. For odd q, η·1 = [−1] ≠ 0 in K₁(𝔽_q), and at q = 3, modulus 2, no unital product exists.

**Witness:** §7.33 assumes η·1 = 0 and notes that K-book Scholium 2.8.1 omits it. For E = K(𝔽₃), i(η·1) = i[−1] generates π₁(E/2) = ℤ/2, so 2·id_(E/2) = i(η·1)β ≠ 0. A unital product would force 2·id = 0.

**Repair:** Replace the sentence by "Add StableHomotopyKTheory §7.33's products on E/ℓ^ν for ℓ^ν ∈ {2,3,4,8} under its hypotheses: πₖE = 0 for k < 0 and for positive even k, η·1 = 0 in π₁E, and its conditions at 3 and 4. K(𝔽_q) fails η·1 = 0 for odd q." In §1.6, state the rings (ℤ/m)[β,ζ]/(ζ²) and (ℤ/m)[β] only for m whose prime-power factors lie outside {2,3,4,8}; keep the other moduli additive. Add the Check "K(𝔽₃)/2 has no unital product: 2·id = i[−1]β ≠ 0."

## R02 (P2) — Moore's norm-residue identification is statable at the pins but stated only abstractly

**Location:** `TauCetiRoadmap/KTheoryFiniteLocalFields/Suggested.lean` lines 22–23, "The normalized norm-residue identification in Moore's theorem requires the full local norm-residue symbol"; line 78, `Nonempty (AddCommGroup.torsion (milnorK E 2) ≃+ Additive (CommGroup.torsion Eˣ))`.

**Claim:** README §3.5 (lines 636–643) makes h_E the identification of K₂(E)_tors with μ(E). The pinned Tau Ceti has the local symbol, so this is statable. The Lean replaces it with an abstract isomorphism.

**Witness:** At the pin, `TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean` declares `localSymbol` (line 320), `kummerCupPairing` (207) and `localSymbol_kummerClass_eq_zero_of_add_eq_one` (355). The statement below elaborates against them with `sorry` as the only warning.

**Repair:** Add `import TauCeti.NumberTheory.ClassFieldTheory.Local.Symbol` and the theorem below. Delete the docstring sentence quoted above. In README §3.5 name `moore_normResidue` next to `moore_localK2`. In "From Mathlib and Tau Ceti", cite `TauCeti.ClassFieldTheory.localSymbol`, `localSymbol_kummerClass_mul`, `localSymbol_kummerClass_mul_right` and `localSymbol_kummerClass_eq_zero_of_add_eq_one`, with the sign ε relating them to ClassicalArithmeticCompletion §1.14's symbol.

```lean
/-- §3.5, Moore: the exponent-`w` norm-residue symbol, `w = #μ(E)`, maps the torsion of
`K₂(E)` bijectively onto `ZMod w`. -/
theorem moore_normResidue (E : Type) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (w : ℕ) [NeZero w]
    (hw : w = Nat.card (CommGroup.torsion Eˣ)) (hwu : IsUnit (w : E))
    (ζ : E) (hζ : IsPrimitiveRoot ζ w)
    (tr : continuousCohomology 2 (TauCeti.ClassFieldTheory.muNRep w E) ≃+ ZMod w) :
    ∃ h : milnorK E 2 →+ ZMod w,
      (∀ a b : Eˣ, h (Submodule.Quotient.mk
          (PiTensorProduct.tprod ℤ (fun i : Fin 2 => Additive.ofMul (![a, b] i)))) =
        TauCeti.ClassFieldTheory.localSymbol (TauCeti.ClassFieldTheory.kummerCupPairing ζ hζ) tr
          (TauCeti.ClassFieldTheory.kummerClass E hwu a)
          (TauCeti.ClassFieldTheory.kummerClass E hwu b)) ∧
      Function.Bijective (h.comp (AddCommGroup.torsion (milnorK E 2)).subtype) := by
  sorry
```

## R03 (P2) — §§0.2, 0.4 and 1.9 restate objects that roadmaps on main own

**Location:** README line 147, "Construct it through KU cooperations and the evaluation pairing with Cont(ℤℓ×,ℤℓ)"; line 179, "Define `heightOneLocalize X` as localization at KU∧M(ℤ/p)"; line 381, "Construct `langTorsor` … L(g)=g⁻¹Frob_q(g) is a finite étale torsor".

**Claim:** Each object already has an owner on main, and this roadmap neither consumes nor cites it.

**Witness:** On main, EllipticCohomology E2.1–E2.2 (README 537, 557–563) owns height-one KU_p, its ℤ_p× action and cooperations C(ℤ_p×,ℤ_p). BordismFormalGroups F6.1 (line 555) owns L_E. ReductiveGroupsPartII RG2.3 (lines 61–62) is "single owner … of Lang's theorem" (`Lang.lang_surjective`).

**Repair:**
- Exact supplier contracts: add BordismFormalGroups F6.1 (L_E, K(1)-local category), EllipticCohomology E2.1–E2.2 (height-one E-theory KU^∧_ℓ, its ℤ_ℓ× action, cooperations) and ReductiveGroupsPartII RG2.3 (`Lang.lang_surjective`).
- §0.4: replace the defining sentence by "Write L_(KU/p) X for BordismFormalGroups F6.1's L_E X at E = KU∧M(ℤ/p)" and drop the restated API.
- §0.2: take ψ^u to be E2.2's action of u ∈ ℤ_ℓ×. Keep as targets only its agreement with GeneralAlgebraicKTheory §13.8a's ψ^k (k a positive integer prime to ℓ) and finite-stage continuity.
- §1.9: take surjectivity of g ↦ g⁻¹Frob_q(g) from `Lang.lang_surjective`. Keep as targets only the finite étale torsor structure, the classifying map and the base-change comparison.

## R04 (P2) — The Cohen–Witt coefficient embedding is DeformationAndDerivedPatchingAlgebra's target

**Location:** README line 851, "The embedding and presentation are proved here at this generality by the Cohen/Witt coefficient-ring theorem"; `Suggested.lean` line 90, `theorem exists_wittVector_coefficientEmbedding`.

**Claim:** DeformationAndDerivedPatchingAlgebra §1.10 owns coefficient lifting from a strict Cohen ring into a complete local target. It precedes this roadmap in the merge order (78 against 90), and this roadmap restates it as its own target and headline.

**Witness:** DeformationAndDerivedPatchingAlgebra §1.10 at its head: "Prove existence of strict Cohen rings … and compatible coefficient lifting into a prescribed complete local target"; "For a perfect residue field the untruncated Witt ring is strict".

**Repair:**
- Add DeformationAndDerivedPatchingAlgebra §1.10 to the supplier contracts.
- In §5.2, take the lift f : W(k) → A from §1.10 (C = W(k) for perfect k, target A). Prove injectivity here: ker f is 0 or (p), and p ≠ 0 in A. Keep the Eisenstein presentation and its API as targets.
- Delete `exists_wittVector_coefficientEmbedding` from `Suggested.lean`, along with its mentions in the module docstring (line 11) and README line 113.

## R05 (P3) — Supplier declaration names that the cited suppliers do not declare

**Location:** README lines 65, 71, 79, 93, 101, 103, 132, 509 and 569, for example "Its §8.12 (`localizationBoundary_DVR_valuation`)" and "The supplied `normResidueSymbol_mul_left`, `normResidueSymbol_mul_right` and `normResidueSymbol_one_sub_self`".

**Claim:** The cited sections exist and supply the mathematics, but these backticked names occur nowhere in the cited suppliers.

**Witness:** No occurrence in GeneralAlgebraicKTheory's README or Suggested.lean at its head: `finiteField_adamsInput`, `finiteGroup_KU_completion`, `finiteField_brauerLift`, `finiteFieldKGroups`, `finiteField_K4_vanishing`, `localizationBoundary_DVR_valuation`, `localizationBoundary_product`, `uniformizerLastSign`. Likewise none of the eight `normResidueSymbol*` names occurs on main or at the pins.

**Repair:**
- GeneralAlgebraicKTheory §§8.12, 8.13 and 13.8a–c, and ClassicalArithmeticCompletion §1.14: cite by section in prose and drop the names.
- §§3.1–3.2: consume the pinned `TauCeti.ClassFieldTheory.localSymbol` lemmas of R02.
- ClassFieldTheory: replace `kummerEquiv_mixed` and `cd_p_absoluteGaloisGroup_eq_two` by `kummerEquivOfCharZero` and `cohomologicalDimensionAt_absoluteGaloisGroup_eq_two` (its alias table, line 289/299).
- §0.1: replace `CompactCoefficients.Tower`/`limOne` by `TauCeti.ModuleTower`/`TauCeti.ModuleTower.limOne` (DerivedModuleAlgebra line 66).
- HermitianKTheoryOfPoincareCategories: drop the anchors `finite-even-multiplicative-l-tate` and `multiplicative-l-tate-base-change`, which do not exist.
- K2SymbolsBrauer link: change `#milnor-filtered-colimits` to `#filtered-colimit-compatibility`.

## R06 (P3) — About 90 backticked names of this roadmap's own targets that Suggested.lean does not declare

**Location:** README throughout, for example line 132 `compactTower_limOne_zero`, line 273 `frobenius_eq_adams`, line 533 `motivicCycles`, line 1381 `periodicEtaleK`.

**Claim:** A backticked name of this roadmap's own claims that Suggested.lean declares it. Of the README's own names, only the 8 declared ones are; about 90 others are declared nowhere.

**Witness:** `compactTower_limOne_zero` occurs in neither Suggested.lean, the pinned Mathlib and Tau Ceti, nor any supplier roadmap. The same holds for `augmentationKernel_compact`, `etaleEdgeOne` and `regularLocal_traceKernel`. The gate's stem heuristic misses these names.

**Repair:** Remove the code spans from every name of this roadmap's own that Suggested.lean does not declare. Keep a bold prose label where a consumer cites it, e.g. "**Shared higher-cycle foundations** (§3.0a)", so that the section citations by K3BlochGroups, MotivesAndAlgebraicCycles, PadicHodgeRegulators and EllipticKTheory stay valid.

## R07 (P3) — Locators that miss their target in the cited version

**Location:** README lines 1439/1450, "K-book Proposition VI.7.3(a) p.509", "(b)"; lines 669/748, "K-book V.4.2.2 p.399"; line 708, "citing Hesselholt96 Lemma 1.4.2".

**Claim:** Proposition VI.7.3 has no parts (a)/(b). V.4.2.2 is not on p.399. In the Hesselholt96 version the README fixes, Lemma 1.4.2 is a different statement.

**Witness:** KBOOK line 31035 states VI.7.3 as three unlabelled paragraphs. KBOOK line 23994, Open Problem V.4.2.2 (Goodwillie), is on printed p.401. HESS96 line 316: Lemma 1.4.2 is the Tate d¹ formula; dd=ηd=dη is (1.4.4), line 389, p.8.

**Repair:** Write "K-book Proposition VI.7.3, odd-degree paragraph, p.509" and "…, even-degree paragraph, p.509". Write "K-book Open Problem V.4.2.2 p.401". Write "Hesselholt96 (1.4.4) p.8, cited by HM03 as [16, Lemma 1.4.2]".

## R08 (P3) — A downstream consumer that does not consume this roadmap

**Location:** README line 1734, "HabiroRings uses the relative truncated-polynomial calculations of §5.17."

**Claim:** HabiroRings, at its open head, nowhere mentions this roadmap or truncated polynomial K-theory.

**Witness:** HabiroRings' README at the head of its open pull request contains neither "KTheoryFiniteLocalFields" nor "truncated".

**Repair:** Delete the sentence.

## R09 (P3) — The description's dependency list names twenty roadmaps the README never cites

**Location:** Pull-request description, "Dependencies (cited in the README by roadmap name and section; the Lean imports none of them). In open pull requests of ours: #1227 (StableHomotopyKTheory), … #1266 (HermitianKTheoryOfPoincareCategories)."

**Claim:** 20 of the 30 roadmaps listed, e.g. ResolutionOfSingularitiesCharacteristicZero, DiamondsAndVStacks, PerfectoidTowers, PadicPeriodRings, ReductiveGroupsPartII and NeronModelsAndSemistableAbelianVarieties, occur nowhere in the README.

**Witness:** `grep -c` over README.md gives 0 for each of those 20 names. It gives 1–13 for StableHomotopyKTheory, GeneralAlgebraicKTheory, CrystallineCohomology, SchemeKTheoryOperations, KTheoryLowDegrees, K2SymbolsBrauer, ArithmeticGaloisDuality, AInfCohomology, GeometryOfNumbersAndQuadraticArithmetic and HermitianKTheoryOfPoincareCategories.

**Repair:** "Dependencies (cited in the README by roadmap name and section; the Lean imports none of them), in open pull requests: StableHomotopyKTheory, GeneralAlgebraicKTheory, CrystallineCohomology, SchemeKTheoryOperations, KTheoryLowDegrees, K2SymbolsBrauer (§§5.4–5.8, 7.2, 9.11–9.18, 10.5–10.25, 11.1, 11.3, 11.8), ArithmeticGaloisDuality, AInfCohomology (§AI.7.2), GeometryOfNumbersAndQuadraticArithmetic, HermitianKTheoryOfPoincareCategories. Roadmaps on main are cited by name."

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| H1 `milnor_no_p_torsion` | 𝔽_p, n=0,1,2; 𝔽_p(t), n=1 | n=0: ℤ; n=1: x^p=1 ⇒ (x−1)^p=0 ⇒ x=1; K₂ᴹ(𝔽_p)=0. Probe: no Steinberg relations in degrees 0, 1 (proved) | true; `simp`, `exact?` fail |
| H2 `moore_localK2` | ℚ₂, ℚ₃, ℚ₃(ζ₃), 𝔽₂((t)) | torsion ≅ μ: {±1}, {±1}, μ₆; w=2,2,6,1; 𝔽₂((t)): D=K₂=range(1•) | true; normalized form missing (R02) |
| H3 `exists_wittVector_coefficientEmbedding` | ℤ_p, ℤ_p[ζ_p], W(𝔽̄_p); 𝔽_p[[t]]; Cohen ring of 𝔽_p(t) | ker is 0 or (p); CharZero excludes (p); 𝔽_p[[t]], imperfect residue excluded by `CharZero`, `PerfectRing` | true; owned by DeformationAndDerivedPatchingAlgebra §1.10 (R04) |
| H4 `localMilnor_uncountable` | n=1,2,≥3, both characteristics | n=1: E× uncountable; n=2: U(E); n≥3: KBOOK line 30922 (VI.7.1 p.507), HANDBOOK line 1054 | true |
| H5 `localMilnor_uniqueDivisible` | n=3,4; n=2 negative control | Hⁿ(E,−)=0 for n≥3; K₃ᴹ torsion is a quotient of ℤ/(w₂,m), killed (KBOOK 30940–30950); n=2: μ(E)≠0 | true; hn needed |
| §0.1 compact towers | ×2 on ℤ₂ vs ℤ; C₂ | ℤ: (1,0,1,0,…) forces x₀=Σ4ᵏ=−1/3∉ℤ; C₂: I²=2I, completion ℤ₂; HAINE line 413 (6.11 p.11) | holds |
| §1.1 coefficients and products | ℤ, 𝔽₃, 𝔽₅; K(𝔽₃)/2 | K₂(ℤ;ℤ/2)=ℤ/4 (KBOOK line 16333, p.280); K₂(𝔽₃;ℤ/2)=ℤ/2; K₁(𝔽₅;ℤ/4)=ℤ/4; η·1=[−1]≠0 in K₁(𝔽₃) | groups hold; products false at q=3, mod 2 (R01) |
| §2.3 integral torsion | ℤ₅, i=1,2 | K₁(ℤ₅) prime-to-5 torsion μ₄ ↔ ℤ/4; K₃(𝔽₅)=ℤ/24, reduction onto; K₂ᵢ(ℤ₅)/ℓ=0 by Bockstein count | holds (HANDBOOK Prop 58 line 1089) |
| §3.5 Moore and K₂(O) | ℚ₂, ℚ₃, ℚ₃(ζ₃) | K₂(ℤ₂)/U=ℤ/2 via {−1,−1}; {−1,5}=0 since −2²+5=1; K₂(ℤ₃)=U; K₂(O) torsion μ₃ | holds; KBOOK III.6.2.4 line 13434 |
| §4.0 foundations | trivial Hℤ, C_p; ℂ(j) | π₀ hfp ℤ vs Tate ℤ/p; ℂ(j)^{C_{p^a}} dim 1 iff p^a∣j | holds; V.4.2.2 page (R07) |
| §4.2 TR, F, TC | W₂(ℤ), p=3; 𝔽_p | R[2]=2, F[2]=8; on 𝔽_p R−F=0: ker ℤ/pⁿ, coker ℤ/pⁿ⁻¹; HM97A line 933 index n+1↔n | holds |
| §4.3 Connes operator | η action | HM03 lines 1148–1163: σ with hσ=id, cσ=0; d²=dη=ηd | holds; Hesselholt96 locator (R07) |
| §4.6 additivity | page check | HM03 Lemma 1.3.1 p.15, Thm 1.3.5 p.17, 1.3.9 p.19, 1.3.10 p.20, 1.3.11 p.21, Lemma 3.3.10 p.58 | locators exact |
| §4.7 resolution | hypotheses | HM03 line 743: extensions and kernels of epis; line 885: A noetherian, B an A-algebra, I-power homology | match |
| §4.8 log spectra | π₋₁ | sequence T(k)→T(A)→T(A|K): π₋₁T(A|K) sits between π₋₁T(A)=0 and π₋₂T(k)=0; j* ring, i!, ∂ module (HM03 line 973) | holds |
| §5.7 log trace maps | p=2, n=1 | HM03 Prop 2.3.1 line 1328: log DG ring iff p odd or n=1; dlog from Aut(A)=A∩K× (line 1356) | holds |
| §6.6 local edge | ℚ₂, ν=1, i=1 | H²(ℚ₂,ℤ/2)=Br[2]=ℤ/2, H⁰=ℤ/2; 2β₋₁=red{−1,−1}≠0 ⇒ ℤ/4 | holds; HM03 Thm 6.1.10 p.103 |
| §6.8 integral groups | ℚ₂ i=2 ν=1; ℚ₃ i=7 ν=1 | (ℤ/2)³ = ℚ₂×/□; ℤ/3⊕ℤ/1⊕ℤ/gcd(3,9)=(ℤ/3)² (exponent 3, so w_{i−1} bound needed) | holds; "(a)/(b)" (R07) |
| §6.11 equal char | 𝔽₃((t)), 𝔽₂((t)) | K₂=U₂⊕ℤ/2, K₃⊇ℤ/8; K_j(V;ℤ_p)=0, j≥2 (GH06 line 676); 𝔽₂((t)): K₂=U₂ | holds |
| §7.3 symbols after completion | ℚ₅; torsion x | (5,2)₄=ω(2), (2,5)₄=ω(3); c_v(x) torsion ⇒ in μ-part, h_v injective there | holds |
| R03 §0.2 vs EllipticCohomology E2.2 | h=1, k=𝔽_p | E₁: π₀=ℤ_p, stabilizer ℤ_p×, E_*E = C(ℤ_p×,ℤ_p)[u±] — same as completedAdams' route | duplicate |
| R03 §0.4 vs BordismFormalGroups F6.1 | E=KU∧M(ℤ/p) | L_E unit, exactness, idempotence = heightOneLocalize API | duplicate |
| R03 §1.9 vs ReductiveGroupsPartII RG2.3 | 𝔾_m over 𝔽_q | 𝔾_m: x↦x^{q−1}, étale μ_{q−1}-torsor; surjectivity is `Lang.lang_surjective` | duplicate core |
| R04 §5.2 vs DeformationAndDerivedPatchingAlgebra §1.10 | A=ℤ_p[ζ_p] | W(𝔽_p)=ℤ_p strict Cohen; §1.10 lift ℤ_p→A; injective as ker∈{0,(p)}, p≠0 | duplicate existence |

- Source locators checked against the text: 96, in KBOOK, HANDBOOK, HAINE, HM03, HM97A, NS (arXiv v2), HESS96, HESS05, GH06, CMM, FESENKO and WEIBELCHERN. Mismatches: R07 only.
- About 80 README Checks and worked values recomputed, e.g. κ(2) over 𝔽₇ =4, tame coordinates over 𝔽₅, w-values for ℚ₂/ℚ₃/ℚ₅(ζ₅), 𝔽₄ trace form [[0,1],[1,1]]; all hold.
- Library declarations: 75 `#check`ed at the pins, all resolve; `Perfection.teichmuller` needs `IsAdicComplete I R`, `CharP (R ⧸ I) p`. Opened Tau Ceti `ClassFieldTheory/Local/Symbol.lean` lines 207, 320, 339–355.
- Cross-roadmap citations: 94 section ids in 27 roadmaps located (main, Completed, open heads); all sections exist. Read in full here: GeneralAlgebraicKTheory §§8.12–8.13, 13.8a–c; K2SymbolsBrauer §§10.25, 11.3; SchemeKTheoryOperations §7.3a; StableHomotopyKTheory §§7.11, 7.28, 7.33; KTheoryLowDegrees §§14.1, 14.3; ClassicalArithmeticCompletion §1.14; ClassFieldTheory alias table; DerivedModuleAlgebra tower table; RefinedTraceMethods §4.17; EllipticCohomology E2.1–E2.2; BordismFormalGroups F6.1. Name drift: R05.
- `Suggested.lean`: elaborates; `sorry` is the only warning (5 theorems). `#check @` of all 8 declarations matches the README; no binder lost. The one-tactic probe closes none.
- Gate: every check passed. Depcheck: "depcheck: 223 roadmaps, 1984 edges, 0 problem(s)".
- Overlap check: read ArithmeticKTheory, SchemeKTheoryOperations, RefinedTraceMethods, K2SymbolsBrauerPartII, K2SymbolsBrauer, BordismFormalGroups, EllipticCohomology; owners: Milnor ring, residues, norms — K2SymbolsBrauer; Chern classes from higher K — SchemeKTheoryOperations §7.3a; motivic complexes, local K₂ symbol, local K-groups — this roadmap (cited by ArithmeticKTheory, K2SymbolsBrauerPartII); nilpotent trace comparison — this roadmap §4.4a (extended by RefinedTraceMethods §4.17); Bousfield localization — BordismFormalGroups F6.1 and height-one KU_p with ℤ_p× action — EllipticCohomology E2.2, both restated here (R03); Lang's theorem — ReductiveGroupsPartII RG2.3 (R03); Cohen coefficient lifting — DeformationAndDerivedPatchingAlgebra §1.10 (R04); RefinedTraceMethods (later in the merge order) also states genuine TR/TC and the NS formula, and cites §§4.0, 4.2, 4.4 as supplier.
- Source independence: 20 passages compared with 10 sources. None shares wording beyond formulas, standard names and statements of under a dozen words. Largest share: KBOOK, 78 of about 300 citations (HM03 72). Contents compared with KBOOK and HM03: independent. Layers 4–5 keep HM03's dependency order but not its arrangement: §4.5 ↔ HM03 §4 precedes §4.6 ↔ §1.3; §5.6 ↔ §3.4 precedes §5.7 ↔ §2.3.

## Not verifiable

- ATIYAHSEGAL (Theorem 2.1 pp.3–4, Proposition 4.2 p.10; §0.1): the Project Euclid DOI landing page has no PDF link, and its download URL returned a 5-line HTML page.

## Source issues

- **Error** in KBOOK at Proposition V.6.10, p.415: the source says K_*(E;ℤ/m) is free over ℤ/m[β] on 1 and z, taking K_*(𝔽_q;ℤ/m)=ℤ/m[β]; it should be free on 1, ζ, z, ζz, since odd classes ζβⁱ survive when m∣q−1; affects a stated result.
- **Error** in KBOOK at Proposition VI.7.1 and the lines before it, p.507: the source says K₂(E) is 𝔽_q× plus a uniquely divisible group and K₂(V)≅U₂; it should be μ(E), and K₂(V)≅U₂⊕μ_{p∞}(E); affects a stated result; corrected in print at the K-book errata, p.2.
- **Error** in KBOOK at the proof of Proposition VI.7.1, p.507: the source says w₂(E)=q²−1; it should be (q²−1)·w₂^{(p)}(E) in mixed characteristic, e.g. 24 for ℚ₂; affects nothing.
- **Error** in KBOOK at Scholium IV.2.8.1, p.282: the source says E∧P∞(ℤ/ℓ^ν) is a homotopy associative and commutative ring spectrum for ℓ^ν = 2,3,4,8 once even positive and negative homotopy vanish, applied to K(𝔽_q); it should be stated only when also η·1 = 0, with conditions at 3 and 4; it fails for K(𝔽₃) mod 2; affects a stated result.
- **Misprint** in KBOOK at Proposition IV.2.7, p.281: the source says π_m(X;ℤ/ℓ) is π_m(X;ℤ/q₁)×π_m(X;ℤ/q₁); it should be π_m(X;ℤ/q₁)×π_m(X;ℤ/q₂); affects nothing.
- **Error** in HANDBOOK at the paragraph before Theorem 61, p.165: the source says H¹(E,μ_{p^ν}^{⊗i}) ≅ (ℤ/p^ν)^d⊕ℤ/w_i⊕ℤ/w_{i−1} once ℓ^ν>w_i; it should be: once p^ν ≥ w_i and p^ν ≥ w_{i−1} (fails for ℚ₃, i=7, ν=1); affects a stated result.

## For the human reviewers

- Licence: the HANDBOOK chapter was read from a web.archive.org copy of faculty.math.illinois.edu/K-theory/handbook/1-139-190.pdf; the live institutional host timed out.
- Licence: README References link DFM and DM to ResearchGate uploads (lines 1754–1755), and Levine and the K-book errata to web.archive.org copies (lines 1743, 1745). Whether these copies are author-authorised was not checked.

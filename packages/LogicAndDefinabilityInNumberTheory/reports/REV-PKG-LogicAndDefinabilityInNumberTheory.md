<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6362322399 -->
Review (claude) of 08dd872

Verdict: needs_changes

1. **F01** (P2) Statable headline theorems are absent, and the docstring's reason for leaving them out is false

   **Location.** `Suggested.lean` lines 159–163: "O-minimal expansions, definable atlases and the counting theorems have no carriers at the pinned commits; their statements are in README.md." Layers 1–3 and 5 have empty section comments, and no docstring names a headline of those layers as not statable.

   **Claim.** The README's headlines include Pila–Wilkie (§6.25), the Ax–Kochen transfer between ℚ_p and 𝔽_p((t)) for large p (§1.5), and Igusa rationality of the local Poincaré series (§2.6). The file states none of them and says o-minimal counting has no carriers.

   **Witness.** The carriers are at the pins: `Set.Definable` (Mathlib/ModelTheory/Definability.lean:54), `FirstOrder.Ring.compatibleRingOfRing` (Mathlib/ModelTheory/Algebra/Ring/Basic.lean:223) and `TauCeti.IsSemialgebraic` (TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68). README §6.1 itself builds o-minimality on native `Set.Definable`. A scratch file with these three statements elaborated at the pin with only `sorry` warnings:
   - Ax–Kochen in the ring language: for every `φ : Language.ring.Sentence` there is `N` such that for every prime `p > N`, `ℚ_[p] ⊨ φ ↔ LaurentSeries (ZMod p) ⊨ φ`.
   - Igusa: for every prime `p` and `f : MvPolynomial (Fin m) ℤ`, there are `P Q : Polynomial ℚ` with `Q ≠ 0` and `Q · Σₙ #{x : Fin m → ZMod (p^n) | f(x) = 0} Tⁿ = P`.
   - Pila–Wilkie, using a 5-line predicate `IsOMinimalExpansion` (order, + and · definable; every definable subset of ℝ has finite frontier), the algebraic part built from `IsSemialgebraic`, and the maximum height `max |num| den`.

   **Repair.**
   - Add these three headlines to `Suggested.lean`, with the small definitions they need: the o-minimality predicate, the algebraic part through `TauCeti.IsSemialgebraic` (import `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic`), and the height.
   - In the module docstring, name each headline that is not statable and the carrier it lacks:
     - Denef–Pas relative elimination and AKE: three-sorted ac-valued structures;
     - Cluckers–Loeser integration: constructible motivic functions;
     - Hilbert's tenth problem over ℤ: a computable code type for polynomials;
     - the Layer 7 theorems: A_g with special subvarieties.
   - Delete the false sentence.

   Tested: the three statements elaborate under default options.

2. **F02** (P2) Layer 6–7 re-plans targets that AbelianSchemesAndArithmeticModuliPartII, earlier in the merge order, already states

   **Location.**
   - README §6.29 (line 2380, semi-rational counting with marked projection π₂β(0)∈π₂Σ).
   - §6.31 (line 2406, `axTypeTorusLemma` and its word-growth API).
   - §7.6 (line 2532, invariant subvarieties under monodromy).
   - Downstream consumers, line 2578: "AbelianSchemesAndArithmeticModuliPartII consumes §§6.31 and 7.6 with Ax's theorem".

   **Claim.** This roadmap claims to own these targets and to supply them to AbelianSchemesAndArithmeticModuliPartII.

   **Witness.** In `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md` (open head):
   - B2.6 (line 1326) is the same semi-rational block-counting theorem, including the parameter-uniform block decomposition.
   - B2.7 (line 1352) is the free-word growth.
   - B2.14 (line 1539) is the same torus lemma, with the same Ax-type definition.
   - B2.18 (line 1609) is the same statement as §7.6.

   Its scope says "B2 owns ... abelian Ax–Lindemann". It is listed before this roadmap in the merge order and does not cite this roadmap.

   **Repair.**
   - Delete §§6.29, 6.31 and 7.6. Alternatively keep a variant only where it differs, and say how in one clause.
   - Cite AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15 and B2.18 under Scope and ownership and in the supplier contracts.
   - Drop the parameter-uniform block decomposition from §6.27, or say how §6.27 differs from B2.6.
   - Remove AbelianSchemesAndArithmeticModuliPartII from Downstream consumers.

   Tested: AbelianSchemesAndArithmeticModuliPartII is in this job's list of allowed suppliers, so the new citations point downward.

3. **F03** (P2) Local integration only covers large residue characteristic

   **Location.**
   - README §2.6 line 748: "For each F in the fixed sufficiently large-residue-characteristic family this is a rational function".
   - §2.2 line 678: "no all-prime assertion is inferred".
   - §2.4 line 716: "in the source-scoped large-residue-characteristic family".

   **Claim.** Cell decomposition, constructibility of integrals and rationality of Z_f and of the Poincaré series are stated only for residue characteristic greater than N.

   **Witness.** Rationality holds over every p-adic field (Igusa; Denef's fixed-p cell decomposition). No target here states the fixed-p version:
   - The instance ℚ_2 with any f, for example f = x²+y², is covered by no target.
   - No other roadmap owns it: `roadmaps grep` for "Igusa zeta|local zeta function|Denef|p-adic cell decomposition" finds nothing on main or in the open pull requests.

   The principles forbid "good primes only".

   **Repair.** Add a target with its source: for every finite extension F of ℚ_p and every f over O_F, Z_f(T) and the Poincaré series are rational in T, with denominators ∏(1−q^{−a}T^b). Its route is fixed-p p-adic cell decomposition in the Macintyre language. Keep §2.6 as the uniform large-residue-characteristic statement. Tested: the all-p statement elaborates (R01 probe).

4. **F04** (P2) Relative elimination and AKE are narrower than their sources

   **Location.**
   - README §1.2 line 295: "a chosen surjective additive normalization ord:K×→Γ with Γ≡ℤ in Presburger language".
   - §1.3 line 321: "Over henselian Denef–Pas structures of characteristic (0,0)".
   - §1.4 line 337 (AKE in the same setting).

   **Claim.** Elimination of valued-field quantifiers and AKE are stated only for value groups elementarily equivalent to ℤ, in the Presburger language.

   **Witness.** The theorem in Cluckers–Loeser (`cluckers_loeser_2008` lines 349–359, Theorem 2.1.1) is for any henselian valued field with residue characteristic 0, any value group, and arbitrary expansions L_Res, L_Ord. Pas's (`pas_1989` lines 146–174, the conditions 2.4, and lines 680–682, Theorem 4.1) has the same scope. Instance: the Hahn field ℂ((t^ℚ)) is henselian, has residue characteristic 0, an angular component, and value group ℚ ≢ ℤ. The sources cover it; §§1.2–1.4 exclude it.

   **Repair.** State §§1.3–1.4 for H_ac,0 (henselian, residue characteristic 0, any ordered abelian value group, any expansions L_Res, L_Ord). Keep the ℤ-group/Presburger case as the specialization that Layers 2–3 use. Tested: ℂ((t^ℚ)) now satisfies the hypotheses.

5. **F05** (P2) Definable Remmert–Stein and Chow are missing the hypothesis that the structure expands R_an

   **Location.**
   - README §6.18 line 2210: "complex analytic and definable in the fixed o-minimal expansion (with the hypotheses of the chosen analytic-closure theorem), then A is algebraic".
   - §6.17 line 2198 places no condition on the structure.

   **Claim.** Both results are asserted for an arbitrary o-minimal expansion of ℝ.

   **Witness.**
   - Peterzil–Starchenko fix, for the whole paper, an o-minimal structure containing all restricted analytic functions (`peterzil_starchenko_agc` lines 197–199). Their Theorems 3.2, 4.1, 4.4 and Corollary 4.5, which §§6.17–6.18 cite, are proved in that setting.
   - The route of §6.18 goes through ShimuraVarieties §3.5d (its README line 852), which also assumes "an o-minimal expansion of R_an".
   - §3.5d already "constructs the required local ... extension arguments", which is the manifold case of §6.17.

   **Repair.** Put "o-minimal expansion of R_an" in both statements and delete the parenthetical. If the arbitrary-expansion case is wanted, add it as a separate target with a source that proves it. In §6.17, cite ShimuraVarieties §3.5d for the manifold case. Tested: with the added hypothesis, the cited theorems' setting matches.

6. **F06** (P2) §5.5 states a computational algorithm

   **Location.** README §5.5 line 1852: "every finite-level count N_n is computable by exhaustive enumeration with a checkable witness trace ... A witness search semidecides positive solvability; a timeout is not a proof of absence". Downstream line 2574: "The finite-level enumeration theorem exports checkable finite counts".

   **Claim.** §5.5 specifies enumeration procedures, witness traces and timeouts.

   **Witness.** The principles allow mathematical background but not computational algorithms; such content is blocking. The decidability boundary §5.5 points to is already §4.17 and §4.19.

   **Repair.** Delete §5.5, the Downstream sentence, and "preserving the distinction between finite computation and unrestricted decision problems" in How to read the build. Tested: nothing in the README cites §5.5.

7. **F07** (P3) The Dittmann–Pop branch of Layer 1 has no endpoint

   **Location.** README §§1.13–1.16, 1.19 and 1.20.

   **Claim.** These auxiliary lemmas are planned without the theorem they serve.

   **Witness.**
   - No `*Needs:*` line cites §1.14 (anchor `ld1-henselian-embedding-open`), §1.16, §1.19, §1.20, §1.10 or §1.7.
   - Their purpose is Dittmann–Pop's Theorem 1.3, Proposition 5.1 and Theorems 1.1–1.2 (`dittmann_pop` lines 44–77, 694–780), none of which is a target.
   - The last paragraph of §1.19 is a step in the proof of Lemma 5.3 (`dittmann_pop` lines 755–757), which is also not a target.

   **Repair.** Either add targets for Dittmann–Pop's Theorem 1.3 (uniform definability of geometric prime divisors, with its Kato/Kerz–Saito/Jannsen inputs named), Proposition 5.1 and Theorem 1.2, or delete the orphan lemmas. Move the avoidance paragraph to the target that uses it.

8. **F08** (P3) Locators into texts that do not contain the statement

   **Location.** README lines 117, 129, 155, 167, 193, 205 (§§0.1–0.6) and lines 380, 394, 476 (§§1.6, 1.7, 1.11).

   **Claim.** §§0.1–0.6 cite Dittmann–Pop "§1, Theorems 1.1–1.2 ... Facts 5.2" for the definition, semantics and composition of interpretations. §§1.6, 1.7 and 1.11 cite Dittmann–Pop "Proposition 3.2".

   **Witness.**
   - Dittmann–Pop do not define interpretations; they refer to [AKNS, §2] and [Sc, §2] (`dittmann_pop` lines 50–51, 768–769).
   - Their Proposition 3.2 is about isotropy of Pfister forms over henselian fields (`dittmann_pop` lines 257–270).
   - What §1.7 claims (the constant field is finite or a number field; K is the fraction field of a finitely generated domain) is used in the proof of Proposition 5.1, p.16 (`dittmann_pop` lines 697–702, 713).
   - Also: Proposition 3.10 has no part (a); the "a)" in question is an item in its proof on p.13 (line 568).
   - §4.32(c) attributes "Lⁿ∩K=Kⁿ for every positive n" to Koenigsmann. In the version I read the source proves only quadratic closure (`koenigsmann_defining_z` line 935, arXiv numbering Proposition 24(c)), so the n-th-power case is this roadmap's extension through §4.30.

   **Repair.**
   - Cite a model-theory text (AKNS §2 or Hodges, *Model Theory*, §5.3) for §§0.1–0.6.
   - Cite Dittmann–Pop p.1 for §1.6 and the proof of Proposition 5.1, p.16, for §1.7.
   - Cite Stacks and SchemeAndStackFoundations §§0.12–0.14 for §1.11 (see R14).
   - Say in §4.32 that the case n>2 goes through §4.30.

9. **F09** (P3) The sources manifest is missing, incomplete, and links copies that are not legal

   **Location.** The package folder had no `sources.toml`; the board copy records only the four waived works. References: lines 2593, 2600, 2602, 2617, 2625; links at lines 2598 and 2606.

   **Claim.** "Record every cited work in the roadmap's sources.toml."

   **Witness.**
   - About 40 cited works have no entry: Davis, Koenigsmann, both Cluckers–Loeser papers, Cluckers–Gordon–Halupczok, Pas, Dittmann–Pop, Kuhlmann–Novacoski, Colliot-Thélène–Van Geel, BKT, both GWZ papers, van den Dries–Miller, both Pila papers, Peterzil–Starchenko, Habegger–Pila, Tsimerman, Masser–Zannier, Gao–Habegger, Lawrence–Sawin, Bakker–Tsimerman, Mok–Pila–Tsimerman, Pila–Tsimerman, Gao, Cluckers, Lorenzini, Bosch–Lütkebohmert–Raynaud, Schneider, Stacks, Poonen, Freer.
   - Five References are cited nowhere in the body: Pas 1991, Bhatt–Mathew, the BKT erratum, Howe–Klevdal, and the Cluckers addenda.
   - The Davis "public scan" is a JSTOR download on a third-party course page.
   - The Pila–Wilkie "public author scan" sits in a third party's course directory.

   **Repair.** Record every cited work, delete the uncited references, and cite Davis and Pila–Wilkie by DOI (Pila–Wilkie is waived in the board manifest). This review's fetches added 15 entries to the package manifest.

10. **F10** (P3) Backticked names that Suggested.lean does not declare, and malformed code spans

   **Location.**
   - Every API bullet and every Check. Examples: line 105 `interpretation.domain`, line 1144 `toDiophPoly_C`, line 1235 `mvPolynomialEquiv_rename`.
   - Targets: `dualNeronPointCount` (830), `residueMotivicRealization` (1110), `normicZeroCycles` (1677), `roughCurveTest` (2140), `AxType` and `axTypeTorusLemma` (2406), `AgAndreOortInput` (2444), `ProductLocusInput` (2509), `MixedAndreOortInput` (2556).
   - Lines 1471, 1599 and 1842 put a name plus prose in one code span, for example "`universal_integers and rational_nonintegers_diophantine`".

   **Claim.** Under the README rules, a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it, and a Check never names a Lean counterpart.

   **Witness.** The resolver lists 129 such names that occur nowhere. `Suggested.lean` declares 13 names.

   **Repair.**
   - Turn the API names and Check labels into prose.
   - Name targets in words.
   - Write each "representative signature" line with a single declared name per code span.

11. **F11** (P3) Padding and non-headline items in Suggested.lean

   **Location.** `Suggested.lean`:
   - line 44 `toDiophPoly`, line 48 `toDiophPoly_apply`, line 53 `polynomial_comparison`, line 58 `dioph_iff_exists_fin_mvPolynomial`;
   - line 116 `diophantine_integer_transfer`, line 156 `product_zero_residue_count`;
   - examples at lines 69, 74, 122, 126, 134 and 140.

   **Claim.** `Suggested.lean` should state headline theorems plus only the definitions they need.

   **Witness.**
   - `toDiophPoly` is needed by no headline: `mrdp` uses `Dioph` and `REPred` natively.
   - `toDiophPoly_apply` is the definition's evaluation rule.
   - `polynomial_comparison` and `dioph_iff_exists_fin_mvPolynomial` are intermediate lemmas (README §§4.5 and 4.10).
   - `diophantine_integer_transfer` is an elementary conditional.
   - `product_zero_residue_count` computes a residue-field count, the §5.4 example.
   - The six examples compute values that repeat README Checks (§4.1 constant_negative and two_coordinates; §4.18 −7, 1/2, ∅, x≠0).
   - One-tactic probe: `simp [toDiophPoly]` and `rfl` both fail on `toDiophPoly_apply`; `simp` reduces `product_zero_residue_count` to a count over `xy.1 = 0 ∨ xy.2 = 0` but does not close it.

   **Repair.** Delete these from `Suggested.lean`; the README keeps the statements and Checks. Keep `mrdp`, `universal_integers`, `rational_nonintegers_diophantine`, `rational_nonsquares_diophantine` and `one_universal_variable`, with `rationalDiophantine` and `rationalIntegers`.

12. **F12** (P3) Suggested.lean form and policy

   **Location.** `Suggested.lean`:
   - line 4: "representative target signatures";
   - line 7: "it is not exhaustive";
   - lines 13–16: "credit Cameron Freer's Hilbert10/PolyBridge.lean ... at commit ... and Mathlib PR #42203";
   - lines 165–188: a catalogue of names in the Layer 7 comment.

   README §§4.7–4.8 cite the body of a Mathlib pull request as a source.

   **Claim.** The docstring must follow the form "<title>: target signatures". Pull-request numbers and catalogues of names are not allowed.

   **Witness.** The lines quoted above.

   **Repair.**
   - Retitle "LogicAndDefinabilityInNumberTheory: target signatures".
   - Drop "not exhaustive", the commit hash and the PR number.
   - Replace the Layer 7 catalogue with the per-headline non-statability statements of R01.
   - Cite `MvPolynomial.exists_finset_rename` and the §4.7 argument instead of the PR body.

13. **F13** (P3) One false Check and one vacuous Check

   **Location.**
   - README line 914: "The residue-field formula ∃y, y²=−1 changes truth between K=ℝ and K=ℂ, so its truth set is not a subfunctor on those field embeddings."
   - Line 418: the valuation on 𝔽_p(t^(1/p^∞)) "is not a prime divisor of a finitely generated field".

   **Claim.** These are meant as negative controls.

   **Witness.**
   - Existential formulas are preserved upward: the truth sets are S(ℝ)=∅ and S(ℂ)=pt, which is compatible with ℝ⊂ℂ.
   - The field 𝔽_p(t^(1/p^∞)) is not finitely generated, so the prime-divisor predicate never applies to it.

   **Repair.**
   - Use ∀y, y²≠−1: S(ℝ)=pt and S(ℂ)=∅ really does break subfunctoriality.
   - Replace the vacuous Check with a finitely generated non-example: on 𝔽_p(s,t) (dimension 2), the monomial valuation with v(s)=1 and v(t)=√2. Its value group ℤ+√2ℤ is not cyclic and its residue field 𝔽_p has 0+1≠2, so it is not a prime divisor.

14. **F14** (P3) Existing owners and library objects are restated or not cited

   **Location.**
   - §1.11 (line 458) constructs O^h through Stacks.
   - §§2.7 and 2.9 (lines 760 and 802) cover gauge-form measures and Weil's volume formula.
   - §1.1 and the §2.4 negative control (line 724) use the Presburger sort.
   - §6.21 refers to "the current RealAlgebraicGeometry interface".
   - §0.8 (line 241) states the standard-part laws as a target.

   **Claim.** What a roadmap on main, an earlier roadmap or the pinned libraries already states must be cited, not restated.

   **Witness.**
   - SchemeAndStackFoundations §§0.12–0.14 on main constructs the henselization of a pair, with its universal property.
   - AdelicAlgebraicGroups §2.4 has "The Haar measure of a gauge form over a local field" and "Weil's volume formula for integral points".
   - Mathlib has `FirstOrder.Language.presburger`, `definable_iff_isSemilinearSet` and `mul_not_definable` (Mathlib/ModelTheory/Arithmetic/Presburger/Definability.lean:148 and :162).
   - TauCeti has `TauCeti.IsSemialgebraic` (Basic.lean:68).
   - §0.8's laws are `ArchimedeanClass.stdPart_add` and `stdPart_mul` (Mathlib/Algebra/Order/Ring/StandardPart.lean:334, 359) and `Hyperreal.stdPart_coe` (Mathlib/Analysis/Real/Hyperreal.lean:175), and nothing in the README cites §0.8.

   **Repair.**
   - Cite these by name and section, and say in one clause how §§2.7, 2.9 and 1.11 go beyond them (arbitrary smooth varieties; valued-field henselization).
   - Delete §0.8, or reduce it to an exact same-ultrafilter comparison statement.

15. **F15** (P3) The Downstream consumers section is wrong

   **Location.** README lines 2574–2578, and §6.15 line 2163: "this verification is given downstream there".

   **Claim.** The section names four roadmaps as consumers.

   **Witness.**
   - HodgeStructuresPartII and AbelianVarietiesIsogenousToNoJacobian exist nowhere. I checked main, the open roadmap pull-request index and the board package index.
   - AnalyticNumberTheory and AbelianSchemesAndArithmeticModuliPartII come earlier in the merge order, and neither cites this roadmap.
   - ComplexComparisonPartII, which defers the nonproper definable Chow step to this roadmap (its README line 4434), is not listed.

   **Repair.** List only actual later consumers. Move the width-R Hodge-norm verification of §6.15 into a target here, or cut the promise.

16. **F16** (P3) Timeless style and shape

   **Location.**
   - "current" appears 9 times (lines 18, 49, 522, 524, 928, 930, 1903, 2002, 2252).
   - "**Gap.**" paragraphs at lines 1930, 1946, 1962 and 2026.
   - Wording "Corrected"/"repaired"/"erroneous" at lines 1375, 1645 and 2096–2098.
   - Supplier contracts are grouped by topic, with no "From Tau Ceti" or "From TauCetiRoadmap.<X>" subsections.
   - `MixedAndreOortInput` (§7.8) and G_T (§1.19, where T is undefined) have no Checks.
   - The README runs to 2628 lines over nine subjects.

   **Witness.** §6.9 states the general quotient theorem, yet its Gap paragraph says it "is not restated here" and that "no other target of this roadmap uses the general case", and its route says "Use the general quotient theorem".

   **Repair.**
   - Remove the process words and the Gap labels.
   - Scope §6.9 to G/M with compact M, the case that is used.
   - Regroup the supplier contracts per supplier.
   - Add Checks for §7.8 and §1.19.
   - Consider splitting Layers 6–7 into a Part II.

Files reviewed: `packages/LogicAndDefinabilityInNumberTheory/README.md` (2628 lines), `Suggested.lean` (190 lines), `metadata.toml`, `sources.toml` (absent from the package folder at review; see R09). Six blocking findings (P2) and ten P3 findings. No P1: every theorem I tested is true as stated, and every identity and worked example I recomputed holds.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout, takes about 25 s and produces only `sorry` warnings (10, at lines 48, 53, 58, 65, 92, 98, 103, 108, 116 and 156). There are no `set_option`, no sorry'd data, no `lemma`, and the only import is `import Mathlib`.

**`#check @` probe.** All 13 declarations were elaborated in one scratch file. Each type matches its README statement, and no binder was lost (the only section variable is `α`, which every type that uses it mentions).

**Dependency check.**
```
depcheck: 25 roadmaps, 220 edges, 0 problem(s)
```

**Citations.**
- Cross-roadmap: the resolver reports none unresolved. I opened ShimuraVarieties §§3.5a, 3.5b.2, 3.5c, 3.5d and 3.6; HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6 and 5.8; MotivesAndAlgebraicCycles §4.20; NeronModels §§2.5 and 4.6; ResolutionOfSingularities §6.2; WeilConjectures "Curve RH from the surface bound"; SchemeAndStackFoundations §§0.7 and 2.20; DiophantineApproximation §§0.1–0.3 with `finite_setOf_absMulHeight₁_le` (its Suggested.lean:324); QuadraticFormInvariants Layer 2 and 6C items 9–12; GlobalQuadraticForms §§4.1–4.4, 5.5 and 6.1; DifferentialGeometry "Boundary and corners" and 5.5; AdicSpaces Layer 1; RealAlgebraicGeometry Layers 3 and 6. All 30 exist where cited.
- Library: 41 cited Mathlib names `#check` without error. I opened at the pin: Dioph.lean:49–50 (the TODO the README quotes), :92, :197, :227, :234; Funext.lean:56; Definability.lean:54; Presburger/Definability.lean:148 and :162.
- TauCeti at the pin: Coarsen.lean:69 and :103; GrothendieckRing.lean:180, :205 and :232; ValuationSpectrum/Basic.lean:95, :99, :106 and :140; AdicSpace/PatchPresentation.lean:209; Semialgebraic/Basic.lean:68; and the QuantifierElimination module, where the projection-closure hypothesis is explicit as the README says.

**Seeded sample.** 15 targets; 12 fully verified at the stated locators:
- **1.3**: locators correct (CL Theorem 2.1.1 p.9, Corollary 2.1.2 p.10; Pas §2.4 p.140, Theorem 3.2 pp.142–143, Lemma 3.5 p.143, Lemma 3.7 p.151, Theorem 4.1 p.155). The statement is narrower than the source (R04).
- **1.11**: Stacks Lemmas 10.155.1 and 10.155.6, and 15.125.6, match the tags. Dittmann–Pop only use henselizations.
- **1.19**: Dittmann–Pop proof of Proposition 5.1, lines 715–720, and Fact 5.2, line 725.
- **3.8**: CL Theorem 12.1.1, p.74. The sign of L^{ordjac} agrees with the README's weighting. Theorem 14.1.1, p.78, and A0(c) at line 2448.
- **3.9**: CL-exp 9.1.1 (a Notation) p.40, Theorem 9.1.5 p.43 (all K in C_{O,N}), Theorem 9.1.6 p.44 (A_{O,N}).
- **4.21**: Koenigsmann Proposition 6, with ℤ_(∞)=[−4,4], and Remark 8(a). The README's dyadic correction is confirmed: the printed row (6,15)↦(1,1,0) gives −21≡3, not 5 mod 8.
- **6.6**: BKT A.1–A.2, pp.19–20. The README rightly corrects ψ_j∘φ_i⁻¹ to φ_j⁻¹∘φ_i.
- **6.10**: BKT p.14, lines 649–650, and Lemma 4.2. The README's width-R statement is a direct extension.
- **6.20**: Pila–Tsimerman Lemma 7.7 and its proof.
- **6.24**: Pila, *Integer points on the dilation*, Lemma 3.1 p.6, Proposition 4.2 p.8, Remark 4.5 p.9 (the exponent with n·k·d·D/B). The formulas for B, L_k and η match.
- **7.1**: Pila–Tsimerman Theorems 2.6 and 4.4(1),(3); Lemmas 2.1, 2.3, 7.2–7.6; Theorem 6.1; Conjecture 7.1; Lemma 7.4 with k_g=2g. Tsimerman §§6.2–6.3.
- **7.3**: Pila–Tsimerman Theorem 7.1, with the route matching its proof. Tsimerman §6.5.
- **0.1 and 1.7**: the statements are sound but the locators do not support them (R08).
- **4.16**: not verifiable (below).

**Adversarial pass.** 148 rows, all with computed values; the table follows.

| § | statement | instance | values computed | result |
|---|---|---|---|---|
| Conv. | Kronecker codimension | trivial v on 𝔽_p | dim Kv+1=1≠0=dim K; truncated 0−1=0 would accept | sound |
| Conv. | Haar normalization | O_F, πO_F | μ(O)=1, μ(πO)=q⁻¹=\|π\| | sound |
| Conv. | base-first top forms | a=xy | da∧(−dx/x)=(y dx+x dy)∧(−dx/x)=dx∧dy | sound |
| Conv. | rational height | −3/4, () | H=4; H(())=1 | sound |
| Conv. | coefficient ring A | q=1 | 1−L⁻¹↦0, excluded | sound |
| 0.1 | interpretation | ℤ→ℚ pairs | (1,2)E(2,4): 4=4; 0/1 graph violates uniqueness | sound; R08 |
| 0.2 | semantics | ∃y 2y=1 in ℚ | ↔ ∃(a,b), b≠0, 2a=b: (1,2) | sound |
| 0.3 | bi-interpretation | finite vs ℤ | finite powers have finite quotients; ℤ is infinite | sound |
| 0.4 | transitivity | identity∘identity | identity comparisons | sound |
| 0.5 | fractions | (−1,2)+(1,2) | (0,4)~(0,1); (1,0) excluded | sound |
| 0.6 | bridges | as 0.2 | both sides true | sound |
| 0.7 | ultrapower | H vs n; principal U at i₀ | {i>n} cofinite; H=diag(i₀) | sound |
| 0.8 | standard part | ω | stdPart ω=0 with ω infinite | restates Mathlib (R14) |
| 1.1 | DP language | γ=3, 2 | 3≡1, 2≢1 mod 2 | sound |
| 1.2 | ac | t³(2+t) | ord 3, ac 2; in char 2: ord 4, ac 1; π′=επ: ac′(π)=(res ε)⁻¹ | sound; R04 |
| 1.3 | relative QE | ℚ_p; ℂ((t^ℚ)) | ℚ_p excluded; ℂ((t^ℚ)) excluded although in the source | R04 |
| 1.4 | AKE | as 1.3 | same | R04 |
| 1.5 | large-p transfer | ultraproducts | char (0,0), residue ∏𝔽_p/U, Γ=ℤ^U (CL-exp lines 1760–1763) | sound |
| 1.6 | dim_Kr | 𝔽_p, ℚ, 𝔽_p(t), ℚ(t) | 0, 1, 1, 2 | sound |
| 1.7 | constants | ℚ(√2)(t) | constants ℚ(√2); ℚ not of finite type over ℤ | sound; R08 |
| 1.8 | prime divisor | v_p on ℚ; t-adic | 0+1=1 arithmetic; 0+1=1 geometric | sound; R13 |
| 1.9 | residue dimension | trivial v on 𝔽_p | excluded | sound |
| 1.10 | dimension drop | ℚ̄ with v_p; Gauss on ℚ(t) | 0<1; 1<2 | sound |
| 1.11 | henselization | trivial v; ℚ at p | F^h=F; ℚ^h algebraic, ℚ_p not | sound; R14 |
| 1.12 | patch | b=0; a=0 | basicOpen(a,0)=∅ (Basic.lean:106); U₀ is everything | sound |
| 1.13 | generator | E=F | η=1, X−1, root simple | sound |
| 1.14 | patch open | E=F | V=Val_F | sound; R07 |
| 1.15 | coarsening | lex ℤ², d=(1,0) | N(0,1)<(1,0); Δ={(0,n)} | sound |
| 1.16 | inclusion | DP p.13 item a) | matches | sound; R07 |
| 1.17 | residue | p-adic ring in ℚ | p elements | sound |
| 1.18 | composite | t-adic then p-adic on ℚ(t) | value group ℤ² lex | sound |
| 1.19 | flags | e=1, ℚ(t) | Γ=ℤ, residue a number field | sound; R07, R16 |
| 1.20 | quadratic roots | c=0, char 2 | roots 0≠1; 2X−1=1 | sound; R07 |
| 2.1 | cells | ord 0, ac 1 | 1+πO, measure q⁻¹ | sound |
| 2.2 | cell decomposition | p=2 | not covered | R03 |
| 2.3 | constructible functions | geometric series; 1 on F | 1/(1−q⁻¹); not integrable | sound |
| 2.4 | local integration | 1-cell; shell; ab−c | q^{−a−1}; (q−1)q^{−a−1}=(1−q⁻¹)q^{−a}; integrable iff c=ab | sound; R03 |
| 2.5 | Jacobian | x=πu | 1 vs q⁻¹, factor \|π\| | sound |
| 2.6 | Igusa | general f; f=0 | TZ=1+(T−1)A coefficientwise; 0=1−1 | identity sound; R03 |
| 2.7 | gauge | π²(dx)^⊗2 | \|π²\|^{1/2}=q⁻¹ | sound; R14 |
| 2.8 | null loci | point in 𝔸¹ | measure 0 | sound |
| 2.9 | Weil volume | 𝔸^d; 𝔾_m | q^d/q^d=1; (q−1)/q=μ(O^×) | sound |
| 2.10 | finite quotients | split ℤ/2 cover | fibre of size 2 halves the measure | sound |
| 2.10a | Néron counts | Tate curve; S₃ on 𝔽₃³/Δ; ℤ/3 with −1 | n(q−1); M^G=0, (M*)^G of order 3; both 0 | sound |
| 2.11 | dual volume | ω=0; good reduction | 0=0; #A(k)/q^g on both sides | sound |
| 2.12 | Fubini | a=xy | as Conv. | sound |
| 3.1 | subassignments | ∃y y²=−1, ℝ⊂ℂ | ∅→pt compatible | R13 |
| 3.2 | SK₀ | line; 2 points | [RF]=[RF×]+1; image 2 | sound |
| 3.3 | A, A₊ | L−2 at q=1.5 | −0.5<0 | sound |
| 3.4 | Presburger | even n | Σq^{−2m}=(1−q⁻²)⁻¹ | sound |
| 3.5 | C(S) | 2 points | 1↦2, not multiplicative | sound |
| 3.6 | graded | singleton | degree 0 nonzero, degree 1 zero | sound |
| 3.7 | pushforward | 1-cell | L^{−α−1}↦q^{−α−1} (A0–A8 at lines 2437–2470) | sound |
| 3.8 | change of variables | x↦tx | ∫_{tO}1=L⁻¹=∫_O L^{−1} | sound |
| 3.9 | specialization | C_{O,N} | 9.1.5 for all K; 9.1.6 for A_{O,N} | sound |
| 3.10 | transfer | 9.2.4 | locator correct | sound |
| 3.11 | realization | 𝔾_m, ℙ¹ | [ℚ(1)]−1; 1+[ℚ(1)]; [X[2]]=[X] | sound |
| 4.1 | Tα | X0−2X1 at (1,3); C(−3) | −5; −3 (Lean examples) | sound |
| 4.2 | evaluation | Lean | elaborates | sound; R11 |
| 4.3 | surjective | Poly.induction | Dioph.lean:197 | sound |
| 4.4 | injective | X(X−1) | 0, 0, 2 at 0, 1, 2 | sound |
| 4.5 | equivalence | α empty | ℤ≅ℤ | sound |
| 4.6 | rename | X0−X1 collapsed | 0 | sound |
| 4.7 | finite support | input-only p | t=∅ | sound |
| 4.8 | enumeration | β empty | m=0 | sound |
| 4.9 | roots | u−v−1 | root (1,0); collapsed −1≠0 | sound |
| 4.10 | normal form | evens; constant 1 | X−2Y; no root | sound |
| 4.11 | coding | X−2 at 0 | −2 | sound |
| 4.12 | Dioph⇒RE | m=0 | decidable equality | sound |
| 4.13 | sequence numbers | y=6, n=3 | 7, 13, 19 pairwise coprime | sound |
| 4.14 | bounded ∀ | n=0 | true | sound |
| 4.15 | graphs | minimization | earlier divergence excluded | sound |
| 4.16 | MRDP | Lean | elaborates; true | Davis not readable |
| 4.17 | H10 over ℤ | 7 | 4+1+1+1 | sound |
| 4.18 | ring Diophantine | ℂ, ℤ/6, ℚ | 1+i²=0; 2·3=0; xz=1⇔x≠0 | sound |
| 4.19 | transfer | t=1/2 | m=1, n=2, 1·1+0·2=1 | sound |
| 4.20 | S, T | a,b<0; 2∈S | \|x₁\|≤1; (1,0,0,0) | sound |
| 4.21 | local trace | (6,15) | (1,1,1)↦69≡5; (1,1,0)↦3 mod 8 | sound |
| 4.22 | R^k | R³₅; R¹_{1,3} | Δ(−1,−5)={2,∞}, Δ(2,−5)={2,5} ⇒ ℤ_(2); Δ(−2,3)=∅ ⇒ ℚ | sound |
| 4.23 | radicals | ℤ_(3)∩ℤ_(5); ℚ | 3ℤ_(3)∩5ℤ_(5); {0} | sound |
| 4.24 | Φ_k | 3; −3; squares | in Φ₃; not (sign); ≡1 mod 8, excluded | sound |
| 4.25 | universal ℤ | S={3}: 1/3, 1/5 | 1/3∉R̃; 1/5∈ℤ_(3) | sound |
| 4.26 | ∀∃ undecidable | — | consistent with Koenigsmann Cor 3 | sound |
| 4.27 | S_p | 17; 697 | 17≡1, 697≡1 mod 8; 1/17∈ℤ_(41) | sound |
| 4.28 | nonsquares | (2/11); 0 | −1; 0 is a square | sound |
| 4.29 | one ∀ | Lean | elaborates | sound |
| 4.29a | normic | degrees | (2p+1)−2p=1 | sound |
| 4.30 | nonpowers | r=1 | empty | sound |
| 4.31 | e.c. | ℚ⊂ℝ | X²=2 | sound |
| 4.32 | preservation | n=3 | source states n=2 only | R08 |
| 4.33 | two ∀ | degrees; a=−1 | 8 and 12; coefficient of a²b²u₄⁸ is 1; Σu²=1 | sound |
| 5.1 | densities | πO; O^d | a_n=q⁻¹; N_n=q^{dn} | sound |
| 5.2 | uniform identities | fixed N | transfer form | sound |
| 5.3 | zeta interface | T=q^{−s} | substitution | sound |
| 5.4 | product map | x=1/q; q=2 | q²(1−x)²(1/(1−x)²−1)=2q−1; 3=#{xy=0 in 𝔽₂²} | sound |
| 5.5 | algorithms | — | — | R06 |
| 6.1 | o-minimal | ℤ⊂ℝ | infinite frontier | sound; R01 |
| 6.2 | restricted analytic | sin | zero set πℤ when unrestricted | sound |
| 6.3 | selected | reducts | via 6.1 | sound; R16 |
| 6.4 | cells | — | statement consistent | sound |
| 6.5 | dimension | line; ℝ→{0} | cl∖X=∅; section, no left inverse | sound |
| 6.6 | atlases | quadrant | relatively open charts | sound |
| 6.7 | boundary | vertex | 2 local faces | sound |
| 6.8 | compact corners | BKT A.2 | matches | sound |
| 6.9 | quotients | G/M | general case unused | R16 |
| 6.10 | exponential cover | x∈(0,R) | e^{−2πy}cos/sin(2πx) | sound |
| 6.11 | coefficient ring | y>c>0; x=1/2 | y⁻¹ defined; pole | sound |
| 6.12 | rough monomial | yˢ; y+(−y) | C=1; 0 | sound |
| 6.13 | localization | k | 1/2≤k≤1; 1/k−1=y⁻¹/(c+y⁻¹) | sound |
| 6.14 | decay | — | e^{−c y}y^s→0 | sound |
| 6.15 | curve test | Vandermonde; escape; h | det −1/2; x=3/2; 1<h<5, y⁻² at x=2 | sound |
| 6.16 | algebraic structure | ℙ¹ | z↦1/z on overlap | sound |
| 6.17 | Remmert–Stein | structure | the source needs R_an | R05 |
| 6.18 | Chow | structure | same | R05 |
| 6.19 | dense extension | sin(1/x) | no extension; no claim made | sound |
| 6.20 | finite reduction | ⋃ points of ℚ | not definable | sound |
| 6.21 | algebraic part | (0,1); {0} | X; ∅ | sound; R14 |
| 6.22 | heights | −3/4 | 4 | sound |
| 6.23 | parametrization | f=t, ψ=t² | 2 vs 0 | sound |
| 6.24 | determinant | k=1, n=2 | B=D(D−1)/2, η=4d/(D−1)→0 | sound |
| 6.25 | Pila–Wilkie | exp graph on (0,1) | X_alg=∅, bound holds; probe elaborates | sound; R01 |
| 6.26 | blocks | point | contributes nothing | sound |
| 6.27 | block counting | — | overlaps B2.6 | R02 |
| 6.28 | bounded degree | k | coefficient height ≤2^kT^k | sound |
| 6.29 | semi-rational | Σ={(0,0),(1,1/2)} | restart at (1/2,0), π₂ kept | R02 |
| 6.30 | orbit bridge | Aε<δ | cD^δ>C·D^{Aε} for large D | sound |
| 6.31 | torus lemma | parabola; γ₁⁻¹ | not Ax-type; c bounds the inverses | R02 |
| 7.1 | input datum | g=1, D=−3 | Re τ: H=2≤3; 4X²−3; b>2 | sound |
| 7.2 | exceptional CM | — | matches Pila–Tsimerman p.17 | sound |
| 7.3 | finite families | — | matches Pila–Tsimerman Theorem 7.1 | sound |
| 7.4 | André–Oort | — | components dense ⇒ special | sound |
| 7.5 | CM pairs | Φ₁; 1728; 1 | j₁−j₂; j(i); not among the 13 values | sound |
| 7.6 | monodromy | — | equals B2.18 | R02 |
| 7.7 | codimension | dim U>0 | codim U<dim X+dim Ď≤codim(X×Z)+codim W | sound |
| 7.8 | mixed AO | — | input datum consistent | sound; R16 |
| Lean | `toDiophPoly` | `#check` | `MvPolynomial α ℤ →+* Poly α` | R11 |
| Lean | `toDiophPoly_apply` | `simp`, `rfl` | both fail | R11 |
| Lean | `polynomial_comparison` | `#check` | ∃ e, e.toRingHom = toDiophPoly | R11 |
| Lean | `dioph_iff_exists_fin_mvPolynomial` | `#check` | matches §4.10 | R11 |
| Lean | `mrdp` | `#check` | REPred ↔ Dioph on Fin n | sound |
| Lean | `rationalIntegers` | examples | −7∈, 1/2∉ | sound |
| Lean | `rationalDiophantine` | ∅; x≠0 | witnesses 1; X0·X1−1 | sound |
| Lean | `universal_integers` | `#check` | Koenigsmann Prop 18(c) / Theorem 1 | sound |
| Lean | `rational_nonintegers_diophantine` | `exact?` | only finds itself | sound |
| Lean | `rational_nonsquares_diophantine` | 0, −1 | 0 excluded, −1 included | sound |
| Lean | `one_universal_variable` | `#check` | ∀x∃y form | sound |
| Lean | `diophantine_integer_transfer` | `#check` | conditional | R11 |
| Lean | `product_zero_residue_count` | q=2 | 3=2·2−1 | R11 |

**Ownership against open pull requests.** I checked the given sibling checkouts, the open roadmap pull-request index (2026-10-23) and the board package index, by object: MRDP, o-minimality, Pila–Wilkie, Ax–Kochen/Denef–Pas, motivic integration, Koenigsmann, Dittmann–Pop, Igusa, André–Oort, gauge forms, henselization, Remmert–Stein, Colliot-Thélène–Van Geel. Apart from R02 and R14, this roadmap is the sole owner of its Layer 0–5 targets. No declaration in `Suggested.lean` reuses a fully qualified name from another roadmap.

## Not verifiable

- **Davis, *Hilbert's tenth problem is unsolvable*** (§§4.11–4.17 and 5.5, including the sampled §4.16 "§8, Theorem 8.1, p.264"). No legal copy: the DOI landing page returns 403, the MAA prize-article URL returns 404, and the only copy found is a JSTOR download on a third-party course page. It is listed in this job's `needs-references.toml`.
- **Pila–Wilkie, van den Dries' monograph, van den Dries–Macintyre–Marker, and the Cluckers addenda.** These are waived. I could not check the README's claim that Pila–Wilkie Corollary 4.4 uses a false chain-rule identity.
- **Annals versions of Koenigsmann, Pila–Tsimerman and Tsimerman.** I checked these against arXiv only, because the Annals hosting is not on the service's legal-host list. Numbering matches the arXiv versions up to Koenigsmann's Proposition 18 and throughout Pila–Tsimerman. It differs elsewhere:
  - Koenigsmann arXiv v2 has Lemma 19, Proposition 20, Corollary 21 and Proposition 24 where the README cites Definition 19, Lemma 20, Proposition 21, Corollary 22 and Proposition 23.
  - Tsimerman arXiv v5 numbers the orbit bound Theorem 5.1 and André–Oort Theorem 5.2; the README cites 5.2 and 1.3/5.3.

  Published page numbers were not checked. Koenigsmann's "existential iff Z_K⊂Z_L" (§4.32) does not appear in arXiv v2.
- **Pila–Tsimerman 2013, Theorem 3.1.** Not fetched; it is used only through Pila–Tsimerman 2014, Lemma 7.4 (verified).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "08dd872", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory", "model": "opus", "worker": "fable-rev3"} -->

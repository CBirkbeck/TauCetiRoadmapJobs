<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/167#issuecomment-6316705127 -->
Red team round 1 pass a (codex) of 5c85222

Verdict: needs_changes

1. **F01** (P1) General-data coefficients use the wrong central quotient

   **Location:** packages/OverconvergentAutomorphicForms/README.md:1060, “For a general Shimura datum … the G^c- and Levi M_μ^c-torsors”; also lines 1062–1064.

   **Claim:** PerfectoidShimuraVarieties supplies these coefficient torsors for arbitrary pure data.

   **Witness:** TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:1939: for T=Res¹_{ℚ(∛2)/ℚ}G_m, Z_s=1 but Z_r=T. Infinite-order norm-one congruence units act nontrivially on the multiplication representation of T^c=T, obstructing descent to the effective tower.

   **Exact repair text:** “For arbitrary pure data use PerfectoidShimuraVarieties §§6.1a–6.3: G^r=G/Z_r(G), its parabolic and Levi quotients, and representations trivial on Z_r(G). Use G^c and M_μ^c only after the supplied CM-split-centre identification G^r≃G^c. All coefficient comparisons, reduced-domain functors and central twists retain these quotient maps.” Apply this replacement throughout §8.6 and the supplier table, and to §8.7 wherever its supplied Levi reduction is the general-data quotient; retain the cubic norm-one torus as a negative Check.

2. **F02** (P1) The ramified generator is already owned by the supplier

   **Location:** packages/OverconvergentAutomorphicForms/README.md:436, “Name `hilbertPeriod_unsplitRamifiedGenerator`”; related ownership claims at lines 13, 54 and 478.

   **Claim:** This package must construct the unsplit canonical generator and scalar kernel congruence as additional theory.

   **Witness:** TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:1504 supplies `ramifiedPeriod_comparison`; line 1518 supplies `canonicalKernel_congruence`; §3.12 supplies the rank-one O_F/p^n canonical module. Its §4.6 already consumes these inputs at ramified primes.

   **Exact repair text:** “Import HodgeTateAndCanonicalSubgroups §3.12 and §§4.6–4.8 (`ramifiedPeriod_comparison`, `canonicalKernel_congruence`) for the unsplit generator and period bounds. Apply them before evaluating the coefficient character; no new ramified-generator theorem is constructed here. The closed odd-prime endpoint extension remains a separate target.” Delete `hilbertPeriod_unsplitRamifiedGenerator` from the target list and repoint its uses.

3. **F03** (P1) Compact rigid weight geometry is planned a second time

   **Location:** packages/OverconvergentAutomorphicForms/README.md:105, “Define `hilbertWeightSpace` and `arithmeticWeightSpace` as rigid realizations”; lines 16 and 282.

   **Claim:** Compact rigid representability, finite-character charts and the universal character remain to be constructed here.

   **Witness:** TauCetiRoadmap/LocallyAnalyticDistributions/README.md:1245 imports `compactCharacterSpace` and `rigidCharacterSpace` from PhiGammaModulesAndIwasawaCohomology §4.0, including finite-character charts and the universal character. PhiGammaModulesAndIwasawaCohomology §4.0, lines 1255–1278, confirms the owner directly; LocallyAnalyticDistributions §4.15, line 2642, additionally supplies common-radius universal-character analyticity.

   **Exact repair text:** “Define the Hilbert and arithmetic weight spaces by specializing PhiGammaModulesAndIwasawaCohomology §4.0's compact character-space functor to O_p^× and O_p^××ℤ_p^×. Import its rigid representability, finite-character charts and universal character through LocallyAnalyticDistributions §3.3. The new targets identify the number-field unit-group charts and the inverse-norm pullback. Import LocallyAnalyticDistributions §4.15 for common-radius analyticity in §0.3. Replace the nonexistent PadicMeasuresIwasawaAlgebras L0a reference by its actual §3a.1 for the one-dimensional unit-character input. In §0.6 retain the noncompact product and locally L-analytic equations; import the compact locally ℚ_p-analytic Mellin equivalence.”

4. **F04** (P3) The Hodge–Tate supplier locators no longer identify the consumed results

   **Location:** packages/OverconvergentAutomorphicForms/README.md:55–56, “T5 §§5.1–5.8 … Hodge–Tate lift” and “Same, T6 … Levi … comparison”; also line 716.

   **Claim:** The named sections supply the Hodge–Tate lift and cyclotomic comparison used here.

   **Witness:** TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:1725 locates the lift in §5.10, line 1759 the torsor comparison in §5.12, and line 1794 begins Layer 6 on logarithmic sites. The open Levi comparison is §2.10, line 1032.

   **Exact repair text:** “HodgeTateAndCanonicalSubgroups §§5.8, 5.10–5.12 supply the AIP torsor, `hodgeTate_aipLift`, `aip_automorphyFactor` and `aipTorsorHodgeTateComparison`. Its §2.10 supplies the open Hodge-type Levi comparison, and §§7.29–7.30 the Hodge-type logarithmic comparison. For arbitrary pure data use PerfectoidShimuraVarieties §6.1a.” Replace the T6 and §5.8 lift references consistently.

5. **F05** (P3) Support at one character does not make a representation a character line

   **Location:** packages/OverconvergentAutomorphicForms/README.md:292, “supported at one character is a character representation”.

   **Claim:** Single-point support excludes multiplicity and nonsplit self-extensions.

   **Witness:** For Z=ℤ, let 1 act on E² by [[1,1],[0,1]]. This essentially admissible representation has coherent dual supported only at 1, but the generator is not scalar. Even two copies of one character defeat rank one.

   **Exact repair text:** “For G=ℤ, a length-one skyscraper at χ corresponds to its character line. A coherent module supported at χ can instead encode multiplicities and generalized χ-eigenvectors; E[T,T⁻¹]/(T−χ(1))² is the nonsemisimple negative control.”

6. **F06** (P2) Unramified local twisting need not preserve the fixed arithmetic space

   **Location:** packages/OverconvergentAutomorphicForms/README.md:337, `unitaryClassicalPoint.unramifiedTwist`; lines 355 and 365.

   **Claim:** An unramified local twist produces another classical point in the same Π and fixed level/coefficient data.

   **Witness:** Fix an algebraic weight and finite level everywhere, including p. The classical space has finitely many refinements. Unramified twists preserve compact-open invariants but vary the uniformizer eigenvalues through E^×.

   **Exact repair text:** “Unramified twisting changes the local refinement without changing algebraic exponents. It defines a map of arithmetic classical points only for an actual global automorphic twist, with the resulting tame level and other-place coefficients specified, or with a proved intertwiner into the fixed Π. The local character calculation alone makes no closure assertion for this eigenvariety.” Give `unitaryClassicalPoint.unramifiedTwist` those hypotheses.

7. **F07** (P2) An easy coefficient-action headline is missing from Lean

   **Location:** packages/OverconvergentAutomorphicForms/README.md:1017, `determinantLineMap_translation`; packages/OverconvergentAutomorphicForms/Suggested.lean:256–266.

   **Claim:** The determinant line is an eigenline for transpose translation, the action used to identify the scalar subobject.

   **Witness:** `determinantLineMap` already has real algebraic carriers. Only injectivity is stated; no statement ties its image to the coefficient translation action. All ingredients are matrices, units and monoid homomorphisms available in this file.

   **Exact repair text:** Add a documented theorem `determinantLineMap_translation` under the existing finite-index/commutative-ring context: for `h g : Matrix.GeneralLinearGroup n R`, the value at `transpose(h) * g` is `(χ (det h) : S) * determinantLineMap χ a g`, forming the transposed unit from the transposes of h and h⁻¹. State it as the action milestone before the README-only analytic restriction. No new analytic carrier is needed.

8. **F08** (P3) The Lean tail is a prohibited name catalogue

   **Location:** packages/OverconvergentAutomorphicForms/Suggested.lean:318–346, “The following constructions remain README targets”.

   **Claim:** An untyped catalogue substitutes for omitted constructions.

   **Witness:** These 29 lines list names without signatures or proofs. The brief explicitly forbids catalogues of names; the module docstring already explains that the file is not exhaustive.

   **Exact repair text:** Delete the block comment at lines 318–346. Keep the README as the inventory of constructions whose carriers are unavailable.

9. **F09** (P1) Affinoid-valued induction is not of compact type over the coefficient field

   **Location:** packages/OverconvergentAutomorphicForms/README.md:181–187, “Over a uniform finite-type Tate E₀-algebra A” and `locallyAnalyticInduction.compactType`.

   **Claim:** The locally convex limit has compact type at this coefficient generality.

   **Witness:** Take M=G_m, trivial weight and A=E₀⟨T⟩. Every induction stage is A with identity transitions. The monomials Tⁿ are pairwise distance one, so its Banach unit ball is not compactoid over E₀.

   **Exact repair text:** “Over a finite coefficient field, prove `locallyAnalyticInduction.compactType`. For general affinoid A, construct the locally convex A-module limit with the stated relative completely continuous transition maps; do not assert compact type as an E₀-space. The torus specialization is A, and for A=E₀⟨T⟩ it is the negative control for fieldwise compact type.” This preserves the affinoid family construction while separating the two topological assertions.

10. **F10** (P1) Analytic vectors and Banach admissibility duplicate completed-cohomology foundations

   **Location:** packages/OverconvergentAutomorphicForms/README.md:266, `analyticVectors`, `admissibleBanachRepresentation` and their generic APIs.

   **Claim:** These general constructions belong to this roadmap.

   **Witness:** TauCetiRoadmap/CompletedCohomologyPartII/README.md:235 constructs analytic orbit vectors, topology, inclusion, functoriality, compact-open restriction and the analytic-field distinction. Its F.1, line 180, owns compact-open Banach admissibility and its duality and independence of lattice.

   **Exact repair text:** “Import CompletedCohomologyPartII F.4's analytic-vector construction and F.1's compact-open admissible Banach category. Identify the bounded-measure-dual presentation with that supplier's rational Schikhof presentation. The additional targets here are the closed regular-embedding criterion, strong analytic admissibility, coadmissible analytic duality, essential admissibility, and Jacquet modules, applied to the actual arithmetic Π.” Remove second definitions of the imported objects and cite their precise supplier sections. Replace the bare `CompletedCohomology` reference at line 17, whose folder is absent from content main, with these actual PartII contracts.

11. **F11** (P3) Published source locators name results of the wrong kind or number

   **Location:** packages/OverconvergentAutomorphicForms/README.md:127, “BHW Remark 6.2”; lines 505, 523, 764, 805, 838 and 842.

   **Claim:** These locators point to the stated definitions, specialization and compactness results.

   **Witness:** bhw line 1852 is Definition 6.2, not a remark; its weight formula is lines 1848–1851. aip-cusp lines 715, 852, 890 and 902 are respectively Theorem 3.16, Lemma 3.21, Corollary 3.24 and Lemma 3.25.

   **Exact repair text:** “For the weight formula cite BHW Definition 6.1 and the paragraph after Definition 6.2, pp.1756–1757. For fixed-radius sections cite BHW Definition 6.8, p.1759. For the positive-radius colimit cite AIP-cusp §3.5 and Theorem 3.16, pp.17–18. Cite AIP-cusp Corollary 3.20 and Lemma 3.21, p.21; Propositions 3.22–3.23, pp.21–22; Corollary 3.24, p.22; Lemma 3.25 and Corollary 3.26, pp.22–23; Lemma 3.27, p.24; Theorem 4.4, p.28.” For polarization transport cite Lemma 4.5, p.28, rather than Proposition 4.5 as a compactness theorem. Replace all occurrences of the erroneous result kinds/page ranges, including the reference summary: AIP-cusp §4 reaches p.29, rather than ending on p.25. Replace every nonexistent “BHW §6.3, pp.1759–1760” ordinary citation by “BHW Proposition 6.6 and its proof, p.1758, for the Igusa formal-model argument; AIP-adic §8.4, p.37, for the Katz–Hida ordinary interpretation.” Keep the explicit completion/model-identification theorem as new work. BHW moves from Remark 6.9 directly to Section 7 at bhw lines 1933–1944. Theorem 4.4 and Lemma 4.5 occur at aip-cusp lines 1101 and 1112, after the p.28 marker; Lemma 3.27 occurs at line 957 on p.24.

12. **F12** (P3) Statable discriminating Checks have no Lean mirror

   **Location:** packages/OverconvergentAutomorphicForms/README.md:86–87, 124, 133, 980 and 1023; packages/OverconvergentAutomorphicForms/Suggested.lean:85–108, 163–180, 275–305.

   **Claim:** The kept definitions have proved tests covering their advertised degenerate cases and conventions.

   **Witness:** Lean has no `normAlgebra` zero/sign test, no right-coordinate `ArithWeight.mk 1 t` test, no simultaneous nontrivial-coordinate value 2 versus 8, no W=0 dual-factor test, and no determinant-line upper-unipotent test.

   **Exact repair text:** Add proved examples for those Checks using the existing carriers. Combine parallel cases in conjunctions so each kept definition still has at most two examples; replace the identity-only `weightDualMap` example by the simultaneous-character negative control. Keep unavailable geometric Checks in the README, but mirror every algebraic Check above and each additional easy boundary case in the inventory.

13. **F13** (P3) The source manifest is absent

   **Location:** packages/OverconvergentAutomorphicForms/README.md:1124–1139, the thirteen-work reference list.

   **Claim:** Source provenance and the exact cited versions are recorded for the package.

   **Witness:** The head's package contains README.md, Suggested.lean, metadata.toml and review.json, with no sources.toml. In particular, several author PDFs have version-dependent numbering that the README relies on.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one record per cited work, the exact version, authors/title/year, each used locator and target, and the sources-service provenance fields. Preserve an uncertified entry for any inaccessible published version; record legal alternative versions separately and align their locators. Do not put cache paths in the manifest.

14. **F14** (P3) Three Checks fail their own boundary or carrier conditions

   **Location:** packages/OverconvergentAutomorphicForms/README.md:206, “In rank one the product is the product of lines”; lines 360 and 905.

   **Claim:** Rank one makes induction one-dimensional; the unitary construction has a torus case; torsion-free completed functions always contain nonzero p.

   **Witness:** SL₂ has rank one and a unipotent variable. The unitary definition at line 319 requires n≥2. The zero ring is torsion-free and explicitly admitted at line 899, but p=0 there.

   **Exact repair text:** Replace line 206's first clause by “For a torus, whose opposite unipotent has dimension zero, multiplication is multiplication of coefficient lines.” Replace `unitaryJacquetCoefficients` by `locallyAnalyticJacquet` in the torus Check at line 360. Replace line 905's first clause by “On a nonzero torsion-free ordinary patch, p is nonzero and is not invertible in the power-bounded ring.”

15. **F15** (P2) The Siegel coefficient branch excludes the dyadic case without an extension target

   **Location:** packages/OverconvergentAutomorphicForms/README.md:984, “Assume g≥1, odd p”.

   **Claim:** The period-domain coefficient construction is only planned at odd primes, even though it is explicitly independent of the quantitative canonical-subgroup interpretation.

   **Witness:** TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:1253–1257 supplies the row chart and strict-Iwahori factor without oddness. At g=1,p=2, γ=[[1,0],[2,1]] gives J=1+2Z, a unit for integral Z. No dyadic continuation is named here.

   **Exact repair text:** “For every rational prime p, including 2, construct the period-domain coefficients using the supplied full tower, quotient frame and analytic character neighborhoods. At p=2 choose sufficiently deep principal character neighborhoods and retain the sign component. The quantitative canonical-subgroup interpretation separately retains the supplied p>2g range.” Carry this scope through §§8.2–8.5; add the displayed dyadic denominator as a Check and a proved `lowerFactor` example combined with its existing tests.


16. **F16** (P3) Two proved examples bypass the roadmap's kept definitions

   **Location:** packages/OverconvergentAutomorphicForms/Suggested.lean:197 and 308, the noncommuting-matrix and Atkin–Lehner examples.

   **Claim:** These examples test the roadmap's cocycle and chart constructions.

   **Witness:** Both propositions mention only Mathlib matrix operations and constants. Neither uses a real-bodied definition introduced here. Replacing the right-cocycle or Atkin–Lehner theorem by a differently normalized statement leaves these examples unchanged.

   **Exact repair text:** “Introduce the light real-bodied conventions `rightCocycleOfLeft K γ x := (K γ⁻¹ x)⁻¹` and `atkinLehnerBlock q := Matrix.fromBlocks 0 1 (−(q • 1)) 0`. Restate the corresponding headline identities through these definitions. Make the cocycle test instantiate an actual left cocycle and the chart test use `atkinLehnerBlock`, so that changing either definition breaks its negative control. Add the names and at least three discriminating README Checks per definition; keep at most two combined proved examples per definition.” Alternatively remove the standalone calculations and retain their boundary statements as named README/Lean theorem targets, without claiming proved tests of the construction.

17. **F17** (P3) The Bruhat rank-one Check confuses the Levi and full Weyl groups

   **Location:** packages/OverconvergentAutomorphicForms/README.md:1109, “an SL₂ root datum with w=1 and w₀=s … with w=s …”.

   **Claim:** The two displayed weight outputs test the formula with w₀,M and w∈ᵐW fixed in §8.7.

   **Witness:** For the GL₂ Hodge Levi M=T, w₀,M=1; ν=0 gives κ=−2ρ at w=1 and κ=0 at w=s. If M has the entire SL₂ Weyl group instead, s is not a minimal Levi-coset representative.

   **Exact repair text:** “For the rank-one root datum of GL₂ with its noncentral Hodge cocharacter, M=T and w₀,M=1. At ν=0, w=1 gives κ=−2ρ, whereas w=s gives κ=0. In both cases the distribution weight adds 2ρ_nc. Using the full-group longest element s in place of w₀,M reverses these values and fails the Check.”

## Verified sound

Read all 1,139 README lines and all 348 Suggested.lean lines at the requested head. The Lean inventory contains **49 declaration starts: 13 definitions/abbreviations, 5 instances, 14 theorem signatures and 17 proved examples**. No false identity was found among the 14 theorem signatures by the mathematical checks below. This is a signature and proof-text review, not an elaboration run.

The README has **44 numbered subsections**, **331 Check bullets reviewed**, and **86 bold labels**. The bold labels are Summary, Check headings and reference names; there are no separately bolded mathematical targets. To avoid omitting the actual targets, the identifier inventory below records **447 distinct inline-code entries**, including aliases, displayed formulas and imported API names. It is deliberately a superset, not a claim that the document contains 447 independent new theorems. All targets in these subsections were read; the 44-row adversarial table records the mathematical cases tested and limits of the conclusions. Reading a Check is distinguished from proving its geometric assertion.

The source audit below records **13 works and 60 locator groups** checked against legally fetched text, including the erroneous groups in R11 and alternate editions expressly marked below. The supplier audit records **13 directly named roadmap contracts** checked at their relevant sections; it also checks the additional PhiGammaModulesAndIwasawaCohomology owner and searches the five supplied sibling heads. This does not certify unspecified future geometric inputs.

No sorry-valued data, `set_option`, `lemma`, `True` placeholder, forced analytic headline encoding, or computational algorithm was found. The single import is `Mathlib`. The existing headline carriers are algebraic and light. The geometric and representation-theoretic constructions remain README targets. The missing easy action headline is R07. The diff is confined to the package: README.md, Suggested.lean, metadata.toml and review.json, totaling 1,496 inserted lines. No source passage was copied into this report.

### Direction check

The requested dependency gate returned exit status 1 and exactly:

```text
NOT IN ORDER: OverconvergentAutomorphicForms (insert it after its last supplier)
depcheck: 6 roadmaps, 46 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Per the brief, absence from ORDER is not a finding. The small reported graph is not evidence that every external supplier edge was checked by the tool; the named contracts were also inspected manually. No ownership move to a later supplier is proposed. R01–R03 and R10 repoint to earlier owners. There are no declared gaps to accept conditionally and no prior repair findings to re-raise.

### Lean contexts and adversarial declaration table

Context key: **H** = `F : Type*`, `[Field F]`, `[NumberField F]`, `p : ℕ`, `[Fact p.Prime]`; the chosen topology on `Op` is the module topology, not arbitrary. **W** = H plus `R : Type*`, `[CommRing R]`, `[TopologicalSpace R]`, `[IsTopologicalRing R]`. **M** = arbitrary commutative ring R. **Sg** = arbitrary finite type n with `[Fintype n]`, `[DecidableEq n]`, and `[CommRing R]`. Extra S is an arbitrary commutative ring. Universes are unconstrained `Type*`; no finite-dimensional or completeness assumption is smuggled in through unused section variables. The global `noncomputable section` supplies no mathematical hypothesis.

All line numbers in this table refer to packages/OverconvergentAutomorphicForms/Suggested.lean. “Sound” means the displayed mathematical identity survives the listed case, not that `sorry` has been replaced.

| Line / declaration | Layer and retained context | Instances tried / result | Change |
|---|---|---|---|
| 25 `Op` | 0; H | F=ℚ; quadratic ramified algebra; rank remains degree | None |
| 28 finite instance | 0; H | Integral lattice base change, including p=2 | None |
| 30 free instance | 0; H | Integral basis survives base change | None |
| 32 topology instance | 0; H | p-power scalars converge; discrete topology would fail | None |
| 34 module-topology instance | 0; H | Specifies exactly the preceding topology | None |
| 36 topological-ring instance | 0; H | Multiplication continuous in finite-module topology | None |
| 40 `compactSpace_Op` | 0; H | Finite product of compact ℤₚ via an integral basis | None |
| 44 `finrank_Op` | 0; H | Degree 1 and ramified degree 2; no rank-zero number field | None |
| 48 `normAlgebra` | 0; H | Scalars a have norm a^d, zero and −1 give 0 and (−1)^d | R12 tests |
| 52 `norm_tmul_one` | 0; H; a integral | a=0,1,−1 and determinant base change | None |
| 58 `normUnits` | 0; H | p excluded from units; scalar 2 at p=5 has norm 2^d | R12 tests |
| 62 `continuous_normUnits` | 0; H | Determinant polynomial on finite free coordinates, then unit topology | None |
| 66 `unitsToOp` | 0; H | −1 and a nonrational quadratic unit remain actual elements | None |
| 70 `normUnits_unitsToOp` | 0; H; η unit | Norm ±1 agrees with integral determinant, including p=2 | None |
| 76 `principalUnits` | 0; H; r natural | r=0 gives the zero quotient and the full unit group | None |
| 80 `open_finiteIndex_principalUnits` | 0; H; r natural | r=0 index 1; r>0 finite quotient, open kernel | None |
| 85 example | 0; H | Finite tensor module; weak as a discriminating test | R12 improves coverage |
| 87 example | 0; H; scalar a | Norm of a scalar, including a=0 and a=−1 | Sound; add explicit degree/sign checks |
| 92 example | 0; H; u unit | Coercion of the actual unit norm, not a new norm | Sound |
| 96 example | 0; H; η unit | Right tensor inclusion is 1⊗η | Sound |
| 100 example | 0; H | r=0; quotient subsingleton proof is the intended boundary | Sound |
| 115 `GeomWeight` | 0; W | Trivial and finite characters; zero coefficient ring gives one character | None |
| 118 `ArithWeight` | 0; W | Independent two coordinates, also zero coefficient ring | None |
| 121 `ArithWeight.mk` | 0; W; w,t continuous chars | (w,1), (1,t), and both nontrivial | R12 right-coordinate mirror |
| 127 `weightDualMap` | 0; H, no R retained | x↦(x²,Nx⁻¹); product law uses commutative units | R12 replace identity-only Check |
| 138 `weightMap` | 0; W; κ | Precomposition; p=5,F=ℚ,w=t=id gives κ(2)=2 | R12 numerical mirror |
| 142 `weightMap_mk_apply` | 0; W; w,t,x | 2²/2=2, wrong sign gives 8; zero ring harmless | Sound |
| 150 `congruence_unit_norm_one` | 0; H; N≥4, η≡1 mod N | Norm ±1 and congruent 1 force +1; no positivity or unramified assumption needed | Sound |
| 156 `weightMap_mk_congruenceUnit` | 0; W; same N,η hypotheses | Mixed-sign norm-one unit cancels; conclusion not assumed | Sound |
| 164 example | 0; W; t,x | w=1 gives inverse norm character | Sound |
| 170 example | 0; W; w,x | t=1 gives square character | Sound |
| 175 example | 0; W; w,x | Left-coordinate restriction | Sound; R12 adds the other coordinate |
| 179 example | 0; H, no R retained | Any homomorphism preserves 1; wrong-sign hom also passes | R12 replace vacuous sign test |
| 189 `right_cocycle_of_left` | 1; groups Γ,C; Γ-action on X; left cocycle K | Noncommutative C: reverse inverse order twice gives displayed right order; trivial groups harmless | Sound |
| 197 example | 1; concrete 2×2 matrices over ℚ | Products have unequal (0,0) entries | Numerical order check is correct; R16 connects it to the convention definition |
| 211 `lowerFactor` | 6; M; γ,z | Identity, diagonal and nonzero lower-left entry | Sound |
| 216 `wild_factor_conjugation` | 6; M; ϖ a unit, γ,z arbitrary | Lower-left entry scales by ϖ⁻¹ and z by ϖ; zero ring and p=2 algebra valid | Sound |
| 224 example | 6; M; a,d,z | Diagonal lower factor is d, even d=0 | Sound |
| 228 example | 6; concrete ℚ matrices | Correct conjugation 126; reversed conjugation 3126 | Sound |
| 246 `antidiagonalDualFactor` | 8; Sg | Empty index, W=0, rank 1, noncommuting rank 2 | R12 boundary mirror |
| 250 `antidiagonal_dual_factor` | 8; Sg; W²=I and WZᵀW=Z | Insert W² between Cᵀ and Zᵀ; no unstated Wᵀ=W needed | Sound |
| 257 `determinantLineMap` | 8; Sg; S commutative; χ:Rˣ→*Sˣ | n empty gives constant a; zero R or S harmless | R07 action headline |
| 264 `determinantLineMap_injective` | 8; Sg; same S,χ | Evaluate at identity; χ(1)=1, including zero rings | Sound |
| 269 `atkin_lehner_chart` | 8; Sg; arbitrary q,Z | q=0,1,2; Z=0 or singular; empty n | Sound identity; invertibility not claimed |
| 275 example | 8; Sg; S,a,g | Trivial χ gives constant a | Sound |
| 279 example | 8; ℚ, n=Fin 2 | diag(2,3) gives determinant-line value 6 | Sound |
| 287 example | 8; ℚ, n=Fin 2 | Correct dual factor diag(1,4), wrong order diag(4,1) | Sound |
| 299 example | 8; M, n=Fin 1 | a+zc, including a=c=z=0 | Sound |
| 308 example | 8; ℚ, n=Fin 1 | [1,3][0,1;−2,0]=[−6,1] | Sound calculation; R16 connects it to the convention definition |

### Adversarial README table

This table records the applicable counterexamples and negative controls for all targets inventoried in each section. A field/DVR/zero-ring test is used only where the stated carrier permits it; the number-field and rigid-space hypotheses exclude characteristic-p coefficient fields from the p-adic analytic assertions. “No counterexample found” is weaker than a completed proof. The inventory following this table binds every inline target name to its row.

| Section | Instances and hypotheses tested | Result | Change |
|---|---|---|---|
| 0.1 | F=ℚ; quadratic ramification; split ℚ(i),p=5; a=0,−1; r=0; dyadic H₁/H₂ | Norm/filtration statements sound; no integral split-product shortcut | R12 |
| 0.2 | Trivial/two nontrivial characters; zero R; norm −1; mixed-sign norm-one units; p=2 sign; N=4 | Inverse norm and central cancellation sound; representability has an earlier owner | R03,R12 |
| 0.3 | Trivial/high-conductor character; odd-p x^k; dyadic sign; changing affinoid chart | Supremum and sufficiently-small-radius distinction sound; common-radius theorem already supplied | R03 |
| 0.4 | Zero/rank-one/rank-two coefficients; nonflat scalar change; torus; SL₂ power series; A=E₀⟨T⟩; cubic-root twist | Affinoid compact-type assertion false; induction multiplication not injective; rank-one Check false | R09,R14 |
| 0.5 | Identity/diagonal transpose action; inverse transpose dictionary; nontrivial coefficient product | BP inverse character and inverse transpose match by substitution | No counterexample found |
| 0.6 | Trivial group; Z=ℤ; Jordan block; finite slopes 0,2; GL₂ normalized index including p=2; P=G; standard algebraic W | General Jacquet normalization sound; one-character support Check false; duplicated analytic-vector foundations | R03,R05,R10 |
| 0.7 | n=2; [K:ℚₚ]=1,2; zero multiplicity; doubled Hecke nilpotent; unramified twists; torus excluded by n≥2 | Arithmetic hypotheses essential; unqualified twist statement lacks realization; torus Check outside carrier | R06,R14 |
| 1.1 | Trivial groups; two noncommuting inverse factors; frame change | Right cocycle order and inverse conversion agree | No counterexample found |
| 1.2 | Identity/split torsor; zero module; sign stabilizer; p-divisible group order; nonflat equalizer | Explicit effectivity and lattice qualifications avoid automatic Banach/coarse descent | No counterexample found; heavy site comparison unproved |
| 1.3 | Smooth rigid versus perfectoid base; effective formal cocycle at every precision | Heuer's smooth/formal restrictions retained | No counterexample found |
| 2.1 | ε=0; odd strict endpoint; dyadic inclusive endpoint; ramified p | Endpoint extension separately named; ramified-generator target duplicates supplier | R02,R04 |
| 2.2 | Identity, diagonal, lower unipotent; κ=1; cubic-root character | Inverse automorphy and coefficient-domain unit condition retained | No counterexample found |
| 2.3 | Algebraic exponent 0, positive, negative; ramified embeddings after inversion | Line/dual normalization consistent; no integral decomposition inferred | No counterexample found |
| 3.1 | Unit/nonunit multiplier; p⁻¹ section; qc denominator versus non-qc growing denominators | Integral/rational comparison retains the necessary local bounds | No counterexample found |
| 3.2 | Identity weight map; nonflat integral change; fixed finite/infinite level; p⁻¹ | Distinct integral/base-change assertions retained | R11 fixed-radius locator |
| 3.3 | Positive radii only; ε=0 excluded; common shrinking radius; representative zero eventually | Colimit relation sound; not identified with ordinary completion | R11 theorem kind |
| 3.4 | Ordinary w=0; ramified differential order; homothetic lattices | Rational comparison does not imply equality of integral lattices | No counterexample found |
| 4.1 | All four equalizers; norm-one central units; determinant/w-coordinate; nontrivial finite kernel | Central multiplier cancels for all congruence units; quotient stack guard retained | No counterexample found |
| 4.2 | Trivial Δ; p dividing order; split torsor; changed section | Rational averaging separated from integral descent | No counterexample found |
| 4.3 | Pairing generator changed by unit u; w=1; character inversion | Pairing multiplier cancels in stated direction | No counterexample found |
| 4.4 | Identity ideal; prime-to-p representative; composed positive scalings | Class representatives supplied by pinned narrow-class API; generality retained | R11 page audit |
| 5.1 | Trivial/nontrivial eigencharacter; value a unit and inverse a unit; rational lattice rescaling | Formal universal line distinguished from geometric O⁺ | No counterexample found |
| 5.2 | Split analytic torsor; functions invariant under translation; valued-point lift | Scalar invariant descent is a new assertion for an analytic, not profinite, torsor | No counterexample found; general proof not certified |
| 5.3 | Trivial χ; order 3; order p; no global torsor section; nonunit integral trivialization | Integral generator explicitly additional theory, not inferred from rational line | No counterexample found; integral effectivity remains to prove |
| 5.4 | Trivial weight; finite character; central pairing; integral inverse | Direction agrees with BHW comparison proof; stronger integral statement kept separate | R04 |
| 5.5 | Frobenius once/twice; dual-lattice factor p; inverse character | Differential-frame direction and its dual distinguished | No counterexample found |
| 6.1 | Hilbert degree 1 versus >1; zero weight; boundary constants; cusp kernel | Koecher excludes modular-curve false analogue | No counterexample found |
| 6.2 | All q>0; coefficient torsion including p-power finite characters; toric boundary | No inference from q=1 alone; positive tensor powers used before Serre vanishing | R11 locators |
| 6.3 | Unit ideal; prime and prime-square ideal; cyclic subgroup count; constants | Degree q^e+q^(e−1) gives 1+q⁻¹ after norm normalization; source's prime-only count not copied | No counterexample found |
| 6.4 | ϖ versus p; ramification e>1; dyadic coefficient algebra; 126/3126 conjugation test | Correct conjugation; improvement for U_pfr^e distinguished from single U_pfr | R11 |
| 6.5 | Constant terms; changed cusp frame; missing Igusa component; dense ordinary locus | Component-coverage and normality hypotheses retained | No counterexample found; geometric coverage to prove |
| 6.6 | Partial-Hasse versus global-Hasse affinoid; rank-zero summand; rational/nonflat integral specialization | Property (Pr) not confused with finite algebraic rank; source affinoid correction retained | R11 |
| 6.7 | One/several p-directions; ∑e_f f_f=d; rational trace versus lattice | Product normalization p⁻ᵈ and sufficient integral renormalization agree | R11 |
| 7.1 | Constant tower; Maps(ℤ/p^i,ℤ/p^m); identity function; non-qc union; zero ring | Limit order correct; nonzero-p Check needs nonzero patch | R14 |
| 7.2 | κ=1; cubic-root translation; conductor beyond fixed stage; p⁻¹ section | Inverse character and completed lattice distinction sound | No counterexample found |
| 7.3 | DVR versus O_Cp; element of valuation 1/2 modulo p; isometric inclusions | Explicit power-bounded-model hypothesis avoids false reduced-special-fibre argument | No counterexample found; model comparison remains to prove |
| 7.4 | Same colimit element at two radii; ordinary restriction; normalized trace at each torsion level | No surjectivity or ordinary control is falsely inferred | No counterexample found |
| 8.1 | n empty; rank 1; W=0; rank-2 noncommuting C,Z | Dual factor order and basis substitution sound | R12 |
| 8.2 | g=1,p=2; integral/nonintegral chart; similitude u≠1; fixed pairing fibre | Unit estimate works dyadically; canonical range distinct from chart estimate | R15 |
| 8.3 | Zero/trivial/rank-two coefficient; exponent −1; extra similitude character | Quotient frame and Tate twist distinguished; determinant line not full representation | No counterexample found |
| 8.4 | n empty; zero rings; trivial χ; det diag(2,3)=6; upper unipotent | Injection true, action headline missing; analytic sheaf not reduced to determinant line | R07,R12 |
| 8.5 | q=0,2,p; Z=0/singular; row chart [1,3] | Matrix identity uses no Z inverse; geometric transport remains conditional on supplied domains | No counterexample found |
| 8.6 | Trivial/rank-two rep; central weight 1; cubic norm-one torus; incompatible cone refinements | General central quotient is wrong; refinements and Tate weight otherwise retained | R01 |
| 8.7 | m′=1; n=0; torus; SL₂ w=1,s; absent finite-flat cover; higher cohomology | Displayed root-shift formula matches BP; rank-one Check uses the wrong Levi Weyl element | R17; R01 where general-data quotient applies |

### Source audit

The count is of locator groups in this table, not individual theorem numbers. A group marked corrected is verified as a locator defect, not as support for the original citation. Source identifiers refer to the service's numbered extractions. No source text is reproduced. Ding's published PDF remains uncertified; its arXiv v2 is a separately identified alternative. The two BHS alternatives verify theorem content but do not certify the inaccessible Lyon copies' pagination.

| Work / groups | Locators checked and source witnesses | Result |
|---|---|---|
| bhw / 9 | Definition 6.1 (line 1843); Definition 6.2 and ensuing weight formula (lines 1852,1861); Definitions 6.4–6.8/Proposition 6.6 (lines 1887,1898,1910,1922); claimed §6.3 ordinary discussion (lines 1933–1944); Theorem 7.14 (line 2135); Lemma 9.2 (line 2797); Lemma 9.7/pairing (line 2918); Definition 10.2 (line 3075); Lemma 10.3/Definition 10.4/Proposition 10.8 (lines 3111,3129,3174) | R11 corrects the definition/remark and ordinary-section locators. Section 6 ends before §7.1; there is no §6.3. Weight inverse and isogeny normalizations agree with the repaired source formulas. |
| aip-adic / 7 | Proposition 2.8 (line 400); Proposition 4.3 (line 698); Lemma 4.4 (line 701); Proposition 4.8 and frame map (lines 812,825); Theorem 6.7 (line 1240); Theorem 8.2/Corollary 8.3 (lines 1467,1484); §§8.4–8.5/Proposition 8.4 (lines 1505,1513,1533,1551) | Analytic radius, universal line, dual Frobenius direction, torsion boundary vanishing and ordinary interpretation checked. The new integral-model comparison is not supplied merely by the last paragraph. |
| aip-cusp / 7 | Proposition 3.14 (line 681); Theorems 3.16–3.17 (lines 715,747); Corollary 3.20/Lemma 3.21 (lines 839,852); Propositions 3.22–3.23/Corollary 3.24 (lines 859,876,890); Lemma 3.25/Corollary 3.26/Lemma 3.27 (lines 902,931,957); Theorem 4.4/Lemma 4.5 (lines 1101,1112); Proposition 6.4 (line 1328) | R11 corrects result kinds and pages. Global-Hasse-affinoid footnote, prime-power isogeny radius, finite-group rationalization and toric vanishing qualifications were checked. |
| bp / 8 | Theorem 4.4.40 (line 3768); Proposition 4.6.9 (line 4360); Propositions 4.6.12,4.6.14,4.6.15 (lines 4427,4459,4476); §§6.2.4–6.2.10 (lines 6885–6956); §6.2.11 (line 6957); §6.2.20 (line 7036); §6.3.1 (line 7092); Proposition 6.3.3/Corollary 6.3.4/Propositions 6.3.6–6.3.7 (lines 7110,7124,7134,7144) | Induction, finite-character extension, open-disc dual topology, root-shift formula and finite-flat trivializing hypotheses checked; its extra rank-one Check needs R17. General central quotient must follow the current supplier correction R01. Relative Banach compactness must not be read as fieldwise compact type, R09. |
| drw / 4 | Remark 3.1.9/Definition 3.1.10 (lines 1055,1066); Definitions 3.1.13–3.1.14 (lines 1111,1118); §3.4 algebraic comparison (line 1708); Remark 3.6.2 (line 1949) | Transpose action and analytic coefficient carriers agree; matrix chart tested directly. Corrected quotient-frame convention is independently supplied. Version is arXiv:2106.00094v3. |
| heuer / 2 | Corollary 1.5 (line 88); Definition 3.7/Proposition 3.8 (line 655 and preceding definition) | Smooth rigid base and formal-unit hypotheses retained. Version is arXiv:2012.07918v2. |
| emerton-analytic / 9 | Definitions 1.2.6,1.2.8,1.2.10 (lines 1158,1230,1339); Theorem 1.2.11 (line 1370); Definition 3.5.3 (line 3303); Corollary 5.3.19/Proposition 5.3.22 (lines 5451,5510); Theorem 6.1.20 (line 5813); Proposition–Definition 6.2.3/Proposition 6.2.4 (lines 5913,5927); Proposition 6.4.1/Definition 6.4.2 (line 6234 onward); Propositions 6.4.5–6.4.6 (lines 6313,6336); Proposition 6.4.7/Definition 6.4.9/Proposition 6.4.10 (lines 6370,6445,6465) | Finite coefficient field, right-flat transitions for left modules, dense Mellin map and essential-admissibility conditions retained. R05 concerns the added Check, not the source theorem. |
| emerton-jacquet / 5 | Definition 3.2.1 (line 1053); Propositions 3.2.4,3.2.6,3.2.12 (lines 1080,1103,1186); Definitions 3.4.1–3.4.5/Proposition 3.4.6 (lines 1532–1565); Theorem 4.2.32 (line 2710); Propositions 4.3.4,4.3.6 (lines 3095,3117) | Bounded-convergence finite-slope carrier, inverse-index Hecke average and algebraic N-invariants checked. General W with B=End_G(W) is supported; irreducibility need not be added. |
| breuil-ding / 1 | Lemma 6.1 and proof (lines 3369–3389) | Integral regular-function model is stated in general n, despite rank-three main application. |
| breuil-hellmann-schraen-une-interpr-tation-modulaire / 4 | Lemma 3.10/Proposition 3.11/Corollary 3.12 (lines 1013,1091,1113); Theorem 3.19 (line 1310); Corollary 3.20 (line 1422); Proposition 5.3 (line 2017) | Legal Breuil author copy verifies local model, density/reducedness and analytic stages. Application to the actual unpatched Π is a target, not supplied automatically by patched notation. Original linked edition's page ranges not certified. |
| breuil-hellmann-schraen-smoothness-and-classicality / 1 | Lemma 3.8 (line 1025) | Legal IHÉS copy verifies finite-projective Cohen–Macaulay argument. Original linked edition's p.24 not certified. |
| chenevier / 2 | Proposition 6.4 (line 829); Lemma 6.5 (line 866) | Semisimple-fibre and embedded-component roles checked in arXiv:math/0301032v1, rather than silently using published numbering. |
| ding-preprint / 1 | §4.2.2 and Proposition 4.14 (lines 2911–2973) | Construction, dimension n[K:ℚₚ], Cohen–Macaulay sheaf and reducedness checked in arXiv:2407.21237v2. Published pp.66–67 remain uncertified. |

### Supplier and pinned-library audit

Current supplier files below are identified by their repository paths. Remote new-roadmap heads were read through the GitHub file service; the five explicitly supplied sibling heads were searched in their supplied local checkouts. Existing roadmaps were read on content main rather than using progress revisions.

| Contract checked | Witness / result |
|---|---|
| AlgebraicVectorBundles L0A–L0C, L2B | TauCetiRoadmap/AlgebraicVectorBundles/README.md:215,228,254,340; sheaf strata and finite locally free operations exist. |
| AutomorphicBundles B0–B5 and general-data extensions | TauCetiRoadmap/AutomorphicBundles/README.md; associated bundles, canonical extensions and classical expansions retained as imports. General central quotient must follow R01. |
| HodgeTateAndCanonicalSubgroups T3–T6 | TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:1484,1504,1518,1725,1759; ramified input already owned, lift locators drifted. R02,R04. |
| PerfectoidShimuraVarieties §§1.30,3.4,5.4–5.10,6.1a–6.3,6.12–6.15 | TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:959,1251,1847,1939; quotient-frame, fixed-pairing and general quotient distinctions inspected. R01,R15. |
| PerfectoidTowers P9.6–P9.13 | TauCetiRoadmap/PerfectoidTowers/README.md; all-open smooth-weight equalizers and matrix-coboundary effectivity exist with their perfectoid/torsor hypotheses. |
| AdicSpacesPartII R0 | TauCetiRoadmap/AdicSpacesPartII/README.md; completed tensors imported rather than built here. |
| AdicSpacesPartIII R3 | TauCetiRoadmap/AdicSpacesPartIII/README.md; associated module sheaf/rational Kiehl comparison is separate from integral coefficient lattices. |
| AdicSpacesPartIV R5.5–R5.7 | TauCetiRoadmap/AdicSpacesPartIV/README.md:1790,1893,2165; smooth products and coefficient-sheaf contracts exist. |
| LocallyAnalyticDistributions L0,L4 | TauCetiRoadmap/LocallyAnalyticDistributions/README.md:257,1245,2642; fieldwise compact type, compact character adapter and universal-radius theorem inspected. R03,R09. |
| PadicMeasuresIwasawaAlgebras L0a | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2201,2213; actual unit-weight geometry is Layer 3a, not L0a. R03. |
| CompletedCohomology | No folder of that name in the supplied content main. Replace the bare name with the actual PartII foundations when correcting R10. |
| CompletedCohomologyPartII | TauCetiRoadmap/CompletedCohomologyPartII/README.md:180,235; F.1/F.4 already own admissibility and analytic vectors. The higher-rank arithmetic application is distinct. |
| PadicFamilies | TauCetiRoadmap/PadicFamilies/README.md:1478,1503,1542,1556,1582,1596,1672; linked-(Pr) spectral charts, eigenpackets and coherent eigenmodule exist. Applying this to Jacquet coefficients still requires the local analytic-stage identifications named in §0.7. |
| Additional earliest owner: PhiGammaModulesAndIwasawaCohomology | TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1247–1278; §4.0 directly supplies compact character representability and scalar Mellin coordinates. R03. |
| Five supplied sibling heads | CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics: no direct supplier citation from this package; searches found no matching ownership of its distinctive analytic induction/Jacquet/Hilbert-weight targets. No web version substituted for those heads. |

Pinned Mathlib commit: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Pinned Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Local checkout hashes match the manifest. Object-level searches covered tensor finiteness/freeness, module topology, determinant norms, number-field integral rank/units, matrix groups and charts, continuous characters, direct limits, narrow classes and the absence of already-developed automorphic analytic carriers. In particular:

| Pinned object | Declaration / file witness |
|---|---|
| Scalar extension of rank | `Module.finrank_baseChange`, Mathlib/LinearAlgebra/Dimension/Constructions.lean:376 |
| Scalar extension of determinant | `LinearMap.det_baseChange`, Mathlib/LinearAlgebra/Charpoly/BaseChange.lean:40 |
| Integral unit norm | `NumberField.isUnit_iff_norm`, Mathlib/NumberTheory/NumberField/Units/Basic.lean:58 |
| Norm as determinant | `Algebra.norm`, Mathlib/RingTheory/Norm/Defs.lean:61; the new norm is a legitimate specialization, not a second general norm theory. |
| Generic product over embeddings | `Algebra.norm_eq_prod_embeddings`, Mathlib/RingTheory/Norm/Transitivity.lean:261; no integral ramified product decomposition follows. |
| General linear determinant | `Matrix.GeneralLinearGroup.det`, Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:93 |
| Narrow classes with coprime representatives | `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime`, TauCeti/NumberTheory/NumberField/NarrowClassGroup/CoprimeRepresentative.lean:138; integer-modulus form at line 162. |


### Complete README identifier ledger

Each row records the first occurrence and section context; the section key refers to the adversarial table above. Imported API entries are retained so that the ownership check is also auditable. Short API suffixes are reproduced as written, without inventing fully qualified declarations.

| Entry | First line | Section |
|---|---:|---|
| AlgebraicVectorBundles | 12 | Scope and ownership |
| AutomorphicBundles | 12 | Scope and ownership |
| HodgeTateAndCanonicalSubgroups | 13 | Scope and ownership |
| PerfectoidShimuraVarieties | 14 | Scope and ownership |
| PerfectoidTowers | 15 | Scope and ownership |
| AdicSpacesPartII | 15 | Scope and ownership |
| AdicSpacesPartIV | 15 | Scope and ownership |
| LocallyAnalyticDistributions | 16 | Scope and ownership |
| restriction | 16 | Scope and ownership |
| PadicMeasuresIwasawaAlgebras | 16 | Scope and ownership |
| CompletedCohomology | 17 | Scope and ownership |
| CompletedCohomologyPartII | 17 | Scope and ownership |
| PadicFamilies | 17 | Scope and ownership |
| Algebra.TensorProduct.leftAlgebra | 44 | Exact supplier contracts |
| Module.Finite.base_change | 44 | Exact supplier contracts |
| Module.Free.tensor | 44 | Exact supplier contracts |
| Module.finrank_baseChange | 44 | Exact supplier contracts |
| moduleTopology | 44 | Exact supplier contracts |
| IsModuleTopology.continuous_of_linearMap | 44 | Exact supplier contracts |
| IsModuleTopology.isTopologicalRing | 44 | Exact supplier contracts |
| PadicInt.compactSpace | 44 | Exact supplier contracts |
| Algebra.norm | 44 | Exact supplier contracts |
| Algebra.norm_apply | 44 | Exact supplier contracts |
| Algebra.norm_eq_prod_embeddings | 44 | Exact supplier contracts |
| LinearMap.det | 44 | Exact supplier contracts |
| LinearMap.det_baseChange | 44 | Exact supplier contracts |
| NumberField.RingOfIntegers.rank | 44 | Exact supplier contracts |
| NumberField.isUnit_iff_norm | 44 | Exact supplier contracts |
| Units.map | 44 | Exact supplier contracts |
| ContinuousMonoidHom.comp | 44 | Exact supplier contracts |
| fst | 44 | Exact supplier contracts |
| snd | 44 | Exact supplier contracts |
| Ideal.span | 44 | Exact supplier contracts |
| Representation | 46 | Exact supplier contracts |
| ContinuousLinearMap | 46 | Exact supplier contracts |
| Module.Projective | 46 | Exact supplier contracts |
| SheafOfModules | 46 | Exact supplier contracts |
| Matrix.fromCols | 46 | Exact supplier contracts |
| fromBlocks | 46 | Exact supplier contracts |
| Matrix.isUnit_iff_isUnit_det | 46 | Exact supplier contracts |
| mul_nonsing_inv | 46 | Exact supplier contracts |
| nonsing_inv_mul | 46 | Exact supplier contracts |
| transpose_mul | 46 | Exact supplier contracts |
| Matrix.GeneralLinearGroup.det | 46 | Exact supplier contracts |
| DirectLimit.Ring.of | 46 | Exact supplier contracts |
| DirectLimit.Ring.lift | 46 | Exact supplier contracts |
| AdicCompletion | 46 | Exact supplier contracts |
| NumberField.NarrowClassGroup | 48 | Exact supplier contracts |
| TauCeti/Algebra/Lie/HighestWeight/Module.lean | 48 | Exact supplier contracts |
| WeightExtension.structureSheafEqualizer | 64 | Exact supplier contracts |
| WeightExtension.integralStructureSheafEqualizer | 64 | Exact supplier contracts |
| ProEtaleSite.invariant_subsheaf | 64 | Exact supplier contracts |
| integral_matrix_coboundary_effectivity | 64 | Exact supplier contracts |
| AdicSpacesPartIII | 66 | Exact supplier contracts |
| Op F p | 78 | 0.1 The integral algebra at (p) and its norm |
| compactSpace_Op | 78 | 0.1 The integral algebra at (p) and its norm |
| finrank_Op | 78 | 0.1 The integral algebra at (p) and its norm |
| normAlgebra F p | 78 | 0.1 The integral algebra at (p) and its norm |
| normUnits F p | 78 | 0.1 The integral algebra at (p) and its norm |
| unitsToOp | 78 | 0.1 The integral algebra at (p) and its norm |
| norm_tmul_one | 78 | 0.1 The integral algebra at (p) and its norm |
| continuous_normUnits | 78 | 0.1 The integral algebra at (p) and its norm |
| normUnits_unitsToOp | 78 | 0.1 The integral algebra at (p) and its norm |
| normUnits_embeddings | 78 | 0.1 The integral algebra at (p) and its norm |
| Op | 82 | 0.1 The integral algebra at (p) and its norm |
| normAlgebra | 85 | 0.1 The integral algebra at (p) and its norm |
| normUnits | 88 | 0.1 The integral algebra at (p) and its norm |
| principalUnits F p r | 95 | 0.1 The integral algebra at (p) and its norm |
| mem_principalUnits_iff | 95 | 0.1 The integral algebra at (p) and its norm |
| principalUnits_antitone | 95 | 0.1 The integral algebra at (p) and its norm |
| open_finiteIndex_principalUnits | 95 | 0.1 The integral algebra at (p) and its norm |
| GeomWeight F p R | 105 | 0.2 Weight spaces and the inverse norm convention |
| ArithWeight F p R | 105 | 0.2 Weight spaces and the inverse norm convention |
| ArithWeight.mk w t | 105 | 0.2 Weight spaces and the inverse norm convention |
| arithWeight_restrict_left | 105 | 0.2 Weight spaces and the inverse norm convention |
| arithWeight_restrict_right | 105 | 0.2 Weight spaces and the inverse norm convention |
| arithWeight_mk_unique | 105 | 0.2 Weight spaces and the inverse norm convention |
| hilbertWeightSpace | 105 | 0.2 Weight spaces and the inverse norm convention |
| arithmeticWeightSpace | 105 | 0.2 Weight spaces and the inverse norm convention |
| GeomWeight | 109 | 0.2 Weight spaces and the inverse norm convention |
| ArithWeight.mk | 110 | 0.2 Weight spaces and the inverse norm convention |
| ArithWeight | 117 | 0.2 Weight spaces and the inverse norm convention |
| ArithWeight.mk w 1 | 123 | 0.2 Weight spaces and the inverse norm convention |
| ArithWeight.mk 1 t | 124 | 0.2 Weight spaces and the inverse norm convention |
| weightDualMap | 127 | 0.2 Weight spaces and the inverse norm convention |
| weightMap | 127 | 0.2 Weight spaces and the inverse norm convention |
| weightMap_mk_apply | 127 | 0.2 Weight spaces and the inverse norm convention |
| weightMap_norm_factor | 127 | 0.2 Weight spaces and the inverse norm convention |
| weightMap_totallyPositiveUnit | 127 | 0.2 Weight spaces and the inverse norm convention |
| Suggested.lean | 132 | 0.2 Weight spaces and the inverse norm convention |
| congruence_unit_norm_one | 136 | 0.2 Weight spaces and the inverse norm convention |
| weightMap_mk_congruenceUnit | 136 | 0.2 Weight spaces and the inverse norm convention |
| proWeightRadius | 146 | 0.3 Analytic radii and bounded families |
| proWeightRadius_lt_one | 153 | 0.3 Analytic radii and bounded families |
| continuousCharacter_eventuallyAnalytic | 153 | 0.3 Analytic radii and bounded families |
| boundedWeightFamily | 161 | 0.3 Analytic radii and bounded families |
| boundedWeightFamily.restrict | 161 | 0.3 Analytic radii and bounded families |
| pullback | 161 | 0.3 Analytic radii and bounded families |
| changeRadius | 161 | 0.3 Analytic radii and bounded families |
| finiteAnalyticCoefficient A H | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientTensor | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientDual | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientBaseChange | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientTensor_action | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientDual_eval | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientBaseChange_action | 171 | 0.4 Finite analytic coefficients and analytic induction |
| coefficientTensor_rank | 171 | 0.4 Finite analytic coefficients and analytic induction |
| finiteAnalyticCoefficient | 175 | 0.4 Finite analytic coefficients and analytic induction |
| analyticInduction M1 n κ | 181 | 0.4 Finite analytic coefficients and analytic induction |
| locallyAnalyticInduction | 187 | 0.4 Finite analytic coefficients and analytic induction |
| analyticInduction.iwahoriChart | 187 | 0.4 Finite analytic coefficients and analytic induction |
| leftAction | 187 | 0.4 Finite analytic coefficients and analytic induction |
| restrict | 187 | 0.4 Finite analytic coefficients and analytic induction |
| positiveAction | 187 | 0.4 Finite analytic coefficients and analytic induction |
| locallyAnalyticInduction.compactType | 187 | 0.4 Finite analytic coefficients and analytic induction |
| analyticDistribution | 189 | 0.4 Finite analytic coefficients and analytic induction |
| locallyAnalyticDistribution | 189 | 0.4 Finite analytic coefficients and analytic induction |
| analyticDistribution.projectiveBanach | 189 | 0.4 Finite analytic coefficients and analytic induction |
| locallyAnalyticDistribution.pairing | 189 | 0.4 Finite analytic coefficients and analytic induction |
| analyticInduction | 193 | 0.4 Finite analytic coefficients and analytic induction |
| algebraicInduction_injective | 200 | 0.4 Finite analytic coefficients and analytic induction |
| finiteCharacterInduction_comparison | 200 | 0.4 Finite analytic coefficients and analytic induction |
| analyticInduction M1 n (κχ) | 200 | 0.4 Finite analytic coefficients and analytic induction |
| inductionProduct | 200 | 0.4 Finite analytic coefficients and analytic induction |
| siegelAnalyticCoefficient κ r | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelAnalyticCoefficient.integral | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelTransposeAction h | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelTransposeAction.mul | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| isometry | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| integralStable | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| radiusCompatible | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelCoefficientProduct | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelCoefficientProduct.equivariant | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| normBound | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| associative | 228 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelAnalyticCoefficient | 232 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| siegelTransposeAction | 235 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| bpSiegelInduction_comparison | 239 | 0.5 Normalized Siegel coefficients and the induction dictionary |
| groupAnalyticDistributions H | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| frechetSteinStructure A | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| coadmissibleModule A | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| groupDistributions_frechetStein | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| coadmissibleModule.stageRecovery | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| closedKernel | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| hausdorffCokernel | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| finiteSum | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| presentationIndependent | 252 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| groupAnalyticDistributions | 256 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| frechetSteinStructure | 259 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| coadmissibleModule | 262 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| analyticVectors V | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| analyticVectors.inclusion | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| localOrbitCriterion | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| functoriality | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| conjugation | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| admissibleBanachRepresentation | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| admissibleBanach_closedRegularEmbedding | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| analyticVectors_stronglyAdmissible | 266 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| admissibleAnalyticRepresentation | 268 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| admissibleAnalytic_duality | 268 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| admissibleAnalytic_closedKernel | 268 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| analyticVectors | 272 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| fullCharacterSpace Z | 282 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| fullCharacterSpace.product | 282 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| fullCharacterSpace.compactMellinEquiv | 282 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| essentiallyAdmissibleRepresentation | 284 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| essentiallyAdmissible_independentH | 284 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| admissible_implies_essentiallyAdmissible | 284 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| essentiallyAdmissible_abelian | 284 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| abelianDual_coherentSheaf | 284 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| fullCharacterSpace | 288 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| finiteSlopePart Zplus V | 295 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| finiteSlopePart.evaluation | 295 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| finiteSlopePart.leftExact | 295 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| finiteSlopePart.characterEigenspace | 295 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| positiveJacquetHecke m | 297 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| locallyAnalyticJacquet P V | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| jacquet_MAction | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| jacquet_independentN0 | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| jacquet_leftExact | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| jacquet_essentiallyAdmissible | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| jacquet_smoothComparison | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| jacquet_locallyAlgebraicComparison | 303 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| finiteSlopePart | 307 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| positiveJacquetHecke | 310 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| locallyAnalyticJacquet | 313 | 0.6 General analytic vectors, coadmissibility and Jacquet coefficients |
| unitaryCompletedCoefficient | 319 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryCompletedCoefficient.localAction | 327 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| tameHecke | 327 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| integralLattice | 327 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| localRegularity | 327 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryJacquetCoefficients | 335 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryJacquetCoefficients.coherent | 335 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryCoefficientEigenvariety | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryEigenvariety_points | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryClassicalPoint | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryClassicalPoint.eigenvectorCriterion | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| locallyAlgebraicWeight | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unramifiedTwist | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryEigenvariety_dimension | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryJacquetSheaf_cohenMacaulay | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryEigenvariety_reduced | 337 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryJacquet_fredholmNormalization | 339 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryJacquet_projectiveCharts | 340 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryClassicalPoints_accumulate | 341 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| unitaryClassicalHecke_semisimple | 342 | 0.7 Definite unitary completed coefficients and Jacquet geometry |
| RightAutomorphyCocycle | 380 | 1.1 Right cocycles, inversion and change of frame |
| rightCocycle_one | 387 | 1.1 Right cocycles, inversion and change of frame |
| rightCocycle_inv | 387 | 1.1 Right cocycles, inversion and change of frame |
| right_cocycle_of_left | 387 | 1.1 Right cocycles, inversion and change of frame |
| rightCocycle_gauge | 387 | 1.1 Right cocycles, inversion and change of frame |
| analyticCoefficientSheaf q ρ J | 397 | 1.2 Analytic coefficient equalizers and functoriality |
| analyticCoefficientSheaf.section_iff | 397 | 1.2 Analytic coefficient equalizers and functoriality |
| map_intertwiner | 397 | 1.2 Analytic coefficient equalizers and functoriality |
| gauge_equiv | 397 | 1.2 Analytic coefficient equalizers and functoriality |
| pullback_map | 397 | 1.2 Analytic coefficient equalizers and functoriality |
| coefficientFunctions_siteComparison | 397 | 1.2 Analytic coefficient equalizers and functoriality |
| coefficientDescent_rank | 399 | 1.2 Analytic coefficient equalizers and functoriality |
| coefficientDescent_tensor_iso | 399 | 1.2 Analytic coefficient equalizers and functoriality |
| coefficientDescent_dual_iso | 399 | 1.2 Analytic coefficient equalizers and functoriality |
| denseOpenLine_analytic | 410 | 1.3 Analytic effectivity of line coefficients |
| formalUnitCocycle_analytic | 412 | 1.3 Analytic effectivity of line coefficients |
| HilbertCoefficientDomain κ n ε | 426 | 2.1 Admitted coefficient domains |
| hilbertDomain.restrict | 434 | 2.1 Admitted coefficient domains |
| forgetLevel | 434 | 2.1 Admitted coefficient domains |
| atkinLehner | 434 | 2.1 Admitted coefficient domains |
| hilbertPeriod_endpointExtension | 436 | 2.1 Admitted coefficient domains |
| hilbertPeriod_unsplitRamifiedGenerator | 436 | 2.1 Admitted coefficient domains |
| HilbertCoefficientDomain | 440 | 2.1 Admitted coefficient domains |
| hilbertFactor γ x = cz(x)+d | 446 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertFactor_unit | 446 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertFactor_analytic | 446 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertFactor_leftCocycle | 446 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertWeightFactor κ γ x = κ(j_γ(x))⁻¹ | 446 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertFactor | 450 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertWeightFactor | 452 | 2.2 The Hilbert factor and rational coefficient line |
| geometricHilbertSheaf κ n ε | 455 | 2.2 The Hilbert factor and rational coefficient line |
| geometricHilbertSheaf.section_iff | 455 | 2.2 The Hilbert factor and rational coefficient line |
| locallyFree_one | 455 | 2.2 The Hilbert factor and rational coefficient line |
| levelPullback | 455 | 2.2 The Hilbert factor and rational coefficient line |
| radiusPullback | 455 | 2.2 The Hilbert factor and rational coefficient line |
| hilbertAlgebraicSpecialisation | 470 | 2.3 Algebraic specialization |
| integralHilbertSheaf κ n ε | 484 | 3.1 Geometric integral coefficients and rationalization |
| integralHilbertSheaf.inject | 484 | 3.1 Geometric integral coefficients and rationalization |
| integralHilbertSheaf.restrict | 484 | 3.1 Geometric integral coefficients and rationalization |
| integralHilbertSheaf.rationalise | 484 | 3.1 Geometric integral coefficients and rationalization |
| integralHilbertSheaf.locallyFree_one | 486 | 3.1 Geometric integral coefficients and rationalization |
| integralHilbertSheaf | 490 | 3.1 Geometric integral coefficients and rationalization |
| hilbertWeightPullback | 497 | 3.2 Weight pullback and fixed-radius forms |
| integralHilbertWeightPullback | 497 | 3.2 Weight pullback and fixed-radius forms |
| fixedRadiusHilbertForms κ n ε c | 505 | 3.2 Weight pullback and fixed-radius forms |
| integralFixedRadiusHilbertForms | 505 | 3.2 Weight pullback and fixed-radius forms |
| fixedRadiusHilbertForms.restrictRadius | 505 | 3.2 Weight pullback and fixed-radius forms |
| changeLevel | 505 | 3.2 Weight pullback and fixed-radius forms |
| integralInclusion | 505 | 3.2 Weight pullback and fixed-radius forms |
| overconvergentHilbertForms κ n c | 523 | 3.3 The positive-radius colimit |
| integralOverconvergentHilbertForms | 523 | 3.3 The positive-radius colimit |
| overconvergentHilbertForms.representative | 523 | 3.3 The positive-radius colimit |
| eventualEquality | 523 | 3.3 The positive-radius colimit |
| lift | 523 | 3.3 The positive-radius colimit |
| cofinalRadius | 523 | 3.3 The positive-radius colimit |
| hilbertModifiedCoefficient | 539 | 3.4 The ramified differential-lattice application |
| modifiedCoefficient.frame | 539 | 3.4 The ramified differential-lattice application |
| modifiedCoefficient.hodgeInclusion | 539 | 3.4 The ramified differential-lattice application |
| modifiedCoefficient.ordinaryComparison | 539 | 3.4 The ramified differential-lattice application |
| smallGeometricCoefficient κ n | 565 | 4.1 Four independently defined equalizers |
| fullGeometricCoefficient κ n | 566 | 4.1 Four independently defined equalizers |
| intermediateArithmeticCoefficient w t n | 567 | 4.1 Four independently defined equalizers |
| fullArithmeticCoefficient w t n | 568 | 4.1 Four independently defined equalizers |
| section_iff | 570 | 4.1 Four independently defined equalizers |
| radiusMap | 570 | 4.1 Four independently defined equalizers |
| levelMap | 570 | 4.1 Four independently defined equalizers |
| smallGeometricCoefficient | 574 | 4.1 Four independently defined equalizers |
| fullGeometricCoefficient | 575 | 4.1 Four independently defined equalizers |
| intermediateArithmeticCoefficient | 576 | 4.1 Four independently defined equalizers |
| fullArithmeticCoefficient | 577 | 4.1 Four independently defined equalizers |
| arithmeticMultiplier_central | 580 | 4.1 Four independently defined equalizers |
| arithmeticAction_representativeIndependent | 586 | 4.1 Four independently defined equalizers |
| geometricCoverCoefficient_comparison | 599 | 4.2 Geometric comparison and finite polarization descent |
| twistedPolarisationAction ε | 607 | 4.2 Geometric comparison and finite polarization descent |
| twistedPolarisationAction_factors | 607 | 4.2 Geometric comparison and finite polarization descent |
| finitePolarisationDescent | 607 | 4.2 Geometric comparison and finite polarization descent |
| intermediateArithmeticCoefficient_comparison | 607 | 4.2 Geometric comparison and finite polarization descent |
| twistedPolarisationAction | 611 | 4.2 Geometric comparison and finite polarization descent |
| pairingWeight_transform | 623 | 4.3 Weil pairing and the arithmetic coefficient |
| weilPairingCoefficient_comparison | 629 | 4.3 Weil pairing and the arithmetic coefficient |
| arithmeticClassForms | 639 | 4.4 Forms across polarization classes |
| polarisationTransport_comp | 639 | 4.4 Forms across polarization classes |
| polarisationTransport_principalIdeal | 639 | 4.4 Forms across polarization classes |
| arithmeticClassForms_finiteRepresentatives | 639 | 4.4 Forms across polarization classes |
| arithmeticClassForms_choiceIndependent | 639 | 4.4 Forms across polarization classes |
| aipAnalyticCoefficient κ | 659 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipIntegralCoefficient κ | 659 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipCoefficient.eigencondition | 659 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| restrictChart | 659 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| changeWeight | 659 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| translationUnits | 659 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipUniversalFormalLine | 661 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipTranslation_valuationUnit | 663 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipAnalyticCoefficient | 667 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipIntegralCoefficient | 667 | 5.1 AIP analytic eigenfunctions and the formal universal line |
| aipTorsor_structureInvariants | 684 | 5.2 Structure invariants on the analytic frame torsor |
| aipTorsor_valuedPointLift | 684 | 5.2 Structure invariants on the analytic frame torsor |
| aipTorsor_reflectsBounds | 684 | 5.2 Structure invariants on the analytic frame torsor |
| aipFiniteCharacter χ | 688 | 5.3 The finite character and integral generators |
| aipFullFormalCoefficient | 688 | 5.3 The finite character and integral generators |
| finiteCharacterGenerator χ σ | 690 | 5.3 The finite character and integral generators |
| finiteCharacterGenerator.unit | 690 | 5.3 The finite character and integral generators |
| evaluate_section | 690 | 5.3 The finite character and integral generators |
| change_section | 690 | 5.3 The finite character and integral generators |
| finiteCharacter_integralBaseGenerator | 692 | 5.3 The finite character and integral generators |
| aipFullIntegral_modelComparison | 692 | 5.3 The finite character and integral generators |
| aipFiniteCharacter | 696 | 5.3 The finite character and integral generators |
| finiteCharacterGenerator | 697 | 5.3 The finite character and integral generators |
| geometricAip_comparison | 714 | 5.4 Perfectoid–AIP coefficient comparisons |
| geometricAip_integralComparison | 714 | 5.4 Perfectoid–AIP coefficient comparisons |
| arithmeticAip_comparison | 718 | 5.4 Perfectoid–AIP coefficient comparisons |
| aipComparison_natural | 718 | 5.4 Perfectoid–AIP coefficient comparisons |
| aipFrobenius_restriction | 722 | 5.5 Frobenius and restriction |
| aipFrobenius_iterate | 722 | 5.5 Frobenius and restriction |
| aipFrobenius_weightMap | 722 | 5.5 Frobenius and restriction |
| hilbertCuspSheaf κ | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| fixedRadiusHilbertCuspForms | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| overconvergentHilbertCuspForms | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| hilbertCuspSheaf.inclusion | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| cuspForms_boundaryKernel | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| cuspForms_radiusMap | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| cuspForms_weightMap | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| cuspForms_classDescent | 736 | 6.1 Cuspidality and analytic-family Koecher extension |
| hilbertCuspSheaf | 740 | 6.1 Cuspidality and analytic-family Koecher extension |
| hilbertFamily_Koecher | 744 | 6.1 Cuspidality and analytic-family Koecher extension |
| hilbertCusp_torsionHigherVanishing | 760 | 6.2 Integral boundary vanishing and its coefficient consequence |
| cuspidalCoefficient_pushforwardVanishing | 764 | 6.2 Integral boundary vanishing and its coefficient consequence |
| tameHilbertHecke a | 774 | 6.3 Tame Hecke correspondences with their actual degrees |
| tameHilbertHecke.integral | 782 | 6.3 Tame Hecke correspondences with their actual degrees |
| cusp | 782 | 6.3 Tame Hecke correspondences with their actual degrees |
| radius | 782 | 6.3 Tame Hecke correspondences with their actual degrees |
| weight | 782 | 6.3 Tame Hecke correspondences with their actual degrees |
| level | 782 | 6.3 Tame Hecke correspondences with their actual degrees |
| classTransport | 782 | 6.3 Tame Hecke correspondences with their actual degrees |
| tameHilbertHecke_constant | 784 | 6.3 Tame Hecke correspondences with their actual degrees |
| tameHilbertHecke | 788 | 6.3 Tame Hecke correspondences with their actual degrees |
| wildHilbertHecke pfr | 795 | 6.4 Wild Hecke correspondences and diamonds |
| wildCoefficientMap.integral | 795 | 6.4 Wild Hecke correspondences and diamonds |
| uniformizerIndependent | 795 | 6.4 Wild Hecke correspondences and diamonds |
| HilbertAutomorphy.lowerFactor γ z=γ₁₀z+γ₁₁ | 797 | 6.4 Wild Hecke correspondences and diamonds |
| lowerFactor_one | 797 | 6.4 Wild Hecke correspondences and diamonds |
| lowerFactor_diagonal | 797 | 6.4 Wild Hecke correspondences and diamonds |
| wild_factor_conjugation | 797 | 6.4 Wild Hecke correspondences and diamonds |
| lowerFactor (diag(ϖ,1) γ diag(ϖ⁻¹,1)) (ϖz)=lowerFactor γ z | 797 | 6.4 Wild Hecke correspondences and diamonds |
| lowerFactor | 801 | 6.4 Wild Hecke correspondences and diamonds |
| wildHilbertHecke.partialRadiusImprovement | 805 | 6.4 Wild Hecke correspondences and diamonds |
| hilbertDiamond | 807 | 6.4 Wild Hecke correspondences and diamonds |
| hilbertDiamond.one | 807 | 6.4 Wild Hecke correspondences and diamonds |
| mul | 807 | 6.4 Wild Hecke correspondences and diamonds |
| inv | 807 | 6.4 Wild Hecke correspondences and diamonds |
| cuspStable | 807 | 6.4 Wild Hecke correspondences and diamonds |
| coefficientComparison | 807 | 6.4 Wild Hecke correspondences and diamonds |
| wildHilbertHecke | 811 | 6.4 Wild Hecke correspondences and diamonds |
| aipComparison_HeckeEquivariant | 816 | 6.4 Wild Hecke correspondences and diamonds |
| familyHilbertQExpansion c | 825 | 6.5 Family Fourier expansions and their comparison |
| familyQExpansion_changeFrame | 825 | 6.5 Family Fourier expansions and their comparison |
| algebraicSpecialisation | 825 | 6.5 Family Fourier expansions and their comparison |
| familyQExpansion_injective | 827 | 6.5 Family Fourier expansions and their comparison |
| familyQExpansion_cusp_iff | 827 | 6.5 Family Fourier expansions and their comparison |
| aipComparison_qExpansion | 827 | 6.5 Family Fourier expansions and their comparison |
| familyHilbertQExpansion | 831 | 6.5 Family Fourier expansions and their comparison |
| hilbertCuspBanach U v | 838 | 6.6 Cuspidal Banach modules and compact restrictions |
| hilbertCuspBanach.propertyPr | 838 | 6.6 Cuspidal Banach modules and compact restrictions |
| hilbertCuspBanach.specialisationSurjective | 838 | 6.6 Cuspidal Banach modules and compact restrictions |
| hilbertCuspBanach_weightBaseChange | 840 | 6.6 Cuspidal Banach modules and compact restrictions |
| cuspRadiusRestriction | 842 | 6.6 Cuspidal Banach modules and compact restrictions |
| cuspRadiusRestriction_completelyContinuous | 842 | 6.6 Cuspidal Banach modules and compact restrictions |
| hilbertCuspBanach | 846 | 6.6 Cuspidal Banach modules and compact restrictions |
| hilbertControllingOperator | 862 | 6.7 A controlling operator and integral renormalization |
| controllingOperator_factorisation | 862 | 6.7 A controlling operator and integral renormalization |
| hilbertControllingOperator_completelyContinuous | 862 | 6.7 A controlling operator and integral renormalization |
| wildHecke_renormalizedIntegral | 864 | 6.7 A controlling operator and integral renormalization |
| controllingOperator_renormalizedIntegral | 864 | 6.7 A controlling operator and integral renormalization |
| ordinaryCompletedFunctionsPlus | 885 | 7.1 Complete the torsion-level functions before inverting p |
| ordinaryCompletedFunctions | 891 | 7.1 Complete the torsion-level functions before inverting p |
| ordinaryCompletedFunctionsPlus.projection | 891 | 7.1 Complete the torsion-level functions before inverting p |
| complete | 891 | 7.1 Complete the torsion-level functions before inverting p |
| separated | 891 | 7.1 Complete the torsion-level functions before inverting p |
| torsionFree | 891 | 7.1 Complete the torsion-level functions before inverting p |
| ordinaryCompletedFunctions.action | 891 | 7.1 Complete the torsion-level functions before inverting p |
| ordinaryWeightedFormsPlus κ | 912 | 7.2 Weighted ordinary equalizers |
| ordinaryWeightedForms κ | 912 | 7.2 Weighted ordinary equalizers |
| ordinaryWeightedForms.section_iff | 912 | 7.2 Weighted ordinary equalizers |
| arithmeticComparison | 912 | 7.2 Weighted ordinary equalizers |
| ordinaryWeightedFormsPlus | 916 | 7.2 Weighted ordinary equalizers |
| ordinaryWeightedForms | 925 | 7.2 Weighted ordinary equalizers |
| ordinaryIgusa_completionComparison | 931 | 7.3 The analytic completion comparison |
| ordinaryIgusa_completionComparison.isometric | 938 | 7.3 The analytic completion comparison |
| ordinaryIgusa_powerBoundedModel | 938 | 7.3 The analytic completion comparison |
| ordinaryWeightedLattice_modelComparison | 940 | 7.3 The analytic completion comparison |
| ordinaryRestriction | 944 | 7.4 Restriction from positive radii |
| overconvergent_to_ordinary | 944 | 7.4 Restriction from positive radii |
| ordinaryAip_comparison | 944 | 7.4 Restriction from positive radii |
| ordinaryRestriction_Hecke | 946 | 7.4 Restriction from positive radii |
| ordinaryRestriction_qExpansion | 946 | 7.4 Restriction from positive radii |
| HodgeTate.siegelGraphChart_act | 966 | 8.1 Applying the supplied row chart and changing symplectic basis |
| HodgeTate.hodgeFrame_transform | 966 | 8.1 Applying the supplied row chart and changing symplectic basis |
| antidiagonalDualFactor W A C Z = W(A+ZC)ᵀW | 968 | 8.1 Applying the supplied row chart and changing symplectic basis |
| antidiagonalDualFactor_add | 968 | 8.1 Applying the supplied row chart and changing symplectic basis |
| antidiagonalDualFactor_basisChange | 968 | 8.1 Applying the supplied row chart and changing symplectic basis |
| antidiagonal_dual_factor | 968 | 8.1 Applying the supplied row chart and changing symplectic basis |
| antidiagonalDualFactor | 980 | 8.1 Applying the supplied row chart and changing symplectic basis |
| siegelFactor_neighbourhood | 986 | 8.2 The coefficient action on a Siegel period domain |
| siegelScalarCoefficient χ w | 998 | 8.3 Scalar and finite algebraic coefficients |
| siegelScalarCoefficient.section_iff | 998 | 8.3 Scalar and finite algebraic coefficients |
| siegelDeterminantHodge_specialisation | 998 | 8.3 Scalar and finite algebraic coefficients |
| siegelAlgebraicCoefficient ρ w | 1000 | 8.3 Scalar and finite algebraic coefficients |
| siegelAlgebraicCoefficient_comparison | 1000 | 8.3 Scalar and finite algebraic coefficients |
| siegelScalarCoefficient | 1004 | 8.3 Scalar and finite algebraic coefficients |
| siegelAlgebraicCoefficient | 1006 | 8.3 Scalar and finite algebraic coefficients |
| determinantLineMap χ | 1017 | 8.4 The determinant eigenline and induced analytic sheaf |
| determinantLineMap_injective | 1017 | 8.4 The determinant eigenline and induced analytic sheaf |
| determinantLineMap_translation | 1017 | 8.4 The determinant eigenline and induced analytic sheaf |
| siegelAnalyticSheaf κ w | 1025 | 8.4 The determinant eigenline and induced analytic sheaf |
| siegelIntegralAnalyticSheaf | 1025 | 8.4 The determinant eigenline and induced analytic sheaf |
| siegelAnalyticSheaf.restrictRadius | 1025 | 8.4 The determinant eigenline and induced analytic sheaf |
| coefficientMap | 1025 | 8.4 The determinant eigenline and induced analytic sheaf |
| siegelDeterminantLine_injective | 1027 | 8.4 The determinant eigenline and induced analytic sheaf |
| siegelAlgebraicInduction_injective | 1027 | 8.4 The determinant eigenline and induced analytic sheaf |
| siegelAnalyticSheaf | 1031 | 8.4 The determinant eigenline and induced analytic sheaf |
| atkin_lehner_chart | 1044 | 8.5 Atkin–Lehner and the other graph chart |
| siegelAtkinLehner_coefficientTransport | 1050 | 8.5 Atkin–Lehner and the other graph chart |
| toroidalAnalyticCoefficient | 1060 | 8.6 General toroidal and datum-specific analytic coefficients |
| toroidalCoefficient.section_iff | 1060 | 8.6 General toroidal and datum-specific analytic coefficients |
| radiusRestriction | 1060 | 8.6 General toroidal and datum-specific analytic coefficients |
| commonRefinement | 1060 | 8.6 General toroidal and datum-specific analytic coefficients |
| toroidalAlgebraicCoefficient_comparison | 1062 | 8.6 General toroidal and datum-specific analytic coefficients |
| reducedDomainCoefficient | 1064 | 8.6 General toroidal and datum-specific analytic coefficients |
| reducedDomainCoefficient.section_iff | 1064 | 8.6 General toroidal and datum-specific analytic coefficients |
| changeRepresentation | 1064 | 8.6 General toroidal and datum-specific analytic coefficients |
| changeReduction | 1064 | 8.6 General toroidal and datum-specific analytic coefficients |
| algebraicComparison | 1064 | 8.6 General toroidal and datum-specific analytic coefficients |
| bruhatCoefficientFamily | 1085 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatDistributionFamily | 1092 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatCoefficientFamily.radiusMap | 1092 | 8.7 Bruhat-domain families in all cohomological degrees |
| changeCoefficient | 1092 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatDistributionFamily.radiusMap | 1092 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatCoefficient_algebraicInjection | 1092 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatCoefficient_finiteCharacter | 1092 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatCoefficient_locallyProjectiveBanach | 1094 | 8.7 Bruhat-domain families in all cohomological degrees |
| bruhatCoefficient_cohomologyComparison | 1094 | 8.7 Bruhat-domain families in all cohomological degrees |

## Not verifiable

- **Lean elaboration:** no Lean command or build was run, as required. The 17 example proofs were inspected as text; actual elaboration, instance synthesis, universe inference and the retained binder lists have not been independently compiler-certified. The context table records the binders inferred from types. In particular, it makes no claim that a successful `sorry` build proves a theorem true.
- **Exact published Ding PDF:** the sources service classified the published PDF as uncertified/paywalled and did not fetch it. The separately fetched arXiv:2407.21237v2 contains §4.2.2 and Proposition 4.14 with the required construction, but its pagination cannot certify the published pp.66–67. This settled uncertified citation is not a missing-reference request.
- **Exact linked BHS editions:** the two Lyon author links did not yield readable copies. Legal alternatives from Breuil's author page and the IHÉS repository were read. Their named results support the local arguments, but the original linked page ranges remain uncertified. R13 requires recording which editions are actually used. No mathematical verdict relies solely on the inaccessible page ranges.
- **Heavy new geometry:** finite-character integral effectivity, coefficient-function comparisons across sites, complete ordinary power-bounded models, componentwise Igusa expansion coverage and the actual unpatched arithmetic-stage/classicality proofs are named new targets. Source analogues and boundary conditions were checked; this review does not manufacture proofs of those future library targets. Their absence from today's pinned library is not itself a defect.
- **Exhaustive supplier graph:** the gate reported only six roadmap nodes. The direct named suppliers were separately audited, but this cannot certify every transitive dependency in the full roadmap collection. The five supplied sibling heads had no direct citations to check. No UPWARD or CYCLE line was observed for this package.

All thirteen cited works have a legally readable version for the mathematical checks, with the edition qualifications above. The initially missing BHW landing-page entry was resolved by the open publisher PDF; the stale Ding landing-page entry was superseded by its uncertified publication record and readable preprint. There is no unresolved text request in the scratch needs-references list.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5c852223830ff3c49b02bbbed08097aea9a96cea", "job": "RT-OverconvergentAutomorphicForms~1a", "model": "gpt-6-astra", "worker": "chris-1"} -->

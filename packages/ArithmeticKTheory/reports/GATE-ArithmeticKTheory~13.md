# Human-review response for ArithmeticKTheory

One review (roed-math, 2026-11-06T06:18:37Z) makes two coordination points: the function-field Steinberg homology that EllipticKTheory asks of §3.2 (H01), and the finite-stage invariant-form comparison that BorelRegulators asks of §3.4 (H02). The review requests no change. H01 is answered, with a clarifying scope clause. H02 is applied: §3.4 promised "the stable arithmetic-group comparison with relative Lie algebra cohomology" as a proof target without stating it, and it now states Borel's finite-stage comparison with an exact range. Commit `6c0c743c` on top of `00f60c5`.

## H01 (roed-math) — answered

This roadmap does not take on the function-field case, and EllipticKTheory should carry gap:function-field-steinberg-homology as its own target. §3.2 proves Steinberg-homology finiteness only for O_F, by duality on a torsion-free finite-index subgroup (projectiveSteinbergHomology_fg, `TauCetiRoadmap/ArithmeticKTheory/README.md:1040-1058`). For curves that route is unavailable, because every finite-index subgroup of SL₂(𝔽_q[t]) contains a unipotent element of order p. The inputs the curve proof does need (Harder–Narasimhan filtrations and bounded bundle loci) are AutomorphicLFunctionsAndLocalFactors AL.3.10.5 and AL.3.10.7. That roadmap is at position 80 in the merge order, so EllipticKTheory (position 363) can consume them directly.

Supporting evidence:

- **The §3.2 criterion is general.** It is stated for every Dedekind domain (`README.md:1106-1116`), as EllipticKTheory's own supplier paragraph says (`TauCetiRoadmap/EllipticKTheory/README.md:408-414` at `356badf`). EllipticKTheory's use of the criterion is therefore correct.
- **Only its gap request is misdirected.** It asks for function-field homology finiteness (`:416-420`, `:1458-1467`). Moving that here would add a curve-over-finite-field layer to a number-field roadmap.
- **The torsion obstruction.** The unipotent subgroup {[[1,f],[0,1]]} is isomorphic to (𝔽_q[t],+), which is infinite, so it meets every finite-index subgroup nontrivially. Each of its nontrivial elements has order p; for example [[1,t],[0,1]]² = I over 𝔽₂.
- **No other owner exists.** Searches of main and the open heads (`roadmaps grep` for "function-field-steinberg", "Grayson", Harder's reduction theory) find the function-field Steinberg homology only in EllipticKTheory's request.

The README now states the division of labour explicitly:

- Scope and ownership, `README.md:77-84`: "Smooth curves over finite fields, … lie outside the present scope" → the same exclusion, plus a statement that the Steinberg hypothesis is proved here only for rings of integers of number fields, and that a curve consumer supplies it for its ring.
- §3.2, `README.md:1119-1125`: "The source also states a function-field result, which is not needed for this number-field argument" → the reason above, with the SL₂(𝔽_q[t]) obstruction. The K-book, IV.6.9, p. 325 (kbook line 19064–19066) states both cases.
- Downstream consumers, `README.md:4924-4927`: one sentence saying consumers applying the criterion to other Dedekind domains supply its Steinberg hypothesis.

## H02 (roed-math) — applied

§3.4 (`README.md:1208-1286`) now states borelInvariantFormComparison:

- **Setting.** A connected semisimple ℚ-group G with G(ℝ) connected, every arithmetic Γ⊆G(ℚ), and the actual map j_Γ^q: H^q(Lie G(ℝ),K;ℝ)→H^q(Γ;ℝ) on invariant forms.
- **Range.** j_Γ^q is bijective whenever 4q<rk_ℚ(G_j) for every almost ℚ-simple factor G_j. For G_m = SL_m over a semisimple ℚ-algebra A the condition is 4q<mn_i−1, and for Res_(F/ℚ)SL_m it is 4q<m−1, the same for every number field F.
- **Compatibilities.** The map is a graded-algebra homomorphism. It is natural for ℚ-homomorphisms f with f(K)⊆K′ and f(Γ)⊆Γ′, which covers finite-index restriction and block stabilization.
- **Sources.** Borel 1974, Theorem 7.5, p. 259, with 3.3, 9.1(2), 9.5(3) and the bracket convention 0.1 (borel1974 line 934–936, 1013–1016, 1061–1070, 110–111, 325–334); Borel 1977, §5.2, p. 627 (borel1977 line 459–461).

The requested condition a−1>4Nq implies 4q≤4Nq<a−1, so BorelRegulators' gap:stable-finite-range is discharged by citing "ArithmeticKTheory §3.4, borelInvariantFormComparison". The range here is wider: at F=ℚ(i), q=3 it starts at m=14 rather than m=26.

Other changes:

- **Old text.** "The proof targets are the stable arithmetic-group comparison with relative Lie algebra cohomology and …" (old §3.4) → "The proof uses the stable form of borelInvariantFormComparison …" (`README.md:1288-1300`). The rank *Needs:* line now cites the new target (`:1311-1313`).
- **Suppliers.** The ArithmeticLocallySymmetricSpaces contract adds ALS.F.5, ALS.0.4–ALS.0.5, ALS.0.8 and ALS.5b.1 (`README.md:461-466`). The AdelicAlgebraicGroups §3.6 contract adds the Siegel-set growth estimates (`:508-510`). Layer 3 Dependencies are updated.
- **Scope and downstream.** Scope and ownership (`:24-26`) and Downstream consumers (`:4922-4924`) name the new target.
- **References.** Both Borel papers are added to References (`:4986-4995`).
- **Suggested.lean.** The docstring (`TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:23-25`) records that the comparison is not statable at the pins. Mathlib has only low-degree Lie algebra cochains (`Mathlib/Algebra/Lie/Cochain.lean`) and no relative Lie algebra cohomology or invariant forms on symmetric spaces.

## Build

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested`: Build completed successfully (8976 jobs). There are three `declaration uses 'sorry'` warnings, at lines 50, 56 and 69, all pre-existing.

## Gate

Final run, after the commit:

`gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The run before the commit failed only on `dirty=2`, the two uncommitted files.

Depcheck (`--movable`): `depcheck: 241 roadmaps, 2362 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

## Signatures

- **Declarations unchanged.** No declaration in `Suggested.lean` changed; only the module docstring did. The four elaborated types in the job's `signatures.md` are therefore current.
- **No binders dropped.** I compared each with its README statement: `sUnitSubmonoid` and the two localization theorems with §1.1, and `regularPrime_dividedBernoulli_num` with §7.2. Each carries its Dedekind, fraction-field and prime/regularity binders explicitly.
- **No separate #check file.** I did not elaborate a scratch `#check @name` file, because the only Lean command this job may run is the module build, which elaborated all four declarations.

## Ownership and citations

- **Borel's comparison.** No roadmap on main or at the open heads states Borel's stable-range theorem:
  - ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.5b.1 and ALS.5b.3 supply relative cochains, invariant forms and the de Rham and moderate-growth comparisons, but no range theorem.
  - CharacteristicClasses C5a.1 on main is the compact invariant-form comparison.
  - §3.4 here already claimed the comparison, and BorelRegulators' scope names §3.4 as its owner.

  This roadmap is therefore the owner. No declaration was added to `Suggested.lean`, so no name collides with another roadmap.
- **Function-field Steinberg homology.** It has no owner; H01 leaves it with its consumer.
- **New citations checked.** ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4, ALS.0.5, ALS.0.8, ALS.2.2–ALS.2.3, ALS.5a.1 and ALS.5b.1 are present at the indexed head (`360d0bc`). AdelicAlgebraicGroups §3.6 was already cited. Both are earlier in the merge order than this roadmap.
- **The one citations.md lead.** `VanishingCycles.etaleTateTwists` at README 282 is EtaleCohomologyFoundations F.0.3's target name on main (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md:233`). The citation is correct.

## Sources

- **borel1974.** A. Borel, *Stable real cohomology of arithmetic groups*, Ann. Sci. ENS (4) 7 (1974), 235–272, Numdam ASENS_1974_4_7_2_235_0.
- **borel1977.** A. Borel, *Cohomologie de SLₙ et valeurs de fonctions zêta aux points entiers*, Ann. SNS Pisa (4) 4 (1977), 613–636, Numdam ASNSP_1977_4_4_4_613_0.
- **How they were read.** Both were fetched through the sources service as open-repository texts. The inequality in borel1977 line 460 is absent from the text layer; I read it from the page image of printed p. 627 as "< (n−1)/4". It agrees with borel1974's 9.5(3) and the strict bracket of 0.1.
- **Manifest still needs entries.** The job may not edit `sources.toml`, so the worker should record both works with locator_scheme theorem/section and cited_for "3.4":
  - borel1974: 0.1, 3.3, Proposition 3.6, Theorems 7.4–7.5, 9.1, 9.5.
  - borel1977: §5.2.

  No text is missing, and `needs-references.toml` was not written.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| borelInvariantFormComparison range 4q<rk_ℚ(G_j) | G=SL₂/ℚ, Γ=Γ(3) (index 24, free of rank 3 by χ(PSL₂ℤ)=−1/6, index 12, χ=−2) | range {0}; q=0: ℝ→ℝ, 1↦1; q=1: H¹(sl₂,SO₂)=0 vs H¹(Γ(3))=ℝ³; q=2: ℝ→0 | iso at q=0; fails outside range in both directions, as the strict range predicts | witness added as a Check |
| same | G=Res_(ℚ(i)/ℚ)SL₂, Γ=SL₂(ℤ[i]) | rk 1, range {0}; H³(g,K)=H³(S³)=ℝ; vcd=3−1=2 so H³(Γ;ℝ)=0 | j³ not injective outside range | Check added |
| same, anisotropic factor | G=SL₁(D), D indefinite quaternion over ℚ | rk 0 ⇒ no q with 4q<0; H¹(Γ)=ℝ^(2g) vs H¹(S²)=0 | no false claim (q=1 would be false) | clause "no degree is asserted" |
| same, empty product | A=0, G trivial | condition vacuous; both sides ℝ in degree 0, 0 otherwise | true | none |
| SL_(m,A) specialization 4q<mn_i−1 | A=ℚ, m=6; A=M₂(ℚ), m=3; A=ℚ×ℚ(i), m=14 | ranks 5, 6−1=5 (Morita agrees), 13 and 13; ranges q≤1, q≤1, q≤3; H¹(SL₆ℤ;ℝ)=0=H¹(SU(6)/SO(6)) | consistent | none |
| G_m(ℝ) connected | real, complex, quaternionic places | SL_k(ℝ), SL_k(ℂ), SL_k(ℍ) connected; K=SO(k), SU(k), Sp(k) connected | holds, so G(ℝ)-invariant forms = H(Lie G,K) | hypothesis stated |
| Res SL_m range 4q<m−1 | F=ℚ, q=5; F=ℚ(i), q=3 | 20<m−1 ⇔ m≥22; 12<m−1 ⇔ m≥14; SU(m)/SO(m) (m≥5) has no classes in degrees 1–4 and has x₅; SU(m) has x₃ | matches K₃(ℤ)⊗ℚ=0, K₅(ℤ)⊗ℚ=ℚ, K₃(ℤ[i])⊗ℚ=ℚ (§3.4 rank Checks) | Check added |
| strictness and [x]′ | m=5, q=1 | 4q=4=m−1, excluded; [1]′=0 | agrees with borel1974 0.1 and borel1977 "<" | Check added |
| consumer range a−1>4Nq | N=2, q=3; q=0 | needs a≥26 vs a≥14; at q=0 both reduce to a≥2 | implied for all N≥1, q≥0 | Check added |
| naturality, f=id | Γ(3)⊆SL₂(ℤ), q=2 | j_SL₂ℤ(area)=0 in H²(SL₂ℤ;ℝ)=0; res(0)=0=j_Γ(3)(area) | commutes | stated as a law |
| naturality, block inclusion | SL₂→SL₃ over ℚ, q=2 | H²(sl₃,SO₃)=H²(SU(3)/SO(3))=0 pulls back to 0; j(0)=0 | commutes | stated as a law |
| graded algebra, unit | q=0 | j⁰(1)=1 | holds; the zero map is excluded | stated |
| §3.2 claim "every finite-index subgroup of SL₂(𝔽_q[t]) has p-torsion" | q=2, f=t | [[1,t],[0,1]]²=[[1,2t],[0,1]]=I; U≅(𝔽_q[t],+) is infinite, so H∩U≠1 for finite-index H | true | text added |
| §3.2 criterion generality (unchanged) | ℤ[√−5]; a curve ring with finite Pic | criterion needs finite Pic and Steinberg finiteness only | EllipticKTheory's use is valid | none |

No untrusted text contained an instruction to act; the review's footer line is attribution only.

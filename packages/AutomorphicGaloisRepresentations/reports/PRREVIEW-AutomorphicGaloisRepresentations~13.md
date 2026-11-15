# Review of AutomorphicGaloisRepresentations (pull request #1007 at 480c64f)

**Verdict:** needs changes

## R01 (P3) — §5.1 writes the nebentypus as `ε`, the roadmap's symbol for the cyclotomic character

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:2960`, “The subcharacter is `εχ_p^{k−1}` times the inverse quotient character”; line 2972, “The two characters multiply to `εχ_p^{k−1}`”; line 2976, “For `σ₁(u)=1+p` and trivial `ε₁,p`”.

**Claim:** These lines state the determinant of the ordinary filtration. The same section (line 2923) and §1.5 write it `ψχ_p^{k−1}`; `ε` is the cyclotomic character in the Conventions (line 124) and in §7.1 (line 3609), and `ε₁,p` and `σ₁` are defined nowhere (§§4.10–4.11 use `ν` and `τ₁`).

**Witness:** 11a1 at 3 (`k=2`, `ψ=1`): `det=ψχ₃^{k−1}=χ₃`, as §6.12's Check has it (`χ₃δ⁻¹`, `δ`). Read with the Conventions' `ε`, line 2960 gives `χ₃²`.

**Repair:** Line 2960: “The subcharacter is `ψχ_p^{k−1}` times the inverse quotient character.” Line 2972: “The two characters multiply to `ψχ_p^{k−1}`, including the unramified unit-root factor.” Line 2976: “on principal units the algebraic factor is `τ₁(u)⁻¹`. For `τ₁(u)=1+p` and `ν(u)=1`, its value is `(1+p)⁻¹`, not 1.” On the witness the product is `χ₃`, equal to line 2923 and §1.5; the last line then agrees with §4.10's Check at `k=(2,4)`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.2d compactness and links | `diag(ϖ_v,1)`, one variable; `f(pz₁,z₂)`; `r|ϖ|≤r′≤r` | matrix `diag(ϖ^m)→0`; identity on `K⟨z₂⟩`, not compact; `cα` and `αc` both `U_P` (Buzzard 12.2, 13.1) | holds | none |
| §0.2a right action | `γ=diag(p,1)`, `δ=((1,0),(p,1))`, `z=1` | `(f|γ)|δ` and `f|(γδ)`: `f(p/(p+1))`; `f|(δγ)`: `f(p/(p²+1))` | holds | none |
| §0.2e slope count | `n=h_Um+ρ`; `h<0`; `h=0` | `∑⌊j/h_U⌋=h_Um(m−1)/2+ρm`; `m−1≤2h/v` forced for `m≥2`; `h<0` gives `n=0`; `h=0` gives `n≤h_U` | holds | none |
| §0.2f Bol and classicality | `r=1,j=0`; `n=0`, one class; `e_v=2` | `D(N/L)=(ad−bc)/L²`; `H=(1−pT)H′(pT)`, slope 1 outside cutoff; cutoff `1/2` | holds | none |
| §1.5a labelled Fontaine–Laffaille | `K=ℚ_ℓ`, jump 1; 11a1 at 19 | `V` gives `ε_ℓ⁻¹` (degree 1), `U_S` gives `ε_ℓ`; `θ₂⁻¹,θ₂⁻¹⁹`; `θ₂^{20}=θ₁` | holds | none |
| §1.6 integral structures | 11a1, `S={2,11}`; `cg` integral | `Fil¹=ℤ[1/22]f`; `ℓ∤k!` gives `k−1≤ℓ−2`; `a₁(cg)=c∈O_S` | holds | none |
| §1.7 existence and rigidity | `E₄`; `Δ(3τ)` and `E₄(3τ)`; `2Δ` | `λ₂(E₄)=9`, `(X−1)(X−8)`; `a_p=0` for both but `λ₂=−24≠9`; `2Δ`: `a₂=−48`, `λ₂=−24` | holds | none |
| §3.9 cubic step | projective image `A₄`, `S₄` | 2-Sylow `V₄` normal of index 3; `D₄` has 3 conjugates; restriction irreducible (Carayol 12.2.2) | holds | none |
| §3.10 parallel adapter | type `(2,2)` | `j=1`; `r_π` degrees `{−1,−2}`; `ρ`: `X²+3X+27`; `r_π` geometric: `X²+X/9+1/27` | holds | none |
| §3.11 dictionary | 11a1 at 3; norm twist; `(12,10)`; Saito `τ_p,ρ_p` | `X²+X+3` both; `X²+3X+27` against `X²+X/3+1/3`; degrees `(0,11)`; Saito's dual `σ_h` has Carayol's polynomial | holds | none |
| §4.11 central correction and table | `µ=2`, `u=1+p`; four rows from `D=χ⁻¹ε_p⁻¹` | `λ^alg=u⁻²`, `det=u⁻³`; rows: `(η, Dη⁻¹)`, `(χε_pη, η⁻¹)`, `(χη, ε_p⁻¹η⁻¹)`, `(ε_pη, χ⁻¹η⁻¹)` | holds | none |
| §5.1 determinant of the flag | 11a1 at 3 | `ψχ₃^{k−1}=χ₃`; “`εχ_p^{k−1}`” with the Conventions' `ε`: `χ₃²` | notation defect | R01 |
| §5.2 crystalline factors | 11a1 at 2; `Δ` at 2 | slopes `1/2,1/2`; `v₂(24)=3`, `v₂(2048)=11`, slopes 3, 8 against degrees 0, 11; five primes below 12 | holds | none |
| §5.4 ordinary CM line | `y²=x³−x` at 5 | characters `−1±2i`, distinct, sum `−2`, product 5; the two `G_L`-lines exchanged (Dasgupta–Kakde 9.2) | holds | none |
| §6.4 conductors and Euler factors | `k=4`, `p∥N`; 11a1 at 11; `p∣cond ψ` | `a_p²p=ψ′(p)p³`, `|a_p|=p`; `a₁₁=1`, factor `(1−11⁻ˢ)⁻¹`; `|a_p|=p^{(k−1)/2}` | holds | none |
| §6.5 optimized eigensystems | 11a1 at 7 and 5; `det ρ̄=χ̄_ℓ` | disc `−4≡3`, nonsquare mod 7; reducible at 5; `ψ̄_f=1` with prime-to-`ℓ` order gives `ψ_f=1`; `δ∈{0,1}` | holds | none |
| §6.8 Hecke determinant | `k[ε]/ε²`; level 88 | `det diag(1+ε,1)=1+ε≠1`; `T₂` cyclic on `f(2^iτ)`, minimal polynomial `u²(u²+2u+2)`, nilpotent `u(u²+2u+2)≠0` | holds | none |
| §6.11 fixed character | `γ(Frob)=2`, `q=3`; `p=3`, `q≡−1` | arithmetic `6,2`; dual arithmetic `1/6,1/2`, geometric `6,2`; `γ,−γ` give the pair `{1,−1}` | holds | none |
| §6.12 local conditions | 11a1 at 19 and 3; `r(g)=diag(a,b)` | 20 points, `a₁₉=0`; disc `−4≡15`, nonsquare mod 19; projector `diag(1,0)`; `a=b` gives `0/0`, excluded | holds | none |
| §7.2 purity | type `(2,0)`, `N≠0`; Saito `w_S=2−w` | weight `w+1=1`; kernel 0, cokernel 2; `3−w_S=w+1` (Saito Theorem 2: `w_S−1`) | holds | none |
| §7.7 and `fixedSquarefreeForm_ordinary_density_one` | 11a1 at 3, 19, 11; `p>4`; CM level `23·p` | `−1∉(3)` in; `0∈(19)` out; `11∣N` out; `(2√p)^d<p^d` iff `p>4`; squarefree CM level forces nontrivial character | holds; `simp`, `rfl`, `infer_instance`, `aesop` all fail | none |

- Previous review (head d72821d), R01: repaired. README 3820–3822 now gives the three membership Checks (“`−1∉(3)`, so 3 belongs”; “`0∈(19)` … 19 does not belong”; “`11∣N`, so the bad-prime clause excludes 11”).
- Source locators: 84 checked against 18 texts (Deligne–Serre 4, Carayol 6, DDT 24, Scholl 5, Kisin JAMS 5, Saito 2009 5, Saito supplement 1, DFG arXiv v2 10, Dimitrov 4, Buzzard *Eigenvarieties* 4, Dasgupta–Kakde 2, Khare–Wintenberger 5, Chenevier 4, Blasius 5, Skinner Documenta 2, Skinner–Wiles 2, Ribet 1985 1, Skinner arXiv:1405.7294v1 1); all 15 sampled targets supported, with the limits under `## Not verifiable`.
- Library declarations opened at the pins (27): Tau Ceti `RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean:90,105,115`; `Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean:91,148,180,198`; `Analysis/Normed/Operator/RowCompact/PrModule.lean:105`; `Analysis/Normed/Module/Bases/PotentiallyONable.lean:89`; `Analysis/Normed/Ring/PseudoUniformizer.lean:150`; `LinearAlgebra/Matrix/Charpoly/Reverse.lean:71,77`; `NumberTheory/ArithmeticDirichletSeries/NaturalDensity.lean:96`; `NumberTheory/ModularForms/Newforms/Fields.lean:48`, `Newform.lean:84,104`; `AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`; `NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311,438`; `RingTheory/PolynomialLaw/Multiplicative.lean:71`, `Homogeneous.lean:73`; Mathlib `LinearAlgebra/Matrix/Charpoly/Coeff.lean:290,292`; `RepresentationTheory/Invariants.lean:126,141`; `NumberTheory/NumberField/ClassNumber.lean:59`; `NumberTheory/LSeries/RiemannZeta.lean:173`; `RingTheory/Perfectoid/BDeRham.lean:75,88`. Each exists with the hypotheses the README states.
- Cross-roadmap citations: the resolver lists none as missing; 90 section or target ids opened by hand in 14 roadmaps at their heads or on main (among them GL2AutomorphicRepresentationsAndTransfer R17.3.8a–d, R16.6.3, R17.4.17; HilbertModularVarietiesAndShimuraCurves R18.5.16a–b, R18.3.29, R18.3.32, R18.4.25; AlgebraicModularFormsAndSerreWeights R15 identifiers at its README line 18). The two names listed as found nowhere resolve: `Determinant.exists_realization_of_henselian` at IntegralHeckeAndGaloisDeterminants README 2319 (§1.3) and `Determinant.existsUnique_isCoefficientChange_of_compact` at 3269 (§4.1).
- Gate rerun: every check 0, OK. Dependency check: `depcheck: 246 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- `lake env lean` on `Suggested.lean`: exit 0, one warning (`declaration uses sorry`, line 89). The elaborated types of `ordinaryGoodPrimes` and `fixedSquarefreeForm_ordinary_density_one` equal the README §7.7 statement; no binder lost. The declaration `for` in the generated summaries is a false positive: line 32 of the module docstring begins with the word “theorem”.
- Pull request text: 21 sentences of the summary block and prose read against the head, none contradicted; the 24 roadmaps of the dependency list are exactly the suppliers the README names that are not on main (GlobalNumberFields and LocalGaloisGroups are on main under `Completed/`).
- Headlines: only §7.7's density theorem is statable at the pins; the docstring names a missing carrier for each of the others (period functors, weight modules `A_{κ,r}` as `Δ_P`-modules, Shimura cohomology, premotives, Hilbert automorphic representations, Weil–Deligne functor, residual attachments, compatible-system carrier).

Overlap check: read QuaternionicModularForms, PadicFamilies, ClassicalSerreModularity, PotentialModularityAndCompatibleSystems, AutomorphicGaloisRepresentationsPartII (open) and ModularForms, CompactOperators (main). Analytic and overconvergent quaternionic forms, compact `U_P`, Fredholm series, theta classicality: owned here (§§0.2a–0.2f), as GL2AutomorphicRepresentationsAndTransfer's scope also states, and planned a second time by QuaternionicModularForms Layers 1–5, which this roadmap may not cite (see the last section). Classical quaternionic forms and Hecke operators: GL2AutomorphicRepresentationsAndTransfer R17.3.8a–d. Weak and strict predicates: AutomorphicGaloisRepresentationsPartII AG2.P. Raw compatible-system carrier: SmallRamificationAndAbelianVarietyBaseCases §5.0d. Analytic form spaces: ModularForms. Fredholm and Riesz theory: CompactOperators. PadicFamilies, ClassicalSerreModularity, PotentialModularityAndCompatibleSystems: nothing shared.

Source independence: 23 passages compared with 18 sources, none shared; largest share Carayol, 34 of 220 linked locators; contents compared with Carayol: independent (§§3.1–3.9 run in the order of its §§2–12, but §§7–10 merge into §3.5, §§5, 11 and 12 are split, and the *Needs:* lines 3.2←3.1, 3.3←3.1–3.2, 3.4←3.3–3.3a, 3.6←3.3–3.5, 3.7←3.3–3.6, 3.17←3.7–3.9 force the order). Jacobs's thesis could not be read.

## Not verifiable

- Jacobs, *Slopes of compact Hecke operators*, §1.6, pp. 20–21 (§0.2d): the sources service found no legal copy.
- Skinner, Ann. Math. 191, §3, printed p. 350 (§§7.6–7.7): the publisher's host is in no licence class; the three paragraphs were read in arXiv:1405.7294v1, §3, lines 767–783, so the printed page is unchecked.
- Saito, Invent. Math. 129, Theorem 1 (§§4.5, 5.2): recorded as uncertified; cited by its locator.
- Colmez–Dospinescu–Nizioł §5.2.1 and Kisin's *Overconvergent modular forms* Proposition 5.14 (§§3.11, 0.4): not fetched this round.

## Source issues

- **Gap** in KW2 at Lemma 7.2, proof step (i), p. 61 of the authors' version: the source says the common residual representation fixes the unramified character for odd p; it should exclude Nv ≡ −1 mod p with residual representation unramified at v, where both square roots reduce to the same pair; affects a stated result.
- **Error** in SkinnerDM at Introduction, definition of Hodge–Tate type, printed p. 242: the source says the labelled degrees are (w−k)/2 and (w+k−2)/2; it should be (w−k+2)/2 and (w+k)/2 for its equation (1) and stated grading, as weight two with w=0 shows; affects a stated result.

## For the human reviewers

- Ownership: QuaternionicModularForms (open, another author), Layers 1–5, and README §§0.2a–0.2f here state the same objects; its “Downstream consumers” lists this roadmap's §0.3 as a consumer. This review may not cite it as a supplier; the owner needs deciding.
- Wording: README §§0.2a–0.2f share sentences with QuaternionicModularForms §§1.1–5.3, for example README 1303–1305 against its §5.3 “Classicality” (about 38 consecutive words). Both texts are roadmap text; which came first was not established.
- Arrangement: Layer 3 §§3.1–3.9 run in the order of Carayol's §§2–12, with headings close to §3 and §10 of that source. Judged dependency-forced above; a human may weigh it differently.
- Not tested: Jacobs's thesis (five locators in §§0.2a, 0.2d) has no readable legal copy; no wording or locator of it was compared.

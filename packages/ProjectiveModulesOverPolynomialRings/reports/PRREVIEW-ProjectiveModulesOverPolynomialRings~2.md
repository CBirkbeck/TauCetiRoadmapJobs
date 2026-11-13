# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at 84a1bd6)

**Verdict:** needs changes

## R01 (P1) — The induction base change uses the wrong algebra

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:492`: “`A ⊗[k[T]] k⟨T⟩` is a polynomial ring in `n − 1` variables”.
**Claim:** With `A = k[X₁, …, Xₙ₋₁]`, this tensor product is the ring needed for induction.
**Witness:** Take `n = 1`, `k = 𝔽₂`, and `T ↦ 0` on `A = k`. The displayed tensor product is zero because `T` becomes invertible; the intended ring is the nonzero field `k(T)`.
**Repair:** Replace the route by: “Put `B = k⟨T⟩[X₁, …, Xₙ₋₁] ≅ k⟨T⟩ ⊗[k[T]] A[T]`. The induction hypothesis makes `B ⊗[A[T]] P` free. The coefficient map `B → A⟨T⟩` then makes `A⟨T⟩ ⊗[A[T]] P` free, so 4.5 applies.” For `n = 1`, this gives `B = k(T)`. Quillen's printed proof contains the same misprint; see Source issues.

## R02 (P1) — Quillen's dilation input has no target or supplier

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:268`: “closure under sums is Quillen's Lemma 1”.
**Claim:** The route to the Quillen ideal has its prerequisites among 3.1 and the listed Mathlib inputs.
**Witness:** Quillen1976 lines 56–58 require a uniform lifting result for polynomial units over a localized, possibly noncommutative algebra. Section 3.1 supplies only extension predicates and tensor identities; neither pinned library nor the named supplier supplies that result.
**Repair:** Before the ideal theorem, explicitly own Quillen's dilation theorem: for a commutative ring `A`, an `A`-algebra `R`, `f ∈ A`, and `θ ∈ R_f[X]ˣ` with `θ(0) = 1`, there exists `k ≥ 0` such that whenever `g₁ − g₂ ∈ fᵏA`, the unit `θ(g₁X)θ(g₂X)⁻¹` lifts to `ψ ∈ R[X]ˣ` with `ψ(0) = 1` (Quillen 1976, Lemma 1, pp. 167–168). Cite this target in 3.2's Needs and derive the comaximal factorization after localizing at `a + b`. Check `θ = I + (X/2)E₁₂` over `ℤ[1/2]`: `k = 1`, `g₁ = 2`, `g₂ = 0` give the lift `I + XE₁₂`.

## R03 (P2) — Dedekind localization need not be a DVR

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:510`: “at each maximal ideal `B_m` is a discrete valuation ring”.
**Claim:** Every maximal localization admitted by the Dedekind-domain signature is a DVR.
**Witness:** `B = 𝔽₂` satisfies `IsDedekindDomain`; its maximal localization is `𝔽₂`. `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` excludes fields. The field instance and its failure to be a DVR both elaborate in the boundary probe.
**Repair:** Write: “At each maximal ideal, `B_m` is a principal ideal domain: a field when `m = 0`, and a DVR otherwise. Apply 5.2, then 3.4.” Keep fields in the theorem and add `B = 𝔽₂`, `m = 0` as a Check.

## R04 (P3) — Specializing at one still detects non-extension

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:252`: “specialising at `X = 1` instead would give `A` and fail to detect it”.
**Claim:** The specialization-at-one extension test fails on `M = A[X] ⧸ (X − 1)`.
**Witness:** For `A = 𝔽₂`, `M(1) = A`, but `A[X] ⊗[A] M(1) = A[X]` is not `M`: `X − 1` annihilates `M` and does not annihilate `A[X]`.
**Repair:** Replace the quoted clause by: “specializing at `X = 1` gives `A`, distinguishing this specialization from `M(0) = 0`; the extension criterion at one also rejects `M`, since `A[X] ⊗[A] M(1) ≅ A[X]`.”

## R05 (P3) — The multivariable base-change predicate lacks its API and Checks

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:237`: “`IsExtendedAfterMv A B n M`, the same over `A[X₁, …, Xₙ]`”.
**Claim:** Every defined predicate has a usable API and at least three discriminating Checks.
**Witness:** Lines 241–259 give no API or computed Check for `IsExtendedAfterMv`; 3.4's Checks test patching, not the coefficient map in this predicate.
**Repair:** Add API bullets for invariance under linear equivalence, identity and iterated coefficient base change, and the `n = 0, 1` comparisons. Add three explicit Checks: `n = 0` always gives an extended module; for `M = ℤ[X,Y]/(2,X)`, base change to `ℤ[1/2]` gives zero and true; base change to `ℤ₍₂₎` gives `𝔽₂[Y]`, with `X` acting by zero, and false since extension of its zero specialization is `𝔽₂[X,Y]`. The last Check rejects accidental specialization of variables during coefficient base change.

## R06 (P3) — Paper-level references do not locate the research claims

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:571`: “stably free modules of rank `d − 1` are free (Fasel–Rao–Swan 2012)”.
**Claim:** The mathematical claims in Research context carry exact source locators.
**Witness:** FaselRaoSwan2012 lines 664–666 give Theorem 7.5, arXiv v2, p. 14. The README gives only the paper's year, as it also does for several neighboring theorem claims.
**Repair:** Attach theorem or section and page locators to these claims. For this one cite “Fasel–Rao–Swan, arXiv:1107.1051v2, Theorem 7.5, p. 14”; for the claimed Hermite counterexample cite “Schäppi, arXiv:2311.04104v1, Theorem 1.1, p. 1”. Locate the remaining paper-only claims rather than relying on bibliography entries.

## R07 (P3) — Replace the ownership-search narrative with timeless scope

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:37`: “A search of the roadmaps on main, of the open pull requests and of the maintainers' packages”.
**Claim:** The roadmap states mathematical ownership without recording the review or search process.
**Witness:** Lines 37–40 record a search and its result; line 561 describes which open pull requests cite the folder. These are repository-state reports rather than lasting mathematical contracts.
**Repair:** Delete the search sentence, retaining the explicit ownership and deferral paragraphs. Replace line 561 by: “The results supply freeness and extension criteria for algebraic vector bundles on affine spaces.”

## Verified sound

| Previous finding | Passage at this head | Resolution |
|---|---|---|
| R01 | §3.1, lines 255–258: “`Ideal.span {2}`”; “At `(3)` it would hold” | Repaired: the two localizations are `𝔽₂` and zero. |
| R02 | §4.2: “Horrocks' theorem over a local ring”; §4.5: “by 4.3”; “4.4 gives” | Repaired: local Horrocks is a target; the global route no longer needs projective-line bundles. |
| R03 | Scope, lines 42–48: “This roadmap states neither and consumes both” | Repaired: §RD.0.55 and §RD.0.56(b) resolve at #1002; the duplicate declarations are absent. |
| R04 | §4.3, lines 388–392: “finitely generated and flat”; “hence free” | Repaired: faithful flatness is targeted in 4.1; both descent results and local freeness exist at the pin. |
| R05 | §5.1, lines 467–471: “`M = A[X]ⁿ ⧸ A[X] f`”; “by 3.3 and 3.1” | Repaired: split quotients give the claimed matrix; both dependencies are listed. |
| R06 | §3.2, line 265: “a different ideal with the same role” | Repaired: the localization ideal and the translation ideal are distinguished. |
| R07 | References, line 624: “Projective A[x]-modules”; “(1966), 453–456” | Repaired: agrees with Quillen1976 line 216. |
| R08 | PR description, Ownership: “are consumed from PadicDifferentialEquationsAndRigidCohomology §RD.0.55 and §RD.0.56” | Repaired: the supplier, deleted declarations, new local Horrocks target and revised scope are disclosed. |

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Column/row convention | `G = [[2,1],[3,2]]` over `ℤ` | `det G = 4−3 = 1`; column zero and row zero of `Gᵀ` both `(2,3)` | Agrees | None |
| 1.1 Suslin factorial theorem | `r=1`, `a=(2,3)`, `m=(1,2)` | `1! ∣ 2`; powered row `(2,9)`; determinant of `[[2,9],[1,5]]` is `1` | Agrees | None |
| 1.1 excluded rank zero | `a=(2)` over `ℚ`, exponent `1` | `0! ∣ 1`; desired entry `2`; only `SL₁` entry is `1` | Exclusion necessary | None |
| 1.1 sphere Check | `x²+y²+z²=1`, exponents `(1,1,1)` | Unimodularity sum `1`; `2! ∤ 1`; kernel rank `2`, stable rank `3`, no continuous frame | Agrees | None |
| 2.1 stable freeness | `n=0,1`, finite projective `P` | Over `k` and `k[X]`, `P ≅ Rʳ`; complement rank `0`; stabilized rank `r` | Agrees | None |
| 2.1 coefficient negative control | `P=ℤ/2` over `ℤ/6` | Local ranks `(1,0)`; adding rank `s` gives `(s+1,s)`, never constant | Not stably free | None |
| Layer 2 Koszul example | `(X,Y)` over `k[X,Y]` | Composite on `c`: `X(−Yc)+Y(Xc)=0`; kernel generated by `(−Y,X)` | Exact | None |
| 3.1 `IsExtendedFrom` | `A[X]ʳ`; `A[X]/(X)`, `A≠0` | Fibers `Aʳ`, `A`; extensions `A[X]ʳ`, `A[X]`; `X` acts injectively on extensions, zero on quotient | True; false | None |
| 3.1 zero-specialization iff | `M=A[X]/(X−1)`, `A≠0` | `M(0)=0`; reconstructed module `0`; original module `A≠0`; both sides false | Agrees | None |
| 3.1 specialization-at-one Check | Same `M`, `A=𝔽₂` | `M(1)=𝔽₂`; reconstruction `𝔽₂[X]`; annihilators `(X−1)` versus `0` | Check's assertion false | R04 |
| 3.1 isomorphism invariance API | `M=A[X]²`, swap coordinates | Swap squared `I₂`; extension witnesses before and after both `A²` | Agrees | None |
| 3.1 preservation under base change API | `A=ℤ`, `B=𝔽₂`, `N=ℤ/2` | `B[X]⊗ℤ N=𝔽₂[X]`; `B[X]⊗B(B⊗ℤ N)=𝔽₂[X]` | Agrees | None |
| 3.1 identity base change API | `M=ℤ[X]/(X)` | `ℤ[X]⊗ℤ[X] M=M=ℤ`; both extension predicates false | Agrees | None |
| 3.1 `IsExtendedAfter` | `M=ℤ[X]/(2,X)`; invert `2`, localize at `(2)`, `(3)` | Modules `0`, `𝔽₂`, `0`; extension predicates true, false, true | Previous R01 repaired | None |
| 3.1 `IsExtendedAfterMv` | `M=ℤ[X,Y]/(2,X)`; same base changes | Modules `0`, `𝔽₂[Y]`, `0`; reconstruction at `(2)` is `𝔽₂[X,Y]`, not `𝔽₂[Y]` | Definition separates cases | R05: record API/Checks |
| 3.1 zero base ring | `B=0`, any polynomial module | Tensor product `0`; extension from zero `0`; predicate true | Agrees | None |
| 3.2 Quillen ideal | `M=ℤ[X]/(2,X)` | Even `a`: localized module `0`; odd `a`: `𝔽₂` with `X=0`; ideal exactly `2ℤ` | Agrees | None |
| 3.2 zero/unit/nilpotent cases | `a=0,1`; `a=ε`, `ε²=0` | At `0,ε`, ring `0`, predicate true; at `1`, module unchanged; `1∈I` iff extended | Agrees | None |
| 3.2 dilation prerequisite | `θ=I+(X/2)E₁₂`, `g₁=2`, `g₂=0` | `θ(2X)θ(0)⁻¹=I+XE₁₂`; integral lift, determinant `1`, constant term `I` | Required input has no owner | R02 |
| 3.3 maximal-ideal patching | Local `A`; zero ring | `A_m=A`, predicates identical; zero ring has zero maximal ideals and only zero modules | Agrees | None |
| 3.3 negative control | `M=ℤ[X]/(2,X)` | Local extension false at `(2)`, true elsewhere; global extension false | Agrees | None |
| 3.4 several-variable patching | `n=0,1,2`; `M=ℤ[X,Y]/(2,X)` | `n=0`: identity; `n=1`: 3.3; `n=2`: failure at `(2)` and globally | Agrees | None |
| 4.1 monic submonoid | `ℤ`; zero ring | Leading coefficients of `X²+2`, `2X+1`, `0` are `1,2,0`; over zero ring `0=1`, so `0` is monic | Agrees | None |
| 4.1 PID monic localization | `k=ℤ` | `X·X⁻¹=1`; `2` nonunit since a monic polynomial cannot have all coefficients even | PID, not field | None |
| 4.1 field monic localization | `k=𝔽₂`; coefficient ring `k[Y]` | Every nonzero `𝔽₂[X]` polynomial is monic; `𝔽₂⟨X⟩=𝔽₂(X)`; `Y` remains nonunit over `k[Y]` | Agrees | None |
| 4.1 faithful-flatness API | `ℤ⟨X⟩`; alternative `ℚ(X)` | Modulo `2`: `𝔽₂(X)≠0` versus `0`; proper ideal `(2)` survives only in the first ring | Agrees | None |
| 4.2 local Horrocks | `A=𝔽₂[ε]/(ε²)`, `P=A[X]ʳ`, `r=0,1,2` | Localized ranks `0,1,2`; original ranks `0,1,2` | Agrees | None |
| 4.2 projectivity negative control | `A=ℤ₍₂₎`, `P=A[X]/(2,X)` | `P=𝔽₂≠0`; monic localization `0`, free rank `0`; original is nonfree torsion | Hypothesis necessary | None |
| 4.2 fraction-field negative control | Local cusp `k[t²,t³]_(t²,t³)` | `t²,t³∈A`, `t∉A`; some polynomial line module nontrivial; fraction-field dimension `1` | Agrees with Traverso–Swan | None |
| 4.3 affine Horrocks | Sphere tangent module `K`, `P=R[X]⊗R K` | `P(0)=K`; extension true before/after monic inversion; `K⊕R≅R³`, `K` nonfree | Extension differs from freeness | None |
| 4.3 descent route | `A=ℤ`, `N=ℤ/2`; `N=A²` | First extension `𝔽₂(X)` has nonzero `2`-torsion, so not flat; second extension and every local fiber have rank `2` | Descent hypotheses discriminate | None |
| 4.4 Bass reflection | `A=𝔽₂`, ranks `1,2`; `𝔞=(2,1+√−5)` | Dimensions stay `1,2`, so no isomorphism; `𝔞` nonprincipal since `a²+5b²=2` has no integer solution | Agrees | None |
| 4.4 no retraction Check | Hypothetical `A⟨X⟩→A`, `A≠0` | `X↦c`; monic unit `X−c↦0`; would force `0=1` | No retraction | None |
| 4.5 global Horrocks | Zero ring; sphere extension | Zero gives free rank `0` on both sides; sphere extension nonfree on both sides by 4.4 | Agrees | None |
| Layer 4 example | `ℤ[X]`-projective `P` | Over PID `ℤ⟨X⟩`, rank `r`; 4.5 returns rank `r` over `ℤ[X]` | Agrees | None |
| 5.1 polynomial vector theorem | `f=(X²,1+X)`, `d=(2,1)` | First matrix gives `(1,0)`, determinant `1`; second gives `(0,1)=f(0)` | Agrees | None |
| 5.1 total-function boundaries | `n=0`; `f=(1,0)`, `d=(0,0)` | Empty span `⊥=⊤` forces zero ring; `natDegree 0=0`, head coefficients `(1,0)`, head ideal `⊤` | Agrees | None |
| 5.1 nonreduced rank-one case | `A=𝔽₂[ε]/(ε²)`, `f=1+εX`, `d=1` | `f²=1`; head ideal `(ε)≠⊤`; conclusion nevertheless holds with `g=f` | No false converse asserted | None |
| 5.1 conclusion versus completion | Constant sphere vector `(x,y,z)`, `d=0` | Head ideal `⊤`; identity sends vector to itself; no completion to `e₁` | Agrees | None |
| 5.1 quotient-patching route | `f=(X²,1+X)` | Quotient by `f` has rank `1`; source and target split as `A[X]⊕A[X]`; displayed matrix lifts equivalence | Previous R05 repaired | None |
| 5.2 Quillen–Suslin headline | `n=0`; `P=k[X,Y]ʳ`, `k=ℤ,𝔽₂,𝔽₃` | Base case PID modules free; displayed modules have rank `r`; zero module has rank `0` | Agrees | None |
| 5.2 induction formula | `n=1`, `k=𝔽₂`, `T↦0` on `A` | Written tensor `0`; intended ring `𝔽₂(T)≠0`; corrected tensor `𝔽₂[T]⊗𝔽₂[T]𝔽₂(T)=𝔽₂(T)` | False formula | R01 |
| 5.3 Dedekind extension headline | `B=ℤ[√−5]`, `P=𝔞[X]` | Zero fiber `𝔞`; reconstruction `𝔞[X]`; extended true, free false | Agrees | None |
| 5.3 localization route | `B=𝔽₂`, maximal ideal `0` | Local ring `𝔽₂`, dimension `0`, PID true, DVR false | Route overclaims | R03 |
| 5.3 normality negative control | `B=k[t²,t³]` | `t²,t³∈B`, `t∉B`; non-seminormality gives `Pic(B[X])/Pic(B)≠0` | Agrees | None |
| 5.4 completion headline | `(2,3)`; `(2,4)`; `m=0`, `a=−1` | Determinant `1`; ideal `(2)≠ℤ`; `GL₁` contains `−1`, `SL₁` does not | Agrees | None |
| 5.4 polynomial Check | `v=(1+X,X)` | First column of `[[1+X,1],[X,1]]`; determinant `1+X−X=1` | Agrees | None |
| Layer 5 multivariable example | `(1+XY,X²,Y²)` | `(1−XY)(1+XY)+Y²X²=1` | Unimodular | None |
| Research theorem and conjecture cases | Smooth `d=2,3` in characteristic `2`; `R=𝔽₂` | Factorials `1,2`: invertibility true,false; over `𝔽₂[T]` finite projectives free | Stated cases supported | R06: add locators |
| Local-Horrocks source's auxiliary resolution | `M=A[X]/(X−1)` | Cokernel of multiplication by `X`: action `X=0`; intended `M`: action `X=1`; corrected differential `X−1` | Source misprint/error | Source issues |

- Sources: all 15 seeded targets examined; 14 are supported by readable sources and the stated corollary routes; 1.1 remains unverified. Read 19 Lombardi–Quitté and 14 Quillen locator occurrences, Kedlaya 6.4, Česnavičius §§2.1–2.2, Fasel–Rao–Swan 7.5 and Schäppi 1.1.
- Pinned declarations opened: 13, including `Module.IsStablyFree` (`Mathlib/Algebra/Module/StablyFree/Basic.lean:34`), `Module.IsUnimodular` (`Mathlib/LinearAlgebra/Unimodular.lean:46`), `Polynomial.Monic` (`Mathlib/Algebra/Polynomial/Degree/Defs.lean:59`), `Polynomial.algebra` (`Mathlib/RingTheory/PolynomialAlgebra.lean:207`) and `MvPolynomial.algebraMvPolynomial` (`Mathlib/Algebra/MvPolynomial/Eval.lean:868`).
- Descent declarations checked: `Module.Flat.of_flat_tensorProduct` (`Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:589`), `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat` (`Mathlib/RingTheory/Finiteness/Descent.lean:35`), `Module.free_of_flat_of_isLocalRing` (`Mathlib/RingTheory/LocalRing/Module.lean:299`), `Module.finitePresentation_of_projective` (`Mathlib/Algebra/Module/FinitePresentation.lean:162`), PID freeness (`Mathlib/LinearAlgebra/FreeModule/PID.lean:361`); all have the required hypotheses.
- Cross-roadmap citations: resolved AlgebraicKTheory §§0.3, 0.5, 1.1, 2.1, 4.1–4.2, Layer 6 on main; GeneralAlgebraicKTheory §§9.16, 10.12a at #1212; PadicDifferentialEquationsAndRigidCohomology §§RD.0.55, RD.0.56, RD.3.27 at #1002. One supplier edge; no cycle or upward edge.
- Gate: every supplied check passed, targeted build included; independent dependency output: `depcheck: 240 roadmaps, 2170 edges, 0 problem(s)`; direct pinned elaboration succeeded with only 16 `sorry` warnings.
- Acceptance test: all 16 headline theorems listed in the module docstring are present; all 20 `#check @name` signatures match the README, with no dropped hypotheses. None of the 16 theorems closed under `simp`, `rfl` or `infer_instance`; inspected library near-matches do not prove them.
- Ownership: main, open-head and board-package object searches completed; no duplicate roadmap or fully qualified headline declaration found. The supplied overlap lists identify only HomologicalStabilityOfGeneralLinearGroups as a closest roadmap. PR title, prose and folder diff agree: new folder, three files, 870 added lines, no outside-folder change.

Overlap check: read HomologicalStabilityOfGeneralLinearGroups, PadicDifferentialEquationsAndRigidCohomology, AlgebraicKTheory, GeneralAlgebraicKTheory and AlgebraicVectorBundles; finite free resolutions and completion-property equivalence belong to PadicDifferentialEquationsAndRigidCohomology §§RD.0.55–RD.0.56; elementary/stable-range and continuous-sphere results belong to AlgebraicKTheory; K₀ invariance belongs to GeneralAlgebraicKTheory. No shared owned target with the other two; the polynomial extension and monic-localization results belong here.

Source independence: 23 passages compared with 6 sources; no copied nonmathematical expression or reused table, figure or exercise list found. Largest share LombardiQuitte2015, 19 of 42 explicit locator references, repetitions counted. Contents at LombardiQuitte2015 lines 42558–42579 compared: independent; Layer 3 combines XVI.1 and XVI.3, Layer 4 changes XVI.4's scope, and dependencies 4.3→3.3, 4.4→4.3, 4.5→4.4 and 5.2→4.5 force the shared patching–Horrocks–freeness order.

## Not verifiable

- Suslin1977, Theorems 1–2, p. 479: the sources service's DOI and direct Math-Net PDF requests timed out; 1.1's general theorem and precise locator remain uncertified.
- Suslin1976: the sources service could not retrieve the paper; 5.2 is independently supported by Quillen1976 and 5.4 over fields by LombardiQuitte2015.
- Horrocks1964, Theorem 1: publisher returned HTTP 403; only Quillen1976 lines 121–122 and Česnavičius's secondary citation were readable.
- Lang2002, XXI.3.4: paywalled; its number is confirmed through Kedlaya2004 line 545, not the original text.
- Swan1962: DOI retrieval failed and the institutional PDF request failed certificate validation; the sphere calculation was checked independently and against AlgebraicKTheory §0.5.
- SwanTowber1975: paywalled; the special-case attribution was not verified against the paper.
- Lindel1981, Lam2006, Bass1973 and LequainSimis1980: service classified the DOI sources as paywalled; the relevant contextual claims have only the readable secondary sources.
- Serre1955, Seshadri1958, Murthy1966, VasersteinSuslin1976 and MohanKumar1985: service retrieval failed; original texts were not compared.
- Popescu1986, Popescu1990, Swan1998 and Swan1978: service retrieval failed; the context was compared with Cesnavicius2022 §§2.1–2.2 only.
- AsokHoyoisWendt2018: DOI retrieval failed and the arXiv source request returned no text; the torsor assertion was not verified against the paper.

## Source issues

- **Misprint** in Quillen1976 at proof of Theorem 4, printed p. 169, line 148: the source uses `A ⊗[k[T]] k(T)` after defining `A` without `T`; it should be `A[T] ⊗[k[T]] k(T)`, equivalently `A ⊗[k] k(T)`; affects the proof.
- **Misprint** in LombardiQuitte2015 at proof of Lemma XVI.4.5, printed p. 913, line 43199: the source identifies `sQ/sP` with `P/Q` although `P ⊆ Q`; it should be `Q/P`; affects the proof.
- **Error** in LombardiQuitte2015 at proof of Lemma XVI.4.6(1), printed p. 913, lines 43211–43216: the source labels the resolution differential on `M[X]` as multiplication by `X`; it should be `X ⊗ id − 1 ⊗ μ_M`, retaining the original `X`-action on `M`; affects the proof.
- **Error** in LombardiQuitte2015 at comment after Theorem XVI.5.15, printed p. 924, lines 43744–43748: the source concludes freeness of the kernel from affine Horrocks under the unit-head-ideal hypothesis; it should conclude extendedness; freeness needs additional assumptions, and localizing at the first entry alone does not ensure monic inversion; affects the proof.

## For the human reviewers

- **Licence.** Quillen1976 lines 24–27 restrict redistribution of the GDZ scan. The report contains locators and independently written mathematical corrections, not scan material.
- **Licence.** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:650` cites Schäppi's unpublished preprint, used only for the contextual counterexample claim; no text or formalization is reused.

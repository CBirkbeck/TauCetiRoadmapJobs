# Review of CalibratedGeometry (pull request #946 at d570d36)
**Verdict:** needs changes

:robot: Independent AI review of the repaired head. Five findings, all P3, none blocking. The worktree was not changed. The worker's gate passes at this head; the findings below are locators, a miscomputed Check, two supplier/consumer citations and house shape. Every blocking finding of the previous review (R01–R05) is repaired at this head; R06 is repaired; R07 is partly repaired (see R04 below).

## Repair of the previous review's findings

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 (P1) Campanato pointwise | `README.md:935–946`: "f agrees almost everywhere on U′ with a unique ζ-Hölder function f̃ … a pointwise Hölder conclusion is asserted only for the continuous representative"; negative control at `README.md:975–977` | Repaired. The witness f = 1 at 0 now has representative 0 and is listed as a Check. |
| R02 (P1) relative triangulation contract | `README.md:475–494`: 2.4 owns the relative triangulation (Munkres, waived) with a global vertex order and literal ordered face maps; Scope `README.md:66–68` says GeometricTopology item 1 fixes no boundary subcomplex and no vertex order | Repaired. The square Check `README.md:498–503` computes signs +1, −1, diagonal coefficients −1, +1, boundary `[a,b]+[b,d]−[c,d]−[a,c]`; recomputed below. |
| R03 (P1) HomotopySpheres triangle | No occurrence of HomotopySpheres; 1.4 compares with CharacteristicClasses C1.1a only (`README.md:329–333`), stable classifiers deferred to TopologicalKTheory T1.6a (`README.md:78–80`) | Repaired. |
| R04 (P2) Gram–Hadamard | `README.md:64–65`, `172–175`: SuccessiveMinima 0.1.2 `hermitian_gram_hadamard` consumed; 1.2's API bullet cites it | Repaired; SuccessiveMinima `README.md:188–191` on main states it. |
| R05 (P2) all-degree Wirtinger headline | `Suggested.lean:95–149`: `kahlerBivector`, `kahlerPowerForm`, `complexRealFrame`, `norm_kahlerPowerForm`, `isCalibratedFrame_kahlerPowerForm_iff` | Repaired; elaborates with only `sorry` warnings. |
| R06 (P3) shape | Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, six layers with Checks, Examples, Dependencies | Repaired. |
| R07 (P3) locators | McLean, Joyce, Züst and Campanato locators attached with line numbers; Harvey–Lawson still cited "Ch. II" at six targets; manifest still records only McLean and Munkres | Partly repaired: R04 below. |

## R01 (P3) — The 1.6 product Check misstates the binomial bound

**Location:** `README.md:389–390`, "The standard Kähler forms `ω₁` on ℂ and `ω₂` on ℂ give … comass 1, while the binomial bound gives 2."

**Claim:** The bound `comass(φ∧ψ) ≤ binomial(k+l,k)·comass(φ)·comass(ψ)` of line 378 evaluates to 2 for two 2-forms.

**Witness:** k = l = 2 gives `binomial(4,2) = 6`. The value 2 is `binomial(2,1)`, the bound of the first Check (two 1-forms). The inequality `1 ≤ 6` holds, so the target is sound; the Check's number is not.

**Repair:** Write "while the binomial bound gives `binomial(4,2) = 6`", and, if the author wants the number 2 kept, attach it to the first Check (`dx ∧ dx`, bound `binomial(2,1) = 2`). Tested: `ω₁∧ω₂` on `(e₁,ie₁,e₂,ie₂)` evaluates to 1 ≤ 6.

## R02 (P3) — HeegaardFloer citations: the Robbin–Salamon index is F1.4, and F2.6c owns the degree-two compatible-triple Wirtinger inequality

**Location:** `README.md:81`, "The Robbin–Salamon Maslov index of Lagrangian paths: HeegaardFloer F1.3."

**Claim:** HeegaardFloer F1.3 owns the Maslov index of Lagrangian paths.

**Witness:** HeegaardFloer `README.md:1911` on main is "3.3 Spectral flow (F1.3)"; `README.md:1941` is "3.4 Maslov and Conley–Zehnder conventions and determinant lines (F1.4)", which consumes `TauCeti.TotallyRealLoop.maslovIndex` (`TauCeti/LinearAlgebra/TotallyReal/Maslov/Phase.lean:51`, the `det²` phase on the Lagrangian Grassmannian) and says the path/RS/CZ theory has that single owner; FukayaTheory at its open head cites "HeegaardFloer F1.4 (Lagrangian-path Robbin–Salamon index)". Separately, HeegaardFloer `README.md:40–45` on main states that F2.6c (`README.md:2461` ff.) proves the degree-two Wirtinger inequality `ω(v,w) ≤ |v∧w|_g` for an ω-compatible J itself and that the general-degree inequality on comass carriers belongs to CalibratedGeometry; this roadmap's Scope does not mention F2.6c.

**Repair:** Cite F1.4 at line 81, and name `TauCeti.TotallyRealLoop.maslovIndex` as the native loop invariant that the 5.3 sentence "on oriented Lagrangians it is twice the phase class" compares with (the unit circle: phase class 1, `det²` degree 2). Add one clause under Owned elsewhere: the pointwise degree-two inequality for an ω-compatible J on Tau Ceti's symplectic carriers is HeegaardFloer F2.6c's; 4.1 keeps the comass-carrier form on ℂⁿ, the r = 1 instance of 4.2, and 4.2's transport to Hermitian spaces is the all-degree statement.

## R03 (P3) — Downstream consumers omits GeometricCurrents, which consumes C1–C3 on main

**Location:** `README.md:1027–1031`, the Downstream consumers list (FukayaTheory and RiemannianGeometry only).

**Claim:** The listed roadmaps are the consumers of this roadmap.

**Witness:** GeometricCurrents `README.md:81` on main consumes "CalibratedGeometry C1/C2: Comass; the single integral finite smooth-chain complex on DG8.3's `SmoothSimplex →₀ ℤ`, integral smooth-to-singular comparison, and finite oriented relative fundamental chains"; `README.md:88` consumes "C3's calibration-minimum/stability consequence and oriented-chain comparison"; `README.md:65` the comass/Gram comparison; `README.md:998` the oriented-frame quotient topology; `README.md:426–440` the integer generator maps and both face-compatible chain homotopies.

**Repair:** Add a bullet naming GeometricCurrents G1–G3 and G6 with the contracts it reads: 1.2–1.3 (comass/Gram and simple-vector comparison), 1.4 (oriented-frame quotient topology), 2.3 (the integral complex, the quasi-isomorphism with its integer generator maps and both chain homotopies, coefficient-change agreement), 2.4 (finite oriented relative fundamental chains) and 3.1–3.2. GeometricCurrents' anchor `#c2-calibrated-immersions-and-integration` no longer exists at this head; that is its locator to update, recorded here so the C2 heading is not renamed again without notice.

## R04 (P3) — Locators: chapter-level Harvey–Lawson citations, the unlocated decomposable-factor product theorem, and four cited texts absent from the manifest

Re-raised: R07 (partly repaired).

**Location:** `README.md:246, 278, 304, 357, 602, 624` ("Harvey–Lawson 1982, Ch. II"), `README.md:791` ("Ch. III"); `README.md:378–380` (the decomposable-factor product theorem, no locator); `Suggested.lean:81, 135` ("Ch. II"), `Suggested.lean:171` ("§III.1; Joyce2001SLLectures line 90").

**Claim:** Each target carries an exact locator.

**Witness:** The cached text of Harvey–Lawson (institutional copy, read for the locator check only) has the comass definition at II.(3.1), printed p. 56 (line 370); the pullback and integral inequality at Lemma II.3.5, p. 57 (line 393); the Wirtinger inequality and its normal form at Theorem II.6.11 and Lemma II.6.13, pp. 70–71 (lines 807, 814); the decomposable-factor product theorem at Proposition II.7.10, p. 76 (line 1004); the special Lagrangian comass at Theorem III.1.10, p. 89 (line 1412); the phase/mean-curvature relation at Proposition III.2.17, p. 96 (line 1647). Joyce2001SLLectures line 90 states only that the real plane is calibrated by `Re Ω`, not the comass bound. `packages/CalibratedGeometry/sources.toml` records Munkres1966EDT and McLean1998 only, while the README cites Joyce2001SLLectures, Zust2025Products and Campanato1963 by line number and HarveyLawson1982 by key.

**Repair:** Replace each "Ch. II"/"Ch. III" by the theorem and printed page above (1.1 and 1.3: II.(3.1); 1.2 and 2.2: Lemma II.3.5; 4.1 and 4.2: Theorem II.6.11 and Lemma II.6.13; 5.4: Proposition III.2.17 and §III.2; the Lean docstrings likewise, with Theorem III.1.10 at line 171), keeping "uncertified" where the author cites by locator only. Add "(Harvey–Lawson 1982, Proposition II.7.10, p. 76, uncertified)" after the decomposable-factor sentence of 1.6. Record the four works in the manifest through the sources service (arXiv math/0111111v3; arXiv 2503.12402v2; Numdam ASNSP_1963_3_17_1-2_175_0; the Harvey–Lawson DOI as uncertified), so that the line-number locators are pinned to a recorded text. The test: every "line N" in the README resolves in a manifest entry's text.

## R05 (P3) — House shape: Checks naming Lean declarations, a docstring/README mismatch, and 6.3 placed before the 6.4 it needs

**Location:** `README.md:609` ("so `norm_standardKahlerForm` needs `1 ≤ n`") and `README.md:651` ("so `norm_kahlerPowerForm` needs `r ≤ n`"); `README.md:31` ("its docstring names the headline theorems of Layers 2, 3, 5 and 6"); `README.md:866` and `902` (6.3 before 6.4).

**Claim:** The Checks are prose; the README describes the docstring; subsections are in build order.

**Witness:** The house rule is that a Check never names or claims a Lean counterpart (`README.md:710` does it right: "so the comass statement needs `1 ≤ n`"). `Suggested.lean:11–27` names the unstatable headlines of Layers 3, 4, 5 and 6 and nothing of Layer 2. 6.3's Needs line (`README.md:892`) lists 6.4, and the Dependencies line (`README.md:1024`) says "6.3 needs 6.1, 6.2 and 6.4".

**Repair:** Phrase the two Checks as line 710 does. Write "Layers 3, 4, 5 and 6" at line 31. Renumber 6.4 as 6.3 and 6.3 as 6.4, updating the two Needs lines, the Dependencies line and the cross-references in 6.1 ("solution charts of 6.3") and 6.5.

## Verified sound

**Scope, principles and mechanics.** Read all 1053 README lines and all 189 Lean lines at `d570d36`, the previous review and its change set (1738 lines; the README was rewritten into the house shape). The folder is new on main; no existing CalibratedGeometry roadmap is re-planned. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/CalibratedGeometry'` is empty; the folder holds README.md, Suggested.lean and metadata.toml. No route-specific shortcut, copied passage, algorithm, `set_option`, sorry'd data, admitted `example`, process word or pull-request number was found. The worker's gate reports every scanner, depcheck and the targeted build passing. Independently ran the dependency check with `--movable` against the merge order:

```text
depcheck: 209 roadmaps, 1726 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. CalibratedGeometry is at position 212 of the order; its only open-pull-request suppliers are SmoothBundlesConnections (8) and PseudodifferentialOperators (9); every other supplier is on main. FukayaTheory (213) and GeometricCurrents (main) are consumers. No declared gaps (no readable `design/plan.json`), and none is needed: every consumed section exists where it is cited.

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean`: exit 0, exactly eight `sorry` warnings (lines 52, 59, 82, 88, 136, 144, 172, 181). A scratch copy with `#check @name` for all 16 declarations elaborated; each type agrees with the worker's extraction and with its README statement: `FiniteDimensional ℝ E` on the two Layer-1 theorems; `1 ≤ n` on `norm_standardKahlerForm`, `norm_standardSpecialLagrangianForm`, `specialLagrangianFrame_iff`; `r ≤ n` on `norm_kahlerPowerForm`; no section binder lost. The three definitions with real bodies (`standardKahlerForm`, `kahlerPowerForm`, `standardComplexVolume`) are real-bodied on native carriers; `frameVolume`, `IsCalibratedFrame`, `kahlerBivector`, `complexRealFrame` are simple definitions needed by the headlines. The `hn : 1 ≤ n` of `specialLagrangianFrame_iff` is unused by the statement's truth (n = 0: both sides are `θ ∈ 2πℤ`); a note, not a finding.

**Padding probe.** On the scratch copy every sorried theorem was tried with `first | (simp; done) | rfl | infer_instance | (aesop; done) | sorry`: all eight fell through to `sorry` (eight warnings, no theorem closed). None restates a definition, mirrors a Check or computes a small value. The degree-two pair is the r = 1 instance of the all-degree pair but carries the cleaner equality form `w = i v`; kept.

**Headline coverage.** README headlines: C1 comass = native norm and the frame-volume inequality (stated); C3 fundamental theorem (not statable: no manifold forms, named in the docstring); C4 all-degree Wirtinger and equality classification (stated) and the Kähler-submanifold application (named); C5 special Lagrangian comass and classification (stated), manifold minimality (named); C6 McLean's theorem and the second-variation/Jacobi identification (named, with the missing carriers). No statable headline is absent and none is forced through a stand-in.

**Pinned declarations opened** (Mathlib pin `6b7abb3c`, Tau Ceti pin `a91d3aaf`, paths relative to the library repositories):

| Declaration | File:line | What it gives / limit |
|---|---|---|
| `ContinuousAlternatingMap.norm_def` | `Mathlib/Analysis/Normed/Module/Alternating/Basic.lean:194` | infimum of product-norm bounds; not a frame supremum (1.1 is the target) |
| `norm_constOfIsEmpty`, `norm_compContinuousLinearMap_le` | same file, 310, 432 | k = 0 value; pullback bound `‖φ‖‖L‖^k` |
| `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` | `Mathlib/Analysis/Normed/Module/Multilinear/Basic.lean:1038` | equality along a surjective isometry |
| `ContinuousAlternatingMap.restrictScalars` | `Mathlib/Topology/Algebra/Module/Alternating/Basic.lean:447` | used by `standardComplexVolume` |
| `LinearMap.normDet_sq_eq_det_gram` | `Mathlib/Analysis/InnerProductSpace/NormDet.lean:303` | `frameVolume = sqrt det Gram` |
| `Matrix.det_gram_ne_zero_iff_linearIndependent` | `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:125` | vanishing exactly on dependent frames |
| `exteriorPower.ιMulti`, `alternatingMapLinearEquiv` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56`, `:212` | carrier and linear dual of exterior powers |
| `exteriorPower.inner_ιMulti_ιMulti` | `Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean:127` | Gram inner product, `[FiniteDimensional ℝ E]` required (README says so) |
| `Submodule.pow_mem_pow` | `Mathlib/Algebra/Algebra/Operations.lean:358` | `ω̂ʳ ∈ (⋀²)^r`, used in `kahlerPowerForm` |
| `innerₛₗ` | `Mathlib/Analysis/InnerProductSpace/Basic.lean:132` | the pairing in `kahlerPowerForm` |
| `Matrix.detRowAlternating` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:53` | rows = frame vectors; `Ω v = det` |
| `IsCoercive.continuousLinearEquivOfBilin` | `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:101` | Lax–Milgram for 6.4 |
| `ImplicitFunctionData.contDiffAt_implicitFunction` | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41` | needs the derivative and complement data supplied (6.3 says so) |
| `LinearMap.continuous_of_finiteDimensional` | `Mathlib/Analysis/Analytic/Polynomial.lean:83` (use site) | continuity in `kahlerPowerForm` |
| `TauCeti.stdSymplecticForm`, `stdSymplecticForm_apply` | `TauCeti/Geometry/Symplectic/StandardCompatible.lean:83`, `:90` | `⟪u.1,w.2⟫ − ⟪u.2,w.1⟫`, matching the README sign |
| `SymplecticForm.transport`, `AlmostComplexStructure.transport`, `Compatible.transport` | `SymplecticTransport.lean:63`, `Transport.lean:59`, `SymplecticTransport.lean:226` | through the inverse equivalence, as the README says |
| `SymplecticForm.IsLagrangian` | `TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99` | equality with the symplectic orthogonal |
| `complexAssociatedForm`, `Compatible.hermitianCore`, `complexModule` | `Hermitian.lean:78`, `:260`; `Complex/Module/Basic.lean:79` | conjugate-first `g + iω` |
| `alternatizeBilinCLM` | `TauCeti/Analysis/Normed/Module/Alternating/Bilinear.lean:43` | `B − Bᵀ`, hence `2B` on alternating B (README's warning is right) |
| `TauCeti.TotallyRealLoop.maslovIndex` | `TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean:103`, `Phase.lean:51` | `det²` loop phase (R02) |

Mathlib and Tau Ceti contain no comass, calibration or special Lagrangian object (grep of both pins); Tau Ceti's only Lagrangian-Grassmannian object is the totally-real loop phase above.

**Resolved supplier citations** (every cited section opened on main or at the supplied head):

| Supplier | Resolved at | Result |
|---|---|---|
| SuccessiveMinima 0.1.2 `hermitian_gram_hadamard` | `README.md:188–191` | `0 ≤ Re det Gram(v) ≤ Π‖v_i‖²`, any finite family, infinite-dimensional ambient allowed |
| DifferentialGeometry 0.3, 1.2, 5.1–5.4, Layer 6, 8.3 (`SmoothSimplex`, `exists_smoothSimplex_homotopicRel`, real-only complex), 8.4, 9.3, 12.1, 12.4, 12.5 | `README.md:284, 320, 507–524, 782, 836–848, 872, 915, 923, 930` | all present; 8.3's smoothing hypotheses (`T2Space`, `SigmaCompactSpace`, finite dimension) carried in Conventions |
| AlgebraicTopology Stage 2, Stage 3 item 1 (subdivision/prism), Stage 6.3 | `README.md:326, 471–483, 946, 806` | present |
| RiemannianGeometry R1, R5a.1 `volumeVariation_isContDiff`, R5a.2 | `README.md:179, 1067–1080, 1103` | one fixed compact support on noncompact sources, as the contract says |
| GeometricTopology Layer 1 tubular neighbourhoods; smoothing-and-triangulation item 1 | `README.md:218, 930–944` | boundaryless Whitehead triangulation only; relative ordered version owned here (2.4) |
| ComplexKahlerGeometry K1, K2, K4, K5a (de Rham Hodge, Green, harmonic projection), K5b.0 (`dvol = ωⁿ/n!`), K6.1 | `README.md:96, 193, 444, 570, 1075–1082, 1169–1176, 1274` | present |
| PseudodifferentialOperators P1.0, P5 (§5.4 full vs little Hölder), P6 | `README.md:164, 927, 1337–1361, 1484` | present |
| PDE A.1–A.7 (A.7 Hölder spaces; Campanato/Morrey at the inventory line 191), D.16–D.17, E.22 | `README.md:191, 226–262, 305–310, 331` | all scalar, as the contract says |
| SmoothBundlesConnections B1.4, B2, B5; LieGroups Layer 2 | SBC `README.md:421, 559–802, 1072–1209`; LieGroups `README.md:275–280` | present |
| CharacteristicClasses C1.1a; TopologicalKTheory T1.5, T1.6a; GeneralizedCohomology G4.0b | CC `README.md:245`; TKT `README.md:292, 299, 328, 432`; GC `README.md:39–40, 939` | present |
| HeegaardFloer F1.3 | `README.md:1911` (spectral flow) | drift: the Maslov index is F1.4 (R02) |
| FukayaTheory (downstream, open head #1045) | `README.md:32, 87–89, 210, 230` | consumes C2 as stated |
| GeometricCurrents (downstream, main) | `README.md:65, 81, 88, 92–95, 426–440, 996–999` | consumes C1–C3; not listed here (R03) |

**Sources.** All four readable works were read in the cache: McLean1998 (`56cb6eb6…`, every cited line checked: 27, 32, 37–48, 448, 450–462, 483, 486, 493, 510, 519, 527, 530, 532, 539–550, 572, 580, 589–595, 598, 603; Theorem 3.13 is on printed p. 723), Joyce2001SLLectures v3 (`a35a06d6…`, lines 53, 58, 62, 76, 90, 96, 107, 678), Zust2025Products v2 (`304c90db…`, lines 59, 74, 76: `294/256`), Campanato1963 (`ef235123…`, Teorema [I.2] at printed p. 183, lines 224–228, with `q = 2`, `λ = n + 2ζ` giving exponent ζ), and Harvey–Lawson (institutional copy `af0befdd…`) for the locator check of R04. Munkres1966EDT is waived (Chapter II, §10 cited by locator).

| Sample target | Text opened | Assessment |
|---|---|---|
| 1.3 exterior-power formulation | HL II.(3.1) line 370; Mathlib exterior Gram product | `comass ≤ |φ|_H ≤ sqrt(binomial(n,k))·comass` verified below; chapter-level locator (R04) |
| 1.4 oriented Grassmannian / Stiefel | CC C1.1a, TKT T1.5, GC G4.0b, SBC B1.4 on main | dimension `k·dim E − k(k+1)/2` and the k = 0, 1, dim E cases verified below |
| 2.1 smooth calibrations | Joyce Def. 2.1 line 58 | supports closed + comass ≤ 1 |
| 2.2 calibrated immersions | Joyce line 62; HL Lemma II.3.5 line 393 | supports pointwise and integrated inequalities on compact sources |
| 2.3 integral smooth chains | DG 8.3 lines 836–844 (real-only operators, simplex-level smoothing) | the integral complex and ℤ-quasi-isomorphism are new here; consistent with DG |
| 2.4 ordered relative triangulations | Munkres waived; GT item 1 lines 938–944 | square and interval Checks recomputed below |
| 3.3 products / minimality | HL Prop. II.7.10 line 1004 (unlocated, R04); 3.2's equator | equator second derivative `−m·Vol` verified |
| 4.2 all-degree Wirtinger | HL Thm II.6.11 line 807, Lemma 6.13 line 814; McLean lines 37–48 | normal-form route matches; values verified below |
| 5.1 special Lagrangian linear algebra | HL Thm III.1.10 line 1412, Cor. III.1.11 line 1417; Joyce Props. 2.3–2.4 lines 96, 107; McLean Prop. 3.2 line 483 | hypotheses match (Lagrangian + `Im = 0` + positivity) |
| 5.2 Lagrangian Grassmannian / symplectic comparison | Joyce Prop. 2.3 line 96; McLean Lemma 3.1 line 448; Tau Ceti `stdSymplecticForm_apply` | `U(n)/SO(n)`, `SU(n)/SO(n)` dimension and the transport sign verified |
| 5.3 phase and mean curvature | McLean lines 450–462; HL Prop. III.2.17 line 1647 | `H = J∇θ` verified on the circle; HL's (2.19) sign noted under Source issues |
| 5.4 gradient graphs | HL §III.2 (chapter-level, R04) | `det(I + i Hess u)` and the three Checks verified |
| 6.1 normal parametrization | McLean Cor. 3.3, Rem. 3.4 lines 486, 493; lines 539–550; Lemma 3.12 line 580; proof line 572 | `β = −Σ a_j dx_j`, `ι_V Im Ω = −★β`, derivative `(dβ, −d★β)` recomputed |
| 6.2 Hölder Hodge theory | McLean lines 589–595; CKG K5a lines 1075–1082; PDO P6 | kernel/complement and per-component exactness verified on circles |
| 6.4 C¹-to-Hölder regularity | Campanato Teorema I.2 line 224; PDE A.1–A.7, D.16–17, E.22 | a.e.-representative form is right; exponents verified; quantitative package owned here without a primary source (unchanged from r1, see Not verifiable) |

**Adversarial computations.** Rows cover the sampled targets, the headline theorems, the targets the findings touch, and the Checks. `e_j` are the standard vectors, `i` multiplication by i, conj-first Hermitian product.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Kähler sign convention (`README.md:92–95`) | n = 1, v = 1, w = i | `Im(conj(1)·i) = 1`; `dx∧dy(1,i) = 1` | pass |
| Ω normalization (`:97–99`) | n = 1; n = 2 | `dz∧dz̄ = −2i dx∧dy`, `(i/2)(−2i) = 1`; `Ω∧Ω̄ = 4 dvol`, `(−1)(i/2)²·4 = 1 = ω²/2!` | pass |
| Joyce phase convention (`:100–102`) | θ | `Re(e^(−iθ)Ω) = cos θ Re Ω + sin θ Im Ω` | pass |
| `norm_eq_sSup_abs_orthonormal` | k = 1, φ = 3dx on ℝ; k = 0, constant −3; k = 3 on ℝ² | `3 = sup{3}`; `3 = |−3|`; `0 = sSup ∅` (φ = 0) | pass |
| 1.1 Check Hilbert vs comass | `dx₁∧dx₂ + dx₃∧dx₄` | comass 1 at `(e₁,e₂)`; Hilbert `√2` | pass |
| 1.1 Check non-orthonormal | `dx₁∧dx₂` on `((2,0),(0,3))` | value 6 > comass 1 | pass |
| `frameVolume` | `((2,0),(0,3))`; `(v,v)`; empty; `((1,0),(1,1))` | `√36 = 6`; 0; 1; Gram `[[1,1],[1,2]]`, det 1, `Π‖v‖ = √2` | pass |
| `abs_eval_le_norm_mul_frameVolume` | area form on `(2e₁,3e₂)`; `(e₁,e₁)`; k = 0 | `6 ≤ 1·6`; `0 ≤ 0`; `|c| ≤ |c|·1` | pass |
| 1.2 route | rank-deficient L; L = QR | both sides 0; `φ(Le) = det R·φ(Qe)`, `|det R| = normDet` | pass |
| 1.3 comparison | ω on ℝ⁴; degree 1; `dx₁∧⋯∧dx_k` | `1 ≤ √2 ≤ √6`; comass = Hilbert; `1 = 1` | pass |
| 1.4 Stiefel dimension | k = 2, E = ℝ³ | `6 − 3 = 3`; oriented Grassmannian = S² | pass |
| 1.4 small k | k = 1 in ℝ; k = 0; k = dim E = 2 | two points; two rays; two orientations | pass |
| 1.4 Gram differential | symmetric A, variation `vA/2` | `d Gram = (Aᵀ + A)/2 = A` | pass |
| `IsCalibratedFrame` / 1.5 Checks | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `((2,0,0),(0,½,0))`; k = 0, φ = ±1 | 1, −1, 0; value 1 but not orthonormal; empty frame calibrated iff φ = 1 | pass |
| 1.6 product bound | `dx ∧ dx` on ℝ⊕ℝ; `ω₁ ∧ ω₂` | `binomial(2,1) = 2 ≥ 1`; `binomial(4,2) = 6 ≥ 1`, README says 2 | R01 |
| 1.6 Züst control | two copies of Φ ∈ ⋀⁸ℝ¹⁶ | `294/256 = 1.148… > 1` | pass |
| 1.6 decomposable factor | `dx` on ℝ ⊕ unit area on ℝ² | product comass 1, equality planes products | pass (locator missing, R04) |
| 2.1 Checks | `dx₁∧dx₂`; `2 dx₁∧dx₂`; `x₃ dx₁∧dx₂` | closed, comass 1; closed, comass 2; `d = dx₁∧dx₂∧dx₃`, comass `|x₃|` | pass |
| 2.1 parallel ⇒ closed | `dφ = Alt(∇φ)`, ∇φ = 0 | `dφ = 0`; comass locally constant | pass |
| 2.2 Checks | plane `x₃ = 0` both orientations; plane `x₃ = x₁`; line `(1,1)/√2` | `f*φ = ±dvol`; tangents `(1,0,1),(0,1,0)`: `f*φ = 1`, `dvol = √2`; `(dx₁+dx₂)/√2` gives 1, `dx₁` gives `1/√2` | pass |
| 2.3 boundary | 2-simplex `[012]` | `∂∂ = [2]−[1]−[2]+[0]+[1]−[0] = 0`; unsigned sum `≠ 0` | pass |
| 2.3 mass | `t ↦ 2t`; `t ↦ |2t−1|`; constant | 2; 2 (image length 1); 0 | pass |
| 2.4 square | `a<b<c<d`, `[a,b,d]`, `[a,c,d]` | `det((1,0),(1,1)) = 1`, `det((0,1),(1,1)) = −1`; `∂c = [b,d]−[a,d]+[a,b] − ([c,d]−[a,d]+[a,c]) = [a,b]+[b,d]−[c,d]−[a,c]` | pass |
| 2.4 opposite diagonal orders | `[a,d] + [d,a]` | nonzero in the free module | pass (negative control) |
| 2.4 interval; 2-simplex example | `[0,1]`; `Δ²` | `∂ = [1]−[0]`; `∂ = [e₁,e₂]−[e₀,e₂]+[e₀,e₁]`, `∫dx∧dy = ½` | pass |
| 3.1 fundamental theorem | flat disk vs hemisphere; reversed disk; bump graph | `π ≤ 2π`; not calibrated, no conclusion; area `> π`, not calibrated | pass |
| 3.1 equality case | defect `dvol − f*φ ≥ 0` continuous | integral 0 ⇔ defect 0 ⇔ calibrated | pass |
| 3.2 first/second variation | flat disk `u e₃`, u = 0 on boundary | `H = 0`, `δ²Vol = ∫|∇u|² ≥ 0` | pass |
| 3.2 boundary term | disk boundary moved outward | first-order area change `≠ 0` | pass (hypothesis needed) |
| 3.2 equator | `Sᵐ ⊂ S^(m+1)`, latitude variation | `Vol = cos(t)^m Vol(Sᵐ)`, `Vol″(0) = −m Vol(Sᵐ)`; m = 1: `−2π` | pass |
| 3.3 torus circles | `S¹×{pt}`, `{pt}×S¹`, diagonal | `dθ₁`, `dθ₂`, `(dθ₁+dθ₂)/√2` give 1 on unit tangents | pass |
| `standardKahlerForm` (4.1) | n = 1: `(1,i)`, `(i,1)`, `(1,1)`; n = 2: `(e₁,e₂)`, `(e₁,ie₁)` | 1, −1, 0; 0, 1 | pass |
| `norm_standardKahlerForm` | n = 1; n = 0 | 1; zero form, norm 0 (hn needed) | pass |
| `isCalibratedFrame_standardKahlerForm_iff` | `(v, w)` orthonormal with `Im⟪v,w⟫ = 1`; `w = iv` | Cauchy–Schwarz forces `⟪v,w⟫ = i`, so `w = iv`; conversely `⟪v,iv⟫_ℝ = Re(i) = 0`, `ω = 1`; n = 0 both sides false | pass |
| 4.1 independent-pair equality | `w = av + bJv` | equality iff `b > 0`, i.e. the oriented plane is J-complex | pass |
| `kahlerBivector` pairing | `⟨ω̂, v∧w⟩` | `Σ_j det[[x_j,x′_j],[y_j,y′_j]] = Σ(x_j y′_j − y_j x′_j) = Im⟪v,w⟫` | pass |
| `kahlerPowerForm`, n = r = 2 | `(e₁,ie₁,e₂,ie₂)` | `ω̂² = 2 e₁∧ie₁∧e₂∧ie₂`; `2/2! = 1`; without `1/r!`: 2 | pass |
| orientation controls | `(ie₁,e₁,e₂,ie₂)`; `(e₁,e₂,ie₁,ie₂)` | −1; −1 (one transposition) | pass |
| real 4-plane | n = 4, r = 2, `(e₁,…,e₄)` | every Gram row against `ie_j` is 0 | pass |
| mixed plane | n = 3, r = 2, `(e₁,ie₁,e₂,cos t ie₂ + sin t e₃)` | only `(j,k) = (1,2)` contributes: `cos t`; ±1 iff `t ∈ πℤ` | pass |
| r = 0; r > n | any n; r = 3, n = 2 | `ω̂⁰ = 1`, `0! = 1`, value 1 on the empty frame, comass 1; `ω̂³ ∈ ⋀⁶ℝ⁴ = 0`, comass 0 | pass (hr needed) |
| `isCalibratedFrame_kahlerPowerForm_iff` | r = 0; r > n; complex r-plane | empty u, `ιMulti ![] = 1` both sides; LHS and RHS false; `complexRealFrame u` is real-orthonormal (`⟪u_j,iu_j⟫_ℝ = Re(i) = 0`) with the same unit decomposable multivector | pass |
| 4.3 Checks | `ℂʳ×0`; torus lattice `a_jℤ+ib_jℤ`; real torus `ℝ²/ℤ²` | restriction `dx₁∧dy₁∧⋯`; volume `Π a_j b_j`; `ω|_T = 0 ≠ 1` | pass |
| `standardComplexVolume` | `(e₁,…,e_n)`; swap; repeat; n = 0 | 1; −1; 0; empty determinant 1 | pass |
| `standardSpecialLagrangianForm` / 5.1 Checks | n = 1: `1, −1, i`, θ = 0, π/2; n = 2: `(ie₁,ie₂)`, `(e₁,ie₂)`, `(e₁,ie₁)` | `1, −1, 0`, `Im i = 1`; `Re(i²) = −1` (1 at θ = π); `Re i = 0` (1 at θ = π/2); det 0, `Im⟪e₁,ie₁⟫ = 1` | pass |
| `norm_standardSpecialLagrangianForm` | n = 1 phases 0, π/2; n = 0 | `dx`, `dy`, norm 1; constant `cos θ`, comass `|cos θ|` (hn needed) | pass |
| `specialLagrangianFrame_iff` route | orthonormal v | `|det_ℂ v| ≤ Π‖v_i‖_ℂ = 1` with equality iff rows complex-orthogonal, i.e. `⟪v_i,v_j⟫_ℂ = δ_ij` iff Lagrangian; then `e^(−iθ)Ω v = 1` iff `Im = 0` and `Re > 0` | pass |
| 5.1 orientation control | `(−e₁,e₂)`, θ = 0 | Lagrangian, `Im = 0`, `Re = −1 < 0`; LHS −1 | pass |
| 5.2 dimensions | n = 1; n = 2 | `U(1)/SO(1) = S¹`, `SU(1)/SO(1)` point, `(1+1−2)/2 = 0`; `4 − 1 = 3`, `3 − 1 = 2 = (4+2−2)/2` | pass |
| 5.2 orientation reversal | `−e₁` in a frame | `det` multiplied by −1, phase + π | pass |
| 5.2 transport sign | `(ω₀.transport R.symm) v w = ω₀(Rv,Rw)` | `⟪Re v, Im w⟫ − ⟪Im v, Re w⟫ = Im(conj(v)w)`; n = 1: `ω₀((1,0),(0,1)) = 1` | pass |
| 5.2 adapter vs `alternatizeBilinCLM` | B = area form | intended value 1; `B − Bᵀ` gives 2 | pass (distinct target) |
| 5.3 circle | `z = e^(is)`, tangent `ie^(is)` | `Ω(t) = e^(i(s+π/2))`, phase class 1, Maslov 2 | pass |
| 5.3 `H = J∇θ` | circle radius ρ | `∇θ = t/ρ`, `Jt = −e^(is)` inward, `H = (1/ρ)(−e^(is)) = J∇θ`; `ι_Hω(V) = g(JH,V) = −dθ(V)` | pass |
| 5.3 unitary images | `diag(e^(iα_j))ℝⁿ` | phase `Σα_j` | pass |
| 5.4 Checks | `u = ax²/2`; `u = x₁x₂`; `u = (x₁²+x₂²)/2` | `det(1+ia)`, phase `arctan a`; eigenvalues ±1, `det[[1,i],[i,1]] = 2`, phase 0; `(1+i)² = 2i`, phase π/2 | pass |
| 5.4 example | graph of `∇(x₁x₂) = (x₂,x₁)` | spanned by `e₁+ie₂`, `e₂+ie₁`; `det/‖·‖² = 2/2 = 1` | pass |
| 5.4 phase derivative | `H = diag(1,0)`, `K = I` | `tr((I+H²)⁻¹K) = ½ + 1 = 3/2` | pass |
| 6.1 β sign | `V = Σ a_j ∂_(y_j)` on ℝⁿ | `ι_(∂y_j)(dx_j∧dy_j) = −dx_j`, `β = −Σ a_j dx_j`; `ω(∂y₁,∂x₁) = −1` | pass |
| 6.1 `ι_V Im Ω` | same V | `Σ a_j (−1)^(j−1) dx_1∧…ĵ…∧dx_n = Σ a_j ★dx_j = −★β` | pass |
| 6.1 derivative | Cartan | `L_V ω = dβ`; `L_V Im Ω = −d★β = ★(δβ)` with `δ = −★d★` on 1-forms | pass; McLean's (3.5)–(3.7) degree slip noted below |
| 6.2 `Z_⊥` | `f dθ` on S¹; two circles ±1; flat Tⁿ | `∫f = 0`; total 0 but per-component ±1, excluded; harmonic 1-forms constant, dim n | pass |
| 6.2 primitive | `η = sin x dx` on S¹ | `Gη = η`, `δGη = −cos x`, `d(δGη) = η` | pass |
| 6.2 derivative onto exact targets | `(a, b)` exact | `β = δGa + df` with `Δf = ±★b` solvable since `∫★b = 0` per component | pass |
| 6.3 moduli | flat Tⁿ; `b₁ = 0`; n = 1 geodesic in T² | n translations = `b₁(Tⁿ)`; rigid; 1-parameter = `b₁(S¹)` | pass |
| 6.4 Campanato Checks | f = 1 at 0; `|x|^ζ`; `sign x`; constants | every integral 0, representative 0; finite at ζ, `ρ^(2(ζ−ζ′)) → ∞` for ζ′ > ζ; `2ρ^(−2ζ) → ∞`; seminorm 0, sup needs L² term | pass |
| 6.4 exponents | n = 1, α = ½, γ = ¾; general | `κ₀ = 1 − 2 + 3/2 = ½ ∈ (0,1)`; `κ₀ ∈ (0,n)` iff `γ > 1 − n/2` | pass (`γ > ½` covers n = 1) |
| 6.4 decay | n = 2, `v = x₁`; `v = x₁x₂` | energy ratio `(ρ/r)²`; excess `πρ⁴/2`, ratio `(ρ/r)⁴ = (ρ/r)^(n+2)` | pass |
| 6.4 Campanato constants | `[f̃] ≤ C[f]^(1/2)`; converse | seminorm is an L² square; `∫_(B_ρ)|f − f_ρ|² ≤ [f]²_(C^(0,ζ)) ρ^(2ζ)·ω_n ρ^n` | pass |
| 6.5 second-jet identity | A = (a); `diag(1,−1)`; `[[0,1],[−1,0]]`; `I₂`; shear `[[0,1],[0,0]]` | `vol″ = a²`, `ReΩ″ = 0`; `vol = ReΩ = 1 + t²`, gap 0; `vol = 1+t²`, `Re = 1−t²`, gap″ 4 = `(1−(−1))²`; gap″ `2 − (−2) = 4 = (tr)²`; gap″ `1 − 0 = 1 = (A₁₂−A₂₁)²` | pass |
| 6.5 moving frame | `u₁ = e₁+ite₂`, `u₂ = e₂−ite₁` | `W₁₂ = Im(−2it) = −2t`, `|W′|² = 4`; `Im Ω = Im(1−t²) = 0` | pass (sign of W irrelevant) |
| 6.5 `det(S + iW) = |Ω(u)|²` | `(e₁,e₂)`; `(e₁,ie₁)` | `S + iW = ⟪u_i,u_j⟫_ℂ`, det `|det U|²`: 1; 0 | pass |
| 6.5 Jacobi operator | flat torus; `β = sin(2πx)dx` on unit circle | Hodge Laplacian, kernel n constants; eigenvalue `4π²`, `∫|δβ|² = 2π²` | pass |
| Layer 6 example | flat Tⁿ | L² metric = flat metric × Vol = 1; `δ²Vol(Σ a_j ∂_(y_j)) = 0` | pass |
| Docstring/README agreement | `README.md:31` vs `Suggested.lean:11–27` | README says Layers 2, 3, 5, 6; docstring names 3, 4, 5, 6 | R05 |

**Ownership.** Searched main, the board packages index (four packages, none geometric) and the 450 open roadmap pull requests for comass, calibration, special Lagrangian, Wirtinger, fundamental chain, Campanato, smooth-to-singular, oriented and Lagrangian Grassmannian and Gram–Hadamard. No other roadmap builds comass, calibrated immersions, the integral smooth complex, the Kähler-power or special Lagrangian forms, or McLean's theorem; HeegaardFloer on main explicitly assigns the general-degree Wirtinger inequality, the integral smooth-simplex complex and calibrated volume minimization to CalibratedGeometry (its `README.md:40–45`); GeometricCurrents and FukayaTheory consume them. The only overlaps are the degree-two compatible-triple inequality (HeegaardFloer F2.6c, R02) and the `det²` loop phase in Tau Ceti (R02); Gram–Hadamard is now imported. No `Suggested.lean` of another roadmap declares a `TauCetiRoadmap.CalibratedGeometry.*` name.

## Not verifiable

- Harvey–Lawson 1982 is cited by the README as uncertified. For the locator check I read the copy the sources service cached from an institutional archive; the printed pages above are from that copy. The roadmap's own text gives no HL line numbers, which is consistent.
- Munkres1966EDT is waived; Chapter II, §10 is cited by locator and not read.
- Campanato1963's OCR is garbled at the theorem statement (lines 225–228); the theorem's identity and hypotheses (`λ > n`, property (A), a.e. agreement with a Hölder function of exponent `(λ−n)/q`) were read from the surrounding Italian text and the page position.
- The quantitative C¹-to-Hölder, difference-quotient and vector Campanato iteration package of 6.4, the parametric gain of 6.3 and the nonlinear Hölder composition estimates have no primary-source locator beyond Campanato's characterization and the scalar PDE contracts; they are owned here with their routes, as in the previous review, and were checked on model instances only.

## Source issues

- **Misprint** in HarveyLawson1982 at Proposition III.2.17, equation (2.19), printed p. 96: the source says the derivative of the phase along V is minus the inner product of the mean curvature with JV; with the paper's standard J and the inward mean curvature of a circle the sign is plus (equivalently the mean curvature is J applied to the phase gradient); affects nothing (the README fixes its sign by a computed witness).
- **Misprint** in McLean1998 at the proof of Theorem 3.6, equations (3.5)–(3.7), printed p. 722: the source writes the n-form component of the linearization as the 0-form obtained by applying the star to the coderivative; it should be the n-form which is the exterior derivative of the star of the 1-form, as the following line's operator says; affects nothing.

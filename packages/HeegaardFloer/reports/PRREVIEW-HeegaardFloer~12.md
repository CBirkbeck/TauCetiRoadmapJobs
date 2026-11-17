# Review of HeegaardFloer (pull request #2477 at b4167f5)

**Verdict:** needs changes

Previous review (of an earlier pull request, at e27ef70): accepted with no findings, so there is nothing to re-check finding by finding. Its R01/R02 repairs are still in place at this head (`Suggested.lean` ends with `ForcedLagrangianDisc`; `README.md:2750–2756` keeps the "adapted to strips" wording). The pins have moved since (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), which is what R03 and R05 rest on.

## R01 (P1) — M.0c "All pairs" and its Corollary fail when f has infinitely many critical points

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:330–338`: "If r≥dim E+2, there is an admissible C^r family h such that, for some ε>0 and almost every s with ‖s‖<ε, f_s has the same critical points as f and is Morse–Smale."

**Claim:** The standing hypotheses (Lipschitz gradient, nondegenerate critical points, compact sublevels) allow infinitely many critical points; a finite admissible family, or a compactly supported g, changes f only on a compact set, so it cannot remove non-transverse connections outside it.

**Witness:** On ℝ², let f=|x|²/2 off the balls B(4ⁱe₁,4ⁱ/10) and 4²ⁱg(x/4ⁱ) inside, g even in y with a saddle–saddle orbit on the axis. Hessians are bounded, sublevels compact; every compactly supported perturbation misses a ball.

**Repair:** State both for finitely many critical points: "If r≥dim E+2 and f has finitely many critical points, there is …" and "Every C^∞ function f as above with finitely many critical points has …". If the general case is wanted, add the band form as its own bullet: "for each c there are an admissible C^r family h and ε>0 such that, for almost every ‖s‖<ε, W^u(p) and W^s(q) of f_s are transverse for all critical p,q in {f≤c}". Add the witness as a negative-control Check. (On the witness: the first form excludes it; the band form holds, since {f≤c} meets finitely many balls.)

## R02 (P2) — M.0c "Single pair": no hypothesis ties the supports of h to the slab

**Location:** `README.md:319–329`: "C a compact subset of W^u(p)∩{f=c₂}, and h admissible and C^r … W^u(p) and W^s(q) of f_s are transverse at every point of φ^(f_s)_T(C)."

**Claim:** The universal space `{(s,x) : x∈C, φ^(f_s)_T(x)∈W^s(q)}` uses W^u(p) and W^s(q) of f; the conclusion is about those of f_s. They agree only when the supports avoid the orbit before C and after time T; nothing assumes that. The spanning hypothesis "along φ_T(C)" is also unsatisfiable off W^s(q) unless the parameter derivatives alone span E.

**Witness:** `TauCeti.mem_stableSet_perturb_iff` and `mem_unstableSet_perturb_iff` (`TauCeti/Analysis/Calculus/Morse/MorseSmale/Perturbation.lean:288, 305`) identify the perturbed sets only when the forward, resp. backward, f-orbit avoids every `tsupport (h i)`.

**Repair:** "… and h a family of C^r admissible functions, each with support in f⁻¹((c₁,c₂)), with r≥max(ind p−ind q,0)+2. If … the parameter derivatives of s↦φ^(f_s)_T at s=0 together with the tangent cone of W^s(q) span E at every point of φ_T(C)∩W^s(q), then …". With supports in the open slab the two pinned lemmas give C⊂W^u_{f_s}(p) and W^s_{f_s}(q)∩{f<c₁}=W^s_f(q)∩{f<c₁}, so the universal space is the one for f_s.

## R03 (P3) — `sphereAut_existsUnique_map_triple` is proved at the pinned Tau Ceti

**Location:** `TauCetiRoadmap/HeegaardFloer/Suggested.lean:151`; `README.md:2821`: "Prove sharp triple transitivity (`sphereAut_existsUnique_map_triple`)".

**Claim:** The statement is the K=ℂ case of a pinned theorem; it closes with one `exact`.

**Witness:** `OnePoint.existsUnique_psl_smul_zero_one_infty_eq` (`TauCeti/Topology/Compactification/OnePoint/MultipleTransitivity.lean:175`): on a scratch copy with that module imported, `exact OnePoint.existsUnique_psl_smul_zero_one_infty_eq hxy hxz hyz` closes the goal.

**Repair:** Delete it from `Suggested.lean` (and "sphere triple normalization" from the module docstring's list). In §4.6a write "Consume Tau Ceti's `OnePoint.existsUnique_psl_smul_zero_one_infty_eq` for sharp triple transitivity", and list it under "From Tau Ceti".

## R04 (P3) — the gate fails: three mentions of a dropped name

**Location:** `README.md:56`, `2516`, `4917`: "HamiltonianSystems, HamiltonianFloerOperations, FukayaTheory and the"; "HamiltonianSystems Layer 1 specializes this inverse"; "**HamiltonianSystems Layer 1** specializes contraction inversion to df."

**Claim:** Gate rule `dropped` (no name of the project's dropped-names list): 3 hits, result FAIL. The lines are also on main, but the gate is run on this head.

**Witness:** `gate HeegaardFloer: … dropped=3 … FAIL`, lines 56, 2516, 4917.

**Repair:** Remove the name from the list at line 56, and delete the sentence at 2516–2518 ("HamiltonianSystems Layer 1 specializes … (see Downstream consumers).") and the one at 4917.

## R05 (P3) — §4.1 re-proves the flat Darboux theorem that the pinned Tau Ceti has

**Location:** `README.md:2554–2557`: "Prove **Darboux** on finite-dimensional boundaryless manifolds using this local Moser lemma, shrinking the domain to guarantee flow through [0,1]."

**Claim:** Darboux on an open subset of a finite-dimensional normed space, with the Moser field and identity, is at the pin and is neither cited nor consumed; only the chart transfer to the manifold carrier remains to prove.

**Witness:** `TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` (`TauCeti/Geometry/Symplectic/Darboux/Basic.lean:116`); `TauCeti.exists_contDiffOn_moserField` (`TauCeti/Analysis/Calculus/Moser.lean:101`).

**Repair:** List both under "From Tau Ceti" and replace the sentence by "Prove **Darboux** on finite-dimensional boundaryless manifolds by transferring `TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` through a chart and the migration comparison with `SmoothTwoForm`."

## R06 (P3) — §1.0c has no source locator

**Location:** `README.md:302–358` (the whole subsection): "Prove three results, with the index difference truncated at0 in ℕ."

**Claim:** Three theorems are stated with a proof route and no source; every target carries a locator.

**Witness:** No author, theorem or page occurs in lines 302–358; the pinned module the section consumes names two (`Perturbation.lean:66–68`: Audin–Damian; Smale, Ann. of Math. 74 (1961), 199–206).

**Repair:** Cite at the claim the theorem the slab-by-slab route follows, with theorem and page read from the text, and add it to References; say in one clause that the source perturbs the vector field where M.0c perturbs the function, if that is the case.

## R07 (P3) — §1.0c `*Needs:*` cites the wrong module for the global charts and contradicts "consumes only"

**Location:** `README.md:356–358`: "`Analysis/Calculus/Morse/{CompactSublevel,LocalInvariantManifold}.lean` and `Analysis/Calculus/Sard/`; F0.S's sharp finite-dimensional Sard; MorseTheory M1's Hessian index."

**Claim:** The C^n submanifold charts of W^s(q) and W^u(p) that the universal space needs are in `GlobalChart.lean`; `LocalInvariantManifold.lean` says its globalization is "not established here". `README.md:206–208` and the description say M.0c consumes only Tau Ceti modules and F0.S, yet MorseTheory M1 is listed.

**Witness:** `IsNondegenerateCriticalPoint.exists_stableSet_chart`, `exists_unstableSet_chart` (`TauCeti/Analysis/Calculus/Morse/GlobalChart.lean:184, 217`); `morseIndex` is used natively in `MorseSmale/Basic.lean:106`.

**Repair:** "*Needs:* Tau Ceti's `Analysis/Calculus/Morse/MorseSmale/{Basic,Perturbation,Surjective}.lean`, `Analysis/Calculus/Morse/{CompactSublevel,GlobalChart}.lean` (with `morseIndex`) and `Analysis/Calculus/Sard/`; F0.S's sharp finite-dimensional Sard."

## R08 (P3) — §1.0c misdescribes two pinned declarations

**Location:** `README.md:309–313`: "the admissible families `TauCeti.IsAdmissiblePerturbation f h` (finitely many C² functions …) … with its jointly C^(n+1) perturbed flow".

**Claim:** The predicate is on one function, not a family; n is not defined in the section (the data are C^r).

**Witness:** `structure IsAdmissiblePerturbation (f h : E → ℝ) : Prop` (`Perturbation.lean:84`); `contDiff_perturbedFlow_of_contDiff (n : ℕ) (hfs : ContDiff ℝ (n + 2) f)` gives C^(n+1) (`Perturbation.lean:474`).

**Repair:** "finite families `h : ι → E → ℝ` with `TauCeti.IsAdmissiblePerturbation f (h i)` for each i (C², compact support, support disjoint from the critical set), the perturbed function `TauCeti.perturb f h s = f + Σᵢ sᵢhᵢ` with its perturbed flow, jointly C^(r−1) for C^r data (`TauCeti.contDiff_perturbedFlow_of_contDiff`)".

## R09 (P3) — §3.3 states the index theorem with no locator

**Location:** `README.md:2226–2227`: "The operator `∂s−A(s)` on `W¹,²(ℝ;H)∩L²(ℝ;D)` is Fredholm with index `−SF(A)`".

**Claim:** The section (2212–2253) has no locator; References name Robbin–Salamon for F1.3 without a theorem number.

**Witness:** hutchings-morse lines 869–871 (Principle 5.6, p. 27) states `ind(∂_s − A_s) = −SF{A_s}` with this sign and refers to Robbin–Salamon for the precise statement.

**Repair:** Add at the claim "(Robbin–Salamon, *The spectral flow and the Maslov index*, Bull. LMS 27 (1995), the index theorem for `d/dt − A(t)`, with its theorem number; Hutchings, Principle 5.6, p. 27, for the sign)".

## R10 (P3) — the Layer 4 header says the layer follows a source

**Location:** `README.md:2493–2495`: "McDuff–Salamon (*J-holomorphic Curves and Symplectic Topology*, 2nd ed.) as spine, with boundary versions from Oh, and with Floer–Hofer–Salamon's cylinder transversality adapted to strips:"

**Claim:** A roadmap does not say it follows a source. The arrangement itself is the roadmap's own (§4.2, 4.3, 4.4, 4.5 use MS Ch. 2, 4, 3, 10, out of the book's order, and 4.1, 4.6a–h, 4.7 have no counterpart run), so only the sentence needs changing.

**Witness:** The principle "a roadmap does not say it follows a source"; the pairs §4.2 ↔ Ch. 2, §4.3 ↔ Ch. 4, §4.4 ↔ Ch. 3, §4.5 ↔ Ch. 10.

**Repair:** "This layer builds the symplectic and almost-complex foundations, the local theory, fixed-domain compactness, transversality and gluing for discs, strips and spheres, with totally real boundary; the sources are cited at each target."

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| M.0c single pair, regularity (new) | d=ind p−ind q = 2, 1, 0, −1 | Universal space is C^(r−1) (pin: C^(n+2) data → C^(n+1) flow; C^(n+1) f → C^n charts). Sard needs r−1 > max(d−1,0): r ≥ 3, 2, 2, 2; README gives 4, 3, 2, 2 | threshold sufficient; R02 on supports |
| M.0c single pair, fibre dimension | dim parameter N, C of dim ind p−1, W^s(q) of codimension ind q | N+(ind p−1)−ind q − N = ind p−ind q−1 | agrees with README |
| M.0c all pairs / corollary (new) | finite critical set; the R01 witness | finite: slabs below each value, r ≥ dim E+2 ≥ max d+2; witness: connection in a ball outside the supports has both tangent cones equal to the flow line, span 1 ≠ 2 | false as stated: R01 |
| M.0c Checks | x²−y²; two saddles in ℝ²; ind 0→1; infinite-dimensional E | −∇f=(−2x,2y), axes span ℝ²; 1+1−1 = 1 < 2 when both contain the flow line; max(−1,0)+2 = 2; `HasCompactSupport.eq_zero_or_finiteDimensional` at `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:721` | correct |
| 1.2 (M.2) | 2→1→0; 3→2→1→0 | 0+0 with one gluing coordinate, unbroken 2−0−1 = 1; two coordinates, 3−0−1 = 2 | Checks correct; wehrheim2012 Thm 2.3, 2.6, Cor 2.9 support the Euclidean-near-critical case only, as stated |
| 1.4 (M.4) | quartic model; truncated cube | x'=x(1−x²), rates 1 at 0 and 2 at ±1 (1−3x²=−2); u'=(1−x²)+x²=1; 48−72+26 = 2; six faces only: −18 | correct; boundary sign exponent ind+ind+1 as hutchings-morse Prop 3.2 |
| 1.8 (M.8) | two-cap sphere; point fibre; SU(3) | d₂:(2,0)→(0,1), (a,b)↦a+b: kernel ℤ, cokernel 0, so H=ℤ,0,ℤ; value filtration puts it at (1,1)→(0,1); entries (0,0),(0,3),(5,0),(5,3): d₅ from (5,0) lands in (0,4)=0 | correct |
| 1.9 (M.9) | |x|=1; ℝP² | ∂²(x⊗y) = a⊗b − a⊗b = 0; H₂(ℝP²;ℤ)=0, H⁰=ℤ | correct |
| 2.2 (F0.0), `sharp_sardSmale` | id on ℝ; t↦(t,0); 0:ℝ³→ℝ | indices 0, −1, 2; thresholds k ≥ 1, 1, 3; `0<k` plus `ker−coker<k` is k>max(i,0) | Lean = README |
| 2.9 (F0.7) | circle λ=2 to point λ=0; matching map on ℝ | 2−0+1−1 = 2 (banyaga-hurtubise line 377 formula); (v,w)↦v−w rank 1, kernel 1 | correct |
| 3.3 (F1.3) | A=tanh, −tanh, 1 | (∂−tanh)cosh=0, cosh∉L²; (−∂−tanh)sech=0, ∫sech²=2: index −1, SF=+1; reversed: index +1; A=1: 0 | sign as hutchings-morse Principle 5.6; R09 on the locator |
| 4.3 (F2.3) | L=ℝ⊂ℂ; u=1/z | β=−y dx, dβ=dx∧dy, |β|=|y|; ∫r⁻⁴·r dr diverges at 0 | correct |
| 4.4 (F2.4) | z↦z² on the sphere; constant map | two preimages of a generic point; du=0 kills the J-variation term | Checks correct; sources uncertified |
| 5.2 (F3) | T*S¹; circle y=c | two generators, two cancelling strips, rank 2; period 2πc≠0 | correct; auroux-fukaya Thm 1.5, Prop 1.13 state the invariance and HF(L,L)≅H*(L) under [ω]·π₂(M,L)=0 |
| 6.3 (F4.C) | S¹×S² with two bigons; parallel curves; L(p,q) | D₁−D₂ has coefficients ±1; annulus has +1 only; H₂=0 gives no periodic domain | matches os-disks-invariants lines 1553–1559 (Def. 4.10) |
| 7.1 (F5.1) | genus-one bigon; constant class | e=1−2/4=1/2, n_x=n_y=1/4, μ=1; g−χ+2e = 1−1+1 = 1 and χ = 1−1/4−1/4+1/2 = 1; constant: 1−1+0 = 0 | matches lipshitz-erratum lines 26, 156, 162 |
| 7.3 (F5.3) | bigon; trivial strip; two index-one pieces | 1, 0; 1+1 = 2, minus one translation = 1 | correct; Prop 13.2's cover is g!-fold (lipshitz-cylindrical line 3995), the README's degree-g cover is its quotient |
| 7.4 (F5.4) | A(4,2), A(3,1), A(3,2), A(2,2), torus algebra | inversions 1+1 against 0 in the composite: product 0; 0+0=0: nonzero; d(1↦3,2↦2)=(1↦2,2↦3); only the identity; 2+6 = 8 basis elements, ρ₂ρ₁=0 | correct |
| 7.6 (F5.6) | right-handed trefoil; unknot; 2×2 grid | (A,M) = (1,0),(0,−1),(−1,−2): Σ(−1)^M t^A = t−1+t⁻¹; rank 1; 2 = 1·2^(2−1) | matches os-knots line 373, mos-grid lines 220–225 |
| `sharp_sard` | E=F=0; const ℝ³→ℝ | 0−0<k forces k≥1; 3−1 = 2 < 3 passes, 2<2 fails | sound; pin has only k ≥ (dim E)²+1 (`Sard/OutermostStratum.lean:347`) |
| `exists_darbouxChart`, `exists_standardDarbouxChart` | ω=e^x dx∧dy on ℝ² | chart (e^x−1,y): d(e^x−1)∧dy = e^x dx∧dy | sound; R05 on the route |
| `sphereAut_existsUnique_map_triple` | probe | closes with the pinned theorem | R03 |
| `nonsqueezing` | f=id; f=2z | id: ‖x₀‖<R on the r-ball forces r≤R; 2z: Im⟪2v,2w⟫ = 4 Im⟪v,w⟫ ≠ | sound |
| `exists_nonconstant_holomorphic_disc_in_component` | L=S¹⊂ℂ, n=1; L=ℝ | u(z)=z; ℝ is excluded by `CompactSpace L` | sound |

- Source locators checked against the text: 44, in 12 sources (os-disks-invariants 7, hutchings-morse 8, wehrheim2012 4, lot-bordered 4, lipshitz-cylindrical 5, lipshitz-erratum 2, zinger-det 3, banyaga-hurtubise 3, auroux-fukaya 3, zhou-mb 2, os-knots 2, mos-grid 1); all agree with the README's theorem numbers and pages. Lipshitz's arXiv v2 carries the journal's page base (955), so pp. 1058–1059 are its pages 104–105; Zhou was read at v4.
- Library declarations opened at the pin: 14 (`MorseSmale/Basic.lean:63, 106`; `Perturbation.lean:84, 93, 160, 288, 305, 448, 474`; `Surjective.lean:178, 239`; `GlobalChart.lean:184, 217`; `Sard/OutermostStratum.lean:347`; `Fredholm/SardSmale.lean:409`; `Darboux/Basic.lean:116`; `MultipleTransitivity.lean:175`; Mathlib `FiniteDimension.lean:721`).
- Cross-roadmap citations: the worker's resolver found none unresolved; the scope statements of DGFloer, FukayaTheory, AnalyticStableMaps, PseudoholomorphicCurveAnalysis and MorseNovikov about HeegaardFloer were read on main and, for DGFloer and MorseNovikov, at their open heads.
- Gate: FAIL on `dropped=3` only (R04); every other scanner 0, targeted build passes. No change outside the folder.
- Dependency check: `depcheck: 239 roadmaps, 2530 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: seven `declaration uses sorry` warnings (lines 71, 84, 116, 127, 151, 168, 191), nothing else. The seven elaborated signatures were compared with the README statements: no binder lost. One-tactic probe: 6 of 7 stay open, 1 closes (R03).
- Pull request text: the title and description agree with the diff (one new subsection, one sentence in "How to read the build", no Lean change), except "consumes only existing Tau Ceti modules and F0.S", which R07's repair makes true.
- Overlap check: read DGFloer, MorseNovikov, GeometricTopology (open, by search), FukayaTheory, AnalyticStableMaps, PseudoholomorphicCurveAnalysis; nothing shared. No other roadmap, open or on main, states Morse–Smale genericity by function perturbation; FukayaTheory and MorseNovikov cite Lane M and F0.4 as consumers.

Source independence: 16 passages compared with 12 sources, none shared (the admissibility definitions of §6.3 are forced by the mathematics); largest share Ozsváth–Szabó, about 20 of 110 citations, most of them os-disks-invariants; contents compared with os-disks-invariants §§2–10: independent (Layer 6 puts admissibility before the analysis and adds the multipointed and cylindrical bridges). R10 concerns one sentence, not the arrangement.

Research link: Layers 6–8 state results of Ozsváth–Szabó (2001–2004), Lipshitz (2006), Lipshitz–Ozsváth–Thurston (2008) and Manolescu–Ozsváth–Sarkar (2006); M.0c supplies the Morse–Smale hypothesis of the trajectory-space theory in the sense of Smale (1961). Rests on the README's References and the sources read.

## Not verifiable

- Smale, Amer. J. Math. 87 (1965), Theorem (1.3), pp. 862–863 (§2.2): the DOI resolves to JSTOR only; no legal copy found.
- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, Chapters 3–4 (§4.3, §4.4), and Lee, Theorem 6.24 (§4.3): books, no legal copy; cited by locator.
- Floer–Hofer–Salamon 1995 and Oh 1996 (§4.4): settled as uncertified in the manifest.
- Robbin–Salamon 1995 (§3.3): the author's page returned HTTP 403; the sign was checked against Hutchings instead.
- Audin–Damian and Smale 1961, the candidates for §1.0c's locator (R06): not read.

## Source issues

- none

## For the human reviewers

- Licence: `README.md:2631–2632` cites the repository `t4v1/damian_formalizare`, file `MorseFloer/Part2/Darboux.lean`, "as existing work"; its licence was not read, and the Darboux declarations of `Suggested.lean` were not compared with that file.
- Licence: Hutchings' lecture notes (cited in §§1.1–1.9, 3.3) are unpublished notes read from the author's Berkeley page.

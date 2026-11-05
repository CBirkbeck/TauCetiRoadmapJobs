# Review of AnalyticStableMaps (pull request #987 at 9045e48)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/AnalyticStableMaps/README.md` (300 lines), `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` (60 lines), `metadata.toml`. The pull request changes nothing outside the folder. The gate at this head fails (blob ×2, imports, mathlib-subimports ×4, no-import-mathlib); the targeted build passes and the dependency check reports no problem.

## R01 (P1) — HeegaardFloer items cited exist only at a revision pull request, not on main

Location: `README.md` line 12 ("HeegaardFloer, Lane F F1.1–F1.2, F1.4–F1.5 and F2.1–F2.3 ... F0 and F2.4 ... F2.6d"), line 37 ("Consume only HF F2.2a–c and F2.3", linked to commit `0ea0ff8`), line 23 ("HF F1.1–F1.2's ... F1.4–F1.5 determinant/index, and F2.1–F2.3's tame-J family"), lines 61, 63–66, 70, 72, 78, 82 (F0.5, F2.6a, F2.6b, F2.6c, F2.6d, F0's finite-C^ℓ interfaces), line 32 ("Preserve HF's CZ=−mu_RS convention").

Claim: these HeegaardFloer items supply the bundle Sobolev adapters, the determinant-line and closed index package, the fixed-domain completion comparison, the coincident-branch accumulation lemma, puncture removal, the sphere models and the CZ sign convention.

Witness: HeegaardFloer on main (`TauCetiRoadmap/HeegaardFloer/README.md`, 344 lines) has lane headings F0–F5 only; Lane F1 has items 1–3, Lane F2 items 1–5, Lane F0 no numbered items. No "F0.5", "F1.4", "F1.5", "F2.2a", "F2.2c", "F2.6a"–"F2.6d" and no `μ_RS` occur on main (grep count 0 for each). They occur only at the head of pull request #957 (`rev/957`, e.g. F2.6a–d at lines 2025–2170, CZ=−μ_RS at line 1740). Commit `0ea0ff8` is not an ancestor of main. Main's Lane F2 item 3 says explicitly "No Deligne–Mumford, no varying-domain stable maps: fixed genus-zero domains only".

A pull request that revises an existing roadmap is never a dependency: HeegaardFloer is cited as it stands on main. Every one of these citations is supplier drift.

Repair: cite HeegaardFloer by what main states (Lane F1 items 1–3: W^{k,p} of surfaces, Calderón–Zygmund and bootstrapping, linear CR operators as Fredholm operators and Riemann–Roch with boundary; Lane F2 item 2: unique continuation, critical points, somewhere injectivity; item 3: removal of singularities; item 4: universal moduli spaces and Sard–Smale), and state here as targets, in an early layer of this roadmap, everything the README currently takes from the revision only: the determinant-line functor with the closed-surface index and complex orientation, the fixed-domain regularity-loss/completion comparison, the coincident-branch accumulation lemma, the finite-C^ℓ parameter-space interfaces, the fixed sphere model and the CZ=−μ_RS convention with its two-term witness. Record the move in the scope section. Do not link a commit (see R05).

## R02 (P1) — HeegaardFloer and this roadmap cite each other

Location: `README.md` line 49 ("HF F2.6b consumes this general construction and proves its sphere-normalization ... application"), line 12 ("M2 constructs the all-genus ... APPLICATION comparisons"), and the M0.1 inputs at line 37.

Claim: HeegaardFloer (earlier in the order, on main) supplies M0.1's local inputs, and HeegaardFloer's sphere application consumes M0.1.

Witness: `rev/957/TauCetiRoadmap/HeegaardFloer/README.md` line 1988 ("Construct the closed-source simple/somewhere-injective comparison in AnalyticStableMaps M0.1 from this local floor; F2.6b is its sphere application"), line 2092 ("Consume AnalyticStableMaps M0.1's arbitrary-genus nonconstant closed-curve factorization"), line 2954 ("Consume the closed-source interfaces specified by AnalyticStableMaps M0–M3"). This README consumes HF F2.2a–c and F2.3 for the same construction. Two roadmaps' layers cite each other; the merge order cannot place both.

Repair: one owner, chosen by direction of supply. HeegaardFloer precedes this roadmap, so either the generic coincident-germ normalization (M0.1 up to "Factor surface and simple map") moves into HeegaardFloer Lane F2 next to its local floors and this README imports it by section, or this roadmap keeps M0.1 built from inputs available on main (after R01) and deletes every sentence that makes HeegaardFloer a consumer of M0–M3 (line 49 and the "APPLICATION" clause at line 12); HeegaardFloer's own text is then its author's to repair. In either case M0.1 must not both consume HF F2.2/F2.3 and be consumed by HF F2.6b.

## R03 (P2) — Suggested.lean states no headline theorem; every declaration is a stand-in or padding

Location: `Suggested.lean` lines 6–13 (docstring), 23–31 (`nodeDifference`, `matchedSections`), 35–53 (three theorems), 56–58 (`expectedDimension`); `README.md` line 5 ("`Suggested.lean` gives fixed-normalization node-matching interfaces and an integer dimension formula").

Claim: the file is the roadmap's acceptance test.

Witness: the file contains no `sorry` and no theorem about any object of the roadmap. On a scratch copy elaborated at the pins: `mem_matchedSections` closes with one tactic (`simp [matchedSections, LinearMap.mem_ker, funext_iff, sub_eq_zero]`), `isClosed_matchedSections` is the single library lemma `ContinuousLinearMap.isClosed_ker`, `nodeDifference_apply` is `rfl`, and `expectedDimension` is arithmetic on four integers. `matchedSections` on an arbitrary compact `S` with `left a = right a` imposes no condition at all (a self-node with equal flags is junk the real carrier excludes). The docstring names no headline theorem and says nothing about what is not statable at the pins. The roadmap's headline theorems (M0.1 normalization through a simple curve, M1 finite automorphisms iff constant components stable, M2.1 generic-J smooth-simple manifold of dimension d₀, M3 all-genus Gromov compactness and second countability, M7 topological regularity (Pardon Thm B.1.1), M9 the V1 axioms) are not statable at the pins: Tau Ceti has `SmoothAlmostComplexStructure` only with `constSmooth` and `neg` as constructors (`TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean` lines 67, 158, 230), so a compact Riemann surface carries no almost complex structure as a domain, and there are no nodal-curve, prestable-family, bundle-Sobolev or product almost-complex carriers. The present file forces the node-matching subspace and the virtual dimension v through free stand-ins instead of saying so.

Repair: delete all six declarations; replace the docstring by the form "Analytic stable maps: target signatures", stating that README.md is the roadmap, that this file states the headline theorems against the pinned APIs, and listing each headline above with the carrier it lacks (the almost complex structure of a complex one-manifold; nodal curves and prestable families from ComplexCurveModuli; bundle-valued W^{k,p} spaces; product almost complex structures for M2.5e/M2.6). Replace the four import lines by `import Mathlib` (tested: the file elaborates with that header). Rewrite README line 5 accordingly. The matching-subspace description and the v formula stay in the README as targets with Checks (R06).

## R04 (P3) — Gate: imports

Location: `Suggested.lean` lines 1–4.

Witness: gate rules `imports`, `mathlib-subimports` (×4), `no-import-mathlib`. Repair: the single line `import Mathlib` (elaborated on a scratch copy with that header: no errors, no warnings). Subsumed by R03 if the declarations are deleted.

## R05 (P3) — Gate: links pinned to commits

Location: `README.md` line 37 (HeegaardFloer at `blob/0ea0ff8…`), line 45 (FuchsianOrbifolds at `blob/350e970…#layer-5-…`).

Witness: gate rule `blob`. Repair: `../HeegaardFloer/README.md` by lane and item (after R01) and `../FuchsianOrbifolds/README.md#layer-5-compact-surface-degree-theory-and-fuchsian-applications` (that heading exists on main at line 311).

## R06 (P3) — README is not in TauCetiRoadmap form: no Checks, no Needs lines, almost no locators

Location: whole `README.md`.

Witness: headings are `## M0.`–`## M13.`, `## Scope and single owners`, `## Construction order and required tests`; there is no `# Roadmap:` title with a `**Summary.**`, no `## Conventions`, no `## Exact supplier contracts`, no `## How to read the build`, no `## Layer k`/`### k.n`, no `### Examples`/`### Dependencies`, no `## Downstream consumers`. Grep counts: `*Needs:*` 0, `**Checks.**` 0. The only locators in the body are McDuff–Salamon Prop. 2.5.1 (line 45) and Pardon's section labels (M4–M8); every other target (the M1 stability theorem, the M2.0a index, the M2.1 manifold theorem, the M3 compactness theorem, the M3 combinatorial bound, M3.1, M2.6) has none, and the References list gives no pages for Wendl, Robbin–Salamon or Robbin–Ruan–Salamon. The "required tests" paragraph (line 291) is one run-on list of phrases, not per-definition Checks. Each definition (prestable map and its groupoid, map-stability, the node-matching subspace, the Hausdorff-graph topology, the thickening datum, the weighted norms, X_I^reg, the virtual orientation line, the anchor adapter) needs its API as prose bullets and at least three discriminating Checks; many are already present as prose asides ("a nonzero constant map refutes an order-0 decay statement", "the constant class to (0,2) has no stable target", the ℝ²×S² spheres, the conic degeneration, the double cover of the unmarked sphere) and only need to be placed as Checks under their definitions.

Repair: recast M0–M13 as Layers 0–13 with `### k.n` prose subsections, a `*Needs:*` line per target naming the Mathlib/Tau Ceti declarations, this roadmap's earlier targets and supplier sections, `**Checks.**` bullets per definition, `### Examples`/`### Dependencies` per layer, and the four front-matter sections; give each theorem its locator (Wendl Def. 4.2 and §4.3 for d_r and the fixed-domain IFT; IS Thm 1.1 and Thm 4.2(a)–(g) for M3; Pardon Def. 9.2.1 for the 6-tuple, Prop. 9.2.6 and Thm B.1.1 for M7, B.4 for weights, Lemma B.11.2 for the decay, B.13 for orientations; McDuff–Salamon Ch. 4 lemmas by number for ε-regularity and monotonicity).

## R07 (P3) — README and Lean names disagree

Location: `README.md` lines 63 (`simpleSmoothLocalizedUniversalSurjectivity`), 67 (`simpleSmoothStratumGenericJComparison`), 83 (`simpleMarkedUniversalEvaluationComparison`); `Suggested.lean` names `nodeDifference`, `matchedSections`, `expectedDimension`.

Witness: none of the three backticked README names is declared in `Suggested.lean`; none of the three Lean names occurs in the README (grep count 0 each way). A backticked name of this roadmap's own is a claim that the Lean file declares it.

Repair: write the three README targets in prose without backticks (they are theorems, not declarations); after R03 no Lean name remains to list.

## R08 (P3) — Degree theory already at the pin is cited only through a roadmap

Location: `README.md` line 45 ("Consume FuchsianOrbifolds Layer 5's independent compact-Riemann-surface degree theory for fibre-independent local degree, the degree-one biholomorphism and Riemann–Hurwitz").

Witness: at the pinned Tau Ceti, `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean` has `FiniteHolomorphicMap`, `localMultiplicity`, `degree` (line 120), `fiberMultiplicitySum_eq_degree` (line 246), `degree_comp_of_forall_not_eventuallyConst` (line 288), `biholomorphOfDegreeEqOne` (line 442); `Ramification.lean` has `ramificationDegree` (line 76) and `degree_ramificationDivisor` (line 152). No Riemann–Hurwitz theorem is at the pin (grep `riemannHurwitz`: none).

Repair: a `From Tau Ceti` contract naming these declarations and files; consume FuchsianOrbifolds Layer 5 item 3 only for the Euler-characteristic/Riemann–Hurwitz formula.

## R09 (P3) — The constant-mode convention is presented as Pardon's

Location: `README.md` line 233 ("Define the exact weighted norms on ends/necks, using the normalized circle average for the constant Fourier mode (not an unnormalized integral)"), after "Own Pardon B2–B8 as concrete analysis".

Witness: Pardon B.4 (pardon13 lines 6430–6441, p. 143) takes the constant mode to be the value ξ(n) at the node in the fixed trivialization, not a circle average, with the weighted integral over the end measuring ξ(s,t)−ξ(n).

Repair: state the circle-average choice as this roadmap's own convention and add the comparison with Pardon's node-value norm (equivalent norms on each fixed end; uniformity as the gluing parameter tends to 0 is what M6 must prove) as a Check.

## Verified sound

**Gate and build.** Gate output as given by the worker: `set_option=0 blob=2 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=4 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`. `lake env lean` on `Suggested.lean`: no output (no `sorry`, no warning). Dependency check: `depcheck: 206 roadmaps, 1412 edges, 0 problem(s)` (no UPWARD or CYCLE line; the HF edge of R02 is invisible to it because HeegaardFloer on main does not cite this roadmap). `git diff --stat origin/main...HEAD` outside the folder: empty. Elaborated signatures (6 declarations) compared with the README: no section binder lost; `expectedDimension : ℕ → ℕ → ℕ → ℤ → ℤ` casts before subtracting, so no natural-number junk.

**Ownership.** `roadmaps grep` for "stable maps" and "Gromov compactness" across main and 438 open heads: the only other hits are algebraic (StableReduction) or stable-homotopy (GeneralizedCohomology) uses and the genus-zero disc/strip statements of HeegaardFloer and CombinatorialHeegaardFloer. GromovWittenTheory at `rev/990` (lines 40, 229–248) lists AnalyticStableMaps as the supplier of the carrier, compactness, evaluation/stabilization and M11–M13 maps and builds none of them. ImplicitAtlases at `rev/974` line 25 states that it constructs no nodal domains, stable maps, obstruction spaces or gluing. This roadmap is the owner of analytic stable maps; ownership against open pull requests whose files the brief did not give was not checked.

**Supplier citations resolved** (on main unless stated): ComplexCurveModuli D0 items 1, 3, 5; D3 item 5; D4; D5; D6 item 1 with `roundAnnulusNormalization`, `annulusModulusFamilyComparison`, `protectedCollarAnnulusInterpolation`, `nodalAnnulusBranchLimit` (lines 141–145); D6 item 4 `unorderedAuxiliaryActionChart` (line 179); D7 item 1 `forgetAuxiliarySet` (lines 200, 206); D8 (line 215). ImplicitAtlases V0–V7 at `rev/974` (Layers 0–7, §5.2–5.3 at lines 598, 613, Layer 7 at 766). TopologicalSheafCohomology TS0–TS5 at `rev/973`. ComplexKahlerGeometry K1 (line 96), K5 (568), K7 (1405). DifferentialGeometry 8.3–8.5 (lines 836–852). CharacteristicClasses C3 (line 720). Orbifolds O1–O5 (lines 87–672). MorseNovikov N1 (line 75; anchor matches). GeometricTopology smoothing-and-triangulation item 1 (line 930; a "far horizon" section whose item 1 is nonetheless a named target). FuchsianOrbifolds Layer 5 (line 311). PDE Lanes A–B. HeegaardFloer Lanes F0, F1 items 1–3, F2 items 1–5 exist on main; the finer items do not (R01).

**Pinned library declarations opened.** `TauCeti.SmoothAlmostComplexStructure` (`Geometry/Symplectic/Manifold/AlmostComplex.lean` line 67), `SmoothTwoForm.IsSymplectic` (`TwoForm.lean` line 92), `SmoothTwoForm.Tames` (line 114), `IsPseudoholomorphicAt`/`IsPseudoholomorphic` (`JHolomorphic.lean` lines 91, 103: a `HasMFDerivAt` witness intertwining j and J, hence no regularity beyond differentiability at each point, exactly as README M0 says), `stdComplexLineEnergyDensity`/`stdComplexLineEnergy` (`Energy.lean` lines 118, 373), `Wkp` modules (`Analysis/Sobolev/Wkp/*`), Fredholm/index files (`Algebra/Module/LinearMap/Index.lean`, `Analysis/Normed/Operator/ClosedRange.lean`), and the Riemann-surface degree files of R08.

**Sources read at their locators.** pardon13 (arXiv:1309.2370): Def. 9.2.1 (line 4142, p. 98) is the 6-tuple with D_α a compact embedded codimension-two submanifold with boundary, r_α ≥ 0 with 2g+n+r_α > 2, finite Γ_α possibly ineffective, E_α a finitely generated ℝ[Γ_α]-module, λ_α supported away from nodes and marks: M5 restates it correctly, including empty D_α when the domain is stable. Prop. 9.2.6 (line 4269): openness of the regular locus, local product projection to E_{J∖I}, orientation local system from o_{E_I}: M7/M9 restate it as a topological statement, correctly. Thm B.1.1 (line 6182, p. 138): dimension dim M_{g,n+ℓ} + (1−g)dim X + 2⟨c₁,β⟩ + dim E − 2ℓ, which equals v + dim E (row 13 below). B.4 (lines 6405–6444): k ≥ 6, δ ∈ (0,1), ends z = e^{s+it} so t has period 2π and the gap is 1; constant mode ξ(n) (R09). Lemma B.11.2 (line 7203): exponential decay with rate µ < 1 for the derivative du, as M7 says. B.13 (lines 7376–7396): orientation identification on smooth-domain points, extended across the codimension-two nodal locus, as M8 says. is99 (arXiv:math/9903047): Thm 1.1 (line 299) hypotheses a)–c) (continuous J_n converging uniformly on a set containing the images, area bound, nondegeneration near the boundary); Remark 2 (line 314) handles marks by attaching constant discs, as M3 says; Def. 1.11 (line 401) "non-exceptional", which M3 correctly keeps separate from its own terminology; Thm 4.2 (lines 1330–1347) conditions (a)–(g) match the seven covering conditions listed in M3 one for one. wendl10 (arXiv:1011.1690): ∂̄_J u = Tu + J∘Tu∘j (line 1927), unhalved, so M0's factor 2 is right; Def. 4.2 (lines 5081–5088) vir-dim = (n−3)(2−2g) + 2c₁(A) + 2m, equal to d_r; §4.2 "Classification of pointed Riemann surfaces" (line 5326) with Teichmüller slices (Def. 4.29, line 5512) and §4.3 "Fredholm regularity and the implicit function theorem" (line 5786), matching the citation "§§4.2–4.3". rs06 (arXiv:math/0407158) fetched; the README cites it without a locator, so nothing was checked against it.

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| v = 2((m−3)(1−g)+c₁+n) (M0) | (m,g,n,c₁)=(3,0,0,0); (1,0,3,2); (2,1,0,0); (0,0,2,0) | 0; 2(−2+2+3)=6 = 6 (PGL₂)+6 (marks)−6 (Aut); 0; −2 | matches degree-1 maps to ℂP¹ with 3 marks, elliptic curves in a K3, and the empty (0,2) constant space | none |
| d_r = (m−3)(2−2g)+2c₁+2r (M2.0a) vs v | n=r | d_r − v(n=r) = 0 | consistent | none |
| a_g, t_g and fixed-j index m(2−2g)+2c₁−a_g (M2.0a, M2.1a) | g=0,1,2 | (a,t)=(6,0),(2,2),(0,6); fixed-j index + t_g − d₀ = 0 in all three | consistent | none |
| Riemann–Hurwitz and D(u)=dD(v)−(m−3)R (M0.1) | genus-1 double cover of a line in ℂP² (d=2,g₀=0,R=4,m=2) | 2g−2 = 2(−2)+4 = 0 so g=1; D(v)=−2+6=4, D(u)=0+12=12, dD(v)−(m−3)R = 8+4 = 12 | identity holds | none |
| Ghost and edge bounds (M3) | (g,n,a)=(0,0,1); (0,4,0) | #ghost ≤ 0, #edges ≤ 0; #ghost ≤ 2, #edges ≤ 1 | matches a lone sphere and the two-ghost boundary of M̄₀,₄ | none |
| Whole-tree flag count V_orig+2 (M3) | V_orig=1, V_ins=2 | 3+4−2·2 = 3 > 2 | such a tree cannot contract | none |
| Σ_v(2g_v−2+val_v)=2g−2+n (M3) | two genus-0 vertices, one edge, marks 2+2 | g = 0+1−2+1 = 0; val = 3 each; (−2+3)+(−2+3) = 2 = 2·0−2+4 | holds | none |
| Node-matching codimension 2m per node (M2) | S two points, E=ℝ², one node (left 0 = point 0, right 0 = point 1); same with left=right | {u : u₀=u₁}, codim 2; nodeDifference = 0, matchedSections = ⊤ | README right; the Lean stand-in admits a junk self-node | R03 |
| Spheres {a}×S² in ℝ²×S² (M2.5e) | m=2, g=0, c₁=2 | d₀ = −2+4 = 2 = dim ℝ²; normal ∂̄ on trivial line: ker ℂ, coker 0; tangent O(2): ker ℂ³, coker 0; 8−6 = 2 | regular, escaping | none |
| Product class rigidity (M2.6) | (g,n)=(1,2); (0,3); (g,1) | expected (n−1)(2−2g) = 0, actual 2n−2 = 2, coker g(n−1) = 1 complex = 2 real; 4 = 4; 0 = 0 | consistent in all three | none |
| ⟨c₁(T(Σ×F)),A⟩ = 2−2g (M2.6) | A=[Σ×{p}] | c₁(TΣ)[Σ] + c₁(TF)·pr₂*A = 2−2g + 0 | holds | none |
| Conic degeneration (M3.1) | [s:t]↦[s²:εt²:st]; z=s/t; z=εw | XY = εs²t² = εZ²; [z:ε/z:1]→[z:0:1]; [εw²:1:w]→[0:1:w]; zv=ε with v=1/w; areas 2L = L+L | holds | none |
| Finite Aut ⇔ constant components stable (M1) | z↦z² on unmarked ℂP¹; constant unmarked torus; constant sphere with 3 marks | Aut = {±1}, order 2; Aut ⊇ T², infinite; Aut trivial | both directions witnessed | none |
| Pardon Thm B.1.1 dimension = v + dim E (M4) | general | (6g−6+2n+2ℓ) + 2m(1−g) + 2c₁ + dim E − 2ℓ = 2[(m−3)(1−g)+c₁+n] + dim E | identity | none |
| Weights: period 2π, gap 1, δ∈(0,1), decay on du (M4, M7) | Pardon lines 6268, 6405, 7203, 7215 | z=e^{s+it}; Fourier e^{ikt}; µ<1; W^{1,2} norm of du | README conventions match | none |
| Koszul factor (−1)^{dimP·codimQ} (M2.4a) | dimP=1, codimQ=1 | sign −1 | correct for swapping two odd lines | none |
| ½-normalised ∂̄ vs Wendl (M0) | Wendl line 1927 | Tu + J∘Tu∘j = 2·(du+J du j)/2 | factor 2 as stated | none |
| Compatible-J tangent space (M2.0b) | ℂ, J=i, ω=dx∧dy, Y=(x,y)↦(x,−y) | YJ+JY = (−y,−x)+(y,x) = 0; ω(v,Yw) = −1 = ω(w,Yv) for v=(1,0), w=(0,1) | Y is tangent, both conditions as written | none |
| IS 4.2(a)–(g) vs M3 list | seven items | disc/annulus/pants; boundary annulus; n-independent structures; annular overlaps; one contracting circle per node; radii in (1,∞]; agreement on sub-annuli | one-to-one | none |
| Padding probe (Suggested.lean) | three theorems, one def | `simp [...]` closes `mem_matchedSections`; `isClosed_ker` closes `isClosed_matchedSections`; `rfl` closes `nodeDifference_apply`; `expectedDimension 3 0 0 0 = 0` by `rfl` | all padding | R03 |

**Mathematics of the plan found correct.** The M0.1 route (finite critical set, B = u⁻¹(u(Crit u)), coincident-germ relation Γ₀, closure Γ, branch-product charts, factor surface, somewhere injectivity of v) is the standard McDuff–Salamon construction; the exceptional-point energy and removal argument and the countability statement are the right shape. M1's incidence-disc stabilization argument is sound and correctly avoids a free-action claim. M3's Lindelöf + sequential compactness ⇒ compactness upgrade, the zero-area case, and the anchor adapter are correct. M5–M9 restate Pardon §9.2 and Appendix B at the right generality (topological regularity only, E′-regular locus, freeness of the extra group only, codimension-two extension of orientations). M2.5's declared limitation (no global compactness for noncompact targets) is witnessed by the ℝ²×S² family.

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed., Prop. 2.5.1 and Chapters 4–5: the DOI 10.1090/coll/052 resolves only to the AMS bookstore; the sources service found no open copy. Cited by locator alone.
- Robbin–Ruan–Salamon, *The moduli space of regular stable maps*: the service resolved the title only to a paywalled Springer page (recorded `uncertified`); no arXiv copy was found. The README gives it no locator in any case.
- Robbin–Salamon's corrigendum to *A construction of the Deligne–Mumford orbifold*: not fetched; the README cites it without a locator.
- Ownership against open pull requests whose files this brief did not provide was not checked.

## Source issues

- none

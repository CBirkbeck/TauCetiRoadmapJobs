# Review of HeegaardFloer (pull request #957 at 523d562)

**Verdict:** needs changes

The seven previous findings were reconsidered against this head before the full review. No repair report marking a finding “not actionable in this package” was supplied or found.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01, reciprocal suppliers | README:2092, “Consume … AnalyticStableMaps M0.1”; :810, “Consume DGFloer1.3”; :1529, “MorseNovikov N5's early” | Not repaired. An independent early section does not remove a reciprocal roadmap dependency; see R02 below. The previous additional GeometricCurrents route is not repeated: its present G3 has its own comparison route. |
| R02, absent sharp Sard supplier | README:1035, “F0.S Sharp finite-dimensional Sard”; Suggested.lean:69, `sharp_sard` | Repaired. HF now owns the sharper theorem, distinguishes the quadratic pinned bound, and states both sharp signatures. |
| R03, duplicate smooth-section topology | README:1363, “use ComplexKahlerGeometry K5a's smooth-section Fréchet space” | Repaired. HF retains the finite-jet comparison and the boundary/corner extension, rather than rebuilding the boundaryless carrier. |
| R04, absent nonsqueezing | Suggested.lean:166, `nonsqueezing`; module docstring:16–52 names missing carriers | Repaired. The native ball/cylinder statement is present, and the missing geometric headlines are individually accounted for. |
| R05, padding/imports | TorusBottShearTargets.lean:30, `shear_intertwines`; NonorientableBottModuliTargets.lean:28, `normalMonodromy_calibration` | Partly repaired. Suggested.lean was cleaned, but all five calibration companions remain; R04 below. |
| R06, locators | README:276, “Theorem 3.1 and Proposition 3.2, pp. 13–14”; :919, “Construct the signed product complex” | Partly repaired. Several exact anchors were added; products/duality and numerous other targets still lack them, and there is no sources.toml. R05 below. |
| R07, shape/contracts/Checks | README:53, “Exact supplier contracts”; :161, “Lane M” | Partly repaired. Four supplier subsections were added, but the required layer structure and per-definition API/Checks remain incomplete; R06 below. |

## R01 (P1) — Reverse the Spinᶜ difference formula

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2683`: “s_z(x)−s_z(y)=PD(ε(x,y))”. The arc convention is fixed at line 2661.

**Claim:** With α arcs from x to y and β arcs returning from y to x, that cycle represents the displayed Spinᶜ difference.

**Witness:** os-disks lines 436–442 define exactly those arcs; Lemma 2.19, printed p.16, lines 645–646, gives s_z(y)−s_z(x). Its proof, lines 687–693, identifies the cycle with γ_y−γ_x.

This is detectable away from 2-torsion. On the torus use α=(1,0), β=(1,3), x=(0,0), y=(1/3,0). An α arc has displacement (1/3,0); the returning β arc has displacement (−1/3,−1). Their sum is (0,−1). In H₁(Y)=ℤ²/⟨(1,0),(1,3)⟩=ℤ/3, write b=[(0,1)] and identify PD(b) with 1. Then ε(x,y)=2, s_z(y)−s_z(x)=2, and the proposed left side is 1, not 2. Self-pairs and order-two examples would miss the defect.

**Repair:** Keep the native ε convention and write s_z(y)−s_z(x)=PD(ε(x,y)), equivalently negate the right side of the existing formula. Add the order-three diagram as a negative-control Check, including the reversed pair. The corrected values are 2=2, 1=1 on reversal, and 0=0 on a self-pair. Carry that convention into the basepoint and grading comparisons.

The pinned `TauCeti/LowDimTopology/Heegaard/CurveHomology.lean:21` repeats the reversed formula in its explanatory prose. Its actual `epsilon` API does not construct s_z or prove a Spinᶜ comparison, so that prose cannot justify the roadmap's sign.

## R02 (P1) — Reciprocal supplier dependencies still prevent a merge order

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2092`: “Consume … AnalyticStableMaps M0.1”; also :810, :900, :916 and :1529.

**Claim:** HF can consume early, individually independent parts of roadmaps that consume HF's earlier analytic or Morse layers.

**Witness:** AnalyticStableMaps README:67–71 and :191 consume HF F1/F2; main DGFloer README:113–120 consumes HF M/F0–F2; main MorseNovikov README:48 consumes HF M/F0.

These are three reciprocal roadmap pairs. MorseNovikov N5 explicitly makes its local return construction independent of its later Novikov theory; that resolves a possible theorem-level cycle, but the binding contract requires a single direction for whole roadmaps. The same distinction applies to DGFloer's “independent” filtered algebra and ASM's normalization.

**Repair:** Move ownership. For example, keep the earlier ordinary-Morse/analytic foundation in HF, and place its consumers of ASM, DGFloer and MorseNovikov in HeegaardFloerPartII after them. Alternatively move their genuinely independent generic prerequisites to earlier owners and remove the reciprocal imports. Do not duplicate the constructions. The current inequalities are a<h<a, d<h<d and m<h<m. A foundation at position 0, its consumers at 1, and Part II at 2 gives strictly increasing supply in each tested route. Merely adding “early” does not.

The dependency checker reports zero problems; its output is reproduced below. This finding is from the actual cited contracts, not an UPWARD/CYCLE line emitted by that checker.

## R03 (P1) — Resolve the stable-map contract against the supplied head

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2954`: “AnalyticStableMaps M0–M3”; also :1988 and :2092, “M0.1”.

**Claim:** These cited sections supply general normalization and the normalized labelled nodal-domain, deformation/plumbing and compactness inputs used by HF.

**Witness:** At supplied ASM head e191666, normalization is §0.5, README:168–191; its contracts at :79–80 delegate nodal domains, deformation slices, plumbing and convergence to ComplexCurveModuli D1/D3/D4/D6.

The supplied checkout has no old M0.1/M0–M3 contract. Its §0.1 concerns energy and virtual dimension. This matters beyond numbering: the domain constructions now have a different named owner. There is no declared gap allowing the old citation to act as a promise. The cached roadmap resolver still resolves the old section names; the clean supplied checkout is the evidence used here.

**Repair:** Inventory the inputs in F2.6b and F5.0 individually, cite ASM §0.5 for the actual factorization, and name the actual owner/section of each domain and compactness input. Apply R02's ownership split before adding dependencies: ComplexCurveModuli itself consumes HF's early sphere/CR theory, so simply inserting another reverse supplier is not a repair. If a required extension is absent, state an owned target or a precise declared gap. Test the corrected contract on z↦z²: normalization gives degree 2, ramification 2 and 2=2·2−2; on a one-nodal rational source it must additionally supply two distinct paired flags and the nodal-domain carrier, which factorization alone does not provide.

## R04 (P3) — Delete calibration padding from the Lean acceptance package

**Location:** `TauCetiRoadmap/HeegaardFloer/TorusBottShearTargets.lean:30`, `NonorientableBottModuliTargets.lean:28`, and the circle, Klein-bottle and four-dimensional companion files.

**Claim:** These auxiliary Lean files belong to the roadmap's headline acceptance test.

**Witness:** `shear_intertwines` closes with `simp [shear_apply, hF, add_assoc]`. `normalMonodromy_calibration` also closes with a single expanding `simp`. The combined scratch probe elaborated with only the eight remaining sorry warnings.

The other declarations compute circle matrices, a small quotient group or four-dimensional matrices. The Klein quotient need not close in one tactic to be padding: it is the README's finite-complex Check without the geometric identification. Every companion also uses Mathlib submodule imports, and several declarations lack docstrings. The worker's passing import scan does not establish compliance for these explicitly scoped companions.

**Repair:** Delete these calibration declarations/files from the acceptance package; retain their mathematics as README Checks. For padding in Suggested.lean the prescribed repair is “delete it from `Suggested.lean`”; the same deletion rule applies to these companion acceptance files. Do not prove the admitted calibrations in place. Suggested.lean's seven actual headlines can remain. The deletion preserves the checked values D=I−S, det(negative)=−1, det(normal)=1, the shear equality (152,−39)=(152,−39), H₁(K)=ℤ⊕ℤ/2, and the self-dual normalization A²=−I when a²+b²+c²=1.

The second successful one-tactic probe was:

```lean
simp [negativeMonodromy, normalMonodromy, normalForm,
  Matrix.det_fin_two, Matrix.det_fin_three, Matrix.one_fin_three,
  Matrix.vecHead, Matrix.vecTail, Fin.sum_univ_succ,
  QuadraticMap.weightedSumSquares_apply]
```

## R05 (P3) — Supply exact locators for the remaining claims

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:919`: “Construct the signed product complex”; also M.0a, M.5, F4.A–C and F5.2. No `sources.toml` exists in the folder.

**Claim:** The global bibliography or a source's name suffices to locate each proposed theorem and its hypotheses.

**Witness:** M.9 specifies products, integral Tor, local coefficients and nonorientable duality without a theorem/page locator. F5.2 names BEHWZ but gives no numbered compactness theorem beside its several distinct compactness statements.

**Repair:** Attach exact version-specific theorem/section and printed-page locators to the targets, and distinguish sourced statements from additional owned extensions. Record each cited work once in sources.toml. For M.9, Hutchings §3 exercises 4–5, printed p.18, supplies a duality exercise route, not all the integral/local-coefficient product assertions. For F5.2, BEHWZ Theorems 10.1–10.3, p.849, and the expanded statements on p.850 support the specified closed cylindrical-end sector; the boundary adapter remains an additional target. On a trivial cylinder, E_ω=0 while E_λ is its positive action, so the locator must retain the total-energy hypothesis. For F4.B use os-disks Lemma 2.19 and Theorem 4.9 with the corrected sign of R01. The source-verification table below gives further usable anchors. Unreadability is recorded separately, not treated as a mathematical counterexample.

## R06 (P3) — Finish the per-definition APIs, Checks and layer contracts

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:161`, “Lane M”; :1033, “Lane F0”; :3037, “Define the topology of convergence”.

**Claim:** The present lane narrative supplies the requested per-definition API, at least three discriminating Checks, and per-target dependencies.

**Witness:** The README has six explicit Checks lists and five Needs lines across 3,488 lines. F5.2 introduces convergence, stability and energies without its own three Checks; lanes lack the required closing Examples/Dependencies subsections.

**Repair:** Retain the mathematical detail but organize it into the stipulated layers, add the API and three discriminating Checks to each definition, and enumerate each statement's and proof route's actual inputs. Expand Exact supplier contracts beyond its present four subsections. For F5.2, use (i) a constant map, E_ω=E_λ=0, stable only with sufficient special points; (ii) a trivial cylinder, E_ω=0 and E_λ=T>0; (iii) a k-fold cylinder, E_λ=kT, so a uniform E_ω bound alone permits unbounded action. These distinguish the intended topology/energy/stability package from plausible weaker models. Do not manufacture Lean declarations for the Checks.

## Verified sound

The gate supplied for this exact head reports every scanner and the targeted build passing:

```text
gate HeegaardFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The requested independent dependency command produced:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not negate R02's reciprocal textual contracts. The outside-folder diff is empty; HEAD is the requested 523d562 and the worktree remained clean. No source passages, executable algorithms, sorry'd data or set_option were found in the reviewed files. The substantial scope is general: no exact-only restriction replaces the promised general HF analytic theory, and the particular circle/torus computations are presented as examples.

Suggested.lean independently elaborated with seven sorry warnings and no other warning/error. A scratch file assembled the six files under the permitted imports and printed `#check @name` for all 28 declarations. All elaborated; all ten admissions were identified. I compared the elaborated binders with the prose: the Banach completeness, source second countability, boundaryless hypotheses, finite dimension, embedding and isotropy assumptions survive. No lost standing hypothesis was found. The unused auxiliary C does not enter `shear`'s type, as expected. This combined probe tests signatures, not the companions' prohibited original imports.

For each of the ten admissions I tried the one-tactic alternatives simp, rfl and infer_instance on a scratch copy. None closed with those bare alternatives. The two focused one-simp probes above then closed the calibration admissions. The seven geometric/analytic headlines are not these elementary calculations; no direct pinned lemma proving one of them was found in the object searches.

Headline inventory: integral Morse/Bott comparison and continuation; filtered/Serre comparison; products, Poincaré duality and cup product; Witten comparison; Fredholm genericity and determinant orientations; spectral flow/index and CR Riemann–Roch; Darboux/Moser; sphere normalization, moduli, rulings and equal-area group; nonsqueezing; compact Lagrangian discs and nonexactness; exact Floer comparison; HF invariance/gradings/naturality; cylindrical equivalence, bordered pairing and knot Floer; stable-hat, lattice/minus and grid/knot reconciliations. The seven statable signatures are sharp Sard, sharp Sard–Smale, two Darboux forms, unique PSL triple normalization, nonsqueezing and the componentwise disc theorem. Suggested.lean:16–52 individually names the remaining headlines and missing geometric carriers. No additional statable headline omission was established in this pass.

Pinned object audit: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These opened declarations were used to test the interfaces, rather than treating name-search hits as proofs:

| Pinned file and line | Actual content and its boundary |
| --- | --- |
| Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123 | `ContinuousLinearMap.IsFredholm` includes strictness, closed range, finite kernel/cokernel and complemented kernel. It does not impose ambient Banach completeness; Suggested states that explicitly. |
| TauCeti/Analysis/Fredholm/SardSmale.lean:468 | `isMeagre_image_criticalPoints_of_isFredholm` uses k≥(dim ker)²+1. It is not the sharp index-bound theorem now owned here. |
| TauCeti/Analysis/Fredholm/SardSmale.lean:493 | `dense_compl_image_criticalPoints_of_isFredholm` retains the same threshold. |
| TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:68, :92 | `IsNondegenerate` is fiberwise nondegeneracy; `IsSymplectic` adds closedness. Neither supplies compactness, separation or Darboux. |
| TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:221, :226 | `upperRightHom_smul_infty` and `upperRightHom_smul_coe` give the actual translation action, fixing infinity and sending z to z+x. They do not assert sharp triple transitivity. |
| TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace.lean:44, :58 | `tangentRange` is the differential range and `NormalSpace` its quotient. These are not a Euclidean tubular-neighborhood diffeomorphism. |
| TauCeti/LowDimTopology/Heegaard/CurveHomology.lean:311, :318 | `epsilon` and `IsConnectingChain.epsilon_eq` retain the actual connecting-chain quotient. There is no Spinᶜ-map comparison here. |
| TauCeti/LowDimTopology/Heegaard/CurveHomology.lean:324, :331, :339 | `epsilon_self`, `epsilon_add_epsilon`, `neg_epsilon` prove zero, addition and reversal. Those laws alone cannot distinguish ε from −ε. |
| Mathlib/Analysis/Calculus/Darboux.lean:27 | This is the intermediate-value theorem for derivatives, not symplectic Darboux; it is not a duplicate headline. |

Ownership searches used the roadmap grep/show index, main, the supplied sibling checkouts, board package files and the pinned libraries, by objects as well as names. Main SymplecticGeometry and Completed/OrthogonalL2Bases were read as shape references. The following resolved contracts explain the retained ownership; they are not claims that entire supplier roadmaps were mathematically reviewed here.

| Contract inspected | Resolution |
| --- | --- |
| DifferentialGeometry10.2, main README:884 | Chart transfer of the native Sard theorem; F0.S's sharp bound is an additional HF target, not a duplicate. |
| ComplexKahlerGeometry K5a, main README:718–726 | Complete atlas-independent smooth-section Fréchet topology. HF:1363–1388 now imports it and adds the finite-jet/boundary comparison. |
| GeometricCurrents G1/G2/G3/G4a, main README:137, :240, :406, :523 | Current carriers, integer coefficients and integral comparison/topologies are assigned there. HF's trajectory-chain comparison is additional geometry. The current G3 route is not the old DGFloer route. |
| CalibratedGeometry C2/C4, supplied README:180, :277 | Integration and Hermitian calibration ownership; HF uses them for its holomorphic-energy comparison. |
| MorseTheory M1–M6, main README:90, :124, :430, :458, :611, :649 | Hessians, compact-band handles, approximation, inequalities, Bott attachments and gradient convergence; HF retains trajectory compactifications/counts. |
| GeometricTopology Layers1/3/9, main README:177, :357, :744 | Tubes/gluing, diffeomorphism topology and ordinary splittings. HF adds pointed cut-system and analytic comparisons. |
| AlgebraicTopology Stage6.3, main README:1398 | Twisted relative fundamental class with outward-first boundary. HF's forced-disc argument reduces its local system mod2 instead of rebuilding fundamental classes. |
| DGAInfinity Layers0–4, main README:263, :293, :317, :353, :394 | Generic signed DG/A∞/transfer/bar infrastructure has that owner; bordered analytic modules remain here. |
| HopfRinow Layer1, main README:244; RiemannianGeometry R1/R5a, main README:179/:1044 | Levi-Civita and immersion geometry inputs; HF adds its particular boundary-density calculation. |
| FuchsianOrbifolds Layer5, main README:311 | Generic compact-surface degree/Riemann–Hurwitz input, used with the actual cover. |
| ComplexCurveModuli D0.3, main README:49 | Explicitly consumes HF's sphere/Möbius theorem; it is not a competing owner of Suggested's triple theorem. Its domain-family constructions are separate. |
| CombinatorialHeegaardFloer, supplied README:51–90 | Independent grid/stable/lattice constructions; analytic reconciliations belong to HF. Stable mod2 and completed spherical-tree restrictions are retained as source-backed sectors. |
| DGFloer main README:113–120; MorseNovikov main README:48, :292–312 | Actual HF dependencies, despite the independence of some individual early sections; R02. |
| AnalyticStableMaps supplied README:67–80, :168–191 | Actual analytic dependencies and revised ownership/numbering; R02/R03. |

No fully qualified collision with a sibling declaration was found in the searched signatures. This is not an exhaustive claim about unprovided open work. In particular, the HamiltonianSystems Layer1 contract could not be inspected in the supplied main/files; no unprovided open checkout was sought. That limitation is recorded below.

Seeded-source verification is separate from the numerical instance checks. All fetched texts came through the sources service; no source files were placed in the roadmap. The table cites the version actually read. The README has no explicit unverified-locator list and no source manifest to reconcile.

| Seeded target | Text inspected, hypotheses and outcome |
| --- | --- |
| M.4 integral geometric comparison | hutchings lines 436–484, 512–590, Theorem3.1/Proposition3.2, pp.13–18: compact Morse–Smale geometry and comparison maps. Footnote13 leaves smooth evaluation unjustified; HF explicitly owns that local-model proof. No arbitrary-metric smooth evaluation certified. |
| M.5 continuation/Cerf | hutchings lines 637–730, §4, pp.20–22: continuation and chain homotopy. These do not alone certify every multiparameter Cerf/corner extension stated here; those remain owned targets needing exact route locators. |
| Circle counterexamples | hutchings lines 734–753, §4 exercises, pp.22–23: strict chain composition/identity counterexample prompts. Recomputed matrices and time/basin checks below support the proposed examples; the exercise is not a theorem proving their quantitative estimates. |
| M.6 Bott/orientation coefficients | hutchings lines1085–1164, §6.2, pp.33–36: negative-normal orientation coefficients and transverse trajectory dimensions. Integral determinant/fiber-product signs are additional targets, explicitly acknowledged. |
| M.8 filtration/bundle comparison | hutchings lines1286–1383, §6.4/§6 exercises, pp.39–42: two filtrations; the bundle/Serre comparison is an exercise with no proof given. HF correctly strengthens index drop for its simple E1 description and owns the filtered comparison. |
| M.9 products/duality | hutchings lines607–608, §3 exercises4–5, p.18, supports the oriented/relative duality route only. No exact locator in M.9 for the whole integral Tor/nonorientable package; R05. |
| F2.6b simple maps/quotient | The cited McDuff–Salamon second-edition text was inaccessible. The actual supplied ASM factorization was read; its ownership/locator discrepancy is R03. The general source theorem is not certified by its name alone. |
| F2.6f nonsqueezing | gromov lines134–158, §0.3.A corollary, pp.309–310: positive-radius ball into standard symplectic cylinder gives r≤R. Suggested's derivative and embedding hypotheses retain that setting. |
| F2.6h equal-area group | gromov lines182–196, §0.3.C, p.311: equal-area S²×S² includes the factor-interchange component and the SO(3)×SO(3) subgroup. The detailed relative-family proof in McDuff–Salamon was not readable. |
| F4.A geometric diagrams | os-disks lines165–214, §2.1/Proposition2.2, p.6: handlebody/cut-system presentation and moves. This alone is not a certificate for the full based/naturality extension; that is explicitly constructed in HF and requires the pointed source locators. |
| F4.B Spinᶜ/periodic/grading | os-disks lines436–442, 595–700, 1540–1553, Lemma2.19 p.16 and Theorem4.9 p.37. The arc convention exposes R01. Periodic-domain Chern evaluation requires the normalized domain and the stated Spinᶜ construction. |
| F4.C admissibility/moves | os-disks lines1836–1855,1946–1995, Lemmas5.2/5.6/5.8, pp.44–47: generator realization and admissible pointed isotopies. Global marked move/naturality conclusions need their additional Cerf construction, not just these lemmas. |
| F4.M balanced multipointed | oss-stable lines3443–3473, Theorems10.2–10.4, p.91 of v3: mod2 homology, extra basepoint factors, and rational-homology-sphere twisted specialization. HF does not claim these prove integral chain naturality by themselves. |
| F5.2 varying-domain ends/boundary | behwz lines133–231,847–877,2023–2134, §§2/5 and Theorems10.1–10.6, pp.849–850 for compactness: adjusted symmetric ends, fixed signature, Morse–Bott/nondegenerate asymptotics and total energy. HF explicitly separates the extra Lagrangian-boundary adapter and does not assert end-energy additivity. |
| F5.5 bordered pairing | lot lines354–391, Theorems1.1–1.3, pp.4–5 of v6; lot-bimodules lines127–169, Theorems1–5, pp.3–4 of v4: oriented boundary algebra, typeA/typeD and derived pairing/reparametrization. These support the mod2 sector, not automatic integral or arbitrary unbounded box sums. |

Further repaired anchors read directly: wehrheim Theorem2.3/Remark2.4 lines281–292, p.6; Theorem2.6 lines339–358, pp.7–8; Corollary2.9 lines499–517, pp.10–11, retaining the Euclidean local-model distinction. lipshitz Propositions13.2/13.4–13.7 lines3993–4059, printed pp.1058–1060, identifies the symmetric/cylindrical moduli and separately addresses determinant orientations. lipshitz-erratum lines26–39,86–113,251–267 repairs the topological-representative argument, rather than invalidating the embedded index formula. sard Theorems4.1/7.2 lines90–92/275–278, printed pp.885/889, supports the sharp finite-order target, with the lower-source-dimensional case treated by its own Lipschitz dimension argument.

The adversarial table below records computed values, not proofs of the general theorems. “Pass” means the displayed instances agree; it does not certify unread sources or settle existence/compactness arguments. Each row identifies the tested statement or separately numbered target. The table covers all seeded targets, all headline groups and every finding target, with individual rows for the Lean declarations and additional sign/degeneracy tests.

| Statement / target | Instances and values on the two sides | Result / change |
| --- | --- | --- |
| Supplier order | For X=ASM,DGFloer,MorseNovikov, both h<x and x<h imply h<h. Foundation0→supplier1→PartII2 has 0<1<2. | Fail; R02. |
| ASM contracts | z² has d=2,R=2: source χ=2=2·2−2. Nodal rational curve has two paired flags; a factorization tuple alone has zero node-pairing fields. | R03; resolve different inputs. |
| M.0a stable dynamics | f=−x²+y² gives flow(e^(2t)x,e^(−2t)y); stable dimension1, unstable dimension1=negative index. | Pass. |
| M.0b local model | For −x²+y² rates are ±2; for half that function rates ±1. Time2t converts e^t to e^(2t), and gluing parameters change accordingly. | Pass; no identical-time assumption. |
| M.1 quotient/dimension | Indices2→0 give intersection dimension2 and quotient1=2−0−1; a constant orbit has ℝ stabilizer, not trivial stabilizer. | Pass with constant branch separate. |
| M.1 no cycles | Nonconstant trajectory has df/dt=−‖grad f‖²<0; a cyclic sum would give total drop0>0. Constant trajectory has derivative0. | Pass. |
| M.2 corner depth | 3→2→1→0 has three rigid factors and two gluing parameters: dimension2=3−0−1, deepest codimension2. | Pass in declared local-model sector. |
| M.3 signs | Breaking2→1→0 gives signs (−1)²=1 and (−1)⁴=1 in the two boundary conventions. | Pass. |
| M.3 integral complex | RP² has d2=2,d1=0: composite0, H1=ℤ/2,H2=0. Mod2, d2=0 and H2=𝔽2. | Pass; coefficients distinguish torsion. |
| M.3 torus | Opposite trajectories count1−1=0; homology ranks(1,2,1), Euler1−2+1=0. | Pass. |
| M.4 A,D comparison | Point: AD=1, DA−1=0=dF+Fd. Interval: geometric and singular boundaries both [1]−[0]. | Pass; does not replace geometric construction. |
| M.4 quartic flow | ẋ=x(1−x²); linearization at0 is1 and at±1 is−2. Truncated cube V−E+F=48−72+26=2. | Pass. |
| M.5 continuation | S swaps two generators,D=I−S. S²=I; DS=SD=S−I, whereas S≠I. | Pass. |
| M.5 continuation homotopy | K=−I gives DK=KD=S−I. Two identity-window maps compose to I, while direct map can be S. | Pass; homotopic, not strictly equal. |
| Circle time-window estimate | If angular speed bound is2δ and window lengthT, displacement≤2δT; δ=π/12,T=1 givesπ/6. | Pass; strict basin margins still needed. |
| Circle composition counterexample | Two shiftsπ/3 each stay below theπ/2 basin boundary; sum2π/3 crosses it. Intermediate count I·I=I; direct count S. | Pass for the stated short-window choice. |
| M.5 Cerf birth | f_t=x³/3−tx: t<0 has0 critical points,t>0 has2 at±√t with Hessians±2√t. The new adjacent differential is a unit±1. | Pass; acyclic added pair. |
| M.5a relative homology | H1([0,1],{0,1})=ℤ, absolute H1=0; boundary endpoint coefficients(+1,−1) sum0. | Pass. |
| M.6 Bott dimension | Circle components with λC=2,λD=0: dimension2=2−0+1−1; isolated components give1=2−0−1. | Pass. |
| M.6 fiber-product orientation | X=Y=T=ℝ and v−w quotient: columns(1,1),(1,0) have determinant−1=(−1)^(1·1). | Pass. |
| M.6 swap sign | For three dimensions1, swap exponent1+2+1=4 gives+1 on diagonal. For T=point, X=Y=ℝ it gives−1. | Pass both cases. |
| M.6 orientation coefficients | Negative reflection diag(1,−1) has det−1; full normal diag(1,−1,−1) has det+1. | Pass; ambient orientability does not suffice. |
| M.6 mapping-torus moduli | Circle base times reflected trajectory circle yields dimension2 and monodromy−1, whereas an oriented product torus has monodromy+1. | Pass negative control. |
| M.7 internal shift | λC=2,λD=0,dCD=1: cross coefficient1·(−1)+1=0. Equal λ=1,dCD=−1: (−1)(−1)−1=0. | Pass including equal indices. |
| M.7 broken-face sign | λC=3,λE=2,λD=1,c=e=0 gives a=b=0,mCD=1; left exponent2+1=3,right0+0+1=1, both odd. | Pass; difference2. |
| M.7 sign local system | Monodromy−1 gives boundary−2; H0=ℤ/2,H1=0. Dual H0=0,H1=ℤ/2; mod2 boundary0. | Pass. |
| M.7 double traversal | Coefficient1+(−1)=0, so twice-around traversal is zero with these twisted coefficients. | Pass; no spurious H1 generator. |
| M.7 constant function | One critical component X,λ=0, no nonconstant trajectory: total D=∂X. X=point gives H0=ℤ. | Pass. |
| M.7 product shift | λ=1 gives −∂N; λ=0 gives+∂N. A degree-one factor crossing a boundary changes sign−1. | Pass. |
| M.7 two-cap sphere | d2(a,b)=a+b: imageℤ,kernelℤ(1,−1); H2=ℤ,H1=0,H0=ℤ. | Pass. |
| M.7 torus shear | d=2,e=3,P=5,Q=7,F=dP+Qe=31,x=11,y=13. Both sides=(152,−39). | Pass; padding in Lean. |
| M.7 Klein bottle | d2(n)=(0,2n),d1=0: H2=0,H1=ℤ⊕ℤ/2,H0=ℤ; Euler1−1+0=0 in ranks. | Pass. |
| M.7 four-component sphere | d2(a,b)=(0,−a+b),d1(c,d)=(−c,c): d1d2=0; H ranks(1,0,1). | Pass. |
| M.7 moment-map obstruction | Exceptional poles have f=−ε,+ε and weights(1,−2),(−1,2); both indices2. Their invariant connecting surface dimension2 exceeds transverse dimension0. | Pass; invariant regularity cannot be inferred. |
| M.7 invariant current vanishing | A nonzero orbit direction lies in derivative kernel. A one-dimensional correspondence has rank≤0<1; a zero-dimensional regular one cannot carry that direction. | Pass under explicit regularity. |
| M.8 strict index filtration | Two-cap sphere drop2 makes d2:ℤ²→ℤ the sum; kernel rank1. Critical-value filtration puts the same sum at d1. | Pass; page numbers differ. |
| M.8 equal-index warning | A filtered two-term map ℤ→ℤ,1↦1, entirely at index0 has E1=0; direct sum of component groups would beℤ⊕ℤ. | Pass negative control; not claimed geometric existence. |
| M.8 page bidegree | At(p,q)=(2,0),r=2, target=(0,1), total degree drops2→1. For r=1,target=(1,0), again2→1. | Pass. |
| M.8 extension data | Associated graded of0⊂2ℤ/4⊂ℤ/4 has twoℤ/2 pieces; their direct sum has exponent2, actual group exponent4. | Pass; no canonical splitting claimed. |
| M.8 bundle comparison | Trivial S¹ bundle overS²: E2 ranks at(0,0),(0,1),(2,0),(2,1) all1, abutment ranks(1,1,1,1). | Pass. |
| M.8 transgression | Hopf S¹→S³→S² has d2:H1(fiber)=ℤ→H2(base)=ℤ a unit; survivors degrees0,3 only. | Pass. |
| M.8 multiplicative example | SU(3) exterior generators degrees3,5 give groups degrees0,3,5,8 eachℤ; Euler1−1−1+1=0. | Pass. |
| M.9 tensor sign | For \|x\|=\|y\|=1, the two mixed terms in d²(x⊗y) are −dx⊗dy+dx⊗dy=0. | Pass. |
| M.9 integral Tor | Tor₁^ℤ(ℤ/2,ℤ/2)=ℤ/2 while tensor is alsoℤ/2; omitting Tor loses a degree-shifted summand. | Pass. |
| M.9 duality | OrientedS²: H0↔H²=ℤ,H2↔H⁰=ℤ; RP² requires orientation coefficients since ordinary H2=0. | Pass. |
| M.9a cup product | T² generators a,b have a∪b=+[T²]*,b∪a=−[T²]*,a²=b²=0. Over𝔽2 signs coincide. | Pass. |
| M.9a mod2/nonorientable | RP² generator x∈H¹(𝔽2) has x²≠0 and x³=0; exterior-only model would give x²=0. | Pass. |
| M.9a zero coefficients | Over zero ring all chain groups and cup products are0; identities reduce0=0 without creating a nonzero unit. | Pass. |
| M.10 Witten model | f=x²/2: (d/dx+tx)e^(−tx²/2)=0. Ground-state eigenvalue0 matches the index-zero generator. | Pass local model only. |
| F0.S sharp_sard | m=3,n=1,k=3: 3>2 true; native quadratic test3≥10 false. Critical values of zero map are{0}, measure0. | Pass; repaired ownership. |
| F0.S lower source dimension | ℝ→ℝ²,t↦(t,0): Nat subtraction1−2=0,0<1 true; critical image line has plane measure0. | Pass; truncation intentional. |
| F0.S zero dimensions | 0→0 is surjective derivative, critical set empty,measure0. 0→ℝ has critical singleton,measure0. | Pass. |
| F0.S open-set derivative | U=∅ gives empty image,measure0. On nonempty open U the unrestricted derivative equals the germ derivative used by ContDiffOn. | Pass; no boundary derivative substitution. |
| F0 sharp_sardSmale identity | idℝ: ker0,coker0,index0; k1>0; critical set∅ is meagre. | Pass. |
| F0 sharp_sardSmale negative index | ℝ→ℝ² inclusion: kernel0,cokernel1,index−1; image line closed with empty interior; regular fibers empty. | Pass. |
| F0 sharp_sardSmale zero map | ℝ³→ℝ zero: kernel3,cokernel1,index2; k3 passes and k2 fails. Critical values{0} are nowhere dense. | Pass. |
| F0 determinant orientation | A=2 onℝ has kernel/cokernel0 and determinant-line dimensions0−0=0; reversing a chosen real line orientation multiplies its generator−1, not an arbitrary positive scalar. | Pass; orientation not volume normalization. |
| F0 section regularity | Section s(x)=x has derivative1 and zero manifold{0},dimension0. s(x)=x² has derivative0 at its zero and is excluded from the regular theorem. | Pass. |
| F0.1 Morse genericity | x² has Hessian2≠0; x⁴ has Hessian0. Both are smooth, so smoothness alone does not imply Morse. | Pass. |
| F0.2 jets/localization | A constant cutoff equal1 near0 has value1 and all positive jets0 there; outside its support all jets0. Fixed-germ constraints survive localized perturbations. | Pass. |
| F0.3 trajectory perturbation | Variation supported where V≠0 changes the trajectory equation there; at a fixed endpoint its variation is0. Endpoint and interior conditions remain distinct. | Pass. |
| F0.4 metric cone | For α=dx and V′=2∂x, the metric satisfying g′(V′,−)=α has g′xx=1/2>0; g′xx=0 fails. | Pass. |
| F0.4 imported topology | sinθ and all derivatives onS¹ have supnorm1; trivial-line sections and functions give identical seminorms(1,1,…). | Pass; prior duplication repaired. |
| F0.4 boundary jet closure | On[0,1], f(x)=x² has f′(0)=0,f″(0)=2; segment FTOC gives f(h)−f(0)=h² on both sides. | Pass within-set boundary case. |
| F0.5 budget | N=2,r=2,k=3,ell=6 satisfies ell≥k+r+1=6. ell=5 fails that target budget. | Pass; no low-order shortcut. |
| F0.6 return germs | P(z)=2z,h(z)=3z: hPh⁻¹(z)=2z and derivative2 on both sections; P² derivative4. | Pass; local germ, not invariant disk. |
| F0.7 Bott normality | f(x,y)=x² on cylinder has critical circle x=0,normal Hessian2, tangent Hessian0; full Hessian invertibility would wrongly reject it. | Pass. |
| F1.1 Sobolev budget | Surface k=1,p=3 has kp=3>2; p=2 gives2, the excluded threshold. Trace regularity loses1/p, not one full derivative. | Pass. |
| F1.2 CR normalization | For ∂s+i∂t, u=z gives0 and u=bar z gives2. The half-normalized ∂bar gives0 and1 respectively. | Pass; factor2 retained. |
| F1.2 cubic boundary solver | u=a0+a1z+conj(a1)z²+conj(a0)z³ has e^(−3iθ/2)u real; kernel real dimension4. u(0),u′(0) determine a0,a1. | Pass. |
| F1.3 crossing model | At t=log2,cosh t=5/4,sinh t=3/4,tanh t=3/5; d(sech t)/dt+tanh(t)sech(t)=−12/25+12/25=0. | Pass. |
| F1.3 Fredholm index | A one-dimensional crossing kernel with zero cokernel has index+1; its adjoint has kernel0,cokernel1,index−1. | Pass; reversal changes sign. |
| F1.4 Maslov | Line e^(iπt)ℝ makes a half-turn: Maslov1; constant line gives0; reversed half-turn−1. | Pass. |
| F1.4 Hamiltonian sign | With ω=dx∧dy and i_Xω=dH,H=(x²+y²)/2 gives X=(y,−x), clockwise rotation. Opposite Hamiltonian convention reverses it. | Pass convention control. |
| F1.5 closed RR | OnS², real CR index of trivial line is2, of tangent line is2+2·2=6, of degree−2 line is2−4=−2. | Pass. |
| F1.5 boundary RR | Disc with constant real line boundary: index1+0=1; one half-turn line has index1+1=2. | Pass. |
| F1.6 weights | Crossing one simple asymptotic eigenvalue removes one admissible decaying mode: index change−1; a fixed nullspace of dimensionk adds k when explicitly allowed. | Pass. |
| F2.1 exists_darbouxChart | Standard plane chart=id gives ω(v,w)=ω(v,w), at e1,e2 gives1=1. Zero-dimensional tangent has the unique form,0=0. | Pass. |
| F2.1 exists_standardDarbouxChart | Dimension2 has m1 and standard matrix[[0,1],[−1,0]]; dimension0 has m0 and empty alternating form. | Pass. |
| F2.1 Moser scale | ω_t=c_t dx∧dy, c_t>0; scaling by c_t^(−1/2) pulls backω_t toω0: c_t·c_t⁻¹=1. | Pass; c_t=0 excluded. |
| F2 four-dimensional normalization | a1,b=c0: coefficient norm²2,A²=−I,ω(e1,Ae1)=1. a2 gives norm²8,A²=−4I. | Pass; unit coefficients versus norm√2. |
| F2.2 local branches | u=z² has derivative0 at0 and multiplicity2; u=z has derivative1 and multiplicity1. Constant map has derivative0 everywhere and is excluded. | Pass. |
| F2.2 coincident germs | The two branches of a transverse node have distinct tangent lines; their shared image point does not make their germs equivalent. | Pass; multiplicity remains1 on each. |
| F2.3 energy | u=z on unit disc has areaπ, ∂bar term0. u=bar z has signed area−π; the positive correction2π gives energyπ. | Pass normalization. |
| F2.3 boundary density | For u=z into upper-half-plane with real boundary, \|du\|² is constant and its normal derivative0; even reflection preserves that scalar density. | Pass example, not arbitrary reflection theorem. |
| F2.4 transversality | Simple embedded sphere has regular injective points; z² cover has two preimages at regular image values. The latter is excluded from simple-locus perturbation theorem. | Pass. |
| F2.5 gluing | Two rigid pieces plus one positive neck coordinate have parameter dimension1; at neck limit0 there is one boundary stratum. | Pass. |
| F2.6a sphereAut_existsUnique_map_triple | Triple(0,1,∞) gives identity. Triple(1,2,∞) gives translationz+1. Repeated triple(0,0,∞) violates distinctness. | Pass. |
| F2.6a nonabelian composition | T(z)=z+1,D(z)=2z: TD(0)=1,DT(0)=2. Right reparametrization uses the inverse on marks; translation1 takes mark3 to2. | Pass; commuting model rejected. |
| F2.6a genus zero | O(p) degree1 map to sphere has d1,R0,χ2=1·2−0; an unramified torus self-cover has χ0 and does not imply genus zero. | Pass. |
| F2.6b simple factorization | Degree2 cover of a line has d2,R2,χ2=4−2; embedded conic has class2[line] but factor degree1. | Pass; nonprimitive need not mean covered. |
| F2.6b quotient/stabilizer | Simple parametrized sphere has trivial stabilizer; z² has order2 deck symmetry. Constant sphere has full PSL stabilizer. | Pass scope distinctions. |
| F2.6c compactness | If each nonconstant component has area≥1 and total area1, there is at most1 such component; a ghost sphere still needs≥3 special points. | Pass; ghosts not deleted. |
| F2.6d regular dimension | In real dimension4, unmarked sphere index=−2+2c1(A); c1=2 gives2, one mark adds2 to4. | Pass. |
| F2.6e adjunction | Nodal plane cubic: A²9,c1(A)9,genus0,δ1 gives2g−2=−2=9−9−2. | Pass; double-point correction essential. |
| F2.6e automatic line case | Line degree−1 overS² has real index0 and holomorphic kernel0; degree0 has kernel real dimension2 and evaluation ontoℂ. | Pass. |
| F2.6f nonsqueezing | n1,f=id,r=R1 gives symplectic factor1=1 and conclusion1≤1. Dilation2 gives factor4≠1 and is excluded. | Pass. |
| F2.6f degeneracy | n0 cannot satisfy0<n; r0 cannot satisfy0<r. Empty-ball/vacuous coordinate models cannot prove the headline. | Pass. |
| F2.6g ruling intersection | Fiber classF inS²×S² has F²0, c1(F)2; two distinct positive intersections would give intersection≥1 contradicting0. | Pass. |
| F2.6g polar formula | A=diag(2,1/2),H=AᵀA=diag(4,1/4). sqrt(trH+2)=5/2 and(H+I)/(5/2)=diag(2,1/2),det1. | Pass. |
| F2.6h equal-area group | Swap sends classes(A,B) to(B,A); areas(a,a) remain(a,a). For(a,b),a≠b, swap changes the class pairing. | Pass; include Z/2 only in equal-area case. |
| F2.7 disc headline | For L=unit circle,u(z)=z is smooth,holomorphic,nonconstant,boundary inL; areaπ>0. Constant disc has area0 and fails nonconstancy. | Pass. |
| F2.7 component requirement | For disjoint circles of radii1 and2, discsz and2z have areasπ and4π in their respective components; one disc does not witness both choices ofx0. | Pass. |
| F2.7 forcing endpoint | u_s+i u_t=a gives boundary estimate\|a\|≤2R; choice\|a\|=3R withR>0 gives3R>2R, so no endpoint solution. | Pass. |
| F2.7 parity contradiction | A compact interval has two boundary points, count0 mod2. A proposed compact one-manifold with exactly one boundary point has count1. | Pass; twisted-to-mod2 adapter needed. |
| F2.7 nonexactness | Unit circle Liouville integral isπ, while integral of any exact1-form around it is0; π≠0. | Pass. |
| F3 exact Floer/Morse | Zero section ofT*S¹ has Morse/Floer ranks(1,1); Euler1−1=0. No compactness conclusion for escaping strips without the stated confinement hypotheses. | Pass test. |
| F4.A geometric diagram | g0,b1 gives0 curves and S³; g2,b2 balanced data hasg+b−1=3 curves per family. | Pass. |
| F4.A epsilon | α=(1,0),β=(1,3),x0,y(1/3,0): arc sum(0,−1), quotient class2∈ℤ/3. | Pass native arc convention. |
| F4.B Spinᶜ sign | With PD(b)=1, proposed difference s(x)−s(y)=1 but PD ε=2. Repaired difference s(y)−s(x)=2. | Fail; R01. |
| F4.B sign reversal | Swapx,y: ε=1,corrected difference1. Self-pair gives0=0; order2 alone would have1=−1 and miss defect. | Repair tested. |
| F4.B periodic Chern formula | Whole genus-g surface has e=2−2g,nx=g, so e+2nx=2. It is not normalized n_z=0 and cannot be treated as a zero H2 class in that formula. | Pass normalization control. |
| F4.B grading torsor | Chern divisibilityd2 gives ℤ/2 relative grading; d0 is ℤ, not a finite zero-element set. | Pass. |
| F4.C admissibility | Nonzero periodic coefficients(−1,1) have both signs; zero domain(0,0) must be excluded from the positivity test. | Pass. |
| F4.M basepoint rank | S³ singly pointed has rank1; b2 yields V factor rank2, b3 rank4=2². | Pass. |
| F4.M genus vs basepoint | Genus stabilization preservesb and rank1 forS³; an additional basepoint produces rank2. These moves are not interchangeable. | Pass. |
| F4.1 symmetric product | g0 gives Sym⁰Σ=point,Tα=Tβ=point; g1 givesΣ itself. Arbitrary abstract incidence data are not automatically realizable. | Pass. |
| F4.2 domain index | Embedded bigon e1/2,nx=ny1/4 gives μ1. Rectangle e0,nx+ny1 gives μ1. | Pass. |
| F4.3 admissible winding | For pairing2n=0,strong condition asks some coefficient>0 on each nonzero domain; negating a domain then forces a negative coefficient too. | Pass. |
| F4.4 differential | A compact oriented interval of index2 solutions has boundary counts+1−1=0; this is the d² coefficient cancellation. | Pass local model. |
| F4.5 flavors/U | S³ generator has absolute grading0; multiplicationU shifts it to−2. SettingU=0 recovers hat rank1. | Pass. |
| F4.q cobordism grading | Product cobordism hasχ=σ=c1²=0, so(c1²−2χ−3σ)/4=0. | Pass boundary case, not a replacement headline. |
| F5.0 domains | A self-node has two distinct flags on one normalization component; arithmetic genus0+b1(loop)=1. | Pass; factorization alone lacks this data. |
| F5.1 cylindrical sign | a=−t,J∂a=∂s implies J∂t=−∂s, not+∂s; J²∂t=−∂t. | Pass. |
| F5.1 embedded index | Bigon g1,e1/2,nx+ny1/2 gives χ=1−1/2+1/2=1 and ind=1. | Pass. |
| F5.1 double-point correction | Two-bigons exampleg2,e1,nx+ny3,d+=1 givesχ=2−3+1+2=2; omitting correction gives0. | Pass corrected immersed representative. |
| F5.2 energy | Trivial cylinder over periodT hasEω0,EλT; k-fold hasEω0,EλkT. Eω bound0 does not bound total energy. | Pass; R05/R06 controls. |
| F5.2 constant stability | Constant sphere with2 marks has positive-dimensional automorphisms; with3 distinct marks stabilizer1. Both have energy0. | Pass. |
| F5.2 breaking | Two levels can each have λ-energyT; their sum2T need not equal the original supremumT. ω-energy is additive. | Pass; no λ-additivity asserted. |
| F5.3 comparison | Degree2 cylindrical branchw²=z gives unordered pair{√z,−√z}; monodromy swaps labels while the symmetric-product map is single-valued. | Pass. |
| F5.3 orientation comparison | Choosing agreement at one rigid curve fixes sign+1 there; arbitrary independent reorientation of another curve would give−1 and violates coherent determinant comparison. | Pass required coherence. |
| F5.4 boundedness | Ifδ²=0, iterated box sums stop after length1; ifδ=id over a discrete coefficient ring, infinitely many identical nonzero terms have no algebraic sum. | Pass; bounded/completed sectors separated. |
| F5.5 pairing | Complementary solid tori producingS³ have hat rank1; gluing givingL(p,1) has rankp, so pairing must retain the boundary parametrization. | Pass. |
| F5.5 identity bimodule | Tensor with algebraA overA returns moduleM; forA=𝔽2,M=𝔽2 dimensions1·1=1. | Pass basic unit test. |
| F5.6 knot theory | Unknot Alexander polynomial1, genus0,τ0; graded Euler sum1. Mirror reversesτ, so0 stays0. | Pass normalization case. |
| Reconciliation1 | Two-pointedS³ raw hat has rank2 versus singly-pointed1. TrackingV restores2=1·2. | Pass. |
| Reconciliation1 twisted | OverR=𝔽2[t±1], R/(1+t) has𝔽2-dimension1; specializingt=1 has nonzeroTor₁=𝔽2, so nonflat base change cannot be ignored. | Pass. |
| Reconciliation2 contraction | Two-termℤ --1→ ℤ contracted to0: h=−1 givesdh+hd=−id=iπ−id. Usingh=+1 gives+id and wrong sign overℤ. | Pass convention control. |
| Reconciliation2 tree sector | Single vertex weight−1 has boundaryS³ and completed HF⁻ rank1 over𝔽2[[U]]; truncating to polynomials changes completion. | Pass source-backed sector only. |
| Reconciliation3 | An n2 grid of the unknot has one extraV of rank2; reduced knot hat rank1 times2=2. | Pass. |
| CircleContinuation.swap | Matrix[[0,1],[1,0]] takes(2,3) to(3,2); square takes it back(2,3). | Pass; README Check only. |
| CircleContinuation.boundary | D(2,3)=(−1,1), also(I−S)(2,3)=(−1,1). | Pass; padding. |
| CircleContinuation.continuation_calibration | D(−I)=S−I=[[-1,1],[1,−1]]; DS=SD has the same entries. | Pass; finite computation. |
| FourDimensional.omegaGram | a1,b=c0 givesω(e1,e2)=1,ω(e2,e1)=−1. | Pass definition test. |
| FourDimensional.selfDualMatrix | Same coefficients giveAe1=e2,Ae2=−e1; g(Ae1,e2)=1=ω(e1,e2). | Pass definition test. |
| FourDimensional.transpose identity | At a1, Gram transpose has entries(1,2)=−1,(2,1)=1, equalA. | Pass; calibration. |
| FourDimensional.exteriorNormSq | At(a,b,c)=(1,2,3), sum upper-entry squares28=2(1+4+9). | Pass; calibration. |
| FourDimensional.skew transpose | At a1,Aᵀ12=1=−A12; diagonal entries0=−0. | Pass; calibration. |
| FourDimensional.square | At(1,2,3), A²=−14I. At(0,0,0), A²=0=−0I. | Pass; calibration. |
| FourDimensional.unit square | At(1,0,0), sum squares1 andA²=−I; at(2,0,0), hypothesis4=1 fails. | Pass; negative control. |
| FourDimensional.orthogonality | At(1,0,0),AᵀA=I; at(2,0,0),AᵀA=4I. | Pass. |
| FourDimensional.compatibility | At(1,0,0),Gram·A=I; replacingA by−A gives−I. | Pass sign-sensitive Check. |
| KleinBottle.topBoundary | n1↦(0,2),n−1↦(0,−2); zero↦(0,0). | Pass; finite model. |
| KleinBottle.firstHomology_coordinates | (3,5)↦(3,1 mod2); adding boundary(0,2) gives(3,7) with same image(3,1). (0,1) has order2. | Pass; padding. |
| Nonorientable.negativeMonodromy | e2↦−e2,det−1; identity would have det+1. | Pass definition control. |
| Nonorientable.normalMonodromy | e2,e3 both reverse; determinant(1)(−1)(−1)=1 and squareI. | Pass definition control. |
| Nonorientable.normalForm | ε2,v(1,2,3) gives−1−4+18=13; reflected(1,−2,−3) also13. ε0 is degenerate, not claimed positive-normal. | Pass. |
| Nonorientable.normalMonodromy_calibration | Det pair(−1,+1),squareI,form values13=13; one expanding simp proves the statement. | Pass; delete padding. |
| TorusBott.shear | P5,(x,y)=(11,13) maps to(76,13); inverse subtracts65 and returns(11,13). | Pass. |
| TorusBott.shear_apply | The actual definition gives(76,13),same as(x+Py,y); rfl closes it. | Padding. |
| TorusBott.shear_intertwines | d2,e3,P5,Q7,F31,x11,y13 gives(425−273,−39)=(152,−39); right2·76=152. | One simp; delete padding. |

There are **161 computed rows**. The table is an adversarial instance audit; the deep general statements still require the proof routes and source qualification above. In particular, it does not turn the unsourced extensions into published theorems.

## Not verifiable

- **McDuff–Salamon, J-holomorphic Curves and Symplectic Topology, second edition:** the author-hosted ETH PDF returned HTTP403 through the sources service. F2.6b's exact factorization locator and F2.6h's detailed relative-family proof were not certified. Gromov's original nonsqueezing/equal-area statements were readable and checked separately.
- **McDuff–Salamon, Introduction to Symplectic Topology:** cited in Suggested.lean:111 for Darboux §3.2, although absent from the README bibliography. The publisher route returned HTTP403. Its locator was not certified.
- **Schwarz, Morse Homology:** sources-service title/author search found no legal full text; the global Morse/gluing citation remains uncertified here.
- **Oh, Symplectic Topology and Floer Homology:** Cambridge DOI landing page only; no readable full text. Boundary Floer claims were not certified from that book.
- **Robbin–Salamon, The Spectral Flow and the Maslov Index:** Wiley DOI request returned HTTP403. The earlier review's separate Maslov-paths citation was already recorded uncertified and was not reopened.
- **Micallef–White, The Structure of Branch Points…; Hartman–Wintner, On the Local Behavior…:** DOI routes reached JSTOR landing pages only. Their exact hypotheses and branch regularity were not certified.
- **Floer–Hofer–Salamon, Transversality in elliptic Morse theory…:** author-hosted ETH PDF returned HTTP403. Its transversality proof and the separately attempted erratum were not read; no conclusion about their correctness is inferred.
- **Kronheimer–Mrowka, Monopoles and Three-Manifolds:** Cambridge landing page only. This is a contextual reference, not a numbered input verified here.
- **Damian formalization:** the fetched repository page is readable, but a repository landing page does not establish that a theorem can be ported with the claimed hypotheses. No code-portability claim is certified.
- **Additional source extensions:** the retrieved Hutchings notes do not prove the full integral coherent-corner, invariant-genericity or bundle-comparison package. The roadmap generally labels these as construction targets; the source table states the narrower verified support. Other fetched background works were located, not certified cover to cover.
- **Unprovided open-work contracts:** HamiltonianSystems Layer1 was not present in the inspected main tree and no permitted checkout was supplied. Ownership against unprovided open pull requests was not checked. Main/supplied-head citations resolved above should not be confused with exhaustive certification of every prose supplier allusion.

The missing-source list is consolidated in the job's needs-references.toml under stable work keys. No source manifest or roadmap file was edited. Missing texts do not park this review: the findings and verdict are complete, with the limits of source certification stated explicitly.

## Source issues

- **Error** in tauceti-pin at TauCeti/LowDimTopology/Heegaard/CurveHomology.lean:21, module introduction (no printed pagination): the source says the x-minus-y Spinᶜ difference is dual to its x-to-y epsilon; it should be the y-minus-x difference for that arc convention; affects a stated result.
- **Gap** in hutchings at Proposition3.2, footnote13, printed p.14: the source leaves smoothness of the compactified evaluation unproved; it should be supplied under compatible local models or justified for the original metric; affects the proof.
- **Misprint** in hutchings at Example6.4, printed p.37: the source applies the top differential to m1 although the isolated maximum is m2; it should be m2; affects nothing.
- **Gap** in hutchings at Section6.3, printed p.39: the source assumes a generic invariant metric can be chosen for its perfection argument; it should retain invariant regularity as a hypothesis or use a different perfection proof; affects the proof.
- **Gap** in hutchings at Section6.4.1, printed p.40: the source identifies the index E1 page using weak index monotonicity; it should exclude equal-index correspondence terms or include them in the associated-graded differential; affects a stated result.
- **Misprint** in os-disks at Definition5.5, printed p.46: the source uses strongly isotopic for the endpoint and intermediate-diagram admissibility conditions; it should use strongly admissible there and reserve strongly isotopic for the connecting relation; affects nothing.
- **Gap** in lipshitz at Lemma4.1, printed pp.975–976, and Lemma4.9, as identified in lipshitz-erratum Section1, pp.2–3: the source does not justify the required corner-preserving gluing; it should use the corrected careful domain construction; affects the proof; corrected in lipshitz-erratum, representative construction, pp.4–7.
- **Error** in lipshitz at Lemma4.1, printed pp.975–976, embedding modification, as identified in lipshitz-erratum Section1, p.3: the source removes double points while retaining the required branched projection; it should allow the corrected immersed representatives and double-point terms; affects the proof; corrected in lipshitz-erratum, Proposition4.2′, pp.7–8.
- **Misprint** in lipshitz-erratum at proof of Proposition4.2′, printed p.8, line262: the source names the projection itself as the count of simple branch points; it should name its ramification degree; affects nothing.

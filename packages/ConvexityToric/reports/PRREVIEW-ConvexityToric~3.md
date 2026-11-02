# Review of ConvexityToric (pull request #1651 at 24f7c9f)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

:robot: AI incremental re-review of **0 changed lines since 086aecd**. All **13 previous findings remain: four P1, three P2 and six P3**. There are seven blocking findings and no new finding. The gate and acceptance build still fail.

Only ConvexityToric receives a verdict. The changed CotangentLagrangian passages were read for their effect on this folder and its import chain; the sibling has its own review. Unchanged mathematical computations and source readings are carried forward from [PRREVIEW-ConvexityToric~2][prior], explicitly identified below. Finding numbers are preserved. No repair report marking a finding “not actionable in this package” was supplied or found among this package's reports.

## R01 (P1) — A rank-zero toric fixed point is an interior point


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:326–328`: “Fixed points correspond exactly to vertices and never interior points.”

**Claim:** Every symplectic toric manifold has no fixed point over the interior of its moment polytope.

**Witness:** For M a point and T the trivial torus, the effective action has dimension zero. Its moment image is {0} in the zero vector space; both the interior and vertex set equal {0}.

**Repair:** Keep the classification in all dimensions. Qualify only the exclusion from the interior by `dim T > 0`, and add the zero-dimensional point as a negative-control Check. Tested repair: rank zero retains its single fixed vertex/interior point; for the standard circle action on a sphere, only the two endpoints are fixed and neither belongs to the interval's interior.

## R02 (P1) — The DH acceptance theorem depends on admitted measure data


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:95–104`, `110–136`: `def liouvilleMeasure ... := by sorry`.

**Claim:** The admitted function denotes the measure determined by the symplectic density, and `dh_absolutelyContinuous` tests its pushforward.

**Witness:** No defining equation constrains the admitted measure. Replacing its body by the zero measure makes the DH conclusion automatic, while on the unit square with `dx∧dy` the intended mass is 1, not 0.

**Repair:** Remove the admitted data definition and every declaration depending on it from the acceptance file. Name Liouville/DH and the missing measure construction in the module docstring until a genuine pinned construction is usable; consume the owner identified in R05. Do not replace it with an arbitrary measure parameter. The repaired contract must distinguish unit-square mass 1 from zero and mass 2 after doubling the form. This is the worker's `sorry-data=1` gate failure.

## R03 (P1) — The cited LieGroups layer does not supply the calibrated rank-one map


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:34–48`: “consume Layer6's normalization `dφ_α(diag(i,−i))=α∨`”.

**Claim:** LieGroups Layer 6 supplies actual compact root characters, normalized coroots and realized rank-one maps with this derivative identity.

**Witness:** On main, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:383–405` specifies maximal tori, conjugacy, Weyl groups and Weyl integration. It does not state this SU(2) map or calibration. The full main file likewise lacks the displayed normalization.

**Repair:** State a precise declared supplier gap, naming the normalized homomorphism, character convention, derivative identity and compact-connected hypotheses, with the same slug in the design and README; alternatively own the missing comparison here without rebuilding the supplier's existing torus theory. An open revision of an existing roadmap cannot replace its main contract. Calibration test: for SU(2), H=diag(i,−i) has root value 2, exp(2πH)=1, and the identity homomorphism has derivative H. The actual map, not just those numerical identities, must be supplied. No gap is declared in this package.

## R04 (P1) — The cotangent import still breaks the acceptance build

**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:1`; `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/Suggested.lean:73–79`.

**Claim:** The acceptance module elaborates against this pull-request head and the pinned libraries.

**Witness:** CotangentLagrangian replaced `canonicalForm` with `canonicalForm_exists`. HamiltonianReduction still applies `canonicalForm (M := M) I` at line 76. The targeted build exits 1 with “Invalid argument name `M` for function”; ConvexityToric's import cannot load.

**Repair:** Remove the prohibited roadmap import as required by R08. State retained headlines on pinned carriers with only their necessary, real definitions; identify genuinely unavailable headlines and their missing carriers in the docstring. Do not restore admitted form data to make the obsolete call typecheck. If retaining that cotangent consumer elsewhere, restate it on a supplied smooth symplectic form with the actual cotangent-chart identity instead of treating an existence theorem as a form. Re-run the targeted ConvexityToric build and direct elaboration at the repaired head.

**Regression test:** The exact failing instance is the displayed cotangent-momentum signature with named argument `M`. The sibling now supplies an existential proposition, not an object to which that application can refer. Both the targeted build and direct elaboration were rerun and failed; no repaired build is claimed. The worker records this as `build=2` (two failure messages, one finding).

## R05 (P2) — Liouville measure has two declared owners


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:281–285`: “This is the single owner consumed by integrable systems and quantization.”

**Claim:** T4 constructs the measure from a smooth symplectic density as its unique owner.

**Witness:** `TauCetiRoadmap/SmoothBundlesConnections/README.md:776–800` on main already constructs measures from smooth positive densities and explicitly their Liouville specialization, with the same integral comparison and local finiteness.

**Repair:** Consume SmoothBundlesConnections B2.4 for that construction, and keep the Hamiltonian invariance, reduction and DH applications here. State any missing normalization comparison as a comparison target, not a second measure constructor. The overlap is exact on `dx∧dy` and `2dx∧dy`: B2.4's Checks give Lebesgue measure and twice Lebesgue measure, respectively. This does not require replacing Liouville measure by an unrelated Riemannian volume.

## R06 (P2) — The acceptance file omits statable headline theorems


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:182–187`, `243–246`; `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:11–15`, `123–161`.

**Claim:** The acceptance file should test the promised Schur–Horn theorem and the exact Bott–Samelson moment image, alongside other statable headlines.

**Witness:** The previous all-n Schur–Horn probe elaborated using only `import Mathlib`. Both polygon signatures elaborate again in their companion. None of these three headlines appears in `Suggested.lean`.

**Repair:** Put these statable headline signatures and only their necessary definitions in `Suggested.lean`. Inventory the other headlines in its docstring, stating each unavailable carrier precisely instead of describing the file merely as nonexhaustive. Schur–Horn must include repeated eigenvalues and n=0. The probe's statement equates the diagonals of all unitary conjugates of diag(λ) with the convex hull of all permutations of λ. Tests: λ=(2,0) gives `(2t,2−2t)` for 0≤t≤1; λ=(1,1) gives only `(1,1)`; the empty spectrum gives the unique empty tuple. No weakened substitute is needed.

## R07 (P2) — Generic orbifold classifying maps are redeclared outside their owner


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:27–52`: `orbifoldNerveSingularDiagonal`, `orbifoldClassifyingSpace`, `orbifoldNerveCoarseSimplicialMap`, `orbifoldCoarseMap`.

**Claim:** These generic constructions belong in this roadmap's acceptance test.

**Witness:** `TauCetiRoadmap/Orbifolds/README.md:507–525` on main already owns the diagonal singular model and its coarse map through the realization counit. None of the four definitions occurs in either headline theorem in `Suggested.lean`.

**Repair:** Delete these four definitions from this acceptance file and cite Orbifolds O4-T for the generic construction. Retain T4's specialization to the actual Hamiltonian level bundle. On the unit groupoid of a point both constructions give a point and the identity coarse map; on a finite isotropy group they retain BG, not just its coarse point. There is no distinct ConvexityToric construction to justify a second owner.

## R08 (P3) — All three Lean files violate the import contract


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:1–9`; `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:1–4`; `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:1–4`.

**Claim:** Acceptance files import the pinned libraries directly.

**Witness:** Suggested imports another roadmap and seven Mathlib submodules, without `import Mathlib`. Both companions also use only Mathlib subimports. These account for the gate's `imports=1`, `mathlib-subimports=7`, and `no-import-mathlib=1` failures.

**Repair:** Start each retained file with the single `import Mathlib`, followed only by individual pinned Tau Ceti modules actually used. Replace the roadmap import with native predicates or the few permitted real definitions needed by retained headlines; do not copy the supplier's API wholesale. Re-elaborate. The independent Schur–Horn probe demonstrates that this import form supports that missing headline. Earlier successful builds do not waive these failed rules; the build failure R04 persists at this head.

## R09 (P3) — Remove the companion's option override


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/BottSamelsonMomentTargets.lean:11`: `set_option autoImplicit false`.

**Claim:** The companion is an acceptance file under the same no-option rule as Suggested.

**Witness:** This is a `set_option`, although the worker's scan of Suggested alone reported `set_option=0`. A fresh scratch copy without the option elaborates successfully; the unchanged companion also prints all seven declaration signatures.

**Repair:** Delete the line. The repair was tested under default options, with only the two expected `sorry` warnings.

## R10 (P3) — Invariant-subspace stability is padding


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/FixedLocusTargets.lean:18–21`: `invariants_stable`.

**Claim:** Stability under a commuting endomorphism is a headline acceptance theorem.

**Witness:** A fresh probe of the unchanged signature closed with `exact fun v hv k => (hcomm k v).trans (congrArg J (hv k))`. Membership in `Representation.invariants` is exactly the pointwise fixed-vector equation at the pin.

**Repair:** Delete it from `Suggested.lean`/the companion acceptance material; keep the fact in the README's API, rather than proving it in place. Tested on trivial, cyclic and S₃ actions: in every case `ρ(k)Jv=Jρ(k)v=Jv` is the same direct calculation. The other two fixed-locus signatures are intermediate linear/chart statements; they do not replace a statement of the full geometric headline or an explicit missing-carrier explanation.

## R11 (P3) — Restore the required roadmap and declaration shape


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:1–32`, `334–353`; `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/Suggested.lean:57–85`; module docstrings in all three Lean files.

**Claim:** Definitions, API, Checks, dependencies and acceptance signatures can be located and matched without guessing.

**Witness:** The README has zero `*Needs:*` lines and zero `**Checks.**` lists. Facet definitions lack three discriminating Checks; required scope, supplier and layer sections and most local Lean declaration names are absent.

**Repair:** Supply the requested prose structure, per-definition API and at least three discriminating Checks, target-specific dependencies, and Examples/Dependencies endings. Give retained declarations mathematical docstrings and name them in the README; record the headline inventory in the module docstring. Concrete facet Checks: the primitive-normal interval passes; the same interval presented with normals ±2 fails the basis condition; a duplicate facet fails irredundancy; the rank-zero empty-facet presentation passes. These tests separate the intended predicate from plausible weaker predicates.

## R12 (P3) — Sources lack a manifest and claim-level locators


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:200–213`, `274–277`, `402–422`.

**Claim:** The source sample and each theorem can be verified at an exact, versioned locator.

**Witness:** There is no `sources.toml`. The projector sum is in Escobar §3.2, p. 8 (escobar lines 301–314), while the README points to §§3.3/4.1. “Knutson semester2 p72” does not identify an obtainable text. Most T1–T5 theorems only inherit a bibliography.

**Repair:** Add one manifest entry per work, including legal provenance or uncertified status, and attach exact locators to the claims. For the sample cite Escobar §3.2 p. 8 and §4.1 pp. 12–13, separately identifying the roadmap's own weighted/sign calculations; cite Cannas Theorem 27.1, p. 169, for the convex-hull input. Identify the Knutson edition/file before certifying pages 72–73. Recheck the rank-one value −2 and the `(1,1,1)` polygon against those explicit conventions. This review has not invented a theorem number for an unnumbered construction.

## R13 (P3) — Replace process-dependent supplier references


**Location:** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:20–24`, `111`, `191`, `201`, `292`.

**Claim:** The roadmap is a timeless specification citing named supplier sections.

**Witness:** Supplier links target numbered pull requests, and line 201 asks to preserve unclear diagram/arrow labels. That instruction supplies neither a mathematical object nor a stable source locator.

**Repair:** Link the named roadmap and section on its allowed main/new-roadmap contract. Remove the diagram-preservation instruction, or identify a specific diagram mathematically with a source locator. Keep the already explicit triple `(L₁,P,L)` and projection `(L₁,P,L)↦(L,P)`; these specify the same incidence test without relying on unread labels.

## Previous findings

Every status below is checked at 24f7c9f; the reviewed folder has no changed lines.

- R01 — not repaired: README:326–328 still excludes fixed points from the interior in rank zero.
- R02 — not repaired: Suggested.lean:95–104 still admits Liouville measure data; the DH headline still depends on it.
- R03 — not repaired: README:34–48 still attributes the calibrated SU(2) homomorphism to LieGroups Layer 6; that main section does not supply it, and no gap is declared.
- R04 — not repaired: Suggested.lean:1 still imports HamiltonianReduction; its line 76 still calls the removed form-valued canonicalForm. The targeted build and direct elaboration both fail.
- R05 — not repaired: README:281–285 still claims single ownership of Liouville measure, overlapping SmoothBundlesConnections B2.4.
- R06 — not repaired: Suggested.lean still omits Schur–Horn and the two statable polygon headlines, and lacks the missing-carrier inventory.
- R07 — not repaired: Suggested.lean:27–52 still defines four generic orbifold constructions owned by Orbifolds O4-T and unused by its headlines.
- R08 — not repaired: All three Lean import headers are unchanged; Suggested.lean imports another roadmap and seven Mathlib submodules without import Mathlib.
- R09 — not repaired: BottSamelsonMomentTargets.lean:11 still sets autoImplicit false.
- R10 — not repaired: FixedLocusTargets.lean:18–21 still admits invariant-subspace stability; the fresh one-tactic probe succeeds.
- R11 — not repaired: Required scope/supplier/layer structure, target-specific dependencies, definition Checks and declaration documentation remain missing.
- R12 — not repaired: There is still no sources.toml; README:274–277 retains the imprecise Escobar locator, and the Knutson text remains unidentified.
- R13 — not repaired: Numbered pull-request supplier links and README:201's unclear diagram-preservation instruction remain.

## Verified sound

This is evidence about the stated instances and interfaces, not a proof of the admitted geometric theorems.

**Scope and pins.** Verified HEAD `24f7c9f2768c70cb7cf7e2549dcba855c42a7083`, the empty target-folder diff since `086aecd2ee8c120b306733daac9c410e8382ca14`, and unchanged `lake-manifest.json` and `lean-toolchain`. Pins remain Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main supplier content is still `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. Only the two CotangentLagrangian files changed between review heads (65 insertions, 14 deletions). The prescribed outside-scope diff excluding the three authorized folders and family index is empty. The worktree is unchanged.

**Gate and elaboration.** The worker's gate is FAIL:
`sorry-data=1 imports=1 mathlib-subimports=7 no-import-mathlib=1 build=2`.
R02, R08 and R04 respectively account for every failure. The companion option is separately R09. The fresh command-line gate reproduces the four source-rule failures and reports these five scope lines:

```text
outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean
outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/AnnulusFixedPointTargets.lean
outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
```

These five lines are false positives for this brief, which explicitly authorizes both siblings and assigns their independent reviews elsewhere. No other outside-folder edit was found.

The command-line gate did not run a build. Separately ran `lake build TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested`: exit 1, with `HamiltonianReduction/Suggested.lean:76:39: Invalid argument name M for function`. Direct `lake env lean` of the reviewed `Suggested.lean` also exits 1: the HamiltonianReduction object file is missing after that failure. No build success is claimed.

**Dependency check, rerun at this head:**

```text
depcheck: 205 roadmaps, 1547 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The README still has zero literal `*Needs:*` lines (R11); a clean dependency graph does not certify R03's absent supplier contract.

**Elaborated signatures and padding.** Prepared scratch copies with `#check @name` for all 23 explicit declarations: 13 in Suggested, seven in BottSamelsonMomentTargets and three in FixedLocusTargets. The two companion copies elaborate and print all ten signatures, with only their five expected `sorry` warnings. The positive-weight, rank/incidence, commuting-endomorphism, invariant-source and chart-membership hypotheses are present. No binder changed. Suggested's 13 checks cannot pass its broken import; the earlier successful audit is inherited evidence only.

The fresh `invariants_stable` probe closes with
`exact fun v hv k => (hcomm k v).trans (congrArg J (hv k))`.
The other two admissions remain, so the probe has exactly two expected sorry warnings. A fresh BottSamelson copy with the option removed elaborates with only its two expected sorry warnings. The previous one-tactic audit of the other six unchanged admitted theorems and the all-n Schur–Horn statability probe are carried forward; their statements and pins did not change.

**Changed sibling passages.** CotangentLagrangian now explains why its chart identity determines the form, citing the actual pinned `SmoothTwoForm.inChartAt_extChartAt_self`; this citation resolves at `TauCeti/Geometry/Manifold/TwoForm/Closed.lean:99`. Its existential form statement is unchanged. Therefore it still supplies no term named `canonicalForm` for HamiltonianReduction:76. The new matrix realification and four C2.1 group signatures elaborate as part of the targeted build, but do not change ConvexityToric's carriers or repair that call. They agree with the family index's existing allocation of those matrix applications to C2.1. The recurrence interface remains measure-parametrized and still creates no new Liouville constructor. These observations assess dependency effects; they are not a verdict on the sibling roadmap.

**Headline inventory.** T1: integral period/character/rank-one normalization; invariant-metric fixed loci and equivariant local forms. T2: moment-component Morse–Bott topology, rational perfection and the stated integral consequences. T3: torus convexity/connected fibers; Kirwan chamber convexity; norm-square gradient convergence/retraction; Kostant projection/Schur–Horn; the word121 moment image and its boundary comparison. T4: Liouville construction/invariance; DH absolute continuity, chamberwise polynomial density and reduced-class variation. T5: toric fibers and Delzant necessity/existence/uniqueness; integral toric cohomology/class formula; weighted reductions and labeled-orbifold classification. Suggested presently states only DH absolute continuity and Delzant necessity, the former through admitted data. The polygon signatures are in a companion. The docstrings do not give the required list of nonstatable headlines; R06 addresses that acceptance gap. No claim is made that all geometric headlines can be expressed by only a few definitions at these pins.

**Seeded source sample — carried forward from [the previous report][prior].** Both selected passages are unchanged. No source was newly fetched or certified this round; the zero-line incremental instruction carries these readings forward.

- “Forms and the projector formula”: the published Escobar article, §3.2 p. 8, escobar lines 301–314, has the unnumbered projector construction; §4.1 pp. 12–13, escobar lines 439–488, supplies the orbit/product restriction. It does not itself provide arbitrary positive weights, the −2π calibration or these six inequalities. Those are the roadmap's calculations, tested in A47–A54 and A65–A70.
- “Fixed points and exact image”: Cannas Theorem 27.1, printed p. 169, cannas lines 6470–6479, assumes a compact connected symplectic manifold and Hamiltonian torus action; effectiveness is unnecessary. It supplies the fixed-component convex hull and connected fibers. The positive weights and supplied projective incidence manifold meet those hypotheses. The explicit inequalities were checked separately by all eight flags and the six vertices.
- The unchanged additional readings remain inherited evidence: cannas lines 6630–6662 (Homework 21, exercise 2, p. 174); lerman-gradient lines 117–175 and 222–247 (Theorem 1.1 and proof, preprint p. 3); hnp lines 425–451 and 498–549 (Theorems 3.4/4.1, pp. 132–134). Their source issues remain listed below. Knutson pages 72–73 remain unverified.

**Adversarial values — 106 unchanged rows carried forward.** Every A-row cites [the previous report][prior], which in turn identifies the original computation. There are no changed mathematical statements in ConvexityToric. Finding numbers are unchanged. Coordinates e₁,e₂,e₃ are one-based in prose and 0,1,2 in Lean; S=a+2b+c and J₀(q,p)=(-p,q).

| Statement | Instances tried | Values computed on the two sides | Result / change | Evidence |
| --- | --- | --- | --- | --- |
| A01 T1 torus period and weight definition | Circle; trivial torus | ker(exp)=2πℤ, Λ=ℤ, χₖ derivative=ik; in rank 0 all three are zero | Pass; use supplier gap R03 for general calibration | [Previous A01][prior] |
| A02 character integral pairing | k=−2, λ=6π | αχ(λ)/(2π)=−6, an integer; on Λ, αχ(3)=−6 | Pass | [Previous A02][prior] |
| A03 weight-lattice Haar normalization | Circle; basis 1 versus 2 | covolume ℤ=1; interval [0,1] has mass 1; basis 2 gives mass 1 to [0,2] | Pass; a basis choice changes normalized Haar as expected | [Previous A03][prior] |
| A04 restriction/quotient/basis change | T², character (2,−1), diagonal circle | restriction weight 1; quotient character (1,−1) restricts to 0; swapping basis sends (2,−1) to (−1,2) | Pass | [Previous A04][prior] |
| A05 coroot/rank-one normalization | SU₂ diagonal H | α(H)=2, d(id)(H)=H, exp(2πH)=I | Numeric calibration passes; missing contract R03 | [Previous A05][prior] |
| A06 central isogeny lattice index | U₂ diagonal torus | center and coroot vectors (1,1),(1,−1) have determinant −2; index in ℤ² is 2 | Pass; a direct integral splitting would give index 1 | [Previous A06][prior] |
| A07 fixed-set definition, closedness, tangent | Irrational rotation on first factor of ℂ² | fixed points and fixed tangent vectors both `{0}×ℂ`; real dimension 2 | Pass | [Previous A07][prior] |
| A08 fixed components may have different dimensions | Circle on ℂP² with weights (0,0,1) | fixed set ℂP¹ disjoint union a point; dimensions 2 and 0 | Pass | [Previous A08][prior] |
| A09 arbitrary-group fixed locus | S₃ permutes ℂ³; cyclic 3-cycle | common invariants in either case are `(z,z,z)`; restricted standard form is 3 dx∧dy | Pass; nonabelian and cyclic cases | [Previous A09][prior] |
| A10 metric hypothesis negative control | Shear A=[[1,1],[0,1]] | fixed line p=0 has restricted form 0; AᵀQA=Q forces Q₁₁=0, contradicting positivity | Pass; shear excluded | [Previous A10][prior] |
| A11 polar A,J definition | Standard metric, ω=dx∧dy; 2ω | A=J₀ or 2J₀; J=A(−A²)⁻¹/²=J₀ in both cases; J²=−I | Pass; unnormalized A fails for 2ω | [Previous A11][prior] |
| A12 positivity and K invariance of J | v=(1,2); rotations | ω(v,J₀v)=5>0; RJ₀v=J₀Rv; replacing J₀ by −J₀ gives −5 | Pass | [Previous A12][prior] |
| A13 fixed restriction, normal, naturality | ℂ² rotating first coordinate | tangent second ℂ, symplectic normal first ℂ; restriction dx₂∧dy₂ and direct-sum form match | Pass | [Previous A13][prior] |
| A14 exponential chart and total geodesy | Euclidean rotation, exp₀(v)=v | fixed vectors map identically to fixed points; a straight geodesic in fixed plane stays there | Pass; no completeness used locally | [Previous A14][prior] |
| A15 compact averaging and relative normal form | Finite rotations; zero section in product normal bundle | averaged Euclidean metric stays I; product symplectic chart is identity with pullback ω=ω | Pass on model; full equivariant Moser remains a target | [Previous A15][prior] |
| A16 `invariants_stable` | Trivial representation; S₃ example | ρ(k)Jv=Jρ(k)v=Jv | Pass; padding R10 | [Previous A16][prior] |
| A17 `invariants_symplectic` | Fixed diagonal ℂ; zero space | matrix of restriction [[0,3],[−3,0]], determinant 9; in zero space radical={0} | Pass | [Previous A17][prior] |
| A18 alternating/positivity laws discriminate wrong models | ω=0 on ℝ²; J=−J₀; J=2J₀ | positivity gives 0 or −‖v‖² in first two, failing; last gives 2‖v‖² and nondegeneracy despite J²=−4I | Pass; hJ is stronger than this intermediate lemma needs | [Previous A18][prior] |
| A19 `fixed_iff_chart_invariant`, both directions | Identity chart on unit ball, rotations | origin: both true; nonzero rotated vector: both false; e injective converts equality back to ρ(k)v=v | Pass; source membership retained | [Previous A19][prior] |
| A20 local weight/moment formula | Weight +1 and weight −1 on ℂ | X=(-p,q) contracts dq∧dp to −q dq−p dp=d(−r²/2); reversed action gives +d(r²/2) | Pass; local cone understood as a germ | [Previous A20][prior] |
| A21 index/coindex and zero weights | Weights (+1,−1,0), ξ=1 | Hessian diag(−1,−1,1,1,0,0); index=2, coindex=2, fixed tangent dimension=2 | Pass | [Previous A21][prior] |
| A22 stabilizer, orbit rank, slice | Weight k on nonzero ℂ; torus T² acting only first factor | stabilizer μₖ, orbit rank 1; ineffective second torus has rank 0 action | Pass; slice retains stabilizer directions | [Previous A22][prior] |
| A23 generic versus arbitrary moment component | Sphere; trivial ξ; irrational ξ in T² | generic sphere height has two critical points; ξ=0 has Crit=M; irrational closure is T², not an embedded line subgroup | Pass | [Previous A23][prior] |
| A24 even-index scalar-level connectedness | Sphere height h∈[−1,1] | interior fibers S¹; endpoint fibers points; outside fibers empty, all connected as sets | Pass | [Previous A24][prior] |
| A25 rational Morse–Bott perfection | S²×Σ_g, rotation on S² | critical components two Σ_g; Poincaré polynomial `(1+t²)(1+2gt+t²)` equals their shifted sum | Pass; π₁=π₁Σ_g prevents isolated-point conclusions | [Previous A25][prior] |
| A26 universal torus class convention | Standard/dual Hopf character; weight 2χ | standard class −h, dual +h, weight 2 gives −2h | Pass against CC and SBC | [Previous A26][prior] |
| A27 Borel, Thom/Euler, localization | Point; complex weight-one line | H*_T(pt;ℤ)=ℤ[u]; Euler=u=−h; after inverting u, multiplication by u is invertible | Pass on basic model | [Previous A27][prior] |
| A28 integral formality with free/even hypothesis | S²; point | ranks over H*(BT) are 2 and 1; Hodd=0 in both | Pass | [Previous A28][prior] |
| A29 isolated fixed points, counts and π₁ | ℂP² generic height; point | indices 0,2,4, Betti numbers 1,1,1, π₁=0; point has one index-0 extremum | Pass | [Previous A29][prior] |
| A30 coadjoint root-height isolation | SU₂ orbit with nonzero radius; central orbit | Weyl fixed set has 2 points; central orbit has 1; repeated-eigenvalue tangent root planes disappear | Pass | [Previous A30][prior] |
| A31 torus convexity and connected fibers | Standard S²; trivial action on connected M | image [−1,1]=conv{−1,1}; trivial image {c}=conv{c}, fiber M | Pass; disconnected two spheres would violate fiber assertion | [Previous A31][prior] |
| A32 fixed components rather than fixed points | S²×Σ_g | fixed set two Σ_g, fixed images two endpoints; hull is entire interval | Pass | [Previous A32][prior] |
| A33 product, shift and subtorus restriction | Two height spheres; diagonal subcircle; shift b | square [−1,1]², diagonal-circle image [−2,2], translated square b+[−1,1]² | Pass | [Previous A33][prior] |
| A34 effective affine dimension | Effective circle on S²; extra trivial circle | dimensions of moment images 1 and 1, torus dimensions 1 and 2 | Pass; full dimension requires effectiveness | [Previous A34][prior] |
| A35 isotropic orbits and regular reduction | Standard T² on ℂ² at positive radii | orbit dimension 2, ω restricts to 0, level dimension 2, reduced dimension 4−4=0 | Pass | [Previous A35][prior] |
| A36 Kirwan chamber image and fibers | SU₂ coadjoint sphere radius r>0 | full image sphere, nonconvex; chamber intersection {r}, orbit-projected fiber whole sphere connected | Pass; commutator directions matter | [Previous A36][prior] |
| A37 central factor in chamber | U₂ orbit eigenvalues (3,1) | central coordinate fixed at trace 4, semisimple chamber coordinate 1; both give singleton chamber image | Pass | [Previous A37][prior] |
| A38 symplectic cross-section | SU₂ sphere away from zero chamber wall | cross-section at positive chamber is one point; centralizer is circle, same moment value r | Pass on model | [Previous A38][prior] |
| A39 norm-square polynomial and gradient inequality | One complex slice, f=r⁴/4 | ‖∇f‖=r³=4^(3/4) f^(3/4); exponent lies in (0,1) | Pass | [Previous A39][prior] |
| A40 gradient tail and limiting retraction | Same slice, r′=−r³ | total remaining length=r₀; bound f₀^(1/4)/(4^(3/4)/4)=r₀; limit=0 | Pass; constant f has stationary trajectories and tail 0 | [Previous A40][prior] |
| A41 Kostant compact projection | SU₂ sphere; central point | torus projection [−r,r]=conv{−r,r}; central projection {c}=conv{c} | Pass | [Previous A41][prior] |
| A42 Schur–Horn both directions and majorization | Spectrum (2,0), diagonal (2t,2−2t) | trace=2; largest diagonal≤2 iff 0≤t≤1; matrix [[2t,2√(t(1−t))],[2√(t(1−t)),2−2t]] has trace 2, determinant 0 | Pass; missing headline R06 | [Previous A42][prior] |
| A43 repeated/empty spectra and rank-one simplex | (1,1), empty λ, rank-one projector in ℂ³ | orbit diagonal singleton (1,1); empty tuple singleton; projector diagonal nonnegative with sum 1 | Pass | [Previous A43][prior] |
| A44 incidence carrier and π | P≠P₀; P=P₀ | unique L₁=P∩P₀ in first case; all L₁∈ℂP¹ in second; π fibers point or ℂP¹ | Pass; supplied carrier used, not reconstructed | [Previous A44][prior] |
| A45 torus preservation versus ambient U₃ | Diagonal t; unitary swapping e₂,e₃ | tP₀=P₀; swap sends P₀=12 to 13 | Pass; no full U₃ action on X | [Previous A45][prior] |
| A46 `V3`, `initialPlane` | e₁,e₂,e₃; zero vector | dimensions 3 and 2; e₁,e₂,0 lie in P₀, e₃ does not | Pass | [Previous A46][prior] |
| A47 `projectorDiagonal` definition | U=0, U=ℂ³, span(e₁+e₂) | diagonal (0,0,0), (1,1,1), (1/2,1/2,0); traces 0,3,1 | Pass; zero map would fail last two | [Previous A47][prior] |
| A48 projector chart/orbit comparison | L(z)=span(1,z), z=0,1 | P(0)=diag(1,0); P(1)=1/2[[1,1],[1,1]]; P²=P in both | Pass; denominator 1+\|z\|²>0 | [Previous A48][prior] |
| A49 KKS versus Fubini–Study sample | ξ=[[0,−1],[1,0]], η=[[0,i],[i,0]], P=diag(1,0) | −i tr(P[ξ,η])=−2; ω_FS(∂x,∂y)=1/π, so −2πω_FS=−2 | Pass; sign and 2π factor fixed | [Previous A49][prior] |
| A50 rank-two Plücker comparison | Plane span(e₁,e₂+z e₃) | varying projector block has same −2 at z=0; Plücker line has ω_FS=1/π there | Pass | [Previous A50][prior] |
| A51 weighted product form | a=b=c=1, nonzero holomorphic tangent | −ω(v,iv)=2π(sum of positive factor squared norms)>0; all zero weights give form 0 | Pass; positive weights prevent degeneracy | [Previous A51][prior] |
| A52 `moment` contraction and trace | Coordinate flag row 1; variation rotating first line | μ=(a+b+c,b,0), trace=a+2b+c; contraction is weighted sum of the three factor differentials | Pass; no independent ambient action asserted | [Previous A52][prior] |
| A53 torus kernel and effective dimension | All diagonal scalars; phases (1,−1,1) | scalars fix every subspace; latter moves span(e₁+e₂); effective dimension 3−1=2 | Pass; all mixed lines force all phases equal | [Previous A53][prior] |
| A54 negative-form convention | Replace ω by −ω | contraction and μ both change sign; sample vertex (3,1,0) becomes (−3,−1,0) | Pass | [Previous A54][prior] |
| A55 eight fixed flags, exhaustive enumeration | L₁=e₁ or e₂; coordinate P containing it; L coordinate in P | 2×2×2=8 flags; L₁=e₃ fails incidence | Pass | [Previous A55][prior] |
| A56 `fixedMoment`, row 1 | (e₁,12,e₁) | projector sum=(a+b+c,b,0), exactly listed | Pass | [Previous A56][prior] |
| A57 `fixedMoment`, row 2 | (e₁,12,e₂) | projector sum=(a+b,b+c,0), exactly listed | Pass | [Previous A57][prior] |
| A58 `fixedMoment`, row 3 | (e₁,13,e₁) | projector sum=(a+b+c,0,b), exactly listed | Pass | [Previous A58][prior] |
| A59 `fixedMoment`, row 4 | (e₁,13,e₃) | projector sum=(a+b,0,b+c), exactly listed | Pass | [Previous A59][prior] |
| A60 `fixedMoment`, row 5 | (e₂,12,e₁) | projector sum=(b+c,a+b,0), exactly listed | Pass | [Previous A60][prior] |
| A61 `fixedMoment`, row 6 | (e₂,12,e₂) | projector sum=(b,a+b+c,0), exactly listed | Pass | [Previous A61][prior] |
| A62 `fixedMoment`, row 7 | (e₂,23,e₂) | projector sum=(0,a+b+c,b), exactly listed | Pass | [Previous A62][prior] |
| A63 `fixedMoment`, row 8 | (e₂,23,e₃) | projector sum=(0,a+b,b+c), exactly listed | Pass | [Previous A63][prior] |
| A64 `incidence_moment_range` | All weights 1; L₁=(e₁+e₂)/√2, P=span(L₁,e₃), L=e₃ | μ=(1,1,2), midpoint of rows 4 and 8; coordinate flags give all six hull vertices | Pass on instances; general equality uses T3, compactness and symplecticity | [Previous A64][prior] |
| A65 `fixedMoment_convexHull`, both inclusions | Weights (1,1,1) | box/trace vertices `(3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0)` equal six fixed rows; all eight rows satisfy bounds | Pass; exact rational vertex enumeration | [Previous A65][prior] |
| A66 exact inequalities, unequal weights | (a,b,c)=(2,1,3) | S=7; bounds (6,6,4); vertices `(6,1,0),(6,0,1),(3,0,4),(0,3,4),(0,6,1),(1,6,0)` on both descriptions | Pass | [Previous A66][prior] |
| A67 exact inequalities, fractional weights | (1/2,3/2,2) | S=11/2; bounds (4,4,7/2); vertices `(4,3/2,0),(4,0,3/2),(2,0,7/2),(0,2,7/2),(0,4,3/2),(3/2,4,0)` on both descriptions | Pass | [Previous A67][prior] |
| A68 strict edge coefficients and collision | (1,1,1); (2,1,3); fractional case | row-6 coefficients (1/2,1/2), (3/5,2/5), (4/5,1/5); denominators a+c positive; distinct images 7,8,8 | Pass; rows 2/5 collide iff a=c | [Previous A68][prior] |
| A69 six facets/extreme points and complexity | All positive weights | every pair of adjacent listed vertices shares one saturated bound; edge lengths nonzero; dimℝX/2−dimTeff=3−2=1 | Pass; fixed values need not be vertices | [Previous A69][prior] |
| A70 boundary a=0 | b=c=1 | hull is permutations of (2,1,0); π-exceptional ℂP¹ has pulled-back form 0 on its tangent | Pass; no symplectic convexity applied to degenerate X form | [Previous A70][prior] |
| A71 Liouville density and orientation | ℝ², ω=dx∧dy, 2ω, −ω | positive measure densities 1,2,1 against dxdy; symplectic orientation changes for −ω | Mathematical target sound; admitted-data defect R02 and owner R05 | [Previous A71][prior] |
| A72 local finiteness, chart formula and invariance | Unit square; dilation f(x,y)=(2x,y/2); product squares | masses 1,1,1; det Df=1; product top form ω²/2 gives product measure | Pass on models | [Previous A72][prior] |
| A73 proper pushforward | μ=r²/2 on ℂ | inverse image [0,c] is disk radius √(2c), mass 2πc; bounded intervals have finite pushforward | Pass | [Previous A73][prior] |
| A74 DH absolute continuity and ineffective support | Sphere height; sphere plus trivial second circle | density 2π on [−1,1]; in ℝ² support is a line, ambient Lebesgue mass 0 but DH mass 4π | Pass; effectiveness condition load-bearing | [Previous A74][prior] |
| A75 chamber degree and reduced-volume density | Toric n=m=1; diagonal action on ℂ² | degree 0 density 2π; for ℂ² degree 1 density 4π²c=(2π)(2πc) | Pass | [Previous A75][prior] |
| A76 retained-arrow level bundle formulas | Arrow h:x→hx, coordinates t∈T, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹t⁻¹x | Pass; source/target and right-action conventions agree | [Previous A76][prior] |
| A77 connection sign and curvature | Hopf level c>0 | α(ξright)=1, α(ξleft)=−1; ∫F=2π; replacing α by −α gives −2π | Pass | [Previous A77][prior] |
| A78 classifier, Chern and real symplectic class | Hopf CP¹; irrational c=√2 | dual h pairs to 1, standard u to −1; [F/(2π)]=h; [ω]=2π√2 h need not be rational | Pass; integral descent not inferred | [Previous A78][prior] |
| A79 coarse/full inverse-isotropy integration | Generic ineffective order k=2 | integral of unit volume point is 1/2 full, 1 effective; effective=2·full | Pass | [Previous A79][prior] |
| A80 reduced-class variation and transport | Hopf c₀=1,c=3 | [ω₃]−[ω₁]=4πh=(3−1)[F]; derivative of area=2π | Pass; sign agrees with λhorizontal−cα | [Previous A80][prior] |
| A81 locally free chamber transport | Circle weight k on ℂ, c>0 | reduced orbifold is [point/μₖ] throughout chamber; density 2π/k throughout | Pass; isotropy retained | [Previous A81][prior] |
| A82 critical values and density walls | Standard circle on ℂ | density 2π for c>0, 0 for c<0; critical value {0} has Lebesgue mass 0 | Pass; global smoothness would fail | [Previous A82][prior] |
| A83 sphere and standard orthant DH | h∈[−1,1]; ℂ² separate rotations | total sphere mass 4π=2π·2; rectangle [0,c₁]×[0,c₂] mass (2π)²c₁c₂ | Pass | [Previous A83][prior] |
| A84 toric volume and simplex/products | CP² simplex side c; rectangle sides c,d | simplex volume c²/2 gives symplectic volume 2π²c²; rectangle gives 4π²cd | Pass | [Previous A84][prior] |
| A85 generic nerve/realization/coarse definitions | Unit groupoid of point; finite group C₂ over point | diagonal Sing gives point or BC₂; coarse target is point in both, H¹(BC₂;F₂)=F₂ versus H¹(point;F₂)=0 | Definitions retain isotropy; remove duplicate unused declarations, R07 | [Previous A85][prior] |
| A86 facet pairing and region | N=ℤ→ℝ, normals +1,−1, supports 0,−L | pairings x,−x; inequalities give 0≤x≤L; at x=−1 first inequality fails | Pass | [Previous A86][prior] |
| A87 smooth-vertex predicate | Same interval; normals doubled | endpoint active bases +1 or −1 pass; ±2 generate index-2 subgroup, fail | Pass | [Previous A87][prior] |
| A88 Delzant compact/full/irredundant predicate | L>0; L=0; duplicate facet; positive-rank d=0 | interval passes; singleton in ℝ has empty interior; duplicate cannot be sole active facet; empty inequalities give unbounded ℝ | Pass | [Previous A88][prior] |
| A89 rank-zero Delzant presentation | N=V=0, d=0 | region={0}=univ, compact, interior nonempty, empty basis spans zero, no irredundancy obligations | Pass; exposes R01 | [Previous A89][prior] |
| A90 toric fibers, freeness, face stabilizers | S² circle; point trivial torus | latitude fibers single circles, poles points; interior stabilizer trivial; point stabilizer is trivial group | Pass | [Previous A90][prior] |
| A91 fixed points never over interior | Zero-dimensional toric point; sphere | point: fixed=true and interior=true; sphere poles: fixed=true, interior=false | FAIL as written; R01 adds n>0 only to exclusion | [Previous A91][prior] |
| A92 Delzant lattice exact sequence and regularity | Interval [0,L] | ℤ²→ℤ, (u,v)↦u−v, surjective; kernel diagonal ℤ; level r₁²+r₂²=2L has free diagonal circle | Pass for L>0 | [Previous A92][prior] |
| A93 Delzant reconstruction/moment image | Same interval | reduction CP¹ has μ=r₁²/2∈[0,L], area 2πL | Pass; L=0 excluded by positive-dimensional full interior | [Previous A93][prior] |
| A94 Delzant uniqueness, shifts and GL(n,ℤ) | Interval shifted by b; reflection x↦−x | shift adds b to μ with form unchanged; reflection relabels circle by inversion, not its identity | Pass | [Previous A94][prior] |
| A95 toric cohomology/facet symplectic class | Interval normals (1,−1), supports (0,−L) | D₁=D₂=h, D₁D₂=0, ring ℤ[h]/h²; −2πΣλD=2πLh | Pass | [Previous A95][prior] |
| A96 higher-dimensional cohomology and blowup examples | CP²; product spheres; corner chop size δ | ℤ[h]/h³, ℤ[x,y]/(x²,y²); triangle area decreases by δ²/2, symplectic volume by 2π²δ² | Pass on stated models; Hirzebruch surface retains two degree-2 generators and b₂=2 | [Previous A96][prior] |
| A97 weighted flow and least periods | (a,b)=(2,3), ε=1 | generic period 2π; first/second axis periods π and 2π/3; zero point excluded by ε>0 | Pass | [Previous A97][prior] |
| A98 ellipsoid to S³ map | (2,3), ε=1 | \|√(a/(2ε))z₁\|²+\|√(b/(2ε))z₂\|²=(a\|z₁\|²+b\|z₂\|²)/(2ε)=1 | Pass; positive square-root denominators | [Previous A98][prior] |
| A99 two slice domains and stabilizers | (2,3), ε=1 | first radius √(2/3), group μ₂ acts by −1; second radius 1, μ₃ acts by exp(−4πi/3); center stabilizers 2,3 | Pass; away from centers stabilizers 1 | [Previous A99][prior] |
| A100 slice overlap and order-one cases | Both coordinates nonzero; (1,2) | phase changes differ by exactly retained cyclic rotations; first center has order 1, second order 2 | Pass; ordinary point distinguished from cone point | [Previous A100][prior] |
| A101 coarse power map, invariance and orbit separation | (2,3); generic phases | z₁³ and z₂² both acquire e^(−6iθ); relative phase 3φ₁−2φ₂ is invariant; endpoints give [1:0],[0:1] | Pass; coprimality identifies all phase ambiguity with an orbit | [Previous A101][prior] |
| A102 slice reduced forms | First slice y₁=0; second slice y₂=0 | pulled-back dx₁∧dy₁=0 or dx₂∧dy₂=0, leaving standard dw or du area form | Pass | [Previous A102][prior] |
| A103 weighted area and Hopf comparison | (2,3), ε=1; (1,1), ε=1/2 | (1/2)π(2/3)=π/3=2π/(2·3); Hopf area π | Pass; inverse-stabilizer factor essential | [Previous A103][prior] |
| A104 labeled orbifold smoothness | Label 2 at a primitive ray; unit labels on determinant-2 cone | isotropy μ₂ in either case; unit labels alone do not imply smoothness | Pass; both conditions required | [Previous A104][prior] |
| A105 actual `dh_absolutelyContinuous` signature | Intended sphere measure versus admitted zero model | intended DH([−1,1])=4π; zero model gives 0 and still 0≪Leb | Acceptance fails to discriminate R02, despite correct theorem hypotheses | [Previous A105][prior] |
| A106 actual `toricImage_delzant` signature | Sphere/interval; point/rank 0 | primitive lattice produces interval presentation; zero lattice produces empty-facet point presentation | Pass on models; period and dimension binders present | [Previous A106][prior] |

The changed dependency passages were additionally tested as follows. The C2.1 rows cover the added sibling statements as dependency sanity checks, not a replacement for that folder's own review.

| Statement/interface | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| B01 Cotangent chart-centre determination | T*ℝ; v₀=(1,0), v₁=(0,1), then reverse the pair | Both the intrinsic form and its centre chart expression evaluate to 1; reversing gives −1 on both. The zero form gives 0 and fails. | Pinned centre identity validates the added explanation; it does not produce the old canonicalForm declaration. |
| B02 New realify definition and J convention | n=1, A=2+3i; A=i; n=0 | Matrix [[2,−3],[3,2]] sends (1,0) to (2,3), matching (2+3i)·1. realify(i)=[[0,−1],[1,0]], square −I. Empty matrices map to the unique empty matrix. | Same real/complex convention; no ConvexityToric signature changes. |
| B03 Unitary maximal compact signature | n=0; n=1, U=e^(iθ), positive factor 2 | At n=0 both groups are singleton. At n=1 U has modulus 1; the proposed enlargement by 2 contains powers of modulus 2^k, unbounded and therefore not compact. | Maximal predicate includes compactness; these instances discriminate compactness from an arbitrary enlargement. |
| B04 Realified unitary maximality in Sp | n=1, rotation Rθ and P=diag(2,1/2); n=0 | RθᵀJRθ=J, RθᵀRθ=I. PᵀJP=J but PᵀP=diag(4,1/4); tr(P^k)=2^k+2^(−k) is unbounded. Rank zero has only identity. | Symplectic positive factors outside U(1) cannot lie in the indicated compact subgroup. |
| B05 GL(n,ℂ) connectedness signature | n=0; n=1, z=−2 | Rank-zero group has one point. Path 2^t exp(iπt) has endpoints 1,−2 and modulus 2^t>0 throughout. | Native units carrier retains invertibility; no new CT prerequisite. |
| B06 Sp(2n,ℝ) connectedness signature | n=0; n=1, A=−diag(2,1/2) | Path diag(2^t,2^(−t))R_(πt) starts I, ends A, and satisfies A_tᵀJA_t=J for every t; rank zero is singleton. | Matrix-subset signature matches the prose; no new CT prerequisite. |
| B07 Acceptance import after sibling edits | HamiltonianReduction:76 with named M argument | Previously and now: supplier gives ∃ σ, symplectic σ ∧ chart identity, while consumer requests a form-valued canonicalForm I. Fresh targeted-build and direct-elaboration exit codes are both 1. | R04 persists; additions did not repair the removed term. |

**Pinned declarations reopened — eleven files.** Paths are relative to the indicated library repository at the pins.

- `Mathlib/RepresentationTheory/Invariants.lean:73–80`: `Representation.invariants` and `mem_invariants` are pointwise fixed-vector equations. They require no group topology, compactness or finite dimension.
- `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:128–132`: `Submodule.starProjection` is the ambient orthogonal projector, requiring `HasOrthogonalProjection`.
- `Mathlib/LinearAlgebra/UnitaryGroup.lean:55–62`: `Matrix.unitaryGroup` is the unitary submonoid with a group instance; the unchanged Schur–Horn probe uses this actual carrier.
- `Mathlib/Algebra/Module/ZLattice/Basic.lean:431–436`: `IsZLattice` requires discrete topology and full span. `Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean:250–266`: `Module.Basis.addHaar` normalizes the basis parallelepiped to mass 1.
- `Mathlib/Topology/Connected/Basic.lean:703–709`: `ConnectedSpace` includes nonemptiness; empty M is excluded. `Mathlib/Topology/OpenPartialHomeomorph/Defs.lean:51–60`: the native carrier is a partial homeomorphism with open source and target; it does not supply equivariance.
- `TauCeti/Geometry/Toric/Algebraic/Lattice.lean:84–98`, `117–124`: `Toric.IsIntegralLattice` requires finite freeness and scalar extension and implies injectivity.
- `TauCeti/Geometry/Manifold/TwoForm/Basic.lean:59–68` and `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:90–103`: a smooth alternating section, then closedness and nondegeneracy. These structures supply neither a Liouville measure nor compactness/Borel/separation hypotheses.
- Additionally, `TauCeti/Geometry/Manifold/TwoForm/Closed.lean:85–103` was opened for B01: `inChartAt` and `inChartAt_extChartAt_self` identify chart-centre and intrinsic values. This verifies the changed sibling's new citation.

The previous report's additional spectrum, projection-instance and Riemannian-volume inspections are inherited evidence, not new inspections here.

**Ownership and suppliers.** Repeated the object search with `roadmaps grep`, narrowed to Liouville measures, calibrated rank-one maps and diagonal singular classifying models. The main copies confirm R03, R05 and R07. The prior full search of board packages and supplied open heads is carried forward for unchanged constructions; there is no new ConvexityToric construction to audit. Existing roadmaps' open revisions are not substituted for their main contracts. Supplier passages below were reopened at main or in the authorized family worktree; the main content commit is unchanged.

Resolved supplier citations:

| Supplier citation | Read location and resolution |
| --- | --- |
| Family conventions; HamiltonianReduction R2/R3/R3.1 | `TauCetiRoadmap/SymplecticGeometry/README.md:25–44`; `HamiltonianReduction/README.md:127` onward and its R3/R3.1 sections: same contraction/KKS sign, coadjoint/reduction and slice ownership. The sibling Lean predicates at `HamiltonianReduction/Suggested.lean:21–43` supply the currently imported signature, but that roadmap import is prohibited by R08. |
| HeegaardFloer F2.1 | `TauCetiRoadmap/HeegaardFloer/README.md:2081–2130`: ordinary Darboux, domain-local Moser, family primitives and compatible structures. Equivariant/fixed-component specializations remain here. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md`, layers for differential forms, flows, orientation/integration and de Rham comparison, particularly §5.5 and §12.4 as cited by SBC B2.4. CT must cite the individual consumed sections under R11. |
| LieGroups Layer 6 | Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:383–405`: tori/conjugacy/Weyl integration resolve; the extra normalized rank-one contract does not, R03. |
| RootSystems Layer 4 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319`: abstract chamber/fundamental-domain targets resolve; this is not the missing compact Lie realization. |
| SmoothBundlesConnections | `TauCetiRoadmap/SmoothBundlesConnections/README.md:776–800`, `1668–1704`: density/Liouville owner and dual-character Chern normalization resolve. Hopf pairs to +1 for the dual character, −1 for the standard character. R05 removes the overlap. |
| AlgebraicTopology; CharacteristicClasses C1–C3 | Ordinary cellular/singular cohomology and its products/duality at `TauCetiRoadmap/AlgebraicTopology/README.md`; `TauCetiRoadmap/CharacteristicClasses/README.md:211` (C1), `550` (C2), `720` (C3), with C1.5's torus normalization: these supply ordinary universal-bundle and Thom/Euler inputs, not CT's Hamiltonian equivariant perfection. |
| Orbifolds O1–O5, O4-N/S/R/K/W/T | `TauCetiRoadmap/Orbifolds/README.md:83`, `296–419`, `507–542`, `672` onward: proper étale models, retained ineffective isotropy, classifying/coarse/real-form comparisons and weighted integration resolve. Its O7 is a later comparison, not a required CT input. R07 removes the redundant generic Lean definitions. |
| MorseTheory M1–M5 | `TauCetiRoadmap/MorseTheory/README.md:611–642` (M5) and earlier M1–M4: ordinary Morse–Bott normal form/attachments and compact deformation resolve. Moment specialization remains T2. |
| HopfRinow | `Completed/HopfRinow/README.md:521–529`: smooth Riemannian isometries transport geodesics/exponential maps. This is the precise local input needed for fixed loci; bare metric isometries are not being substituted. |
| GeometricTopology Layer 1 | `TauCetiRoadmap/GeometricTopology/README.md:177–221`: generic tubular neighborhoods resolve. Equivariance needs CT's additional construction. |
| SchubertGeometry S2/word121 and complex realization | Main `TauCetiRoadmap/SchubertGeometry/README.md:38–45`, S9.1, `140`: all-word flag-chain carrier/maps, compact/complex realization, eight subwords and word121 exceptional fibers resolve at the existing owner. The expanded open revision is not used as a replacement main supplier. Point CT explicitly to S9.1 for the manifold comparison and to the main word121 target. |
| ComplexKahlerGeometry K7.2 | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:88–89`, `1444–1453`: positive area-one FS and Plücker/projective forms resolve; rank-one evaluation is 1/π in affine coordinates. |
| AnalyticToricGeometry | `Completed/AnalyticToricGeometry/README.md` and pinned `TauCeti.Toric.IsIntegralLattice`: lattice and cone/fan ownership resolves. Symplectic classification is distinct. |
| CotangentLagrangian and IntegrableSystems | CotangentLagrangian/README.md:348–365 retains the supplied-measure recurrence interface; its C4 retains the R3/T4 coisotropic application. IntegrableSystems/README.md:14–16 still consumes T1 period normalization. The still-absent cotangent form term keeps the imported HamiltonianReduction declaration broken (R04). |


The main-branch roadmap examples read for shape were SmoothBundlesConnections B2.4/B6.2 and HeegaardFloer F2.1, alongside the completed HopfRinow transport target. No new construction is introduced in the reviewed folder.

## Not verifiable

Source limitations are carried forward from [the previous report][prior]; the unchanged sample calls for no new fetch or missing-text request. No settled uncertified work was reopened.

- The 13 current Suggested signatures cannot be mechanically printed because the import fails (R04). All ten companion signatures were printed successfully.
- **Knutson “semester2”, pp. 72–73:** the previous sources-service author/title and filename attempts and web searches did not identify a legal text. There is still no manifest or stable identifier. Escobar does not certify these page labels.
- **Atiyah, Convexity and commuting Hamiltonians:** previous DOI request returned HTTP 403; pp. 1–15 remain uncertified. Cannas Theorem 27.1 supplies the separately checked readable statement.
- **Kirwan, Cohomology of quotients in symplectic and algebraic geometry; Condevaux–Dazord–Molino, Géométrie du moment:** previous sources-service bibliographic searches found no legal texts. The README still gives no finer locators.
- **Guillemin–Sternberg (1982), Kirwan convexity III (1984), Duistermaat–Heckman (1982):** previously classified as publisher-only, uncertified citations; no fresh request or certification is made.
- The previous report obtained legal copies of LMTW, Delzant, Lerman–Tolman, Moerdijk and van den Berg–Moerdijk but did not certify every theorem. This review inherits only its recorded sample and computations. No README locator is explicitly flagged “unverified”.
- Object searches establish the specific overlaps and supplier resolutions recorded here, not exhaustive absence of every alternative formalization. The unchanged wider ownership audit is inherited; the independent verdicts for the two sibling folders remain outside this report.

Missing source texts do not suspend this incremental review. The seven blocking defects are repairable, so the verdict is needs changes.

## Source issues

Carried forward from the previous source readings; no additional source error was discovered in this zero-line incremental review.

- **Error** in escobar at §4.1, printed p. 13 (escobar lines 480–484): the source says a general point maps under the torus moment map to a Weyl conjugate of the fundamental weight; it should be a convex combination, with Weyl values at torus-fixed points; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 13 (escobar lines 485–488): the source says the product moment map sums φₖ∘μₖ; it should be Σ μₖ∘φₖ, from the Bott–Samelson space to the torus dual; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 12 (escobar lines 459–464): the source says the kth component uses an unbound j and parabolic index k; it should use the cumulative product p₁⋯pₖ and the parabolic indexed by the kth word letter; affects a stated result.
- **Misprint** in lerman-gradient at Theorem 1.1(2), printed preprint p. 3 (lerman-gradient lines 131–135): the source says the extended flow has codomain C; it should have codomain S_C, with its infinite-time endpoint in C; affects a stated result.
- **Misprint** in hnp at the paragraph after Theorem 3.4 and proof of Theorem 4.1, printed pp. 133–134 (hnp lines 524, 549): the source says Theorem 3.5 supplies the local-to-global result; it should cite Theorem 3.4; affects the proof.

[prior]: packages/ConvexityToric/reports/PRREVIEW-ConvexityToric~2.md

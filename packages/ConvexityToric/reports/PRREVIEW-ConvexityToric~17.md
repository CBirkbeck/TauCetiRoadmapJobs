# Review of ConvexityToric (pull request #1651 at f049e2f)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 824d1d3. The folder is byte-identical to the head the previous report read (`git diff --stat 824d1d3..HEAD` lists only `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean`, 7 insertions and 4 deletions, all in its module-system header), and the brief's excluding diff of changes outside the three roadmap folders and the family files is empty. The one finding of the previous report concerned the family index, which this head leaves unchanged, so it is carried as R01. The gate, the dependency check, the elaboration, the one-tactic probe and the `#check` importer were rerun at this head and are clean.

## R01 (P3) — The family index still routes this roadmap's chambers through RootSystems

**Location:** `TauCetiRoadmap/SymplecticGeometry/README.md:66` ("RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem") and `:80` ("T3/T4 consume RootSystems and HamiltonianReduction R2/R3").

**Claim:** The folder cites RootSystems nowhere (`grep -c RootSystems` on `ConvexityToric/README.md`: 0 at this head); its supplier contracts (`README.md:70–87`) consume the chambers from Tau Ceti, §3.1 (`:420–422`) builds on "LieGroups Layer 6 and Tau Ceti's Weyl chambers", and Layer 4's `*Needs:*` lines (`:733`, `:916`) name HamiltonianReduction R3 and Layer 4.1, never RootSystems. On main at 3b51055 (`RepresentationTheory/RootSystems/README.md`, Layers 1–3 at `:248, 432, 504`) RootSystems owns no closed-wall chamber theorem: it cites `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` itself (`:193`) and says the native chamber contracts remain available directly to all consumers (`:246`). So the index names a supply edge this roadmap does not have and an owner that does not exist. The two lines are main's, but the brief names the family index as the pull request's own, and the folder's diff is what makes them false for this roadmap.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/SymplecticGeometry/README.md` is empty at f049e2f; `grep -n RootSystems` on the index prints `:66` and `:80`; the folder's dependency check lists no RootSystems edge (235 roadmaps, 2239 edges, 0 problems).

**Exact repair:** At `:66` replace "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" by "Tau Ceti's `TauCeti.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` supply the abstract chambers and the closed-wall fundamental domain". At `:80` replace "T3/T4 consume RootSystems and HamiltonianReduction R2/R3" by "T3 consumes Tau Ceti's Weyl chambers and HamiltonianReduction R2, T4 HamiltonianReduction R3". Tested on the instance that refutes the original: with those two edits the index names, for T3 and T4, exactly the suppliers that §3.1's and Layer 4's `*Needs:*` lines name (`:422`, `:733`, `:916`), and no roadmap the folder does not cite. HamiltonianReduction's own "RootSystems Layer4" clause (`SymplecticGeometry/HamiltonianReduction/README.md:143, 145, 147` on main) is main's roadmap and is not this pull request's to change.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/SymplecticGeometry/README.md:66` still reads "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" and `:80` "T3/T4 consume RootSystems and HamiltonianReduction R2/R3"; the file is unchanged from main at this head. Written again as R01 above.

No repair report exists on the board for this folder (its `reports/` directory holds review reports only), so no finding is marked not actionable and no `Re-raised` line applies.

## Verified sound

**Scope.** Head f049e2f3105994b5a912bf4ad8be9ed7da706213, one commit on 824d1d3 ("IntegrableSystems: review repairs (module-system header…)"). `changes.md`: 0 changed lines in the folder; `README.md` and `Suggested.lean` are byte-identical to 824d1d3. The only file changed outside the folder is `IntegrableSystems/Suggested.lean` (its four `import` lines become `module` / `public import`, plus `@[expose] public section`), a sibling folder the brief names as the pull request's own; this folder's README and Lean file cite IntegrableSystems nowhere (`grep IntegrableSystems`: 0 hits in both files), and the two Lean files live in different namespaces (`TauCetiRoadmap.ConvexityToric` at `Suggested.lean:41` against `TauCetiRoadmap.SymplecticGeometry.IntegrableSystems`), so no declaration name is shared and nothing here depends on that change. `lake-manifest.json` and `lean-toolchain` are unchanged since 824d1d3, so the pins the previous rounds opened are the pins of this head.

**Gate.** The worker's gate at this head: every counter 0, `build=0`, `OK`. My run of the brief's gate command stops before its build step with every content counter 0 and `outside-folder=4` for the four sibling-folder files the brief names as the pull request's own (the same scope false positive as in every previous round):

```text
gate ConvexityToric: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=4 source-material=0 FAIL
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md
  outside-folder: TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean
```

**Dependency check** (the brief's command, `--movable`):

```text
depcheck: 235 roadmaps, 2239 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. (The previous round printed 224 roadmaps and 2112 edges against the merge order of that day; the counts are the order file's, not this folder's.)

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 6.3 s with exactly six `sorry` warnings (lines 72, 86, 116, 124, 144, 194, the six headline sites) and no other diagnostic. The module header is `module` / `public import Mathlib` / two `public import TauCeti.*` lines (`TauCeti.Geometry.Symplectic.Manifold.TwoForm`, `TauCeti.Geometry.Toric.Algebraic.Lattice`), the form the gate accepts (`imports=0`, `build=0`).

**One-tactic probe** on a scratch copy with each of the six `sorry` replaced by `first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl`: all six sites fail (unsolved goals at 80, 91, 120, 153, 216 and a type mismatch at 129, with aesop reporting exhaustive failure at 81, 154, 217). No padding.

**`#check` importer** on a scratch file importing the built module `TauCetiRoadmap.SymplecticGeometry.ConvexityToric.Suggested` with `#check @name` for each of the 17 declarations of `signatures.md`: 17 of 17 resolve (`HamiltonianTorusData`, `torus_convexity`, `schur_horn`, `BottSamelson.V3`, `.projectorDiagonal`, `.moment`, `.initialPlane`, `.fixedMoment`, `.incidence_moment_range`, `.fixedMoment_convexHull`, `toric_fibers`, `IntegralFacetPresentation`, `.pairing`, `.region`, `.IsSmoothVertex`, `.IsDelzant`, `toricImage_delzant`), no error or unknown identifier. The worker's `signatures.md` (17 declarations, 0 with a dropped section binder) and the previous rounds' comparison of each elaborated type with its README statement stand, the file being unchanged.

**Resolver leads.** The seven Lean names `citations.md` lists (`BottSamelson.fixedMoment`, `fixedMoment_convexHull`, `incidence_moment_range`, `initialPlane`, `projectorDiagonal`, `IntegralFacetPresentation.IsDelzant`, `IsSmoothVertex`) are the file's own declarations, each resolved by the importer above.

**Cross-roadmap citations.** Main is at 3b51055, the commit the previous round read. Re-resolved at this round: RootSystems on main, Layers 1–3 only (`:248, 432, 504`), chambers cited from Tau Ceti (`:193`), "remain available directly to all consumers" (`:246`); LieGroups Layer 2 (`RepresentationTheory/LieGroups/README.md:275`) and Layer 6 (`:383`); HamiltonianReduction R2 (`SymplecticGeometry/HamiltonianReduction/README.md:127`), R3 (`:187`), R3.1 (`:262`). The folder's seven Tau Ceti chamber names (`README.md:70–87`) reopened at the pin: `dominantChamber` and `openDominantChamber` at `LinearAlgebra/RootSystem/Chamber.lean:135, 138`; `weylChamber`, `openWeylChamber`, `exists_smul_eq_of_mem_openWeylChambers`, `existsUnique_mem_openWeylChamber` at `Weyl/Chamber.lean:107, 111, 186, 368`; `existsUnique_mem_orbit_inter_dominantChamber` at `FundamentalDomain.lean:234`; the closed-subgroup theorem `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` at `Geometry/Lie/Subgroup/Embedded.lean:157` and `lieSubalgebraOfSubgroup` at `Subgroup/LieAlgebra.lean:272`. The remaining citations resolved in earlier rounds (SmoothBundlesConnections B2.4/B6.2/B6.3; Orbifolds O1–O5 and O4-T; MorseTheory M1–M5; CharacteristicClasses C1–C3; AlgebraicTopology Stage 6; DifferentialGeometry Layers 0–1, 5.5, 6, 10.2; HopfRinow Layers 1 and 4; HeegaardFloer §4.1; GeometricTopology Layer 1; SchubertGeometry S2/S9; ComplexKahlerGeometry K7.2; AnalyticToricGeometry Layer 0; Majorization Part A) are in folders on the same main this head does not change and stand.

**Sources, seeded sample.** No head since the full review touched a locator (the heads since then changed supplier citations and module headers only, and this one changes nothing in the folder). The full review's reading of every sampled target (1.1 with conrad §18 p. 82 and Appendix Q/R, 1.2, 2.1, 3.1, 3.2, 3.3, 4.1, 4.2, 5.1, 5.2) stands with its page rules; the README flags no locator as unverified.

**Adversarial table.** Rows 1–37 are carried from the previous report (PRREVIEW-ConvexityToric~15, which carried them from ~14 and ~13); rows 31, 32 and 38 are recomputed at this head. No statement changed, so no new row is required. `✓` means both sides agree.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| 1 §1.1 period at t=2π (r15 row 1) | SU(2), H=diag(i,−i) | diag(e^(2πi),e^(−2πi))=I, φ(I)=1, so exp_G(2πα∨)=1; at t=π: −I, so H/2 is excluded | ✓ |
| 2 §1.1 metric independence of α∨ (r15 row 2) | ⟨H,H⟩=c for c=1,2 | α♯=(2/c)H, ‖α‖²=4/c, α∨=H for both c | ✓ |
| 3 §1.1 reflection on weights (r15 row 3) | λ(H)=1 | λ−1·α has value −1∈ℤ; H−α(H)α∨=−H∈Λ_Z | ✓ |
| 4 §1.1 root-line conjugation (r15 row 4) | D=diag(e^(it),e^(−it)) | DE₁₂D⁻¹=e^(2it)E₁₂, [H,E₁₂]=2iE₁₂, dχ_α(H)=2i=iα(H) | ✓ |
| 5 §1.1 SU(2)→SO(3), U(2), rank 0 (r15 row 5) | Ad(exp tH) on A=((0,1),(−1,0)); (1,1),(1,−1); trivial torus | rotation by 2t so H↦2Z, kernel {±I}; det=−2, index 2; Λ_Z={0}, no roots | ✓ |
| 6 §1.1 kernel bound (r15 row 6) | φ=id; SU(2)→SO(3); zero map; D=diag(i,−i) | id: kernel {I}⊆{±I}; SO(3): kernel {I,−I}=Z(SU(2)), bound attained; zero map: α(dφ(H))=0≠2, hypothesis fails, kernel SU(2); DE₁₂D⁻¹=−E₁₂ so D∉Z; ker(dφ)∌H so ker(dφ)=0 in simple su(2) | ✓ |
| 7 HamiltonianTorusData sign (r15 row 7) | ℂ, dx∧dy, rotation | contraction −y dy−x dx=d(−(x²+y²)/2) | ✓ |
| 8 §1.2 shear / polar J (r15 row 8) | S=((1,1),(0,1)); ω=dq∧dp | Sⁿe₂=(n,1) unbounded; J=A, ω(e₁,Je₁)=1 | ✓ |
| 9 §1.2 irrational rotation (r15 row 9) | e^(iθ) on first ℂ factor | fixed set {0}×ℂ, dimension 2 | ✓ |
| 10 §2.1 Euler sign, closure (r15 row 10) | weight-2 line; irrational ξ | Euler class −2h; closure of exp(ℝξ) is T | ✓ |
| 11 §3.1 `torus_convexity` degenerate and sphere (r15 row 11) | point; S² height | {0}=hull{0}; image [−1,1], fibers circle, point, ∅ | ✓ |
| 12 §3.1 rationality at a vertex (r15 row 12) | CP², m=[1:0:0] | local cone the negative quadrant | ✓ |
| 13 §3.1 rationality at an edge point (r15 row 13) | CP², z₁=0 | cone a half-plane bounded by the edge | ✓ |
| 14 §3.1 nonabelian (r15 row 14) | SU(2) orbit sphere radius r | chamber image {r}; torus projection [−r,r] | ✓ |
| 15 §3.1 gradient inequality (r15 row 15) | p=x⁴ | ‖∇p‖=4p^(3/4), θ=3/4 | ✓ |
| 16 §3.2 `schur_horn` n=2 (r15 row 16) | spectrum (2,0) | diagonals (2t,2−2t) fill hull of (2,0),(0,2) | ✓ |
| 17 §3.2 repeated/empty (r15 row 17) | (1,1); n=0 | {(1,1)}; {()} | ✓ |
| 18 §3.3 projector diagonals (r15 row 18) | 0, V3, initial plane, span(e₁+e₂) | traces 0,3,2,1 | ✓ |
| 19 §3.3 fixed rows at (1,1,1) (r15 row 19) | eight rows | 7 distinct values; rows 2,5 coincide | ✓ |
| 20 §3.3 `fixedMoment_convexHull` corners (r15 row 20) | plane x+y+z=4 with bounds | six corners = rows 1,3,4,8,7,6 | ✓ |
| 21 §3.3 edge coefficients (r15 row 21) | (1,1,1), (2,1,1) | c/D=½, ⅓; a/D=⅔ | ✓ |
| 22 §3.3 KKS/FS sign (r15 row 22) | line (1,w), w=0.1 | μ₁=0.990099; ratio −2π | ✓ |
| 23 §4.1 Liouville / DH (r15 row 23) | unit square; S²; trivial circle | masses 1, 2; density 2π; Dirac 4π | ✓ |
| 24 §4.1 level bundle / O4 label (r15 row 24) | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; "O4, item 1" at `Orbifolds/README.md:298` | ✓ |
| 25 §4.2 variation / Hopf (r15 row 25) | Cannas circle; ℂ² reversed diagonal | dA/dc=2π, c₁=+1 | ✓ |
| 26 §5.1 `toric_fibers` / complexity one (r15 row 26) | point; S²; word121 at (1,1,1) | (2,2,0) fixed and not a vertex | ✓ |
| 27 §5.1 presentations (r15 row 27) | ±1 normals; translates; x≥0; rank 0 | [0,1]; [2,3]; not compact; empty Delzant | ✓ |
| 28 §5.1 `toricImage_delzant` degenerate (r15 row 28) | N=0, rank 0, d=0 | region a point, IsDelzant vacuous | ✓ |
| 29 §5.2 periods / area / residual action (r15 row 29) | (a,b)=(2,3), ε=½ | area π/6; w↦−w | ✓ |
| 30 Lean context (r15 row 30) | all 17 `#check` types | binders as in the README | ✓ |
| 31 Lean context at the pins (recomputed) | elaboration, probe, importer at f049e2f | 6 `sorry`, 0 errors; 6 of 6 probe sites fail; 17 of 17 resolve | ✓ |
| 32 Module header (recomputed) | `lake env lean`; importer; gate | `module` + `public import Mathlib` + 2 `public import TauCeti.*`; 6 `sorry` warnings, 0 other diagnostics; worker's gate `imports=0 build=0 OK` | ✓ |
| 33 §1.1 closed-subgroup input (r15 row 33) | kernel of φ:SU(2)→G | Lie(ker φ)=ker(dφ)=0 for id and SU(2)→SO(3); kernel discrete; `isEmbeddedLieSubgroup_of_isClosed` at `Embedded.lean:157`, LieGroups Layer 2 at `:275` on main | ✓ |
| 34 Chamber citations at main and the pin (r15 row 34) | `README.md:70–87, 204, 313, 422` | RootSystems on main has Layers 1–3 only (`:248, 432, 504`) and is cited 0 times in the folder; the seven Tau Ceti names exist at `Chamber.lean:135, 138`, `Weyl/Chamber.lean:107, 111, 186, 368`, `FundamentalDomain.lean:234`; depcheck 0 problems | ✓ |
| 35 Hypothesis sentence vs the pin (r15 row 35) | the two `existsUnique` theorems; the five other names | `:368` and `:234` each carry `CommRing`+`LinearOrder`+`IsStrictOrderedRing R`, `Finite ι`, `IsCrystallographic`, `IsReduced`, `flip.IsReduced`, `IsRootSystem` = the README's eight-clause sentence; `dominantChamber` needs `Preorder R` only, `weylChamber`/`exists_smul_eq…` `LinearOrder R` only | ✓ |
| 36 Chamber theorems in rank 0 and rank 1 (r15 row 36) | ι=∅; A₁ over ℝ | ι=∅: both chambers = M, W trivial, orbit {x}∩M={x}; A₁: dominant {x≥0}, orbit {x,−x}∩{x≥0}={|x|}, one point also at the wall; x>0 in the chamber of 1 only, x<0 in s•(0,∞) only | ✓ |
| 37 Centre factor and flip-reducedness (r15 row 37) | U(2): t*=ℝ², α=(1,−1); A₂ count | t_ss*=ℝ(1,−1), z*=ℝ(1,1), t*_+={x≥y}=z(k)*×t*_(ss,+), no root nonzero on z*; β∨=cα∨ ⇒ c=±1; A₂: 6 open chambers, ρ in the dominant one only | ✓ |
| 38 Family index vs the folder (recomputed at f049e2f) | `SymplecticGeometry/README.md:66, 80` | index: "RootSystems owns … closed-wall chamber theorem", "T3/T4 consume RootSystems"; folder: 0 RootSystems citations, T3 on Tau Ceti's chambers (`:420–422`), T4 on HamiltonianReduction R3 and Layer 4.1 (`:733, 916`); index diff against main empty | R01 |

**Ownership and duplication.** No statement was added or changed at this head, so the previous rounds' searches (Delzant polytopes, Schur–Horn, Duistermaat–Heckman, the rank-one kernel bound, the eight declaration names, `existsUnique_mem_orbit_inter_dominantChamber` cited by RootSystems on main as a consumer too) stand. Ownership against open pull requests was checked through the supplied checkouts in those rounds; the sibling change at this head adds no declaration (a header rewrite only), so nothing new to check.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5, pp. 44–78 (`README.md:361–362`): no legal copy found by the sources service in earlier rounds; cited by locator, unchanged.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77) and Duistermaat–Heckman 1982 (References only): paywalled; their statements were checked in Cannas da Silva §§27 and 30 and in LMTW/Lerman in the previous rounds.
- Condevaux–Dazord–Molino (named at `README.md:400`) has no locator and was not sought; HNP Theorems 3.10 and 4.1 cover the route.
- The LieGroups Layer 6 compact real root adapter beyond main's stated milestone N(T)/T ≃ W(root system) is built in LieGroups' open revision, cited as main: a stated contract, as in every previous round.
- Elaboration and the computed instances do not prove the six admitted headlines.

## Source issues

- none (no head since the full review touches a locator; the previous reports' errata stand and were collected then).

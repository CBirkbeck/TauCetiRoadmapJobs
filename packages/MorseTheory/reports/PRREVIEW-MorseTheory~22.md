# Review of MorseTheory (pull request #1682 at 431f9d5)

**Verdict:** needs changes

This is a full review of the head the previous review read; the folder has not changed since (0 changed lines). Four findings: R01 carries over and is re-raised; R02 is new, because main gained a second owner of Brown's theorem after the previous review; R03 and R04 are small.

## R01 (P1) — The branch is not merged with main: the Tau Ceti library that the README and `Suggested.lean` consume does not exist at this head's pin

Re-raised: H01

**Location.** `TauCetiRoadmap/MorseTheory/Suggested.lean:22`: "The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed, not restated". `TauCetiRoadmap/MorseTheory/README.md:38–40`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6".

**Claim.** The README hands its Layer 1–4 and Layer 6 targets to Tau Ceti declarations, and builds the routes of §4.4 and §6.1 on Tau Ceti inputs. At the pin this head builds against, almost none of those declarations exist. So the targets handed to them have no owner at the pin, and the docstring sentence above is false at the pin.

**Witness.** `lake-manifest.json` pins Tau Ceti a91d3aaf; main (3090489) pins 2fd255d. `TauCeti/Geometry/Manifold/Morse/` has 4 entries at a91d3aaf and 35 at 2fd255d. 87 of the README's 134 backticked identifiers are present at 2fd255d and absent at a91d3aaf, and so are all 17 consumed declarations named at `Suggested.lean:22–45`.

**Detail.**
- **Missing at the pin, among others:**
  - `TauCeti.criticalPoints` (2fd255d `Morse/CriticalPoints.lean:87`);
  - `TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two` (`Morse/Reeb.lean:148`);
  - `TauCeti.lsCategoryCount_univ_le_totalCriticalCount` (`Morse/LusternikSchnirelmann.lean:185`);
  - `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation` (`Morse/RelCWComplex.lean:298`);
  - `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall` (`Analysis/InnerProductSpace/Hemisphere.lean:377`), which is the last step of the two-open-cell lemma;
  - `TauCeti.Manifold.mgradient` (`Riemannian/Gradient/Basic.lean:73`), used by the §4.4 cover;
  - `IsOpen.image_of_continuousOn_of_injOn`, used for invariance of domain.
- **Merge state.** The merge base is still ffcc9d31. `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in `README.md` and `Suggested.lean`. Main changed this folder in 53021f19 and 76ab5b3f.
- **Why the gate passes.** The four modules that `Suggested.lean` imports exist at a91d3aaf, and its statements spell the critical set and the gradient out by their bodies.
- **Pull-request text.** The description still announces Palais–Smale targets and a file `PalaisSmaleTargets.lean`. The folder has no such file, and `README.md:74–79` excludes Palais–Smale theory.

**Why H01's reason does not settle it.** The repair report says only a merge of `origin/main` repairs this. That is right about who must act, but the defect is still present at this head: the pin used by the gate and the build lacks the cited library, so the supplier contract is false where it is checked. "Not actionable in this package" says who acts; it is not a repair. This round also carries R02, which is repairable in the package, so the merge belongs in the same repair round, done by a worker or a human.

**Exact repair (worker or human).**
1. Merge `origin/main` into the branch. Resolve `README.md` and `Suggested.lean` to this head's text as amended by R02–R04, and take main's `PROGRESS.md` and `STATUS.md`. This brings in Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2. Main's own MorseTheory text also claims Brown's theorem, so R02's edit applies to the merged text too.
2. Use the native names now available:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - write `TauCeti.criticalPoints I f`, `TauCeti.totalCriticalCount I f = 2` and `-TauCeti.Manifold.mgradient I f x`;
   - delete `Suggested.lean:19–20`.
3. Re-audit the owned-target list at `README.md:60–72` against 2fd255d, and delete what the pin now proves. One case found in this round: §2.1's "changing the chosen complements and charts gives the identity diffeomorphism" (`README.md:629–630`, `:646`) follows at 2fd255d from:
   - `ChartedSpace.exists_diffeomorph_apply_eq_self` (`Geometry/Manifold/Immersion/Diffeomorph.lean:79`), the identity is a diffeomorphism between two atlases for which one map is an immersion;
   - `TauCeti.exists_diffeomorph_regularFiber_regularLevel_apply_eq_self` (`RegularValue/Atlas.lean:72`).
   `Homeomorph.diffeomorphOfImmersions` in the same file bears on the typed boundary/level diffeomorphism route of §2.1. None of these exists at a91d3aaf.
4. Re-elaborate the file and re-run the gate at the new pins.
5. Replace the pull-request title and description with ones that describe the roadmap as it stands.

**Tested on the refuting instance.** At 2fd255d, `TauCeti.exists_regularFiber_smoothEmbedding` is declared at `RegularValue/ManifoldLevel.lean:257`, with the hypotheses of `README.md:199–205`. My declaration index of 2fd255d finds all 17 docstring names.

## R02 (P2) — Brown's generalized Schoenflies theorem has two owners: GeometricTopology §2.2 on main, and §4.4 here

**Location.**
- `README.md:29–31`: "This roadmap owns the recognition of the sphere … and, as its topological input, Brown's bicollared generalized Schoenflies theorem".
- `README.md:1229–1230`: "Brown's generalized Schoenflies theorem, owned here as the topological input of the two-open-cell lemma".
- `Suggested.lean:128–147`: the declaration `exists_closedBall_homeomorph_closure_of_bicollar`.

**Claim.** GeometricTopology, on main, owns the same theorem in a stronger form and lists MorseTheory as its consumer. This roadmap restates it as an owned target and as a `Suggested.lean` statement. The open GeometricTopology revision (#1797) keeps §2.2 at its `README.md:2117`, and FourManifolds (#936) asks GeometricTopology for it at its `README.md:223–229` (`gap:brown-schoenflies`). So every other roadmap treats GeometricTopology as the owner.

**Witness.** On main, `TauCetiRoadmap/GeometricTopology/README.md:39` says its Layer 2 owns Brown's theorem. Its `:1357–1366` (§2.2) covers n ≥ 1 and a bicollared `Sⁿ⁻¹ ⊂ Sⁿ`, with each closure ≃ `Dⁿ` restricting to the given parametrization. Its `:8002–8003` says MorseTheory consumes Layer 2.2.

**Why GeometricTopology is the owner.** GeometricTopology already supplies this roadmap (Layer 1 collars, `README.md:435–438`), and at its `README.md:161–164` it consumes nothing from MorseTheory. If MorseTheory kept the theorem and GeometricTopology cited it, the two roadmaps would supply each other.

**Exact repair.**
- **README.**
  - In Scope and ownership, replace the Brown clause of `README.md:29–31` with a deferral: Brown's theorem is GeometricTopology §2.2's.
  - Delete the owned Brown target, `README.md:1229–1294`, with its Checks. That text also misdescribes Brown's map: `README.md:1269` says "the two outer collar pieces" where brown-1960 line 104 collapses the closures of the complementary domains beyond the collar.
  - Add GeometricTopology §2.2 to the GeometricTopology supplier contract (`README.md:435–438`), to the two-open-cell lemma's *Needs:* (`README.md:1320–1323`) and to the Layer 4 Dependencies (`README.md:1343–1347`).
- **`Suggested.lean`.** Delete `exists_closedBall_homeomorph_closure_of_bicollar`. In the module docstring (`:15–17`) and in the docstring of `nonempty_homeomorph_sphere_of_two_euclidean_opens` (`:151–154`), say the Schoenflies input is GeometricTopology §2.2.

**Tested on the refuting instance.** The two-open-cell lemma applies Brown with n = m ≥ 1 (it assumes `0 < m`), to `f = b(·,0)` with the radial annulus bicollar b, a `TauCeti.IsBicollar f b` as §2.2's *Needs:* requires. §2.2's conclusion contains what the lemma uses: a closure ≃ `D^m` carrying Σ onto `∂D^m`. The m = 0 case of the deleted statement is used nowhere: the sphere theorem treats m = 0 directly (`README.md:1167`). Depcheck stays clean, since GeometricTopology is already a supplier.

## R03 (P3) — Undefined term "compact-core C^k seminorm topology"

**Location.** `README.md:913`: "Restriction to any open submanifold is continuous into its compact-core C^k seminorm topology, for each finite k."

**Claim.** "Compact-core" is defined nowhere in the README. It is not the literature's name, and it is not Mathlib's or Tau Ceti's.

**Witness.** The README's own term, eight lines earlier at `README.md:905`, is "compact chart C^k seminorm topology". `grep -n "compact-core"` finds only line 913.

**Exact repair.** Write "into the compact chart C^k seminorm topology of the open submanifold (the weak C^k topology, Hirsch, Chapter 2, §1)".

**Tested on the refuting instance.** With that reading the bullet is true. Each compact chart set of U is one of M, and the strong topology of M is finer than the weak one. The `δψ` Check at `README.md:924` concerns the strong topology on U, as the second bullet does.

## R04 (P3) — Partitions of unity are attributed to DifferentialGeometry, which lists them as Mathlib's

**Location.** `README.md:404–405`: "DG Layers 3,5,10,12 supply flows, boundary-orientation interfaces, partitions of unity, …". `README.md:960`: "DifferentialGeometry partitions of unity and §10.2 Sard".

**Claim.** The README cites a supplier for an object that supplier does not provide.

**Witness.** DifferentialGeometry on main puts partitions of unity under "What Mathlib already has (consume)" (`TauCetiRoadmap/DifferentialGeometry/README.md:4`, `:113`). Mathlib has `SmoothPartitionOfUnity` at `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:122`, with `exists_isSubordinate` at `:365`.

**Exact repair.**
- Drop "partitions of unity" from `README.md:405`.
- At `README.md:960`, write "Mathlib `SmoothPartitionOfUnity`; DifferentialGeometry §10.2 Sard".
- Add `SmoothPartitionOfUnity` to the Mathlib contract.

**Tested on the refuting instance.** DifferentialGeometry's Layers 3, 5, 10 and 12 headings (`:371`, `:503`, `:877`, `:910`) contain no partition-of-unity target.

## Previous findings

- **R01 (re-raising H01): not repaired.** Same head. `lake-manifest.json` still pins Tau Ceti a91d3aaf, and `Suggested.lean:22` is unchanged. This is R01 above.
- **R02 (Math240 reference): stays repaired.** `grep -c "Math240\|Homework"` over the README gives 0, and the References list still has 8 entries, one per manifest id.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** Re-run on this head: every check is 0 and it prints `OK`. The worker's `scratch/gate.md` also shows `build=0`. The worktree is clean afterwards.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on a scratch copy prints only seven `declaration uses sorry` warnings, at lines 78, 104, 119, 134, 155, 169 and 183.
- **Signatures.** I elaborated `#check @` for all 8 declarations in one scratch file and compared each type with its README statement:
  - every manifold statement keeps `FiniteDimensional`, `Boundaryless`, `T2Space`, `IsManifold I ∞` and `SecondCountableTopology`;
  - `strong_morse_inequalities` puts k in M's universe, as the Conventions say;
  - `exists_morseCWModel` quantifies X over a free universe, which is harmless since a second-countable manifold has a model of cardinality at most the continuum.
  I changed nothing.
- **Padding.** The one-tactic probe (`first | rfl | simp | infer_instance | exact fun _ => ⟨_, rfl⟩`) fails on all 7 theorems, so there is no padding.
- **Pinned definitions read at a91d3aaf:**
  - `TauCeti.IsMorseOn`/`IsMorse` (`Morse/Basic.lean:99`): C^∞ plus nondegeneracy at chart-critical points, which matches the `mvfderiv` zero set;
  - `manifoldMorseIndex` (`Morse/Index.lean:74`);
  - `TauCeti.IsBicollar`/`IsBicollared` (`LocallyFlat/Bicollar.lean:101`, `:108`);
  - `natCard_zerothHomotopy_sphere_compl_range_eq_two` (`Singular/JordanBrouwer.lean:212`);
  - `IsMIntegralCurveOn.subset_maximalIntegralCurveInterval` and `IsMIntegralCurveOn.eqOn_maximalIntegralCurve` (`IntegralCurve/Maximal.lean:113`, `:249`), with the hypotheses of `README.md:326–331`.
- **Mathlib at the pin:**
  - `norm_iteratedFDerivWithin_comp_le` (`ContDiff/Bounds.lean:445`), with the bound n!·C·Dⁿ used in §1.3;
  - `onePointEquivSphereOfFinrankEq` (`OnePoint/Sphere.lean:34`);
  - `Homeomorph.onePointCongr`, `EuclideanSpace.instChartedSpaceSphere` and `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless`;
  - `Manifold.riemannianEDist` (`Riemannian/PathELength.lean:207`).

### Cross-roadmap citations, resolved on main 3090489

- **DifferentialGeometry:** Layer 3 (`:371`), 5.1 (`:507`), 10.2 (`:884`), 12.2 (`:918`) and 12.3 (`:920`).
- **AlgebraicTopology:**
  - Stage 4 items 4, 5 and 6 (`:535`, `:635`, `:789`); item 5 has the relative CW pushout, the gluing comparison, the towers and the union theorem, which §2.4 uses;
  - the categorical-cover supplement with `lsCupLength` (`:1082–1123`).
- **GeometricTopology:** Layer 1 (`:783`).
- **CharacteristicClasses:** C2 (`:728`).
- **ComplexKahlerGeometry:** K1, K7.1 and K7.2 (`:96`, `:1407`, `:1444`).
- **ComplexManifolds:** Milestone 1 (`:172`, with a matching anchor).
- **DGFloer:** Layer 1 item 3, the filtered-complex spectral sequence (`:621`).
- **RiemannianGeometry:** R3 (`:369`).
- **HeegaardFloer:** Lane M (`:217`).
- **ConvexityToric:** T2 (`:73`).
- **AffineMorseLefschetz:** it consumes M1–M4 (`:130`, `:502`).
- **Forbidden suppliers:** none is named.

### Overlaps and ownership

- **Dropped anchors.** `scratch/overlaps.md` lists `#m2-…` and `#m5-…` as dropped, cited at HeegaardFloer main lines 647 and 1064. `README.md:462–468` maps each old id to its new heading. That is the old → new mapping the rule asks for, so these are not a finding. The tool does not seem to read that list format.
- **Other open pull requests.** No other open pull request changes this roadmap.
- **Second owners.** I read the scope and ownership of MorseNovikov (#1161), RiemannianGeometry (#1683), DifferentialGeometry (#886), AlgebraicTopology (#1652), HomotopySpheres (#1287) and FourManifolds (#936). Each consumes this roadmap's M1–M6 and owns none of its targets.
  - GeometricTopology §1.3.1's elementary handle step (main `:888–921`) is for triads on compact manifolds with boundary. GeometricTopology assigns the boundaryless and compact-band case to MorseTheory (`:161–164`), so it is not a second owner of §2.2's handles.
- **Searches across every open head and main** (with `roadmaps grep`) for "strong Morse inequalities", "one cell per critical point", "two critical points", "two open sets homeomorphic" and "exponential decay … gradient": the only owner of any of them is this roadmap, apart from Brown (R02).
- **Library.** The planar Schoenflies theorem at 2fd255d (`Conformal/Jordan/Schoenflies.lean`) is the special case n = 2 and not a duplicate. Neither pin proves any of the 7 headlines.

### Seeded sample (15 targets)

- **Cohen–Iga–Norbury.** Its printed page is the PDF page − 13; I checked this at cohen-iga-norbury lines 995 and 1185.
  - Theorem 4.6, pp. 27–29 (line 1022): closed M; the convergence step uses finitely many critical points (line 1086). This is §6.1.
  - Theorem 5.3, p. 36 (line 1322), and Corollary 5.4, p. 38 (line 1423): §1.3.
  - Theorem 5.7, pp. 40–41 (line 1519): closed M, one λ-cell per critical point of index λ. This is §2.4.
  - Corollary 5.11 and its proof, p. 42 (lines 1569–1596): the proof's `c_k = d_(k+1) + b_k + d_k` is the polynomial identity of §4.1.
  - Application 5.13, p. 43 (line 1617): §4.3.
  - Theorems 15.1, 15.4 and 15.6–15.7, pp. 143, 146 and 147–148 (lines 4986, 5091, 5142, 5161): §5.1.
- **Nicolaescu.** Theorem 2.2.3, pp. 38–42 (nicolaescu-invitation line 1950), for an exhaustive Morse function with a homeomorphism conclusion, and Remark 2.2.5, p. 42 (line 2177). This is §2.2.
- **Weber.** Theorem 1.1, p. 2 (weber-conley line 65): C², closed M, unnormalized category. The proof is on pp. 2–3. This is §4.2.
- **Milnor 1959.** Theorem 1(3), p. 440 (milnor-1959 line 76), and Corollary 1, p. 442 (line 117): §4.4.
- **Brown 1960.** Theorems 0–1, p. 74; Theorems 2–3, p. 75; Theorems 4–5, p. 76 (brown-1960 lines 25–113). Theorem 5's hypothesis is an embedding of `S^(n−1)×I` with the middle sphere at 1/2. This is §4.4.
- **§1.1 and §1.2** carry no source locator: they consume pinned objects, which is R01.
- **§2.1 (Lee), §2.2–§2.4 (Milnor 1963), §3.1 (Hirsch) and §3.2 (Milnor 1963)** are uncertified; see Not verifiable.

### Adversarial table

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; `𝓡∂ 1` | I∘c=c, df(1,0)=(1,0) on both sides; range=[0,∞)≠ℝ, so not boundaryless | Checks hold; `BoundarylessModel` has 0 declarations at a91d3aaf | R01 |
| 2 | §1.2 Hessian, counts, complementary index | −x²+y²; f=0, x² on ℝ; point; ∅ | diag(−2,2), λ=1, 1+1=2; 0+0=0≠1, excluded by nondegeneracy; 0+1=1; count 1; count 0 | consistent | R01 (names) |
| 3 | §1.3 Morse lemma, discreteness | cohen-iga-norbury lines 1322, 1423 | source f(p)−Σ_(i≤λ)x_i²+Σx_j² on a neighbourhood = README form; discrete ⇒ finite on compacts | verified | none |
| 4 | §1.3 chart-change seminorm bound | τ(y)=y/2 on [−2,2], g=x²; y=2x | sups (1,1,1/2) vs (1,2,2), so C=1; reverse needs 2^k; Mathlib bound n!·C·Dⁿ | true | none |
| 5 | §2.1 levels and faces | f=x on ℝ², c=0; x² at 0; f=x on [a,b] | ker df=span e₂ = range of v↦(0,v); df(0)=0, not regular; df(+1)=+1 at b, df(−1)=−1 at a | consistent | none |
| 6 | §2.2 restriction, rescaled field, handles | x², a<a′<b′<b; band [1,4]; Nicolaescu p. 38 | x↦√a′↦√a equals x↦√a; X=−1/(2x) reaches 1 from 2 at t=3=f(2)−1 and equals −2x/(4x²); source homeomorphism with λ-handle | true, verified | none |
| 7 | §2.3 chart change | (x²−1)², c=1, ε=1/2; Q∘T=Q | 1−(x√(2−x²))²=(x²−1)²; α±(1)=±0.5412 at f=1/2, in different components; A∈O(λ,m−λ), so A_uuᵀA_uu ≥ I | consistent | none |
| 8 | `exists_morseCWModel` | S² height; f=x on ℝ; ∅; ℕ with f(n)=n | cells (1,0,1)=c; ℝ is not `BddBelow`, so excluded; empty complex; 0-cells ≃ ℕ, proper since f⁻¹[a,b] is finite | true | none |
| 9 | §3.1 strong-topology laws | e^(−x²) vs 0.01; δψ on (0,1) | fails for \|x\|>√ln 100=2.146; δψ(x)=δ>x for 0<x<δ, consistent with "proper ⟺ clopen" | consistent; term undefined | R03 |
| 10 | §3.2 proper Morse bounded below | x² with \|g−f\|<1; constant on ℕ | g≥−1 and {g≤b}⊆{x²≤b+1}; fibre ℕ not compact | Checks hold | R01 (names) |
| 11 | `strong_morse_inequalities` | S²; RP² over ℚ and 𝔽₂; ∅; point; (2,0,0,2) vs (1,0,0,1) | 1+t²=1+t²+0; 1+t+t²−1=(1+t)t, ranks d₁=0, d₂=1 give Q=t; 𝔽₂: Q=0; 0=0; c₀=b₀=1; S₁: −2 vs −1, so not admissible | true | none |
| 12 | `bettiNumber` | RP², j=1; point; ℕ discrete, j=0 | 0 over ℚ, 1 over 𝔽₂; (1,0,0,…); ⊕_ℕ k gives junk 0, as documented | matches API | none |
| 13 | §4.2 LS bound and corollaries | T²; S¹⊔S¹; ∅; weber-conley line 65 | 4≥3≥2+1; 4=2+2 while normalized 1+1≠3; 0+1≤0 fails; source category least ℓ≥1 | verified | none |
| 14 | §4.3 applications | odd m; CP¹; c=(2,1,1) on S² | χ=(−1)^mχ, so 0; indices 0,2; 2−1+1=2=χ, −f gives (1,1,2) | consistent | none |
| 15 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3 on S^m; m=0 with 2 and 1 points; h²; S²⊔S² | crit = poles, f=2/3−r⁴/4+O(r⁶), Hessian 0, count 2, gives S^m; 2 gives S⁰, 1≠2; h²: 4 on S¹, ⊤ for m≥2; ≥4 | true | none |
| 16 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | h on round S¹; m=0 | η²=3/4 on [−1/2,1/2], T>8/3; U={x}, V={y} ≃ `Fin 0 → ℝ` | true | none |
| 17 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; equator, latitude bicollar; brown-1960 line 101 | S^(−1)=∅, closures {0}, ‖0‖=0≠1; closures are hemispheres; source hypothesis `S^(n−1)×I`, middle sphere | true, but owned by GeometricTopology §2.2 | R02 |
| 18 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | m=0, X a point; X=ℝ^m; S^m minus poles | 1 point vs 2, so `0<m` is needed; ℝ^m not compact; caps glue; last step Hemisphere.lean:377 at 2fd255d, absent at a91d3aaf | true | R01, R02 |
| 19 | §5.1 Morse–Bott | y² vs y⁴; z² on S² along the equator; RP² filtration; Möbius line | ker span(e₁) vs ℝ²; quadratic form on U×ℝ would be unbounded but f≤1, so only near the zero section (README says so); E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0); H₀ twisted ℤ/2 vs ℤ | consistent | none |
| 20 | `exists_compactTrapped_gradient_limit` | x² with dx² and 4dx²; endpoint example; e^(−x) | x₀e^(−2t), tail \|x₀\|e^(−2t); −x/2, distance 2\|x₀\|e^(−t/2); right derivative −2x₀, left 0, Γ(s)=x₀e^(−2−2s)=γ(1+s) for s≥−1; e^(−x) not trapped | true | none |
| 21 | Maximal-curve lemmas of §6.1 | `Maximal.lean:113`, `:249` at a91d3aaf | `Ioo a b ⊆` maximal interval; T2, `IsManifold I 1`, boundaryless, C¹ field = `README.md:326–331` | match | none |
| 22 | Supplier contract at the pin | manifest; merge-base; merge-tree; name index | a91d3aaf vs 2fd255d; ffcc9d31; 2 conflicts; 87/134 names and 17/17 docstring names missing at a91d3aaf | open | R01 |
| 23 | Ownership of Brown's theorem | GeometricTopology `:39`, `:1357`, `:8002`; here `README.md:29–31`, `:1229`; `Suggested.lean:134` | two owners; GeometricTopology supplies MorseTheory and takes nothing back | duplicate | R02 |
| 24 | DifferentialGeometry contract | DifferentialGeometry `README.md:4`, `:113`; here `README.md:405`, `:960` | partitions of unity listed as Mathlib's, attributed here to DG | drift | R04 |
| 25 | §2.1 owned atlas independence | `Immersion/Diffeomorph.lean:79` and `RegularValue/Atlas.lean:72` at 2fd255d | absent at a91d3aaf; at 2fd255d one line from the smooth-embedding laws | re-audit after merge | R01 step 3 |

## Not verifiable

- **lee-smooth-manifolds** (Corollary 5.14, Proposition 5.38; §2.1), **milnor-1963** (Theorem 3.1 p. 12, Theorem 3.5 p. 20, Lemma 3.6 pp. 20–21, Corollary 6.7 p. 36; §2.2–§2.4, §3.2) and **hirsch-differential-topology** (Chapter 2 §1, Chapter 6 Theorem 1.2; §3.1). All three are settled as uncertified and cited by locator only, so I did not read them.
- **Elaboration at main's pins.** I may run Lean only in this worktree, at the head's pins. I read the Tau Ceti declarations at 2fd255d from the package's git objects.
- **ManifoldOptimization (#1506).** `scratch/overlaps.md` lists it as close in vocabulary, but the brief gives it without files. It was covered only by the `roadmaps grep` searches above, which found nothing; I did not read it.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the strong inequality sums over k but writes the summands as `c_i(f)` and `b_i(M)`, also in the proof's displayed identity; it should be `c_k(f)` and `b_k(M)`; affects nothing.
- **Error** in cohen-iga-norbury at Theorem 15.1, p. 143: the source says f∘φ equals `f(x) − Σv_i² + Σw_j²` on all of `U × ℝ^λ × ℝ^(m−n−λ)`; that is impossible for bounded f with positive normal rank, e.g. on compact M. It should hold on a neighbourhood of `U × {0}`; affects a stated result.
- **Misprint** in cohen-iga-norbury at Theorems 15.6–15.7, p. 147: the source says the page built from the relative homology of the filtration quotients is E², which Theorem 15.7 calls the Morse–Smale chain complex; it should be E¹, with E² its homology; affects nothing.
- **Misprint** in weber-conley at footnote 3, p. 3: the source says the half-line `[0,∞)` for `f(u)=u³` is `W^u(0)` while calling it the stable manifold; it should be `W^s(0)`; affects nothing.

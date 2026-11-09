# Review of GromovWittenTheory (pull request #990 at 0194363)

**Verdict:** needs changes

:robot: Independent AI review, full pass. The head is the one the previous review read, so nothing in the folder has changed and the previous R01 is not repaired. This pass found one blocking defect the earlier rounds missed: the Čech cup product that the operations and descendants are built on has no owner. It also found three P3 locator and policy items. The gate passes on an independent rerun, the dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output.

## R01 (P1) — The Čech cup product on the coarse map space has no owner

**Location:**
- `TauCetiRoadmap/GromovWittenTheory/README.md:72`: the pin has “no pullback on the colimit and no cup product; these are ImplicitAtlases §0.7 and §6.5”.
- `README.md:96`: “the Čech cup product on a compact Hausdorff space `Y` is the pullback along the diagonal `Y → Y × Y` (§0.7) of the external product”.
- The cup product is then used at `README.md:255` (§2.1, “identifies … `π^*` and the cup product with their counterparts on the Čech cohomology”), `README.md:275` (§2.2), `README.md:671` (§8.2) and `README.md:695` (§8.3, the ancestor bracket “equals `∫^wt ψ̄₁^(k₁) ⋯ ⌣ I(γ)`”).

**Claim:** ImplicitAtlases §6.5 supplies only an external product: the Künneth isomorphism and the product class. It states no cup product on `Ȟ^•(Y)`. It also does not state that the external product is natural under pullback, `(f × g)^*(a ⊠ b) = f^*a ⊠ g^*b`. Without that naturality, `f^*(a ⌣ b) = f^*a ⌣ f^*b` does not follow for the diagonal-pullback product. CharacteristicClasses C1.2b asserts “coefficient/cup naturality” for a Čech cup product it never defines, and nothing identifies that product with this roadmap's `Δ^*(a ⊠ b)`. So the roadmap uses three things nothing owns:
- the cup product's multiplicativity under `st^*` and `ev_i^*`;
- its graded commutativity and associativity, needed for the Koszul reorderings of §4.2 and §8.3;
- its agreement on finite-CW spaces with the cup product that C1.2b's comparison carries.

**Witness:** Grepping the ImplicitAtlases README at its open head `81fc759` for “cup product” finds only lines 830 and 837, both in the Gysin target §7.3; §6.5 is lines 756–770. TopologicalSheafCohomology on main has no cup product. Tau Ceti `2fd255d`'s `TauCeti/Topology/Sheaves/Cech/` (five files) has none either.

**Repair:** Add a target, before §2.2. A new “§0.4 The Čech cup product on compact Hausdorff spaces” would do, or a declared gap on ImplicitAtlases §6.5. It should:
1. Define `a ⌣ b = Δ^*(a ⊠ b)` on `TauCeti.Topology.cechCohomology` with constant ℚ coefficients, and with the orientation sheaf trivialized by AnalyticStableMaps §8.1.
2. Prove `(f × g)^*(a ⊠ b) = f^*a ⊠ g^*b`, and hence multiplicativity of pullback along continuous maps.
3. Prove associativity, the unit and `b ⌣ a = (−1)^(|a||b|) a ⌣ b`, from §6.5's swap sign.
4. Prove that on compact spaces of finite CW type the C1.2b comparison carries the singular cup product (AlgebraicTopology Stage 6 item 2) to this one.

Give it Checks:
- On `T² = S¹ × S¹`, the classes `θ₁ = pr₁^*θ` and `θ₂ = pr₂^*θ` satisfy: `θ₁ ⌣ θ₂` spans `Ȟ²(T²; ℚ) = ℚ`, `θ₂ ⌣ θ₁ = −θ₁ ⌣ θ₂` and `θ₁ ⌣ θ₁ = 0`.
- On `ℂP²`, the square of the degree-2 generator spans `Ȟ⁴`, as for the singular cup product.
- `a ⊠ b` without the diagonal pullback lies in `Ȟ(Y × Y)`, not in `Ȟ(Y)`.

Then cite the new target at §2.1, §2.2, §6.5, §8.2 and §8.3, and change lines 72 and 96 to say the cup product is constructed there.

Test on the instance that exposes the gap: §8.3's API bullet at `X = pt`, `(g, n) = (0, 5)`, `k = (1, 1, 0, 0, 0)`.
- Here `st` is the identity.
- The ancestor bracket is `Φ(C(ψ̄₁) ⌣ C(ψ̄₂))`, with `C` the C1.2b comparison and the diagonal Čech cup product.
- The right side is `∫^wt ψ̄₁ ψ̄₂ = 2!/(1!·1!) = 2`.
- The two agree exactly when item 4 above holds on `M̄_(0,5)`.

## R02 (P3) — The README and docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R01, not repaired; the head is unchanged. It is wider than the previous report said.

**Location:** `README.md:66` (“### From Tau Ceti (commit 2fd255d)”); the contract at lines 68–75; the *Needs:* lines at 160, 184 and 201; `Suggested.lean:31–43` (“The pinned Tau Ceti has the compact nodal domain as the gluing quotient `GluedCurve`…”, “which the pinned Tau Ceti has as `TauCeti.NovikovSeries`”); `lake-manifest.json:8`.

**Claim:** At the branch pin `a91d3aa`, 19 of the 23 Tau Ceti files that the contract cites do not exist:
- `AlmostComplex/Basic.lean` and `NodalGluing/Basic.lean`;
- `Cech/Colimit.lean` and `Cech/Pullback.lean`;
- both `SmoothSingular` files;
- all nine `NovikovSeries` files and all four `NovikovModule` files.

So `TauCeti.Topology.cechCohomology`, the carrier of every Čech group in the roadmap, is absent at the pin. So are `TauCeti.SmoothSimplex`, `GluedCurve` and the Novikov ring and modules. At `a91d3aa`, `SmoothAlmostComplexStructure` sits in `Manifold/AlmostComplex.lean:67`, not in the cited path. The toolchain is `v4.35.0-rc3` on the branch and `v4.36.0-rc2` on main.

**Witness:** `git cat-file -e a91d3aa:<path>` fails for those 19 paths and succeeds for all 23 at `2fd255d`. Main's manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`; the branch pins `a91d3aa` and `6b7abb3c`.

**Repair:** The branch takes origin/main, by a merge or a rebase. This is the worker's rebase step; no line in the folder changes. Tested: all 57 Tau Ceti declarations the contract names resolve at `2fd255d` (listed under Verified sound).

## R03 (P3) — The local elliptic floor of §3.2 cites a PDE label that no longer exists and a HeegaardFloer item that says something else

**Location:**
- `README.md:35`, `138`, `331`, `344` and `385`: “PDE Lane A items 1 and 6 (weak Sobolev spaces, trace and extension)”.
- `README.md:35`, `134`, `331`, `344` and `385`: “HeegaardFloer Lane F1 items 1–3 (… linear Cauchy–Riemann operators on discs and strips as Fredholm operators)”.
- `README.md:134`: “Nothing here concerns a compact Riemann surface with circle boundaries”.

**Claim:** PDE on main has no lanes since `d0bb87a6` (2026-11-05). Its items are now §1.1 (A1), “Sobolev classes on intervals”, and §1.6 (A6), “Lipschitz domains, graph measure, trace, extension and Rellich”. HeegaardFloer item F1.3 is spectral flow, not Fredholm theory for Cauchy–Riemann operators. Since `4599b3f6` (2026-11-07), HeegaardFloer F1.1 consumes PseudoholomorphicCurveAnalysis PH6.1's Sobolev spaces on compact surfaces with boundary, so line 134's claim no longer holds as written.

**Witness:** The PDE README on main contains the word “Lane” 0 times; its headings are at lines 677 and 905. The HeegaardFloer README, line 72: “F1.k is §3.k”; line 2152: “### 3.3 Spectral flow (F1.3)”. The PseudoholomorphicCurveAnalysis README, line 1128: “### 6.3 Fredholm property, kernel and cokernel”.

**Repair:**
- Replace the PDE citation with “PDE §1.6 (A6)” for trace and extension on Lipschitz domains. Keep §1.1 (A1) only if Sobolev classes on intervals are used.
- Replace the HeegaardFloer citation with the owners of each input: PseudoholomorphicCurveAnalysis PH1 (local Sobolev classes), PH3.2–PH3.3 (interior estimates), PH5.1 (bootstrapping) and PH6.3 (Fredholm theory of real Cauchy–Riemann operators on compact bordered surfaces with totally real boundary). HeegaardFloer F1.1, F1.2 and F1.5, which consume those, would also do.
- Reword line 134: the suppliers treat totally real boundary conditions; the Hardy matching conditions at node circles are what §3.2 constructs.

## R04 (P3) — §7.1 reads Kontsevich–Manin Definition 6.1 over Λ_ω, but the definition requires a coefficient field

**Location:** `README.md:604` (“in the form of Kontsevich–Manin Definition 6.1 with axioms 6.1.1–6.1.3”) and `README.md:608` (“The axioms of Definition 6.1 hold with `K = Λ_ω` after extension of scalars”).

**Claim:** Definition 6.1 fixes a coefficient field `K`, a `K`-linear superspace with an even non-degenerate pairing, and correlators into `H^*(M̄_(g,n), K)`. Line 164 says correctly that `Λ_ω` need not be a field or a domain. So “`K = Λ_ω`” puts a ring where the source requires a field, and “non-degenerate” is ambiguous over a ring. Two counterexamples:
- `T² × T²` with areas `1` and `√2`: `Λ_ω` contains the series supported on `ker ω ≅ ℤ⁴`, a Laurent polynomial ring in four variables, which is not a field.
- An Enriques surface: `(q^τ − 1)(q^τ + 1) = 0`, so `Λ_ω` has zero divisors.

**Witness:** KM94 line 1455–1456: “cohomological field theory (CohFT) with coefficient field K”.

**Repair:** Say that the axioms of Definition 6.1, stated there over a field, are read over the commutative ring `Λ_ω`:
- with the finite free module `H^*(X; ℚ) ⊗̂ Λ_ω`;
- with the perfect pairing of §0.2 in place of non-degeneracy;
- with `H^*(M̄_(g,n); ℚ) ⊗̂ Λ_ω` in place of `H^*(M̄_(g,n), K)`, which equals `H^*(M̄_(g,n); ℚ) ⊗ Λ_ω` because `H^*(M̄_(g,n); ℚ)` is finite-dimensional.

Tested on `T² × T²`: §0.2's perfect-pairing target supplies exactly that hypothesis, with the rational Gram matrix invertible.

## R05 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (all three files); the pull request description.

**Claim:** #1998 (algebraic Gromov–Witten theory and quantum cohomology of smooth projective varieties, valued in numerical Chow groups) adds a different roadmap under the same folder name. The two heads conflict in README.md, Suggested.lean and metadata.toml. Neither description states which one moves. The objects themselves are distinct: algebraic stacks and Chow groups there, analytic stable maps and rational cohomology here. So this is a naming and order conflict, not a double owner.

**Witness:** `scratch/overlaps.md` reports that #990 and #1998 conflict in all three files. HamiltonianFloerOperations on main, README line 17, cites “GromovWittenTheory G0/G5–G7” for this roadmap.

**Repair:** State in this pull request's description that this roadmap keeps `GromovWittenTheory`, the name HamiltonianFloerOperations already cites. #1998 would then take another folder, for example `AlgebraicGromovWittenTheory`, before either merges.

## Previous findings

- Previous R01 (Tau Ceti pin): **not repaired**. The head is unchanged, and `lake-manifest.json:8` still pins `a91d3aa`. It is R02 above, with a wider witness: 19 cited files are missing, `cechCohomology` and `SmoothSimplex` among them, not only the Novikov and nodal-gluing files.
- The previous review's second finding, its R02 (the `isLocallyConstant_apply_val` closedness route and the general `gradeBy` scope), was already recorded as repaired at this head. Re-checked: line 164 still gives the route “each a fibre of the locally constant coefficient map `a ↦ a s` (`NovikovModule.isLocallyConstant_apply_val`) and so closed”. Line 15 still claims “the independence and closedness of the homogeneous pieces `NovikovModule.gradeBy` … over every ring”. Still repaired.

## Verified sound

**Gate, dependency check and build.**
- An independent rerun of the full gate at `0194363c92b8a708c45bbbb88511f2946a52da49`: every check 0, `OK`, exit 0. The rerun line carries no `build` field; the worker's gate at the same head has `build=0`.
- The dependency check with `--movable`, against the board's merge order and main content: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 306, after ImplicitAtlases (213), AnalyticStableMaps (214) and TopologicalSheafCohomology (305). The other suppliers (ComplexCurveModuli, Orbifolds, CharacteristicClasses, AlgebraicTopology, GeometricTopology, DifferentialGeometry, ComplexKahlerGeometry, HeegaardFloer, PDE, PseudoholomorphicCurveAnalysis, MorseNovikov) are on main.
- `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean`: exit 0, 14 s, no output.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Suggested.lean.** The file has `import Mathlib`, one module docstring, the namespace and a comment, and no declaration. It has no `set_option` and no sorry'd data. So the `#check` signature comparison and the one-tactic padding probe have no subjects.

**Headline theorems.** The docstring lists four:
1. the operations `I_(g,n,A)` and the eight Kontsevich–Manin properties (Layers 2–6);
2. `I_(1,1,0)(1) = χ(X)·1`;
3. the unital CohFT and the associative quantum product;
4. string, dilaton, divisor and the genus-zero TRR for ancestors.

None is statable at either pin. A grep of Tau Ceti `2fd255d` for `StableCurve`, `DeligneMumford`, `StableMap`, `ImplicitAtlas`, `virtualClass`, `GromovWitten` and `chernClass` finds only the unrelated Auslander–Reiten `stableMap`, and Mathlib has none of them. The docstring names each missing carrier and states no stand-in.

**Library declarations opened** (Tau Ceti at `2fd255d`; line numbers in the cited files): 57 names in total. Two descriptions were also read in full: `SmoothAlmostComplexStructure`, a smooth `End(TM)` section with `J² = −1` and no tameness field, and `t2Space_gluedCurve` (line 692).

| File | Declarations and lines |
|---|---|
| `Manifold/TwoForm.lean` | `IsSymplectic` 115, `Tames` 174 |
| `Manifold/AlmostComplex/Basic.lean` | `SmoothAlmostComplexStructure` 71 |
| `Curves/NodalGluing/Basic.lean` | `FlagPairData` 149, `GluedCurve` 477 |
| `Manifold/Energy.lean` | `stdComplexLineEnergyDensity` 118, `stdComplexLineEnergyDensity_pos` 170, `stdComplexLineEnergy` 402 |
| `Manifold/JHolomorphic.lean` | `IsPseudoholomorphic` 101 |
| `Cohomology/Basic.lean` | `singularCohomologyFunctor` 164 |
| `Cech/Colimit.lean` | `cechCohomology` 70 |
| `Cech/Pullback.lean` | `cechComplexPullback` 53 |
| `SmoothSingular/Basic.lean` | `smoothSingularSubcomplex` 77, `SmoothSimplex` 121 |
| `SmoothSingular/Integral.lean` | `integral` 86 |
| `NovikovSeries/Basic.lean` | `NovikovSeries` 92, `ext` 109, `finite_setOf_add_eq` 219, `single` 448, `ofFinsupp_surjective_iff` 697 |
| `NovikovSeries/Multiplication.lean` | `instCommRing` 435, `isUnit_single` 476, `instAlgebra` 489, `ofAddMonoidAlgebra` 519, `ofAddMonoidAlgebra_injective` 547 |
| `NovikovSeries/Topology.lean`, `TopologicalRing.lean` | `periodFiltration` 93; `nonnegSubring` 245, `posIdeal` 277 |
| `NovikovSeries/ExpLog.lean`, `Functoriality.lean`, `LaurentSeries.lean` | `expMulEquiv` 70; `mapRingHom` 184; `toLaurentSeries` 77 |
| `NovikovSeries/Grading.lean` | `gradeBy` 92, `single_mem_gradeBy` 101, `gradeBy_eq_bot` 106, `gradeBy_eq_top` 111, `iSupIndep_gradeBy` 115, `eq_single_of_mem_gradeBy` 153, `gradedMonoid` 165 |
| `NovikovModule/Basic.lean` | `NovikovModule` 53, `ofFinsupp` 121, `coordinates` 227, `module` 282, `coordinatesLinearEquiv` 303, `basis` 332 |
| `NovikovModule/Topology.lean` | `potentialFiltration` 108, `isClosed_potentialFiltration` 240, `tendsto_nhds_iff` 260, `isLocallyConstant_apply_val` 313, `denseRange_ofFinsupp` 352, `coordinatesContinuousLinearEquiv` 415, `continuousSMul_module` 445, `continuous_kernelProduct` 527 |
| `NovikovModule/Bilinear.lean` | `kernelProduct` 194, `novikovKernelProduct` 703 |
| `NovikovModule/Grading.lean` | `gradeBy` 55, `mem_gradeBy_iff_coordinates` 123, `smul_mem_gradeBy` 143, `kernelProduct_mem_gradeBy` 209 |
| Mathlib `6b7abb3c` (files also present at `1b1ccf4b`) | `IsLocallyConstant.isClosed_fiber` (`Topology/LocallyConstant/Basic.lean:70`), `isClosed_biInter` (`Topology/Basic.lean:162`), `Algebra.TensorProduct.basis : Basis ι A (A ⊗[R] M)` (`RingTheory/TensorProduct/Free.lean:65`), `AddMonoidAlgebra` (`Algebra/MonoidAlgebra/Defs.lean:64`) |

**Cross-roadmap citations resolved.**
- AnalyticStableMaps at its open head `41557ba`: §0.1, §0.3, §1.1, §1.2, §2.1, §3.7, §4.1, §4.3, §6.2, §6.3, §7.3, §8.1, §9.1, §9.2, §10.1, §10.2, §11.1, §11.2, §12.1, §12.2 and §13.1–§13.4 all exist. Content checked:
  - §0.1 states the uniform energy–area comparison over a compact family, and its `v = 2((m−3)(1−g) + ⟨c₁, β⟩ + n)` equals `d_(g,n,A)`.
  - §9.2's Check gives the `(1, 1)` functional over a point as half the fundamental-class pairing, as §2.2's last Check uses.
  - §10.2 has the `z ↦ z^r` multiplicity Check.
  - §12.1 obtains its trace squares from ImplicitAtlases Layer 7.
  - §13.4 assigns the operations, descendants and the curve-class, Chern and area specialization to this roadmap.
- ImplicitAtlases at its open head `81fc759`: §0.7 (`cechCohomology` with pullback along continuous maps), §1.1 (the reflection atlas, not locally orientable), §3.1, §4.2, §4.3, §5.2, §5.3, §5.4, §5.6, §6.4, §6.5 (external product only, R01) and §7.1–§7.4 all exist.
- On main:
  - ComplexCurveModuli: D7 items 1–3 (`xv = t₁t₂`, `forgetAuxiliarySet` line 200, `markedPointCollisionBubbleCharts` line 209, `T_* ⊗ T_**`), D6 item 4 (`finiteActionUniversalChart` and `unorderedAuxiliaryActionChart`, line 179), and D8 (generic ineffective order 2 on `M̄_(1,1)` and `M̄_(2,0)`; the weighted perfect pairing; the product maps for `M̄_(g,n) × X^n`).
  - Orbifolds: O5 item 1 (`|G|⁻¹∫_U` with the full ineffective kernel), item 4 (`(1/k)[|Γ|]` and the perfect compact cup pairings) and item 5 (Thom classes).
  - CharacteristicClasses: C2 item 1 (the Thom class `U_E`), C2 item 3 (`e(TM)[M] = χ(M)`), C3 item 2 (Whitney, dual, line-twist, `c_r = e(E_ℝ)`, tensor product) and C1.2b (the CW-type Čech/singular comparison).
  - AlgebraicTopology: Stages 5.1, 6.1, 6.2, 7.1 and 8.7.
  - DifferentialGeometry: 8.4–8.5 (`deRhamHom`, `deRhamEquiv`).
  - HeegaardFloer: F2.1 = §4.1.
  - HamiltonianFloerOperations: line 17 cites G0/G5–G7.
  - FukayaTheory (open head): line 34 defers closed Gromov–Witten theory to this roadmap.

**Ownership.** `roadmaps grep NovikovModule` matches only this roadmap, so §0.2's general `gradeBy` statement has no other owner. On main, “quantum product” appears only in HamiltonianFloerOperations, which defers to this roadmap. StableReductionPartII (open head, merge-order line 315) has an algebraic Hodge bundle and cotangent lines on `M̄_(g,n)` over ℤ (§5.1, its line 5838). That is a different carrier from the analytic groupoid of §3.2 and §8.1, and later in the order, so it is not a double owner. `scratch/overlaps.md` reports no dropped id and no id defined only by an open revision.

**Seeded sample: sources at their locators** (texts fetched through the sources service from arXiv and the author's page; page numbers are those of the cited versions).
- §1.2: Pardon Theorem 9.2.10, Definition 9.3.1 (which requires `2g + n > 2`) and Lemma 9.3.2, all on p. 100 (Par13 lines 4353–4366).
- §3.4: KM94 2.4.5, p. 10 (lines 408–421): the obstruction sheaf `E ⊠ TV` with `E = R¹π_*𝒪`, of rank `g·dim V`. KM94 (2.9), p. 6 (lines 210, 215): `χ(V) = Σ(−1)^i h^(i,0)`; that the source value is wrong is recorded under Source issues.
- §5.2: KM94 2.2.3, (2.6)–(2.7), p. 5 (lines 176–185), including “cannot be of codimension zero unless it vanishes”.
- §5.3: KM94 2.2.4, p. 5 (lines 186–196): the codimension-zero form and the general form.
- §6.6: Pardon p. 40 (lines 1698–1700: the fiber-product formula wanted, not proved) and p. 95 (lines 4087–4090: the Kontsevich–Manin axioms need further properties).
- §7.1: KM94 Definition 6.1 with 6.1.1–6.1.3, p. 31 (lines 1455–1473), with no unit axiom and a field `K` (R04).
- §7.2: KM94 Theorem-Definition 4.5, p. 19 (line 816), stated for a tree-level system, so conditional on the axioms.
- §8.1: Kock Lemma 1.2.6, p. 10 (line 245); the identity `ψ_i·D_(i,0) = 0` and Lemma 1.3.1, p. 12 (lines 308–312); Lemma 1.5.1 and paragraph 1.5.2, p. 15 (lines 416, 467). KM97 (11), p. 5 (line 219).
- §8.4 (headline): KM97 Lemma 1.5.2 (12), p. 5 (line 240); KM97 Lemma 1.5.3, p. 6 (line 279); Kock 1.4.2, p. 14 (line 368); Kock 1.6.2, p. 16 (line 501); Kock (5.1.7.3), p. 51 (line 1902).
- §8.5: Kock Lemma 5.1.9, p. 51 (lines 1914–1917, `ε^*ψ₁ = ψ₁ − E₁`); KM97 Theorem 1.2 (4), p. 2 (lines 81–94), with the sketch on p. 3 (lines 107–118).
- §8.6: Kock Proposition 5.1.8, p. 51 (line 1904); Kock Lemma 5.2.1, p. 53 (line 2009); KM97 Corollary 1.3 (4a), p. 3 (lines 99–103).
- Kock (5.1.7.1)–(5.1.7.2), pp. 50–51 (lines 1885, 1899), with the open higher-genus note at line 1900.
- §1.1, §2.1, §3.1, §3.3 and §6.4 carry no external locator; each says it is this roadmap's construction.
- Outside the sample, §3.2's Stacks locators were re-read in `stacks-curves`: Lemma 18.3 (Tag 0CE3, line 1677), Lemma 18.4 (Tag 0CE4, line 1691) and Lemma 19.7 item (6) (Tag 0C4D, line 1940). All match.

**Adversarial pass.** Coefficients are ℚ; `d = d_(g,n,A)`; `m = dim_ℂ X`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 stable range; unstable signatures carry the functional | `2g−2+n` at (0,0), (0,1), (0,2), (1,0), (0,3), (1,1); degree-1 `ℂP¹ → ℂP¹`; constant sphere; constant torus | `−2, −1, 0, 0, 1, 1`. Degree-1 map: `d_(0,0,ℓ) = 2(1·(−2) + 2 + 0) = 0`, trivial Aut, moduli a point. Constant sphere with two marks: Aut `ℂ^*`, empty, `d = 2m − 2`. Constant torus with one mark: `d = 2 = (2 + 2m) − 2m` | Correct |
| §1.2 `(st, ev)` and isotropy homomorphisms | Lines in `ℂP²`, (0,3,ℓ); `M̄_(1,1) × X` | `d = 2(−1 + 3 + 3) = 10`, `st` to a point, isotropy `1 → 1`. Generic `ℤ/2 → ℤ/2`; `ℤ/4` at `j = 1728`, matching CCM D8 (orders 4 and 6) | Correct |
| §2.1 weighted adjoint | `M̄_(1,1)`; `M̄_(0,4) → M̄_(0,3)`; `ξ : M̄_(0,3) → M̄_(1,1)`; projection formula | `∫^wt [pt]^∨ = 1/2` against coarse `1`. `deg π_* = −2`, so `π_*1 = 0` and `π_*[pt] = 1`. `ξ_*1 = c[pt]^∨` with `c/2 = 1`, so `c = 2`. `∫π_*(a⌣π^*b)⌣c = ∫a⌣π^*(b⌣c) = ∫π_*a⌣b⌣c` | Correct |
| §2.2 degree and normalization (headline 1; R01 touches its cup product) | General `r`; ℂP², (0,4,ℓ); `X = pt`, (1,1,0) | `t − d + s = s + 2(g−1)m − 2c₁(A)`. (0,4,ℓ): `r = 12 − 10 = 2 = t`, value 1; with `+2c₁`, `r = 14 > t`. `X = pt`: `c·(1/2) = Φ(st^*[pt]^∨) = 1/2`, so `c = 1 = χ(pt)` | Correct; R01 |
| Headline 1: the properties against KM94 2.2.0–2.2.7 | Grading (2.2); splitting order (2.11) | `2(K·β) + (2g−2)m = −2c₁(A) + 2(g−1)m`. `I(…, Δ_a) g^(ab) ⊗ I(Δ_b, …)` in the order of KM94 line 237 | Correct |
| §3.1 weights | `M̄_(1,1) × X`; degree-2 cover of a line in `ℂP²` | Weights `1/2` and `1/2` cancel; dropping one gives `χ/2` or `2χ`. Cover: Aut `z ↦ −z`, so `ℤ/2` and weight `1/2` | Correct |
| §3.2 Hodge fibres (R03 touches it) | Irreducible nodal rational; two spheres with one node; two elliptic curves with one node; two spheres with two nodes | `Σg_v + |E| − |V| + 1`: `0+1−1+1 = 1` (`dz/z`, residues `±1`); `0+1−2+1 = 0`; `2+1−2+1 = 2`; `0+2−2+1 = 1`. Unmatched space `2`, and `c₂ = −c₁` cuts it to `1` | Correct; R03 |
| §3.3 obstruction model | `g = 0`; `g = 1`, `m = 1` | `H¹(C, 𝒪) = 0`, so `Ob = 0`. `Z = M̄_(1,1) × ℂP¹` has dim 2 and vdim 1, so `Ob` has rank `2 − 1 = 1`; with a rank-1 thickening the enlargement has rank 2 and `N_im` rank 1 | Correct |
| §3.4 genus-one normalization (headline 2) | `ℂP¹`, `pt`, `T²`; `m = 2`; `δ = pt` on `ℂP¹`; `g ≥ 2` | `χ_top`: 2, 1, 0; KM94's `Σ(−1)^i h^(i,0)(ℂP¹) = 1`. `c₂(L⊗V) = c₂V + c₁L·c₁V + c₁L²`. `−(1/24)∫c₀⌣pt = −1/24`, matching KM97 (10). `2(g−1)m > 6g − 6` exactly when `m > 3` | Correct; source error recorded |
| §5.2 fundamental class | (0,4,0); ℂP², (0,3,ℓ) and (0,3,0) | `I_(0,4,0)(γ₁, γ₂, γ₃, 1) = (∫γ₁γ₂γ₃)·1`. `⟨pt, pt, 1⟩_ℓ`: `s = 8 ≠ 10`, so 0. `⟨pt, 1, 1⟩_0 = 1`. `π_*1 = 1` would force `⟨pt, pt⟩_(0,2,ℓ) = 1` (with `d = 8 = s`), a contradiction | Correct |
| §5.3 divisor | ℂP², (0,4,ℓ); `A = 0` | `1·⟨pt, pt, H⟩_ℓ = 1`, `d = 12`. `π_*(π^*c) = c ⌣ π_*1 = 0` | Correct |
| §6.4 transfer degrees | `(E, p, q)`; `M̄_(3,2) → M̄_(4,0)`; `M̄_(1,1)² → M̄_(2,0)`; `M̄_(0,3) × M̄_(1,1) → M̄_(1,2)` | `1·2/1 = 2` (the swap `x ↦ p + q − x`; source Aut trivial since `2(q − p) ≠ 0`); `2·1/1 = 2`; `2·4/4 = 2`; `1·2/2 = 1`. `ξ_*1 = 2τ_D` gives `τ_D = [pt]^∨`, consistent with §2.1 | Correct |
| §6.6 node matching | ℂP², ℓ: `pt, pt | H, H` and `pt, H | H, H`; collision stratum | `Δ_a = H`, `Δ^a = H`, `∫H³ = 0`; `Δ_a = pt`, `Δ^a = 1`, `∫H² = 1`. Stratum dim `2 + 1 = 3` against expected `4 − 2 = 2`; product weight `1·(1/2)` | Correct |
| §7.1 CohFT (headline 3; R04) | `ℂP¹`, `Ω_(0,3)(pt, pt, pt)`; is `Λ_ω` a field? | `A = ℓ`: `d = 6 = s`, value 1; `A = 0`: `d = 2`; `A = 2ℓ`: `d = 10`. So the value is `q`, of degree `6 − 2 = 4 = deg q`. `S²`: `ℚ((q))`, a field. `T² × T²`: contains `ℚ[ℤ⁴]`, not a field. Enriques: zero divisors | Correct apart from R04 |
| §7.2 quantum product (headline 3) | `ℂP¹`; `ℂP²`; `T²` duals | `x ⋆ x = q`, degree 4. `H ⋆ H = H²`, `H ⋆ H² = q`, `H² ⋆ H² = qH`; `d_(0,3,2ℓ) = 16 > 12`; associativity `qH = qH`. `e^α = −β` since `∫(−β)⌣α = 1`; the right dual gives `−α` on reconstruction | Correct |
| §6.1 Casimir sign | `T²`; `ℂP²` | `g^(αβ) = −1`, `g^(βα) = 1`, so `Σg^(ab)g_(ab) = 1 + 1 − 1 − 1 = 0 = χ`. `ℂP²`: antidiagonal Gram matrix, its own inverse | Correct |
| §8.1 cotangent lines | `M̄_(0,4)`; `M̄_(0,5)`; `M̄_(1,1)` | Only `I = {1,4}` qualifies, so 1; without anchors, 3. `(a + D)² = 0 + 2 − 1 = 1`; `(a + D)·D = 1 − 1 = 0`; `2!/(1!1!) = 2`. `1/24` weighted against `1/12` coarse | Correct |
| §8.2 `ψ_i` (R01 touches it) | `N = 6` against `12`; `M̄_(0,2)(ℂP¹, ℓ)` | `(1/12)c₁(L^12) = (1/12)·2c₁(L^6) = (1/6)c₁(L^6)`. `ψ₁ = −2h₁ + Δ`, so `∫ψ₁h₂ = −2 + 1 = −1` | Correct |
| §8.3 brackets (R01) | `X = pt`, (0,5), `k = (1,1,0,0,0)`; `ℂP¹`, (0,2,ℓ) | Ancestor `Φ(C(ψ̄₁) ⌣ C(ψ̄₂))` against `∫ψ̄₁ψ̄₂ = 2`; equal only given R01's item 4. `⟨τ₀(pt)τ₀(pt)⟩ = 1` with `d = 4 = s` | R01 |
| §8.4 string, dilaton, divisor (headline 4) | `X = pt`, `n = 5`; `ℂP¹` dilaton; `ℂP¹` divisor | `⟨τ₂τ₀⁴⟩ = 1`, `⟨τ₁²τ₀³⟩ = 1 + 1 = 2`, dilaton coefficient `(−2 + 3) = 1`. `(−2 + 1)·1 = −1`. `0 + 0`, with degree `8 ≠ 6` | Correct |
| §8.5 descendant–ancestor comparison | `ℂP¹`, (0,3,ℓ), `D₁`; string | `D₁` has complex dim 2 in 3, so real codimension 2; `ψ̄₁ = 0`. `⟨τ₁(pt)τ₀(pt)τ₀(1)⟩ = ⟨τ₀(pt)τ₀(pt)⟩ = 1`, all of it from `[D₁]`; dilaton coefficient 0 | Correct |
| §8.6 TRR (headline 4) | `X = pt`, `n = 4` and `n = 5`; `ℂP²`, (0,3,ℓ) | `1·1 = 1 = ∫ψ̄₁`. `1 + 1 + 0·0 = 2 = ∫ψ̄₁ψ̄₂`. By KM97 (4a), `⟨τ₁(pt) pt 1⟩ = ⟨pt, pt⟩_(0,2,ℓ)·⟨1, pt, 1⟩_0 = 1`, matching string | Correct |
| Tau Ceti contract (R02) | `a91d3aa`; `2fd255d` | `a91d3aa`: 19 of 23 files missing. `2fd255d`: 57 of 57 names found | R02 |

## Not verifiable

- These constructions have no primary source, and the README says so: §1.2's chart-level lift, §2.1's weighted adjoint, §3.2's analytic Hodge family, §3.3's master concordance, §6.4–§6.5's transfers and capped trace, and the analytic versions of §8.2 and §8.4–§8.6. The rows above test them on instances; they do not prove them.
- Deligne–Mumford (Numdam) §1, p. 77 (§3.2) was not re-read this round; it is outside the sample.
- The board's `sources.toml` records only `stacks-curves`. This review edits no manifest, so the four texts read here (KM94, KM97, Kock, Pardon) remain unrecorded there.

## Source issues

- **Error** in KM94 (arXiv hep-th/9402147v2) at (2.9), p. 6: the source defines the coefficient `χ(V)` of `I_(1,1,0)(e₀)` as the alternating sum of the `h^(i,0)`; it should be the topological Euler characteristic, the alternating sum of the Betti numbers (2 for `ℂP¹`, not 1); affects a stated result.
- **Misprint** in KM94 (arXiv hep-th/9402147v2) at 2.4.5, p. 10: the source places the obstruction sheaf on the genus-zero space of class β; it should be the space of genus `g`, class 0, maps `M̄_(g,n)(V, 0)`; affects nothing.
- **Misprint** in KM97 (arXiv alg-geom/9708024v1) at §1.1, p. 2: the source writes the stable range as `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`, as in Theorem 1.2; affects nothing.

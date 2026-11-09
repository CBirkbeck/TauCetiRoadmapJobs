# Review of GromovWittenTheory (pull request #990 at c8ad671)

**Verdict:** needs changes

:robot: Independent AI review, full pass. The head is the one the previous review read (no line of the folder changed). Four findings, all P3, none blocking. Two are new. §3.4 and §5.4 state the genus ≥ 2 degree-zero vanishing more narrowly than the source does. The References list two locators that no passage of the body cites, and one of the two is the only source for the sampled target §2.3. The other two findings carry over from the previous review: the Tau Ceti pin, and the folder conflict with #1998. The gate, the dependency check and the elaboration all pass on an independent rerun. Every sampled locator was checked against its source text.

## R01 (P3) — The genus ≥ 2 degree-zero vanishing is stated only for `n = 0`, narrower than Kontsevich–Manin 2.2.5

**Location:** `README.md:391` (§3.4): “For `g ≥ 2`, `n = 0` and `m ≥ 4` the class `I_(g,0,0)(1)` has degree `2(g − 1)m > 6g − 6` and vanishes.” The same instance is in §5.4's Check (`README.md:509`). §5.4 (`README.md:503`) gives the Hodge–Euler formula and states none of its consequences. §3.2's API (`README.md:356–358`) says nothing about pulling `𝔼_g` back along forgetful maps.

**Claim:** KM94 2.2.5 states two things.
- For `g = 1`, the nonzero degree-zero classes have `Σ|γ_i| ∈ {0, 2}` and are pulled back from the basic ones (2.9)–(2.10) (KM94 lines 208–215, p. 6).
- For `g ≥ 2`, `I_(g,n,0) = 0` for every `n` unless `dim_ℂ X ≤ 3` (KM94 line 218).

The README proves the formula these follow from, but states neither. Its only genus ≥ 2 statement is the `n = 0`, insertion-`1` case, and its degree argument does not extend to `n ≥ 1`. The general statement needs `π^*𝔼_g ≅ 𝔼_g` along forgetful maps, which §3.2 does not list.

**Witness:** Take `X = T² × ℂP³` (`m = 4`) and `α, β ∈ H¹(T²)`. Then `deg I_(2,2,0)(α, β) = 2 + 8 = 10 = dim_ℝ M̄_(2,2)`, a top class, and §5.2 does not apply. It vanishes only because the Hodge–Euler class is pulled back from `M̄_(2,0)`, where its degree 10 exceeds 6.

**Repair:**
- In §3.2, add the API bullet: for a forgetful map `π : M̄_(g,n+1) → M̄_(g,n)` with `g ≥ 1`, `π^*𝔼_g ≅ 𝔼_g`. The contracted component has genus zero and carries no residue-matched differential.
- In §5.4, add the bullet: for `g ≥ 1` and `n ≥ 1`, `I_(g,n,0)(γ)` is the pullback, along `M̄_(g,n) → M̄_(1,1)` for `g = 1` or `M̄_(g,n) → M̄_(g,0)` for `g ≥ 2`, of a class of degree `s + 2(g − 1)m`. Hence for `g = 1` it vanishes unless `s ∈ {0, 2}`, and for `g ≥ 2` and `m ≥ 4` it vanishes for every `n` (Kontsevich–Manin 2.2.5, p. 6).
- Make §3.4's third bullet the `n = 0` instance of that statement.
- Add the witness as a Check. On the refuting instance the repaired statement gives `0`, since degree `10 > 6` on `M̄_(2,0)`; the degree count on `M̄_(2,2)` alone allows a nonzero top class.

## R02 (P3) — Two locators the References list as cited are cited by no claim: Pardon Lemma 9.3.2 (§2.3) and Kontsevich–Manin (2.10) (§3.4)

**Location:** `README.md:809`: “Lemma 9.3.2 (its independence of `J`), p. 100”. `README.md:803`: “equations (2.9)–(2.10), p. 6”. §2.3 (`README.md:316–327`) carries no source locator, and neither does §3.4's second bullet (`README.md:390`).

**Claim:**
- §2.3 is the `J`-independence theorem. Its homology-pushforward form is Pardon Lemma 9.3.2.
- §3.4's degree-two bullet `⟨I_(1,1,0)(δ)⟩ = −(1/24) ∫_X c_(m−1)(TX) ⌣ δ` is the content of KM94 (2.10).
- The References present both as cited, but no passage of the body cites either, so the sampled target §2.3 has no locator.

**Witness:** `9.3.2` occurs only at `README.md:809`, and `(2.10)` only at `:803`. Pardon arXiv v6 line 4366, p. 100, states that `GW^β_(g,n)(X)` does not depend on `J`, proved by a path `J₀ → J₁`. KM94 line 211, p. 6, is (2.10).

**Repair:**
- §2.3, after “perfectness then gives `I_(g,n,A)^(J₀) = I_(g,n,A)^(J₁)`”, add: “(for the homology pushforward to `M̄_(g,n) × X^n`, Pardon, Lemma 9.3.2, p. 100; the class-valued form through the weighted pairing is this roadmap's)”.
- §3.4's second bullet: add “(Kontsevich–Manin (2.10), p. 6, where the characteristic class `X(V)` is left unspecified)”.
- Tested on §2.3's own Check: the lines-in-`ℂP²` value `1` at both ends of a path is an instance of Pardon's lemma.

## R03 (P3) — The README and the docstring read Tau Ceti at `2fd255d`, but the branch still pins `a91d3aa`

This is the previous review's R01, still not repaired.

**Location:** `README.md:66`, “### From Tau Ceti (commit 2fd255d)”, and the contract at lines 68–75. `Suggested.lean:31–47` (“The pinned Tau Ceti has …”). `lake-manifest.json:8`.

**Claim:** The branch manifest pins Tau Ceti `a91d3aa` (Mathlib `6b7abb3c`), while main pins Tau Ceti `2fd255d9`. At `a91d3aa` eight files that the contracts and the docstring name are absent:
- `Geometry/Symplectic/Manifold/AlmostComplex/Basic.lean`
- `AlgebraicGeometry/Curves/NodalGluing/Basic.lean`
- `Topology/Sheaves/Cech/Colimit.lean`
- `Topology/Sheaves/Cech/Pullback.lean`
- `Geometry/Manifold/SmoothSingular/Basic.lean`
- `Geometry/Manifold/SmoothSingular/Integral.lean`
- `RingTheory/NovikovSeries/Basic.lean`
- `RingTheory/NovikovModule/Basic.lean`

So the docstring's “the pinned Tau Ceti has `TauCeti.NovikovSeries` …” is false at the branch's own pin.

**Witness:** `lake-manifest.json:8` reads `a91d3aaf…`. `git merge-base --is-ancestor origin/main HEAD` fails. All eight files exist at `2fd255d` and are missing at `a91d3aa`.

**Repair:** Merge or rebase the branch onto origin/main (the worker's rebase step). No line of the folder changes.

## R04 (P3) — Pull request #1998 writes the same folder, and no order between the two is stated

This is the previous review's R02, still not repaired.

**Location:** the folder `TauCetiRoadmap/GromovWittenTheory/` (all three files), and this pull request's description.

**Claim:** #1998 (head `c41b144`, “algebraic Gromov–Witten theory and quantum cohomology”) adds a different roadmap under the same folder name. The two heads conflict in `README.md`, `Suggested.lean` and `metadata.toml`, and neither description says which one moves. The objects are distinct: Behrend–Fantechi classes on the numerical Chow ring there, analytic stable maps and implicit atlases here. So this is a naming and order conflict, not a double owner.

**Witness:** `scratch/overlaps.md`: “#990 and #1998 conflict in `TauCetiRoadmap/GromovWittenTheory/README.md`, `…/Suggested.lean`, `…/metadata.toml`”. `roadmaps list` shows both as new roadmaps named GromovWittenTheory.

**Repair:** State in this pull request's description that this roadmap keeps the folder `GromovWittenTheory`, the name HamiltonianFloerOperations already cites on main (its `README.md:17`, “GromovWittenTheory G0/G5–G7”), and that #1998 takes another folder name before either merges.

## Previous findings

- **R01 of the previous review: not repaired.** `lake-manifest.json:8` still reads `"rev": "a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039"`, and `README.md:66` still reads “From Tau Ceti (commit 2fd255d)”. It is R03 above.
- **R02 of the previous review: not repaired.** The description in `scratch/pull-request.md` still names no relation to #1998, which `roadmaps list` shows at `c41b144`. It is R04 above.
- **Settled findings:** no repair report marks either finding “not actionable in this package”. No commit on the branch says so, and the board's report folder holds only review and gate reports.

## Verified sound

### Gate, dependency check, build and Lean form

- **Gate rerun at `c8ad671`:** every check `0`, `OK`, exit 0. The worker's gate at this head also lists `build=0`.
- **Dependency check** (`--movable`, board merge order, main content): `depcheck: 239 roadmaps, 2320 edges, 0 problem(s)`. No UPWARD or CYCLE line. GromovWittenTheory sits at merge-order line 307, after its open suppliers ImplicitAtlases (214) and AnalyticStableMaps (215) and after TopologicalSheafCohomology (306, on main).
- **Elaboration:** `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` exits 0 in 14 s with no output.
- **`Suggested.lean` form:** 66 lines: `import Mathlib` alone, the module docstring “…: target signatures”, the namespace, no declaration. No `set_option`, sorry'd data, `lemma` or process comment.
- **Nothing to probe:** with no declaration there is no `#check @name` comparison to run and nothing to test for padding.
- **No changes outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty.

### Headline theorems

The README's Summary (`README.md:3`) lists four headline theorems, and the docstring names the same four:
1. the eight Kontsevich–Manin properties of `I_(g,n,A)`;
2. `I_(1,1,0)(1) = χ(X)·1`;
3. the unital CohFT over `Λ_ω` and the associative quantum product;
4. the string, dilaton and divisor equations and the genus-zero TRR.

None is statable at either pin. The reasons were checked at Tau Ceti `2fd255d`:
- No Chern class: `grep chernClass|ChernClass` finds nothing.
- No pseudoholomorphic stable-map moduli: `TauCeti/AlgebraicGeometry/Curves/StableMaps/*` is the algebraic `PrestableMap` over schemes.
- No implicit atlas.
- No Čech cup product.

### Sources read at the locators (all sampled targets with an external locator)

| Locator | Source line, page | What it says |
|---|---|---|
| KM94 Def. 2.2 | lines 128–131, p. 4 | domain `n + 2g − 3 ≥ 0` |
| KM94 2.2.0 | line 133, p. 4 | effectivity |
| KM94 2.2.1 | line 134, p. 4 | covariance |
| KM94 2.2.2, (2.2) | lines 137–142, p. 4 | shift `2(K_V·β) + (2g − 2)dim_ℂ V` |
| KM94 (2.3)–(2.4) | lines 143–158, p. 4 | basic list and codimension |
| KM94 2.2.3, (2.6)–(2.7) | lines 176–185, p. 5 | fundamental class |
| KM94 2.2.4 | lines 186–196, p. 5 | divisor |
| KM94 2.2.5, (2.8)–(2.10) | lines 197–219, pp. 5–6 | mapping to a point |
| KM94 2.2.6, (2.11) | lines 220–241, p. 6 | splitting |
| KM94 2.2.7, (2.12) | lines 242–246, p. 6 | genus reduction |
| KM94 2.2.8 | line 247, p. 6 | motivic axiom |
| KM94 2.4.5 | lines 408–422, p. 10 | `E_(g,n) = R¹π_*𝒪`; obstruction `E ⊠ TV` of rank `g·dim V` |
| KM94 Theorem-Definition 4.5 | line 816, p. 19 | quantum cohomology from the axioms |
| KM94 Definition 6.1 | lines 1455–1473, p. 31 | “coefficient field K”, no unit axiom |
| Stacks cohomology, Tag 01FP | line 2103, p. 46 | Section 25 |
| Stacks cohomology, τ | lines 2264–2267, p. 49 | the order-reversing operator |
| Stacks cohomology, (25.3.2) Tag 07MB | lines 2361–2370, p. 50 | the product; `ε(n,m,p,n) = 1`, no sign for a single sheaf (line 2373, p. 51) |
| Stacks cohomology | lines 2441–2513, pp. 52–53 | associativity, then graded commutativity through τ |
| Stacks curves, Lemma 18.3 Tag 0CE3 | line 1677, p. 38 | the four-term sequence |
| Stacks curves, Lemma 18.4 Tag 0CE4 | line 1691, p. 39 | normalization sequence for reduced `X` in the proof |
| Stacks curves, Lemma 19.7 Tag 0C4D | lines 1931–1941, p. 44 | item (6), δ-invariant 1, two branches |
| Pardon, Theorem 9.2.10 | line 4353, p. 100 | the GW implicit atlas |
| Pardon, Definition 9.3.1 | line 4355, p. 100 | pushforward to `M̄_(g,n) × X^n`, `2g + n > 2`; orientation sheaf trivialized |
| Pardon, Lemma 9.3.2 | line 4366, p. 100 | independence of `J` |
| Pardon, §5 introduction | lines 1690–1700, p. 40 | fiber-product formula desired, not proved |
| Pardon, remark | lines 4087–4090, p. 95 | the Kontsevich–Manin axioms need further properties |
| Kock 1.2.6 | line 245, p. 10 | restriction of cotangent lines to boundary divisors |
| Kock identity `ψ_i·D_(i,0) = 0` | line 308, p. 12 | |
| Kock 1.3.1 | line 310, p. 12 | the forgetful comparison |
| Kock 1.4.2 | line 368, p. 14 | string equation |
| Kock 1.5.1 | line 416, p. 15 | genus-zero integrals |
| Kock 1.5.2 | line 467, p. 15 | `ψ̄₁` in terms of boundary divisors |
| Kock 1.6.2 | line 501, p. 16 | dilaton, with the `⟨τ₁⟩₁ = 1/24` exception |
| Kock (5.1.7.1) | line 1885, p. 50 | |
| Kock (5.1.7.2)–(5.1.7.3) | lines 1899–1902, p. 51 | genus zero; editorial note on higher genus |
| Kock Proposition 5.1.8 | line 1904, p. 51 | |
| Kock Lemma 5.1.9 | lines 1914–1917, p. 51 | `ε^*ψ₁ = ψ₁ − E₁` |
| Kock Lemma 5.2.1 | line 2009, p. 53 | |
| KM98 §1.1, (1)–(2) | lines 53–70, p. 2 | descendant and generalized correlators |
| KM98 Theorem 1.2, (4) | lines 81–96, p. 2 | descendant–ancestor comparison |
| KM98 Corollary 1.3, (4a), and sketch | lines 99–118, p. 3 | |
| KM98 (11) | line 219, p. 5 | `(Σd_i)!/∏ d_i!` |
| KM98 Lemma 1.5.2, (12) | lines 238–244, p. 5 | divisor equation |
| KM98 Lemma 1.5.3 | lines 279–281, p. 6 | dilaton equation |
| Deligne–Mumford §1 | lines 98–104, p. 77 | facts b) and c), for stable curves of genus ≥ 2 (Definition 1.1, line 76) |

The previous review's register entries for these texts are confirmed below, with one new misprint (KM94's cross-reference for `X(V)`).

### Library declarations opened

- **Tau Ceti at `2fd255d`:** every one of the 62 names in the contracts resolves. Among them:
  - `RingTheory/NovikovSeries/{Basic,Multiplication,Topology,TopologicalRing,ExpLog,Functoriality,LaurentSeries,Grading}.lean`: `ext` (Basic:109), `single` (:448), `ofFinsupp_surjective_iff` (requires `Nontrivial R`), `instCommRing` (Multiplication:435), `isUnit_single`, `gradeBy.gradedMonoid` (Grading:165).
  - `RingTheory/NovikovModule/Basic.lean`: the carrier `{a | ∀ C, {s | a s ≠ 0 ∧ C < F s}.Finite}` (:53), `module` (:282), `basis` (:332).
  - `RingTheory/NovikovModule/Topology.lean`: `potentialFiltration` `{a | ∀ s, C < F s → a s = 0}` (:108), `tendsto_nhds_iff` (:260), `isLocallyConstant_apply_val` (:313), `denseRange_ofFinsupp` (:352). All are in a section with only `[Ring R] {F : S → ℝ}`, so “every ring, every potential” in §0.2 matches the library.
  - `RingTheory/NovikovModule/Grading.lean`: `gradeBy` (:55). There is no independence, closedness or decomposition statement, so §0.2's targets are not restatements.
  - The `NovikovModule` files the contract does not name (`Tensor`, `TensorProduct`, `Associativity`, `Commutativity`, `Unit`, `KernelMap`, `Leibniz`, `Continuation`) are Floer chain-level homotopies and completed external products; none states a §0.2 target.
  - `TauCeti.SmoothSimplex.integral` (SmoothSingular/Integral:86), `cechCohomology` and `cechCohomologyZeroIso` (Topology/Sheaves/Cech/Colimit), `cechComplexPullback`, `SmoothAlmostComplexStructure`, `GluedCurve` and `FlagPairData`, `stdComplexLineEnergyDensity_pos`, `IsPseudoholomorphic`, `singularCup`.
- **Mathlib at the branch pin `6b7abb3c`:**
  - `IsLocallyConstant.isClosed_fiber` (Topology/LocallyConstant/Basic.lean:70)
  - `isClosed_biInter` (Topology/Basic.lean:162)
  - `Algebra.TensorProduct.basis` (RingTheory/TensorProduct/Free.lean:65), whose type is `Basis ι A (A ⊗[R] M)`, which is why §0.2's commutativity step is needed
  - `AddMonoidAlgebra`, a structure at Algebra/MonoidAlgebra/Defs.lean:64
  - `Module.Basis` (LinearAlgebra/Basis/Defs.lean:89)
  - `LinearMap.BilinForm` (LinearAlgebra/BilinearMap.lean:529)

### Cross-roadmap citations resolved

- **AnalyticStableMaps at `41557ba`:** §0.1, §0.2, §1.1, §1.2, §2.1, §3.7, §4.1, §4.3, §6.2, §6.3, §7.3, §8.1, §9.1, §9.2, §10.1, §10.2, §11.1, §11.2, §12.1, §12.2, §13.1–§13.4.
  - §9.2's Check gives the `(1,1)` functional as “one half of the fundamental-class pairing”, as §2.2 uses it.
  - §12.2 says the unit, divisor and splitting axioms do not follow from atlas existence.
  - §13.4 assigns the operations, descendants and energy finiteness to this roadmap.
- **ImplicitAtlases at `81fc759`:** §0.7 (`cechCohomology` carrier and pullback), §1.1, §3.1, §4.2–§4.3, §5.2 (its `x` / `x²` Check), §5.3, §5.4, §5.6, §6.4, §6.5 (rectangular covers cofinal; Alexander–Whitney; no cup product), §7.1–§7.4. §7.4 states the GW axioms need application diagrams.
- **On main:**
  - TopologicalSheafCohomology §1.1 (TS1.1, tuple complex), §1.2 (TS1.2), §1.3.
  - ComplexCurveModuli D3 item 5, D4, D5, D6 item 4, D7 items 1–3, D8. All names are present, including `forgetAuxiliarySet`, `markedPointCollisionBubbleCharts`, `xv = t₁t₂`, `T_* ⊗ T_**`. D8 gives ineffective order 2 on `M̄_(1,1)` and `M̄_(2,0)` and orders 4 and 6 at `j = 1728, 0`.
  - Orbifolds O5 items 1 (`|G|⁻¹∫_U` with the full ineffective kernel), 4 (`(1/k)[|Γ|]`) and 5 (Thom classes and wrong-way maps).
  - CharacteristicClasses C1.2b (`cechSingularCWTypeComparison`, point-neighbourhood covers, no Čech cup product defined), C2, C3.
  - AlgebraicTopology Stage 5 item 1, Stage 6 items 1–2, Stage 7 item 1, Stage 8 item 7.
  - GeometricTopology smoothing-and-triangulation comparison item 1.
  - DifferentialGeometry 8.3–8.5 (`deRhamHom`, `deRhamEquiv`).
  - ComplexKahlerGeometry K5b; PseudoholomorphicCurveAnalysis PH1.1–PH1.2, PH3.2, PH6.1, PH6.3; PDE §1.6.
  - HamiltonianFloerOperations H1 (`q^A ↦ e^(−A)`, degree `+2c1(A)`) and H7, as the Downstream consumers paragraph says.

### Ownership and overlaps

- **`scratch/overlaps.md`:** it lists no id this roadmap cites that an open pull request drops, no id that only an open revision defines, and no dropped id of this pull request that others cite. Its one conflict is #1998 (R04).
- **Čech cup product:** `roadmaps grep` across main and every open head finds no other owner, so §0.4 is its only owner. ImplicitAtlases §6.5 and CharacteristicClasses C1.2b both state that they define none.
- **Quantum product and descendant equations:** no other owner. The only hits outside this roadmap are #1998 (algebraic, a different object), FukayaTheory (which names this roadmap as a separate theory) and HamiltonianFloerOperations (a consumer).
- **DGFloer #1798:** this is a revision of a roadmap on main. Its new 7.C.2d derives a genus-zero finiteness of classes below an energy bound from its own compactness contract, over compact metrizable parameter spaces. §0.3 here is the all-genus statement over the Conventions' parameter manifolds. The revision is not citable as a supplier, and the statements differ, so this is not raised against this folder.

### Adversarial pass

Coefficients ℚ. Write `d = d_(g,n,A)`, `t = 6g − 6 + 2n`, `s = Σ deg γ_i`, `r = t − d + s`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions / §2.2: `r` equals the Conventions degree | general; `ℂP¹ (0,3,0)`; `ℂP² (0,4,ℓ)`; `pt (1,1,0)` | `t − d = 2(g−1)m − 2c₁(A)`: `−2`, `−10`, `0`; KM (2.2) shift for lines `−6 − 4 = −10` | Correct |
| §0.1 effective set | `ℂP²`, `d < 0`; Enriques torsion `τ`; `(0,2,0)` | area `d < 0`; `ω(τ) = 0`, so not effective; constant 2-marked sphere has `ℂ^*` automorphisms, so empty | Correct |
| §0.2 `κ_B` and grading | `S²`, `B = {1, x}` | `d_B⟨1,k⟩ = 4k`, `d_B⟨x,k⟩ = 2 + 4k`; pieces: degree 4 `ℚ·q`, degree 6 `ℚ·qx`, degree 3 `0`; wrong model puts `q` in degree `−4` | Correct, discriminating |
| §0.2 potential sign | `v = 1 + q` | `v ∈ U_C` iff `C ≤ 0`; `κ(v)` in `potentialFiltration(−C)` iff `C ≤ 0`; at level `C` iff `C ≥ 0`; `F = +ω` admits `Σ q^(−k)` | Correct |
| §0.2 internal grading criterion | `c₁ = 0` (`T²×T²`, K3); `c₁(A) ≠ 0` | `Λ_ω = Λ_ω^0`; degrees `2(k c₁(A) + k² c₁(A₁))` take infinitely many values, areas `k ω(A) + k² ω(A₁) → ∞` | Correct |
| §0.2 perfect pairing | `T²`, basis `1, α, β, pt`; zero pairing | Gram determinant `−1` (one permutation, product `−1`); zero pairing has Gram `0`; shift `d₀ = d₁ + d₂ − n` | Correct |
| §0.2 closed pieces (general `F`, `d`) | `S = ℕ`, `F = −n`, parity; `d(n) = n` | parity pieces closed with sum everything; lines `ℚ[n]` closed, sum finitely supported, limit `Σ[n]` outside | Correct |
| §0.3 finiteness | `ℂP²`; `T²×T²`; Enriques; `3ℓ` | `⌊E⌋+1` classes; `≤ (2CE+1)^6`; torsion doubles each lattice point; 4 decompositions | Correct |
| §0.4 cup product | Stacks sign; τ; `T²`; two-point space; Warsaw circle | `ε(n,m,p,n) = (−1)^(n²+n+2np) = 1`; `χ(n)χ(p)χ(q) = (−1)^(pq)`; `θ₁⌣θ₂ ≠ 0`, `θ₁⌣θ₁ = 0`; `(f⌣c)₀₁ = 1_u`, `(c⌣f)₀₁ = 1_v`; `Ȟ¹(W; ℚ) = ℚ` vs singular `0` | Correct |
| §1.1 stable range | `ℂP¹ (0,0,ℓ)`; `(0,2,0)`; `(1,1,0)` | `d = 2(−2+2+0) = 0`, trivial automorphisms; `d = 2m − 2`, empty; `d = 2 = (2 + 2m) − 2m` | Correct |
| §1.2 diagrams | lines, `(0,3,ℓ)`; `M̄_(1,1) × X` | real dimension 10 maps to the point `M̄_(0,3)`; isotropy `ℤ/2` generic, `ℤ/4` at `j = 1728` (D8) | Correct |
| §2.1 weighted adjoint | `M̄_(1,1)`; `ξ : M̄_(0,3) → M̄_(1,1)`; `M̄_(0,4) → M̄_(0,3)` | `∫^wt [pt]^∨ = 1/2`; `c·(1/2) = 1` gives `ξ_*1 = 2[pt]^∨`; `π_*1` has degree `−2`, so `0`; `π_*[pt] = 1` | Correct |
| §2.2 `I_(g,n,A)` | `ℂP¹ (0,3,0)`; lines; `(0,4,ℓ)`; `pt (1,1,0)` | `r = s − 2`, `I(pt,1,1) = 1`; `s = 10` gives `r = 0`, value 1; `s = 12` gives 0; `r = 2 = t`, with `+2c₁` instead `r = 14 > 2`; `Φ = 1/2`, `c/2 = 1/2`, `c = 1` (unweighted gives `1/2`) | Correct |
| §2.3 endpoint equality | lines for `J` and `J′`; `xⁿ` atlases | `1 = 1`; classes `1, 0` on ℝ and `1, 2` on ℂ, no witness; Pardon Lemma 9.3.2 is the homology form, not cited (R02) | Correct; locator missing |
| §3.3 obstruction model | `g = 0`; `g = 1, m = 1`; `ℤ/2` on `Ob` | `Ob = 0`; `(2 + 2) − 2 = 2 = d_(1,1,0)` with real rank 2 for `Ob`; naive averaging gives `½(P + P∘g) = 0` on `Ob` | Correct |
| Headline 2 / §3.4 | `ℂP¹`, `pt`, `T²`; `δ = pt`; `m = 2` | `χ = 2, 1, 0` (source formula gives 1 for `ℂP¹`); `−1/24`; `c₂(L⊗V) = c₂ + c₁(L)c₁ + c₁(L)²`; genus reduction `tr(G⁻¹DG) = Σ(−1)^deg = χ` | Correct |
| §3.4 / §5.4, `g ≥ 2` (R01) | `X = T² × ℂP³`, `I_(2,2,0)(α, β)` | degree `10 = dim M̄_(2,2)` (degree count silent); on `M̄_(2,0)` `10 > 6`, so `0`; README states only `n = 0` | Narrower than the source (R01) |
| §4.1 effectivity | `ℂP²`, `−ℓ`; torsion; `2ℓ`, `(0,0)` | empty, `0`; empty, `0`; conics, effective set ≠ `{0}` | Correct |
| §4.2 covariance | `T²`, `(α, β, 1)` | `I(α,β,1) = 1`, `I(β,α,1) = −1` | Correct |
| §4.3 grading | `(0,3,0)`; `(0,4,ℓ)`; `(1,1,0)` | `s − 2m`; `s − 10`; `deg γ` | Correct |
| §5.1–§5.2 forgetful / fundamental class | non-basic list; lines `π_*(ev₃^*H)`; `⟨pt,pt,1⟩_ℓ` | targets `(0,3), (1,1), (2,0)`; `1`; `s = 8 ≠ 10`, `0` | Correct |
| §5.3 divisor | lines; conics | `1·1 = 1`, `s = 12`; `2·1 = 2`, `s = 22, 20`; wrong model gives `1` | Correct |
| §5.4 `g = 0` | `ℂP¹ (0,4,0)`; `T² (α,β,1)` | `1` and `0` (`s = 4 > 2`); `1` | Correct |
| §6.1 Casimir | `T²`; `ℂP²`; `S₁ = {2}` | `1+1−1−1 = 0`; antidiagonal, self-inverse; `ε = −1` | Correct |
| §6.2 splitting | `(pt,pt\|H,H)`; `(pt,H\|H,H)`; conics | left 0 (degree 2 on a point), right `1·∫H³ = 0`; `c = 1·∫H² = 1`; `r = −4` | Correct |
| §6.3 genus reduction | `M̄_(0,3) → M̄_(1,1)`; `M̄_(0,4) → M̄_(1,2)`; `ψ̄` model | `χ = χ`; right `s = 2m + 2`, so `0`; left `−λ₁∫c_(m−1)γ₁γ₂` with `ξ^*λ₁ = 0`; wrong model `∫ −ψ̄₁ = −1` | Correct |
| §6.4 transfers | `(E,p,q)`; genus 3; `(1,1)×(1,1)`; `(0,3)×(1,1)` | `2/1 = 2`; `2·1 = 2`; `2·4/4 = 2`; `1·2/2 = 1` | Correct |
| Headline 3 / §7.1 | `ℂP¹ Ω_(0,3)(pt,pt,pt)`; Enriques; `T²×T²` | `q`, degree `6 − 2 = 4`; `(q^τ−1)(q^τ+1) = 0`; `q^h − 1` not a unit | Correct |
| Headline 3 / §7.2 | `ℂP¹`; `ℂP²`; `T²` | `x⋆x = q`; `H⋆H = H²`, `H⋆H² = q`, `H²⋆H² = qH`, both associativity sides `qH`, `d_(0,3,2ℓ) = 16 > 12`; `e^α = −β`, `e^β = α` | Correct |
| §8.1 `ψ̄` | `M̄_(0,4)`; `M̄_(0,5)`; `M̄_(1,1)` | `1` (3 without anchors); `0 + 2 − 1 = 1`, `2`, `∫ψ̄₁D = 0`; `1/24` (coarse `1/12`) | Correct |
| §8.2 `ψ_i` | `M̄_(0,2)(ℂP¹,ℓ)`; `N = 6` vs `12` | `ψ₁ = −2[pt×ℂP¹] + [Δ]`, pairing `−1`; `(1/6)c₁ = (1/12)c₁` | Correct |
| Headline 4 / §8.3–§8.4 | `pt`; `ℂP¹`; `ℂP²` | string `1, 2`, dilaton `1`; dilaton `−1` (wrong coefficient gives 0), divisor `1·0 + 0`; `1·1 = 1` | Correct |
| §8.5 descendant–ancestor | `ℂP¹ (0,3,ℓ)` | `D₁` complex codimension 1 in complex dimension 3; dilaton `0`; string `1`, all from `[D₁]` | Correct |
| Headline 4 / §8.6 TRR | `pt`, `n = 4, 5`; `ℂP²` | `1`; `1 + 1 + 0 = 2`; `⟨τ₁(pt) pt 1⟩ = 1` from `[D₁]` | Correct |

### Note for the worker (not a finding against the folder)

The board's `sources.toml` records three of the seven works the README cites. The other four were fetched for this review from legal copies and read:
- Pardon: arXiv v6.
- Kontsevich–Manin 1998: arXiv v1.
- Kock: author page.
- Deligne–Mumford: Numdam.

They can be recorded.

## Not verifiable

- #1998's head was read only through `roadmaps list` and `roadmaps show --pr 1998`.
- `scratch/overlaps.md` names open pull requests without giving their files (for example #1187 Orbifolds). Ownership against those was checked only through `roadmaps grep` across all heads, not by reading them.
- The roadmap's own constructions have no source text: §3.2's scalar operator, §3.3's concordance, §6.5's capped trace and §8.5's `[D_i]_(supp,vir)`. They were checked for consistency with their Checks only.
- Mathlib names were checked at the branch pin `6b7abb3c`. Main's Mathlib pin `1b1ccf4` is not checked out here.

## Source issues

- **Error** in KM94 at 2.2.5, (2.9), p. 6: the source gives the coefficient of `I_(1,1,0)(e₀)` as `Σ_i (−1)^i h^(i,0)(V)`; it should be the topological Euler characteristic `Σ_(p,q) (−1)^(p+q) h^(p,q)` (`2` for `ℂP¹`, where the source's formula gives `1`); affects a stated result.
- **Misprint** in KM94 at 2.2.5, p. 6: the source defers the description of the class `X(V)` in (2.10) to 2.4.2, which is the definition of convexity; it should point to 2.4.5, p. 10, where mapping to a point is treated; affects nothing.
- **Misprint** in KM98 at §1.1, p. 2: the source writes the stable range as `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`; affects nothing.
- **Gap** in KM98 at Lemma 1.5.3, p. 6: the source states the dilaton equation with no exception; it should exclude `(g, n, β) = (1, 0, 0)`, where the left side is `χ(V)/24` and the right side involves the unstable space; affects a stated result.
- **Gap** in Kock at (5.1.7.2), p. 51: the source states the stable-map comparison on genus-zero spaces and leaves an editorial note asking for the any-genus statement; it should state its genus range or prove the higher-genus case; affects nothing.

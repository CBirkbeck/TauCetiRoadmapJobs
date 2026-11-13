# PORT-PotentialAutomorphyDworkMotivesPartII

- **Branch:** `roadmap/potential-automorphy-dwork-motives-part-ii`, from `45f58db`.
- **Head commit:** `1c994340` "PotentialAutomorphyDworkMotivesPartII: roadmap (README, Suggested.lean, metadata)".
- **Files:** `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/README.md`, `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/Suggested.lean` and `TauCetiRoadmap/PotentialAutomorphyDworkMotivesPartII/metadata.toml` (`topic = "math.NT"`). Nothing outside the folder changed.

## Which package text was ported

The board checkout had an older copy of `packages/PotentialAutomorphyDworkMotivesPartII/`: the 2026-11-08 submission. That copy has none of the repairs made after review rounds 3–7. Its `review.json` still records round 2 (`needs_changes`). For example, §3.1 there does not cite FourierDeligneTransform §2.6, and §2.3 still says "pp. 26–28".

The repairs live at head `3e807ed` of the package's repair branch (`FIX-PKG-PotentialAutomorphyDworkMotivesPartII~8`). That head applies all eight findings of `REV-PKG-PotentialAutomorphyDworkMotivesPartII~7` and every earlier round. I read its `README.md`, `Suggested.lean`, `metadata.toml` and its FIX~8 report, as data only. The port starts from that text. Porting the board copy would have undone six review rounds.

Against the board copy, `Suggested.lean` differs only in these places:
- `[Finite k]` instead of `[Fintype k]`;
- `qianGauss` is written as a `finsum`;
- the docstring cites the pinned `AlgebraicGeometry.Scheme.EllAdicCohomology`, `TauCeti.fiberLocalSystem` and `TauCeti.FiniteEtaleScheme.fiber`.

Please check this choice before pushing. If the board copy was meant to be authoritative, the diff from `3e807ed` to this branch's README is exactly the set of changes listed below.

## Checks

- **Build:** `lake build TauCetiRoadmap.PotentialAutomorphyDworkMotivesPartII.Suggested` ends with `Build completed successfully (18239 jobs).`
  - It gives 5 warnings, all `declaration uses 'sorry'`, at lines 97, 116, 136, 155 and 190.
  - Lake also prints its module-system advisory ("imports `Mathlib` … consider adding `module`"). The gate tool classifies that as Lake's advisory, not a lint, and it appears for every non-module roadmap on main.
- **Gate:** `gate PotentialAutomorphyDworkMotivesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable`) prints:

  ```text
  depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations:** I ran `roadmaps resolve` on the ported README against main and 455 open heads, index of 2026-11-13T15:28:17Z. It finds no cross-roadmap citation and no Lean name missing.
  - The tool did not check library names, because no pinned packages were visible to it. I checked those myself, as below.
- **Library names at the pins:** all 53 Mathlib names the README and docstring use elaborate under `#check` at the pinned Mathlib `1b1ccf4`. Among them are:
  - `LinearEquiv.mem_transvections_pow_mul_dilatransvections_of_not_isExceptional`;
  - `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`;
  - `IsAdicComplete.henselianRing`, `Nat.exists_prime_and_dvd`;
  - `AlgebraicGeometry.Scheme.EllAdicCohomology`, `BDeRham`, `CategoryTheory.PreGaloisCategory.functorToContAction`.

  I put these `#check` lines at the end of `Suggested.lean` for one build and then removed them.
- **Tau Ceti names at the pin `2fd255d`**, checked by file, line and namespace:
  - `LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:600`;
  - `…/Perfect.lean:102, 116`;
  - `LinearAlgebra/Projectivization/PSL/Simple.lean:127, 142`;
  - `LinearAlgebra/Matrix/RationalCanonicalFormFinTwo.lean:69`;
  - `AlgebraicGeometry/FiniteEtale/Basic.lean:66`, `Fiber.lean:117`, `Galois/Category.lean:111, 122`;
  - `AlgebraicTopology/Singular/Fibration/LocalSystem.lean`;
  - the Hecke-character files `NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70`, `Algebraic.lean:60`, `InfinityType.lean:226` and `Purity.lean:98`.
- **Elaborated signatures:** I added `#check @name` for all 10 declarations and the four structure fields in one build, as described above.
  - Every elaborated type matches its README statement: binders, hypotheses `hl, hN, hn, hNn, hζ, hgen, hminus/σ`, the char-poly and rank hypotheses, and the conclusions.
  - No declaration uses a section `variable`, so no binder can be lost. No change was needed.
- **Shape:** a script confirms 84 numbered targets, each with exactly one *Needs:* line and at least three Checks. All 10 layers end with `### Examples` and `### Dependencies`.
- **Ownership against open pull requests:** checked with `roadmaps grep` and `roadmaps show` over all open roadmap heads (449, later 455) and main, by object. See "Duplication sweep".

## Draft pull request body

This roadmap builds the Dwork pencil `X₁ᴺ + ⋯ + X_Nᴺ = N t X₁⋯X_N` over the punctured line `ℙ¹ − ({∞} ∪ μ_N)`. On it, it builds the eigen-local-systems that characters of the diagonal symmetry group cut out of the middle cohomology. It then develops the arithmetic and geometric theory of these Dwork motives that potential-automorphy arguments use to move between Galois representations at two primes:
- the finite classical-group inputs: finite unitary groups, Hermitian forms over finite fields, Zalesskii–Serezhkin, and Artin's non-isomorphism theorem;
- Katz's hypergeometric sheaves and the comparison characters;
- maximally unipotent complex monodromy at infinity and full special linear, special unitary and symplectic residual monodromy;
- level-structure torsors and Gauss-sum determinants;
- de Rham, crystalline, ordinary and Steinberg local behaviour of the fibres, and the weakly compatible Dwork systems.

The end theorems are the switching theorems:
- Qian's theorem for non-self-dual Dwork motives;
- the symplectic switch in the self-dual family used by Barnet-Lamb–Gee–Geraghty–Taylor;
- the auxiliary systems `R_aux` and `S_UA` of Boxer–Calegari–Gee–Newton–Thorne, with their rank-two variants through twisted modular curves.

PotentialAutomorphyInfrastructure supplies the automorphy-lifting interface and leaves the Dwork families to their own roadmap. PotentialAutomorphyInfrastructurePartII consumes this one for its potential ordinary automorphy with Steinberg places. `Suggested.lean` states the five finite-field headlines that are statable at the pins: the four residual hypergeometric group theorems and Qian's Gauss-sum determinant formula. Its docstring names the geometric and `p`-adic headlines that lack carriers.

## Roadmaps this one depends on that are still pull requests

All of these are earlier in the merge order than this roadmap (line 245):

| Roadmap | Merge-order line |
|---|---|
| AlgebraicModuliForArithmeticGeometry | 35 |
| ComplexComparisonPartII | 40 |
| AbelianSchemesAndArithmeticModuli | 42 |
| InverseGaloisAndArithmeticFundamentalGroups | 53 |
| ArithmeticGaloisRepresentations | 57 |
| ArithmeticGaloisDuality | 61 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | 65 |
| LefschetzPencilsAndVanishingCycles | 68 |
| FourierDeligneTransform | 69 |
| ModularCurvesPartII | 71 |
| DeligneWeightsAndPurity | 72 |
| LocalGaloisDeformationRings | 86 |
| HypergeometricMotives | 102 |
| EtaleDualityAndPerverseSheaves | 107 |
| PadicDifferentialEquationsAndRigidCohomology | 120 |
| PadicHodgeTheory | 123 |
| CharacterSumsOverFiniteFields | 159 |
| PotentialModularityAndCompatibleSystems | 176 |
| PotentialAutomorphyInfrastructure | 193 |
| ModularityAndLanglandsExtensions | 197 |

Suppliers on main: ClassicalArithmeticCompletion, EtaleCohomologyFoundations, SchemeAndStackFoundations, BelyiMaps, ModularCurves, EllipticCurves; Chebotarev and GlobalNumberFields (completed). FiniteFlatGroupsAndIntegralPadicHodgeTheory is a new edge added by this port.

No cited id is defined only by an open revision.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the rules:
- one `import Mathlib`;
- four small definitions with real bodies, all needed by the headlines: `qianIndexSet`, `selfDualIndexSet`, `ZeroShapedDatum` with `ZeroShapedDatum.indexSet`, and `qianGauss`;
- five headline theorems;
- no padding, sorry'd data or `set_option`.

I checked whether a statable headline was missing and considered §§0.10, 0.11, 1.1 and 1.5. They are inputs or lemmas, not end results. The summary names Zalesskii–Serezhkin as a tool from which the residual-monodromy headlines are proved.

The only Lean change is in the docstring. "is imported there, not restated here" now reads "Levelt's rigidity theorem, which README §0.3 reads in this roadmap's order of the triple, is HypergeometricMotives §3.4 (`levelt_rigidity_field`); it is not restated here."

I re-verified the docstring's "not statable" claims at the pins:
- `AlgebraicGeometry.Scheme.EllAdicCohomology` is absolute pro-étale cohomology of one scheme (Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76).
- `TauCeti.fiberLocalSystem` is fibration homology.
- `BDeRham` is a ring only.
- Neither library has Weil–Deligne representations, `D_cris`/`D_dR` functors, weakly compatible systems or Moret-Bailly; a pin grep finds no matches.
- Tau Ceti's Hecke characters have no `ℓ`-adic avatars.

## Supplier replacements and duplication removals

All of these are recorded in README "Scope and ownership" (the leaves-to list and Kept variants) and in the supplier contracts.

1. **§9.6 duplicated FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11.** That target owns the reduction of rank-two crystalline representations of `G_{ℚ_p}` with weights `(0, k − 1)`, `1 < k < p`. It is earlier in the merge order (line 65).
   - §9.6 now cites it for `m ≤ p − 2`, applied to `r^∨` because that roadmap uses `HT(ε) = +1`.
   - §9.6 keeps only the translation to cohomological weights, the comparison with LocalGaloisDeformationRings' `ρ̄_{2,m,0}`, and the endpoint `m = p − 1`, which comes from Berger's theorem.
   - Every use of §9.6 has `m ≤ p − 2`: `m = 1` in §§9.7(vi) and 9.11, and `p > 2nm + 1` in §9.9.
   - Added a contract subsection, *Needs*, the Layer 9 Dependencies, a Scope entry and a Kept-variant clause.
2. **§0.11(2)'s route used Dickson's classification from Dickson's book directly.** ArithmeticGaloisRepresentations §4.4 owns that classification, so the route now consumes it.
   - Updated *Needs*, the ArithmeticGaloisRepresentations contract, Scope and the Layer 0 Dependencies.
   - The sketch also misstated the dihedral case. "dihedral … subgroups generated by elements of order `l` are reducible" now reads: a dihedral subgroup of order prime to `l` has no element of order `l`.
3. **GlobalNumberFields Layers 9–10 is completed and implemented in Tau Ceti.** The Tau Ceti contract now names `TauCeti.GlobalNumberFields.HeckeCharacter`, `.infinityType`, `.IsAlgebraic` and `.add_conjugate_eq_add_conjugate` (purity).
   - The converse of purity is still absent at the pin, so `gap:cm-hecke-characters-with-prescribed-infinity-type` stays.
   - Precedent for a gap addressed to a completed roadmap: BelyiMaps on main has one against PolynomialGaloisGroups.
4. **Kept-variant clauses added, with no deletion:**
   - Layer 3 against HypergeometricMotives §5.0. That section builds the lisse sheaf of a cyclotomic datum over `ℚ` from a toric hypersurface. Layer 3 is Katz's convolution sheaf over `ℤ[ζ_N, 1/N]` for character lists that are not Galois-stable.
   - §0.9(2) against CFSGBasicProperties T1–T2. That roadmap proves simplicity of `²A_{n−1}(q)` on its Steinberg-fixed-point carrier, not for the matrix group `SU_n(ℓ)`.

## Duplication sweep (by object, main and every open head)

Each object was searched with `roadmaps grep` and the result is recorded with its outcome:

| Object | Result |
|---|---|
| Zalesskii–Serezhkin | only profinite "Zalesskii" hits; owned here |
| Dwork pencil | ModularityAndLanglandsExtensions §§2.9–2.14 (Kept variants already); PeriodsAndSpecialValues PS.8 (the reciprocal family's semistable model, later in the order, not owned here); PotentialAutomorphyInfrastructurePartII (consumer) |
| Fermat hypersurface | examples only elsewhere |
| Hypergeometric sheaves | HypergeometricMotives §5.0 (clause added) |
| Finite unitary groups and Hermitian forms over finite fields | no owner (ClassicalGroupsPartII is symplectic similitudes) |
| Simplicity of `PSU_n` | CFSGBasicProperties (clause added) |
| Artin's order theorem | no owner (CFSGBasicProperties disclaims non-isomorphism) |
| Dickson's classification | ArithmeticGaloisRepresentations §4.4 (now consumed) |
| Goursat-type lemma (§0.12) | ArithmeticGaloisRepresentations' Goursat is for `S^r` with `S` simple; ours differs |
| Drinfeld–Kedlaya slopes | no owner (PadicDifferentialEquationsAndRigidCohomology has full faithfulness and specialization, both consumed) |
| Kisin local constancy | AbelianSurfacesModularity cites KIS99 only |
| Crystalline reductions | FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11 (now consumed) |
| Twisted modular curves | ModularityAndLanglandsExtensions §2.23 builds them over number fields at prime level, without the geometric mod-`p` monodromy and not at composite level `pq`; the gap against ModularCurvesPartII stays (see Unresolved) |
| Torsion-freeness of complete intersections | EtaleDualityAndPerverseSheaves §4.3 (already consumed) |
| Conjugate self-dual ⇒ unitary | automorphic owners only; §0.8 is finite-field linear algebra |

## Other fixes from the upstream read (whole README)

1. **The rank range was vacuous at the top.**
   - "`2 ≤ n ≤ N`" in the Conventions and §1.4 is now "`2 ≤ n ≤ N − 1`".
   - A rank-`n` datum takes `N − n` distinct values, so `n = N` admits no datum.
   - The zero vector, of rank `N − 1`, stays allowed.
2. **`gcd(N, n) = 1` was implicit where consumers use it.**
   - §4.4 proves unipotence at infinity using `gcd(n, N) = 1`, a standing Convention. §5.6 (self-dual symplectic monodromy) and §9.4 (the self-dual switch) inherit it through §§4.7 and 5.6.
   - Neither statement said so, and §9.4's choice of `N` did not require `N` prime to `nᵢ`.
   - Witness that the hypothesis matters: `n = 6`, `N = 9` gives `gcd = 3`, and a scalar cube root of unity `c` has `c⁶ = 1 = c⁹`, so the determinant argument of §4.4 does not force `c = 1`.
   - Both statements now carry the hypothesis. §1.1 makes such an `N` available.
3. **Missing Dependencies entries**, found by a script comparing *Needs:* lines with each layer's Dependencies:
   - Layer 1: ModularityAndLanglandsExtensions §2.9 (the projector, §1.3);
   - Layer 2: ModularityAndLanglandsExtensions §§2.9, 2.14 (§§2.3, 2.5);
   - Layer 7: EtaleCohomologyFoundations §F.0.2 (§7.10);
   - Layer 9: Mathlib `IsAdicComplete.henselianRing` (§9.5).
4. **Downstream consumers.** The PotentialAutomorphyInfrastructurePartII bullet now lists all the ids that roadmap cites, including §6.8 and the ownership list (§§1.1–1.4, 2.3–2.7, 4.6, 5.6, 5.10–5.12, 7.7). Every cited id is unchanged.

No id was renumbered or dropped. The scan for process words, LaTeX, pull-request numbers and paths finds nothing; the gate agrees.

## Adversarial mathematics pass

Every value below was computed for this port. The tools were Python scripts in my scratch directory (exact integer and finite-field arithmetic) and the elaborated Lean types. Rows marked "conv." are conventions.

### Conventions and Lean signatures

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| conv. rank range | `n = N`; `a = 0` | `N − n = 0` distinct values: no vector; `a = 0` has 1 value, `n = N − 1` | upper end vacuous | `n ≤ N − 1` |
| conv. `gcd(N, n) = 1` | `n = 6, N = 9` | `c` a primitive cube root of 1: `c⁶ = c⁹ = 1` | needed by §4.4 | made explicit in §§5.6, 9.4 |
| conv. `(h⁻¹)*`, Hodge degree | Fermat cubic | `(1,1,1)`: `3/3 − 1 = 0`; `(2,2,2)`: `6/3 − 1 = 1` | consistent with §2.1 | none |
| conv. geometric Frobenius | `ℚ_ℓ(1)`; `H¹(E)` | `q⁻¹`; `X² − aX + q`, `det = q` | sound | none |
| conv. HT sign | `ℚ_l(1)` | `−1` here, `+1` in PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory | §9.6 uses `r^∨` accordingly | none |
| conv. fundamental characters | `K = ℚ₅(√5)`, `ū = 2` | `ω = 2`, `ω^e = 4 = ε̄₅`; without `e`: `2` | sound | none |
| conv. denominators | `N = 401`, `λ \| 401` | `#H₀ = 401^{399}`, a unit of `M_λ`, not of `O` | sound | none |
| conv. peripheral loops | substitution | `p₀·p₀⁻¹p₁p₀·p∞ = p₁p₀p∞ = 1` | sound | none |
| `qianIndexSet` | `(401, 3)`, `(501, 4)`, general odd/even `n` | `{1,2,398}`, `{1,2,3,495}`; complement of `−values` equals `{1,2,−3} ∪ [(N−n+4)/2, (N+n−4)/2]` (odd) and `{1,2,3,−6} ∪ [(N−n+5)/2, (N+n−5)/2]` (even); entry count `2 + (N−n−4)/2 + (N−n−2)/2 + n + 1 = N` | matches §1.4 | none |
| `selfDualIndexSet` | `(7,2)`, `(5,2)` | `{3,4}`, `{2,3}` | matches | none |
| `ZeroShapedDatum` | `n = 0`; `a = 0`; `(0,0,0,1,3,5,5)` | `n = 0`: all residues once, sum `N(N−1)/2 ≡ 0`; `a = 0`: `n = N − 1`; the `N = 7` vector fails `card_zero` (3 ≠ 4) | defines the intended class | none |
| `qian_hypergeometric_group_eq_SL` | `N = 401, n = 3`, `l = 5` and `l = 3` | `ord₄₀₁(5) = 25` (odd, hypotheses hold); `ord₄₀₁(3) = 400`, `3²⁰⁰ ≡ 400 ≡ −1` (`hminus` fails, §5.3 instead); `∑B = 401 ≡ 0` so `det h₁ = 1`; `l ∤ N` forced by `IsPrimitiveRoot` | true; context complete | none |
| `selfDual_hypergeometric_group_conj_Sp` | `m = 2, N = 7, l = 3` | `B = {2,3,4,5} = −B`, sum `14`; `[𝔽₃(ζ₇):𝔽₃] = 6`, `[𝔽₃(ζ₇+ζ₇⁻¹):𝔽₃] = 3` since `3³ ≡ −1 (mod 7)`; char poly over `k`: pairs `X² − (ζᵇ+ζ⁻ᵇ)X + 1` | true | none |
| `qian_hypergeometric_group_conj_SU` | `l ≡ −1 (mod N)` | `σ = Frob_l`, `σ² = 1`, `σ ≠ 1` (`N ≥ 3`) | true | none |
| `qian_two_prime_hypergeometric_group` | `l₁ = 5`, `l₂ = 3209` | `3209` prime, `= 8·401 + 1`, smallest prime `≡ 1 (mod 401)`; `ord(7) = ord(11) = 200` with `7¹⁰⁰ ≡ 11¹⁰⁰ ≡ −1 (mod 401)` (excluded) | true | none |
| `zeroShaped_gauss_product` | `n = 0`; `a = 0`; `N = 7` datum `(0,0,0,0,1,2,4)` | `B = ∅`, `1 = 1`; `∏_{b≠0} g(b) = q^{(N−1)/2}` both sides; exponent `n(N−n)/2 ∈ ℕ` (`N` odd); `N − n` not truncated (`n ≤ N − 1`) | true | none |

### Layer 0

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 pseudo-reflections | `diag(1,2)`, `−1`, `diag(0,1)`, Jordan block, `w(2)w(−1)` | rank of displacement `1, 2, 1, 2`; `w(2) = [[0,2],[−1/2,0]]`, `w(−1) = [[0,−1],[1,0]]`, product `diag(2,1/2)` | sound | none |
| §0.2 | `p = (X−1)²`, `q = (X−2)(X−4)` over `ℚ` | `C(q)C(p)⁻¹ − 1 = [[7,0],[−4,0]]`, rank 1, first column | sound | none |
| §0.3 | `n = 1`; non-coprime pair | `βα⁻¹`, `g = 1`; `(1,1)` vs `(1,J)`: char polys `(X−1)²`, ranks `0, 1`, not conjugate | sound | none |
| §0.4 | `𝔽₇`, `h∞ = C((X−1)²)`, `h₀⁻¹ = C(X²+X+1)`; `diag` control | 0 common invariant lines over `𝔽₇` (enumerated 8 lines); `h₁ = diag(1, 3/4)`, spectra `{2,3}`/`{2,4}` meet | sound | none |
| §0.5 | `n = 0,1,2,3`, `q = 3` | `#SU₁ = 1`, `#SU₂(𝔽₉) = 24`, `#SU₃(𝔽₉) = 6048`; `#U₁(𝔽₉) = 4` | sound | none |
| §0.6 | `η` with `c(η) = −η` | `(ηB)(y,x) = ηc(B(x,y)) = −c((ηB)(x,y))` | sound | none |
| §0.7 | `𝔽₉ = 𝔽₃[i]` | `N(i) = i⁴ = 1`, `N(1+i) = (2i)² = 2` | sound | none |
| §0.8 | `V = ℓ²`, trivial `G` | `diag(1,1)`, `diag(1,2)` non-proportional | sound | none |
| §0.9 | `PSL₃(𝔽₃)`; `SL₃(𝔽₇)`; `SL₂(𝔽₃)` | `27·8·26 = 5616`; centre `gcd(3,6) = 3`; abelianisation order 3 | sound | none |
| §0.10 | `PSL₂(11)`; `PSp₂(5)`, `PSp₂(7)` | `660` vs `3^r(3^{2r}−1)/2 = 12, 360, 9828`; `60`, `168`; `#PSL_n(q)` strictly increasing in odd `q` (`(5/3)⁸ ≈ 59.5 > 3` for `n = 3`) | true (bound stronger than needed) | none |
| §0.11 | `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)`; Dickson cases | elements of order 3 in `SL₂(𝔽₉)` are transvections; a dihedral subgroup of order `2n` with `3 ∤ n` has no element of order 3 | (2) sketch misworded | wording fixed, AGR §4.4 consumed |
| §0.12 | `SL₃(𝔽₁₃) × SL₃(𝔽₃ʳ)`; diagonal; `SL₂(𝔽₃)` | diagonal proper; `PSL₂(13)` not a factor of `SL₂(3)` (orders 1092 vs 24) | sound | none |
| Layer 0 Example | `p = (X−1)³`, `B = {1,2,398}` | `det C(q) = ζ^{401} = 1`, `det C(p) = 1` | sound | none |

### Layer 1

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 | `l = 3, s = 4, N = 35`; `l = 2, N = 7`; prime `N` | `ord₃₅(3) = 12`, `3⁶ ≡ 29 ≢ 34`; `ord₇(2) = 3`; `A \| l^{2^{t−2}}+1` has `ord = 2^{t−1}`, so `l^j ≡ −1 (mod AB)` is impossible | sound | none |
| §1.2 | `N = 3, 5`; `t = ζ` | `3 = 3¹`, `125 = 5³`; with `X₁ = 1`, `X_i ∈ μ_N`, `∏_{i≥2}X_i = t⁻¹`: `N^{N−2}` points | sound | none |
| §1.3 | `#H`, `#H₀`; `(1,…,1)` | `N^{N−1}`, `N^{N−2}`; `∑ = N ≡ 0`, nontrivial on `H` | sound | none |
| §1.4 | `(1,1,2,2,4)`; `(0,0,0,1,3,5,5)`; `(0,0,0,0,1,2,4)` | `B = {0,2}`, sum 2; `B = {1,3,5}`, sum `9 ≡ 2`; `B = {1,2,4}`, sum 7 | sound | range fixed |
| §1.5 | `N = 401, n = 3`; `N = 7, n = 2`; `N = 11, n = 8, d = 5` | `2B = {2,4,395}`; `{6,1}`; overlap `0 + 0 = 0` | sound | none |
| §1.6 | `N = 3`, `t′ = 8` | fibre `{2, 2ζ₃, 2ζ₃²}`; `t′⁻¹t^N X_N^N = X_N^N` | sound | none |
| Layer 1 Example | `l = 3, 5`, `N = 401` | `3²⁰⁰ ≡ −1`; `ord(5) = 25` | sound | none |

### Layer 2

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 | `N = 3, 5`; `k = 𝔽₂₅`, `ℓ = 5` | counts `2`, `204` (enumerated); `#X(𝔽₅) = 6`, `#X(𝔽₂₅) = 36` (enumerated), trace `−10`, so `H¹(ℤ/5) = 0` | sound | none |
| §2.2 | plane cubic, quadric, quintic | `ℤ²`, `ℤ²`, rank `204` | sound | none |
| §2.3 | `N = 5` rank | full middle rank `204 ≠ n = 2` | sound | Layer 2 deps fixed |
| §2.4 | twist | `H^{2N−4}` of weight `2(N−2)`, twist `2 − N`; misprint `1 − N` gives weight `2N − 2` | sound | none |
| §2.5 | `e = ((1+ς)/2)(e_χ + e_{χ⁻¹})` | `ς` reverses `a` to `−a`; `e² = e`; twist `2 − N + (N−1−n) = 1 − n` | sound | none |
| §2.6 | `N = 5, n = 2, l = 3` | `ord₅(3) = 4`: `k(λ) = 𝔽₈₁`, `O⁺` gives `𝔽₉`; `5 ∤ 8` | sound | none |
| §2.7 | Hesse | `B = {1,2}`, rank 2 | sound | none |
| Layer 2 Example | `(1,0,0,0,4)` | sums `10, 15`, grades `1, 2` | sound | none |

### Layer 3

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.1 | `q = 7, N = 3, x = 3`; `ρ(ζ) − 1` units | `μ₃(𝔽₇) = {1,2,4}`, `3² = 9 ≡ 2`, gives `ω` (inverse convention `ω²`); `1 − ζ_d` is a nonunit only for `d` a prime power | sound | none |
| §3.2 | `n = 2`, `(ρ, ρ⁻¹)` | `det = M(−1)`, Frobenius `q`; weights `n(n−1)/2` | sound | none |
| §3.3 | `n = 1, 2` | unipotent block at 0, eigenvalues `ρᵢ(ζ)` at `∞` | sound | none |
| §3.4 | `(1,2,2,0,0)`, `N = 5` | zero twice (needs 3) | sound | none |
| §3.5 | weights | `Ψ`: `N − n − 1`; `Ψc(Ψ) = ε^{2−N−(1−n)} = ε^{n+1−N}`; `n = 2, N = 5`: `2`, `det` weight `6` | sound | none |
| §3.6 | `S₃` control | `[2] → [1,1]` on `A₃` | sound | none |

### Layer 4

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.1 | cover `t ↦ t^N` | `γ₀ ↦ 1`, `γ₁ ↦ 0` (μ_N unramified), index `N`; `γ₀^N` contractible in `T₀` | sound | none |
| §4.2 | `n = 3, N = 401` | `ζ·ζ²·ζ^{398} = ζ^{401} = 1` | sound | none |
| §4.3 | `g = 1 + v ⊗ f` | `det = 1 + f(v)`, `(g−1)² = f(v)(g−1)` | sound | none |
| §4.4 | `n = N = 3`; `n = 6, N = 9` | `c^n = c^N = 1` allows `c ≠ 1` when `gcd > 1` | sound under convention | hypothesis made visible downstream |
| §4.5 | `C((X−1)³)`, `C((X−1)²)` | last column `(1,−3,3)ᵀ`; `[[0,−1],[1,2]]`, `det 1`, trace 2 | sound | none |
| §4.6 | `[[1,1],[0,1]]^p` in char `p` | identity | sound | none |
| §4.7 | `N = 9, 15`, `l = 3` | `(X−1)⁶ = X⁶ − 2X³ + 1 ≡ Φ₉ (mod 3)`; `Φ₁₅ ≡ Φ₅² (mod 3)` | sound | none |
| Layer 4 Example | `N = 5`, `B = {2,3}` | `(X−ζ²)(X−ζ³) = X² − (ζ²+ζ⁻²)X + 1` | sound | none |

### Layer 5

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.1 | as for its Lean row | `∑B ≡ 0`; `G/Δ` of order dividing `gcd(l^k, N) = 1` | sound | none |
| §5.2 | as for its Lean row | `B = −B` | sound | none |
| §5.3 | `l ≡ −1` | `k = 𝔽_{l²}` | sound | none |
| §5.4 | `l = 5, 3209`; `l = 7, 11` | see the Lean row | sound | none |
| §5.5 | `N = 603, l = 7237` | `7237` prime, `= 12·603 + 1`, `gcd(3, 7236) = 3` | sound | none |
| §5.6 | `N = 5, l = 3`; every pair of order-3 elements of `SL₂(𝔽₅)` | `t` a root of `X² + X + 2` in `𝔽₉` (two roots); `ord A = 3`, `ord B⁻¹ = 5`, `ord BA⁻¹ = 3`; `#⟨B⁻¹, A⟩ = 720` (enumerated); products of order-3 elements of `SL₂(𝔽₅)` have orders `{1,3,4,6,10}` (all 400 pairs), never 5 | sound | `gcd` made explicit |
| §5.7 | `l ≡ ±1 (mod N)` | `c = Frob_l` or no `c` | sound | none |
| §5.8 | `n = 3` | `[SL₃(𝔽_{l²}) : SU₃] > 1` | sound | none |
| §5.9 | `(0,0,0,0,1,2,4)`; `n = 3, l = 7` | 7 loops, each with `(T−1)² = 0`; `ε̄₇` of order 6, `ε̄₇^{−3}` of order 2 | sound | none |
| §5.10 | `PSL₂(𝔽_q)` orders | `q(q²−1)/2` increasing | sound | none |
| §5.11 | `SL₃(𝔽₇)`; `SL₂(𝔽₁₁)` | `5630688`; `1320` | sound | none |
| §5.12 | same characteristic | monodromy is not the product | sound | none |
| Layer 5 Example | `3209 mod 3` | `2` | sound | none |

### Layer 6

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.1 | Fermat cubic over `𝔽₇` | 9 projective points (enumerated); `J(χ,χ) = −1 − 3ω`, norm 7; `J + J̄ = 1`; wrong sign gives 7 | sound | none |
| §6.2 | identity; `N = 2` control | `∏_j g(a_j+b) = g(b)^n ∏_{u≠0}g(u)/∏_{b′≠b}g(b−b′)`; exponent `n(N−1)/2 − n(n−1)/2 = n(N−n)/2` | sound | none |
| §6.3 | `N = 301, l = 3, p = 5` | `ord₃₀₁(5) = ord₃₀₁(3) = 42`; `3^j ≡ −1` only for `j = 21` in `[1,42]` | sound | none |
| §6.4 | `N = 7`, `l = 43`, `v \| 29`, all 6 `λ` | non-zero-shaped `(0,0,0,1,3,5,5)`: determinants `22, 4, 31, 6, 7, 29` (computed in `𝔽₄₃[y]/Φ₂₉`); 14th powers `1, 1, 36, 36, 6, 6`; `29²⁸ ≡ 36`. Zero-shaped `(0,0,0,0,1,2,4)` at `v \| 29, 113, 127`: values `{41, 42}`, `{27, 1}`, `{27}`, all cubes | the hypothesis is needed and suffices | none |
| §6.5 | `𝔽₅, m = 2`; `𝔽₇, m = 3`; `𝔽₅, m = 3` | `√−1 = ±2`; cubes `{1, 6}`; cube roots of 1 in `𝔽₂₅ − 𝔽₅`; `μ₃(𝔽₇) = {1,2,4}` | sound | none |
| §6.6 | `n = l = 3` | `m = 1`; `l = 7`: `3` not a cube in `𝔽₄₉` | sound | none |
| §6.7 | `N = 401, n = 3, l′ = 3209` | `(401 − 7)/2 = 197`; `3209 ≡ 2 (mod 3)` | sound | none |
| §6.8 | Hesse; equidistribution | `X² − aX + q_v`; `∑\|tr\|² ~ q^r·q^{r(n−1)}` | sound | none |
| Layer 6 Example | `N = 5, n = 2` | `q^{2·1/2}·q² = q³ = q^{n(N−2)/2}` | sound | none |

### Layer 7

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.1 | `σ ≠ id` | `σ⁻¹χ`-part | sound | none |
| §7.2 | `(1,0,0,0,4)`; `(0,0,0,1,3,5,5)` | representatives `(2,1,1,1,5)`, `(3,2,2,2,1)`, `(4,3,3,3,2)`: sums `10,10,15`, grades `1,1,2`; `21, 21, 28`, grades `2,2,3` | sound | none |
| §7.3 | `N = 5, n = 2` | range `1..2` | sound | none |
| §7.4 | self-dual | `{1,2}` twists to `{0,1}` | sound | none |
| §7.5 | `N = 401, n = 3` | weight `397`; `nM + n(n−1)/2 − n(n−1)/2 = nM` | sound | none |
| §7.6 | `n = 3` | `{0,1,2}`, sum 3 | sound | none |
| §7.7 | `t = 0, λ \| 2` | `t^N − 1 = −1`, a unit | sound | none |
| §7.8 | `(0,0,0,1,3,5,5)`, `l = 29`; `(1,0,0,0,4)` | `M(1) = (1+1+1+2+4+6+6)/7 − 1 = 2`, formula weights `{2,3,4}` vs grades `{2,2,3}`; `M(1) = 1` | sound | none |
| §7.9 | `n = 3` | `θ_{cτ}², θ_τθ_{cτ}, θ_τ²`, `det = ε̄⁻³`; `ε̄³ = ε̄⁻³` iff `(l−1) \| 6` iff `l ≤ 7` | sound | none |
| §7.10 | `(1,2,2,0,0)` | two size-1 blocks, `N = 0` | sound | Layer 7 deps fixed |
| §7.11 | `Q_v(0)` | `(−1)^n q^{n(n−1)/2}` | sound | none |
| §7.12 | Kummer extension | eigenvalues `1, p^{deg x}`, slopes `0, 1` | sound | none |
| §7.13 | slopes `(3/2, 3/2, 0)` | sum 3, partial sums `≤ (2,3,3)`, gap `3/2 > 1` | sound | none |

### Layers 8 and 9

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.1 | weakly admissible control | `Nφe₂ = p²e₁ = pφNe₂`; `t_H = t_N = 3`; `⟨e₁⟩`: `t_H = 0 ≤ t_N = 1` | sound | none |
| §9.1 | tower controls | `ℚ(√2) ∩ ℚ(√3) = ℚ`; `ℚ(√2)ℚ(√3) ∋ √6` | sound | none |
| §9.2 | `t = 1/l`, `t = l′` | valuations `−1`, `1` | sound | none |
| §9.3 | `F′ ⊇ F` | disjointness over `ℚ` only for `K` | sound | none |
| §9.4 | `gcd(N, nᵢ)` | see the conventions row | missing hypothesis | added |
| §9.5 | `π_*𝔽₂`, `z ↦ z²` over `ℚ₅` | squares mod 5 are `{1, 4}`, so `2` is not a square | sound | Layer 9 deps fixed |
| §9.6 | `m = 1`; `m = p+1` control | `ω₂⁻¹ ⊕ ω₂^{−p}`, `det = ε̄⁻¹`; `ω₂^{p+1} = ω` | sound | supplier cited |
| §9.7 | point counts | `y² = x³ − x`: `𝔽₅`: 8 (trace −2), `𝔽₇`: 8 (trace 0), `𝔽₁₁`: 12; `y² = x³ + 1` over `𝔽₁₁`: 12, over `𝔽₁₃`: 12 (trace 2); `y² = x³ + x + 1` over `𝔽₁₁`: 14; `y² = x³ − x` over `𝔽₁₃`: 8 (trace 6); `y² = x³ + x + 4` over `𝔽₁₃`: 14, trace 0, `disc ≡ 5` | sound | none |
| §9.8 | `m = 3`, `q₁ = 7` | pairs `(2,0),(1,1),(0,2)`; `c ≡ (1,2,4)`, sum 0; `(m−1)(m+2)/2 = 5 < 7` | sound | none |
| §9.9 | normaliser in `GL₂(𝔽₇)` | `72` vs `#SL₂(𝔽₇) = 336` | sound | none |
| §9.10 | `m = 3` | kernel of `x ↦ x^{−2}` is `{±1}` | sound | none |
| §9.11 | diagonal `SL₂(𝔽₅)` | `120` vs `14400`; `y² = x³ − x` at 2: `j = 1728`, bad | sound | none |
| §9.12 | `(2,3), (3,2), (1,2)` | weights `{0..5}`, `det ε^{−15}`; `(ε^{−6})²(ε^{−1})³ = ε^{−15}`; rank 2, `ε^{−1}` | sound | none |
| Layer 9 Example | `3208` | `= 8·401`; its odd divisors are `1` and `401` | sound | none |

## Unresolved

1. **Title collision (a human decision).**
   - This roadmap is titled "potential automorphy infrastructure, Part II: Dwork switching motives".
   - The open PotentialAutomorphyInfrastructurePartII is titled "potential automorphy infrastructure, part II — polarized automorphy lifting and finiteness of deformation rings".
   - Both call themselves Part II of PotentialAutomorphyInfrastructure. I kept the package's title because the folder name and the consumer's citations are fixed.
   - A retitle, for example "Dwork motives for potential automorphy", would remove the ambiguity.
2. **Gaps kept.** Five requirements stay. None is met at the supplier heads; I grepped each supplier.
   - `gap:tame-point-specialization`, against LefschetzPencilsAndVanishingCycles.
   - `gap:curve-crystalline-companions`, against PadicDifferentialEquationsAndRigidCohomology.
   - `gap:twisted-modular-curve-over-number-fields`, against ModularCurvesPartII. ModularityAndLanglandsExtensions §2.23 builds the prime-level twisted curve over number fields, but not the composite level `pq` or the geometric mod-`p` monodromy that §§9.11–9.12 need.
   - `gap:ordinary-and-supersingular-curves-over-prime-fields`, against EllipticCurves.
   - `gap:cm-hecke-characters-with-prescribed-infinity-type`, against GlobalNumberFields, which is completed.
3. **Note for PotentialAutomorphyInfrastructurePartII.** Its route chooses `N` "odd, prime to `∏l_i` and to the residue characteristics of `Σ`, with `N > n_i + 1`" before citing §9.4. §9.4 now states the `gcd(N, nᵢ) = 1` that the self-dual monodromy argument (§4.4) needs, so that roadmap's choice of `N` should add it. This roadmap's ids are unchanged.
4. **Uncertified sources.** Six primary sources remain cited by locator only, and I did not open them: ZS76, KATZ90, LEWIS82, ARTIN55, KM74 and KIS99. The port adds no new source.
5. **Suspicious text:** no fetched or reviewed text tried to give instructions.


Pull request: #2291 (roadmap/potential-automorphy-dwork-motives-part-ii at 1c99434)

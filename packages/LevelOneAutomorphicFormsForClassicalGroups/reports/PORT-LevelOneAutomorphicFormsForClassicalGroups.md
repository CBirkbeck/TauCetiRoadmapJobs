# Port report: LevelOneAutomorphicFormsForClassicalGroups

- **Branch:** `roadmap/level-one-automorphic-forms-for-classical-groups`, from `45f58db`.
- **Head commit:** `060e3fe6c5598851d1c0f087b2f5d0d90ad5d654`
  (`LevelOneAutomorphicFormsForClassicalGroups: roadmap (README, Suggested.lean, metadata)`).
- **Folder:** `TauCetiRoadmap/LevelOneAutomorphicFormsForClassicalGroups/{README.md,Suggested.lean,metadata.toml}`;
  nothing outside it is touched (the top-level roadmap list and `TauCetiRoadmap.lean` are unchanged).
- **Build:** `lake build TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups.Suggested` ends with
  `Build completed successfully (18292 jobs).` There are **4 warnings**, all `declaration uses 'sorry'`
  (the four theorems at `Suggested.lean` lines 87, 130, 143, 155), and nothing else.
- **Gate:** `gate LevelOneAutomorphicFormsForClassicalGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable`), after all edits:
  `depcheck: 225 roadmaps, 2000 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.

## Draft pull request body

Adds a roadmap for the level-one theory of automorphic forms on the split classical groups over `ℤ`
developed by Chenevier and Taïbi. Starting from the set `Π_alg` of unitary algebraic cuspidal
representations of `PGL_m` over `ℚ` that are unramified at every prime, it builds three things. First,
the Rankin–Selberg form of Weil's explicit formula and its Stark–Odlyzko positivity on the
nonnegative cone, turned into finite quadratic-form exclusion criteria (with Miller's vanishing
theorem and the repeated-weight `PGL₄` vanishing). Second, Arthur's multiplicity formula
specialized to level one, with explicit holomorphic packet characters and the triangular relation
between Euler–Poincaré characteristics and self-dual cuspidal counts. Third, the masses of torsion
classes on the geometric side of the `L²`-Lefschetz trace formula, with the spinor obstruction on
their characteristic polynomials and exact recovery for `SO_d` (`d ≤ 17`) and `Sp_{2n}` (`n ≤ 8`).
Together these give the complete classifications of level-one algebraic cuspidal representations
in motivic weight at most 22, the top-simple ones in weight 23 and the regular self-dual ones in
weight 24.

On the Siegel side the roadmap adds:

- the level-one Siegel operator and the singular-range theorems;
- the genus-`g` and harmonic theta maps of even unimodular lattices, with first occurrence and the
  Rallis relation;
- `dim S_k(Sp_{2g}(ℤ))` for every regular weight in genus at most eight, and every space in weight at
  most 13, including the four weight-13 forms in genera 8, 12, 16 and 24;
- the realization of those four forms as harmonic theta series of the Leech lattice, through its
  invariant alternating forms;
- the Eichler basis theorem in weights 4, 8 and 12, and the stable range `g ≥ 2k`.

`Suggested.lean` states the headlines that are statable at the pins: the spinor obstruction (CT20
Proposition 3.7) on Mathlib's matrices and `p`-adic integers, and three Leech-lattice theorems
(CT19a formula (1) with Proposition 1.4, Proposition 4.1 and Theorem 2) on Tau Ceti's
`IntegralLattice`. The module docstring names the headlines that are not statable and the carrier
each one lacks: Siegel modular forms of genus at least 2, cuspidal automorphic representations of
`GL_m`, and the elliptic trace-formula terms.

## Dependencies still in pull requests

These roadmaps are cited as suppliers and are open pull requests that add new roadmap folders, all
earlier in the merge order:

- AutomorphicFormsOnReductiveGroups
- AutomorphicLFunctionsAndLocalFactors
- SmallRamificationAndAbelianVarietyBaseCases
- AutomorphicSpectralTheory
- GeometryOfNumbersAndQuadraticArithmetic
- OrthogonalTamagawaAndLatticeMass
- MetaplecticAutomorphicForms
- AutomorphicBundles
- ModularityAndLanglandsExtensions
- ComputationalNumberTheory
- SymplecticReidemeisterTorsionModSquares

These suppliers are on main: AnalyticNumberTheoryPartI, CFSGBasicProperties, IntegralLattices
(active and Completed), Rank24LatticeConstructions, ThetaSeries, AlgebraicCodingTheory (Completed),
SporadicOrders, OrthogonalSpinGroups (Completed), RepresentationTheory (LieHighestWeight,
ClassicalGroups) and ReductiveGroups.

No citation depends on an id that only an open revision defines, and the overlaps tool lists none.
The one consumer is SiegelModularForms (open, draft, not in the merge order). It cites §§6.1, 6.2,
6.4, 6.7, 7.3 and 7.9 of this roadmap, and all six ids are kept.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already had the required form: four headline
theorems, plus only the four simple definitions they need, all with real bodies and no sorry'd
data. I changed it in three places:

- **Import repair.** `TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group` is replaced by
  `…Isometry.Basic`. Only the `Isometry` structure and its coercion are used, and no group
  structure is.
- **Docstring.** "the computability of `dim S_k`" now reads "the dimension formula for `S_k`".
- **Docstring.** The reason the exact `Q_g` coefficient is not statable is corrected. It had said
  the Leech lattice was absent, but the Leech lattice exists at the pin as `TauCeti.leechLattice`. It
  is the subgroup `2¹²M₂₄`, the oriented forms `ω_g` and the sublattices `Q_g` that are absent. I
  also added a sentence recording that `TauCeti.leechLattice` satisfies every hypothesis of the
  Leech statements.

**Signature check.** I wrote `#check @name` for all eight declarations into one scratch file and
elaborated it once (`lake env lean`). Every elaborated type keeps its hypotheses, and no
declaration relies on a section `variable`: each binds its data and hypotheses in its own
signature. Each type matches its README statement (§4.7, §8.5, §8.6), and no change was needed
after the check.

**Headline check.** I looked for headlines that are statable at the pins but missing from the file
and found none. The other CT20 and CT19a end theorems need Siegel modular forms of genus at least
2, cuspidal representations of `GL_m`, or the elliptic trace-formula terms. Statements such as CT20
Lemma 2.6, Example 2.7, Theorem 3.5 and CT19a Facts 1.1–1.2 are statable, but they are lemmas or
inputs, not headlines, and they stay README targets.

## Supplier replacements and duplication removals

These are recorded in "Scope and ownership" and in the supplier contracts.

1. **ModularForms Layers 3–4 replaced by pinned Tau Ceti declarations.**
   - **Problem.** The package cited ModularForms Layers 3–4 for the Petersson product and the level-one
     Hecke eigenbasis. On main those layers are now "fixed-character old and new spaces" and
     "primitive associates", so the citation no longer pointed at that content.
   - **Replacement.** The scope list, the From Tau Ceti contracts, §2.20 and the Layer 2
     dependencies now cite these declarations at the pin:
     - `HeckeRing.GL2.Newform` and `HeckeRing.GL2.Newform.basis`
       (`TauCeti/NumberTheory/ModularForms/Newforms/{Newform,OrthogonalBasis}.lean`);
     - `TauCeti.cuspFormsNew_one` (`Newforms/Basic.lean`);
     - `TauCeti.Gamma1_one_map_eq_SL` (`CongruenceSubgroups/Basic.lean`);
     - `HeckeRing.GL2.exists_peterssonOrthonormalBasis_eigenformAwayFromLevel`
       (`Petersson/Eigenbasis.lean`).
   - **Headings.** The heading "From TauCetiRoadmap.RepresentationTheory, ReductiveGroups and
     ModularForms" loses ModularForms.
2. **Leech lattice now cited at the pin.** `TauCeti.leechLattice` (`Rank24/Leech/Basic.lean`) and
   its evenness, unimodularity, positivity, rank, minimum and rootlessness
   (`TauCeti.vectorsOfNorm_two_leechLattice`) are added to the contracts and to the Needs lines of
   §§8.4–8.6. Rank24LatticeConstructions Layer 6 is still cited as the roadmap that plans it.
3. **§3.5's packet-membership criterion now comes from its supplier.**
   - **Overlap found.** ModularityAndLanglandsExtensions §3.21 already states CT20 (5.2.1): for
     `k_g > g`, `ρ_k` lies in the packet exactly when `d_{i₀} = 1`, with multiplicity one.
   - **Change.** §3.5 now takes that criterion from there and owns only its level-one consequences
     (every block regular, `I_odd = {i₀}`, `n_id_i ≡ 0 mod 4`) and the explicit packet character.
     The deferral is recorded in "Scope and ownership".
4. **OrthogonalTamagawaAndLatticeMass §4.2 contract corrected.** Its 24 classes are Tau Ceti's 23
   rooted table lattices together with `TauCeti.leechLattice`. It takes `|O(Leech)|` from
   CFSGBasicProperties P2-L rather than proving it.
5. **CFSGBasicProperties scope corrected.** The scope bullet no longer says that P2-L supplies the
   average characteristic polynomial of `Co₀`; that polynomial is the requested gap (gap
   `conway-group-average-charpoly`), as the contract already said.

**Duplication sweep, by object, against main and all 452 open roadmap pull requests**
(`roadmaps grep`):

| Object searched | Owners found | Outcome |
|---|---|---|
| Chenevier–Taïbi / Taïbi | AutomorphicFormsOnReductiveGroups, MetaplecticAutomorphicForms, ModularityAndLanglandsExtensions, ComputationalNumberTheory, SiegelModularForms, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, EndoscopicTransferAndUnitaryTraceComparison, three hits on main | All are suppliers or citations of the same source, except the §3.21 overlap handled in item 3 above. |
| Miller's theorem | none | No second owner. |
| Stark–Odlyzko | none | No second owner. |
| Eichler basis | none | No second owner. |
| spinor obstruction / spinor-filtered index | none | No second owner. |
| `Π_alg` | four open roadmaps (CompletedCohomologyAndLocalGlobalCompatibility, its Part II, PadicHodgeParametersInLocallyAnalyticRepresentations, GL2AutomorphicRepresentationsAndTransfer) | Different objects under the same symbol; no overlap. |
| Böcherer, Resnikoff, Weissauer, Zharkovskaya, pluriharmonic theta | SiegelModularForms (plus unrelated Weissauer hits) | SiegelModularForms is a consumer and cites this roadmap for them. |
| invariant alternating forms, Mathieu forms | only unrelated hits | No overlap. |
| level-one cuspidal cohomology of `GL_n(ℤ)` | AutomorphicSpectralTheory's `gl_sl_cuspidal_diagram` | That compares cohomology with representations. §2.19 here is Miller's theorem on archimedean parameters, so the objects are distinct. |

Ownership against open work was checked through the tool, which indexes all open roadmap pull
requests, and no object was found with two owners. No declaration in `Suggested.lean` shares a
fully qualified name with a declaration in another roadmap.

## Fixes to the mathematics (upstream-reviewer pass)

### Findings of the last package review (REV~7)

Each was verified against the cached source and repaired.

- **F01, §2.17.** The exclusion theorem now assumes (POS) for its test function `F`, and the
  GRH variant assumes `F ≥ 0` and `F̂ ≥ 0` on `ℝ` (CT20 §4.3).
  - That conditional variant is stated in §2.7 as a target, so that §2.17 rests on a target and
    not on a remark.
  - Negative-control Check: `F = −F₁`, `S = ∅`, `U = 1`, `t = 1`. Here `A_{F₁} − J_{F₁}(1)` is positive,
    because its `p = 2` prime term `F₁(log 2) log 2/√2` is positive and the other terms are
    nonnegative. So `β < 0` although the trivial class exists.
- **F03, §4.18.** The nonvanishing of masses on `P₁(G)` is restricted to the groups of CT20 Theorem 6
  (`SO_n`, `n ≤ 17`, and `Sp_{2n}`, `2n ≤ 14`). Remark 3.10 (CT20 lines 1369–1372) says "Let G be as in
  Theorem 6", and Theorem 6 (lines 515–516) excludes `Sp₁₆`. A Check now separates `Sp₁₄` from `Sp₁₆`.
- **F04, §3.3.** "The finite unramified packets are singletons" was false. It now reads: for a
  Whittaker datum compatible with the hyperspecial subgroup, the packet has exactly one
  `Sp_{2g}(ℤ_p)`-spherical member, and that member has trivial character (Tai17 Lemma 4.1.1, p.
  305). A new Check uses the parameter `Frob ↦ diag(−1, −1, 1)` of `SL₂`: its centralizer is
  `S(O₂ × O₁) ≅ O₂`, so the component group is `ℤ/2`, the packet has two members, and one is
  spherical.
- **F02 and maintainer note 1, whole tables.** I confirm the maintainer's reading and kept the
  tables:
  - **Which tables.** The 29- and 32-row tables of §§7.8–7.9 and the 24 rank-24 parameters of §6.8
    (CL14 Théorème E, Table C.5). The cardinalities of §4.9 and the order tuples of §8.7 are
    individual computed values with their own Checks.
  - **Why they stay.** Each table is the statement of a complete classification, and every row is a
    target, not a selection. Without the list the target is no longer unambiguous: "the cardinality
    of the fibre" leaves an implementer to recompute the theorem.
  - **Independent evidence.** I enumerated the level-one parameters myself, with `L₂₄`, the
    weights and `ε` computed in `K∞`, and the sign test of §3.5. It gives 223 candidates, 198 shapes
    and 58 passing (29 scalar and 29 nonscalar). Every one of the 58 regular rows of §§7.8–7.9
    matches, in both directions; the other 3 rows are the singular ones of §§7.5 and 7.7.
  - **Form.** The tables are in the roadmap's own notation and order, not the source's
    typesetting.
- **Maintainer note 2, captions.** The two table citations were swapped. §7.8 (nonscalar) is CT20
  Table 6 (caption at CT20 line 2373), and §7.9 (scalar) is Table 5 (line 2411). Both are fixed.

### Earlier repairs missing from this package text, now restored

- **§1.8 and Standing premises.** The type of a regular self-dual class and the same-type root
  number come from Arthur's classification (CT20 §2.2, footnote 7). §1.8 now states them under the
  standing premises and states the level-one root-number formula unconditionally. The premises
  paragraph now covers §1.8's two assertions, §3.2, and §§6.8–6.12 (parameters of lattice
  eigenvectors and the Böcherer cases). It also says that Layer 2 is unconditional.
- **ReductiveGroups gap.** In the `split-orthogonal-regular-form` gap contract, the forms were
  paired with types `B_n` and `D_n` in crossed order. They are now odd rank, then even rank,
  "respectively".
- **§5.4 Check.** "Its dimension 14 is the minimum attained on `V`" claimed that some element of `V`
  has dimension 14. CT20 lines 1430–1431 give only the bound `14 ≤ dim U ≤ 42`, and the Check now says
  so.

### Other fixes from the reread

- **§4.17 Checks.** "The hard indices are exactly those where [bilinear algebra] would [be
  needed]" overstated CT20 §3.3, which gives a sufficient condition. The 1427-row figure is now
  located: weights with `2w(λ)₁ ≤ 116`.
- **Scope paragraph on SiegelModularForms.** It began "Two neighbours consume this roadmap" but named
  one. It now lists what SiegelModularForms actually cites (§§6.1, 6.2, 6.4, 6.7, 7.3, 7.9) and
  says where the general-level versions live.
- **Downstream consumers.** The bullet that named an unnamed "roadmap on the cuspidal cohomology of
  `GL_n(ℤ)`" now states only what is owned here.
- **§1.3 API bullet.** "for the corresponding Gram data" now names the matrix `c` with `xᵀcx` equal
  to the model form.
- **§1.8 Needs.** Itemized by assertion; it now includes AutomorphicLFunctionsAndLocalFactors
  §AL.1.4 for the root-number formula.

## Citations, resolved this round

- **Cross-roadmap citations.** Every one was checked against the cited roadmap at its current head
  (`roadmaps show`), heading by heading. All of the following exist:
  - **AutomorphicFormsOnReductiveGroups** §§2.2, 2.4, 2.5, 3.2, 3.4, 3.5, 4.2, 5.1 (incl.
    `IsAlgebraicCT`), 5.5, 6.7, 6.8, 7.2, 7.2a, 7.4, 7.5.
  - **AutomorphicLFunctionsAndLocalFactors** Conventions, §§AL.1.4, AL.1.4.3 (`ε(I_w) = i^{w+1}`),
    AL.3.6.1–3, AL.3.7, AL.3.9.2.
  - **AnalyticNumberTheoryPartI** §§1.3, 1.8.
  - **SmallRamificationAndAbelianVarietyBaseCases** §§1.5–1.7 (`odlyzkoKernel`,
    `poitouTestFunction`).
  - **SymplecticReidemeisterTorsionModSquares** §4.1 (`zassenhaus_primary_formula`).
  - **CFSGBasicProperties** P2-L.
  - **AutomorphicSpectralTheory** §§4.4, 4.5, 4.10, 6.9, 6.17, 6.19, 6.20.
  - **ModularityAndLanglandsExtensions** Exact supplier contracts, Layer 3, §§3.4, 3.8, 3.15, 3.17,
    3.20, 3.21, 3.22.
  - **AutomorphicBundles** §§11.1, 11.2, 11.9, 11.16, 12.10, 12.11, 12.13, 12.15.
  - **MetaplecticAutomorphicForms** §§0.15, 2.4c, 3.1, 3.4, 3.5, 3.7, 3.10, 3.21, 5.1, 5.6, 6.14.
  - **OrthogonalTamagawaAndLatticeMass** §§3.1, 4.1, 4.2.
  - **GeometryOfNumbersAndQuadraticArithmetic** §§2.4, 2.4.2.
  - **ComputationalNumberTheory** §§4.1–4.7, 4.17, 4.17a, 4.18, 4.26, 4.29–4.34, 5.1.
  - **IntegralLattices** 4G; Completed/IntegralLattices Layer 1.
  - **Rank24LatticeConstructions** Layer 6.
  - **ThetaSeries** Layers 1, 5, 8.
  - **AlgebraicCodingTheory** Layer 5.
  - **SporadicOrders** Layer 1.
  - **OrthogonalSpinGroups** Layer 1.
  - **LieHighestWeight** Layer 6.
  - **ClassicalGroups** Layers 3–5.
  - **ReductiveGroups** Layer 9.
- **Resolver.** `roadmaps resolve` reports nothing unresolved.
- **Library names.** The resolver could not check these on this host, so I checked them myself. Of
  the 41 library names the README cites, 37 elaborate under `#check @…` against the pinned build.
  The other 4 (`TauCeti.Symplectic.groupScheme`, `…pointsMulEquiv`,
  `…instSmoothCoordinateHopfAlgebra`, `TauCeti.BinaryGolay.weightEnumerator_code`) live in modules
  that have no build products here, and I confirmed them in the pinned sources
  (`Symplectic/Basic.lean:120,213`, `Symplectic/Smooth.lean:93`,
  `InformationTheory/Coding/Binary/Golay/Basic.lean:606`).
- **Gap contracts.** The eight "What X must provide (gap:…)" contracts are kept, which is the house
  pattern on main (BelyiMaps, FlagVarieties, IndexTheory, TensorProductCombinatorics). All of them
  point at earlier suppliers.

## Adversarial mathematics pass (computed)

The scripts and their outputs are in the job scratch directory (`compute/`, `checks/`).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §§4.4, 4.9 index sets `P(G)/∼`, `P₁(G)/∼` | all 8 `Sp_{2n}`, all 12 `SO_d` of §4.9, by exponent-vector enumeration | Sp: 3, 12, 32, 92, 219, 530, **1158**, 2521. SO `P`: 5, 12, 19, 59, 92, 165, 419, 530, 1001, 2257, 2521, 4877. SO `P₁`: 3, 6, 12, 34, 40, 99, 244, 211, 598, 1339, 992, 2948 | All match the README, which corrects CT20's printed 1157 to 1158. A first run that cut indices at `m < 60` gave 2520/4876/991/2947, because `Φ₆₀` has degree 16; that was a bug in my enumeration, not in the README. | none |
| §4.16 easy/hard indices of `Sp₁₆` | full enumeration with the definition's `S(p, m)` conditions | 2521 orbits, 766 hard, 0 not stable under `∼` | holds | §4.17 Checks reworded |
| §4.12 `SO₃` calibration | trace matrix at `k = 0..4` | det = 288; `M·(−1/12, 1/4, 1/3, 0, 0) = (1/2, −1/2, −1/2, −1/2, −1/2)`; Example formula at `k = 5`: `11/12 + 3/12 + 4/12 − 6/12 = 1` | holds | none |
| §§7.4, 7.8, 7.9 regular enumeration | all level-one parameters from `L₂₄` with distinct weights `≤ 12` and `d_{i₀} = 1`; §3.5 sign test with `ε` computed in `K∞` | 223 candidates, 198 shapes, 58 passing (29 + 29); every one of the 58 table rows matches; the 3 other rows are singular (§§7.5, 7.7) | holds both ways | Table 5/6 citations swapped |
| §3.3 local packets | `SL₂`, Frobenius `↦ diag(−1, −1, 1)` | centralizer `O₂`, `π₀ = ℤ/2`, packet 2, spherical 1 | the old claim was false | fixed (F04) |
| §2.17 exclusion | `F = −F₁`, `S = ∅`, `U = 1`, `m = 1`, `t = 1` | `β = −(A_{F₁} − J_{F₁}(1)) < 0` with the trivial class present (prime term at 2 is `> 0`) | the old statement was false without (POS) | fixed (F01) |
| §4.18 mass nonvanishing | `Sp₁₄` vs `Sp₁₆` against CT20 Theorem 6's `2n ≤ 14` | 14 ≤ 14 holds; 16 ≤ 14 fails | the old scope was too wide | fixed (F03) |
| §2.2 Odlyzko kernel | `g″` on `[0, 1]`; integral; `Ĝ₁(i/4π)` | `g″(0) = −π²`, `g″(1) = 0`; `∫₀^∞ g = 2/π² + 2/π² = 4/π²`; `4π²(1 + cosh ½)/(¼ + π²)² ≈ 0.82021` | holds | none |
| §2.1 triangle Check | `ξ = iy` | `sin²(2πiy)/(πiy)² = sinh²(2πy)/(πy)²` | holds | none |
| §§2.3, 2.5–2.7 normalizations | CT20 (2.3.4)–(2.3.6), lines 647–670 | `J_F = −∫Γ′/Γ(½ + 2πit)F̂`, `B∞ = J(UV)`, `C = Aδ − B∞ − (F̂(0)/2)e⊥` | identical | none |
| §2.9 root coefficient | `ε = −1` and `ε = 1` | `(B/4)(1 − ε)` equals `B/2` and `0`, i.e. `(B/2)e⊥` | holds | none |
| §§2.11, 2.12, 2.15 small matrices | `[[1,2],[2,1]]`; `[[1,−1],[−1,1]]`; compression | eigenvalues 3, −1, `μ = 1`; minimum 0; expanded −1 vs compressed −½ | holds | none |
| §2.21 | `dim M₄₂` | `⌊42/12⌋ + 1 = 4` (`42 ≢ 2 mod 12`) | holds | none |
| §1.2 ring rules | `I₁²`, `I₂₃²`, parity of `K∞^{≤w}` | `I₂ + 1 + e`; `I₄₆ + I₀`; `I₁ ∈ K∞^{≤23}`, `I₂ ∉` | holds | none |
| §1.4 | `Γ(s, I₀)`; `I₁₁` | duplication formula gives `2(2π)^{−s}Γ(s) = Γ_ℂ(s)`; det `e¹² = 1`; `ε = i¹² = 1` | holds | none |
| §1.6 nonregular Check | `3·1` vs `1 + 2e` | both det 1; `−1 ∈ ℝ^×` acts trivially on `1` and `e`, so both are scalar; weights `(0, 0, 0)` | the counterexample is valid | none |
| §1.8 | `ε(I₁₁I₁₅)`; `ε(I₁₇)` | `i²⁷·i⁵ = 1`; `i¹⁸ = −1` | holds | premise scope split |
| §3.4 | `g = 3`, `k = (1,0,0)`; `g = 2`, `k = (1,1)` | `0 ≥ 3 − 2 − ½` fails; `1 ≥ 0` holds, eigenvalues `0, 0, 0, ±1` | holds | none |
| §3.9 sign identity | `ε = ±1`, `a = 1..4` | parity of `⌊εa/2⌋` equals `a(a−1)/2 + [ε = −1]a` in all 8 cases | holds | none |
| §3.13 | `Δ₁₁[12] ⊕ [1]` | `χ = (−1)⁶ = 1`, `ε_ψ = i¹² = 1` | holds | none |
| §4.7 spinor obstruction | hyperbolic plane, `diag(t, t⁻¹)`; `x₁x₃ + x₂²`; `x₁² + x₂²` | `Q(−1) = (1 + t)²/t`, `Q(1) = −(1 − t)²/t`; `det(c + cᵀ) = −2`; `4` (not regular) | holds; the Lean statement equals CT20 Proposition 3.7 exactly (lines 1245–1249: general monic `P`, absolute values) | none |
| §4.8 | `P₁(SO₃)` | `{Φ₁³, Φ₁Φ₂², Φ₁Φ₃}` (`Φ₄(−1) = 2`, `Φ₆(−1) = 3` excluded) | holds | none |
| §§5.9–5.10 | the four rank-13/16 candidates | dims 13, 13, 16, 16; `det = e⁶`, `e⁸ = 1`; `ε`-exponents 100, 104, 124, 128 (all `≡ 0 mod 4`) | holds | none |
| §5.8 | CT20 Theorem 4 | weights `±½, ±7/2, ±11/2, ±15/2, ±19/2, ±21/2, ±23/2 (×2)`, i.e. `I₁ + I₇ + I₁₁ + I₁₅ + I₁₉ + I₂₁ + 2I₂₃`, rank 16 | holds | none |
| §6.12 L-value points | `n/2 − g` | 0, 4, 0, −4, −12 | holds | none |
| §8.7 orders | `ω`, `γ`, `C` at `s = 0` for each case | `1/ω`: 0, 0, 0, −4, −12; `γ` poles 4 at `i = 9, 11, 13, 15` (g = 16) and 12 (g = 24); `C`: 0 throughout; all rows sum to 0 | holds | none |
| §7.6 Check | `ε(Δ₁₁ × Sym²Δ₁₁)` with `Sym²Δ₁₁∞ = I₂₂ + e` | `i³⁴·i¹²·i¹² = i⁵⁸ = −1`; `χ = (−1)⁴ = 1` | the parameter fails the sign test, as the Check says | none |
| §7.7 Check | remainder `Δ₁₇[8] ⊕ [7] ⊕ [1]` | weights `±12..±5, ±3, ±2, ±1, 0, 0`; dim 24 | holds | none |
| §7.10 | `g = 24` weights | `±12` once, `±1..±11` twice, `0` three times on both sides | holds | none |
| §§6.3, 6.8, 8.2 | `E₈/2E₈` isotropic lines; degree distribution | `(2⁴ − 1)(2³ + 1) = 135`; partial sums 1, 2, 3, 4, 6, 8, 11, 14, 18, 20, 22, 23, 24 | holds | none |
| §8.6 counts | `|O(Leech)|/3`, `/10` | both integral (2771851204362240000, 831555361308672000) | holds | none |
| §8.5 vacuity | `TauCeti.leechLattice` at the pin | `isEven`, `isUnimodular`, `isPosDef`, `finrank ℚ (Fin 24 → ℚ) = 24`, `vectorsOfNorm 2 = ∅` | hypotheses jointly satisfiable | recorded in docstring and contracts |
| §8.5 roots-span theorem | rank one `ℤx`, `x·x = 2`; reflection argument | `s_x(y) = y − B(x,y)x` preserves `L` (integral `B`); `ω(x, …) = −ω(x, …)` | holds for `g ≥ 1`, any `L` | none |
| §8.3 Check | `S₃` and `A₃` on 3 points | `⋀² = std ⊕ sgn` (no invariants); `⋀³ = sgn` (0 for `S₃`, 1 for `A₃`) | holds | none |
| §8.4 average for `M₂₄` | value at `t = 1`; low degrees | sum of coefficients is 0; `g = 1, 7, 8, 9` give 1, 1, 2, 1, matching the orientable orbits | consistent | none |

## Unresolved, for the worker and the human reviewers

- **Review status.** `review.json` still records the round-2 status `needs_changes`. The last report
  (REV~7) raised four blocking findings. I verified and repaired F01, F03 and F04. For F02 I
  confirmed the maintainer's reading and kept the tables. A human should confirm that F02 decision.
- **Licences.** KT87 is uncertified and its text was not read. Its determinantal character formulas
  were tested only on rank-one cases (§4.10 Checks). BoechererNote is an author-hosted note; its
  licence question was raised before and is not settled here.
- **External data not verified.** CT20's mass tables, the 181-element list `V`, the 187 residual
  parameters and the full-rank matrices of §§4.13–4.17 are external data. The cached paper states
  their properties but does not contain them, and they were not recomputed.
- **The 1157/1158 discrepancy.** The README states the `Sp₁₄` column count as 1158, which my
  enumeration confirms. CT20 prints 1157 and says its 1274-row system has full rank. The source's
  claim was presumably computed on the true index set, but the paper does not settle it.
- **Ownership.** The Lean file states the Leech theorems for every rootless even unimodular rank-24
  lattice rather than for `TauCeti.leechLattice` itself. This is a stronger form that does not
  depend on the uniqueness of the rootless class. No other roadmap declares these names.
- **Suspicious text.** None of the untrusted text I read (reports, roadmaps, sources) contained
  instructions addressed to me.


Pull request: #2285 (roadmap/level-one-automorphic-forms-for-classical-groups at 060e3fe)

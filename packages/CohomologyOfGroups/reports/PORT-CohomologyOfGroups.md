# PORT-CohomologyOfGroups

- Branch: `roadmap/cohomology-of-groups`, from `4d169a9` (main). Head: `f8d096c0`,
  "CohomologyOfGroups: roadmap (README, Suggested.lean, metadata)". The tree is clean.
- Folder: `TauCetiRoadmap/CohomologyOfGroups/{README.md,Suggested.lean,metadata.toml}`. Nothing
  outside the folder changed.
- Build (`lake build TauCetiRoadmap.CohomologyOfGroups.Suggested`, run again on the committed head):
  `Build completed successfully (18496 jobs).` There are 14 warnings, every one `declaration uses
  `sorry``, one per theorem (lines 130, 138, 200, 216, 245, 273, 297, 337, 396, 410, 430, 446, 460,
  480). No other warning and no error.
- Gate: `gate CohomologyOfGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 244 roadmaps, 2206 edges, 0
  problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

Adds **Cohomology of groups**, the general theory of the homology and cohomology of an arbitrary
discrete group, with coefficients in `k`-linear representations over any commutative ring. It is
built on Mathlib's `groupHomology`, `groupCohomology` and `tateCohomology` and on the operations Tau
Ceti already proves for them: corestriction, transfer, inflation–restriction, Tate restriction and
the Tate cup product, cyclic periodicity, the Mackey decomposition and the Eilenberg–Zilber maps. On
that base the roadmap builds, in eight layers:
- conjugation and the action of a quotient on the (co)homology of a normal subgroup;
- hyperhomology and hypercohomology, with their two spectral sequences;
- complexes of permutation modules and the tree sequences of amalgams, HNN extensions and free
  groups;
- cup and cap products for arbitrary equivariant pairings, compared with the library's Tate and
  continuous cups;
- the Künneth and universal coefficient theorems and the Pontryagin ring of an abelian group;
- a filtered realisation of the Hochschild–Serre spectral sequence, with its edge maps,
  transgression in every degree, products, low-degree sequences and Hopf's formula;
- the double coset formula for a subgroup of finite index;
- for finite groups, stable elements with arbitrary coefficients (in cohomology, homology and Tate
  cohomology), Tate duality, the `p`-period and the periodicity theorem with its `p`-primary form.

Many roadmaps already state integral, finite-group, degree-two or central-extension cases of these
results for their own needs. This one is the general statement those cases are compared with, and
it cites each of them by section rather than restating it. `Suggested.lean` states, against the
pinned libraries, the headlines statable now:
- the vanishing of the (co)homology of free groups above degree one and the free product formula;
- the cohomological universal coefficient sequence over a ring of global dimension at most one;
- Hopf's formula;
- both double coset formulas;
- the three stable element theorems;
- Tate duality and its integral form;
- the all-degree cup periodicity of cyclic groups;
- the two periodicity theorems.

Its docstring names each headline that is not yet statable and the carrier it lacks.

## Roadmaps this one depends on that are still pull requests

The README consumes sections of these open roadmaps, by name and section:
- SpectralSequencesAndConvergencePartII: §4.3, with the declared gap `flat-kunneth`, and §5.2.
- SchemeKTheoryOperations: §6.7.
- K3BlochGroups: §§4.1 and 5.2, with the declared gap `least-r-period`.
- MappingClassGroupsAndCanonicalRepresentations: §1.1.
- InductionRestrictionPartII: RS.6.8 and RS.0.3.
- K2SymbolsBrauer: §1.1.
- ArithmeticGaloisDuality: §D7.2.
- IntegralIwasawaTheoryPartII: §0.7.

ModularCurvesPartII §15.4 and InductionRestrictionPartII RS.0.1 are cited in Scope and ownership
only, and nothing is consumed from them. All of these are earlier in the merge order. None is on
the never-cite list.

Every other supplier is on main:
- DerivedModuleAlgebra: §S.1, with the declared gap `homological-low-degree`.
- ProfiniteCohomology, ClassFieldTheory, FreeGroupsAndLimitGroups, AlgebraicTopology,
  StableHomotopyKTheory.

## What moved from the Lean to the README

Nothing. `Suggested.lean` is the package's file unchanged, because it already meets the Lean form:
- It declares nine definitions with real bodies, each needed to state a headline (`conjRes`,
  `conjCores`, `cohomologyEvaluation`, `extToCohomology`, `doubleCosetTerm`,
  `doubleCosetTermHomology`, `IsStableClass`, `IsHomologyStableClass`, `IsTateStableClass`), and
  fourteen headline theorems.
- It has no sorry'd data, no `set_option` and no padding.
- Its imports are `import Mathlib` plus eleven individual `TauCeti.*` modules, each of which supplies
  a declaration the file uses.
- Its docstring lists the headlines not statable at the pins: Hochschild–Serre, the transgression
  and low-degree sequences, the tree and Mayer–Vietoris sequences, Künneth, the Pontryagin
  comparisons, the homological universal coefficient sequence, and periodicity from a
  cohomologically trivial resolution.

I re-searched the pins for missing headlines. I found none statable without a stand-in: 8.2 is
the (c)⇔(d) clause of both TFAE theorems.

**Signature check.** I elaborated a scratch copy of `Suggested.lean` once, with `#check @name`
appended for all 23 declarations. All 23 elaborated types match the job's signature listing
verbatim. Each one also matches its README statement, including these binders:
- `[R.Normal]` and `S : Type` (Hopf);
- `[H.FiniteIndex]` (both formulas and both summands);
- `[Finite G]` with `n ≠ 0`, and `[Fintype G]` with `n : ℤ` (stable elements);
- `[∀ X : ModuleCat k, HasProjectiveDimensionLE X 1]` (universal coefficients);
- `[Module.Free ℤ M]` (integral duality);
- `hg` and `hχ` (cyclic periodicity).

Apart from `universe u` the file has no section variables, so no binder can have been dropped.
Nothing changed.

## Supplier replacements and duplication removals

None was needed.
- **Library names.** I extracted 271 backticked names from the README and indexed them against the
  pinned Mathlib and Tau Ceti declarations. Every library name resolves. My script missed four,
  which I checked by hand:
  - `AddCommGroup.primaryComponent` and `AddCommGroup.mem_primaryComponent` are the `to_additive`
    forms in `Mathlib/GroupTheory/Torsion.lean`, at lines 450 and 459.
  - `Rep.standardResolution` and `Rep.barResolution` are in
    `Mathlib/RepresentationTheory/Homological/Resolution.lean`, at lines 321 and 427.
- **Attribution.** Every primary entry under "From Mathlib" is a Mathlib declaration, and every one
  under "From Tau Ceti" is a Tau Ceti declaration. The Mathlib names that appear inside Tau Ceti
  bullets are context only.
- **"Lacks" claims, checked at the pins.**
  - The `continuousCohomology` module docstring lists the comparison with `groupCohomology` as a
    TODO.
  - The Tau Ceti `DirectedUnion` docstring says the colimit is not identified.
  - `Rep.quotientToInvariantsFunctor` and `Rep.quotientToCoinvariantsFunctor` work in degree 0
    only.
  - No Hochschild–Serre, stable-element, discrete double coset, Tate duality or Hopf declaration
    exists at the pins.
  - The Tau Ceti cyclic cup lemma covers degree 0 only.
- **Cross-roadmap ids.** Every cited section was found at its open head or on main, including
  K3BlochGroups' `finiteGroup_stableElements`, `quaternionPeriodicHomology` and
  `finiteGroup_period_fromSylow`, and InductionRestrictionPartII's
  `abelian_multiplier_exteriorSquare`.
- **Duplication sweep.** I searched by object, on main and across the open pull requests, using
  the tool index and the listed checkouts. The objects searched were Hopf's formula, stable
  elements, periodic cohomology, Tate duality, the double coset formula, the Pontryagin ring,
  cohomological dimension of free groups, Hochschild–Serre and Lyndon, group Künneth and universal
  coefficients, amalgam and tree sequences, group hyperhomology, generalised quaternion groups and
  cohomological triviality. Every other statement of these objects is a special case already cited
  in Scope and ownership, or concerns another carrier (for example the continuous `conjMap` of
  ProfiniteCohomology's area).

## Fixes made as an upstream reviewer

1. **Conventions, conjugation witness.** The witness used `g = (13)`, an involution. For it
   `gHg⁻¹ = g⁻¹Hg`, so it does not separate the convention from its inverse. It now uses
   `g = (123)`: `gHg⁻¹ = ⟨(23)⟩`, against `⟨(13)⟩` for the inverse convention, and
   `c_g φ((23)) = φ(g⁻¹(23)g) = φ((12)) = 1`. All values were recomputed.
2. **Locators.** The package carried 30 locators of the form "HS53 line N–M" and "Loh19 line N–M".
   These point into the pipeline's text extractions, which a reader does not have. I mapped each one
   to its printed page using the page markers of the cached source texts and the page offsets in
   `sources.toml`.
   - Every mapped page agrees with the page or theorem the README already cites beside it, so in
     most places the line locator was simply dropped.
   - Where no page stood beside it, I substituted the printed page:
     - HS53 Ch. I §7, pp. 117–118 (in 1.1 and 1.2);
     - HS53 Ch. II §1, p. 118 (in 5.3 and 6.1);
     - HS53 Ch. II §1, p. 119 (in 6.5);
     - HS53 Ch. III §4, remark after Thm. 2, p. 130 (in 6.7);
     - Hutchinson13 p. 12 (in the K3BlochGroups contract and the 8.5 Check).

   No source passage was added.

## Adversarial pass

Values were computed by hand. Those marked (s) were also computed by a script over all elements or
pairs. `C_m` is cyclic of order `m`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conv. universes | `k = ℤ`, Tate and Hopf statements | elaborated `Rep.{0,0,0} ℤ G`, `{G : Type}`, `{S : Type}` | `G` in `Type` exactly where `k = ℤ` | none |
| Conv. `Ĥ^{−n−1} = Hₙ` | `C₃`, `M = ℤ`, `n = 1`; `n = 0` | `Ĥ⁻² = H₁ = ℤ/3`; `Ĥ⁻¹ = ker N / I = 0` (N = 3 injective), not `H₀ = ℤ` | holds for `n ≥ 1` only, as stated | none |
| Conv. maps of groups | `2ℤ/4 ≤ ℤ/4`, `H²(−, ℤ)` | res `ℤ/4 → ℤ/2` onto, cor `ℤ/2 → ℤ/4`, `1 ↦ 2`; composite `1 ↦ 2 = [G:H]·1` | true | none |
| Conv. conjugation | `S₃`, `H = ⟨(12)⟩`, `g = (123)` and `(13)` | (s) `gHg⁻¹ = ⟨(23)⟩`, `g⁻¹Hg = ⟨(13)⟩`; `c_gφ((23)) = φ((12)) = 1`; for `(13)` both conjugates are `⟨(23)⟩` | old witness not discriminating | witness replaced |
| Conv. cup sign | `ℤ²`, coordinate classes | (s) `⟨x∪y, [e₁|e₂]−[e₂|e₁]⟩ = 1 − 0 = 1`; `⟨y∪x, ·⟩ = −1`; `(−1)^{pq}` convention gives `−1` | true | none |
| Conv. extension classes | `ℤ/3 ⊂ ℤ/9`, `s ∈ {0,1,2}`; `A = 3ℤ/27`, `k = 𝔽₃` | factor set `3` at `(1,2),(2,1),(2,2)`, `0` at the other six pairs; `3·3 = 9 ≠ 0` in `ℤ/27`; `A/3A ≅ 𝔽₃` | true | none |
| Conv. spectral indexing | `(p, q) ↦ (2p+q+1, −p−1)` | `s = −q′−1 = p`, `t = p′+2q′+1 = q`, total `p′+q′ = p+q` | true | none |
| Conv. quaternion | `QuaternionGroup (2^(s−2))`, Lean `2^m`, `m ≥ 1` | (s) orders `8, 16, 32` for `m = 1, 2, 3`; `m = 0` gives order 4, cyclic | true | none |
| Conv. `H.comap (conj g⁻¹) = gHg⁻¹` | `S₃`, `g = (123)`, `x = (23)` | `g⁻¹xg = (12) ∈ H` so `x ∈ comap`; `conj g h = g h g⁻¹` (Mathlib) | true | none |
| 1.1 `conjRes`, `conjCores` | `S₃`, `A = ⟨(12)⟩`, `β` = incl. of `⟨(23)⟩`, `g = (13),(123),(132)`; wrong coefficient maps | (s) `g⁻¹(23)g = (12),(12),(13)`; `gxg` fixes 1, `xg⁻¹: 1 ↦ 2`; `g²x: 1 ↦ 3`, `xg²: 1 ↦ 2` | defined/defined/undefined; wrong models not equivariant | none |
| 1.1 non-injective `β` | `ℤ/4 → ℤ/2`, `𝔽₂`, degree 2 | (s) pulled-back carry `= d⌊a/2⌋` on all 16 pairs, so the map `H² → H²` is 0 | true | none |
| 1.2 quotient action | `2ℤ/4 ◁ ℤ/4`, `M = ℤ` with generator acting by `−1`; `A₃ ◁ S₃`, `𝔽₃` | correct `−1` vs wrong `+1` on `M^N = M`; inversion gives `−1` on `H¹(A₃,𝔽₃)`, invariants `0 = Hom(S₃, 𝔽₃)` | true | none |
| 1.3 additivity | `A = ℤ^{(ℕ)}`; `ℤ/2`, `ℤ^{(ι)}` | `id ∈ Hom(A, ℤ^{(ℕ)})` has infinitely many coordinates, so it is not in `⊕ Hom(A, ℤ)`; `H₁ = (ℤ/2)^{(ι)}` | true | none |
| 1.4 Shapiro, permutation modules | `ℤ/2` on `G ⊔ pt` | 2 orbits: `H₀ = ℤ²` (points model `ℤ³`); `H₁ = 0 ⊕ ℤ/2` | true | none |
| 1.5 `Θ` | `ℤ` discrete vs profinite topology; sign, `ℤ/3` | `H¹ = Hom(ℤ, ℤ) = ℤ` vs `H¹_cont = 0` (finite images); `f` vs `−f`: `1 ≠ −1` in `ℤ/3` | discreteness needed | none |
| 2.1 hyperhomology | `S₃`, `ℤ[S₃/A₃] → ℤ`; `D = (ℤ →2 ℤ)`; `ℤ_sgn[1]` over `ℤ/2` | `H₀ = 0`, `H₁ = (ℤ_sgn)_{S₃} = ℤ/2` vs coinvariant complex `ℤ ≅ ℤ` giving 0; `H⁰ = 0`, `H¹ = ℤ/2`; `H² = ker(1+t)/(t−1) = ℤ/2` | true | none |
| 2.2 long exact sequences | `G = 1`, `0 → ℤ[0] → cone(id) → ℤ[1] → 0` | `δ: ℤ → ℤ` bijective, cone acyclic | true | none |
| 2.3 spectral sequences | `S₃` complex | `d¹` on `q = 0`: `ℤ → ℤ` identity; on `q = 1`: `ℤ/3 → ℤ/2` zero; `H₁ = ℤ/2`, `H₂ = ℤ/3 = H₁(S₃, ℤ_sgn)` from `0 → H₁(sgn) → ℤ/3 →0 ℤ/2` | true | none |
| 3.1 equivariant homology | `k = ℤ/4`, `C = k ⊕ (ℤ/2 → ℤ/4 → ℤ/2)`, `M = ℤ/2`; `ℤ ⊕ (F → F → ℤ[1/2])` | after `⊗ ℤ/2`: `ℤ/2 →0 ℤ/2 →id ℤ/2`, so `H₂ = ℤ/2 ≠ 0`; (s) `Σ4^j = −1/3` in `ℤ₂`, so `(1,0,1,0,…)` is not in the image and `H² ≠ 0` | flatness and projectivity needed | none |
| 3.2 orbit sequence | reflection and rotation of the 2-vertex circle | `E¹_{0,q} = (ℤ/2)²` for odd `q`; free action gives `E¹_{p,q>0} = 0` | true | none |
| 3.3 free complexes | `ℝ/2ℤ → ℝ/ℤ`, `M = ℤ_sgn` vs `ℤ`; `ℤ/m` periodic resolution | `(C⊗M)_G = (ℤ →−2 ℤ)`: `H₀ = ℤ/2`, `H₁ = 0`, vs `ℤ, ℤ`; `Hₙ = ℤ/m` (odd `n`), `0` (even `n > 0`) | trivial action needed for the comparison | none |
| 3.4 tree complex | one vertex; the line; one loop | `0 → 0 → k → k → 0`; `∂ = t − 1` injective with cokernel `k`; loop `∂ = 0`, not injective | acyclicity used | none |
| 3.5 tree sequences | `ℤ` on the line; sum model | `H₁ = M^ℤ`; sum model gives `coker(ℤ →2 ℤ) = ℤ/2 ≠ ℤ = H₀(ℤ, ℤ)` | true | none |
| 3.6 and `freeGroup_isZero_of_two_le`, `coprod_groupHomology_bijective` | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `BS(1,2)`; `ℤ ∗ ℤ` with sign action, `n = 1`; `ℤ/2 ∗ ℤ/2`, `n = 2, 3`; `S = ∅`, one letter | (s) cokernel of order 12, cyclic; `1−2 = −1`, `1−1 = 0`: `H₁ = ℤ` (sum model `ℤ/3`); `ker(−2,−2) ≅ ℤ` vs `0 ⊕ 0`; `0 = 0 ⊕ 0`, `(ℤ/2)² = ℤ/2 ⊕ ℤ/2`; `Hₙ(1) = 0`; length-1 resolution for `ℤ` | true; `n ≥ 2` needed for the free product | none |
| 4.1 cochain cup | `G = ℤ`, model without the action; `ℤ/2`, `𝔽₂` | (s) wrong model's coboundary at `(1,1,1)` is `2t − 2 ≠ 0`; `(x∪x)(g,g) = 1` | true | none |
| 4.2 uniqueness | the `(−1)^{pq}` family on `H¹(ℤ²)²` | gives `−(x∪y)`, pairing `−1`; `δx ∪′ y = (−1)^q δ(x ∪′ y)` fails the left rule for odd `q` | excluded | none |
| 4.3 identities | `ℤ²` cochains | `(x∪y)(e₁,e₂) = 1` vs `(−y∪x)(e₁,e₂) = 0`; the two are cohomologous | commutativity holds only in cohomology, as stated | none |
| 4.4 diagonal approximation | `n ↦ 2n` non-example; `G = 1` | degree `2n ≠ n` for `n ≥ 1`; `Δ` = unitor | true | none |
| 4.5 projection formula | `1 < C₃`, degree 0 | `cor(x·res y) = 3xy = cor(x)·y` | true | none |
| 4.6 cap and evaluation | `ℤ²`, `z = [e₁|e₂] − [e₂|e₁]` | back face: `y∩z = [e₁]`, `⟨x, y∩z⟩ = 1 = ⟨x∪y, z⟩`; front face gives `−[e₁]` | face pinned | none |
| 4.7 agreement of cups | `ℤ/2`, `𝔽₂`; `∏_ℕ ℤ/p` | `x² ≠ 0` on both sides; `H¹_cont` countable vs `Hom(G, 𝔽_p)` of size `2^{ℵ₀}` | true | none |
| 5.1 Künneth | `C₂²` over `ℤ`, `n = 2, 3`; `M = 𝔽₂`, `N = ℤ[1/3]`; `G = H = 1`, `M = N = ℤ/2` | `ℤ/2`; `(ℤ/2)²` from tensor terms plus `ℤ/2` from Tor; `𝔽₂² ⊕ 𝔽₂ = 𝔽₂³`; `H₁ = 0` vs `Tor₁ = ℤ/2` | one flat factor needed | none |
| 5.2 and `cohomologyEvaluation`, `extToCohomology`, `universalCoefficient_cohomology` | `G = ℤ`, `k = A = ℤ`, `n = 0`; `k = ℤ/4`, `G = A = ℤ/2`; Lean `n = 0` | `Ext¹(ℤ, ℤ) = 0`, `H¹ = Hom(ℤ, ℤ) = ℤ` (finite-group formula gives 0); `ℤ/2, ℤ/2, ℤ/2` cannot be short exact (`2·2 ≠ 2`); `Ext¹(k, A) = 0`, `H¹ = Hom(G^ab ⊗ k, A)` | global-dimension hypothesis needed, and present in Lean | none |
| 5.3 cohomological Künneth | `ℤ × ℤ` over `ℚ`; `ℤ^{(ℕ)}` | `1 − 0 = 1` (Koszul sign would give `−1`); `r` pure tensors have rank `≤ r`, the identity form on `⟨e₀,…,e_r⟩` has rank `r+1` | finiteness needed | none |
| 5.4 Pontryagin ring | `C₃²`; `ℤ/2` in degree 3; `ℚ`; `ℤ²` | `Λ² = ℤ/3 = H₂`; `Λ³ = 0 ≠ ℤ/2 = H₃`; colimit along `·(m+1)` is `ℚ`; (s) `d([e₁|e₂] − [e₂|e₁]) = 0` | degree bound for `k = ℤ` needed | none |
| 6.1 filtration | `2ℤ/4 ◁ ℤ/4`, `n = 1`; `N = G`; `N ≠ G`, `M ≠ 0` | `A₁`: `f(2) = 0`, dim 2; `A*₁`: also `f(1) = f(3)`, dim 1; `A_{j>0} = 0`; cochain `m` at `(g,…,g)` lies in `A_j` for every `j` | true | none |
| 6.2 cohomological Hochschild–Serre | `A₃ ◁ S₃`, `𝔽₃`; `ℤ/2 ⊂ ℤ/4`; page bound | signs `(−1)^{⌈q/2⌉} = −,−,+,+` for `q = 1..4`, so `H^q = 𝔽₃` iff `q ≡ 0, 3 mod 4`; `E₂ = 𝔽₂` everywhere vs `Hⁿ = 𝔽₂`; vanishing from page `max(q+3, p+2)` | true | none |
| 6.3 homological Hochschild–Serre | `C₂ × 0 ◁ C₂²`, `𝔽₂` | `dim Hₙ = n + 1` both ways | true | none |
| 6.4 edge maps | `ℤ/2 ⊂ ℤ/4`, `𝔽₂`; `ℤ²`, `M = k[N]` vs `M = k` | inflation iso; restriction `χ(2) = 2χ(1) = 0`; `k, k, 0` on both sides; `H₂ = k → 0` not injective | vanishing hypothesis needed | none |
| 6.5 multiplicativity | `0 × ℤ ◁ ℤ²` | `y∪x ↦ +x·y` (`(−1)^{0·0}`), `x∪y ↦ −x·y` (`(−1)^{1·1}`); `(−1)^{qp′}` gives the opposite | sign pinned | none |
| 6.6 transgression | `ℤ/3 ⊂ ℤ/9`; `Q₈ ⊃ ⟨i⟩` | (s) `df = −carry` on all 81 pairs, `df(2,1) = 2 = −1`; `c = 2 ∈ H²(ℤ/2, ℤ/4) = {0,2}/0` nonzero, `2⊗1 = 0` in `𝔽₂`, so `d₂ = 0` and `dim H¹(Q₈,𝔽₂) = 1 + 1 = 2` | true | none |
| 6.7 low-degree sequences | `ℤ/2 ⊂ ℤ/4`, `M = ℤ`; `M = 𝔽₂` | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` (orders `2·2 = 4`); inflation `x² ↦ 0` | vanishing hypothesis needed | none |
| 6.8 and `nonempty_groupHomology_two_addEquiv_hopf` | `ℤ/n`; `ℤ²`; `R = ⊥`; `S = ∅`; `A₅` | `R ∩ [F,F] = 0`; `[F,F]/[F,[F,F]] ≅ ℤ`; `h = ba(ab)⁻¹ = ⁅a,b⁆⁻¹`; `0 = 0`; `ℤ/2` | true | none |
| 6.9 profinite comparison | `ℤ/3 ⊂ ℤ/9`; `N = G` | `−[carry]` on both sides; `H²(1, −) = 0` | true | none |
| 7.1 and `doubleCosetTerm(Homology)`, both `…_eq_finsum` | `H = K = ⟨(12)⟩ ≤ S₃`, degree 0, `ℤ`; `K = 1`; `H = G` | 2 double cosets: `1 + 2 = 3 = [G:H]` in both formulas; `Σ_{gH} g·m`; one term, `cor` | true; the finsum has finitely many terms | none |
| 7.2 three predicates, three `bijOn` | `S₃`, `p = 3`, `n = 2, 4, 0`, `M = ℤ, ℤ_sgn`; Tate degree 0; `C₂ × S₃`, `M = 𝔽₂³` | `H²(3) = 0`, `H⁴(3) = ℤ/3` (`H⁴ = ℤ/6`); `H⁰(3) = 0` vs stable `ℤ` (so `n ≠ 0` needed); `{0,2,4} → ℤ/3` bijective; `ℤ_sgn`: `0 = 0`; stable dim 2 of 3 `= dim H¹(G, M)` | true | none |
| 8.1 `tate_duality`, `tate_duality_of_free` | `C₃`, `M = ℤ`, `i = 0,1,2`; `C₂`, `M = ℤ/2`; `C₂`, `ℚ/ℤ`, `i = 1`; `G = 1` | product in `ℤ/3` perfect; `0, 0`; `ℤ/3, ℤ/3`; `Ĥ⁰(Hom(ℤ/2, ℤ)) = 0` but a nonzero map `ℤ/2 → ℤ/2` exists; `ℤ/2 = Hom(ℤ/2, ℚ/ℤ)`; all 0 | freeness needed in the integral form | none |
| 8.2 | `ℤ/7 ⋊ ℤ/3`; `Q₈`; `D₈` | (s) orders: 1 element of order 1, 14 of order 3, 6 of order 7; `(1,0)(0,1) = (1,1) ≠ (2,1)`; abelian subgroups of `Q₈` cyclic; `V₄ ≤ D₈` | primality needed | none |
| 8.3 | `C₂`, `n = 0`, `M = ℤ` and `ℤ/2`; `C_p²` | `ℤ/2 → ker N/(t−1) = ℤ/2` bijective; `𝔽₂ → 𝔽₂` bijective in every degree; `dim Hⁿ = n + 1` unbounded | true | none |
| 8.4 `cup_characterConnectingClass_bijective` | `m = 12`; `m = 1`; `Q₈`; `S₃` | (s) `χ(gʲ) = j/12 ≠ 0` for `0 < j < 12`; `1/1 = 0`, `χ = 0`, all groups 0; `Ĥ² = (ℤ/2)²` not cyclic, 2-period 4; `Ĥ²(3) = 0`, `Ĥ⁴(3) = ℤ/3`, 3-period 4 | true | none |
| 8.5 `tfae_periodic_cohomology`, `tfae_primary_periodic_cohomology` | `1`, `S₃`, `A₄`, `SL₂(𝔽₉)`; `ℤ/2` with `p = 3` | `card = 1 = |G|`; `Ĥ⁴ = ℤ/6` cyclic of order 6; (s) `|A₄^ab| = 3`, so `Ĥ²(A₄,ℤ) = ℤ/3 = |A₄|₃` and (b₃) holds, while (c) fails via `V₄`; `9 ∣ 720` with `(ℤ/3)²`; `|G|₃ = 3⁰ = 1`, all four hold | true; no divisibility needed | none |
| Zero module, zero ring | `M = 0`; `k = 0` | every group and map is 0; `BijOn {0} {0}`; no denominator in `k` | true | none |
| Context | every declaration | no section `variable` other than `universe u`; all hypotheses in the declarations' own signatures (checked with `#check`) | true | none |

## Unresolved, for the maintainer and the humans

- **Declared supplier gaps.** All three are still open at the suppliers as they read now:
  - `homological-low-degree`: DerivedModuleAlgebra §S.1 on main states the edge morphisms and the
    five-term sequence in cohomological indexing only.
  - `flat-kunneth`: SpectralSequencesAndConvergencePartII §4.3 at its head is natural only from
    page 2, and does not state the two-column sequence as natural.
  - `least-r-period`: K3BlochGroups §5.2 at its head does not define the period as the least such
    `d`.

  The accepted review's conditions are the first two. The third is declared in the README in the
  same way, under the K3BlochGroups contract.
- **Scope, for the humans.** LocalFiniteGroupTheory L4 (open, on the never-cite list) plans the
  classification of `p`-groups of `p`-rank one, which is the content of §8.2. The open
  GlaubermanZStar, which is not in the merge order, consumes that L4 statement. §8.2 stays here.
  Which roadmap keeps it is a maintainer's decision.
- **Unverified sources.** Brown82 and CE56 remain `uncertified`, cited by chapter without the text.
  SwanPPeriod60 is `waived`.
- **Ownership against open pull requests** was checked with the tool index of all open roadmap pull
  requests and the listed checkouts. Five cited roadmaps are not among the listed checkouts:
  K2SymbolsBrauer, SchemeKTheoryOperations, ArithmeticGaloisDuality, InductionRestrictionPartII and
  ModularCurvesPartII. I read them at their heads through `roadmaps show`.
- **Untrusted text.** None of the packages, reports or roadmaps I read contained an instruction
  addressed to this job.


Pull request: #2338 (roadmap/cohomology-of-groups at f8d096c)

# Design report: DESIGN-CohomologyOfGroups

**Deliverables.** `packages/CohomologyOfGroups/design/README.md` (8 layers, 41 targets),
`packages/CohomologyOfGroups/design/plan.json` (the same 41 targets as data, one gap),
`packages/CohomologyOfGroups/sources.toml` (8 sources; `sources check`: 0 problems), and this report.
No `needs-references.toml` is written: every text the design cites is certified, uncertified
(paywalled, cited by locator) or waived.

## 1. What the design covers

The design plans the whole target (`packages/CohomologyOfGroups/target.md`), reorganised by
dependency into eight layers:

| Layer | Mathematics | Targets |
|---|---|---|
| 1 | conjugation, quotient action on `H*(N, M)`, additivity, permutation modules, continuous vs discrete for discrete `G` | 1.1–1.5 |
| 2 | hyperhomology and hypercohomology, long exact sequences, the two spectral sequences | 2.1–2.3 |
| 3 | equivariant homology, orbit and free complexes, the chain complex of a tree, tree sequences, amalgams, HNN, free groups | 3.1–3.6 |
| 4 | cochain cup product, identities, connecting maps and uniqueness, diagonal approximations, projection formula, cap product and evaluation, agreement with Tate and continuous cups | 4.1–4.7 |
| 5 | Künneth (homology, cohomology), universal coefficients, Pontryagin ring | 5.1–5.4 |
| 6 | normalized cochains and the extension filtration, cohomological and homological Hochschild–Serre, edge maps, multiplicativity, transgression, low-degree sequences, Hopf, comparison with the profinite theory | 6.1–6.9 |
| 7 | double coset formula (any group), stable elements (finite groups) | 7.1–7.2 |
| 8 | Tate duality, `p`-groups with cyclic abelian subgroups, periodicity from cohomologically trivial resolutions, periods (cyclic, quaternion, Swan), periodicity theorem | 8.1–8.5 |

**Where each item of target.md went** (target numbering → design numbering): 1.1 → 2.1; 1.2 → 2.2;
1.3 → 2.3 and 3.2; 2.1 → 4.1–4.4; 2.2 → 4.5; 2.3 → 4.6; 2.4(a) → 4.7(a); 2.4(b) → 1.5 and 4.7(b);
2.4(c) → 4.7(c); 3.1 → 5.1; 3.2 → 5.2; 3.3 → 5.3; 3.4 → 5.4; 4.1 → 6.1–6.3; 4.2 → 6.4; 4.3 → 6.6;
4.4 → 6.5; 4.5 → 6.7 and 6.8; 4.6 → 6.9; 5.1 → 3.1; 5.2 → 3.2; 5.3 → 3.3; 6.1 → 3.4–3.5;
6.2 → 3.6; 7.1 → 7.1; 7.2 → 7.2; 7.3 → 8.1; 8.1 → 8.5 (with 8.2); 8.2 → 8.4; 8.3 → 8.3. Layer 1 is
new: conjugation, the quotient action and additivity are used by Layers 3, 6, 7 and are not in the
pinned libraries.

**Design decisions against target.md.**

- **Spectral-sequence suppliers.** target.md names SpectralSequencesAndConvergence and its Part II
  as suppliers. Neither is on main, in the merge order, or in an open roadmap pull request (both are
  board packages: a design under review and a target), so neither may be consumed. The design uses
  instead: DerivedModuleAlgebra §S.1 (on main), which owns the first-quadrant double-complex
  spectral sequence in an abelian category with `E₂`, convergence, edge morphisms, five-term and
  extended sequences, exact-rows comparison and naturality; and Tau Ceti's filtered-complex and
  bicomplex spectral sequences at the pin (`CochainComplex.spectralSequence`,
  `CochainComplex.filtrationAbutmentIso`, `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`,
  `HomologicalComplex₂.rowFiltrationSpectralSequence`, `HomologicalComplex₂.quasiIso_totalAugmentation_of_rows`).
  No spectral-sequence machinery is built here.
- **Model for the extension spectral sequence (target.md Risk 2).** Cohomology uses HS53's direct
  method: the filtration of the normalized cochains of `G` (HS53 Ch. II). HS53 proves for exactly
  this model the `E₂` identification (Ch. II Thms. 1–2), multiplicativity (Ch. II Thm. 3), the edge
  maps (Ch. III §1), transgression = `d_{n+1}` (Ch. III §3 Prop. 1), the degree-`m` sequence
  (Ch. III §4 Thm. 2) and `d₂ = −c ∪` (Ch. III §6 Thm. 4); HS53 line 30–38 says it does not know
  whether the double-complex (Ch. I) sequence agrees beyond `E₂`, so the design does not claim it.
  Homology uses hyperhomology of `Q` on `(P ⊗ M)_N` (Layer 2), for which the sources give only
  `E²` (Loh19 Thm. 3.2.12; HS53 line 355–362); no product statement is made in homology.
- **Algebraic Künneth and universal-coefficient spectral sequences over an arbitrary ring.**
  These are statements about complexes of `k`-modules (the territory of a spectral-sequence
  roadmap). The design plans the chain-level identification `C(G; M) ⊗_k C(H; N) ≃ C(G × H; M ⊠ N)`
  (5.1), to which such a sequence applies, and the two-term sequences over rings of global
  dimension at most one through Tau Ceti's Künneth and universal-coefficient sequences.
- **Transgression in degree one for every group.** Defined on Mathlib's cochains through a
  set-theoretic section (6.6), using the identities of Tau Ceti's `IsTransgressionLift`, rather
  than through the continuous comparison as target.md suggested; the comparison with the profinite
  transgression for finite groups is 6.9.
- **`G`-CW complexes (target.md Risk 5).** Not constructed. The algebraic statements (3.2, 3.3,
  8.3) take a complex of permutation or free modules as input; a roadmap owning `G`-CW complexes
  obtains the topological forms by applying them to cellular chains (proposed Part II below).
- **Direction of supply (target.md Risk 3).** The recommendation of target.md is adopted: this
  roadmap's suppliers are Mathlib, Tau Ceti and roadmaps on main only; the roadmaps in review that
  restate pieces are consumers.

## 2. Suppliers, ownership and overlaps

**Suppliers (all on main).** DerivedModuleAlgebra §S.1; ProfiniteCohomology §§3.1, 3.2, 5.5, 6.4,
10.1, 10.5 and Layer 12; ClassFieldTheory §0.1; FreeGroupsAndLimitGroups §§2.2, 4.1, 4.2, 4.5–4.8;
AlgebraicTopology §§5.3, 5.4, 8.15 (Checks only). Every section was read at main.

**Ownership checks** (by object, with `roadmaps grep` over main and the open heads and by `grep`
over main's roadmaps and the pins):

- Hyperhomology: owned locally by SchemeKTheoryOperations §6.7 (integral, as an input to homology
  stability) and K3BlochGroups §4.1. Both are open and later than this roadmap; listed as consumers.
- Hochschild–Serre for discrete groups: restated by MappingClassGroupsAndCanonicalRepresentations
  §1.1 (open; consumer). ProfiniteCohomology lists it as out of scope. ArithmeticLocallySymmetricSpaces
  ALS.6.2 is the finite-cover Hochschild–Serre sequence of a locally symmetric space with Hecke
  action, a different object (topological, with Hecke operators).
- Central-extension low-degree sequence: InductionRestrictionPartII RS.0.1 says it owns the full
  low-degree homology exactness theorem for a central extension. It is open (merge order line 64);
  6.8 is the general statement here, and RS.0.1 is listed as a consumer that should import it.
- Stable elements, Tate duality for finite groups, periodicity, Hopf's formula, the Pontryagin ring
  of an abelian group, tree and amalgam sequences: no owner on main. Matches on main
  (AlgebraicKTheory "stable elements", PositiveScalarCurvature "Hopf formula", AlgebraicTopology
  "Pontryagin product" of tori, ClassFieldTheory/ProfiniteCohomology "Tate duality" for local
  fields) are other objects.
- ProfiniteCohomologyPartII 0.2 (open) compares its continuous inhomogeneous cochain algebra of a
  profinite group with `continuousCohomology`. Target 1.5 compares `continuousCohomology` with
  `groupCohomology` for a discrete group. The two meet only for finite groups, where 1.5's
  degree-`0, 1, 2` agreement with ProfiniteCohomology §3.1 (main) is the shared reference; no
  citation of the open roadmap is needed.
- Finite `p`-groups whose abelian subgroups are cyclic (8.2, Burnside): LocalFiniteGroupTheory L4
  owns the classification of `2`-groups of `2`-rank one, as GlaubermanZStar's scope records, but
  LocalFiniteGroupTheory is on this job's never-cite list. 8.2 therefore plans the statement here at
  the generality 8.5 needs; this duplicates LocalFiniteGroupTheory L4 for `p = 2`, and the two
  should be reconciled when that roadmap's status is settled.
- `roadmaps overlaps CohomologyOfGroups` reports "No roadmap CohomologyOfGroups on main or in an
  open roadmap pull request": the name is free and there is no pull request to compare.

**Notions moved down from later roadmaps.** None. No target needs a notion owned by a roadmap later
in the merge order. (8.2 is planned here because its owner may not be cited, not because it is
later.)

## 3. Gaps and proposed Part IIs

- **`gap:homological-low-degree` (supplier DerivedModuleAlgebra, §S.1).** §S.1 states edge
  morphisms and the five-term and extended sequences in cohomological indexing only; its homological
  form gives `E²` and convergence. Needed: the homological edge morphisms and the exact sequence
  `H₂(Tot C) → E²_{2,0} → E²_{0,1} → H₁(Tot C) → E²_{1,0} → 0`. Used by 6.3, 6.4, 6.7, 6.8. This is
  an extension of §S.1 in its own direction (a revision of DerivedModuleAlgebra, or its Part II),
  not planned here.
- **Proposed: AlgebraicTopology, Part II (`G`-CW complexes).** `G`-CW complexes, the
  `k[G]`-module structure on their cellular chains, and the topological forms of 3.2, 3.3 and 8.3
  (orbit spectral sequence of a `G`-CW complex; periodicity from a free cellular action on a
  finite-dimensional complex with the homology of a sphere).
- **Proposed: a spectral-sequence roadmap's Künneth and universal-coefficient sequences over an
  arbitrary ring**, applied to 5.1 for group (co)homology.

## 4. Sources

- **Read and cited (certified):** HS53 (AMS open back file), Loh19 (author's page), MilneCFT
  (author's page), SerreArbres (Numdam), Hutchinson13 (arXiv). Every locator in the README was
  checked against the cached text; printed page numbers were confirmed from the page markers
  (HS53 printed = PDF + 109, Loh19 printed = PDF − 8, MilneCFT printed = PDF − 9, SerreArbres
  printed = PDF − 1).
- **Uncertified (paywalled, cited by locator):** Brown82 (Ch. II §7; III §§8–10; IV §4; V; VI §§7, 9;
  VII) and CE56 (Ch. XII, XVII). Section numbers of Brown82 that Loh19 confirms: II.7, III.9, IV.4,
  VI.9 (Loh19 line 2439, 6642, 6654, 7128). Chapter V and VII are cited at chapter level because no
  open text confirms their section numbers. Tate duality (8.1) and the periodicity theorem (8.5)
  have only these uncertified sources for their full statements; Loh19 §4.3 (certified) covers the
  sphere-action direction, and Hutchinson13 Thm. 3.1 (certified) restates Swan's theorems.
- **Waived:** SwanPPeriod60, cited by its locator for 8.4 and checked against Hutchinson13
  line 499–504.
- **Removed from the manifest:** NSW. The service had recorded only the authors' landing page, and
  no statement of the design cites it; the profinite comparisons cite ProfiniteCohomology's sections
  instead.
- **Texts I could not read:** none needed beyond the uncertified and waived entries above.

## 5. Adversarial pass

One row per statement; "change" records what the pass altered in the README.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conjugation convention | `S₃`, `H = ⟨(12)⟩`, `g = (13)`, `(123)` | `gHg⁻¹ = ⟨(23)⟩` for both; `g⁻¹Hg = ⟨(13)⟩` for `(123)` | holds; distinguishes `g` from `g⁻¹` | Check rewritten to use `(123)` |
| 1.1 inner triviality | `S₃ ⊃ A₃`, `g = (12)`, `𝔽₃` | `c_g = −1` on `H¹(A₃, 𝔽₃) ≅ 𝔽₃` | needs `g ∈ H` | negative Check kept |
| 1.1 locator | HS53 text | corollary to Prop. 2 is in Ch. I §2, p. 113 (line 154–160), not §3 | locator wrong | fixed |
| 1.2 quotient action | `S₃ ⊃ A₃`, `𝔽₃`; `ℤ/4 ⊃ 2ℤ/4`, `M = ℤ` sign action | invariants `0`; action on `M^N = M` is `−1` (model without coefficients: `+1`) | holds | — |
| 1.3 additivity | `A = ℤ^(ℕ)` trivial; `ℤ/2`, `ℤ^(ι)` | identity `∈ Hom(A, ℤ^(ℕ)) ∖ ⊕Hom(A, ℤ)`; `H₁ = (ℤ/2)^(ι)` | cohomology needs products | — |
| 1.4 permutation modules | `ℤ/2` on `G ⊔ pt` | `H₁ = ℤ/2`, `H₀ = ℤ²` (points model: `ℤ³`) | holds | earlier non-example (claimed a free summand) was false; replaced |
| 1.5 discrete comparison | `ℤ` discrete vs profinite topology, `A = ℤ`; sign of homogeneous cocycle, `A = ℤ/3` | `H¹ = ℤ` vs `H¹_cont = 0`; `f ↦ −f` under the wrong sign | discreteness and normalisation pinned | Checks rewritten |
| 2.1 hyperhomology | `ℤ/2`, `C = ℤ`; `S₃`, `ℤ[S₃/A₃] → ℤ`; trivial group | `H₁ = ℤ/2`; `C ≃ ℤ_sgn[1]`, `H₀ = 0`, `H₁ = ℤ/2`, `H₂ = ℤ/3`; `Hₙ(C)` | holds | Example said `H₂ = 0`; corrected to `ℤ/3` |
| 2.3 first spectral sequence | `S₃` complex | `d¹` on `q = 0`: `ℤ → ℤ` iso (earlier draft: ×2, wrong); on `q = 1`: `ℤ/3 → ℤ/2` zero | `E²_{0,1} = ℤ/2`, `E²_{1,1} = ℤ/3` agree with second sequence | Check rewritten |
| 2.3 no converse | `S₃/⟨(12)⟩` | `d¹` iso on `q = 0, 1`; `H₀ = H₁ = 0`, `H₁(C) = ℤ²` | holds | — |
| 3.1 flatness | `k = ℤ/4`, `C = k ⊕ (ℤ/2 → ℤ/4 → ℤ/2)`, `M = ℤ/2` | `C → k` quasi-iso; `H₂(C ⊗ M) = ℤ/2` | flatness needed | earlier garbled Check replaced |
| 3.2 orbit sequence | circle with two vertices, reflection vs rotation | reflection: `E¹_{0,q} = H_q(ℤ/2, ℤ)² = (ℤ/2)²` for odd `q`, survives; rotation: `E¹_{p,q>0} = 0` | holds | earlier garbled Check replaced |
| 3.3 free complexes | `ℤ/m` periodic resolution; `C = ℤ` | `ℤ/m` odd degrees; `H₁(C_G) = 0 ≠ G^ab` | freeness needed | — |
| 3.4 tree chains | point, line, loop | `0 → 0 → k → k`; `t − 1` injective, coker `k`; loop `∂ = 0` not exact | holds | — |
| 3.5 tree sequence | `ℤ` on the line, trivial `ℤ` | `H₁ = ker(t⁻¹ − 1) = ℤ`, `H₀ = ℤ`; sum model `H₀ = ℤ/2` | difference needed | — |
| 3.6 amalgam | `ℤ/4 ∗_{ℤ/2} ℤ/6` | coker of `1 ↦ (−2, 3)` in `ℤ/4 ⊕ ℤ/6` is `ℤ/12` | holds | — |
| 3.6 HNN | `BS(1, 2)` | difference: `1 − 2 = −1` on `H₁`, `0` on `H₀`, `H₁ = ℤ`; sum: `3`, `2`, `H₁ = ℤ/3` | holds | earlier text said `ℤ/3 ⊕ ℤ`; corrected |
| 3.6 free groups | `FreeGroup S`, `ℤ/2 ∗ ℤ/2` | `H₁ = ℤ^(S)`, `Hₙ≥2 = 0`; `(ℤ/2)²` odd degrees | holds | — |
| Cup convention | `ℤ²`, projections `x, y` | `(x ∪ y)(e₁, e₂) = 1`, `(e₂, e₁) = 0`, pairing `+1`; Löh's `(−1)^{pq}`: `−1` | pinned | — |
| 4.1 cochain cup | `ℤ/2`, `𝔽₂`; `ℤ` on `ℤ[ℤ]` | `x²(g, g) = 1`; product without twist: `d = 2(t − 1) ≠ 0` at `(1,1,1)` | twist needed | earlier non-example (`ℤ_sgn` multiplication) was not equivariant; replaced |
| 4.2 graded commutativity | `ℤ²` | `x ∪ y = −y ∪ x` in cohomology; cochains differ (`1` vs `0`) | holds in cohomology only | — |
| 4.3 uniqueness | `(−1)^{pq}·∪` | right rule unsigned, left rule `(−1)^q`; equals `−∪` on `H¹ × H¹` of `ℤ²` | excluded by left rule | Check rewritten (earlier claim about a "+1" family was imprecise) |
| 4.4 diagonal approximation | `ℤ/2`; degree-doubling map | `x² ≠ 0` both ways; `n ↦ 2n` | holds | earlier garbled Check replaced |
| 4.5 projection formula | `H = G`; `x = res z` | `x ∪ y`; `[G : H](z ∪ y)` | holds | — |
| 4.6 cap, finite index | degree `0` | both sides `Σ_{gH} [μ(g·x ⊗ n)]` (inverses of `H\G` represent `G/H`) | holds | Check rewritten as a computation |
| 4.7 agreement | `ℤ/2`; norm elements; `∏_ℕ ℤ/p` | `x²` nonzero both; norm `∪ y = cor(m ∪ 0) = 0`; `H¹_cont` countable, abstract uncountable | holds | earlier example `Hom(ℤ_p, 𝔽_p)` uncountable was false (`= 𝔽_p`); replaced |
| 5.1 Künneth | `V₄`, `ℤ` in degrees 2, 3; `ℤ/p²`, `𝔽_p` | `H₂ = ℤ/2`; `H₃ = (ℤ/2)²` tensor `+ ℤ/2` Tor `= (ℤ/2)³`; `𝔽_p^{n+1}` | holds | — |
| 5.2 cohomological cross | `ℤ/p²`; `ℤ^(ℕ)²`, `ℚ` | `dim n + 1`; not surjective in degree 2 | finiteness needed | hypothesis stated on `H_q(H, k)`, not on finiteness types |
| 5.3 UCT | `ℤ/2`, `𝔽₂`, `k = ℤ` | `H¹ = 𝔽₂` (Hom), `H² = 𝔽₂` (Ext); `H₂(ℤ/2, ℤ/2) = ℤ/2` (Tor) | holds | — |
| 5.4 Pontryagin | `V₄`, `ℤ/n`, `ℤⁿ`, `ℤ/2` degree 3 | `Λ²V₄ = ℤ/2 = H₂`; `Λ²(ℤ/n) = 0 = H₂`; `Λ³(ℤ/2) = 0 ≠ ℤ/2 = H₃` | degree bound needed | "odd-degree squares vanish" weakened to degree one (all the exterior map needs); route no longer uses Layer 6 |
| 6.1 filtration | `N = 1`, `N = G`, `ℤ/4 ⊃ 2ℤ/4` | `N = 1`: filtration by degree, `E₂^{p,0} = Hᵖ(G)`; `N = G`: single column; `A*_1 ⊊ A_1` (`f(1) ≠ f(3)`) | holds | Checks rewritten (draft contained a false claim that `A_j = 0` for `N = 1`) |
| 6.2 cohomological HS | `S₃ ⊃ A₃`, `𝔽₃` | `ℤ/2` acts on `H^q(C₃, 𝔽₃)` by `+, −, −, +` for `q ≡ 0,1,2,3 mod 4` (`x ↦ −x`, `y ↦ −y`); `H^q(S₃, 𝔽₃) = 𝔽₃` iff `q ≡ 0, 3 mod 4` | holds | — |
| 6.2 non-degeneration | `ℤ/2 ⊂ ℤ/4`, `𝔽₂` | `E₂ = 𝔽₂` everywhere, `Hⁿ = 𝔽₂` | `d₂ ≠ 0` | Check added (draft's sign Check was non-discriminating) |
| 6.3 homological HS | `ℤ/4`, `V₄` | as above; `dim Hₙ(V₄, 𝔽₂) = n + 1` | holds | — |
| 6.4 edge maps | `ℤ/2 ⊂ ℤ/4` | inflation `H¹(ℤ/2) → H¹(ℤ/4)` iso; restriction to `2ℤ/4` zero (`2 ↦ 0`) | holds | — |
| 6.5 multiplicativity sign | `ℤ × ℤ ⊃ 0 × ℤ` | `E₂^{1,1} = ℤ = H²(ℤ²)`; `(−1)^{qp'}` gives `y ∪ x = −x ∪ y`; without it equal, contradicting graded commutativity | sign pinned | Check rewritten |
| 6.6 transgression sign | `ℤ/3 ⊂ ℤ/9`, `𝔽₃`, `f(i) = ⌊i/3⌋` | `df(r₁, r₂) = −carry(r₁, r₂)`, `df(2, 1) = −1`; factor set of `s(x) = x` is the carry, so `τ(u) = −c ∪ u` | agrees with HS53 Thm. 4 and ProfiniteCohomology §5.5 | — |
| 6.6 extension class convention | HS53 line 1008–1011 | `f(σx*) = σ` gives `df = −a` with `a(x, y) = s(x)s(y)s(xy)⁻¹`, so HS53's `c` is the class of the factor set | Conventions pinned | — |
| 6.7 five-term | `S₃ ⊃ A₃`, `𝔽₃`; `m = 0` | `H¹(S₃, 𝔽₃) = 0`; at `m = 0`, `M^G → M^G → M^G` identities not exact for `M = ℤ` | `m ≥ 1` needed | Check rewritten |
| 6.8 Hopf | `ℤ/n`, `ℤ²`, `Q₈` | `0`; `[F,F]/[F,[F,F]] = ℤ`; `H₂(Q₈) → H₂(V₄)` zero | holds | Check wording corrected ("index ℤ" was meaningless) |
| 7.1 double cosets | `S₃`, `H = K = ⟨(12)⟩`; `K = 1`; `K = H` normal; homology degree 0 | two double cosets, second through `H(1) = 0`; `Σ g·m`; `Σ c_g`; `g⁻¹s` run over `H\G` | holds; `c_{g⁻¹}` needed in homology | — |
| 7.2 stable elements | `S₃`, `p = 3`; `n = 0`, `M = ℤ`; `A₄`, `p = 2` | `H²(S₃, ℤ)(3) = 0`, `H⁴(S₃, ℤ)(3) = ℤ/3` (`H⁴ = ℤ/6`); degree 0 fails; `H¹(A₄, 𝔽₂) = 0` | `n ≥ 1` needed | — |
| 8.1 Tate duality | `ℤ/2`, `M = ℤ`; `d = 0`; `M = ℤ/2` | `Ĥ¹(ℚ/ℤ) = ℤ/2`; `H¹(G, ℤ) = 0 ≠ ℚ/ℤ`; `Ĥ⁰(Hom(ℤ/2, ℤ)) = 0 ≠ ℤ/2` | `d ≥ 1`, freeness needed | Check rewritten (draft's `M = ℚ` example was not a counterexample) |
| 8.1 `Ĥ⁻¹(G, ℚ/ℤ)` | trivial action | `ker N / I_G = {x : #Gx = 0} = (1/#G)ℤ/ℤ ⊂ ℚ/ℤ` | canonical, no choice | — |
| 8.2 Burnside | `Q₈`, `D₈`, Heisenberg `p³` | `Q₈` abelian subgroups cyclic; others contain `(ℤ/p)²` | holds | — |
| 8.3 periodicity from resolutions | `ℤ/m` on `S¹`; `ℤ/2`, `n = 0`; truncation | period dividing `2`; `0 → ℤ_sgn → ℤG → ℤ → 0`; `C_n/B_n` free and cohomologically trivial | holds | — |
| 8.4 periods | `S₃`; `SL₂(𝔽_q)`; `p ∤ #G` | 3-period 4 (`Ĥ¹, Ĥ², Ĥ³` `3`-parts `0`, `Ĥ⁴ = ℤ/3`), 2-period 2; 2-period 4; least `d = 1 ≠ 2` | `p ∣ #G` needed | cyclic agreement with `periodicIsoOfGenerator` in all degrees was asserted without a sign check; now stated only in degree 0 (Tau Ceti) and as a route |
| 8.5 periodicity theorem | `C_p × C_p`; trivial group; `S₃`; `A₄` | `dim Hⁿ = n + 1`; `u = 0`; `d = 4`; `V₄ ⊂ A₄` | holds | layer reordered so 8.5 follows 8.3 and 8.4 |
| Context and generality | universes; finiteness | carriers need `k G : Type u`; Tate statements carry `[Fintype G]`; cyclic Tau Ceti lemma is for `G : Type`, `CommGroup`, extended in 8.4 to `Type u`, `IsCyclic` | stated in Conventions and hypotheses | — |

## 6. Dependency check

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2172 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All suppliers are on main; the design names no roadmap from the merge order
as a supplier.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The
tool did not check names outside TauCetiRoadmap on this host, so every backticked Mathlib and Tau
Ceti name was checked against the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) by declaration and
namespace; four namespaces were corrected
(`AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
`AlgebraicTopology.inclusionOfMooreComplexMap`, `groupHomology.isZero_indBot_succ`,
`DoubleCoset.Quotient`).

## 7. Not checked

- No Lean command was available to this job, and `Suggested.lean` is not a deliverable at the design
  stage; nothing was elaborated.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at
  their heads for the roadmaps named above; the overlaps tool has no entry for this new roadmap.
- The section numbers of Brown82 Ch. V and VII and of CE56 are not confirmed by an open text and are
  cited at chapter level.

## 8. Untrusted text

No issue, pull-request, roadmap or fetched text contained instructions to run commands, change
files outside the job, use credentials or contact services.

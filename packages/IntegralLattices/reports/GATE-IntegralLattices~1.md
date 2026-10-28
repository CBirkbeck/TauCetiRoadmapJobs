# GATE-IntegralLattices~1: answers to the review of `353067c`

Commits `12a6aa19` (review answers) and `144d5c61` (gate repairs) on the pull-request branch (not pushed). Files: `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`.

## H01 (roed-math) — applied

B7's split branch fibred the modulus-one torus quotient over "the finite split class set of B5" (all `φ(m)` proper classes of discriminant `m²`), but the base `T_L(ℚ)\T_L(𝔸_f)/T_L(ℤ̂)` parametrises the proper classes in one genus. B3 now has a split-branch theorem: representatives `(0, m, c)`, `c ∈ (ℤ/mℤ)ˣ`; class group `≅ (ℤ/mℤ)ˣ`; genera are the cosets of `((ℤ/mℤ)ˣ)²`; conductor-dependent `T_L(ℤ_p) = {(t,t⁻¹) : t² ≡ 1 mod p^{v_p(m)}}`; torus quotient `(ℤ/mℤ)ˣ/{t : t² = 1} ≅ ((ℤ/mℤ)ˣ)²`, acting simply transitively on the proper classes in `gen L`. B7's split bullet now fibres over that double quotient, B5 gives the `φ(m)` count and separates it from the per-genus count, and the Checks are Δ = 25 (4 classes, 2 genera, base of order 2) and Δ = 64. The reviewer's base `(ℤ/5ℤ)ˣ/{±1}` is correct at m = 5, but in general the quotient is by `{t : t² = 1}`, not `{±1}`. At m = 8 every unit squares to 1, so the base is trivial (4 genera of one class each), where `{±1}` would give 2. That m = 8 case is the second Check.

## H02 (roed-math) — applied

In 4C, the equation `C_L =` squares in `NarrowPic 𝒪_Δ` and the claims "`J/(ℚˣJ_L)` is not this count" and "`J ≠ ℚˣ θ(J_V)`" now sit under a nonsquare sub-bullet. A new square sub-bullet has: `C_L ≅ ((ℤ/mℤ)ˣ)²`; `θ(t,t⁻¹) = t`; the split norm is surjective, so `θ_p(SO(V_p)) = ℚ_pˣ` and `J = ℚˣθ(J_V)`; and `J/(ℚˣJ_L) ≅ G/(G[2]G²)` with `G = (ℤ/mℤ)ˣ`. Squaring maps this isomorphically onto `G²/G⁴ = C_L/C_L²`, so in the square branch the two counts agree and the factor 2 is absent. Witnesses: `U` (both trivial) and `5xy + y²` (both of order 2). The 4C prerequisite row now lists B2, B3 and B6 for rank 2.

## H03 (roed-math) — applied

4E rank 2 said the classes in a genus are "a subset of the invertible proper ideal classes … hence of its Picard group". It now reads as follows. For nonsquare Δ > 0, B2's oriented map goes into `NarrowPic 𝒪_Δ`, which is finite (`finite_narrowPic` or B5's cycles), and `Pic` is excluded by the `x² − 3y²` / `−x² + 3y²` pair. For square Δ = m², B5's direct count is `φ(m)`. In both cases, finiteness of classes follows from finiteness of proper classes by forgetting orientation.

## H04 (roed-math) — applied

The duplicated declarations were deleted from `Suggested.lean` and the file now imports the native modules. Each item below was checked at Tau Ceti `a91d3aa`:

- `formTwist` and `scalarDilation`/`dual_formTwist` → `IntegralLattice.scale` (`a • L`) and `dualCarrier_smul` (`Scaling.lean`, `Dual/Scaling.lean:71`).
- `restrictToFullSubmodule`/`restrictToRationalSpan`/`restrictionComparison` → `restrictFull`/`restrict`/`restrictFullIsometry` (`Restriction.lean:65,173,199`).
- `IsCharacteristicVector` and `isEven_iff_isCharacteristicVector_zero` → the native ones (`Characteristic/Basic.lean:40,66`).
- `expCircle` and its four laws → `TauCeti.expCircle`, an `AddChar` (`Circle.lean:60`).
- `IsMetabolic` → native (`Metabolic.lean:29`).
- `gaussSign`/`gaussSum_eq`/`gaussSign_orthogonalSum`/`gaussSign_eq_zero_of_isMetabolic` → `gaussSign`, `IsNondegenerate.gaussSum_eq`, `gaussSign_prod`, `gaussSign_eq_zero_of_isMetabolic` (`GaussSum.lean:447,469,500,531`).
- `LocalCarrier`/`localIntegralForm`/`CompletedAmbient`/`completedRationalForm`/`localizationToCompletion` and its three theorems → native (`Localization.lean:88–186`).

The new native names are pinned by `#check`. `vanDerBlij` is restated on the native `IsCharacteristicVector`. It stays a target because the pin only has `IsUnimodular.characteristicVector_integralNorm_modEq`, which says characteristic norms agree mod 8 and does not mention the signature. The odd-`p` splitting example was later deleted with the other admitted examples, and its content is README 3C. In the README:

- the "What Tau Ceti supplies" table gains seven rows;
- 0A, 1G, 1H, 1L, 3A and the conventions paragraph name the native declarations as consumed;
- the Layer-8 export table now names `TauCeti.expCircle`, `TauCeti.FiniteQuadraticModule.gaussSign`, `IsNondegenerate.gaussSum_eq` and `gaussSign_prod`.

No alias wrappers were added. The roadmap's old names are not used anywhere else, and a wrapper would only be padding.

## H05 (roed-math) — applied

Ordering section, old: "`0 → 1 → 5` … uses no milestone of Layers 2, 4, 6 or 7". New: the existence route `0 → 1 → 3 → N0 → 5A, 5B` uses IL3C/3D/3E and N4's rational-form producers, and of Layer 4 only N0. Uniqueness and splitting (5C, 5D) additionally use N1, N3 and the OTM0.3 Eichler comparison. The "Layer 5 existence" bullet was synchronised to match.

## H06 (roed-math) — applied

The ⟨1⟩ rejection argument in 4C ("the diagonal ℚˣ cancels only finitely many of them") is replaced by the unit-idele proof. `W = ∏ℤ_pˣ × ℝˣ` satisfies `W ∩ ℚˣJ² = {±1}·W²`, because a rational with even valuation everywhere is `±r²`. So `W/(W ∩ ℚˣJ²)` is the infinite product of the groups `ℤ_pˣ/(ℤ_pˣ)²` modulo one sign class. The text notes that `−1` is a nonsquare at every `p ≡ 3 (mod 4)`.

## H07 (roed-math) — applied

These unnamed external references were removed, and the mathematical content each sentence carried was kept:

- the "source notebook" (6A supplement);
- the "source allocation register" (N4);
- the "source qualification register" (Leech row);
- "written-source status … recorded in provenance" (N3);
- "separate provenance" (rootlessness checker);
- "the unrestricted source statement remains qualified".

The Leech sentence now says that a vector with spatial coordinates `3, 5, …, 49` is not the target and the corrected vector is.

## H08 (roed-math) — answered

Supplier coordination with OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass and AnalyticNumberTheory: this note asks for no change. The README cites those roadmaps by name and section, not by pull-request number, and depcheck reports no UPWARD or CYCLE edge (below). Their pull-request heads were not re-read in this round.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| B3 split representatives `(0,m,c)` | m = 1, 5, 8 | 1, 4, 4 classes. A brute-force SL₂(ℤ) search (entries ≤ 20) maps every primitive form with \|a\|,\|c\| ≤ 6 of discriminant 25 (92 forms) or 64 (52 forms) to exactly one representative, with no two representatives equivalent | holds |
| split class group `≅ (ℤ/m)ˣ` | adelic | `(ℤ̂ˣ)²/(𝒪̂_mˣ·{±(1,1)})`, via `(a,b) ↦ ab⁻¹`: kernel `𝒪̂_mˣ·{±1}` | holds |
| genera = cosets of squares | m = 5 | `5xy+cy² ≡ cy² (mod 5)`: {1,4}, {2,3} | 2 genera × 2 |
| | m = 8 | odd values `≡ c (mod 8)` | 4 genera × 1 |
| torus quotient `G/G[2] ≅ G²` | m = 5 | `G[2] = {±1}`, order 2 | holds |
| | m = 8 | `G[2] = G`, trivial | holds |
| | m = 1 | trivial | holds |
| | wrong model `G/{±1}` | 2 at m = 8 | ≠ 1: excluded by Check |
| 4C square: `J/(ℚˣJ_L) ≅ G/(G[2]G²) ≅ C_L/C_L²` | m = 1 | 1 = 1 | holds |
| | m = 5 | `G = ℤ/4`: `G/(G[2]G²)` order 2; `G²/G⁴` order 2 | holds |
| | m = 8 | 1 = 1 | holds |
| 4C nonsquare factor 2 | x²+y² | 1 class; `J/(ℚˣJ_L)` order 2 | unchanged |
| 4E rank 2 via NarrowPic | Δ = 12 | `Pic` trivial, `NarrowPic` order 2, two proper classes | `Pic` excluded |
| ⟨1⟩: `W ∩ ℚˣJ² = {±1}W²` | q = −1 | nonsquare at p = 3, 7, 11, … | quotient still infinite |
| `vanDerBlij` restated | ⟨1⟩, w = 1 | 1 ≡ 1 (mod 8) | holds |
| | ⟨2⟩ | 1 vs 2k² | fails, excluded by `hU` |
| native `gaussSign_prod` | needs both nondegenerate | same hypotheses as the deleted `gaussSign_orthogonalSum` | no change of generality |

| `NikulinGenerator.toFiniteQuadraticModule` (now Tau Ceti's `oddCyclic (p^k)`, `dyadicCyclic k`, `dyadicU k`, `dyadicV k`) | `q_1^{(3)}(3)`, `q_1^{(2)}(2)`, `u(2)` | values `(1·4)/6 = 2/3`, `1/4`, `x₁x₂/2` on generators | real bodies |
| `NikulinGenerator.realizationDet` | `q_θ^{(p)}(p^k)`: `⟨θp^k⟩` has `A = ℤ/p^k`, `q(e/θp^k) = 1/(2θp^k)`, isometric to `q_θ` by `x ↦ θx` (`θ⁻²` a square) | `u(2^k)`: `det 2^kU = −4^k`; `v(2^k)`: `det 2^k·!![2,1;1,2] = 3·4^k`, form `(x₁²−x₁x₂+x₂²)/(3·2^k)`, a similitude by the norm 3 of `ℤ₂[ω]` | matches Tau Ceti's docstrings |
| `NikulinDecomposition.padicDiscriminant` | `⟨2⟩` vs `⟨10⟩`, i.e. `q_1^{(2)}(2)` vs `q_5^{(2)}(2)` | realizations `2` and `10`; `10/2 = 5` is not a square in `ℚ₂` | depends on `D` exactly in the excluded dyadic case, as the rejection test says |
| | trivial `q` | empty product `1` | square class `1` |
| `exists_evenLattice_iff … D` | conditions 3/4 read `D` only at odd `p` or under `¬ HasCyclicTwoSummand` | independent of `D` there by `padicDiscriminant_eq_squareClass_gramDet` | holds for every `D` |
| `milgram` | `⟨2⟩` | `A = ℤ/2`, `q = 1/4`, Gauss sum `1+i = √2·e(1/8)`, `t₊−t₋ = 1` | `1 = 1` |
| | `⟨−2⟩` | Gauss sum `1−i`, sign `7`, `t₊−t₋ = −1 ≡ 7` | holds |
| | `E₈` | `A = 0`, sign `0`, `t₊−t₋ = 8 ≡ 0` | holds |
| `equivalent_of_isEven_unimodular_indefinite` | `U ⊕ U` vs `U ⊕ U` with basis swap; `n = 0` | `n = 0` excluded by `0 < sigPos ∧ 0 < sigNeg` | holds |
| | definite `E₈²` vs `D₁₆⁺` | excluded by the indefiniteness hypothesis | the hypothesis is load-bearing |

Context: I appended a `#check @name` for every declaration (24 of them) to the end of the file, ran the build once, and then removed the lines. Each elaborated type matches its README statement. `milgram` and `IntegralLattice.padicDiscriminant_eq_squareClass_gramDet` carry `[L.IsNondegenerate]`, `[FiniteDimensional ℚ V]` and `hL` in their own signatures. `NikulinExistenceConditions` and `exists_evenLattice_iff` now take the decomposition `D` explicitly.

## Gate repairs (second commit)

- **Imports.** The seven roadmap imports are gone: `Completed.IntegralLattices`, `QuadraticFormInvariants`, `GlobalQuadraticForms`, `GlobalNumberFields`, `ClassFieldTheory`, `Completed.RestrictedProducts` and `OrthogonalSpinGroups`. The file now imports `Mathlib` and 17 native `TauCeti.*` modules. The 41 build warnings were linter warnings from the imported `ProfiniteCohomology` module, and they disappear with these imports. The supplier `#check` block and the Layer-B supplier contract went with them. The module docstring now lists the headlines that cannot be stated at the pins and says what each lacks: genus symbols (3), the adelic orthogonal group and spinor norm (4), the Hilbert symbol (3G), and quadratic orders with `Pic`/`NarrowPic` and ring class fields (B2, B3).
- **Sorry'd data.**
  - `NikulinGenerator` now has the constructors `oddCyclic`, `dyadicCyclic`, `dyadicU` and `dyadicV`. `toFiniteQuadraticModule` maps them to Tau Ceti's modules of the same names, and `orthogonalSumNikulinGenerators` is a `foldr` of `prod`.
  - `padicDiscriminant` is now `NikulinDecomposition.padicDiscriminant`: the square class of the product of the minimal realizations' determinants (`realizationDet`) over the `p`-primary generators. README 5B records the four realizations.
  - `orderOfNonsquareBinaryDiscriminant`, `binaryRingClassField` and `gal_binaryRingClassField_equiv_pic` were deleted with the `GlobalNumberFields`/`ClassFieldTheory` imports.
  - `padicDiscriminant_of_minGenerators_eq_zero` was deleted. It became an empty-product identity.
  - The alias `orthogonalSum` was deleted in favour of Tau Ceti's `prod`, and the README 8S row was updated.
- **Admitted examples.** All 27 were deleted, together with the proved Layer-3 supplier `example`. Two of them were headline theorems and are now named and listed in the README:
  - Layer 1I is now `milgram`, stated at every signature through `gaussSign` of `discriminantQuadraticModule`, where the old example only had the even unimodular corollary.
  - Layer 6 is now `equivalent_of_isEven_unimodular_indefinite`.
- **PR numbers.** The README's "PR #200" now reads as Tau Ceti's `TauCeti.IntegralLattice`. The same defect also appeared as `#246` and `#255`, five times in the README, and these were fixed as well: they are replaced by the roadmap names Restricted Products and Orthogonal and Spin Groups.
- **Residue.** In the Weil-representation bullet, "Nothing here is a stand-in for it, and no declaration …" now reads "No milestone of this roadmap acts on `ℂ[A_L]`". In the B3 row, "and no local stand-in that would admit one" is removed. In the OSG row, "are no longer cited" now reads "are not cited".
- **Ownership.** No new carrier is introduced. The generator modules are Tau Ceti's. No declaration shares a fully qualified name with `Completed/IntegralLattices/Suggested.lean`, which uses the same namespace; I checked this by comparing the two files' declaration lists.

## Build

`lake build TauCetiRoadmap.IntegralLattices.Suggested`: `Build completed successfully (9031 jobs).` The only warnings are `declaration uses 'sorry'`.

## Gate

`gate IntegralLattices: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

## Depcheck

`depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

## Citations and ownership

- The one unresolved-citation lead, `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`, exists at `TauCetiRoadmap/GlobalNumberFields/Suggested.lean:777`, so it is a false lead.
- The new B3 split-branch theorem is elementary and carries its own proof route. No new source was added and `sources.toml` was not touched.
- Ownership: the split binary class group stays this roadmap's own (Layer B already owns the square branch), and no other roadmap defines a split order.
- No text in the review was treated as an instruction.

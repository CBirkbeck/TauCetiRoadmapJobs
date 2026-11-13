# PORT-ModpRepresentationsOfGL2OverLocalFields

- Branch: `roadmap/modp-representations-of-gl2-over-local-fields`, from main `45f58db`.
- Head commit: `08debbed97568e4de4f53240eb36e36b6c649452`
  ("ModpRepresentationsOfGL2OverLocalFields: roadmap (README, Suggested.lean, metadata)").
- Files: `TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md` (2506 lines),
  `Suggested.lean` (244 lines), `metadata.toml` (`topic = "math.NT"`). Nothing outside the folder.

## Which package text was ported

The board copy at `packages/ModpRepresentationsOfGL2OverLocalFields/` in this worker's board
checkout is the 2026-11-08 submission (#2334). Its `README.md` is 2005 lines, with `p ≥ 15` in §9.2
and no FiniteFlatGroups gaps beyond one. Review rounds REV~2 to REV~6 and repair rounds FIX~3 to
FIX~7 were made on later heads of the package branch, and those heads are not in this board
checkout.

I ported **FIX~7**, commit `d6f2f83` ("round 7 … repaired: 4 of 4 findings applied"):
- FIX~7 applies all four findings of REV~6, the last review: the P1 Barthel–Livné gap, `p ≥ 14`,
  the two References entries, and `D₀(ρ̄)` via BP12 Theorem 13.8. I checked each in the text.
- I read it read-only with `git show d6f2f83:packages/…` from another worker's board checkout. That
  checkout's branch contains the commit; I wrote nothing there.
- Its `README.md` is 2462 lines and its `Suggested.lean` has 12 declarations, adding the Banach
  approximation theorem of §2.6.

`review.json` in both copies still records REV~2's `needs_changes`, and no review of FIX~7 exists.
**The worker should confirm that FIX~7 is the accepted text.** Porting the board copy would have
reinstated the 11 REV~2 findings and everything after them.

## Build

`lake build TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields.Suggested`:

```
Build completed successfully (18239 jobs).
```

- **Warnings: 7.** All are `declaration uses 'sorry'`, at lines 103, 133, 145, 163, 178, 192 and
  214 of the built file. There are no other warnings.
- **Header change.** With the package's plain `import Mathlib`, Lean adds an eighth warning
  ("imports `Mathlib` … consider adding `module`"). I switched to the form 71 roadmaps on main use,
  including FlagVarieties: `module`, `public import Mathlib`, `public section`. The gate accepts it
  (`imports=0`).

## Gate

```
gate ModpRepresentationsOfGL2OverLocalFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

## Dependency check

```
depcheck: 225 roadmaps, 1995 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The run before the last README edit gave `223
roadmaps, 1983 edges, 0 problem(s)`.

## Draft pull request body

This pull request adds the roadmap *Smooth mod p representations of GL₂ over a local field*. It
builds the finiteness theory and the local structure theory of smooth `p`-power-torsion
representations of `GL₂(F)`, for `F/ℚ_p` finite, with coefficients in the integers of a second
finite extension `L/ℚ_p`. That is the representation-theoretic input of the Gelfand–Kirillov-dimension
programme of Breuil–Herzig–Hu–Morra–Schraen and of the `p`-adic cohomology of the Drinfeld and
Lubin–Tate towers.

The first half covers:
- finite presentation in the smooth category, through the augmented Iwasawa algebra;
- Shotton's coherence theorem for `GL₂(F)/ϖ^ℤ`;
- the three `ℚ_p` finite-length criteria of Colmez–Dospinescu–Nizioł;
- finite length and closure under subobjects for admissible finitely presented representations,
  for every `F`;
- for `F ≠ ℚ_p`, Emerton's ordinary parts with their finite-error counit, and its Banach-lattice
  form.

The second half, for `F` unramified, covers:
- the tame Serre-weight coordinates, the weight set `W(ρ̄)` and the Diamond modules;
- the graded algebra of the pro-`p` Iwahori subgroup and its crossing quotient;
- the finite and first-order extension calculus of `GL₂(k_F)`, `K` and `I`;
- the Diamond boxes and their multiplicity-preserving enlargements.

It ends at the two endpoints of BHHMS: the local bound `dim_{GL₂(F)} π ≤ f` under the socle,
first-thickening and Iwahori-socle multiplicity hypotheses, and the gluing lattice. The lattice's
reduction is the first radical truncation of a projective envelope, its endomorphism ring is
commutative and its quotients are relatively projective. The roadmap is wanted because:
- HilbertModularVarietiesAndShimuraCurvesPartII consumes Layers 3–9;
- ScholzeFunctorAndModpCohomologyOfTheLubinTateTower and ProetaleCohomologyOfPAdicCurvesAndTowers
  consume Layers 0–2;
- LocalGaloisDeformationRingsPartII consumes the weight combinatorics of Layer 3;
- none of these local results is planned anywhere else.

`Suggested.lean` states the seven headline theorems that are statable at the pins:
- coherence;
- the three `ℚ_p` criteria;
- finite length and subobjects in `𝒞`;
- the Banach approximation.

The module docstring names the headlines that are not statable and what each lacks: the
Gelfand–Kirillov bound, the Iwahori criterion, the lattice statements, the counit and the
exclusion of supersingular constituents.

## Roadmaps this one depends on that are still pull requests

- SmoothRepresentationsOfLocalGroups
- PadicLocalLanglandsForGL2Qp
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- PotentialAutomorphyInfrastructure
- CompletedCohomologyAndLocalGlobalCompatibility
- NoncommutativeAndEquivariantIwasawa
- CompletedCohomologyPartII
- DeformationAndDerivedPatchingAlgebra
- GL2AutomorphicRepresentationsAndTransfer

All are earlier in the merge order: positions 26–254, against 266 for this roadmap. No cited id is
defined only by an open revision. The suppliers on main are SchemeAndStackFoundations §0.17,
RepresentationTheory/QuiverRepresentations Layer 3 and ClassFieldTheory Layer 7 (now through the
pinned Tau Ceti declarations, below).

## What moved from the Lean to the README

Nothing. The FIX~7 `Suggested.lean` already met the rule:
- seven headline theorems and the five simple definitions they need;
- no padding, no sorry'd data, no `set_option`.

I made no statement change. The changes were:
- the module header, as above;
- each definition placed under its layer heading: `GL2ModScalar` before Layer 0, `IsSmoothRep`,
  `IsTorsionAdmissible` and `IsFinitelyPresented` under Layer 0, and `smoothDualSpan` under Layer 1.
  The `section`s re-declare exactly the binders each definition's type mentions;
- one sentence in the `IsSmoothRep` docstring naming SmoothRepresentationsOfLocalGroups
  *is-smooth*.

No headline statable at the pins is missing. I considered the §2.4 membership of characters,
Steinberg twists and principal series in `𝒞`, and §1.4. Both are intermediate targets, not
headlines.

**Signature check.** I appended `#check @name` for all 12 declarations to the module and built it
once with the allowed `lake build` command, then removed the lines. The elaborated types are in
scratch, and I compared each with its README statement. Every hypothesis is present:
- finite `k`, `CharP`, smoothness, finite generation, the uniform `N`;
- `hϖ`, `hF`, `hB`, openness, boundedness, joint continuity, `hS`, `hadm`, `hfp`.

No section binder is lost and nothing changed.

## Supplier replacements and duplication removals

1. **Local Artin map.** The geometric normalisation was cited from ClassFieldTheory Layer 7. It is
   at the pinned Tau Ceti, so the README now cites:
   - `TauCeti.ClassFieldTheory.geometricArtinMap` (`…/ClassFieldTheory/Local/GeometricArtinMap.lean:68`);
   - `isArithFrobeniusLift_inv_of_mk_eq_geometricArtinMap_uniformizer` (`:112`);
   - `mem_inertiaSubgroup_of_mk_eq_geometricArtinMap` (`:103`);
   - `geometricArtinMap_norm` (`:145`);
   - `map_artinMap_unitFiltration_zero` (`…/Local/Unramified.lean:475`, units onto inertia);
   - `localCyclotomicCharacter_artinMap_unit` (`…/ExplicitCyclotomicSymbol/ArtinMap.lean:311`).

   Places changed: the Scope bullet, the Conventions, §3.4 *Needs:* and the Layer 3 Dependencies.
   The section "From TauCetiRoadmap.ClassFieldTheory" became a Tau Ceti contract bullet that
   names ClassFieldTheory Layer 7 as the owner of the interface. The roadmap restated nothing here,
   so nothing was deleted.
2. **Smooth representations at the pin.** `TauCeti.IsSmoothDiscrete`, `TauCeti.DiscreteRep` and
   `TauCeti.isSmoothDiscrete_iff_continuousSMul` (`…/ContCohomology/SmoothDiscrete/Basic.lean:259`,
   `:669`, `:368`) are now in the Tau Ceti contract and the Scope list.
   - They carry topologies on the module and on the coefficients, so they are not the
     untopologised `IsSmoothRep`.
   - `IsSmoothRep` is kept as the local copy of SmoothRepresentationsOfLocalGroups *is-smooth*
     (`Representation.IsSmooth`, an open pull request).
   - The contract says how the two correspond. Over `𝒪`, continuity of the scalar action on a
     discrete module is torsion, so a `DiscreteRep` over `𝒪` is a smooth torsion representation.
3. **Precise library claim.** "The library supplies no functoriality in `π`" became: functoriality
   exists only for `ContRepresentation.coind₁` (`ContRepresentation.coind₁Map`,
   `Mathlib/RepresentationTheory/Continuous/Basic.lean:593`), not for `coind` along `φ`.

**Duplication sweep.** I searched main and the open heads with `roadmaps grep` and read the hits.

| Object searched | Hits | Result |
| --- | --- | --- |
| Gelfand–Kirillov | CompletedCohomologyAndLocalGlobalCompatibility: Pan's `ℚ_p` argument. QuantitativeOrbitMethod…: real Lie groups. Others are consumers. | No second owner |
| augmented Iwasawa | none | — |
| Shotton | LocalGaloisDeformationRings: deformation rings at `ℓ ≠ p` | Different object |
| coherence | PadicLocalLanglandsForGL2Qp §2.5: Banach `H`-coherence | Different object |
| `Ord_B` | CompletedCohomologyAndLocalGlobalCompatibility §0.1, for `GL₂(ℚ_p)` | Cited already, with the comparison |
| Diamond module, BHHMS | consumers only | — |
| extension graph | LocalGaloisDeformationRings §6.33: GL₃ weights. OperatorTheory on main: unrelated. | No overlap |
| Buzzard–Diamond–Jarvis | none in FiniteFlatGroups, PadicLocalLanglands, GL2Automorphic…, LocalGaloisDeformationRings, SerreWeightAndLevelOptimisation (classical `k(ρ̄)` over ℚ) or AlgebraicModularFormsAndSerreWeights (Parts I–II) | Layer 3 is owned here |
| locally admissible | consumers and the `GL₂(ℚ_p)` sections already cited | — |

Brauer theory:
- RepresentationTheory on main excludes Brauer characters in its Scope.
- ModularInduction on main does reduction only for `ℤ`-lattices ("not lattices over a general
  discrete valuation ring").
- So §5.4's 𝒪-lattice identity and its GL2AutomorphicRepresentationsAndTransfer §R17.5.11 contract
  stand.

Other checks:
- **Names.** No `Suggested.lean` name is the fully qualified name of a declaration in another
  roadmap.
- **Removals.** No duplication had to be removed.
- **Ownership against open pull requests.** I checked it for every open pull request, through the
  `roadmaps grep`/`show` index, not only the 218 checkouts listed.
- **Pins.** I checked every one of the 60 backticked library names in the README with `grep` at the
  pinned Mathlib (`1b1ccf4`) and Tau Ceti (`2fd255d`). `roadmaps resolve` could not check them
  ("no pinned Lake packages on this host"). The names not at the pins are this roadmap's own
  (`IsSmoothRep`, `smoothDualSpan`) or at earlier heads:
  - FiniteFlatGroups R07.5.15: `SerreWeight`, `compactInduction`, `heckeOperatorT`,
    `endEquivPolynomial`, `compactInduction_free`;
  - PotentialAutomorphyInfrastructure §3.7: `LocalOrdinaryParts`.
- **Citations.** Every cross-roadmap section I cite exists at its head with the claimed content. I
  read the text: SR SR.0.1–SR.0.4, SR.0d.1 and SR.2.1 targets; PLL §§0.1, 0.3, 2.1–2.3, 2.6, 2.7,
  2.9(i), 5.1 and 5.3; FFG R07.5.15; PAI §§3.7 and 3.12; CCLGC §0.1; NEI §§0.3, 0.5, 0.7, 0.8,
  0.10, 0.11, 0.13 and F.1; CCPII §§5.8 and F.1; DDPA §3.4; GL2ART §R17.5.11; SSF §0.17.
  `roadmaps resolve` reports nothing unresolved.

## Other README edits (upstream-reviewer read)

- **Downstream consumers.** The section was generic and named "LocalGaloisDeformationRings, Part
  II" without saying what it uses. It now names the four roadmaps that cite this one (two open pull
  requests, two board packages) and the sections each uses. The table of former MP identifiers is
  kept: HilbertModularVarietiesAndShimuraCurvesPartII and
  ScholzeFunctorAndModpCohomologyOfTheLubinTateTower cite 31 distinct MP ids, all rows of the table.
- **§0.5.** "`K^α`" and "`SL₂(𝒪_F)^α`" did not fix the direction of conjugation. They are now
  `αKα⁻¹` and `αSL₂(𝒪_F)α⁻¹`, with the amalgamated subgroup `K ∩ αKα⁻¹ = I` (upper Iwahori). This
  is computed: `α(a b; c d)α⁻¹ = (a, b/ϖ; ϖc, d)`, so the intersection is `c ∈ ϖ𝒪_F`.
- **§0.1 and §1.6.** The README's generality now equals the Lean's. `IsTorsionAdmissible` and
  `smoothDualSpan` are defined over any commutative ring `A`; the prose had said `𝒪` and `k` only.
- **Conventions.** Added a computed witness for the geometric Artin normalisation:
  - for `F = ℚ₅` and `u = 2`, `χ_cyc(geometricArtinMap 2) = 2`, so `ω_1` gives `2 ∈ 𝔽₅^×`;
  - the arithmetic normalisation would give `2⁻¹ = 3`.
- **Scope.** Dropped "(on main)", which described repository state.

## Adversarial mathematics pass

Values computed by hand, one row per statement. Rows marked "pass" needed no change.

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Conv.: geometric Artin, `ω_1` | `ℚ₅`, `u = 2` | `χ_cyc(Art_arith 2) = 2⁻¹ = 3`; geometric `2`; `ω_1 = 2` | Consistent with PLL §0.3 Kummer definition; witness added |
| Conv.: `N`-deep | `p = 17`, `N = 3` | `3 ≤ r ≤ 12`; needs `p ≥ 2N + 2 = 8` | pass |
| Conv.: `χ_τ = χ_τ^s` | `r = 0`, `r = p−1`, `r = 5` | `Σ r_i p^i ≡ 0 mod q−1` only at all-`0`/all-`(p−1)` | pass |
| `GL2ModScalar` | `ϖ = 0`; `[G′ : G₀]` | `scalar 0` not invertible, set empty, quotient `G`; `det ϖI = ϖ²`, index `2` | pass; `hϖ` in scope |
| §0.1 `IsTorsionAdmissible` | `L/𝒪`; `⊕_ℕ k`; `0` | `(L/𝒪)[p^j] ≅ 𝒪/ϖ^{je}`, length `je`; `V^H[p]` infinite; length `0` | pass; README now says "over `A`" |
| §0.1 API dual criterion | `L/𝒪`, `H = ℤ_p` | `V^∨ = 𝒪`, finite over `𝒪[[ℤ_p]]` | pass |
| §0.2 crossed product | `ℤ_p ⋊ C₂` | `sTs⁻¹ = −T + T² − …`; mod 2: `T` coefficient `1 = 1`, `T²` coefficient `1 ≠ 0` | pass |
| §0.3 `IsFinitelyPresented` | `k[ℚ_p/ℤ_p]` | smooth presentation `0 → c-Ind k`; over `k[ℚ_p]` the kernel needs generators of `ℤ_p` (uncountable) | pass |
| §0.3 `IsFinitelyPresented`, `H = {1}` | `⊕_ℕ k` | not finite length, so not finitely presented | pass |
| §0.4 exact-sequence calculus | `V₁ = V₂`; `V₃ = 0` | `V₃ = 0` is f.p.; `V₁ = V₂` is of finite type | pass |
| §0.5 `isFinitelyPresented_ker` | kernel of `T` on `c-Ind σ`; `ϖ = 0` | kernel `0` (free over `k̄[T]`); `c-Ind_K^G k` not `Z`-finite | pass |
| §0.5 local `Z`-finiteness | `Z/(Z∩K)ϖ^ℤ` | `F^× = ϖ^ℤ × 𝒪_F^×`, quotient trivial | pass |
| §0.5 amalgam | `α = diag(1,ϖ)` | `α(a b; c d)α⁻¹ = (a, b/ϖ; ϖc, d)`, so `K ∩ αKα⁻¹ = {c ∈ ϖ𝒪}` = upper Iwahori | Conjugation direction pinned in README |
| §0.6 Hom base change | `V = k[H]`; `V = ⊕_ℕ k` | `W ⊗ L′` on both sides; `(∏k) ⊗ L′ → ∏L′` not onto | pass |
| §0.6 residue field of irreducibles | `𝔽₂₅` example of §1.2 | `End = 𝔽₂₅`; over `k̄` gives `χ ⊕ χ⁵`, distinct | pass |
| §0.7 five-term criterion | `A = B = 0`; `D = E = 0` | gives §0.5 and §0.4 | pass |
| §0.8 `Δ(W,V)` | `q = id`; augmentation | `Δ = 0` vs `V^{I₁} ≠ 0` (non-admissible); `Δ = k` | pass |
| §1.1 proper quotients | `σ = 1`, `P = T − 1` | length `2`, `St` sub, trivial quotient | pass |
| §1.2 filtration, split form | `ℚ_{25}`, `k = 𝔽₅`, `V = 𝔽₂₅` | `X² − 2` has no root (squares `0,1,4`); `t⁵ = 4t = −t`; `Hom(χ, χ⁵) = 0` since `2t ≠ 0` | pass |
| §1.3 `isFinitelyPresented_of_finite` | `V = 0`; supersingular for `F ≠ ℚ_p` | `W = 0` presentation; fails off `ℚ_p` (PLL §2.9(i)) | pass |
| §1.4 central character | `p = 3`; `p = 5`, `δ(u) = ū` | `{±1}`; `δ(z²)` at `z = 2` is `4 ≠ 1`; `δ² ≠ 1` iff `p − 1 > 2` | pass |
| §1.4 `Ext¹(1,1)` | `GL₂(ℚ_p)` | `Hom(ℚ_p^×, k)`, dimension `2` (`p` odd) | pass |
| §1.5 `isFiniteLength_of_bounded_semisimple_quotients` | `I(σ)`; `I(1)/(T−1)`; `π ⊕ π` | CRT gives semisimple quotients of every length; `N = 1`, length `2`; `N = 2` | pass |
| §1.6 `isFiniteLength_iff_finite_smoothDualSpan` | `1`; `St`; `I(σ)`; `⊕ St`; `V = 0` | `1`, `0`, `∞`, `0` with infinite length (not of finite type); `0` and `0` | pass; README says over any `A` |
| §2.1 `Ord_B` conventions | `χ∘det`; `Ind_B(χ₁⊗χ₂)` | Hecke scalar `q^m χ(det t) = 0`; `w diag(a,d) w⁻¹ = diag(d,a)`, so `χ₂ ⊗ χ₁` | pass |
| §2.2 Hecke operator on `H¹(N₀, χ∘det)` | `ℚ_p`; `ℚ_{p²}`; `ℚ_p(√p)`; `ℚ₅(√5)` with `t = diag(2ϖ,1)` | `tN₀t⁻¹ = N(c𝒪)`, transfer `×q`, so multiplier `q/c`: `1`; `p ≡ 0`; `ϖ`, square zero; `ϖ/2 ≡ 3ϖ`, `ℓ ↦ 3` | pass |
| §2.2 `H^i(N₀, St⊗χ) = 0` | l.e.s. at `i = 1` | `H¹(χ) ≅ H¹(Ind)` forces `H¹(Ind) → H¹(St)` zero and `H¹(St) ↪ ker(H²(χ) ≅ H²(Ind)) = 0` | pass |
| §2.3 obstruction criterion | trivial character | `Δ = k`; kernel generated by `[1,1] − [α,1]` | pass |
| §2.4 `isFiniteLength_of_admissible_of_finitelyPresented` | `k²` trivial; `St`; `c-Ind σ`; `V = 0` | lengths `2`, `1`; not admissible; `0` | pass |
| §2.4 `isFinitelyPresented_subrepresentation_of_admissible` | `χ∘det ⊂ Ind_B(χ⊗χ)` | sub is f.p. (§2.3) | pass |
| §2.4 principal-series admissibility | `n = 1`; `ℚ_{p²}`, `n = 2` | `|ℙ¹(𝒪/ϖ^n)| = (q+1)q^{n−1}`: `q + 1`; `(p²+1)p²`; `T\G/K_n` infinite | pass |
| §2.4 trivial weight vs Steinberg | `Ind_B(1⊗1)^{K₁}` | `k[ℙ¹(k_F)]`, constant has augmentation `q + 1 = 1 ≠ 0`, so `k ⊕ St_q` | pass |
| §2.4 Le's representation | `ℚ_{p³}`, `p > 2` | `λ₀ = 1 ≠ 2 = λ_i`; `dim π^{K₁} = ∞` | pass |
| §2.5 exactness and counit | `Ind_{B̄}(χ₁⊗χ₂)`; `χ∘det`; `St⊗χ` | `Ord_B` values `χ₁⊗χ₂`, `0`, `χ⊗χ`; counit errors `0`, `V`, `χ∘det` | pass |
| §2.6 `exists_coind_approximation_of_lattice` | `(e,f) = (1,1), (1,2), (2,1)`; `E = 0`; `σ = 𝒪` | `hF` excludes only `ℚ_p`; `E = 0` gives `M = 0`; `f = Σ ϖ_L^n 1_{ϖ^n𝒪}`, `f(0) = (1 − ϖ_L)⁻¹`, not locally constant | pass |
| §2.6 negative control (`F = ℚ_p`) | supersingular reduction | finite-codimension image in an irreducible `π` is all of `π`, a contradiction | pass |
| §3.1 depth | `p = 17` | `3 < 4 < 14`; `r = 2` fails `3 < 3` | pass |
| §3.2 `t_λ` | `λ = (5,0)`, `ω = ±1`; `f = 2`, `ω = (1,0)` | `(0,−11) = Sym¹¹⊗det⁵`; `(−1,−10) = Sym⁹⊗det⁶`; `((6,0),(−1,−10))` vs wrong-parity `((−1,−10),(6,0))` | pass |
| §3.2 API translation | `λ′ = λ + (m,−m)` | first branch `(a+m+n+δ, b−m−n)` = `t_λ(ω+2m)`; second branch likewise | pass |
| §3.3 `Ext¹` adjacency | `p = 17`, `r = 5`; `p = 3`, `μ = 0`; `(2,1)` | principal series `Sym⁵ \| Sym¹¹⊗det⁵` (dims `6 + 12 = 18`), nonsplit since `End = k` by Mackey; `GL₂(𝔽₃)^ab = C₂`, so `Ext¹(1,1) = 0`; `Hom(S₃, 𝔽₂) = 1` | pass |
| §3.4 `W(ρ̄)` | `ω^6 ⊕ 1`, `p = 17`; level 2 at `ℚ₅` | `{Sym⁵, Sym⁹⊗det⁶}`; `ω₂^6` has order `24/6 = 4` | pass |
| §3.5 `D₀`, `D₁` | `p = 17`, `s = −1` | `32 = 6+10+12+4`; values `3⁵ = 5`, `1`, `3¹⁵ = 6`, `3⁴ = 13` in `𝔽₁₇` | pass |
| §4.1 GK dimension | `ℤ_p^d`; `V = 0`; `G = {1}` | `p^{rd} = [U:U_r]^{d/d}`; `−∞`; `0 − 0 = 0` | pass |
| §4.2 comparisons | `U = ℤ_p^d`, `M = k` | `d − d = 0` = dimension of a point | pass |
| §4.3 Iwahori valuation | `u`, `l`, `[u,l]`, `diag(1+p, (1+p)⁻¹)` | `[u,l] = (1+p+p², −p; p², 1−p)`, `ω = min(1, 3/2, 3/2, 1) = 1`; `ω(u) = ω(l) = 1/2` | pass |
| §4.4 graded algebra | `f = 1, 2` | `dim gr² = 2f² + 2f`: `4`, `12`; weights `α², α⁻², 1, 1` at `f = 1` | pass |
| §4.5 `C_J(k)` | `J = ∅`, `|J| = 1`, `X_iY_j` | `k`, dim `0`; `k[X,Y]/(XY)`, dim `1`, primes `(X),(Y)`; `X_0Y_1 ≠ 0` | pass |
| §4.6 `W_{χ,n}` | `f = 1, 2` | `3, 7`; `5, 17` | pass |
| §4.7 Iwahori criterion | `C^∞(I/Z₁)` | `Hom_I(W_{1,3}, V) = 7` vs `Hom_I(1, V) = 1` | pass |
| §5.1 multiplicity one | `p = 5, f = 1`; `p = 5, f = 2` | `α² = α⁻²` collision; mod 24 the exponents `±1, ±5, ±2, ±10, ±6, ±4` are 12 distinct classes | pass (`p > 5` hypothesis) |
| §5.1 orientation | `t (1 x; 0 1) t⁻¹` | `φ(tnt⁻¹) = (χ′/χ)(t)φ(n)` gives `χ′ = χα_i` for the upper direction | pass |
| §5.2 Borel injectives | `p = 7, f = 2, j = 15` | digits `(1,2)`, length `6 ≠ 16` | pass |
| §5.3 finite hulls | `f = 1`, `r = 5`, `p = 17` | constituents `Sym¹¹⊗det⁵, Sym⁵, Sym⁹⊗det⁶`; length `2^{#a≠0}` | pass |
| §5.4 projective lifts | `σ = Sym^{p−1}`; `𝒪 = k[[t]]` | `(u−1)^{p−1}Y^{p−1} = (p−1)! X^{p−1} ≠ 0`; `p ∤ p+1`; trivial constituent twice | pass |
| §5.5 adjoint tensor | `f = 1` | `3(r+1) = (r−1) + (r+1) + (r+3)`; `[P_σ:σ] = 2` | pass |
| §5.6 first-order hulls | `K₁/Z₁` | uniform of dimension `4f − f = 3f` | pass |
| §6.1 boxes | `ε = (+1,−1)`; all `−1`, `B = 1` | `d = (0,1)`; principal series of length `2^f` | pass |
| §6.2 `K₁`-depth | `f = 1`, `B = 3` | `⌊a/2⌋ = 0,0,1,1` | pass |
| §6.3 induced extensions | `f = 1` | lengths `2` and `4 = 2^{f+1}` | pass |
| §6.4 Diamond boxes | `ε = 0`, one sign, two signs | lengths `1, 2, 4` | pass |
| §6.5 adjoint factor | count | `3 · 2^{|J_ε|}`; 4-deep `3 < r < p − 5` | pass |
| §6.6 maximal enlargement | `f = 1` | `2 + 2 = 4` | pass |
| §6.7 tame socle | `f = 1` | two disjoint boxes of length `4` | pass |
| §7.1 connectedness | `{1, α²}`, `{1, α, α²}` at `p = 17` | the first has no middle character `α`; the second does | pass |
| §7.2 vanishing | `p = 7`; `p = 5` | `r = 3` only; empty | pass |
| §7.4 `w`-conjugation | `w = (0 1; p 0)` | `w g w⁻¹ = (d c; pb a)` | pass |
| §7.5 multiplicity one | bound | `2 < r < p − 3` needs `p ≥ 7` | pass |
| §7.6 local GK bound | `f = 1` | `dim ≤ 1`; supersingular `Π(r,0,1)` has K-socle `{Sym^r, Sym^{p−1−r}⊗det^r}` | pass |
| §8.1 Bockstein | adjoint lattice | `β(e⊗f) = h`, `β(h⊗e) = 2e` | pass |
| §8.2 preimage lattice | `W = 0` | `pV°/p²V° ≅ V°/p`, length `1·rk` vs `2·rk` | pass |
| §8.3 contraction | `e⊗v`; trace; `p = 11, r = 3` | `−2r`; `−2r(r+3) + 4(r+1) + 2(r+2)(r−1) = 0`; `5, 4, 10` | pass |
| §8.4–8.6 lattice | ranks and dimensions | `(1 + 3f) dim P_σ` on each side | pass |
| §9.1 endomorphisms | `f = 1` | `[R/pR:σ] = 2 + (2+0+0) = 4 = 2^f(f+1)`; `p ≥ 8` gives `p ≥ 11` | pass |
| §9.2 cyclic Hom | `p = 13, 14, 17` | `5 < r < 6` empty; `r = 6`; `r ∈ {6,…,9}` | pass (FIX~7 value) |
| §9.3 relative projectivity | `Q = σ` | `Hom(σ,σ) = k = Hom(T_σ, σ)` | pass |

Context: each of the seven theorems carries all its hypotheses in its own signature. The two
`section`s declare only the binders their definitions' types mention, as the elaborated types
confirm. No statement is vacuous; each is about `GL2ModScalar`, `GL (Fin 2) F` and the roadmap's
predicates.

## Unresolved

1. **Which text is accepted.** The worker should confirm that FIX~7 (`d6f2f83`), not the board's
   8 November copy, is the accepted package.
2. **A request from a design-stage consumer.** The board package LocalGaloisDeformationRingsPartII
   declares `gap:deligne-lusztig-reduction` against this roadmap. It asks for the Jordan–Hölder
   constituents of the reduction of Deligne–Lusztig representations of `GL₂(𝔽_q)` as the weights
   `F(t_{μ−η}(…))`. I did not add it: it is new scope requested by a later package, not part of
   this package. It is for that package's author, or a follow-up here.
3. **Declared supplier gaps.** These remain contracts on earlier roadmaps; I confirmed the heads
   do not state them:
   - three on FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15:
     `barthel-livne-finite-codimension`, `barthel-livne-ordinary-classification`,
     `ordinary-irreducible-hecke-presentation`;
   - one on PadicLocalLanglandsForGL2Qp §2.7: `ext1-finite-length-into-compact-induction`.

   R07.5.15 also writes its exceptional set in the `GL₂(ℚ_p)` labels `(r, λ)` "for every F". That
   is a defect of that roadmap, recorded in FIX~7.
4. **Module header.** The header follows main's module form (`module`, `public import Mathlib`,
   `public section`) rather than the brief's literal `import Mathlib`. That is what makes `sorry`
   the only warning, and the gate passes it.
5. **Suspicious passages.** None found in fetched or read text.


Pull request: #2282 (roadmap/modp-representations-of-gl2-over-local-fields at 08debbe)

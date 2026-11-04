# GATE-RepresentationTheory~3: answers to human review of the Spin representations roadmap

The pull request changes only `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md` and
`TauCetiRoadmap/RepresentationTheory/SpinRepresentations/Suggested.lean`, so the review repairs are in
those two files (commit `74de6a82` on top of `eb728c1`). The family folder
`TauCetiRoadmap/RepresentationTheory/` had no top-level `Suggested.lean`, so the briefed build target
did not exist. Commit `e7b55654` adds one for the index page: `import Mathlib`, a module docstring and
an empty `namespace TauCetiRoadmap.RepresentationTheory`. It is the same file that the SchurWeyl
revision of this family added (`bd22cebe`). Its docstring says that the index owns no headline theorem
of its own, and names the `Suggested.lean` of each member roadmap where its headlines are stated. It
declares nothing, so no README name and no `#check @name` comparison is affected.

roed-math's review was written against `c20a4c7`. kim-em's comment says that `eb728c1` answers it.
Each roed-math point is therefore judged against `eb728c1` plus this commit. kim-em's claims are
checked as H08–H12.

## H01 (roed-math) — applied

The native-producer inventory records `TauCeti.serreDiagramAut` and the `TauCeti.D4Tripled` triality
API together with their limits. The same pattern held elsewhere: the inventory and Layer 8 still
re-planned other native type-D producers. Two inventory rows are now new, "Split type-D Lie algebra"
and "Native type-D spin carrier". The triality row also gains `D4Tripled.isCompletelyReducible_standardComodule`,
the simple-root pinning, and the connected, smooth generated subgroup together with the
unipotent-radical obstruction. The new rows name `TypeDStd.lieBasis`, `typeDDiagonalCartan`,
`rootSpace_typeDDiagonalCartan_ne_bot_iff`, `typeDRootWeight`, `lieSpan_rootGenerator_eq_top`,
`isSimple_typeD`, `isKilling_typeD`, `serreLift_lieBasis_surjective` and
`TauCeti.TypeDSpinCarrier.groupScheme`. All of them were checked at the pinned Tau Ceti, for example
`Algebra/Lie/Orthogonal/TypeD/Killing.lean:286,329` and `Algebra/Lie/Orthogonal/TypeD/SpinCarrier/Basic.lean:295`.

## H02 (roed-math) — applied

Layer 8A instantiates `serreDiagramAut ℂ (CartanMatrix.D 4) hσ`, with `hσ` taken from
`cartanMatrix_D4_trialityPermD4` (`LinearAlgebra/RootSystem/DiagramPermutations.lean:292`), and it
consumes the H/E/F, iterate and `serreLift_comp_serreDiagramAut` equations.

The 8A "proof cut" had still planned work that the pin already proves:

- the diagonal Cartan,
- the 24 root lines,
- generation,
- the Killing form,
- simplicity.

It now consumes those declarations. The only remaining Lie target is injectivity of
`TypeDStd.serreRepresentation 4`, by Serre's theorem from LieHighestWeight Layer 7 and a count of
28 dimensions, together with its bundling as `c_mat`/`c_quad`.

## H03 (roed-math) — applied differently

The comparison stays owned in Layer 8B. It consumes only the generic §9B items: Chevalley–Demazure,
base change and the pinned-isomorphism theorem. §9B is "Pinned groups and their explicit carriers" in
ReductiveGroups on main, README line 1610. ReductiveGroups owns no Clifford or three-block adapter,
so there is no cycle.

The repair differs from the suggestion on the Clifford side. 8B item 2 used to build a new closed
subgroup of the even Clifford units. It now identifies native `spinGroup Q₈`, through the Fock
representation Φ in the basis `b_I`, with the complex points of the native
`TauCeti.TypeDSpinCarrier.groupScheme` at half-rank 4. That carrier is the toral closure of the Fock
representation of `splitEvenPolarization ℚ 4`. Φ sends `x_±i(u)` and `T_Cl(s)` to the native
`rootSubgroupPoints` and `weightTorusPoints` with the same parameters. So §9B compares two native
carriers, and Ψ is the composite with Φ⁻¹.

Item 1 likewise consumes the native generated-subgroup connectedness and smoothness, complete
reducibility and the unipotent-radical results. What remains is the equality of the coordinate
ideals, the full root datum and the big cell.

## H04 (roed-math) — applied

The `eb728c1` text, Layer 8C, already identifies the three blocks: indices 0–7 with V, 8–15 with S⁻
and 16–23 with S⁺, through `J₁`, `J₃`, `J₄`. All 24 table entries were recomputed by applying the
native lowering words `d4TripledSummandWord` (`TripledWeight.lean:176`) with the Clifford chain and
fork formulas of 8A:

- **Signs.** For example, coordinate 5 is `[A₄A₃, C₄] = −A₃` and coordinate 23 is `A₄A₃ b₃₄ = 1`.
- **Weights.** For example, coordinate 10 has weight `ω₁−ω₂+ω₄ = ½(1,−1,1,1)`, which is the weight
  of `b₁₃₄`.

Every entry agrees with the table, so the table is unchanged.

## H05 (roed-math) — applied

The sorry'd data `noncomputable def trialityAut … := sorry` and the two theorems about it are
replaced by one headline, `exists_trialityAut`, in `Suggested.lean`. It asserts that there is an
automorphism t of `spinGroup Q` with:

- `t(t(t x)) = x`;
- t not inner;
- the three explicit pullback intertwiners `V∘t ≅ S⁺`, `S⁺∘t ≅ S⁻` and `S⁻∘t ≅ V` on the native
  `spinPlusSubrep`/`spinMinusSubrep`;
- a group isomorphism `Ψ : D4Tripled.points ℂ ≃* spinGroup Q` with `t (Ψ g) = Ψ (trialityPoints ℂ g)`.

The orientation was checked against the pin. `trialityMatrix` has `(i,j)` entry 1 exactly when
`i = π j`, and `d4TripledTrialityPerm 0 = 8`. So `P₂₄` sends B₁→B₃→B₄→B₁. The torus relabels by σ⁻¹,
and the pulled-back weights run `ω₁→ω₄→ω₃→ω₁`. Under these conventions `ρᵥ∘t` has highest weight ω₄,
which is S⁺, so the cycle as stated is correct. README 8D and the worked example now cite
`exists_trialityAut` instead of `trialityAut`.

## H06 (roed-math) — applied

The README and the Lean file both said that `L(ρ)` "is not imported, so it is prose here". That is
false at the pin: `TauCeti.irreducibleQuotient b lam` (`Algebra/Lie/HighestWeight/Verma.lean:525`)
and `TauCeti.weylVector` (`LinearAlgebra/RootSystem/Weyl/Vector.lean:209`) both exist. The changes:

- `kostant_isotypic` now concludes `Nonempty (S ≃ₗ⁅ℂ,L⁆ irreducibleQuotient b (weylVector (IsKilling.rootSystem H) b))`
  for every simple submodule S. Before, it only said that any two simple submodules are isomorphic.
- `kostant_multiplicity` now decomposes `Cliff(𝔤, κ)` as `⨁_{Fin 2^((d+l)/2)}` of that carrier and
  gives its dimension `2^((d−l)/2)`.
- The README target `A≅End(V_ρ)` names `V_ρ` as this carrier.

## H07 (roed-math) — applied

`kostantSpinRep_multiplicity` now states an explicit isotypic direct-sum conclusion. It gives a
linear equivalence `e : ⋀P.W ≃ₗ[ℂ] ⨁_{Fin 2^(l/2)} irreducibleQuotient b ρ` with
`e (kostantSpinRep L P x w) = ⁅x, e w⁆`. Before, it asked only for a minimal invariant subspace and a
ratio of dimensions. The README spin-module bullet states the same thing and checks the dimensions:
`2^⌊l/2⌋ · 2^((d−l)/2) = 2^⌊d/2⌋` because `d ≡ l (mod 2)`.

## H08 (kim-em) — answered

Checked. At `eb728c1` the inventory and 8A do consume `serreDiagramAut` and the D4Tripled triality
API. The inventory still omitted the native type-D Lie algebra results and `TypeDSpinCarrier`, which
8A and 8B re-planned. That gap is now closed, as described in H01 and H02.

## H09 (kim-em) — answered

ReductiveGroups §9B exists on main and supplies what 8B consumes: the pinned Chevalley–Demazure
construction, base change and the isomorphism theorem for pinned groups. The depcheck is clean.
The "independently constructed" Clifford pinning duplicated the native `TypeDSpinCarrier` and has
been rerouted through it, as described in H03.

## H10 (kim-em) — answered

The claim that the three blocks, the 24 signed images, the direct-versus-pullback cycle and the
inverse torus relabelling are all correct is confirmed by the computations in H04 and H05. The native
`trialityPoints_weightTorusPoints` uses `s (trialityPermD4.symm k)`, which is the formula in 8C.

## H11 (kim-em) — answered

The order is consistent. The algebraic t is transported from the tripled carrier (8B and 8C), and
the integrated lift is compared with it by uniqueness of integration on the connected, simply
connected Spin₈(ℂ) (8D). The headline is now a theorem rather than sorry'd data, so it is the
Ψ-conjugacy in `exists_trialityAut` that pins t to the native triality.

## H12 (kim-em) — answered

The two Kostant suggestions were left open at `eb728c1`. Both concern headlines that are statable at
the pin, so leaving them open was a defect under the acceptance-test rule. Both are now applied, as
described in H06 and H07.

## Other repairs needed for the gate

- **Unused sorry'd definition.** `normalizedRealCliffordCover` was a `def` with `sorry` fields. No
  statement and no README text used it, so it is deleted.
- **Pinned blob links.** Eleven links to commits of `TauCetiRoadmap/blob/…` are replaced:
  - SpinGeometry and DGFloer links now point to relative section links on main (G1, G4, and DGFloer
    Layer 1).
  - NoncompactQuantumSymmetry is not on main; it is now cited as plain text "NoncompactQuantumSymmetry §M0".
- **Overlap with another open revision.** The open revision #1671 of the same roadmap still carries
  `trialityAut`, so the rename to `exists_trialityAut` will conflict with it at merge.

## Mechanical signature check

The four changed declarations were elaborated with `#check @name` in a scratch file:
`exists_trialityAut`, `kostant_isotypic`, `kostant_multiplicity` and `kostantSpinRep_multiplicity`.

- Each elaborated type carries all of its binders: Q, the nondegeneracy hypothesis, `finrank = 8`,
  `P`, `hline`, and H with `[H.IsCartanSubalgebra]` and b.
- `IsTriangularizable` is found by instance over ℂ.
- The Lie structure on `Cliff` is the scoped left-regular `kostantLieModule`.
- Each type matches its README statement. No binder was lost.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8A Killing Check `κ=6 tr` | `H₁=diag(1,0,0,0,−1,0,0,0)` in so(8) | `Σ_α α(H₁)² = 12` (12 roots `±e₁±e_j`), `tr H₁² = 2`, ratio 6 = 2n−2 | true | added as a Check |
| `x_i(u)=1+uE_i` in Spin | reversal of `C_iA_(i+1)`, `C₃C₄`, `A₄A₃` | each reverses to its negative; `(1+uE)(1−uE)=1`; `E²=0` | true | stated in 8B item 2 |
| conjugation equals `exp(u ad E)` | `v∈V` | `(1+uE)v(1−uE)=v+u[E,v]−u²EvE`; `[E,[E,v]]=−2EvE` | true | stated |
| block table B₁ | coordinates 1–7 | `b₂,b₃,b₄,b′₄,−b′₃,b′₂,−b′₁` (for example `[C₂A₁,A₂]=−A₁`) | matches | none |
| block table B₃ (S⁻) | coordinates 9–15 | `b₁₂₄,b₁₃₄,b₂₃₄,b₁,b₂,b₃,b₄`, weights `½(1,1,−1,1)` … `½(−1,−1,−1,1)` | matches | none |
| block table B₄ (S⁺) | coordinates 17–23 | `b₁₂,b₁₃,b₂₃,b₁₄,b₂₄,b₃₄,1` | matches | none |
| `exists_trialityAut` orientation | σ = `swap 0 3 * swap 0 2` | 0→2→3→0; `P e_j = e_{π j}`; `π 0 = 8`; `ρᵥ∘t` weight `ω₁∘σ = e_{σ⁻¹0} = ω₄` (S⁺) | true | none |
| `exists_trialityAut` Ψ conjunct | Ψ composed with the graph automorphism | turns t into a conjugate of t⁻¹, which is still conjugate to triality in Out=S₃; orientation is fixed by the representation conjuncts | consistent, not contradictory | docstring says so |
| `kostant_isotypic`/`_multiplicity` | L=0; sl₂ (d=3, l=1) | L=0: Cliff=ℂ, L(0)=ℂ, 1 copy of dimension 1. sl₂: `dim L(ρ)=2=2^1`, 4 copies, `2·4=8=2³` | true | none |
| `kostantSpinRep_multiplicity` | d even/odd; L=0; sl₂ | `dim ⋀W = 2^⌊d/2⌋`; sl₂: `2^0` copy of L(ρ), dimension `2 = 2^1` ✓; L=0: Fin 1 copy of ℂ | true | README dimension Check added |
| L(ρ) independent of (H,b) | two Cartan/base pairs | conjugacy carries ρ_b to ρ_{b′}; the irreducibles are isomorphic as 𝔤-modules | statement holds for every (H,b) | none |

## Ownership and citations

The Spin₈↔tripled comparison is owned here. Ownership was searched with `roadmaps grep` for
`D4Tripled|TypeDSpinCarrier|trialityAut` across main and the open heads:

- ChevalleyGroups and CFSGStatement only list `TypeDSpinCarrier` as a carrier.
- ReductiveGroups on main owns the generic §9B, which is consumed and not restated.
- No other roadmap states the Clifford comparison.

The new names were checked at the pinned Tau Ceti (the `content` lake manifest, Tau Ceti `358314d`).
The README's existing permalink to `Serre.Automorphism` at `a91d3aa` resolves to the same file and
declarations. No sources were fetched and no texts are missing.

## Build and gate

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).`
- `lake build TauCetiRoadmap.RepresentationTheory.SpinRepresentations.Suggested`: `Build completed
  successfully (9642 jobs).` The only warnings are `declaration uses 'sorry'` and one unused-variable
  lint at the `hsymm` binder of `adjointSO` (line 554). That lint is already present at `eb728c1`,
  and this revision leaves it unchanged.
- Gate, as briefed (`RepresentationTheory --base origin/main`): `gate RepresentationTheory: set_option=0
  blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0
  mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Depcheck (`--movable`) of the index README and of the SpinRepresentations README: each prints
  `depcheck: 163 roadmaps, 1163 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Ownership against open pull requests was checked with `roadmaps grep` (see Ownership and
  citations). No sources were fetched, and no `needs-references.toml` was written.

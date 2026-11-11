<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13144#issuecomment-6791245168 -->
Red team round 1 pass b (claude) of 46a0dff

Verdict: needs_changes

1. **F01** (P2) Étale coordinates are proved at the pinned Tau Ceti; the README imports them from a roadmap instead

   **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:31` (dependency diagram),
   `:77-78` (ownership), `:209-211` (supplier contract), `:541-542` (§2.4 step 1), `:557` (§2.4
   *Needs:*), `:606` (Layer 2 Dependencies). Quote, `:209-211`: "§0.8 `etale_coordinates`: a morphism
   `X → S` smooth at `x` admits … Assumed in the form of Stacks, Lemma 29.37.21 (054L): with `S`
   affine the neighbourhood can be taken affine."

   **Claim.** Étale coordinates at a smooth point are a dependency on SchemeAndStackFoundations §0.8
   `etale_coordinates`, in a strengthened form (affine neighbourhood) that the roadmap "assumes".

   **Witness.** Pinned Tau Ceti, `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:98`,
   `AlgebraicGeometry.Smooth.exists_etale_affineSpace [Smooth f] (x : X) : ∃ V : X.Opens,
   IsAffineOpen V ∧ x ∈ V ∧ ∃ n g, Etale g ∧ g ≫ 𝔸(ULift (Fin n); S) ↘ S = V.ι ≫ f` (and `:86` for
   fixed relative dimension). It is fully proved, already gives the affine neighbourhood, and is the
   statement of 054L. SchemeAndStackFoundations §0.8 on main
   (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:996-998`) states only "an open neighbourhood".

   **Repair** (tested on the instance: §2.4 step 1 with `f := V.ι ≫ f`, `S = Spec k`, `x = y`; the pin
   returns an affine open `V₀ ∋ y` of `V` and an étale `k`-morphism to `𝔸(ULift (Fin m); Spec k)`,
   which is what step 1 uses):

   - `:31` replace the second diagram line by
     `SchemeAndStackFoundations §0.8 (rational_point_component, 04KV) ──→ Layer 2 §2.2`.
   - `:77-78` replace the bullet by: "*Étale coordinates at a smooth point*: Tau Ceti
     `AlgebraicGeometry.Smooth.exists_etale_affineSpace` and
     `AlgebraicGeometry.SmoothOfRelativeDimension.exists_etale_affineSpace` (module
     `TauCeti.AlgebraicGeometry.Morphisms.Smooth.EtaleCoordinates`; Stacks, Lemma 29.37.21 (054L))."
   - Under `### From Tau Ceti` add: "`AlgebraicGeometry.Smooth.exists_etale_affineSpace` (module
     `TauCeti.AlgebraicGeometry.Morphisms.Smooth.EtaleCoordinates`): for a smooth `f : X → S` every
     point of `X` has an affine open neighbourhood `V` with an étale `S`-morphism
     `V → 𝔸(ULift (Fin n); S)` for some `n`. Used in §2.4 with `S = Spec k`; the target is carried to
     `Spec k[X_0, …, X_{n-1}]` by `AffineSpace.SpecIso` and `MvPolynomial.renameEquiv` along
     `Equiv.ulift`."
   - `:209-211` delete the `etale_coordinates` bullet; the SchemeAndStackFoundations subsection keeps
     only `rational_point_component`.
   - `:541` replace "By SchemeAndStackFoundations §0.8 `etale_coordinates` (Stacks, Lemma 29.37.21
     (054L))" by "By Tau Ceti `AlgebraicGeometry.Smooth.exists_etale_affineSpace` (Stacks, Lemma
     29.37.21 (054L))".
   - `:557` replace "SchemeAndStackFoundations §0.8 `etale_coordinates`" by "Tau Ceti
     `AlgebraicGeometry.Smooth.exists_etale_affineSpace`".
   - `:606` replace "(`etale_coordinates`, `rational_point_component`)" by
     "(`rational_point_component`)" and add `TauCeti.AlgebraicGeometry.Morphisms.Smooth.EtaleCoordinates`
     to the Tau Ceti list; add the file to the Tau Ceti line of the References (`:669-671`).
   - `:69-72` the sentence "The boundary polynomial (§2.1) is owned here because
     SchemeAndStackFoundations §0.8 states étale coordinates without any statement about images of
     closed subsets" becomes "… because neither Tau Ceti's étale coordinates nor
     SchemeAndStackFoundations §0.8 makes any statement about images of closed subsets".

   `rational_point_component` stays with SchemeAndStackFoundations §0.8: its step 04KV (connected with
   a rational point implies geometrically connected) is not at either pin (searched
   `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean`,
   `TauCeti/AlgebraicGeometry/Geometrically/`, `TauCeti/AlgebraicGeometry/RationalPoint/`).

2. **F02** (P3) Convention 2 names an ill-typed carrier; §2.2 uses the affine-space instance on a different carrier with no bridge

   **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:124-125`: "Mathlib's
   `AffineSpace.SpecIso` identifies these with `AffineSpace (Fin m) (Spec k)`"; and `:465-467`:
   "`s_C = (𝔸¹_k → Spec k) ∘ q` is smooth of relative dimension `0 + 1 = 1` (…,
   `AffineSpace.smoothOfRelativeDimension`)".

   **Claim.** (a) `AffineSpace (Fin m) (Spec k)` is the Mathlib model of `𝔸^m_k` for `k : Type u`.
   (b) `AffineSpace.smoothOfRelativeDimension` applies to `Spec k[T] → Spec k`.

   **Witness.** (a) Pinned `Mathlib/AlgebraicGeometry/AffineSpace.lean:43`:
   `def AffineSpace (n : Type u) (S : Scheme.{u})`; `Fin m : Type`, so the expression typechecks only
   for `u = 0` (the pin uses `ULift.{u} (Fin n)`, `:395`). (b) The instance (`:378`) is about
   `𝔸(n; S) ↘ S`; `Spec (Polynomial k) → Spec k` is not of that form, and `SpecIso` (`:223`) lands in
   `Spec (MvPolynomial n R)`, not `Spec (Polynomial k)`.

   **Repair.** `:124-125`: "Mathlib's `AffineSpace.SpecIso`, with `MvPolynomial.renameEquiv` along
   `Equiv.ulift`, identifies `Spec k[X_0, …, X_{m-1}]` with `𝔸(ULift.{u} (Fin m); Spec k)`; `Spec k[T]`
   is identified with `Spec (MvPolynomial (ULift.{u} (Fin 1)) k)` by `MvPolynomial.uniqueAlgEquiv`."
   `:467` and `:558`: replace `AffineSpace.smoothOfRelativeDimension` by
   "`AffineSpace.smoothOfRelativeDimension_fin` transported along `AffineSpace.SpecIso` and
   `MvPolynomial.uniqueAlgEquiv` (`Mathlib/Algebra/MvPolynomial/Equiv.lean`)"; add
   `MvPolynomial.uniqueAlgEquiv`, `MvPolynomial.renameEquiv` and
   `AffineSpace.smoothOfRelativeDimension_fin` to `### From Mathlib` (`:164-169`). Tested: with
   `n = 1`, `S = Spec k`, the instance gives relative dimension `1` and composition with the étale
   `q` gives `0 + 1 = 1`, as §2.2 states.

Two findings: one P2 (a supplier contract for a theorem the pinned Tau Ceti already proves, in the
exact form the README says it "assumes"), one P3 (an ill-typed carrier in Convention 2 and an
unnamed bridge in §2.2). No mathematical defect was found in any target, Check or Lean statement.

## Verified sound

Counts: 5 Lean declarations read (whole file); 9 README targets read (whole README: `polynomialGraph`,
`polynomialGraph_coeff`, surjectivity, `exists_avoiding_graph`, boundary polynomial, marked
component with its 9 API bullets, `exists_marked_etale_curve`, `exists_same_field_curve`, marked
residue fields); 11 source locators verified; 38 Checks and 3 worked examples recomputed; 4 sibling
citations checked; 41 pinned declarations opened.

**Pass table (values computed).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| `polynomialGraph` | `m=1`; `m=0`; `m=2,B=0`; zero ring | `X_0↦T^(B^0)=T` for all `B`; map is `C`; `X_1↦T^0=1`, value `1≠0` at `T=0`; unique bijection | as README |
| kernel element (§1.1) | `X_1−X_0^B`, `B=0`, `B=2` | `1−1=0`; `T²−T²=0` | in kernel, nonzero over nontrivial `k` |
| `polynomialGraph_coeff` | `h=X_0²X_1−X_0X_1²`, `B=3`, `e=(2,1),(1,2),(0,2)` | weights `5,7,6`; coefficients `1,−1,0` both sides | holds |
| same, hypothesis dropped | `h=X_1−X_0²`, `B=2`, `e=(0,1)` | LHS coeff of `T²` is `0`, RHS `1` | fails, so bound on `h` needed |
| same, query bound dropped | `h=X_1`, `B=2`, `e=(2,0)` | LHS `1`, RHS `0` | fails, so `he` needed |
| same, junk values | `B=0,m≥1`; `B=0,m=0`; `B=1` | no `e` satisfies `he`; `coeff (C a) 0 = a`; `h` constant, `e=0`, weight `0` | true as typed |
| `exists_avoiding_graph` | zero ring; `ℤ/4`, `h=2`; `𝔽_q`, `h=X_0^q−X_0`; `m=0` | no `h≠0`; `φ(h)=2≠0`, `D(2)=∅`; `B≥q+1`, `D(T^q−T)(𝔽_q)=∅`; `k→k[T]` not onto | Lean statement true; geometric clause correctly restricted to fields; `0<m` needed |
| "no single graph" (§1.3) | `m=2` | image `V(X_1−X_0^B)`, `B=0` gives line `X_1=1` | proper closed |
| boundary polynomial | identity chart; `m=0`; projection `𝔸²→𝔸¹`, `Z=V(x_1)` | `h=X_0X_1`; `h=1`; `π(Z)=𝔸¹` | holds; étale needed |
| §2.1 proof route | `π^*` injective, `k(X)⊗A` étale, algebraic, `Ideal.under_ne_bot_of_algebraic_mem` | each step matched to a pinned declaration with its hypotheses (`[EssFiniteType K A]`, `[IsDomain S]`) | sound |
| marked component | `𝔽_3`, `π=(x, z²−1−2x)` on `Spec k[x,z,z⁻¹]`, `B=2` | Jacobian `2z` unit; `π(0,1)=(0,0)`; `z²=(T+1)²`; factors differ by `2(T+1)`, unit; mark on `z=T+1`; `g(T)=(T,T+1)` | two components, mark selects one |
| `exists_marked_etale_curve` | `m=0`; `m=1`; `U=D(X_0)` on `𝔸²`, `B=2`; `U=V` | `V≅Spec k`, `C=𝔸¹`, both sides of `π∘g=a_B∘q` and `c≫g=y` reduce to `constantCoeff`; `W=V=C`, `g=id`; `g⁻¹(U)=D(T)∌0`; `g⁻¹(U)=C` | holds; `y∉U` allowed |
| `exists_same_field_curve` | `Y=Spec k`; `U=∅`; `Y=𝔸¹⊔𝔸¹`; `xw=0` at `(1,0)`; `Spec 𝔽_{q²}`; cone `x²=aw²` | constant map from `𝔸¹`; hypothesis `hU` fails since `y∈V`; applies; `V=D(x)≅𝔾_m` smooth; no section; Galois-stable irreducible image is `{0}`, `g⁻¹(U)=∅` | holds; smoothness and rationality needed |
| rational-point variants | `U=D(T^q−T)`, any `C` | every `𝔽_q`-point of `C` maps to `𝔸¹(𝔽_q)`, disjoint from `U` | "`g⁻¹(U)(k)≠∅`" correctly not claimed |
| `𝔽_2` example | `T⁵+T⁷=T⁵(1+T)²` | `D=𝔸¹∖{0,1}`; `𝔽_2`-points none, `𝔽_4`-points two | as README |

**Lean versus README.** The five elaborated types in the job's signature listing were compared
with the README statements clause by clause: all binders present (`Field k`, `IsIntegral V`,
`IsAffine V`, `Etale π`, `Smooth (V.ι ≫ f)`, section equations), no dropped section variable (the
file has no `variable` line), generality equal on both sides (commutative ring in Layer 1, field in
Layer 2, one universe). No Lean was run in this pass and the file was not changed. Single
`import Mathlib`, no `set_option`, no sorry'd data, `theorem` throughout, one real-bodied `def`.

**Headlines and padding.** Headlines per the README: `polynomialGraph_coeff`,
`exists_avoiding_graph`, `exists_marked_etale_curve`, `exists_same_field_curve`; all four stated.
One-tactic probe by reading: `polynomialGraph_coeff` needs the digit-injectivity argument on top of
`MvPolynomial.coeff_aeval_X_pow_weight`; `exists_avoiding_graph` needs the choice of `B`, the
coefficient theorem and a surjectivity proof; neither is one library lemma. The residue-field
identity is two pinned Tau Ceti theorems and is rightly not restated.

**Pinned declarations.** Every name in "Exact supplier contracts" exists at the pins with the
stated content: Mathlib `eval₂Hom_C`, `eval₂Hom_X'`, `eval₂Hom_monomial`, `comp_eval₂Hom`,
`MvPolynomial.aeval_def`, `Nat.ofDigits_inj_of_len_eq`, `Nat.ofDigits_eq_sum_mapIdx`,
`Nat.injOn_ofDigits` (needs `1 < b`, as the README's `B ≥ 2` case split respects),
`IsClosedImmersion.spec_of_surjective`, `Etale.etale_isStableUnderBaseChange`,
`Etale.iff_smoothOfRelativeDimension_zero`, the `HasRingHomProperty @Etale RingHom.Etale` instance,
`Algebra.Etale.baseChange`, `Algebra.EssFiniteType.of_finiteType`, `smoothOfRelativeDimension_comp`
(`n + m` for `f ≫ g`), `Flat.generalizingMap`, `isOpenMap_of_generalizingMap`,
`Scheme.Hom.isOpenMap`, `GeometricallyIntegral`, `Algebra.FormallyEtale.iff_exists_algEquiv_prod`,
`Ideal.under_ne_bot_of_algebraic_mem`, `IsOpen.dense`,
`IsOpenMap.denseRange_of_isPreirreducibleSpace`,
`TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, `isClosed_connectedComponent`;
Tau Ceti `MvPolynomial.coeff_aeval_X_pow_weight`, `MvPolynomial.injOn_aeval_X_pow`,
`Finsupp.exists_injOn_weight`, `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral`,
`TauCeti.AlgebraicGeometry.residueDegree_eq_one_of_section`,
`TauCeti.AlgebraicGeometry.residueFieldMap_bijective_of_section`.

**Sibling citations.** SchemeAndStackFoundations §0.8 `etale_coordinates` and
`rational_point_component`: both present on main with the cited hypotheses, and kept under the same
names and section at the head of its open revision. ArithmeticInterpolationDeterminants §0.3
`powerSubstitution` (main): `aeval` of `Z ↦ X, W ↦ X^B`, injectivity for `Z`-degree below `B`, as
the README describes. Base roadmap LefschetzPencilsAndVanishingCycles (open): its descent theorem
gives an axis over some `𝔽_{q^r}`, as "Where the base roadmap stops" says; it is not cited as a
supplier.

**Ownership.** Searched main and the open heads by object (Kronecker substitution, curve through a
rational point, the Kisin–Zhou paper, Poonen's Bertini theorems): no other roadmap states the
base-`B` substitution in `m` variables, the boundary polynomial, the marked component or either
curve theorem; no `Suggested.lean` declares any of the five names.

**Sources.** `KisinZhou2024` lines 2169 (Prop. 5.2.3, p. 49), 2174 (Remark 5.2.4, p. 49), 2322
(Cor. 5.2.7, p. 52), 2345 (its proof, p. 53), 2392 and 2413 (Prop. 5.3.5 and proof, p. 54).
`Poonen2004` lines 514 (Thm 3.3, p. 10; smooth quasi-projective, `m ≥ 1`), 519 (connectedness only
for projective, `m ≥ 2`), 536 (Cor. 3.4, p. 10; projective, geometrically integral, `m ≥ 1`).
`Stacks-Morphisms` line 3743 (37.21, 054L, affine `U`). `Stacks-Varieties` lines 528 (7.14, 04KV),
2084 (25.4, 056T), 2147 (25.10, 0CDW). `Stacks-Properties` line 433 (7.7, 033N). Each supports the
claim made of it.

**Policy.** The pull request changes only the package folder. No pull-request number or process
narrative in the README or docstrings; every target has a locator or is the roadmap's own
elementary statement with a pinned route; no algorithm.

**Dependency check.** Output: `depcheck: 237 roadmaps, 2140 edges, 0 problem(s)`. No UPWARD or
CYCLE line.

## Not verifiable

- The published (Annals 2025) numbering of Kisin–Zhou: only arXiv v2 was read; the README says its
  locators refer to v2.
- Elaboration of `Suggested.lean`: not rerun here (read-only pass, file unchanged); the comparison
  used the worker's elaborated signatures.
- Ownership against open pull requests whose files were not provided to this job was not checked;
  the search covered main and the open heads the tooling indexes.

## Source issues

- **Gap** in KisinZhou2024 at proof of Corollary 5.2.7, p. 53 (reused in the proof of Proposition 5.3.5, p. 54): the source says a curve through the rational point of a smooth scheme meeting a dense open exists by Poonen's Corollary 3.4; it should be justified otherwise, since that corollary assumes a smooth projective geometrically integral variety of dimension at least one and the scheme there is only smooth; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "46a0dff71432cf65187630ddf8797b7fceff7ea8", "job": "RT-LefschetzPencilsAndVanishingCyclesPartII~1b", "model": "fable", "worker": "chris-x8"} -->

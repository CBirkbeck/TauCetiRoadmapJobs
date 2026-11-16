<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17370#issuecomment-6903548789 -->
Review (claude) of 3e002bb

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.4's sketch calls the orbits of `T` tori and uses two undefined terms

   - **Location.** `packages/SurfaceGroupCharacterVarieties/README.md` lines 1562–1565: "For an
     abelian `T` the orbits are coordinate tori and closed orbits are separated by explicit
     invariants, monomials with nonnegative real exponents each supported on one sign component of a
     coordinate stratum".
   - **Claim.** The orbits of `T = exp(𝔱)` are tori, and the separating functions live on "sign
     components" of "coordinate strata".
   - **Witness.** `𝔱 = ℝ·diag(1, −1)` on `ℝ²` (the README's own Check, lines 1576–1588): the orbit of
     `(1, 1)` is the branch `{xy = 1, x > 0}`, a copy of `ℝ`, not a torus. Neither term is defined in
     the README or in BohmLafuente2021 (lines 362–363, 382–386 use `U_I`, `U_I^+`).
   - **Repair.** Replace the sentence by: "For an abelian `T`, in an orthonormal basis of simultaneous
     eigenvectors of `𝔱` the group `T` acts by positive diagonal matrices, so a `T`-orbit is the
     image of the vector group `𝔱` and keeps the sign of every coordinate. Closed orbits are
     separated by explicit continuous `T`-invariant functions: for a set `I` of coordinates and real
     exponents `w_i ≥ 0`, the monomial `∏_{i ∈ I} v_i^{w_i}` on the vectors whose coordinates in `I`
     are all positive, extended by zero, and its composites with the coordinate sign changes
     (BohmLafuente2021 Lemma 4.6, line 364, and lines 382–386), which gives (v) through Urysohn's
     lemma on their joint image." Tested on the witness: the orbit of `(1, 1)` is `{(e^s, e^{−s})}`,
     with both coordinates positive; `(xy)^{1/2}` on the open first quadrant, zero elsewhere, and its
     composite with `(x, y) ↦ (−x, −y)` take the values `(1, 0)` and `(0, 1)` on the two branches of
     `xy = 1`, as the Check of lines 1579–1588 needs.

2. **F02** (P3) `TauCeti.PointTopology.locallyCompactSpace_of_finiteType` is described without its `T1Space` hypothesis

   - **Location.** README lines 129–131 (Scope): "locally compact for finite type over a locally
     compact ring by `TauCeti.PointTopology.locallyCompactSpace_of_finiteType`"; lines 376–378
     (contract): "locally compact for a finite-type algebra and a locally compact value ring".
   - **Claim.** The pinned theorem gives local compactness of the points for every locally compact
     value ring.
   - **Witness.** At the pin, `Topology/Algebra/PointTopology/Basic.lean` line 261:
     `[IsTopologicalSemiring R] [T1Space R] [LocallyCompactSpace R] [Algebra.FiniteType k A] :
     LocallyCompactSpace (A →ₐ[k] R)`. The same README's ReductiveGroupsPartII contract (line 545)
     has "locally compact Hausdorff `R`".
   - **Repair.** In both places write "locally compact for a finite-type algebra and a locally compact
     T1 topological value ring (`[IsTopologicalSemiring R] [T1Space R] [LocallyCompactSpace R]`)".
     Tested on the two rings the roadmap uses it for (§4.2): `ℝ` and `ℂ` are locally compact T1
     topological rings, so the declaration applies as §4.2 uses it.

Two findings, both P3, none blocking. The four findings of round 2 are repaired. Every statement
computed below is true, `Suggested.lean` elaborates with `sorry` as its only warning, no theorem is
padding, and every supplier citation resolves at the suppliers' present heads. What remains is one
sentence of a proof sketch that the last repair rewrote and that still misdescribes the orbits it
is about, and one pinned declaration described with fewer hypotheses than it has.

## Round 2 findings, one by one

| Id | Status | Repaired passage |
|---|---|---|
| F01 (P3) | repaired | §7.3 sketch: "it is reductive (Tau Ceti `TauCeti.reductiveCommHopfAlgProperty.of_injective`, the coordinate map of `Z⁰ → φ(Z⁰)` being injective and `ℂ` of characteristic zero)"; the declaration and ReductiveGroups Layer 3 are in the contracts, in §7.3's *Needs:* and in Layer 7's Dependencies. |
| F02 (P3) | repaired | Contract: "Singular cohomology: `TopCat.singularCup_naturality` … `TopCat.singularCap_naturality` (the projection formula `f_*(x ⌢ f^*α) = f_*x ⌢ α` …); `TopCat.singularKronecker_naturality`"; cited in §3.4's sketch at the three steps, in its *Needs:* and in Layer 3's Dependencies. |
| F03 (P3) | repaired | §7.3: "for a homomorphism of real reductive data … and every group `Γ`, postcomposition with `φ` maps reductive representations to reductive representations and induces a continuous map `CharacterVariety Γ G^ℝ → CharacterVariety Γ G'^ℝ`"; the `F_∞`, `ℝ^×` Check is there; *Needs:* has §§6.1–6.3. |
| F04 (P3) | repaired | §5.4 (v): "for every abelian subspace `𝔱` of `Sym(V)`, its elements commuting pairwise, and `T = exp(𝔱)` … this is used for a maximal abelian `𝔱 ⊆ 𝔭`"; the Check on `𝔱 = ℝ·diag(1, −1)` is there. |

The adversarial pass was run again on every passage these repairs changed (§3.4's sign
computation, §5.4 (v) with its Check and sketch, the whole of §7.3, the two new contract
paragraphs). R01 is in the sketch sentence that the repair of F04 rewrote. The repaired patterns
were looked for in the rest of the package: route inputs without an owner (none left: every
backticked name of every *Needs:* line is in the contracts, and every cited section is in its
supplier's subsection), statements narrower than their source (none found), a library declaration
described more generously than the pin (R02).

## Maintainer notes

Each note was read against the package at this head and the suppliers at their present heads.

1. Refuted: Conventions "Isotopy" and the MordellLawrenceVenkatesh contract read §5.9's isotopies as paths in `Homeo⁺(S, ∂S)`, compact-open by §5.17 there, and §2.1's invariance-of-domain bullet makes these the ambient isotopies.
2. Refuted for the README: Scope and contract give §5.9's action on finite coverings, `[p] ↦ [f ∘ p]`, "precomposition with the outer automorphism `(f⁻¹)_*`", the wording of §5.9's Construction; the action on `Rep(π₁, H)` is defined in §3.5.
3. Refuted: Conventions "Notation shared with suppliers" separates `Ψ_x` from the symplectic `Ψ` and `Mod^±(X)` from `Mod±(Σ)`, with the torus witness.
4. Refuted for the README: the Scope list names owners ("the sections a target uses are listed under *Exact supplier contracts*"), and contract and *Needs:* lines agree (§§5.1, 5.4, 5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.22). It holds for `design/plan.json`, which still lists §5.20: see the last section.
5. Refuted: Layer 2's Examples cite TeichmullerGeometry §5.4a `mcg_torus_full` for `Mod_{1,0} ≅ SL₂(ℤ)`; §5.22 is cited for surjectivity only (§3.5's Check).
6. Refuted: the contract cites §5.4 for the connected-sum form and the type criterion; the polygon model is TeichmullerGeometry §0.0f's.
7. Refuted: §5.23 occurs only in the Scope's list of owners.
8. Refuted: the contract says orientability is invariant and the genus constant "by its definition"; TeichmullerGeometry §0.0f defines `Surface.genus M` as the genus of the model homeomorphic to `M`.
9. Refuted: the cell structure is §0.0f's ("one open disc, one open edge per class of sides and one vertex per vertex class", at its head); the reflection is constructed in §3.4; §4.3 is cited for the attaching word.
10. Refuted: `## Downstream consumers` does not name GroupActionsOnRiemannSurfaces; the Scope describes its §3.4 as taken from MordellLawrenceVenkatesh §5.9, as that roadmap says.
11. Refuted: §2.1 owns the ambient-isotopy group and the comparison map, takes the compact case from `TauCeti.isotopic_iff_ambientIsotopic` and names GeometricTopology Layer 1.7.2 as owner.
12. Refuted as a duplication: §3.4 cites TeichmullerGeometry §5.4 for the isomorphism and for `Out⁺(Π)` and owns only its description by the action on `H₂`, which that roadmap does not state; see the last section.
13. Refuted: §3.3 cites MordellLawrenceVenkatesh §5.19 for the action of `Push(α)` and only identifies it with `f_{const}`.

## Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, `π₁` product and `fundamentalGroupMulEquivOfPath` | `[u]*[γ]*[u]⁻¹` with `p * q = q.trans p` | `[u]*[γ] = [γ ⬝ u]`, then `[ū ⬝ γ ⬝ u]`; path equivalence `[σ̄ ⬝ γ ⬝ σ]`, its inverse `[δ ⬝ γ' ⬝ δ̄]` | as stated | none |
| 1.2 `Rep(Γ, H)` | `Rep(ℤ, S₃)`; `Rep(Γ, 1)`; `Rep(ℤ/2, GL₂(ℂ))`; `Rep(F₂, S₃)` | `3` against `6`; `1`; `3` eigenvalue multisets; Burnside `(36 + 12 + 18)/6 = 11` | true | none |
| 1.3 `exists_outAction_iff_commute` | `Γ = 1`; `H` abelian; `F₂ → S₃`, `ρ(a) = (1 2)`, `ρ(b) = (2 3)` | both sides true; both true; `(1 2)(2 3)(1 2) = (1 3) ≠ (2 3)`, both sides false | iff both ways | none |
| 2.1 `Mod^±(X)`, path topology | `ℝ`; two points; `S² ⊔ S²`; total map of a path in `f ↦ (f, f⁻¹)` | `2`; `2`; order `8`, orientation-preserving `2`, index `4`; inverse `(t, y) ↦ (t, f_t⁻¹ y)` continuous | true, connectedness needed | none |
| 2.2 both Lean clauses | `[0,1]`, `P = {0,1}`; `S¹`, two points; `P` an isolated point; a point `h(y)`, `y ∉ P` | flip extends, swapping ends; `U ∖ {p}` disconnected, no extension; `U ∖ {p} = ∅`, hypothesis fails; open set `h(Σ ∖ (P ∪ U))` misses `h(U ∖ {p})` | true; `AmbientIsotopy.ext` at the pin makes `∃!` meaningful | none |
| 2.4 standard model | `a b a⁻¹ b⁻¹`; `a a b b`; `nonorientable 5 0`; `a a⁻¹` | `d₂ = 0`, `H₂ = ℤ`, `H₁ = ℤ²`; `d₂ = 2a + 2b`, `H₁ = ℤ ⊕ ℤ/2`; `H₁ = ℤ⁴ ⊕ ℤ/2`, `H₂ = 0`; two vertices, `H₁ = 0`, `H₂ = ℤ` | `H₂` and `H₁` single out `orientable g 0` | none |
| 3.1–3.2 laws of `f_δ` | change of path; composition; inverse; point push | `δ'⬝δ̄⬝δ⬝fγ⬝δ̄⬝δ⬝δ̄' = δ'⬝fγ⬝δ̄'`; `δ⬝fε⬝fgγ⬝fε̄⬝δ̄`; `δ⬝δ̄ ≃ const`; `f_const = conj[α]` | hold | none |
| 3.3 `exists_outerAction` | torus shear `(u, v) ↦ (u, u + v)`; `[0,1]`; `S¹` | columns `(1,1)`, `(0,1)`: `[[1,0],[1,1]]`; flip not isotopic, `π₁ = 1`; `Out(ℤ) = ℤ/2` | homomorphism, not injective | none |
| 3.4 sign and reflection | `f_*(a ∩ [Σ])`; torus `diag(1, −1)`; arcs under `θ ↦ 2π/g − θ` | `(f⁻¹)^*a ∩ f_*[Σ] = ε_f (f⁻¹)^*a ∩ [Σ]`; `î(e₁, −e₂) = −1 = ε_f`; arc `j ↦ 3 − j`, `(4i, t) ∼ (4i+2, 1−t) ↦ (4j+3, 1−t) ∼ (4j+1, t)`, `j ≡ −i` | gluing respected, `ε_{f⁻¹} = ε_f` | none |
| 4.3 surface groups | `(1,0)`, `GL₁`; `(0,3)`; `(1,1)`; `ℤ/2`, `𝔾_m` over `𝔽₂` | `𝔾_m²`; `G²`, `ρ(p₃) = (ρ(p₁)ρ(p₂))⁻¹`; `G²`; `𝔽₂[t]/((t−1)²)` | true | none |
| 5.2 `ℝ`-forms | `GL₂`, `J ḡ J⁻¹`; `GL₁`, `(𝔾_m, z ↦ z⁻¹)`; `2/z̄` | `[[d̄, −c̄],[−b̄, ā]]`, fixed points `[[a, −c̄],[c, ā]]`; unique `α(z) = z⁻¹`; `1 ↦ 2`, no automorphism | unique over the identity only | none |
| 5.3 realization | `u r_θ u⁻¹`, `u = [[1,1],[0,1]]` | `[[c+s, −2s],[s, c−s]]`; column norms `1 + s(2c+s)`, `1 + 2s(2s−c)`; `s = −4s`, `K = {±1}` | depends on the embedding | none |
| 5.4 definitions and (i)–(iv), five Lean theorems | `V = 0`; `G = 1`; `GL₁`; `ℝ_{>0}·SO(2)`; `ℝ_{>0}` on `ℝ²`; `(ℝ_{>0})²`, `v = (1,1)`; irrational line | `M = {0}`; `𝔭 = 0`, `M = V`; `M = {0}`, limit `0` for `α = −1`; `M = {0}`, `ℝ² ∖ 0` not closed; `M = {|x| = |y|}`; `diag(−1, 0)` limit `(0,1)` with non-closed orbit, `diag(−1,−1)` limit `0`; dense orbit, all vectors minimal | as BohmLafuente2021 Theorem 1.1; closedness needed | none |
| 5.4 (v) and its sketch | `𝔱 = ℝ·diag(1, −1)`, branches of `xy = 1` | function `0` and `1` on the branches, `1/2` on the axes, continuous; the orbit of `(1,1)` is a copy of `ℝ` | (v) true; "coordinate tori" false | R01 |
| 6.3 with gap:adjoint-kernel | torus; `SL₂` unipotent; `N(T)`; `O₂` | `Ad` trivial; `Ad` unipotent `≠ 1`; `Z⁰ = T`; `ker Ad = SO₂ ≠ {±1}` | true for connected `G` | none |
| 6.4 complete reducibility, finite generation | `𝔾_m` over `ℚ̄`; `𝔾_a^n`; closure of `⟨F, z⟩` with `D⁰ = C`; `𝔽̄_p` | `⟨2⟩` infinite, dense; closure of `ℤv` is `kv`; cosets `zⁿC` distinct against `D/C` finite; finitely generated subgroups finite | true in characteristic zero | none |
| 6.7 `isReductiveRep_tfae` | `ℤ → SL₂(ℝ)`: rotation, unipotent, `diag(2, 1/2)`; `π₁(Σ₂)` with `ρ(a₁)` unipotent; trivial `𝐆` | all four hold; `2 + t⁴ → 2`, all four fail; all hold; relator `[a₁, 1]⋯ = 1`, all fail; point | equivalent | none |
| 7.1 topology | `ℤ`, `SL₂(ℝ)`; `F_∞`, `ℝ^×`; `Γ = 1` | unipotent class absent, `Hom/G` not `T₁`; `(ℝ^×)^ℕ` not locally compact; point | finite generation needed | none |
| 7.2 universal Hausdorff quotient | `F` invariant into Hausdorff `Z`; `q` on `Hom^red`; `C₂` on `𝔸²` over `𝔽₂` | `F` constant on orbit closures, so `F = F' ∘ q`; `q` surjective, `F'` unique; `𝔽₂[x+y, xy] → 𝔽₂[x²] ≠ 𝔽₂[x]` | determined, not vacuous; characteristic zero used | none |
| 7.3 functoriality | `SO(2) ⊆ SL₂(ℝ)`; `2ℤ ≤ ℤ`; `F₂ ⊇ ⟨a⟩`; `F_∞ ↠ ℤ`; saturated closed `C` | image a torus; `Z'` of finite index, `Z'⁰ = Z⁰`; unipotent restriction; diagonal `ℝ^× ⊂ (ℝ^×)^ℕ` closed; `W ∩ C = (G·W) ∩ C` | true for every group | none |
| 7.4 `exists_outAction_characterVariety` | `ℤ`; `𝔾_a`; `F_∞`, `ℝ^×`; inner `φ` | `[g] ↦ [g⁻¹]`; `x ↦ −x`; acts on `(ℝ^×)^ℕ`; `ρ ∘ conj(γ)⁻¹ = conj(ρ γ)⁻¹ ∘ ρ`, same class | true with a bare topology on `k` | none |
| 7.5 trace coordinates | `(2,2,3)`; `φ = (a, a⁻¹b)` | `A·AB = [[3,2],[1,1]]`, `(2,3,4)`; `A⁻¹B = [[0,−1],[1,1]]`, `(2,1,2)`; commutator traces `3, 3, 3`; agrees with NonabelianLevelStructures §5.2's `(x, x y − z, y)` | left versus right pinned | none |
| Contract, `locallyCompactSpace_of_finiteType` | the pinned signature | `[IsTopologicalSemiring R] [T1Space R] [LocallyCompactSpace R]` | description drops `T1Space` | R02 |

## Verified sound

- **Elaboration.** `lake env lean` on `packages/SurfaceGroupCharacterVarieties/Suggested.lean` from
  the content repository: exit 0, 13 warnings, all "declaration uses `sorry`" (lines 95, 113, 123,
  144, 203, 211, 219, 229, 239, 273, 323, 338, 360), no error. Header: `module`, `import Mathlib`,
  four `TauCeti.*` modules, each used. No `set_option`, `lemma`, `#eval`, sorry'd data or `True`
  placeholder; every declaration has a docstring.
- **Padding probe, all 13 theorems.** On a scratch copy every `sorry` was replaced by
  `first | rfl | (simp; done) | infer_instance | tauto | trivial | (aesop; done) | exact? | (intros; simp_all; done) | decide`:
  13 errors, none closes. No theorem restates a definition, mirrors a Check or treats a boundary
  case.
- **Signatures.** The elaborated types of all 24 declarations were compared with the README; they
  agree. The four flagged binders are `[FiniteDimensional ℝ V]` on the Layer 5 definitions, whose
  bodies do not use it; the five Layer 5 theorems carry it. Nothing changed.
- **Headlines.** Stated: §§1.3, 2.2 (two), 3.3, 5.4 (five), 6.7, 7.1, 7.2, 7.4. Named in the module
  docstring with the missing carrier: §3.4, §3.5, §6.7 (c) and (d), the homeomorphisms of §§7.1 and
  7.2, the `Mod_{g,n}` clause of §7.4. The pin has no genus of a topological surface, no Zariski
  closure of a set of points, no `G`-complete reducibility, no representation scheme and no affine
  quotient (searched by declaration). The uniqueness of `ℝ`-forms (§5.2) is not among the Summary's
  end theorems. All 23 named declarations appear in the README, and no backticked name the README
  gives as its own is missing from the Lean file.
- **Library names.** 69 cited Mathlib and Tau Ceti declarations elaborated with `#check` in one
  scratch file at the pins: all exist. Opened in the source (Tau Ceti):
  `Topology/Homotopy/Isotopy/Basic.lean` 163 (`AmbientIsotopy`, with `ext`),
  `Topology/Homotopy/AmbientIsotopic/Basic.lean` 58, `Topology/Homotopy/Isotopy/Compact.lean` 123,
  `Topology/Continuum.lean` 69, `AlgebraicTopology/Singular/InvarianceOfDomain.lean` 201,
  `AlgebraicTopology/Cohomology/Cup.lean` 223, `IntegralCup.lean` 165, `Cap/Basic.lean` 124,
  `Kronecker.lean` 89, `Algebra/AlgebraicGroup/Reductive/Image.lean` 44,
  `Reductive/CompleteReducibility.lean` 96 and 118, `Tangent/Adjoint.lean` 183,
  `Topology/Algebra/PointTopology/Basic.lean` 83, 110, 261, `Geometry/Manifold/Basic.lean` 128.
  Two negative controls fail as they should: no `TopologicalSpace (Γ →* G)` and no normality of
  the inner automorphisms at the pins, so `pointwiseTopology` and `innerAut_range_normal` duplicate
  nothing.
- **Cross-roadmap citations resolved now.** At open heads: MordellLawrenceVenkatesh §§5.1, 5.4,
  5.5, 5.6, 5.9, 5.15, 5.17, 5.19, 5.22 (text read); TeichmullerGeometry §§0.0b, 0.0e, 0.0f, 0.0h,
  3.1, 4.2, 4.3, 4.4, 4.5, 5.4, 5.4a, 6.1 and its Layer 5 example;
  MappingClassGroupsAndCanonicalRepresentations §§0.1, 0.2, 0.3, 1.4, 2.1;
  NonabelianLevelStructures §§5.1, 5.2; RealSemisimpleLieGroups §2.5 (an open pull request of
  another author adding a new folder); LanglandsParameterStacks §2.2 (its second paragraph covers
  reducible and nonreduced schemes); ArithmeticGaloisRepresentations §1.7 and both paragraphs of
  §1.11 (`Conj_H`); ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1;
  GroupActionsOnRiemannSurfaces §3.4; InverseGaloisAndArithmeticFundamentalGroups IG.3.2. On main:
  ReductiveGroups Layers 1, 2, 3, 3A (3A.2, 3A.4), 4, 5, 5P, 6, 7; ReductiveGroupsPartII RG2.0.1,
  RG2.0a.2; FreeGroupsAndLimitGroups §§6.1, 6.2; AlgebraicTopology Stage 4 items 2, 3 (main maps
  them to §§4.2, 4.3); ClassifyingSpaces items 11, 15, 17; GeometricTopology Layer 1.7.2;
  LieGroups Layer 9 with **Restricted roots and KAK** and `kakDecomposition`; HamiltonianReduction
  R5; ComplexComparisonPartII C-1.1. All exist and say what is taken from them. `roadmaps resolve`
  lists nothing found nowhere.
- **Declared gaps.** `gap:adjoint-kernel`, `gap:borel-tits`,
  `gap:gcr-reductive-identity-component`: the same slugs in `design/plan.json` and under
  `## Exact supplier contracts`, each with a named supplier and section and one precise `needs`
  sentence. None is provided: no roadmap and no pinned declaration states them (the pin's
  `Tangent/Rigidity.lean` and `Tangent/Lie/Adjoint/Fixed.lean` are inputs of a route to the first,
  not the statement).
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`. No UPWARD, CYCLE
  or `moved:` line.
- **Duplication audit.** No README or `Suggested.lean`, open or on main, states a character variety
  with its topology, a real Kempf–Ness theorem, the extension over punctures or the outer action
  on `Hom(Γ, H)/H`; no `Suggested.lean` declares any of this file's names. The maintainer's
  ownership decisions (punctured mapping class groups, `Out` of a group, the general outer action)
  are respected. The worker's overlap list has no dropped id, no second copy and no conflicting head.

Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, GroupActionsOnRiemannSurfaces, MordellLawrenceVenkatesh, SurfaceTopology, ReductiveGroups, AdelicAlgebraicGroups, GeometricTopology; `Out(Γ)`, `MappingClassGroupFull`, the classification of surfaces and `dehn_nielsen_baer`: TeichmullerGeometry; `Mod(S)`, `Mod(S*)`, `Push`, `Forget`: MordellLawrenceVenkatesh; `PMod` and `R_r(Γ)`, `M_r(Γ)` (the case `GL_r` over `ℂ` of §§4.1 and 7.2): MappingClassGroupsAndCanonicalRepresentations; mapping class groups of compact surfaces: GeometricTopology; nothing else shared.

- **Shape.** Seven layers, each with Examples and Dependencies; every definition has its API and at
  least three Checks; every theorem its hypotheses and a locator or supplier citation. No process
  words, pull-request numbers, dates, anchors, LaTeX delimiters or machine paths in the README or
  the Lean file. No layer is named after a source.
- **Sources, the seeded sample.** Read at their locators: LandesmanLitt2024 lines 41–50, 473–475
  (§§1.2, 1.3, 3.3); BCGGO2024 lines 466–481, 2706–2726 (§§4.3, 5.2); Sikora2012 lines 228,
  262–268, 363–364, 420–421, 459–468, 572–586, 823–845 (§§4.3, 6.3, 6.4, 7.2, 7.3, 7.5);
  BateMartinRohrle2005 lines 183–187, 263–267, 300–309, 355–358, 379–382, 510–512, 814–815,
  861–865 (§§6.3, 6.4); BohmLafuente2021 lines 52–62, 77–88, 172–193, 260–261, 364, 382–386,
  417–432, 445–447, 504–519, 562–583, 1021–1022, 1050 (§5.4). Each supports the statement as
  written. All ten cited works are in `sources.toml`, one key each.

Source independence: 12 passages compared with 5 sources, none shared beyond a nine-word run (LandesmanLitt2024 lines 49–50, a remark reported with its locator) and the ten-word statement of BohmLafuente2021 Theorem 1.1 (iii); largest share Sikora2012, 13 of 71 locators; contents compared with Sikora2012: independent (Layers 4, 6, 7 meet its §§5, 3 and 7, 11, not in its order; Layers 1, 2, 3, 5 meet none of its fourteen sections).

## Not verifiable

- FarbMargalit2012 (waived): the locators of the sampled §§2.1, 2.2, 2.4, 3.3, 3.4 were not read;
  the statements were recomputed (table above).
- RichardsonSlodowy1990 (waived), Knapp2002 (waived), Richardson1988 and Goldman1984
  (uncertified): not read. "Theorem 3.6" agrees with the citation at Sikora2012 line 586.
- BohmLafuente2021: the arXiv version was read; the numbering of the published chapter was not
  compared (the manifest says so).
- The Kempf–Ness statements and the topology theorems are checked on instances and against the
  sources, not proved.

## Source issues

- **Misprint** in BCGGO2024 at §2.3, printed p. 10: the source says `SO_{p,q}` has two components whenever `p` or `q` is nonzero; it should be when both are nonzero, `SO_{n,0}` being connected; affects nothing.
- **Gap** in BCGGO2024 at §2.3, printed p. 10: the source defines a real form by an antiholomorphic involution without asking for a group automorphism; it should say involutive automorphism, as `z ↦ 2/z̄` on `ℂ^×` shows; affects nothing.
- **Misprint** in Sikora2012 at §11, printed p. 18: the source refers to "Proposition 30" for the closed-orbit criterion; it should be Theorem 30, as numbered in §7; affects nothing.

## For the human reviewers

- Ownership: TeichmullerGeometry §5.4 (open pull request) writes `Out⁺(Π)` without defining it; this package's §3.4 cites it and states the description of that subgroup by the action on `H₂`.
- Ownership: AdmissiblePairsAndPadicHodgeStructures (open, README line 80) asks ReductiveGroups for the kernel of `Ad` under `gap:adjoint-kernel-and-orbit-differential`; this package asks for the same fact under `gap:adjoint-kernel`.
- `packages/SurfaceGroupCharacterVarieties/design/plan.json` lists MordellLawrenceVenkatesh §5.20 among the supplier sections; the README no longer uses it (§3.5: no exactness of the Birman sequence). The package stage cannot change that list.
- Licence: BohmLafuente2021 was read as arXiv v3; the published chapter (LMS Lecture Note Ser. 463) was not compared, so the theorem numbers cited are the preprint's.
- Not tested: five of the ten sources are waived or uncertified (FarbMargalit2012 with 11 of 71 locators, Knapp2002, RichardsonSlodowy1990, Richardson1988, Goldman1984); their locators and the wording against them were not checked.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e002bbdb9519adc479177d400cce34e5a4f8aef", "job": "REV-PKG-SurfaceGroupCharacterVarieties~3", "model": "fable", "worker": "chris-x29"} -->

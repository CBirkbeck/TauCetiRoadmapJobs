# PORT-SurfaceGroupCharacterVarieties

- **Branch:** `roadmap/surface-group-character-varieties`, from `51d880d`.
- **Head commit:** `077c1ce` — `SurfaceGroupCharacterVarieties: roadmap (README, Suggested.lean, metadata)`.
- **Folder:** `TauCetiRoadmap/SurfaceGroupCharacterVarieties/{README.md,Suggested.lean,metadata.toml}`; nothing outside it is touched.

## Build

`lake build TauCetiRoadmap.SurfaceGroupCharacterVarieties.Suggested`:

    Build completed successfully (18606 jobs).

13 warnings, all `declaration uses 'sorry'` (the 13 theorems); no other warning, no error.

## Gate

    gate SurfaceGroupCharacterVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency direction

`gate --depcheck … --movable` on `TauCetiRoadmap/SurfaceGroupCharacterVarieties/README.md`, after all edits:

    depcheck: 241 roadmaps, 2261 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. In the merge order this roadmap sits right after NonabelianLevelStructures, its last supplier in the order.

`roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere. The four leads the worker listed (`StandardSurface.eulerChar_model`, `StandardSurface.isSurface_model`, `StandardSurface.homeomorph_unique`, `Surface.IsOrientable`) are TeichmullerGeometry §0.0f declarations: all four are in its `Suggested.lean` at its head, so the README cites them correctly.

## Draft pull request body

This roadmap builds the character variety of a finitely generated group in a real reductive group and the mapping class group's action on it. On the group side it constructs the action of `Out(Γ)` on conjugacy classes of homomorphisms for any group `Γ`, and proves that `Aut(Γ)` acting on `Hom(Γ, H)` itself factors through `Out(Γ)` exactly when every homomorphism has abelian image. On the surface side it works with ambient isotopy classes of homeomorphisms of a space, extends homeomorphisms and isotopies over punctures, and constructs the outer action `Ψ : Mod_{g,n} → Out(π₁(Σ_{g,n}))`. For closed surfaces of genus at least one it identifies `Ψ` with the Dehn–Nielsen–Baer isomorphism, and it compares the resulting action on representations with the mapping-class action on finite coverings. On the representation side it builds the representation scheme `Hom(Γ, G)` of a finitely generated group into an affine group scheme. For real reductive groups `G^ℝ` (open subgroups of the real points of a connected reductive `ℝ`-group, among them the real forms of complex groups given by antiholomorphic involutions) it proves the real Kempf–Ness theorem and six equivalent characterisations of reductive representations. It then defines `𝒳(Γ, G^ℝ) = Hom^red(Γ, G^ℝ)/G^ℝ`. The end theorems are:
- `𝒳` is Hausdorff, locally compact and second countable, and is homeomorphic to the minimal vectors modulo a maximal compact subgroup;
- for complex `G`, `𝒳` is the complex points of the affine quotient `Hom(Γ, G)//G`, and it is the universal Hausdorff quotient of `Hom(Γ, G(ℂ))/G(ℂ)`;
- `Out(Γ)`, and through `Ψ` the group `Mod_{g,n}`, acts on `𝒳` by homeomorphisms.

The roadmap supplies the common foundation that nonabelian Hodge theory, higher Teichmüller theory, Goldman's symplectic form and Culler–Shalen theory start from. It takes surfaces and mapping class groups from MordellLawrenceVenkatesh, TeichmullerGeometry and MappingClassGroupsAndCanonicalRepresentations, real forms from RealSemisimpleLieGroups, and reductive quotients from ArithmeticGaloisRepresentations and LanglandsParameterStacks.

## Roadmaps this one depends on that are still pull requests

- Suppliers in the merge order, all earlier than this roadmap: TeichmullerGeometry, MordellLawrenceVenkatesh, MappingClassGroupsAndCanonicalRepresentations, NonabelianLevelStructures (used only in Checks of §§7.2 and 7.5), ArithmeticGaloisRepresentations, LanglandsParameterStacks.
- RealSemisimpleLieGroups (§2.5): another author's open pull request that adds a new folder. It is not in the merge order, and depcheck accepts the edge. Its own Scope lists "representation and character varieties of surface groups in real reductive groups … which consume §2.5 and Layer 0" as outside it, which agrees with this roadmap.
- Cited only as comparisons in Scope and ownership, not as suppliers: InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 (in the merge order, earlier) and GroupActionsOnRiemannSurfaces §3.4 (another author's new folder, not in the merge order).
- No citation uses a numbering that only an open revision defines; the overlap tool reports no dropped id.

## What moved from the Lean file to the README

Nothing. The package's `Suggested.lean` already had the acceptance-test form: 13 headline theorems (§§1.3, 2.2 ×2, 3.3, 5.4 ×5, 6.7, 7.1, 7.2, 7.4) and 12 named definitions and instances, plus the anonymous topology instance on `CharacterVariety`, all with real bodies on carriers that exist at the pins. The named ones are `innerAut_range_normal`, `Out`, `pointwiseTopology`, `conjOrbit`, `symmetricPart`, `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit`, `adjointRepresentation`, `IsReductiveRep`, `reductiveConjSetoid` and `CharacterVariety`. There is no padding, no sorry'd data, no `example` and no `set_option`. The headlines the pins cannot state are named in the module docstring with the carrier each one lacks: §3.4, §3.5, §6.7 (c) and (d), the homeomorphisms of §§7.1 and 7.2, and the `Mod_{g,n}` clause of §7.4. No statable headline is missing; the ℝ-form uniqueness of §5.2 and the functoriality of §7.3 are not end theorems.

Lean changes, none to any statement:

1. **Header.** `module` is kept: without it the build gains a non-`sorry` warning ("imports `Mathlib` … designed for use with the module system"). It is followed by `@[expose] public section` and `public import` lines, as the module roadmaps on main do. Without these, every declaration of the module was private: invisible to importers and to the `#check` signature test, which failed with "Unknown identifier" for all 25 names. The import lines are still exactly `Mathlib` plus four `TauCeti.*` modules, each used, and the gate accepts them.
2. **Layer 5 binder.** `[FiniteDimensional ℝ V]` is taken out of the section `variable` line and written into the signatures of the five Layer 5 theorems. The four Layer 5 definitions never carried it, which matches the README: the definitions are for every real inner product space and the theorems for finite-dimensional ones. The variable line had made it look as if the definitions dropped the binder (the four leads in `signatures.md`).
3. Two lines were rewrapped to 100 characters.

**Signature check.** I wrote `#check @name` for all 25 named declarations of `Suggested.lean`, plus 86 cited Mathlib and Tau Ceti names, into one scratch file and elaborated it once at this worktree's pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): no error. I compared each elaborated type with its README statement:
- `exists_outAction_iff_commute`, both `existsUnique_*_extension` theorems and `exists_outerAction` carry exactly the README's hypotheses: compact Hausdorff `X`, finite `P` and the neighbourhood-basis condition; path-connected `X`.
- The five Kempf–Ness theorems now show `[FiniteDimensional ℝ V]` and `IsRealReductiveLinearGroup G`.
- `isReductiveRep_tfae` and `characterVariety_t2_locallyCompact_secondCountable` carry the finite type of `O(𝐆)`, its reductivity, the openness of `G` and `[Group.FG Γ]`.
- `characterVariety_universalHausdorffQuotient` carries a reductive `O(G)` over `ℂ` and `[Group.FG Γ]`.
- `exists_outAction_characterVariety` carries only a field with a topology, a Hopf algebra and a subgroup, as §7.4 says.

No other binder was lost.

Pinned conventions the statements rely on, read at the pin:
- Mathlib's `Group (X ≃ₜ X)` has `mul f g := g.trans f`, so `f * g = f ∘ g` (`Topology/Homeomorph/Defs.lean`), as the contract says.
- `FundamentalGroup.mul_def : p * q = .of (q.asHom.trans p.asHom)`.
- `fundamentalGroupMulEquivOfPath p` is `Iso.conj` of `[p]`, so `[γ] ↦ [p̄ ⬝ γ ⬝ p]`, the Conventions' reading.

## Supplier replacements and duplication removals

No target of the package duplicates a roadmap on main or an open roadmap, so nothing was removed. Three citation repairs were made, recorded in Scope and ownership and the contracts:

1. **Classical topology on complex points.** The package cited ComplexComparisonPartII §C-1.1 for it (Scope, Conventions, §§4.2, 6.5, 7.2 and three Dependencies lines). ReductiveGroups §3A.5 calls itself "the single owner of complex points, their classical topology", and ComplexComparisonPartII consumes it from ReductiveGroups §3A.5c ("C-1.1 identifies them with the underlying space … of `X^an`"). Every citation now points to ReductiveGroups §3A.5c. The ComplexComparisonPartII contract is deleted, and 3A.5c is added to the ReductiveGroups contract with the facts used: closed immersions give closed embeddings, morphisms act continuously, separated schemes give Hausdorff points, and the points are locally compact and, for finite type, second countable. §6.5's sketch now cites 3A.5c at both steps that use it.
2. **AlgebraicTopology numbering.** Main maps "Stage 4 items 1–8" to §§4.1–4.8. Its README says so in its numbering paragraph, so the old ids were still valid, but every "Stage 4 item 2/3" is now §4.2/§4.3 as on main. The contents were checked: §4.2 is the cellular differential and incidence numbers; §4.3 is the cellular–singular comparison with orientation-negated generators, and its RP² Check (`d₂ = 2`, `H₂ = 0`) is the one §2.4 quotes. ClassifyingSpaces still uses Stage numbering, and items 11, 15, 17 exist.
3. **IntegralHeckeAndGaloisDeterminants §0.7** (on main), **Invariant coordinate algebras under conjugation**, owns the algebra `C_n` of functions on `Hⁿ` invariant under simultaneous conjugation, for any commutative Hopf algebra over any commutative ring. That is the coordinate algebra of `G^S//G`, the target of §7.2's closed immersion. Added in three places: a Scope bullet (§7.2's `Hom(Γ, G)//G` differs from `Spec C_n` by the relations of `Γ`), a supplier contract, and a §7.2 Check for `Γ = F_S` (`GL₂`, one generator: trace and determinant invariant, `x₁₂` not; torus invariants would wrongly admit `x₁₁`).

### Duplication sweep, by object

Searched main and the open roadmap pull requests at their heads with `roadmaps grep`, and the pins with `grep`. Where an object appears elsewhere, the outcome:
- **Character variety, representation scheme.** MappingClassGroupsAndCanonicalRepresentations §1.4 (`R_r(Γ)`, `M_r(Γ)`, `GL_r` over `ℂ`, finitely presented `Γ`, with fixed-determinant variants) is the case `G = GL_r`, `k = ℂ` of §§4.1 and 7.2. It is earlier in the merge order, and the Scope records the kept variant (general affine group scheme, any field). NonabelianLevelStructures §5.1 is the `F₂`, `SL₂` case, recorded likewise. Other mentions are references or downstream uses only: GeometricTopology (Culler–Shalen in its Part II), PainleveEquations, CountingBundlesAndHallAlgebrasOfCurves, RealSemisimpleLieGroups (explicitly outside it), IntegralHeckeAndGaloisDeterminants (`B_H^Γ` pseudocharacter ring, a different object; its `C_n` is cited, item 3 above).
- **Kempf–Ness, minimal vectors.** TensorProductCombinatorics §7.3 (main) proves the complex projective Kempf–Ness direction for flag products: complex, projective and specific, not the real linear theorem of §5.4. LatticePackingsAndPerfectForms and the others use "minimal vector" for lattices, a different notion.
- **Universal Hausdorff quotient.** DiamondsAndVStacks names Mathlib's `T2Quotient` for an arbitrary space; §7.2 states the specific identification for `Hom(Γ, G(ℂ))/G(ℂ)`.
- **Outer actions.** On main the outer actions are of extensions on `ContinuousOut` (ProfiniteArithmetic, BelyiMaps) or of Galois groups on `π₁^ét`. None acts by `Out(Γ)` on `Hom(Γ, H)/H`. InverseGalois §IG.3.2 (exterior epimorphisms modulo `Inn(G)`, `e ↦ e ∘ α⁻¹`) is the special case already recorded in Scope; its direction matches §1.3.
- **Ambient isotopy, punctures.** The only group of ambient-isotopy classes on main is GeometricTopology's knot types. Neither pin has a topology on `X ≃ₜ X`. MordellLawrenceVenkatesh §5.17 uses the compact-open topology on `Homeo⁺(S, ∂S)` without owning a group topology. §2.1 keeps both.
- **Outer automorphism group.** None at the pins: Tau Ceti has only `TauCeti.ContinuousOut`, which needs a topology. The README cites TeichmullerGeometry §4.2's `OuterAut` (its `Suggested.lean` has `OuterAut` and `innerAut_normal`), and the Lean restatement `Out`, `innerAut_range_normal` has a different fully qualified name.

Ownership against open pull requests was checked with the tools above, at the heads they index (453 open roadmap pull requests).

## Fixes from the upstream read of the README

- The citation of a non-owner for the classical topology, and the stale AlgebraicTopology numbering (above).
- §6.5's sketch said "A Zariski-closed set is classically closed" without a supplier. It now cites 3A.5c's closed embeddings.
- The new contract avoids reusing `O` both for a base ring and for coordinate algebras `O(G)`.

Nothing else was found to be wrong, vacuous or unsourced. The review's two P3 repairs (the description of the `T`-orbits in §5.4's sketch, and the `T1Space` hypothesis of `locallyCompactSpace_of_finiteType`) are present in the ported text.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.3 `exists_outAction_iff_commute` | `Γ = 1`; `H` abelian; `Γ = ℤ`, `H = S₃`; `F₂ → S₃`, `ρ(a) = (1 2)`, `ρ(b) = (2 3)` | trivially both true; inner `φ` acts by `ρ ∘ conj(γ)⁻¹ = conj(ρ γ)⁻¹ ∘ ρ = ρ`, both true; cyclic images, both true, `Out(ℤ)` acts by `ρ ↦ ρ ∘ (−1)`; `Push(a)·ρ(b) = (1 2)(2 3)(1 2) = (1 3) ≠ (2 3)`, both false | iff holds both ways; homomorphism law `ρ ∘ ψ⁻¹ ∘ φ⁻¹ = ρ ∘ (φψ)⁻¹` matches Mathlib's `Perm` product | none |
| Conventions, left action witness | `φ = [[1,1],[0,1]]`, `ψ = [[1,0],[1,1]]`, `ρ` first coordinate | `φψ = [[2,1],[1,1]]`, inverse `[[1,−1],[−1,2]]`, row `(1,−1)`; `ψφ = [[1,1],[1,2]]`, inverse `[[2,−1],[−1,1]]`, row `(2,−1)` | left action pinned | none |
| Conventions, `π₁` product and path conjugation | Mathlib at the pin | `p * q = .of (q.asHom.trans p.asHom)`; `fundamentalGroupMulEquivOfPath p = Iso.conj [p]`, `[γ] ↦ [p̄ ⬝ γ ⬝ p]` | as stated | none |
| §1.1 `Inn`, `Out` | `Q₈`; `ℤ`; `S₃`; `e = diag(1,−1)` on `ℤ²` | `|Inn Q₈| = 8/2 = 4`, `|Out Q₈| = 24/4 = 6`; `Inn ℤ = 1`; `Inn S₃ ≅ S₃`; `D[[1,1],[0,1]]D = [[1,−1],[0,1]]` | as stated | none |
| §1.2 `Rep(Γ, H)` | `Rep(ℤ, S₃)`; `Rep(ℤ/2, GL₂(ℂ))`; `Rep(F₂, S₃)` | `3` against `6` homomorphisms; `3` eigenvalue multisets; Burnside `(36 + 3·4 + 2·9)/6 = 11` | as stated | none |
| §2.2 `existsUnique_homeomorph_extension` | `P = ∅`; `[0,1]`, `P = {0,1}`; `S¹`, two points; `D²`, one boundary point; `S²`, `{N, S}` | `h` itself; `(0,ε]` connected, flip extends; `U ∖ {p}` two arcs, hypothesis fails (no extension exists); one-point compactification of `D² ∖ {p}` is `D²`; `(θ,s) ↦ (−θ,−s)` is `(x,y,z) ↦ (x,−y,−z)` | true where the hypothesis holds, hypothesis needed | none |
| §2.2 `existsUnique_ambientIsotopy_extension` | `[0,1]`, `Φ_t(y) = y^{1+t}` on `(0,1)` | extension fixes `0, 1`, total map a homeomorphism of `I × [0,1]`; limit point `q_t` constant in `t` since a preconnected subset of `I × P` lies in one `I × {q}`, and `q_0 = p` | true | none |
| §2.1 `Mod^±` | `ℝ`; two points; `S¹`; `S² ⊔ S²`; `[0,1]` | `2`; `2`; `2`; `8` with orientation-preserving `{id, swap}`, index `4`; `2` | as stated | none |
| §2.4 standard model | `a b a⁻¹ b⁻¹`; `a a b b`; `nonorientable 5 0`; `a a⁻¹`; `a a` | `d₂ = 0`, `H₂ = ℤ`, `H₁ = ℤ²`; `d₂ = 2a + 2b`, `H₁ = ℤ ⊕ ℤ/2`, `H₂ = 0`, `χ = 0`; `H₁ = ℤ⁴ ⊕ ℤ/2` (rank 4, as `Σ₂`), `H₂ = 0`; two vertices, `H₁ = 0`, `H₂ = ℤ`; `d₂ = 2`, `H₂ = 0` | `H₂ = ℤ` and `H₁` rank select `orientable g 0` | none |
| §2.5 change of model | `e = diag(1,−1)` on `Mod_{1,0} ≅ SL₂(ℤ)` | if `g D⁻¹` centralised `SL₂(ℤ)` then `g = ±D`, `det g = −1`, contradiction | outer, as stated | none |
| §3.1 composition law and `exists_outerAction` | `f_δ ∘ g_ε` on `[γ]` | `[δ ⬝ fε ⬝ fgγ ⬝ fε̄ ⬝ δ̄] = (f∘g)_{δ⬝fε}[γ]`; Mathlib's `(f * g) x = f (g x)` and `MulAut` product agree, so `Ψ(fg) = Ψ(f)Ψ(g)` | homomorphism | none |
| §3.3 torus shear | `(u,v) ↦ (u, u+v)` | `e₁ ↦ (1,1)`, `e₂ ↦ (0,1)`: `[[1,0],[1,1]]`; transpose is the other shear | columns convention pinned | none |
| §3.4 reflection `r` | arc `j`, parameter `t`, angle `2π(j+t)/(4g)` | `z ↦ e^{2πi/g} z̄` gives angle `2π((3−j) + (1−t))/(4g)`; `(4i,t) ∼ (4i+2,1−t) ↦ (4j+3,1−t) ∼ (4j+1,t)`, `j ≡ −i` | gluing respected, `r` acts by `−1` on `H₂` | none |
| §3.5 coverings direction | torus, `ρ(u,v) = v mod 3`, `M = [[1,0],[1,1]]` | `M(ker ρ) = {b ≡ a}` = `ker(ρ ∘ M⁻¹)`, `ρ ∘ M⁻¹ = b − a`; `ρ ∘ M = a + b`, kernel `{b ≡ −a}` | left action matches covers | none |
| §4.1 coaction direction | `Γ = ℤ`, `GL₂`, `g = diag(λ,1)`; `ℤ/2`, `𝔾_m` over `𝔽₂` | `g⁻¹ρg = [[x₁₁, λ⁻¹x₁₂],[λx₂₁, x₂₂]]`; `𝔽₂[t]/(t−1)²` nonreduced | as stated | none |
| §5.2 `ℝ`-forms | `J ḡ J⁻¹`, `J = [[0,−1],[1,0]]`; `(𝔾_m, z ↦ z⁻¹)`; `2/z̄` | `J ḡ J⁻¹ = [[d̄,−c̄],[−b̄,ā]]`, fixed `[[a,−c̄],[c,ā]]`, `τ² = J²gJ⁻² = g`; unique `α(z) = z⁻¹`; `2/conj(2/z̄) = z`, `1 ↦ 2` | unique only over the identity; "automorphism" needed | none |
| §5.3 non-transpose-stable embedding | `u r_θ u⁻¹`, `u = [[1,1],[0,1]]` | `[[c+s,−2s],[s,c−s]]`; column norms `1 + s(2c+s)`, `1 + 2s(2s−c)`; `s ≠ 0` forces `s = −4s`; `K = {±1}`, `𝔭 = 0` | `K exp 𝔭 ≠ G^ℝ` | none |
| §5.4 (i) `minimalVectors_eq_normMinimizers` | `V = 0`; `G = 1`; `GL(V)`; `SO(V)`; `ℝ_{>0}` on `ℝ` | both sides `V`; `𝔭 = 0`, both `V`; `A = 1` gives `‖v‖² = 0`, and `g = ε·1` gives `v = 0`: both `{0}`; `𝔭 = 0`, both `V`; both `{0}` | equal; convexity of `‖exp(tA)v‖²` with derivative `2⟨Av,v⟩` | none |
| §5.4 (ii)–(iv) | `λ·(x,y) = (λx, λ⁻¹y)`; `(ℝ_{>0})²` diagonal, `v = (1,1)`; irrational line on `ℂ²` | `M = {|x| = |y|}`, orbit of `(1,1)` meets `M` in `K·(1,1) = {(1,1)}`; `diag(a,b)` has a limit iff `a,b ≤ 0`, closed limit orbit iff `a,b < 0`, `{0}` the only closed orbit in the quadrant; `G = K`, `𝔭 = 0`, dense orbit | as stated; closedness of `G` needed | none |
| §5.4 (v) separation | `𝔱 = ℝ·diag(1,−1)`, branches of `xy = 1` | weights `s, −s`, `w = (1/2,1/2)`; `(xy)^{1/2}` on the first quadrant gives `(1,0)`, `(0,1)` on the branches; exponent `(1,0)` gives `x`, not invariant and discontinuous at `(1,0)` | as stated | none |
| §6.1, §6.7 `isReductiveRep_tfae` | `ℤ → SL₂(ℝ)`: rotation, `[[1,1],[0,1]]`, `diag(2,1/2)`; `GL₂(ℝ)`, `diag(2,3)`; `π₁(Σ₂)` with `ρ(a₁)` unipotent; `𝐆 = 𝔾_m` | all four hold; orbit closure contains `1` (`2 + t⁴ → 2`), all fail; all hold; `Ad` eigenvalues `1,1,2/3,3/2`; relator `[U,1][1,1] = 1`, all fail; `Ad` trivial, orbits points | equivalent | none |
| §6.3 `ker Ad` | `SL₂`; `O₂` over `ℂ` | `{±1}` = centre; `Ad = det` on `𝔰𝔬₂`, kernel `SO₂ ≠ {±1}` | connectedness needed (gap:adjoint-kernel) | none |
| §6.4 dimension count | `(diag(2,1/2), [[1,1],[0,1]])` in `SL₂` | centraliser `{±1}`, orbit dimension `3`; limit `(diag(2,1/2), 1)`, centraliser `T`, dimension `2`; common fixed space `0 → 𝔱` | direction as stated | none |
| §7.1 topology | `ℤ`, `SL₂(ℝ)`; `F_∞`, `ℝ^×`; `π₁(Σ_g)`, `U(1)` | unipotent class absent, three branches meet at `1`; `(ℝ^×)^ℕ` not locally compact; `U(1)^{2g}` | finite generation needed | none |
| §7.2 universal Hausdorff quotient | invariant continuous `F` into a Hausdorff `Z` | `F` constant on orbit closures; `F'([ρ_ss]) = F(ρ_ss)`; `F'` continuous because `F' ∘ (quotient map) = F|Hom^red`; `q` surjective, so `F'` unique; `q` forced to `[ρ_ss]` by `T2` | determined, not vacuous | none |
| §7.2 invariants | `𝔸¹//𝔾_m`; `GL_n`, `Γ = ℤ`; `C₂` on `𝔸²` over `𝔽₂`; `F_S`, `GL₂`, `|S| = 1` | `x^n ↦ x^n ⊗ t^n`, constants only; `𝔸^{n−1} × 𝔾_m`; `𝔽₂[x+y, xy] → 𝔽₂[x²] ≠ 𝔽₂[x]`; trace and determinant invariant, `x₁₂` not, swap sends `x₁₁ ↦ x₂₂` | as stated; new Check consistent with IntegralHecke §0.7's own Check | Check added |
| §7.4 `exists_outAction_characterVariety` | `ℤ`, `SO(2)`; `𝔾_a`; `F_∞`, `ℝ^×`; inner `φ` | `[g] ↦ [g⁻¹]`, fixed `±1`; `x ↦ −x`; acts coordinatewise through `Γ^{ab}`; `ρ ∘ conj(γ)⁻¹ = conj(ρ γ)⁻¹ ∘ ρ`; `a([φ][ψ]) = a[φ] ∘ a[ψ]` with `f * g = f ∘ g` | true with a bare topology on `k` | none |
| §7.5 trace coordinates | `(2,2,3)` from `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]`; `φ = (a, a⁻¹b)` | Vieta `(2,2,1)`; `ρ ∘ φ⁻¹ = (A, AB)`: `(2,3,4)`, `A·AB = [[3,2],[1,1]]`; `ρ ∘ φ = (A, A⁻¹B)`: `(2,1,2)`, `A⁻¹B = [[0,−1],[1,1]]`; commutator traces `3, 3, 3, 3` | left action pinned | none |
| §6.5 / Conventions, classical topology | owner of the classical topology on `X(ℂ)` | ReductiveGroups §3A.5 "single owner"; ComplexComparisonPartII consumes it from 3A.5c | citation repointed | repointed |

## Unresolved

- Three declared supplier gaps remain open, because neither ReductiveGroups, ArithmeticGaloisRepresentations nor the pins provide them (the pins were searched for `adRepresentation` kernels and for Borel–Tits):
  - gap:adjoint-kernel (ReductiveGroups Layer 2: `ker Ad = Z(G)` for connected `G` in characteristic zero);
  - gap:borel-tits (ReductiveGroups Layer 7);
  - gap:gcr-reductive-identity-component (ArithmeticGaloisRepresentations §1.11).

  AdmissiblePairsAndPadicHodgeStructures asks ReductiveGroups for the kernel of `Ad` under another slug. The two requests should be met by one target.
- The kept variants against earlier open roadmaps stand as the review accepted them. MappingClassGroupsAndCanonicalRepresentations §1.4 (`GL_r` over `ℂ`) and InverseGalois §IG.3.2 (`Out(F_r)` on exterior epimorphisms) are special cases of targets here. Being earlier in the merge order, they cannot cite this roadmap.
- Five of the ten sources are waived or uncertified: FarbMargalit2012, Knapp2002, RichardsonSlodowy1990, Richardson1988, Goldman1984. Their locators were not read in this port. BohmLafuente2021's theorem numbers are those of arXiv v3.
- No suspicious instruction was found in any text read.


Pull request: #2430 (roadmap/surface-group-character-varieties at 077c1ce)

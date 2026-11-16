# Review of SurfaceGroupCharacterVarieties (pull request #2430 at 077c1ce)

**Verdict:** needs changes

## R01 (P2) — §5.4's linear real reductive groups duplicate LieGroupsPartII §7.1 without citation

**Location** `TauCetiRoadmap/SurfaceGroupCharacterVarieties/README.md` lines 1550–1552: "Call `G` a real reductive linear group, `IsRealReductiveLinearGroup G`, when `G` is closed in `GL(V)` and every `g ∈ G` is `k exp(A)` with `k ∈ K = G ∩ O(V)` and `A ∈ 𝔭`". The same definitions are in `Suggested.lean` lines 184–193.

**Claim** LieGroupsPartII owns this class of groups, their exponential Lie algebra, their polar decomposition, and the real points of a connected reductive `ℝ`-group as such a group. It is line 65 of the merge order; this roadmap is line 310. The README never names LieGroupsPartII, so the object has two owners.

**Witness** In LieGroupsPartII/Suggested.lean, line 82 defines `IsSelfAdjointLinearGroup` (closed, transpose-stable, finitely many components) and line 91 defines `linearLieAlgebra`. Its README §7.1 says "every g ∈ G is uniquely k·exp(X)", and §8.1 covers real points. This README's lines 1554–1558 derive the same three properties.

**Repair** Add this bullet to *Scope and ownership*: "the self-adjoint linear groups `IsSelfAdjointLinearGroup`, their Lie algebra `linearLieAlgebra`, their polar decomposition, and the real points of a connected reductive `ℝ`-group in a transpose-stable embedding as one: LieGroupsPartII §§7.1, 8.1. §5.4's `IsRealReductiveLinearGroup` is a kept variant on `GL(V)` of a real inner product space, with the polar condition as its definition. In an orthonormal basis of a finite-dimensional `V` it is `IsSelfAdjointLinearGroup`, and `symmetricPart G` is the symmetric part of `linearLieAlgebra G`." Then:
- add a `### From TauCetiRoadmap.LieGroupsPartII` contract citing §7.1 and §8.1;
- state that comparison as a §5.4 target with *Needs:* LieGroupsPartII §7.1;
- add LieGroupsPartII §8.1 to §5.3's *Needs:* for `G^ℝ = K exp(𝔭)`.

The new edge points to merge-order line 65, so it is downward.

## R02 (P3) — §5.2's bijection is cited to a passage that only defines real forms

**Location** `README.md` line 1450: "Prove the two statements that make `τ ↦ (𝐆_τ, φ_τ)` a bijection (BCGGO2024 lines 466–481; Knapp2002, Ch. VI, §§1–2):"

**Claim** BCGGO2024 lines 466–481 do not say that an `ℝ`-form is unique up to unique isomorphism over the identity. Nor do they say that the conjugation of every `ℝ`-form is an antiholomorphic involutive automorphism.

**Witness** BCGGO2024 lines 467–470 define a real form as the fixed set of an antiholomorphic involution. Lines 475–481 define Cartan involutions and state their existence and conjugacy. Nothing in lines 466–481 concerns `ℝ`-group schemes or isomorphisms of forms.

**Repair** Replace the parenthetical with "(Galois descent along `ℂ/ℝ`, proved in the sketch below; real forms as antiholomorphic involutions: BCGGO2024 lines 467–470)". Keep Knapp2002 only with a locator that states the claim.

## R03 (P3) — `characterVariety_universalHausdorffQuotient` is attributed to a section that does not state it

**Location** `Suggested.lean` line 336: "**The universal Hausdorff quotient** (Layer 7.2; Sikora2012, §11)."

**Claim** Sikora2012 §11 gives the categorical quotient and the unique closed orbit in each class. It says nothing about Hausdorffness, or about continuous invariant maps to Hausdorff spaces factoring through the quotient. The README's own §7.2 cites Sikora only for the algebraic clauses.

**Witness** Sikora2012 lines 823–837 cover the categorical quotient over affine sets and the unique closed orbit per class. The word "Hausdorff" occurs nowhere in the extraction.

**Repair** Change the docstring citation to "(Layer 7.2; Sikora2012 lines 835–837 for the unique closed orbit in each class; the topological statement is proved in README §7.2)".

## R04 (P3) — the module docstring gives a wrong reason for leaving §3.5's non-descent theorem unstated

**Location** `Suggested.lean` lines 47–49: "the non-descent theorem for the based action of the marked-point mapping class group `Mod(S*)` of `S = Σ_{g,n}` … it needs the same missing genus and orientation of a topological surface"

**Claim** The theorem needs no genus: README §3.5 proves it for every `(g, n)`. Only orientation is missing at the pins: the orientation of `Σ_g` and the orientation-preserving classes in `Mod(S*)`.

**Witness** README line 1215 says "Prove the non-descent theorem, for every `(g, n)`". Its Checks (lines 1250–1258) cover `(0,3)`, `(1,0)`, `(0,0)`, `(0,1)` and `(0,2)`.

**Repair** Replace "it needs the same missing genus and orientation of a topological surface" with "it is stated for an oriented `Σ_g` and the orientation-preserving group `Mod(S*)`, and the pins have no orientation of a topological surface (no genus enters: it holds for every `(g, n)`)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `Inn ≅ Γ/Z`, transport of `Out` | `Q₈`, `S₃`, `ℤ`, `ℤ²` with `e = diag(1,−1)` | order of `Inn Q₈` is 8/2 = 4, of `Out Q₈` is 24/4 = 6; `Inn S₃` order 6; `Inn ℤ = 1`; `[[1,1],[0,1]] ↦ [[1,−1],[0,1]]` | holds | none |
| §1.2 `Rep(Γ,H)` | `ℤ→S₃`, `ℤ/2→GL₂(ℂ)`, `H = 1` | 6 homomorphisms, 3 classes; classes `diag(1,1)`, `diag(1,−1)`, `diag(−1,−1)`; `Rep(Γ,1)` one point; LL line 42 gives conjugacy classes | holds | none |
| `exists_outAction_iff_commute` (§1.3) | `Γ = H = F₂`, `ρ = id`; `Γ = 1`; Conventions `ℤ²` witness | `conj a · id = conj a⁻¹ ≠ id`; `Γ = 1`: both sides true; `(φψ)·ρ = (1,−1) = φ·(ψ·ρ)`, `ψ·(φ·ρ) = (2,−1)` | true both directions | none |
| §2.1 `Mod^±(X)` | `ℝ`, `S¹`, two-point discrete space, `S² ⊔ S²` | 2, 2, 2 classes; `S² ⊔ S²`: 8 classes, 2 orientation-preserving, index 4 against 2 for `S²` | holds | none |
| `existsUnique_homeomorph_extension` (§2.2) | `S²` with `P = {N,S}`; `S¹` with two points; `D²` with one boundary point; `P = ∅` | `(θ,s) ↦ (−θ,−s)` extends to rotation by π; `S¹`: `U∖{p}` disconnected, so the hypothesis fails; `D²`: hypothesis holds, extension fixes `p` | true; hypothesis needed | none |
| `existsUnique_ambientIsotopy_extension` (§2.2) | isolated `p`; slice continuity at `(t₀, p)` | isolated `p` excluded (`IsConnected` needs nonempty); `AmbientIsotopy` has only Prop fields beyond the map, so uniqueness holds; cluster set lies in `I × P`, equals `I × {p}` | true | none |
| §2.3 `σ : Mod_{g,n} → Sym(P)` | `(0,3)`, `(0,2)`, `n = 0, 1` | index `6 = 3!`, `2 = 2!`, `1 = 0! = 1!`; LL line 474 gives index `n!` | holds, locator correct | none |
| `exists_outerAction` (§3.3) | `S¹`, torus shear, `[0,1]` | `Out(ℤ) = ℤ/2`, isomorphism; shear ↦ `[[1,0],[1,1]]`; `[0,1]`: `Mod^±` order 2, `π₁ = 1`; LL lines 41–42 natural outer action | true | none |
| §3.1–3.2 conventions | `f = id`, `δ = σ`; push along `α` | `id_σ[γ] = [σ⬝γ⬝σ̄] = conj[σ]⁻¹[γ]`; `f_const = conj[α]`, i.e. `γ ↦ αγα⁻¹` as in MordellLawrenceVenkatesh §5.19 | consistent | none |
| §3.4 `H₂` description (not statable) | torus, sphere, reflection `r` on the `4g`-gon | `det A` on `Λ²ℤ²`, image `SL₂(ℤ)` of index 2; `S²`: `H₂(1) = 0` against `ℤ`; `r`: arc `j ↦ 3−j`, `(4i,t)∼(4i+2,1−t)` goes to `(4j+3,1−t)∼(4j+1,t)` | consistent | none |
| §3.5 non-descent (not statable) | `(0,3)` with `H = S₃`; `(1,0)`; Burnside count | `(12)(23)(12) = (13) ≠ (23)`; `ℤ²`: both sides true; `(36+12+18)/6 = 11` classes | true for every `(g,n)` | R04 |
| §4.1 `Hom(Γ,G)` | `ℤ/2`, `𝔾_m` over `𝔽₂`; `Γ = ℤ`, `GL₂` coaction | `t²−1 = (t−1)²`; `g = diag(λ,1)`: entries `λ⁻¹x₁₂`, `λx₂₁`; Sikora lines 459–468 and 584 match | holds | none |
| §5.1 real datum | `SO(p,q)`, `Res GL_n`, `𝔾_a` | 2 components; `dim_ℝ = 2n²`; `𝔾_a` unipotent, excluded; BCGGO lines 466–472 say real forms may be disconnected | holds | none |
| §5.2 `ℝ`-forms | `(𝔾_m,id)` and `(𝔾_m,inv)`; `ℍ^×`; `z ↦ 2/z̄` | both conjugations are `z ↦ z̄`, unique `α = inv`; `JḡJ⁻¹` fixes `[[a,−b̄],[b,ā]]`; `2/z̄` sends 1 to 2 | true; locator lacks claim | R02 |
| §5.3 realization Check | `SO(2)` conjugated by `u` | image `[[c+s,−2s],[s,c−s]]`; column norms `1+s(2c+s)`, `1+2s(2s−c)` force `s = 0`; `K = {±1}`, `𝔭 = 0` | Check correct | none |
| §5.4 definitions | `GL(V)`, `SO(V)`, unitriangular `N`, irrational line in `T²` | `M = {0}`; `M = V`; `K exp 𝔭 = {1} ≠ N`; non-closed orbit with `M = V`, so closedness is needed | definitions determine the object; same class as LieGroupsPartII §7.1 | R01 |
| `minimalVectors_eq_normMinimizers` | `GL(V)`; `ℝ>0` on `ℝ²` acting by `(λx, λ⁻¹y)` | `d′(0) = 2⟨Av,v⟩` (BL Lemma 5.1); `M = {x² = y²}` equals the norm minimizers on `xy = c` | true | none |
| `isClosed_linearOrbit_iff` | `ℝ>0` on `ℝ`; `(ℝ>0)²` on `ℝ²` with `v = (1,1)` | half-lines not closed and miss `M = {0}`; open quadrant not closed and misses `M = {0}` | true | none |
| `linearOrbit_inter_minimalVectors` | `SO(V)`; branch `xy = 1, x > 0` | `K = G` and `M = V`; branch meets `M` only at `(1,1)` and `K = {1}` | true | none |
| `exists_tendsto_closed_linearOrbit` | `(ℝ>0)²` with `v = (1,1)` | `diag(−1,0)` gives limit `(0,1)`, non-closed orbit; `diag(−1,−1)` gives `0`, closed orbit | true; the closed-orbit clause excludes `diag(−1,0)` | none |
| `existsUnique_closed_linearOrbit` | `SL₂(ℝ)` on `M₂`, `A = [[1,1],[0,1]]` | `[[1,t²],[0,1]] → I`, norm² `2+t⁴ → 2`; only `{I}` is closed in the closure | true | none |
| §6.1 `IsReductiveRep` | `[[1,1],[0,1]]` in `SL₂(ℝ)`; `diag(2,3)` in `GL₂(ℝ)`; torus | `Ad` unipotent and nontrivial; eigenvalues `1, 1, 2/3, 3/2`; `Ad` trivial on torus; BCGGO lines 2708–2711 match | holds | none |
| §6.2 scalar extension | rotation over `ℝ` and `ℂ`; `𝔽_p(s)` example | irreducible over `ℝ`, two characters over `ℂ`; ArithmeticGaloisRepresentations §1.7: `k'⊗k'` nonreduced | holds | none |
| §6.3 `Ad` semisimple iff `Z⁰` reductive | `N(T) ⊂ SL₂`; `O₂` | `Z⁰ = T`, `𝔤` semisimple; `Ad = det`, `ker = SO₂ ≠ {±1}`; BMR line 814 and line 263 match | holds | none |
| §6.4 `G`-cr iff `Z⁰` reductive | `(diag(2,½), u)` in `SL₂`; `𝔾_a` over `𝔽̄_p` | centralizer `{±1}`, orbit dimension 3, limit has centralizer `T` and dimension 2; finitely generated subgroups finite (BMR 302–303) | holds | none |
| §6.5 closed complex orbits | unipotent in `GL_n`; Borel-dense `F₂ → SL₂` | `I` in the closure; limit `(diag(2,½), 1)` outside the orbit; Sikora line 572 and BMR line 510 match | holds | none |
| §6.6 closed real orbits | rotation and `diag(2,½)` in `SL₂(ℝ)` | real and complex orbits both closed; `[[1,1],[0,1]]` has neither | holds | none |
| `isReductiveRep_tfae` (§6.7) | `ρ(a₁) = [[1,1],[0,1]]` on `π₁Σ₂`; `SO(n)`; open `G^ℝ ⊊ 𝐆(ℝ)` | all four fail; all four hold; `exp(X)ρ = k⁻¹w` minimal, so `G^ℝρ` closed iff `𝐆(ℝ)ρ` closed | true | none |
| `characterVariety_t2_locallyCompact_secondCountable` (§7.1) | `ℤ → SL₂(ℝ)`; `U(1)`; free group of countable rank into `ℝ^×` | naive quotient not T2, `𝒳` is T2; `U(1)^{2g}`; `(ℝ^×)^ℕ` not locally compact, so `Group.FG` is needed; BCGGO line 2712 matches | true | none |
| `characterVariety_universalHausdorffQuotient` (§7.2) | `Γ = ℤ`, `GL_n`; unipotent against `I` | continuous invariant `F` gives `q(u) = q(I)`; `𝒳` is the semisimple classes, `𝔸^{n−1} × 𝔾_m` | true; Sikora §11 does not state it | R03 |
| `exists_outAction_characterVariety` (§7.4) | `ℤ` with `SO(2)`; `𝔾_a` with `ℤ`; `F₂` with `SL₂(ℂ)` | `[g] ↦ [g⁻¹]` is conjugation, fixed points `±1`; `x ↦ −x`; `(2,2,3) ↦ (2,3,4)`, `κ = 3` on both | true | none |
| §7.1 `M/K`, §7.2 `//G`, §7.4 `Mod` (not statable) | pinned Tau Ceti searched | no Zariski closure, no `G`-cr of subgroups, no representation algebra, no topological orientation at the pins | docstring right except R04 | none |
| §7.5 trace coordinates | `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `(2,2,3)`, `κ = 4+4+9−12−2 = 3`; Vieta move gives `(2,2,1)`, `κ = 3`; `(A, AB)` gives `(2,3,4)`, `κ = 3` | agrees with NonabelianLevelStructures §5.2 | none |

- Source locators checked against the text: 5 in LandesmanLitt2024, 7 in BCGGO2024, 12 in Sikora2012, 10 in BateMartinRohrle2005 and 22 in BohmLafuente2021. 2 are wrong (R02, R03).
- Library declarations: 15 Mathlib and 44 Tau Ceti names cited by the README were checked with `#check` at the pins, with 0 errors. Among them are `TauCeti.AmbientIsotopy` (`Topology/Homotopy/Isotopy/Basic.lean:163`, Prop fields only), `TauCeti.isotopic_iff_ambientIsotopic` (`Isotopy/Compact.lean:123`), `TauCeti.ComoduleAlgebra.finiteType_coinvariants` (`ComoduleAlgebra/LinearlyReductive.lean:148`) and `TauCeti.reductiveCommHopfAlgProperty.of_injective` (`Reductive/Image.lean:44`).
- Cross-roadmap citations resolved: 7 at open heads (MordellLawrenceVenkatesh, TeichmullerGeometry, MappingClassGroupsAndCanonicalRepresentations, NonabelianLevelStructures, ArithmeticGaloisRepresentations, LanglandsParameterStacks, RealSemisimpleLieGroups) and 10 on main. All 17 TeichmullerGeometry Lean names exist in its `Suggested.lean`.
- Gate: every check passes. The dependency check reports `depcheck: 242 roadmaps, 2267 edges, 0 problem(s)`. Elaboration gives only `sorry` warnings (13 theorems). `#check @` of all 24 declarations matches the README statements, with no lost binders.
- One-tactic probe: none of the 13 sorried theorems closes with `rfl`, `infer_instance`, `simp`, `decide` or `aesop`.
- Declared gaps: 3, with slugs matching `design/plan.json`. None is provided by ReductiveGroups or the pinned Tau Ceti (no Borel–Tits, no `ker Ad`, no `G`-cr theorem).
- Overlap check: read MappingClassGroupsAndCanonicalRepresentations, TeichmullerGeometry, LieGroupsPartII, GroupActionsOnRiemannSurfaces, MordellLawrenceVenkatesh, ReductiveGroups, AdelicAlgebraicGroups and GeometricTopology. `R_r(Γ)` and `M_r(Γ)` belong to MappingClassGroupsAndCanonicalRepresentations §1.4 (named as the `GL_r` case). The `PMod` outer action belongs to its §0.2, the covering action to MordellLawrenceVenkatesh §5.9, DNB and `OuterAut` to TeichmullerGeometry §§5.4 and 4.2, all cited. Self-adjoint linear groups belong to LieGroupsPartII §7.1, uncited (R01).
- Source independence: 15 sampled locators plus the whole README and Lean prose were compared with 5 sources. The longest shared runs are 9-word mathematical phrases and bibliography titles. The largest share is BohmLafuente2021, 22 of about 89 locators, all in §§5.3–5.4. Contents compared with BohmLafuente2021 (§§1–7, App. A): independent.

## Not verifiable

- FarbMargalit2012 (waived): Ch. 1 §§1.1, 1.4; Ch. 2 §§2.1, 2.2; Ch. 4 §4.2; Ch. 8 §8.1. These are the locators of sampled targets 1.1, 2.1, 2.3 and 3.3.
- RichardsonSlodowy1990 (waived): §4 (5.4), §7 (sampled target 6.6), §§4, 9 (sampled target 7.1).
- Knapp2002 (waived): Ch. VI §§1–2 (sampled targets 5.1, 5.2).
- Richardson1988 (uncertified): Theorem 3.6 (sampled target 6.5).
- Goldman1984 (uncertified): §1 (sampled target 7.1).

## Source issues

- **Misprint** in Sikora2012 at §11, line 836 (also lines 141 and 882): the source cites "Proposition 30" for the closed-orbit criterion; it should be Theorem 30 (line 572); affects nothing.

## For the human reviewers

- Not tested: FarbMargalit2012 (11 locators), RichardsonSlodowy1990 (4), Knapp2002 (2), Richardson1988 (1) and Goldman1984 (1) could not be read (waived or uncertified). Wording and arrangement were not compared against them.

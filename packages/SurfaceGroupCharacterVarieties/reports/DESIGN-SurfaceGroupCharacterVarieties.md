# DESIGN-SurfaceGroupCharacterVarieties

Design of `SurfaceGroupCharacterVarieties`: `packages/SurfaceGroupCharacterVarieties/design/README.md`
(README in TauCetiRoadmap form), `packages/SurfaceGroupCharacterVarieties/design/plan.json` (33 targets in
7 layers, 3 gaps), `packages/SurfaceGroupCharacterVarieties/sources.toml` (10 sources). Pins: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

## What the design covers

| Layer | Targets | Content |
|---|---|---|
| 1 | 1.1–1.3 | `Out(Γ)` of an arbitrary group (with the comparison to Tau Ceti's `TauCeti.ContinuousOut` for the discrete topology), `Rep(Γ, H) = Hom(Γ, H)/H`, the left action `[φ]·[ρ] = [ρ ∘ φ⁻¹]`, and the theorem that `Inn(Γ)` acts trivially on `Hom(Γ, H)` iff every homomorphism has abelian image. |
| 2 | 2.1–2.6 | `Mod^±(X)` for any space via Tau Ceti ambient isotopies (normality, path components in the two-sided compact-open topology); the puncture/marked-point extension theorem with isotopy extension; the permutation map, its surjectivity and `PMod` of index `n!`; `S⁺(g, n) ≃ π₁(Σ_g ∖ P)` for all `n ≥ 0`; the pure Birman sequence; changes of model. |
| 3 | 3.1–3.5 | `f_δ` and its laws, homotopy invariance and the inner-automorphism lemma, `Ψ_x` with basepoint canonicity and the based lift on `Mod(S*)`, comparison with TeichmullerGeometry's closed smooth `Mod±` and surjectivity of `Ψ` for closed surfaces, the action on conjugacy classes of representations with the PMod/Mod finite-orbit equivalence and the non-lifting statement. |
| 4 | 4.1–4.3 | The representation scheme `Hom(Γ, G)` over any commutative ring, its real and complex topologies, surface-group instances. |
| 5 | 5.1–5.4 | Real reductive data `(𝐆, G^ℝ)` with `G^ℝ` an open subgroup of `𝐆(ℝ)` (covers `SO(p,q)`, `PSL₂(ℝ) = PGL₂(ℝ)⁰`, complex groups via `Res_{ℂ/ℝ}`), the real-form bridge from antiholomorphic involutions, Cartan-compatible realizations of the conjugation action, the real Kempf–Ness theorem. |
| 6 | 6.1–6.7 | Reductive representations and the six-way equivalence (a)–(f) with consequences (compact image, Zariski-dense reductive, `G`-irreducible, finite centralizer for reductive `ρ`, `GL_r`). |
| 7 | 7.1–7.5 | `𝒳(Γ, G^ℝ)`: homeomorphic to minimal vectors mod `K`, Hausdorff, locally compact, second countable; `Hom(Γ, G)//G` over characteristic-zero fields and the complex comparison with the universal Hausdorff quotient property; functoriality; the `Out(Γ)`/`Mod_{g,n}` action and basepoint independence; computed examples. |

All nine final targets of `target.md` are covered except as recorded under "Departures from the target".

## Departures from the target, with reasons

1. **SurfaceTopology and PlanarTopology are never-cite roadmaps** in this brief. The target routed the
   compact mapping class groups, base cases, the PL/smooth comparison and Epstein's theorem to them. The
   design cites none of them: base cases are Checks with FarbMargalit2012 and MordellLawrenceVenkatesh
   locators, and the statements that genuinely need the TOP/smooth comparison are left out (item 2).
2. **Smooth punctured model (target 2, first half) and punctured Dehn–Nielsen–Baer (target 5)** are not
   planned here. Both need the TOP/PL/smooth isotopy comparison and Epstein's theorem, owned only by the
   never-cite roadmaps, and both extend TeichmullerGeometry's closed smooth theory in its own direction.
   Proposed as **TeichmullerGeometry, Part II** (below). What is kept: §3.4 proves surjectivity of
   `Ψ : Mod^±(Σ) → Out(π₁(Σ, x))` for closed surfaces from TeichmullerGeometry §5.2, and compares `Ψ`
   with TeichmullerGeometry's smooth map; smooth injectivity stays TeichmullerGeometry §5.4.
3. **False claim corrected (target 7):** "every `ρ` whose centralizer is finite modulo the centre is
   reductive" is false. A representation of `F₂` into `SL₂(ℂ)` with image Zariski dense in the Borel
   subgroup (`ρ(a) = diag(2, 1/2)`, `ρ(b) = [[1,1],[0,1]]`) has centralizer `{±1} = Z(SL₂)` and is not
   completely reducible. The design states the correct form (for reductive `ρ`, `G`-irreducible iff
   finite centralizer modulo the centre: BateMartinRohrle2005 Proposition 2.13, Sikora2012 Corollary 17)
   and records the Borel example as a negative Check in §§6.4, 6.7.
4. **Universal Hausdorff quotient (target 8)** is stated for complex groups only (§7.2). For real `G^ℝ`
   the design proves that `𝒳` is homeomorphic to minimal vectors modulo `K`, hence Hausdorff, locally
   compact and second countable, and that invariant maps from `Hom^red` factor (§7.1). Continuity of the
   closed-orbit map on all of `Hom(Γ, G^ℝ)` in the real case is not proved by the readable source
   (BohmLafuente2021) and RichardsonSlodowy1990 is unreadable (waived); the design does not assert it.
5. **Representation scheme and `Hom(Γ, G)//G`.** The target treated "HodgeStructuresPartII H.1" as the
   owner of the `GL_r` representation scheme and its quotient. No roadmap of that name exists on main, in
   an open pull request, in the board index or in the merge order. No other roadmap plans the
   representation scheme of a finitely generated group, so §4.1 owns it (any commutative base ring) and
   §7.2 owns the characteristic-zero affine quotient, reduced to ArithmeticGaloisRepresentations §1.11's
   quotient of the integral `G^S` by the surjectivity of invariants
   (`TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive`).
6. **ArithmeticGaloisRepresentations locator.** The target cited §1.7 for "Reductive quotients over fields
   and DVRs" and "Complete reducibility and closed tuples"; at the head of that roadmap both paragraphs
   are in §1.11 (§1.7 is semisimplification). The design cites §1.11 for them and §1.7 only for
   scalar extension of semisimplicity.
7. **LieGroups and LieGroupsPartII.** LieGroups is on main (nested at `TauCetiRoadmap/RepresentationTheory/LieGroups`)
   and is cited as on main (Layers 7, 9); its open revision is not a dependency. LieGroupsPartII is a board
   design not in the merge order and is not cited; conjugacy of Cartan involutions comes from
   ArithmeticLocallySymmetricSpaces §ALS.0.1.
8. **Real forms.** The target wanted real forms defined by antiholomorphic involutions with a bridge
   theorem. The design takes the algebraic datum `(𝐆, G^ℝ)` as primary (it is the setting of the
   closed-orbit theory) and proves the bridge (§5.2): every antiholomorphic involution of a connected
   complex reductive group is the conjugation of a unique `ℝ`-structure, so nothing is lost; `G^ℝ` may be
   disconnected or an identity component, never restricted to semisimple, connected or split.
9. **Generality.** Layers 4–7 are stated for an arbitrary finitely generated `Γ`; surfaces are instances.
10. **Consumers.** TopologicalMirrorSymmetryForHitchinSystems was named as a consumer, but its README
    has no Betti moduli or character variety (it uses Betti numbers of Higgs moduli); it is not listed.
    InstantonFloerTheory and GaugeQuiltFieldTheory use twisted `SU(r)` relation sets with central
    curvature, not the untwisted character variety; they are not listed.

## Notions moved down from later roadmaps

None. The representation scheme and character variety were cited by the later
MappingClassGroupsAndCanonicalRepresentations (merge order 289) to a nonexistent HodgeStructuresPartII
H.1; this roadmap now owns them, and that design should cite §§4.1, 7.2 here (and §§2.3–2.5 for its R1
request on the pure group, the pure Birman sequence and free bases of punctured surface groups).

## Ownership against open work

Checked by object with `roadmaps grep` against main and all 478 open roadmap pull-request heads:

- `Out` of a group: FiniteGroupInvariants §3.1 (finite groups only, with a finiteness binder);
  InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 (`Out(F_r)` on exterior epimorphisms to finite
  groups); Completed/ProfiniteArithmetic and Tau Ceti's `TauCeti.ContinuousOut` (topological groups). The
  abstract `Out(Γ)` is defined here as the discrete specialization of `TauCeti.ContinuousOut`, with the
  comparison isomorphism as API; the general action on `Hom(Γ, H)/H` is owned nowhere else.
- Mapping class groups: MordellLawrenceVenkatesh LV.5 (punctured, boundary), TeichmullerGeometry §3.1
  (closed smooth). This roadmap defines no fourth mapping class group: `Mod_{g,n}` is LV.5's, and §2.1's
  `Mod^±(X)` is the general isotopy quotient of which LV.5's group is the orientation-preserving case;
  the comparisons are the targets. LV.5 node ids are cited unchanged.
- Representation schemes, character varieties, Kempf–Ness: no owner (TensorProductCombinatorics §7.3
  has only a projective Kempf–Ness direction for flag products; LanglandsParameterStacks consumes the
  ArithmeticGaloisRepresentations quotient for Weil-group parameters).
- The overlaps tool cannot run on this roadmap (it is in no pull request), and no `scratch/overlaps.md`
  was provided.

## Proposed Part IIs and supplier extensions

- **TeichmullerGeometry, Part II**: the smooth model `Diff⁺(Σ_g, P)/smooth isotopy rel P` of
  `Mod_{g,n}` and its comparison with the topological group, the topological Baer–Epstein theorem for
  punctured surfaces, and the Dehn–Nielsen–Baer theorem for `2g − 2 + n > 0` with the peripheral
  structure (FarbMargalit2012, Ch. 8, §§8.1–8.2).
- **ArithmeticGaloisRepresentations §1.11** (gap `gcr-reductive-identity-component`): `G`-completely
  reducible closed subgroups have reductive identity component.
- **ReductiveGroups Layer 7** (gap `borel-tits`): the Borel–Tits theorem.
- **LieGroups Layer 7** (gap `holomorphic-reps-algebraic`): holomorphic representations of `H(ℂ)` are
  algebraic, `H` connected reductive over `ℂ`.
- A real GIT Part II (owner to be chosen; the Kirwan–Ness stratification and the continuity of the real
  closed-orbit map on all of `Hom(Γ, G^ℝ)`).

## Gaps

| slug | needed by | supplier, section | what is missing |
|---|---|---|---|
| `gcr-reductive-identity-component` | 6.4, 6.7 | ArithmeticGaloisRepresentations §1.11, Complete reducibility and closed tuples | A proof that a `G`-completely reducible closed subgroup of a connected reductive group over an algebraically closed field has reductive identity component. |
| `borel-tits` | 6.4 | ReductiveGroups Layer 7 | The Borel–Tits theorem placing a closed unipotent subgroup and its normalizer in a parabolic whose unipotent radical contains it. |
| `holomorphic-reps-algebraic` | 5.2 | LieGroups Layer 7 | Algebraicity of holomorphic finite-dimensional representations of `H(ℂ)`. |

The implication (c) ⇒ (d) of §6.4 needs no gap: it follows BateMartinRohrle2005 Theorem 3.46 using only
ArithmeticGaloisRepresentations §1.11's closed-tuple criterion and cocharacter limit, characteristic-zero
smooth centralizers (ReductiveGroups Layer 2) and boundary dimensions (ReductiveGroups Layer 3A). The
gaps block only (d) ⇒ (c) and the real-form bridge.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conv: native product, `fundamentalGroupMulEquivOfPath` | wedge of two circles; loop `σ` | `[a]*[b] = [b ⬝ a]`; `Iso.conj` gives `[σ̄ ⬝ γ ⬝ σ] = MulAut.conj [σ] [γ]`; matches LV.5 §5.19's `α*γ*α⁻¹` | consistent with Mathlib source (`mul_def`, `Iso.conj` = `inv ≫ f ≫ hom`) | witness added |
| Conv: commutators | `g = 1, 2` | FreeGroups `x⁻¹y⁻¹xy` vs Teichmüller `aba⁻¹b⁻¹`; `x ↦ x⁻¹` exchanges them; `g = 1` both `AB = BA` | isomorphic schemes | witness added |
| Conv: left action `ρ ∘ φ⁻¹` | `ℤ²`, `φ = [[1,1],[0,1]]`, `ψ = [[1,0],[1,1]]` | `(φψ)·ρ = (1,−1) = φ·(ψ·ρ)`, `ψ·(φ·ρ) = (2,−1)` | left action; order detected | witness added |
| Conv: Cartan realization | `SL₂(ℝ)`, `A = [[1,1],[0,1]]` | `‖diag(t,t⁻¹)A diag(t,t⁻¹)⁻¹‖² = 2 + t⁴ → 2 = ‖I‖²` | closure point outside orbit | witness added |
| 1.1 `Out(Γ)` | `ℤ`, `S₃`, `Q₈`, `1`, `ℤ²` | 2; 1 (`|MulAut S₃| = 6 = |S₃/Z|`); `24/4 = 6`; 1; `GL₂(ℤ)` with `diag(1,−1)` nontrivial | correct; normality from `φ c_g φ⁻¹ = c_{φ g}` | none |
| 1.2 `Rep(Γ,H)` | `(ℤ,S₃)`, `(Γ,1)`, `(ℤ/2,GL₂(ℂ))` | 3 vs 6 homs; 1; 3 vs infinitely many | correct | garbled Check rewritten |
| 1.3 action, non-descent iff | `Γ` trivial; `H` abelian; `Γ = H = F₂`, `ρ = id` | trivial; trivial; `c_a·id = c_{a⁻¹} ≠ id` | iff verified both ways (`c_γ·ρ = ρ` ⇔ `ρ(γ)` central in `ρ(Γ)`) | none |
| 2.1 `Homeo₀`, path components | `ℝ`, two points, point, `S¹`, `∅` | `|Mod^±| = 2, 2, 1, 2, 1` | two-sided compact-open topology needed for inverse continuity; exponential law needs local compactness | hypothesis "locally compact Hausdorff" stated |
| 2.2 extension | `S²∖{N,S}`; `S¹∖{p,q}`; `P = ∅` | end swap extends to rotation by `π`; arc-flip map sends ends at `p` to ends at `p` and `q`, no extension; identity | hypothesis on connected punctured neighbourhoods is necessary | nested-continua lemma proved inline (Mathlib has none at the pin) |
| 2.3 permutation, index `n!` | `n = 0,1`; `(0,2)`; `(0,3)` | index 1,1; 2; 6 | surjectivity by three point moves `q→r, p→q, r→p`: composite sends `p↦q`, `q↦p` | none |
| 2.4 presentation | `(1,0)`, `(0,3)`, `(0,0)`, `(0,1)`, `(1,1)` | `ℤ²`; `F₂`, `p₃ = (p₁p₂)⁻¹`; 1; 1; `F₂` (not `ℤ²`) | correct | orientation of puncture loops fixed |
| 2.5 pure Birman | `(0,3)`, `(1,1)`, `(1,0)`, `(0,2)` | `PMod_{0,4} ≅ F₂`; `F₂ → PMod_{1,2} → SL₂(ℤ)`; Push trivial; `ℤ → 1` | hypothesis `2g−2+n > 0` necessary | `Mod_{1,1} ≅ SL₂(ℤ)` relocated to FarbMargalit2012 (LV.5 §5.22 is the closed torus) |
| 2.6 change of model | `e = id`; `e` a transposition on `Σ_{0,3}`; `e = diag(1,−1)` on `T²` | identity; conjugation in `S₃`; outer automorphism of `SL₂(ℤ)` | inner only for orientation-preserving `e` | hypothesis "orientation-preserving" stated |
| 3.1 `f_δ` laws | `f = id`, `δ = σ`; change of path `const → σ`; composition; inverse | `id_σ = MulAut.conj [σ]⁻¹`; law gives `MulAut.conj [const ⬝ σ̄] = MulAut.conj [σ]⁻¹`; `(fg)_{δ⬝fε} = f_δ g_ε` by expanding paths; `f_δ (f⁻¹)_{…} = id_{δ⬝δ̄} = 1` | all laws consistent | none |
| 3.2 homotopy invariance | naturality square of `homotopicMapsNatIso`; point push | `g_{δ⬝η}(γ) = δ η gγ η̄ δ̄ = δ fγ δ̄`; push gives `MulAut.conj [α]` = LV.5 §5.19 | correct; sign checked | declaration name corrected to `FundamentalGroupoidFunctor.homotopicMapsNatIso` |
| 3.3 `Ψ` | `S¹`; `T²` shear; `[0,1]` | iso onto `ℤ/2`; `[[1,1],[0,1]]`; trivial `π₁`, flip nontrivial | non-injectivity Check uses an elementary space | `ℝ²` example (needs Kneser) replaced by `[0,1]` |
| 3.4 closed surjectivity | `T²`, `S²`, genus 2 | `GL₂(ℤ)`; `Out(1) = 1`, antipode nontrivial; hyperelliptic ↦ `−1` | surjective, not injective in general | sphere Check reduced to nontriviality |
| 3.5 action on classes | finite image; genus-2 unipotent; abelian `H` | finite orbit; infinitely many lines `ℂf` under `Sp₄(ℤ)`; action through `H₁` | correct | none |
| 4.1 representation scheme | `ℤ`, `F_m`, `1`, `ℤ/2` over `𝔽₂`, `ℤ²` | `G`, `G^m`, point, `Spec 𝔽₂[t]/(t−1)²` (nonreduced), commuting pairs | finitely generated suffices (no finite presentation needed) | none |
| 4.2 topologies | `Hom(ℤ, GL₁(ℝ))`, `Hom(ℤ/2, SO(2))`, `Hom(F₂, G(ℂ))` | two components; `{±1}`; product topology | `Hom(Γ, G^ℝ)` open-closed since `G^ℝ` open of finite index | none |
| 4.3 surface instances | `(1,0)`, `(0,3)`, `(0,0)`, `(1,1)` | commuting variety; `G²`; point; `G²` | correct | none |
| 5.1 real data | `SO(p,q)`, `PGL₂`, `Res GL_n`, `Spin`-cover, `𝔾_a` | 2 components; `PSL₂(ℝ)` = identity component; `dim_ℝ 𝔤^ℝ = 2n²`; excluded; excluded | open subgroups are transpose-stable (`gᵀ = exp(X) k⁻¹` with `k ∈ G^ℝ`) | none |
| 5.2 bridge | `GL_n` with `ḡ`, `(ḡᵀ)⁻¹`; `GL₂` with `J ḡ J⁻¹`; holomorphic `(gᵀ)⁻¹` | `GL_n(ℝ)`, `U(n)`, `ℍ^×` (`[[a,−b̄],[b,ā]]`), `O_n(ℂ)` complex | correct | gap recorded for algebraicity |
| 5.3 realization | `SL₂(ℝ)`; `GL₁(ℝ)` scaling; non-orthogonal conjugate embedding | `K = SO(2)`, minimal = normal; `M = {0}`; `SO(2)` not in `O(2)` | `exp(S) ∈ 𝐆(ℝ) ⇒ exp(tS) ∈ 𝐆(ℝ)` via real exponential polynomials vanishing on `ℤ` | none |
| 5.4 real Kempf–Ness | `ℝ_{>0}` weights `(1,−1)`; `SL_n` conjugation; scaling on `ℝ`; compact `G` | `M = {|x|=|y|}`; closed iff diagonalizable; `M = {0}`, `α = −1`; `M = V` | matches BohmLafuente2021 Thm 1.1 | garbled third Check rewritten |
| 6.1 reductive | trivial; unipotent `SL₂(ℝ)`; `diag(2,3)` in `GL₂(ℝ)`; torus | reductive; not (Ad unipotent); eigenvalues `1,1,2/3,3/2`, reductive; all reductive | correct | garbled Check rewritten |
| 6.2 scalar extension | rotation; unipotent; `𝔽_p(s)` | semisimple both; neither; converse fails | descent via `rad(B) ⊗ k' ⊆ rad(B ⊗ k')` valid for any extension | none |
| 6.3 Ad semisimple ⇔ `Z⁰` reductive | torus; unipotent in `SL₂`; `N(T)` | yes; no; yes (disconnected) | (⇐) needs `ker Ad = Z(G)` multiplicative, connected `G`, char 0 | none |
| 6.4 `G`-cr ⇔ `Z⁰` reductive | binary dihedral in `SL₂`; Borel; `GL(V)` | irreducible ⇒ cr; Borel not cr, `C = {±1}`; semisimple | (c)⇒(d) via BMR 3.46 route, (d)⇒(c) gap | **false target claim removed** (finite centralizer) |
| 6.5 closed complex orbits | `ℤ → GL_n`; torus-valued; Borel-dense `F₂ → SL₂` | closed iff semisimple; closed; `diag(t,t⁻¹)` limit `(diag(2,1/2), 1)` outside orbit | classical ⇒ Zariski via cocharacter limit continuous in classical topology | none |
| 6.6 real ⇔ complex closed | rotation; unipotent; `diag(2,1/2)`; abelian | closed/closed; not/not; closed though not in `K`; points | (⇐) midpoint argument: `exp(τZ/2) u exp(Z/2) ∈ U` from uniqueness of polar decomposition (`exp(A)exp(B)` unitary with `A, B` hermitian forces `B = −A`) | proof written out |
| 6.7 six conditions | genus-2 unipotent; Borel-dense; `SO(n)`; `GL_r(ℂ)` | all fail; centralizer = centre, not reductive; all hold; product of two `GL_r` | `GL_r(ℂ)` needs the product lemma (BMR 2.12(i)) | product route added |
| 7.1 `𝒳` Hausdorff | compact; torus `U(1)`; `ℤ → SL₂(ℝ)` | `Hom/G`; `U(1)^{2g}`; naive quotient non-Hausdorff, `𝒳` = semisimple classes | inverse continuity via `KTK` and `T`-invariant separation verified; proper action of compact `K` | real universal property limited to `Hom^red` |
| 7.2 affine quotient, complex comparison | `ℤ → GL_n`; `F₂ → SL₂`; char 2 `C₂` | char poly `𝔸^{n−1} × 𝔾_m`; `ℂ³` by traces; non-lifting invariants | properness: unit minimal vector with vanishing invariants lies in null cone, contradiction | quotient-map clause added to sketch |
| 7.3 functoriality | `SO(2) ⊆ SL₂(ℝ)`; restriction to `⟨a⟩ ⊂ F₂`; `ℤ ↠ ℤ/2` | continuous map; not reductive; closed subset of order-≤2 classes | arbitrary-subgroup restriction excluded; finite index kept (Schreier finite generation) | none |
| 7.4 outer action | `GL_r(ℂ)` unipotent; `ℤ` on `SO(2)`; Fuchsian locus | orbit outside `𝒳`; conjugation fixes `±1`; Euler `2−2g` vs `2g−2` | discrete faithful ⇒ cocompact for closed `g ≥ 2` (else free `π₁`) | none |
| 7.5 examples | trivial `Γ`; `PSL₂(ℝ)`; `F₂ → SL₂(ℂ)` | point; no parabolic classes; `ℂ³` | consistent with 7.1–7.2 | none |

Context checks: every statement needing characteristic zero (6.3, 6.4, 7.2), finite generation (4.1
finite type, 6.5–6.7, 7.x), local compactness (2.1), connectedness of `𝐆` (6.3's `ker Ad = Z(G)`) or
`2g − 2 + n > 0` (2.5) carries it in its hypotheses. Library-claim checks: Mathlib has no `Out`, no
mapping class group, no topology on `Homeomorph`, no nested-continua connectedness lemma and no
compact-group `ProperSMul` instance at the pin; all were read in the pinned files. Two README names
were corrected after reading the pinned files (`FundamentalGroupoidFunctor.homotopicMapsNatIso`;
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`, a Tau Ceti declaration outside the
`TauCeti` namespace).

## Sources

Readable and used with line locators: LandesmanLitt2024, BCGGO2024, Sikora2012, BateMartinRohrle2005
(fetched for this design, arXiv:math/0408109v2), BohmLafuente2021 (fetched for this design,
arXiv:1701.00643v3; published numbering not checked, recorded in `version_note`). Settled and cited by
locator only: RichardsonSlodowy1990, FarbMargalit2012, Knapp2002 (waived), Goldman1984 (uncertified),
Richardson1988 (cached text is an access-denied page; cited by its locator, the readable
BateMartinRohrle2005 Corollary 3.7 carries the same statement). A first fetch for BateMartinRohrle2005
by a guessed arXiv id resolved to an unrelated paper; that entry was removed from the manifest before
the correct fetch. No text needed by the design is unreadable; no `needs-references.toml` was written.

## Untrusted text

No instruction-like passages were found in the target, the supplier and consumer READMEs, or the
sources.

## Dependency check

Gate command as given in the brief:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2434 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: MordellLawrenceVenkatesh (156), TeichmullerGeometry (285),
ArithmeticGaloisRepresentations (46), ArithmeticLocallySymmetricSpaces (68), ComplexComparisonPartII
(43), and main (ReductiveGroups, ReductiveGroupsPartII, FreeGroupsAndLimitGroups, AlgebraicTopology,
LieGroups, CompactGroups, SymplecticGeometry/HamiltonianReduction). The slot is right after
TeichmullerGeometry and before MappingClassGroupsAndCanonicalRepresentations (289), the first consumer.
No citation depends on an open revision of a roadmap on main.

`roadmaps resolve` on the README: no cross-roadmap citation found nowhere after the source-locator
format fix; no Lean name found nowhere (library names outside TauCetiRoadmap were checked by hand at the
pins).

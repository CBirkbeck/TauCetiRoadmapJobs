<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6851448748 -->
Review (claude) of 1504288

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.1 re-derives the dominant-chamber move and the characteristic, which the pin has

   **Location:** `packages/LieHighestWeightPartII/README.md:381` (§3.1 proof): "The Weyl group, realised in `Int(L)` by Weyl automorphisms, moves the image of `h` into the dominant chamber (RootSystems Layer 4, applied to the real span of the coroots …)" and "since `Int(L)` fixes these (LieHighestWeight Layer 7)"; `:379` (the characteristic); `:440` ("because the simple roots form a basis of `H*`"); `:14` and `:92` (Weyl automorphisms realising the Weyl group, attributed to LieHighestWeight Layer 7).

   **Claim:** these steps are supplied by RootSystems Layer 4 and LieHighestWeight Layer 7.

   **Witness:** the pinned Tau Ceti proves them, over every field of characteristic zero with a splitting Cartan subalgebra:

   - `IsSl2Triple.exists_mem_intLieAlgebra_smul_mem_dominantNeutralElements`, `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Dominant.lean:61`: a triple with neutral element in `H` is carried by some `g ∈ Int(L)` preserving `H` to a triple with dominant neutral element;
   - `TauCeti.exists_mem_intLieAlgebra_forall_smul_eq_coweightEquiv`, `TauCeti/Algebra/Lie/Sl2/Weyl/Cartan.lean:78`: every Weyl group element acts on `H` as an element of `Int(L)`;
   - `RootPairing.Base.dominantNeutralElements`, `RootPairing.Base.weightedDynkinDiagram`, `RootPairing.Base.weightedDynkinDiagram_injective`, `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Finite.lean:47`, `:66`, `:93`: the dominant neutral elements of nonzero triples, their labels in `Fin 3`, and injectivity of the labels (zero is excluded: `zero_notMem_dominantNeutralElements`, `:61`);
   - `TauCeti.SymmetricAlgebra.lift_eval_smul_of_mem_intLieAlgebra`, `TauCeti/Algebra/Lie/AdjointAction/SymmetricInvariants.lean:153`: `Int(L)` fixes every `L`-invariant polynomial function on `L`.

   None of the four is named anywhere in the README.

   **Exact repair** (all in `README.md`):

   1. In the Scope bullet that begins "The integer spectrum of a neutral element" (`:18`), before "Layers 0–3 and §5.2 consume these", add: "every element of the Weyl group of a splitting Cartan subalgebra `H` acts on `H` as an element of `Int(L)` (`TauCeti.exists_mem_intLieAlgebra_forall_smul_eq_coweightEquiv` in `TauCeti/Algebra/Lie/Sl2/Weyl/Cartan.lean`); a nonzero triple with neutral element in `H` is `Int(L)`-conjugate, by an element preserving `H`, to one whose neutral element is dominant (`IsSl2Triple.exists_mem_intLieAlgebra_smul_mem_dominantNeutralElements` in `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Dominant.lean`); the dominant neutral elements of nonzero triples in `H` are determined by their simple-root labels (`RootPairing.Base.dominantNeutralElements`, `RootPairing.Base.weightedDynkinDiagram`, `RootPairing.Base.weightedDynkinDiagram_injective` in `TauCeti/Algebra/Lie/Sl2/WeightedDiagram/Finite.lean`); and `Int(L)` fixes every `L`-invariant polynomial function on `L` (`TauCeti.SymmetricAlgebra.lift_eval_smul_of_mem_intLieAlgebra` in `TauCeti/Algebra/Lie/AdjointAction/SymmetricInvariants.lean`)". State the same four in `### From Tau Ceti`.
   2. In `:14` and `:92`, where LieHighestWeight Layer 7 is credited with "the Weyl automorphisms … realising the Weyl group on a Cartan subalgebra", add that the realisation of the Weyl group in `Int(L)` is consumed from Tau Ceti (the declaration of item 1), as the README already says for `Int(L)` and Cartan conjugacy.
   3. In §3.1 (`:379`), after "form the characteristic of `t`", add: "For a nonzero triple the dominant representative is an element of Tau Ceti's `RootPairing.Base.dominantNeutralElements` and the characteristic is its `RootPairing.Base.weightedDynkinDiagram`; that set excludes `0`, and the zero triple has characteristic `0`."
   4. In the §3.1 proof (`:381`), replace the sentence quoted above by: "`IsSl2Triple.exists_mem_intLieAlgebra_smul_mem_dominantNeutralElements` then carries the image of `h` into the dominant chamber by an element of `Int(L)` preserving `H`." and replace "since `Int(L)` fixes these (LieHighestWeight Layer 7)" by "since `Int(L)` fixes these (`TauCeti.SymmetricAlgebra.lift_eval_smul_of_mem_intLieAlgebra`)". Keep RootSystems Layer 4 for uniqueness inside the chamber and for `−w₀`, and LieHighestWeight Layer 7 for Chevalley restriction (surjectivity onto the `W`-invariants is not at the pin: `TauCeti/Algebra/Lie/Killing/ChevalleyRestriction.lean` proves injectivity and `W`-invariance only).
   5. In §3.4 (`:440`), after "because the simple roots form a basis of `H*`", add "(`RootPairing.Base.weightedDynkinDiagram_injective` for nonzero triples)".
   6. Add the declarations used to the *Needs* lines of §3.1 and §3.4 and to the Dependencies of Layer 3.

   **Repair test:** `L = sl₂`, `H = K·H`, base `{α}`, triple `(−H, F, E)`: `α(−H) = −2`, not dominant. The pinned theorem gives `g ∈ Int(L)` with `g(−H) = H` (the Weyl automorphism), `α(H) = 2`, label `2`, the characteristic the README assigns to the principal triple. Zero triple: `0 ∉ dominantNeutralElements` (`h ≠ 0` fails), so the README's separate zero case stays, as repair item 3 says.

2. **F02** (P3) Jacobson–Morozov and Kostant conjugacy are attributed to NilpotentOrbits N2.1 but are pinned declarations

   **Location:** `README.md:11` ("Its N2.1 owns the Jacobson–Morozov theorem for nonzero ad-nilpotent elements, Kostant's conjugacy of triples with a fixed nilpositive element …"); `:96` (the contract "N2.1: Jacobson–Morozov — every nonzero ad-nilpotent `e` of a finite-dimensional Killing Lie algebra over an algebraically closed field of characteristic zero lies in an `IsSl2Triple h e f`"); `:33` (table row).

   **Claim:** these two theorems are consumed from a roadmap section, over an algebraically closed field.

   **Witness:** `TauCeti.exists_isSl2Triple_of_isNilpotent_ad` (`TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean:87`) and `IsSl2Triple.exists_lieEquiv_apply_eq` (same file, `:228`) prove both for a finite-dimensional Killing Lie algebra over every field of characteristic zero; e.g. `sl(2, ℚ)`, `e = E`, which the contract's hypothesis excludes.

   **Exact repair:**

   1. `:11`: replace "Its N2.1 owns the Jacobson–Morozov theorem for nonzero ad-nilpotent elements, Kostant's conjugacy of triples with a fixed nilpositive element and the algebraic `SL₂`-homomorphism of a triple into `G`." by "The Jacobson–Morozov theorem for nonzero ad-nilpotent elements and Kostant's conjugacy of triples with a fixed nilpositive element are in Tau Ceti over every field of characteristic zero (`TauCeti.exists_isSl2Triple_of_isNilpotent_ad`, `IsSl2Triple.exists_lieEquiv_apply_eq` in `TauCeti/Algebra/Lie/Sl2/JacobsonMorozov.lean`); NilpotentOrbits N2.1 owns the algebraic `SL₂`-homomorphism of a triple into `G`."
   2. `:96`: replace the N2.1 sentence by "N2.1: the algebraic `SL₂`-homomorphism of a triple; Jacobson–Morozov and Kostant's theorem themselves are Tau Ceti's (above)", and record the two declarations under `### From Tau Ceti` with their hypotheses (finite-dimensional, Killing, characteristic zero; the conjugating automorphism fixes `e` and lies in the group generated by `exp(ad y)`, `y ∈ ker(ad e) ∩ [e, L]`, a subgroup of `Int(L)`).
   3. `:33`: "N0 jacobson-morozov, N0 kostant-conjugacy | Tau Ceti `TauCeti.exists_isSl2Triple_of_isNilpotent_ad`, `IsSl2Triple.exists_lieEquiv_apply_eq`; the group-level statements are NilpotentOrbits N2.1; not owned here".

   **Repair test:** `sl(2, ℚ)`, `e = E`: `ad E` is nilpotent and `E ≠ 0`, the pinned theorem returns a triple (`(H, E, F)` is one) with no algebraic closure; the triples `(H, E, F)` and `(H + 2E, E, F − H − E)` share `e = E` (`[E, F − H − E] = H + 2E`, `[H + 2E, E] = 2E`), and `exp(ad(−E))` fixes `E` and sends `H ↦ H + 2E`, `F ↦ F − H − E`; `−E ∈ ker(ad E) ∩ [E, L]`, so it lies in the pinned subgroup.

3. **F03** (P3) §1.2 re-derives the grading of `ker ρ(e)`, a pinned theorem

   **Location:** `README.md:219` (§1.2, third API bullet): "and since `ρ(e)ρ(h) = ρ(h)ρ(e) − 2ρ(e)` makes `ker ρ(e)` stable under `ρ(h)` … the whole kernel is the direct sum of its intersections with the `M_j`, hence `ker ρ(e) ⊆ ⨁_(j ≥ 0) M_j`."

   **Claim:** the statement is derived here from the eigenspace lemmas.

   **Witness:** `IsSl2Triple.ker_toEnd_e_eq_iSup_inf_eigenspace`, `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:258`: on a finite-dimensional module over a field of characteristic zero, `ker ρ(e) = ⨆_(n : ℕ) ker ρ(e) ⊓ M_n`. It is in the file the README already cites three declarations from, and is not named.

   **Exact repair:** in `:219` replace the passage from "and since `ρ(e)ρ(h) = …`" to "hence `ker ρ(e) ⊆ ⨁_(j ≥ 0) M_j`" by: "and the whole kernel is the sum of its intersections with the `M_n`, `n ∈ ℕ` (`IsSl2Triple.ker_toEnd_e_eq_iSup_inf_eigenspace` for a nonzero triple; for the zero triple `ker ρ(e) = M = M_0`), hence `ker ρ(e) ⊆ ⨁_(j ≥ 0) M_j`". Add the declaration to the Scope bullet at `:18`, to `### From Tau Ceti` (`:80`), to the *Needs* line of §1.2 and to the Dependencies of Layer 1.

   **Repair test:** `V(0) ⊕ V(1)`, standard triple (the README's own Check): `ker ρ(e) = span(u, v₊) = (ker ∩ M_0) ⊕ (ker ∩ M_1)`, of dimension `1 + 1`, and `x = u + v₊` lies in it without being an eigenvector, as the Check says. Zero triple on `M`: `ker = M = M_0`.

Three findings, all P3, none blocking. All three are the same defect class (duplication by object: a fact the pinned Tau Ceti proves is re-derived in the README or attributed to a roadmap layer) and all are in `packages/LieHighestWeightPartII/README.md`. `Suggested.lean`, `metadata.toml` and `sources.toml` need no change. The mathematics, the Lean file, the sources and the supplier direction are sound; the evidence is under `## Verified sound`.

## Verified sound

### Previous findings (REV-PKG-LieHighestWeightPartII~6), in order

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P3), "counted with multiplicity" and the three items left to §8.0 | `README.md:612`: "the number of weights `μ` of `τ`, counted with multiplicity, with `2⟨μ, ν⟩ = i` … both sides are `8` at `i = 0`, although that representation has only `7` distinct weights"; "the normalization across residue cardinalities, the relative Weyl group refinement and its Aubert-involution identity" | Repaired. Read against GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 at its open head (the definition "counted with multiplicity, with `2⟨μ,ν⟩ = i`"; its API bullet `L_F(AZ(π)) = L_F(π)`); `README.md:24` lists the same three items. |
| F02 (P3), former numbering N0–N5 | `README.md:26`–`:46`: the sentence and the table "Former label (N0–N5 numbering) / Present location", 17 rows | Repaired. All 28 nodes of `design/plan.json` are covered by a row; every target heading exists (§0.1–§5.5 here; NilpotentOrbits N0 items 2–3, N2 items 1 and 4, N4 on main; ReductiveGroups §10B on main; ReductiveGroupsPartIII §0.3, §0.5 at its open head). The citations of the three citing roadmaps ("N5 positive-real-part", "N5 (highest-weight half-integrality)", "N2, classical-partitions", "§N2", "N0, nilpotent-orbit") resolve through it. R02 touches one row. |

The repaired patterns were searched in the rest of the text: "number of weights" and "adds only" occur nowhere else; no other former label is used.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.1 predicate, characteristic-zero dichotomy | `(0,0,0)`; `(0,E,0)`; `(−H,F,E)`; `sl(2,𝔽₂)`: `(0,E₁₂,0)`, `(0,E₁₂,E₂₁)` | `0=0` thrice; `[0,E]=0≠2E`; `[F,E]=−H`, `[−H,F]=2F`, `[−H,E]=−2E`; in char 2 all brackets and doubles vanish; `[E₁₂,E₂₁]=diag(1,1)≠0` | holds; Checks correct |
| §0.2 rank-one factorisation | `w(c)=x(c)y(−c⁻¹)x(c)` | `[[1,c],[0,1]]·[[1,0],[−c⁻¹,1]]·[[1,c],[0,1]] = [[0,c],[−c⁻¹,0]]`; `w(c)w(1)⁻¹ = diag(c,c⁻¹)` | holds |
| §1.1 restriction | `sl₃` adjoint, `h=diag(1,0,−1)`; zero triple | weights `2,1,1,0,0,−1,−1,−2` → `V(2)⊕2V(1)⊕V(0)`, `3+4+1=8`; `8V(0)` | holds |
| §1.2 `weightFiltration` | `V(1)`; adjoint `sl₂`; `M=0`; decreasing convention | `0,1,1,2` at `−2..1`; `1,1,2,2,3`; all steps `0` with `N=0`; `3,2,2,1,1` | determines its object; wrong convention excluded |
| §1.2 kernel bullet | `V(0)⊕V(1)`, `x=u+v₊` | `ρ(e)x=0`, `ρ(h)x=v₊`, not a multiple of `x`; `x∈M_0⊕M_1` | holds; R03 on its citation |
| `finrank_weightFiltration_eq_iff_exists_intertwiner` | `V(2)` vs `V(1)⊕V(0)`; zero triple on `M` vs trivial `K^(dim M)`; `V(1)⊕V(0)` | `(1,1,2,2,3)` vs `(0,1,2,3,3)`, no intertwiner; one jump `dim M` at `0`, any iso intertwines; `m_1=1`, `m_0=1` (cumulative misreading gives `2−3<0`) | both directions hold |
| §1.4 tensor and dual | `V(1)⊗V(1)`; `V(1)*`, `i=−1,0`; unit | graded `1,2,1`, cumulative `1,1,3,3,4`; `Ann(W_0)=Ann(Kv₋₁)` a line, `Ann(W₋₁)=M*`; wrong shift gives `Ann(M)=0`; unit `0` for `i<0`, `K` for `i≥0` | `−i−1` correct |
| §2.0 types and dimensions | `r=1,2,3,4`; `so(2)` | `so(3),sp(2)`: 2 roots, dim 3; `so(4)`: roots split `±(ε₁−ε₂)`, `±(ε₁+ε₂)`; `B₂`: 8 roots, dim 10; `D₃`: 12, dim 15; `r=4`: `28=4+24`, `36=4+32`, `36`; `so(2)` Killing matrix `[0]` | holds; rank ranges equal `TauCeti.DynkinType.Valid` (`A≥1,B≥2,C≥3,D≥4`) |
| §2.1 `β_n` | `f`- and `e`-invariance; determinant; `V(2)` as adjoint | `(−1)^(j+1)+(−1)^j=0`; both `e`-terms carry `j(n−j+1)` at `k=n−j+1`, signs `(−1)^(j−1)`, `(−1)^j`; `det = (−1)^(n(n+1)/2)·(−1)^(n(n+1)/2) = 1`; `w=(E,−H,−2F)`, trace form `−2,2,−2` = `−2β_2`; rescaling `c⁻²` | holds |
| §2.2 parity and splitting | `sp(4)`: `(3,1)`, `(2,2)`; `so(8)`; `so(4)`; `so(3)`; `V=0` | odd parts of multiplicity 1 excluded; `(4,4)`, `(2⁴)` very even; `(t,0)`: `V(1)⊗K²=2V(1)` → `(2,2)`, diagonal → `(3,1)`; `(2,1)` excluded; reflection on `U_n` has determinant `(−1)^(n+1)`; `O(0)=SO(0)` | holds, `dim V>0` needed |
| §2.3 half-spin maxima | `a=(3,3,1,1)`, `(1,1,1,1)` | `A=4`, `A−a_r=3`; `2`, `1`; with minus at `i<r` and `r`: `A−a_i ≤ A−a_r`; CH ascending coordinates: `(1,1,3,3)·(ε₂−ε₃)=−2` | separates |
| `…_sl`, `…_sp`, `…_so`, `…_typeD` | `n=0,1,2`; `so(4)` `(2,2)`, `(3,1)`; `so(8)` `(4,4)`; `ι` of size `0,1,2,3` | `n=0`: kernel `⊥`, `hker` false; `n=1,2`: zero triple only; `(2,2)`: eigenvalues `±1,±1`, kernel `0`; `(3,1)`: kernel 2-dimensional; `|ι|=2`: `S⁺` is `V(1)` of one factor, `(t,0)` acts by `±1`, `(0,t)` by `0,0`; `|ι|=3`: no very even partition of 6 | `hker` excludes exactly the very even case; type `D` statement covers it |
| §3.1 necessary conditions | `E₆`; `G₂ (2,0)`; `−w₀` argument | `3⁴=81` of `729` fixed; profile `4,0,2,0,1,0,2`, `d_4=1<d_6=2`; `−h` has dominant representative `−w₀a`, equal to `a` by uniqueness | holds; R01 on citations |
| §3.2–§3.3 profiles (own script from the Cartan matrices, reflections `c ↦ c − (Σ c_i A_ij)α_j`) | all of `{0,1,2}^r`, five types | roots `12,48,72,126,240`; `θ=(3,2)`, `(2,3,4,2)`, `(1,2,2,3,2,1)`, `(2,2,3,4,3,2,1)`, `(2,3,4,6,5,4,3,2)`; `2ht(θ)=10,22,22,34,58`; `|C_T|=7,28,34,274,245` with as many distinct profiles; `E₆` without opposition `212` vectors, `123` profiles, `(1,0,0,0,0,0)` and `(0,0,0,0,0,1)` equal; `C_(G₂)={(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,2)}` | every README value confirmed |
| §3.2, §3.5 individual profiles | `G₂`: `(2,2)`, `(0,1)`, `(1,0)`, `(0,2)`, `(−1,0)`; `F₄`: `(2,2,2,2)`, `(1,0,0,0)`, `(0,0,0,1)`; `E₈` principal | `2,0,2,0,1,0,1,0,1,0,1`; `4,4,1`; `4,2,1,2`; `4,0,4,0,1`; `4,2,1,2`; `4,0,4,0,3,0,3,0,3,0,3,0,2,0,2,0,1,0,1,0,1,0,1`, `F_0=28`; `22,14,1`; `22,8,7`; `E₈` even degrees `8,8,7,7,7,7,7,7,6,6,6,6,5,5,4,4,4,4,3,3,2,2,2,2,1,1,1,1,1,1`, `i_max=58`, odd degrees `0` | equal to CH lines 1737, 1814, 1827, 1828, 1832–1836 |
| `…_adjoint_exceptional` | `G₂` five classes; Layer 3 example | profiles pairwise distinct; `(0,2)`: `1,0,4,0,4,0,4,0,1`, cumulative `1,1,5,5,9,9,13,13,14`; `(1,0)`: `2,1,2,4,2,1,2`; differ at `i=−4` (`1` vs `0`) | holds |
| `exists_innerAut_iff_finrank_weightFiltration` | `sl₂×sl₂`: `(t,0)`, `(0,t)`; `L=0`; `sl₃` | adjoint weights `2,0,−2,0,0,0` for both; first standard pullback `±1` vs `0,0`; trivial; standard jumps `3@0`, `1@−1,0,1`, `1@−2,0,2` | pullbacks needed, as stated |
| §5.1 | `A₁`, `ν(α)=½`; `ν(α)=⅓`; `Q=0` | `ν(±ω)=±¼`, `ν(α)=½`; `ν(0)=0`, `ν(α)=⅓∉½ℤ`; trivial | holds; hypothesis needed |
| `forall_weight_halfIntegral_iff_highestWeight` | Verma `λ(H)=−2`, `−1`; `K=ℚ`, `λ=−ω/2`, `ν(aω)=a/2`; `V(1)⊕V(0)`; `V(3)`, `ν(α)=⅓` | raising coefficients `k(λ(H)−k+1)`: `−k(k+1)`, `−k²`, `−k(k−½)`, all nonzero for `k≥1`; weights `ν=−(k+1)/2` vs `ν(λ)=−½` (T⇔T); `−¼−k/2` vs `−¼` (F⇔F); `−¼−k` vs `−¼` (F⇔F); right side `0∈ℤ`, left fails at `±¼`; `2ν(3ω)=1`, `2ν(ω)=⅓` | holds; irreducibility and root hypothesis needed |
| `weightPattern`, `IsGeometricPoint` | `diag(2,½)` at `q=4,16,3`; Jordan block at `√q`; zero space; `q=1` | `2=4^(1/2)`: pattern 1 at `±1`; `diag(4,¼)` at 16 the same; traces `5/2`, `17/4`; `q=3`: `2^k=3^(i/2)` only for `k=i=0`; `dim ker=1`; zero function; at `q=1` every `i` counts a unit eigenvalue | definitions determine their object at semisimple points; `1<q` needed |
| `IsPositiveRealPart` | `G_m`, `s=2i`; unipotent `u` | `r(t)=2`, `r(t⁻¹)=½`; `r=u` and `r=1` both satisfy it | pins `r` only at semisimple points, as stated |
| `exists_conj_positiveRealPart_of_weightPattern_eq` | `SL₂`: `diag(i,−i)`, `1`; `G_m`, `q=4`: `2i`, `2`; `2`, `½`; `q=3`: `diag(2,½)`, `diag(5,⅕)` | patterns `2δ₀` both, `r=r'=1`; `|(2i)^k|=2^k=4^(k/2)`, both `δ_k`, `r=r'=2`; `δ_k` vs `δ_(−k)`; equal patterns, parts not conjugate (non-geometric) | holds; geometricity needed |
| Bridge `n_(ν,τ)(i) = weightPattern q (τ(q^ν)) i` | adjoint `SL₃`, `ν=0`; adjoint `SL₂`, `ν=(½,−½)`, `q=4`; standard, `ν=(¼,−¼)` | `6+2=8` vs `8`; `1,1,1` at `2,0,−2`, eigenvalues `4,1,¼`; pairings `±½`, both sides `0` | holds |

### Sources: the seeded sample (15 targets) against the cached texts

| Target | Locator read | Result |
|---|---|---|
| 0.1 | CH §2.1, relations (2.1), p.6, CH lines 277–279 | the three relations as stated; the zero triple is the README's addition. |
| 1.1 | CH proof of Lemma 10.9, p.35, CH line 1707 | span of the triple as `sl(2)`; zero case is the README's own. |
| 1.2, 1.4 | CH Definition 2.2, p.6, CH lines 288–294 | increasing filtration, symmetric monoidal functor, the two `SL(2)`-type conditions. |
| 2.0 | KIR Appendix C, KIR lines 4760 (p.124), 4835 (p.125), 4888 (p.127), 4958 (p.128); Theorem 6.33, p.75, KIR line 2919 | root systems of `A`, `B`, `C`, `D`; semisimplicity with `n>2` for `so(n)`. |
| 2.2 | CH lines 1709–1715, p.35 | partition classification cited there. |
| 3.1 | SOM §3.1, p.15, SOM lines 366–373; DG §2, p.3, DG lines 86–87 | dominant representative, labels in `{0,1,2}`. |
| 3.3 | CH lines 1728–1733, p.35 | adjoint separation asserted by computation. |
| 3.5 | CH Tables 2–4, CH lines 1734–1837; DG Appendix A, DG line 262, Tables 2, 3, 6 at DG lines 275, 284, 530 | rows equal to computed profiles (table above). The header line 1734 is the last line of p.35; all rows are on pp.36–37, as cited. |
| 4.1 | CH Lemma 2.4, p.6, CH line 296; Lemma 10.9, p.35, CH line 1701 | statements as cited. |
| 5.1, 5.2 | CH Lemma 6.30 and proof, p.24, CH lines 1158–1171 | finite-dimensional statement; the proof uses root half-integrality only. |
| 5.3 | CH §10.1, p.32, CH line 1550; Definition 2.5, p.7, CH lines 323–329 | weight pattern; absolute value `q^(w/2)`. |
| 5.4, 5.5 | CH Proposition 10.2 and proof, p.32, CH lines 1554–1565 | trace formula and Weyl conjugacy. |

Also read: DG Lemmas 2–3, p.4, DG lines 139–153; KIR Theorem 5.6, (5.4), p.61, KIR lines 2369–2375 (`w_j = j! v_j`, `e w_j = j(n−j+1) w_(j−1)` recomputed). No author-flagged unverified locator exists. All four cited works are in `sources.toml`, each once, with no local path. Nothing was fetched; the manifest is unchanged.

### Lean file

- `lake env lean` on `packages/LieHighestWeightPartII/Suggested.lean` from the content checkout: exit 0, exactly nine `declaration uses sorry` warnings (lines 78, 95, 109, 126, 149, 176, 196, 215, 264), nothing else. All six `TauCeti.*` imports had object files.
- One-tactic probe on a scratch copy, every one of the nine sorried theorems with `simp`, `rfl`, `infer_instance`, `exact Iff.rfl`, `tauto`, `trivial`, `simp_all` and an `exact` with the identity witness (`1 ∈ Int(L)`, the identity equivalence, `g = 1`), each inside `fail_if_success (solve | …)`: none closes a goal (the identity witness on the last theorem ends in a heartbeat timeout, not a proof). No padding.
- `#check @name` for the five definitions and the 14 signatures of `scratch/signatures.md` read against the README: no binder lost; generality equal to the README's (§5.2: characteristic zero, Killing, finite-dimensional `L`, splitting Cartan, no algebraic closure, `M` arbitrary; §5.5: `1 < q`, reductivity, both semisimplicity and both geometricity hypotheses).
- Headlines of the Summary: restricted-module recovery (78); types `A`, `C`, `B`/`D` with an odd part, full `D` (95, 109, 126, 149); exceptional adjoint (176); semisimple recognition (196); half-integrality (215); positive real part (264). Two are named in the module docstring as not statable, each with its missing carrier. None is absent or forced through a stand-in.
- One `import Mathlib`, six used `TauCeti.*` modules, five definitions with real bodies, no `set_option`, no `lemma`, no sorried data, 277 lines. Every Lean name occurs in the README; every backticked name of this roadmap's own in the README is declared. No declaration name occurs in another roadmap's `Suggested.lean` (`roadmaps grep --lean-only`: no match).

### Pinned declarations

All 87 qualified library identifiers backticked in the README were resolved: 68 by `#check` in one scratch file elaborated at the pins, the 19 others (their modules have no object file on this worker) by reading the declaration and its namespace in the pinned source, e.g. `TauCeti/Algebra/Lie/Sl2/EigenspaceMap.lean:90`, `:188`, `:209`; `…/Sl2/WeightedDiagram/Basic.lean:124`; `…/AdjointAction/CartanConjugacy.lean:74`; `…/InvariantForm/Basic.lean:141`; `…/Orthogonal/TypeD/Killing.lean:265`, `:308`; `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/HighestWeight.lean:197`; `TauCeti/LinearAlgebra/RootSystem/Opposition.lean:198`. All 45 cited file paths exist. Read for content: `Mathlib/Algebra/Lie/Sl2.lean` (`IsSl2Triple`, four fields as the README says); `Mathlib/CategoryTheory/Filtration/Basic.lean:73` (`FilteredObject`: an object with a filtration by monomorphisms); `Mathlib/Algebra/Lie/Classical.lean:224` (`soIndefiniteEquiv`, needs `i * i = −1`); `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean:118` (`G₂ = [[2,−3],[−1,2]]`, the transpose of the README's matrix, as the README says); `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:153`. Mathlib and Tau Ceti prove no structure of `LieAlgebra.g₂ K`, …, `e₈ K` beyond a rank bound for `g₂` (`TauCeti/Algebra/Octonion/Serre.lean`), so the README's remark on the carried hypotheses is right. No pinned declaration proves any of the nine headlines. The uncited pinned declarations are R01–R03.

### Suppliers, order and overlap

- Dependency check, run as prescribed: `depcheck: 208 roadmaps, 1901 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- Headings resolved this round. On main: LieHighestWeight Layers 0–9; NilpotentOrbits N0 (items 2, 3), N2 (items 1, 2, 4), N4; ReductiveGroups Layers 1–7, 5P, 9 (§9A, §9A.1, §9B), 9D, 10 (§10B); SpinRepresentations Layer 5; RootSystems Layers 4–6 by its former six-layer numbering, which its table "Old label / Present location" maps (kept at its open revision). At open heads, earlier in the merge order: ReductiveGroupsPartIII §0.3, §0.5 (position 240 against 241); NoncompactQuantumSymmetry Layer 3 (`Ad(G)=Int(𝔤)=Aut(𝔤)₀`), scope only. LieHighestWeight's open revision renumbers Layers 0, 1, 2, 4, 5 and carries a table "Former layer numbering / Present owner and replacement", so the citations stay valid.
- No gap is declared (`design/plan.json`: `"gaps": []`) and none is needed.
- `scratch/overlaps.md`: no other pull request changes this roadmap; no cited id dropped; none defined only by a revision; no second copy.
- Weight-pattern recognition is also stated by GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 (later, position 367). The README owns it and names that section a consumer; the earlier repair report recorded the other side as not actionable in this package, and that reason holds.
- Ownership against the open heads was checked with `roadmaps grep` and `roadmaps show`. The board's package index lists three packages on unrelated subjects.

Overlap check: read LieHighestWeight (main and its two open revisions), ReductiveGroups, NilpotentOrbits, SpinRepresentations, RootSystems, GlobalShtukasAndFunctionFieldLanglandsPartII; weight patterns and positive-real-part recognition are shared with GlobalShtukasAndFunctionFieldLanglandsPartII §8.0, owner LieHighestWeightPartII (earlier in the merge order); Jacobson–Morozov and Kostant conjugacy are Tau Ceti's (R02), the group-level orbit theory and classifications NilpotentOrbits'; `Int(L)`, Cartan conjugacy and the weighted diagram are Tau Ceti's (R01); the Serre presentation and exceptional models are LieHighestWeight's; half-spin modules are Tau Ceti's and SpinRepresentations'.

### Shape and policy

Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, six layers each ending in Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition (`IsSl2TripleOrZero`, `weightFiltration`, `β_n`, `D_T`, `C_T`, `weightPattern`, `IsGeometricPoint`, `IsPositiveRealPart`) has an API list and at least three Checks; every theorem has its hypotheses and a locator. The layer order is forced by the *Needs* lines (Layers 2 and 3 independent of each other, both feeding Layer 4; Layer 5 independent). No layer is named after a source chapter and the README does not say it follows one. A scan for pull-request numbers, dates, machine paths, LaTeX delimiters, process words, `lemma` and `set_option` found nothing (the word "lemma" occurs only in "Schur's lemma" and in source locators).

### Copyright

Wording: the 15 sampled locators and eight further passages (§0.3 proof against DG lines 145–153; §2.3 against CH lines 1716–1727; §3.1 against SOM lines 366–374; §5.2 proof against CH lines 1163–1171; §5.5 proof against CH lines 1555–1565; §2.1 against KIR lines 2369–2375; the docstrings of `weightFiltration` and `IsGeometricPoint` against CH lines 288–294 and 323–329) share no run longer than five words beyond formulas and standard names. Arrangement: CH has the largest share; its sections 1–10 and Appendix (CH lines 25–1699) do not map onto Layers 0–5 (Layers 1–4 draw on §2 and the Appendix, Layer 5 on §6.12 and §10.1, Layer 0 on neither). Reuse: no table is taken over; §3.5 states which integers the CH rows are and quotes five rows as Checks, each recomputed.

Source independence: 23 passages compared with 4 sources, none shared; largest share CH, 24 of 37 line locators; contents compared with CH: independent.

## Not verifiable

- The published versions of CH, DG and KIR were not collated with the cached versions; the README cites the versions read and says so.
- The label-to-diagram correspondence of every row of DG's tables was not rebuilt; the zero, principal, rank-one and all `G₂` rows were matched to computed profiles.
- Nineteen cited Tau Ceti declarations, and eight of the nine named in R01–R03, sit in modules without object files on this worker; they were read in the pinned source (file, line, namespace), not elaborated.
- The later roadmap's side of the weight-pattern overlap (its §8.0 importing §§5.3–5.5) cannot be checked until that pull request changes.

## Source issues

- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1707: the source says the span of every triple is a copy of sl₂; it should set the zero triple aside first; affects the proof.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1720: the source says ascending neutral coordinates are dominant for chain roots written in descending order; it should reverse either the roots or the coordinates; affects nothing.
- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1726: the source says to take the largest index with nonzero filtration step; it should take the largest index with nonzero graded piece; affects a stated result.
- **Misprint** in CH at Tables 2–4, printed pp.35–37, CH lines 1734, 1813, 1831: the source says the columns are filtration dimensions; it should say graded dimensions, the filtration being their cumulative sums; affects a stated result.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed p.35, CH line 1731: the source says the E₈ case implies the claim for its Levi subalgebras E₆ and E₇; it should justify descent of the filtration and of conjugacy, or treat them directly; affects the proof.
- **Misprint** in SOM at §3.1, printed p.15, SOM line 356: the source says conjugate homomorphisms differ by precomposing with an automorphism of the target; it should postcompose; affects nothing.

## For the human reviewers

- **Scope.** Three later roadmaps (SmoothRepresentationsOfLocalGroupsPartII, TwistedAutomorphicDescents, SheafConvolutionOnAbelianVarieties, at their open heads) declare contracts against this roadmap (triple centralizers, graded open orbit, orbit tables; rational nilpotent orbits, classical dominance; a minuscule-weight table) that `README.md` does not plan; `README.md:13` says rational forms are treated by neither roadmap.
- **Licence.** SOM is unpublished "preliminary notes" (2009) read from another mathematician's university page (the URL in `sources.toml`, path `~ptrapa`; `licence_class = "institutional"`); it is cited for §0.3 and §3.1 beside DG.
- **Licence.** KIR was read as the lecture-notes draft on the author's page, not the published book (`sources.toml`, `version_note`); CH is cited as arXiv v1, the journal version not collated (`README.md:623`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1504288cc0710c91eaf2a15f76fe82470c732b11", "job": "REV-PKG-LieHighestWeightPartII~7", "model": "fable", "worker": "chris-x51"} -->

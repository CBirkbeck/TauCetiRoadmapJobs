# Review of LieHighestWeight (pull request #1797 at b5e7fcb)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

The gate passes at this head. `lake env lean Suggested.lean` reports 0 errors and 10 `sorry` warnings. Findings R01–R11 of the previous review are repaired; R12 is not (it is R05 below). There are five findings, two of them blocking (P2).

## R01 (P2) — The compact centre theorem `Z(G) ≃ P∨/Y` loses its owner

- **Location:** `README.md:76–81`: "the centre theorem `Z(G) ≃ P∨/Y` for a compact connected semisimple group with cocharacter lattice `Y` are compact-group statements over LieGroups Layers 6–7 … so these statements are not planned here".
- **Claim:**
  - LieGroups does not state this theorem.
  - The version of this roadmap on main plans it.
  - After the merge, no roadmap on main plans it.
- **Witness:** on main, this roadmap's `README.md:1746` plans `Z(G) ≃ P∨/Y`. Main's `LieGroups/README.md` never mentions `P∨`; its centre results are `ker Ad = Z(G)` (line 537) and `π₁(G_ad) ≅ Z(U)` (line 565). Only #1220 keeps the theorem (§10.2).
- **Repair:**
  - Keep the compact-torus Weyl-formula clause: LieGroups owns it (`LieGroups/README.md:773`).
  - Give `Z(G) ≃ P∨/Y` an owner that states it, and cite that owner by section here.
  - It cannot be a target here, because LieGroups consumes Layers 0, 3 and 7 of this roadmap, so a LieGroups edge here would be a cycle.
  - The natural home is a Part II of this roadmap that consumes LieGroups Layers 6–7 and §10.2. State it there with main's hypotheses: for compact connected semisimple `G` with maximal torus `T` and cocharacter lattice `Y`, `Z(G) ≃ P∨/Y` equivariantly for `Γ_Y`, and `Y = Q∨` when `G` is simply connected (EtingofLieGroupsLieAlgebras Theorem 43.4, p. 216, line 8891; Corollary 43.5(i), p. 217, line 8914).
  - Checked on three groups: `SU(2)` gives `Y = ℤα∨`, `P∨/Y = ℤ/2 = {±I}`; `SO(3)` gives `Y = P∨` and trivial centre; `SU(3)` gives `ℤ/3 = {ζI}`.

## R02 (P2) — Two targets restate theorems already pinned in Tau Ceti

- **Location:**
  - `README.md:872–873` (§6.2): "Prove that for dominant integral `λ` the dominant integral `μ` with `λ − μ` in the `ℕ`-span of the simple roots form a finite set."
  - `README.md:693–694` (§3.2): "Prove that the degree-`n` coefficient of the zero-fibre kernel is `F_{n−1}`."
- **Claim:** both are open targets here, but the pinned Tau Ceti already proves them, at this generality or greater.
- **Witness:**
  - `TauCeti.finite_setOf_dominant_sub_mem_posRootCone` (`DominantCone.lean:123`) covers any `λ` and any crystallographic root system over a characteristic-zero domain.
  - `TauCeti.UniversalEnvelopingAlgebra.reesSpecializationZero_eq_zero_iff` (`Rees/ZeroFiber.lean:91`): `p` lies in the kernel iff every `p.coeff n` lies in `pbwFiltrationPrevious R L n`.
- **Repair:**
  - Replace both sentences with "Consume native …" naming these declarations, and add them to *From Tau Ceti* under Layers 3 and 6.
  - For §6.2 also name `RootPairing.dominantWeightsBelow` (`DominantCone.lean:369`), the finite set itself. Its cone `posRootCone` is the `ℕ`-span of the simple roots (`Positive.lean:319`).
  - The Rees theorem assumes `[Module.Free R L]`, as §3.2 does.
  - Checked on `sl₂`: `λ = 2ϖ` gives the dominant set `{2ϖ, 0}`, and `λ = 3ϖ` gives `{3ϖ, ϖ}`. At `n = 1`, the parameter `t` has coefficient `1 ∈ F₀` and lies in the kernel (`reesSpecializationZero_reesParameter`).

## R03 (P3) — §9.1 says both conjuncts are needed; the pinned theorem says the second suffices

- **Location:** `README.md:1321–1323`: "`radical = center` iff `L` is the direct sum of its centre and its derived ideal with the derived ideal semisimple; both conjuncts are needed (`sl₂ ⋉ K²` …)". Also the *Needs* line at `:1329–1330`, which names only `GeneralLinear/Radical.lean`.
- **Claim:**
  - In characteristic zero, semisimplicity of `D = [L, L]` alone gives `L = Z(L) ⊕ D`: every derivation of `D` is inner, the centralizer `C_L(D)` is an abelian complement, and that complement is central.
  - The `sl₂ ⋉ K²` example shows only that the first conjunct is insufficient.
  - Three of the five native results named in §9.1 are not in the file the *Needs* line names.
- **Witness:** the docstring of `TauCeti.hasCentralRadical_iff_isCompl_center_derivedSeries` (`Algebra/Lie/Reductive/Basic.lean:467–476`) says the reverse implication uses the second conjunct alone, via `TauCeti.hasCentralRadical_of_hasTrivialRadical_derivedSeries` (`:384`).
- **Repair:**
  - Write instead: "semisimplicity of the derived ideal alone suffices (native `TauCeti.hasCentralRadical_of_hasTrivialRadical_derivedSeries`); the complement condition alone does not (`sl₂ ⋉ K²`)".
  - In *Needs* and in the Layer 9 directory list of *From Tau Ceti*, add:
    - `Algebra/Lie/Reductive/Basic.lean`
    - `Reductive/CompleteReducibility.lean` (`:107`)
    - `Weights/Central.lean` (`:260`)

## R04 (P3) — The §7.5 route leaves out the step that bounds the presented algebra

- **Location:** `README.md:1004–1006`: "show that the simple Cartan generators and one bracket word per root span the presented algebra (a root-graded straightening from the Serre relations)". The *Needs* line at `:1013–1014` lists only §1.1 and the Serre files.
- **Claim:**
  - The spanning step is the substance of Serre's theorem.
  - It needs two inputs that the *Needs* line does not list: local `sl₂`-finiteness of the presented algebra, and the simple reflections. These kill non-root weights and make real-root spaces lines.
  - In type `G₂`, the weight `4α₁ + 2α₂` (the highest root plus `α₁`) vanishes by no single Serre relation.
- **Witness:** Etingof's proof of Theorem 24.2 gets (ii) from the `sl₂`-modules generated by `eⱼ`, `fⱼ` (`EtingofLieGroupsLieAlgebras` lines 4874–4879). It then gets (iii) and (iv) by simple reflections and the Weyl group (lines 4883–4897, pp. 123–124).
- **Repair:**
  - Name the step in the route: "the Serre relations make the presented algebra a sum of finite-dimensional modules over each simple `sl₂`, so its weights are Weyl-invariant, lie in `R ∪ {0}`, and real-root spaces are at most lines (EtingofLieGroupsLieAlgebras Theorem 24.2(ii)–(iv), pp. 122–124, lines 4874–4897)".
  - Add to *Needs*: §0.1–0.2, and Mathlib `RootPairing.weylGroup` or RootSystems §2.1.

## R05 (P3) — A conflicting open revision of this roadmap, with no stated order

This is R12 of the previous review, still not repaired. No repair report marks it "not actionable".

- **Location:** this folder's `README.md` and `Suggested.lean`, which open revision #1220 ("LieHighestWeight: tensor strings, reductive centers and opposition") also rewrites.
- **Witness:** the overlap listing reports "#1220 and #1797 conflict in `README.md`, `Suggested.lean`". #1220 keeps §5.2 (Haar type-A characters), §9.2 (reductive enveloping centers) and §10.2 (compact centre), which this head removes. The description never names #1220.
- **Repair:**
  - Say in the description which pull request rebases on the other.
  - Update the description's LieHighestWeight paragraph. It still says `TypeAHaarTargets.lean` was folded into a `TypeAHaar` section with 27 statements and "No statement changes", but at this head that section is gone and `Suggested.lean` has 10 theorems.

## Verified sound

### Status of the previous findings

| Previous | Passage at this head | Status |
|---|---|---|
| R01 (pinned targets) | §2.2 "consume native `TauCeti.finrank_weightSpace_weylGroup_smul`"; §10.1 consumes `RootPairing.coweightLattice`, `Base.coweightLatticeBasis`, `relIndex_corootSpan_coweightLattice`, `RootPairing.baseChange`, `DynkinType.rationalRootSystem`; §1.2 consumes `LieAlgebra.Basis.span_cartanBasis_dualBasis_eq_integralWeightLattice`; Layer 8 intro "For the split octonion derivations the Cartan data are native" | repaired |
| R02 (`E`-series lower bound) | §8.5 "The lower bound comes from the pinned split algebra of the type: `TauCeti.DynkinType.lieAlgebra` …", through `lieAlgebraBaseChange`, `isSerreSystem_lieBasis`, `IsSerreSystem.submatrix`, `cartanMatrix_E6/7/8` | repaired; route checked at the pin (below) |
| R03 (`[IsSimple]`) | `Suggested.lean:77–85` without `IsSimple`; Conventions "simplicity of `L` is not assumed"; §7.5 `sl₂ × sl₂` Example | repaired |
| R04 (padding) | `fundamentalAlcoveStabilizerToQuotient_bijective` deleted; §10.2 "combines four native results" | repaired |
| R05 (Casimir claim) | §0.2 "proved with the Casimir operator of the triple … its proof uses `C = 2fe + h²/2 + h`, p. 64, line 2558" | repaired |
| R06 (§8.3 independence) | §8.3 "of dimension `14` by native `TauCeti.Octonion.finrank_derivationLieAlgebra` at `ℂ`"; Dependencies corrected | repaired |
| R07 (§8.4 locator) | "BaezOctonions §3.4, p. 32, line 1479 … LandsbergManivelMagicSquare §1.3, p. 4, line 151, for the Jordan product" | repaired |
| R08 (`B₂` Check) | "the unoriented affine diagram, the path `0 — 1 — 2`, has automorphisms `{id, (0 2)}` of order `2`" | repaired |
| R09 (locators) | §1.1 Prop. 19.11/Cor. 19.18(i); §6.1 §26.1, §26.2, Lemma 25.16, Thm 25.17; §6.2 Prop. 26.3; §9.2 native `finrank_le_of_isGlHighestWeightVector`; §3.1 names `triangularMulEquiv` | repaired |
| R10 (Poisson docstring) | bullet removed from the module docstring | repaired |
| R11 (Layer 6F) | `README.md:85–89` "The former Layer 6F … is now §6.2 … and TensorProductCombinatorics §§1.6 and 2.6" | repaired |
| R12 (#1220 order) | description unchanged on this point | not repaired (R05) |

### Gate, build and form

- **Gate:** worker's gate at this head has every check 0, build OK.
- **Dependency check:** `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean Suggested.lean` gives 0 errors and 10 `sorry` warnings.
- **Signatures:** `#check @name` for all 10 theorems in one scratch file. Each elaborated type matches its README statement; no section binder is lost (the file has no `variable` block). `[Invertible (2 : K)]` in the `F₄` headline is needed for `Mul (AlbertAlgebra K)` (`AlbertAlgebra/Basic.lean:243`).
- **Padding probe:** a scratch copy tried `first | rfl | simp | infer_instance | decide | exact?` on each theorem. None closes. Six hit the `whnf` heartbeat limit: the compact `G₂` dimension and Killing form, `finrank_e₆/₇/₈`, and the LR rule. The Serre, `G₂`, `F₄` and `Ω` statements end in unsolved goals or "`exact?` could not close the goal".
- **Form:**
  - One `import Mathlib` plus 9 existing `TauCeti.*` modules.
  - No `set_option`, `lemma`, sorry'd data, `#eval` or process words.
  - The module docstring lists the non-statable headlines: the formally real Albert algebra has no carrier, and the Vinberg/Freudenthal brackets are absent.
  - Every Lean name appears in the README.
- **Folder contents:** no change outside the folders the brief names. The folder holds README.md and Suggested.lean only; this nested sub-roadmap has no metadata.toml of its own, as the README's filing rule prescribes.

### Seeded sample (15 targets, all locators opened)

- **Matching the text:**
  - `EtingofLieGroupsLieAlgebras`:
    - Layers 0–2: Thm 11.16 (line 2516, p. 63), its (iv) at 2522 with proof at 2558 (p. 64); Thm 11.18 (2597, p. 65); Prop. 19.11 (3815, p. 96); Cor. 19.18(i) (3889, p. 98); §21.6 (4325–4334, p. 109); Lemma 25.16 (5072, p. 128).
    - Layers 3–5: Thm 13.1 (2787, p. 70); Cor. 13.7 (2827, p. 71); Thm 18.8 (3704, p. 93); Thm 20.10 (4049, p. 103).
    - Layers 6–7: §26.1 (5129–5136, p. 129); §26.2 (5159–5161, p. 130); Prop. 26.3 (5185); Thm 26.4 (5190, p. 131); Ex. 26.7(i)/(ii) (5289/5294, p. 133); Thm 24.2 (4818) and (iv) (4826, p. 122).
  - `EtingofRepresentationsLieGroups`: Thm 14.1(i)–(v) (3041–3061, pp. 70–71); Thm 10.1 (2153, p. 51).
  - `GuttDeformationQuantization`: slide 14, eq. (3) (905–913). Eq. (3) at `P = x`, `Q = y` gives `x⋆y = xy + (ν/2)[x, y]`, as §7.3 states.
  - `SchaferNonassociative`: printed p. 28 (lines 1022–1025, characteristic `≠ 3`) and printed p. 41 (1461–1465).
  - `BaezOctonions`: eq. (2) (354, p. 8); §3.4 (1479–1481, p. 32), whose layout puts `x` opposite `α`, as README's `a0 N(x0)` does; §4.1 (1601, p. 35; 1623, p. 36; 1701–1719, pp. 37–38); §4.2 (1779–1782, p. 39); §4.6 (2175, p. 49).
  - `LandsbergManivelMagicSquare`: §1.1 (66–79, p. 2) and §1.3 (151, 154–169, p. 4).
  - `Stembridge2002LR`: Corollary (109, p. 3); `ν = ∅` (121).
  - `GarnierAlcoves`: §2.2 (362, printed p. 7, by the contents line 14); Prop.-Def. 2.2.1 (389, p. 8); Cor. 2.2.7 (642, p. 10).
  - `DeConciniProcesiVergneBoxSplines`: §3.1, eq. (18) (803–819, p. 19).
- **Exception:** the §7.5 route step (R04).

### Adversarial table

| Statement | Instances | Values (left / right) | Result |
|---|---|---|---|
| §0.2 Clebsch–Gordan | `V(1)⊗V(1)`, `V(2)⊗V(1)` | `4 = 3+1`; `6 = 4+2`; Etingof `|m−n|+2i` gives `{2,0}`, `{3,1}` | holds |
| §1.1 root decomposition | `sl₃` | `8 = 2 + 6` lines; `[E₁₂,E₂₃] = E₁₃ ∈ L(α₁+α₂)` | holds |
| §1.2 lattice Checks | `A₁`, `A₂`, `G₂`, `B₂` | `(ϖ/2)(α∨) = 1/2 ∉ ℤ`; `ρ(α₁∨) = 2−1 = 1`; `det = 3, 1, 2` | holds |
| §2.1 honest weights | Killing vs non-Killing | Jordan block on `K²` under the 1-dim abelian `L`: generalized dim `2`, eigenspace `1`; excluded by `IsKilling`, which the native theorem needs | holds |
| §2.2 Weyl invariance | `sl₃` adjoint, `s₁` | `α₂ ↔ α₁+α₂`: `1 = 1`; at `0`: `2 = 2` | holds |
| §3.1 PBW | `sl₂`, ordered `f^a h^b e^c` | `dim F₁ = 1+3 = 4`, `dim F₂ = 10 = C(5,2)` | holds |
| §3.2 Checks | `[x,y]=y`; `sl₂`; ordered splitting | `{x,y²} = 2y{x,y} = 2y²` (opposite sign `−2y²`); `{h, h²+4ef} = 4(2ef−2ef) = 0`, `{e,·} = −4he+4eh = 0`, `{f,·} = 4hf−4hf = 0`; `B₁(x,y) = 0`, `B₁(y,x) = −[x,y]`, difference `[x,y]` | holds |
| §3.2 kernel coefficient | `sl₂`, `n = 1` | `t ∈ ker`, coefficient `1 ∈ F₀`; native `reesSpecializationZero_eq_zero_iff` | R02 |
| §5.1 Casimir scalar | `sl₂`, `κ(h,h)=8`, `κ(e,f)=4`, `⟨α,α⟩ = 1/2` | `((n+1)²−1)/4 · 1/2 = n(n+2)/8`; `V(1)`: `3/8`, `V(2)`: `1` | holds |
| §5.2 complement | `V(1)⊗V(1)` | Casimir `1` on `V(2)`, `0` on `V(0)`, complementary eigenspaces | holds |
| §6.1 Checks | `sl₂` | `(e^ϖ+e^{−ϖ})² = (e^{2ϖ}+1+e^{−2ϖ})+1`; unit `1` vs zero module `0`; `[V(2)]` vs `3[V(0)]`, both dim `3` | holds |
| §6.2 Weyl, fixed point | `sl₂`, `λ = ϖ, 0`; `w = s` | `(e^ϖ+e^{−ϖ})(1−e^{−2ϖ}) = e^ϖ−e^{−3ϖ}`; fixed-point sum `= e^ϖ+e^{−ϖ}`; `λ = 0` gives `1`; `1−e^{α} = −e^{α}(1−e^{−α})` = `sgn(s)e^{ρ−sρ}·…` | holds |
| §6.2 dimension, Kostant | `A₂` | `(a+1)(b+1)(a+b+2)/2 = 3,3,8,6,10`; mult of `0` in `L(θ)`: `w=1`: `P(α₁+α₂) = 2`, `s₁`: `P(α₂−α₁) = 0`, `s₂`: `0`, total `2` | holds |
| §6.2 finiteness | `sl₂`, `λ = 2ϖ, 3ϖ` | `{2ϖ, 0}`, `{3ϖ, ϖ}`; native `finite_setOf_dominant_sub_mem_posRootCone` | R02 |
| §6.3 toolkit | `(V(1)⊗V(1))⊕V(0)`; Pieri `λ=0, μ=ϖ` | multiplicities `1,0,2`, `3+0+2 = 5`; only `τ = ϖ` dominant | holds |
| §7.1 Harish-Chandra | `sl₂`, `Ω = h²+2h+4fe = 8C` | `C = h²/8+(ef+fe)/4 = (h²+2h+4fe)/8`; `HC_dot = t²+2t`, invariant at `t↦−t−2`; `HC_lin = (t−1)²+2(t−1) = t²−1`; `χ_n(Ω) = n(n+2)` | holds |
| §7.3 first order | Gutt eq. (3) | `σ(x)σ(y) = sym(xy) + ½[x,y]`, so `x⋆y = xy + (ε/2)[x,y]`, antisymmetrization `ε[x,y]` | holds |
| §7.5 transpose | `B₂`, `A = [[2,−2],[−1,2]]` | `⁅h₁,e₂⁆ = A 2 1 e₂ = −e₂` vs untransposed `−2e₂`; Etingof's `[hᵢ,eⱼ] = aᵢⱼeⱼ` matches `HE` with `CM = Aᵀ` | holds |
| §7.5 route | `G₂`, weight `4α₁+2α₂` | needs the `sl₂`/reflection argument, not one Serre relation | R04 |
| `serreLift_injective_of_base` | `A₁`; `sl₂×sl₂`; `L = 0` | `3 = 3`; `6 = 6` (now admitted, no `IsSimple`); empty support, `0 → 0` | holds |
| §8.1 Checks | Zorn `e = ⟨1,0,0,0⟩`; `⟨0,0,v,0⟩²` | `e*e = e`, `N = 1·0−0 = 0`, `tr = 1`; `w`-part `v ⨯₃ v'` (native `Basic.lean:279`) | holds |
| `g₂ToDerivationLieAlgebra_injective` | char 0 | `14` (native `finrank`, `Derivation.lean:958`) and `14 ≤ rank g₂` (`Octonion/Serre.lean:407`); char 3 excluded by `CharZero` (Schafer: char `≠ 3`) | holds |
| `nonempty_derivationAlbert_lieEquiv_f₄` | char 0 | `52 = 4 + 48` (native `Derivation/Finrank.lean:384`) | holds |
| §8.3 identities | native doubling `(ac − d*b, da + bc*)`; 200 random imaginary triples | trilinear, double-cross and `vw = −g + v×w` residuals `≤ 3·10⁻²⁸`; `N(xy) = 4080 = 204·20` | holds |
| §8.3 Checks | `i, j, k, ℓ` | `i×j = k`; `i×(i×j) = −j`; `i×(j×ℓ) = (0,−k)` vs `0`; `[i,j,ℓ] = (0,2k) = (i×j)×ℓ − i×(j×ℓ)` | holds |
| compact `G₂` headlines | split `g₂ ℝ` | `14`; split Killing signature `(8,6)` (`p` positive, `so(4)` negative) is indefinite | holds |
| §8.2/§8.4 Checks | `1`, `1+offDiag₀(1)`, `offDiag₀(x)`, `P` | `tr 1 = 3`, `det 1 = 1`; `det = 1−N(1) = 0`; `A∘A = diag(0,N,N)`, trace `2‖x‖²`; `P∘P = P`, `tr P = 1` | holds |
| §8.5 Checks | Vinberg, `E₆`, `E₇` | `72+168 = 240`, weights pairwise distinct on trace zero; `h = E₁₁−E₂₂`: `0`, `1`; `78 = 52+26`; `133 = 27+79+27`; `56` | holds |
| `finrank_e₆/₇/₈` | `E6–E8` | `6+72`, `7+126`, `8+240` (`numRoots_E6/7/8`, `NumberOfRoots.lean:59–61`); lower bound through `lieAlgebraBaseChange = GeckConstruction.lieAlgebra` (`BaseChange.lean:146`) | holds |
| §9.1 reductive | `sl₂ ⋉ K²`; `gl₂` | first conjunct holds (`0 ⊕ L`), radical `K² ≠ 0`; `[gl₂,gl₂] = sl₂` semisimple gives `K·1 ⊕ sl₂` without assuming the complement | R03 |
| §9.2 `gl₂` | `(1,0)`; staircase | `μ₀(μ₀+1)+μ₁(μ₁−1) = 2` and `ΣE_ijE_ji = 2I`; `C(ν−ε_t)−C(ν−ε_s) = 4(t−s)` | holds |
| LR headline | `N = 2`, `λ = μ = (1)`; `N = 1`; `N = 0` | `ν = (2)`: 1, `(1,1)`: 1, `4 = 3+1`; `(1,1)` excluded at `N = 1`; `1 = 1`; arguments match `lrTableauEquivYamanouchi` (`Yamanouchi.lean:320`) | holds |
| `existsUnique_…ToPerm_mul` | `A₂`, `σ = (0 1)`; `B₂` | `π(ω) = (0 1 2)`, `τ = (1 2)`; `B₂`: `Ω ≅ C₂`, `Γ_root = 1`, `|Aut| = 2` | holds |
| §10.3 orders | `A₁, A_r, D₄, E₆` | `2`; `2(r+1)`; `24 = 4·6`; `6 = 3·2` | holds |
| `Z(G) ≃ P∨/Y` (scope) | `SU(2)`, `SO(3)`, `SU(3)` | `ℤ/2 = {±I}`; trivial; `ℤ/3` | true, but no owner (R01) |

### Library declarations and citations resolved

- **Mechanical resolution:** 238 qualified names of the README resolve at the pins, by `#check` (116 modules with objects) or by a namespace-aware reading of the source. `TauCeti.E7Minuscule` is a namespace.
- **Opened and read (68):**
  - Mathlib:
    - Lie bases: `LieAlgebra.exists_basis_of_base` and `equivOfRootSystemEquiv` (`Basis/Base.lean:211,259`, the latter `[IsSimple]`); `LieAlgebra.Basis.equivOfReindex` (`Basis/Prod.lean:307`).
    - `HasTrivialRadical.instIsKilling` (`CartanCriterion.lean:257`).
    - `sl₂`: `IsSl2Triple` fields and `HasPrimitiveVectorWith` (`Sl2.lean:40–42,79`).
    - `LieAlgebra.e₆` (`SerreConstruction.lean:152`); `RootPairing.Base.equivOfCartanMatrixEq` (`CartanMatrix.lean:362`).
  - Tau Ceti, Dynkin types (`SimplyConnectedRootDatum/`):
    - `LieAlgebra/Basic.lean:135,144,156,271`; `BaseChange.lean:146,435`; `Killing.lean:58,75`; `Root/System.lean:96`.
    - `SerrePresentation.lean:126,152`; `Rational.lean:80,208`; `Assembly.lean:77`.
    - `NumberOfRoots.lean:59–61`; `DynkinType.lean:237,239`; `RootLength.lean:241`.
  - Tau Ceti, Serre presentation: `Presentation/Serre/Basis.lean:104`; `Presentation/Serre.lean:394`.
  - Tau Ceti, octonions and Albert algebra:
    - `Octonion/Simple.lean:94,175,335,343,515,537`; `Octonion/Derivation.lean:958`; `Octonion/Basic.lean:279`; `Octonion/Serre.lean:268,407`.
    - `AlbertAlgebra/Basic.lean:118,243`; `Determinant.lean:101`; `Derivation/Finrank.lean:384`.
    - `E7/Minuscule/Basic.lean:56–198`.
  - Tau Ceti, alcoves and root systems: `ExtendedAffine/Wall.lean:165,201`; `BaseChange/Basic.lean:88`; `DominantCone.lean:123,369`; `Positive.lean:319`.
  - Tau Ceti, PBW and Rees: `Rees/Basic.lean`, `OneFiber.lean`, and `ZeroFiber.lean:62,91,106,122`; `PBW/Subalgebra`, `Quotient` and `Decomposition` docstrings.
  - Tau Ceti, `gl_N`, reductive and Littlewood–Richardson:
    - `GeneralLinear/Carrier.lean:204`; `Reductive/Basic.lean:384,476,549`; `Reductive/CompleteReducibility.lean:107`; `Weights/Central.lean:260`.
    - `LittlewoodRichardson/Yamanouchi.lean:320`; `Schur/LittlewoodRichardson.lean:313`.
- **Cross-roadmap citations on main:**
  - ScatteringDiagrams §0.4 (`README.md:273`, anchor matches).
  - TensorProductCombinatorics §1.6 (694) and §2.6 (1191), anchor matches.
  - CharacteristicClasses C5 (1344, anchor matches).
  - LieGroupoidsPoisson §G4.6A (1325, positive sign as assumed).
  - RootSystems §§2.1, 3.1, 4.2, 5.1–5.2.
  - LieGroups, ClassicalGroups, AdoIwasawa, SpinRepresentations, ChevalleyGroups and DGFloer.
- **TangentialBordism:** not on main. It is named only as a consumer and owner of the Cayley-plane geometry, a deferral main already made (main `README.md:1407`).
- **Dropped ids and names:**
  - Every citation of this roadmap on main is layer-level: Layers 0, 3, 6, 7 and 9, plus Layer 6F, which is mapped.
  - The dropped Lean names cited by open pull requests are all mapped under "Names cited by other roadmaps": NoncompactQuantumSymmetry (`pbwSymmetrization*`) and FormalConnectionsOpers (`lieChevalleyRestrictionIso*`, `killingSymmetricEquiv_cartan_restriction`, `lieInvariantSymmetricAlgebra`).
  - AdoIwasawa's comment naming `LieHighestWeight.ι_injective`, `pbwBasis` and `module_finite_of_central_monic_relations` is covered by the same mapping, and its import still builds.
- **Ownership:**
  - `roadmaps grep` finds no second owner of `serreLift` injectivity: ChevalleyGroups specializes it and cites Layer 7.
  - It also finds none of the `E`-series dimensions, `Der 𝕆 ≅ g₂`, compact `G₂`, the `gl_N` LR rule or `Ω ⋊ Γ`.
  - ExceptionalThetaCorrespondencesForG2 owns the group scheme `Aut(𝕆)`, not the Lie algebra identification. RootSystemsPartII states no alcove-stabilizer result.

## Not verifiable

- `HumphreysIntroLieAlgebras` §18.3 (Serre's theorem) and §22.5 (characters of the `L(λ)` as a basis of `ℤ[P]^W`): the manifest records this source as uncertified, so it is cited by locator and was not read.
- `GuttDeformationQuantization`, "Lecture 1": the extraction is one 28-slide deck, and the lecture number is not printed in it. Slide 14 and eq. (3) were verified.
- The background references of the last References bullet are cited by chapter only, carry no theorem claim, and were not opened.

## Source issues

- **Gap** in GarnierAlcoves at Corollary 2.2.7, printed p. 10: the source infers normality of `Ω` in `Aut(D̂)` and `Aut(D̂)/Ω ≅ Aut(D)` only from `Ω` acting on the extended diagram; it should argue that automorphisms send the affine node to special nodes, on which `Ω` acts simply transitively; affects the proof.

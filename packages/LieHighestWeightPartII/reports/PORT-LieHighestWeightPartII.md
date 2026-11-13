# PORT-LieHighestWeightPartII

Port of the package `packages/LieHighestWeightPartII` into `TauCetiRoadmap/LieHighestWeightPartII/{README.md,Suggested.lean,metadata.toml}`.

- **Branch:** `roadmap/lie-highest-weight-part-ii`, from `45f58db` (main).
- **Head commit:** `f68e387` — "LieHighestWeightPartII: roadmap (README, Suggested.lean, metadata)". Only the three files of the folder are added (634 + 283 + 1 lines); nothing outside the folder changes.
- **Build:** `lake build TauCetiRoadmap.LieHighestWeightPartII.Suggested` ends with `Build completed successfully (18768 jobs).` Warnings: **9**, all `declaration uses `sorry`` (lines 84, 101, 115, 132, 155, 182, 202, 221, 270 of `Suggested.lean`); no other warning.
- **Gate:** `gate LieHighestWeightPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (output, verbatim): `depcheck: 223 roadmaps, 1977 edges, 0 problem(s)` — no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Which text was ported

The board copy of the package is the round-2 text (`review.json` records REV~2 as `needs_changes`, 10 blocking findings). Reviews REV~3 to REV~7, all in `reports/`, were made on the open package-fix branch, whose head (round 8, `baef69d`, repairing REV~7's three P3 findings) never reached the board. I read that head read-only as data and started the port from it, because it applies the findings of REV~2 to REV~7 that the brief asks me to carry. I then checked each repair against the pins and against main, rather than taking it on trust. For reference, these are the differences between the board copy and the ported text that come from those rounds:

- `Suggested.lean`: two import paths repaired (`…PointsAction.Basic`, `…SemisimplePoint.Basic`); the restated closure-of-exponentials `innerAutGroup` deleted in favour of Tau Ceti's `TauCeti.intLieAlgebra` (REV~2 R02); positive-real-part recognition widened from semisimple to reductive groups (`TauCeti.reductiveCommHopfAlgProperty`, REV~2 R09); the missing headline `forall_weight_halfIntegral_iff_highestWeight` added (REV~4 F01); `hspin` written as eigenspace sums without `letI`.
- README: `so(2)` excluded from the Killing range (R04); `dim V > 0` added to very-even splitting (R05); characteristic-two Check corrected (R06); unipotent Check corrected (R07); profile support bound with `|a_i|` (R08); adjoint-group construction cited to ReductiveGroups §§9A, 9B and Layer 9D (R10); KIR Theorem 5.6 locator (R11); intertwiner Check (R12); eigenvector form of the kernel statement (REV~3 F01); antipode images in faithful-comodule generation (REV~3 F02); torsion-free hypotheses of the spectrum theorem (REV~4 F02); zero-module bound (REV~4 F03); ownership split with GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 (REV~5 F01); fundamental-weight Check restricted to the integral lattice (REV~5 F02); "counted with multiplicity" (REV~6 F01); the former N0–N5 numbering table (REV~6 F02); the pinned weighted-diagram, Jacobson–Morozov and kernel-grading declarations (REV~7 F01–F03).

## Draft pull request body

Adds LieHighestWeightPartII, the second part of the highest-weight roadmap: `sl₂`-triples, weight filtrations and weight patterns. Over an algebraically closed field of characteristic zero it attaches to every `sl₂`-triple of a semisimple Lie algebra, the zero triple included, the increasing weight filtration of its neutral element on each finite-dimensional module. It then proves that the dimensions of these filtrations, taken over all modules, determine the triple up to inner automorphism. In the classical types the standard module suffices, except for very even partitions in type `D`, where one half-spin module separates the two classes; in `G₂`, `F₄`, `E₆`, `E₇`, `E₈` the adjoint module suffices, by injectivity of adjoint root profiles on an explicit finite candidate set. A second strand proves the highest-weight half-integrality test and shows that the geometric weight patterns of a semisimple element of a connected complex reductive group determine its positive real part up to conjugacy. These are the representation-theoretic inputs of Ciubotaru–Harris on the generalized Ramanujan and Arthur conjectures over function fields (Lemmas 2.4, 6.30, 10.9 and Proposition 10.2). The roadmap starts where LieHighestWeight and the native highest-weight theory of Tau Ceti stop, and consumes the pinned `Int(L)`, Cartan conjugacy, weighted-diagram, Jacobson–Morozov, Chevalley-restriction and half-spin declarations rather than restating them. `Suggested.lean` states nine headline theorems: restricted-module recovery, recognition in types `A`, `C`, `B`/`D` with an odd part and full type `D`, exceptional adjoint recognition, semisimple recognition, the half-integrality test, and positive-real-part recognition. Its docstring names two headlines that are not statable at the pins: the finite test family of Layer 4, and the group form of the half-integrality test.

## Roadmaps this one depends on that are still pull requests

- **ReductiveGroupsPartIII** (§0.5, characters separate semisimple classes; §0.3, group Chevalley restriction): §5.5 and Layer 5. It is earlier in the merge order (position 242, this roadmap 243). Both ids exist at its head.
- **NoncompactQuantumSymmetry** Layer 3 is cited only in Scope and ownership, to say that §0.2 is a kept algebraic variant of its analytic `Ad(G) = Int(𝔤)`; it is not a supplier. Layer 3 exists at its head.

No id this roadmap cites is defined only by an open revision. All other suppliers are on main or at the pins.

## What moved from the Lean to the README

Nothing. The fix-branch `Suggested.lean` already conforms: nine headline theorems and five definitions with real bodies (`IsSl2TripleOrZero`, `weightFiltration`, `weightPattern`, `IsGeometricPoint`, `IsPositiveRealPart`), no API lemmas, no padding and no sorry'd data. Changes made in this port:

- **Header switched to the module form** (`module`, `public import Mathlib` plus the six `public import TauCeti.*` modules, `@[expose] public section`). This is the form of the most recent merged roadmaps (FlagVarieties, LieHighestWeight). With the plain `import` form the build emitted an extra "consider adding `module`" warning, so the build was not clean with `sorry` as the only warning. The gate accepts the module form (`imports=0`, `no-import-mathlib=0`).
- **Docstring entry for the Layer 4 test family made accurate.** The pins do decompose a Killing algebra into simple ideals (`LieAlgebra.IsSemisimple`) and type its root system (`TauCeti.existsUnique_dynkinType`). What they lack is a standard module or half-spin module attached to a simple ideal of the corresponding type.
- **Signature check:** I appended `#check @…` for all 14 declarations to the module, built once, compared each elaborated type with its README statement, and removed the lines. Every binder is present (`[LieAlgebra ℚ _]`, `[Invertible 2]`, `[FiniteDimensional K M]`, `IsKilling`, `IsTriangularizable`, `IsIrreducible`, `1 < q`, the reductivity, semisimplicity and geometricity hypotheses). The generality equals the README's, and no change was needed. The file has no `variable` or `include` lines; every binder is in its declaration.

## Supplier replacements and duplication removals

LieHighestWeight on main was restructured on the day of the port: former Layers 0, 1, 2, 4 and 5 are now pinned declarations, Layer 5 is "opposition and invariant forms", and Layer 7 is "centre, Harish-Chandra, Freudenthal and Serre's relations". RootSystems on main also moved its former Layers 4–6 to pinned declarations. The fix-branch text cited the old numbering throughout, so every such citation was remapped by object. All the names below were checked at the pin (file and namespace):

- `sl₂` weights of `V(n)` (former LieHighestWeight Layer 0) → `TauCeti.Sl2Std.finrank_eigenspace_diag`, `TauCeti.Sl2Std.eigenspace_diag_eq_bot` (`TauCeti/Algebra/Lie/Sl2/Standard.lean:889`, `:821`).
- Root spaces are lines (former Layer 1) → Mathlib `LieAlgebra.IsKilling.finrank_rootSpace_eq_one` (`Mathlib/Algebra/Lie/Weights/Killing.lean:609`).
- Tensor and dual weights (former Layer 2) → stated directly from Mathlib's tensor-product and linear-map Lie modules.
- Classification of irreducibles and `L(ω_r)` (former Layer 4) → `TauCeti.nonempty_lieModuleEquiv_of_isHighestWeightVector` (`HighestWeight/Irreducible.lean:288`), `TauCeti.exists_isDominantIntegral_nonempty_lieModuleEquiv_irreducibleQuotient` (`HighestWeight/FiniteDimensional.lean:174`).
- Simple-ideal decomposition (former Layer 5) → Mathlib `LieAlgebra.IsKilling.instSemisimple`, `LieAlgebra.IsSemisimple`, `LieAlgebra.IsSemisimple.isSimple_of_isAtom`.
- Minuscule weights (former Layer 6) → `TauCeti.IsMinuscule` (`HighestWeight/Minuscule.lean:259`).
- Chevalley restriction (former Layer 7) → `LieSubalgebra.map_lieInvariants_lieCartanRestriction`, `LieSubalgebra.lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:136`, `:151`), with `TauCeti.lieCartanRestriction`.
- Serre presentation (former Layer 7) → LieHighestWeight §7.1 (split Serre presentation, simple or not).
- Exceptional models → LieHighestWeight Layer 8 (unchanged id; content checked).
- `sl_n` diagonal Cartan (former Layer 9) → Killing via `TauCeti.instHasTrivialRadicalSl` + Mathlib `LieAlgebra.HasTrivialRadical.instIsKilling`, with `TauCeti.diagonalCartan`; the `A_r` identification is stated in §2.0. Also `TauCeti.isKilling_typeB`.
- Orbit separation by `W`-invariants: the fix-branch text proved this inline in §3.1 → `FixedPoints.forall_mem_subalgebra_eq_iff` (`TauCeti/RingTheory/Invariant/OrbitSeparation.lean:87`). Inline proof deleted.
- RootSystems former Layers 4–6 → `TauCeti.existsUnique_dynkinType`, `TauCeti.DynkinType.cartanMatrix`, `TauCeti.DynkinType.numRoots`, `RootPairing.Base.highestRoot`, the fundamental-domain and opposition declarations. RootSystems §4.1 (roots as Weyl orbits of simple coefficient vectors) is cited for `Φ_T`.
- ReductiveGroups citations updated to its present section names: §7C for the rank-one maps, §9A item 1 and item 9A.1b, §9B, Layer 9D, §10B.
- **Duplication removed:** the parity of the invariant form on `V(n)` (§2.1: symmetric for even `n`, alternating for odd `n`) is the case `sl₂` of LieHighestWeight §5.1 (`invariantForm_isSymm_iff_tits_sign`, exponent `λ(h) = n`). §2.1 now cites it and keeps only the explicit form `β_n` with its Gram matrix, recorded in Scope and ownership as a kept variant.
- `TauCeti.exists_lie_eq_self_of_isNilpotent_ad` and `LieDerivation.IsKilling.exists_eq_ad` were listed as suppliers but used nowhere; both were removed from the contracts.
- `API:` field labels were replaced by prose lead-ins ("Prove the following about …").

**Duplication sweep** (by object, `roadmaps grep` over main and the 449 open heads): zero-inclusive triples, weight filtrations of `sl₂`-triples, very even/half-spin separation, adjoint root profiles and candidate characteristics, triple recognition under `Int(L)`, weighted Dynkin diagrams, half-integrality and positive real parts. No second owner was found, apart from the two cases above:

- LieHighestWeight §5.1: fixed by citation.
- GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 (open, merge position 370, later than this roadmap): it defines the same multiplicity function and proves recognition by trace separation, and it does not cite this roadmap. This roadmap is the earlier owner and states the split in Scope and ownership and in Downstream consumers. The other pull request has to cite §§5.3–5.5. That is its change, not this one's (see Unresolved).

Ownership against open pull requests was checked through the sibling checkouts listed in the brief.

## Adversarial mathematics pass

Values are recomputed for this port. The exceptional profiles come from my own script, which builds `Φ_T` from the Bourbaki Cartan matrices by simple reflections.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.1 `IsSl2TripleOrZero` | `(0,0,0)`; `(H,E,F)`, `(0,E,0)`, `(−H,F,E)` in `sl₂`; `sl₂(𝔽₂)`: `(0,E₁₂,0)`, `(0,E₁₂,E₂₁)` | `[E,F]=H`, `[H,E]=2E`; `[0,E]=0≠2E`; `[F,E]=−H`, `[−H,F]=2F`; char 2: `[E₁₂,E₂₁]=diag(1,1)≠0` | holds; Checks correct |
| §0.2 `Ad(G(K)) = Int(L)`, rank one | `w(c)=x(c)y(−c⁻¹)x(c)` in `SL₂` | `x(c)y(−c⁻¹)=[[0,c],[−c⁻¹,1]]`, `·x(c)=[[0,c],[−c⁻¹,0]]`; `w(1)⁻¹=[[0,−1],[1,0]]`; `w(c)w(1)⁻¹=diag(c,c⁻¹)`; `Ad(diag(c,c⁻¹))E=c²E` | holds |
| §0.2 inner invariance | abelian `L`; `so(8)`, `L(ω₄)` | `Int(L)=1`; `−1∈Spin(8)` acts by `−1` on half-spin, so no descent to `SO(8)`, yet `exp ρ(x)` defined | Killing hypothesis needed, as stated |
| §0.3 triple from `h` | `(H,cE,c⁻¹F)`; `f` uniqueness | `Ad(diag(a,a⁻¹))`, `a=c^(1/2)`: `E↦cE`, `F↦c⁻¹F`; `f−f'∈ker(ad e)∩L_(−2)=0` (`−2∉ℕ`) | holds |
| §1.1 restriction | `sl₃` adjoint, minimal `h=diag(1,0,−1)`; zero triple | weights `2,1,1,0,0,−1,−1,−2`; `m₂=1,m₁=2,m₀=1`, `3+4+1=8`; `8V(0)` | holds |
| §1.2 `weightFiltration` | `V(1)`; adjoint `sl₂`; `M=0`; decreasing convention | `0,1,1,2` at `i=−2..1`; `1,1,2,2,3`; all steps `0`, `N=0`; decreasing gives `3,2,2,1,1` | determines its object |
| §1.2 kernel bullet | `V(0)⊕V(1)`, `x=u+v₊` | `ρ(e)x=0`, `ρ(h)x=v₊∉Kx`; `x∈M₀⊕M₁`; `ρ(e)v₋=v₊≠0` | holds |
| `finrank_weightFiltration_eq_iff_exists_intertwiner` | `V(2)` vs `V(0)⊕V(1)`; zero triple on `M` vs trivial `K^(dim M)`; `M=0` vs `K` | `(1,1,2,2,3)` vs `(0,1,2,3,3)`, no intertwiner; one jump `dim M` both, coordinate map intertwines; `0` vs `1` at `i≥0`, no iso | both directions hold |
| §1.4 tensor, dual | `V(1)⊗V(1)`; `V(1)*`; unit | graded `1,2,1`, cumulative `1,1,3,3,4`; `W₋₁(M*)=Ann(Kv₋₁)` a line, shift `−i` gives `Ann(M)=0`; unit `0` for `i<0`, `K` for `i≥0` | shift `−i−1` correct |
| §2.0 ranks, types, dims | `so(2)`, `so(3)`, `so(4)`, `so(5)`, `so(6)`, `r=4` | Killing matrix of `so(2)` `[0]`; `±ε₁`/`±2ε₁`, dim 3; `±(ε₁∓ε₂)` split; 8 and 12 roots, dims 10, 15; `28=4+24`, `36=4+32` | holds |
| §2.1 `β_n` | `n=1,2,3`; invariance under `e`, `f`, `h`; trace form on `V(2)` | `det=1` for `n=1,2,3` (antidiagonal signs cancel the permutation sign); `e`-terms `j(n−j+1)[(−1)^(j−1)+(−1)^j]=0`; `w=(E,−H,−2F)`, trace form `−2,2,−2 = −2β₂` | holds; parity now cited to LieHighestWeight §5.1 |
| §2.2 parity, splitting | `sp(4)`: `(3,1)`, `(2,2)`; `so(8)`: `(4,4)`, `(2⁴)`, `(3,3,1,1)`; `so(4)`; `so(3)`; `V=0` | reflection on symmetric `U_n` gives `det=(−1)^(n+1)=−1` for `n` even; `(t,0)`: `V(1)⊗K²=2V(1)` → `(2,2)`; diagonal: `V(2)⊕V(0)` → `(3,1)`; `O(0)=SO(0)` | holds with `dim V>0` |
| §2.3 half-spin maxima | `a=(3,3,1,1)`, `(1,1,1,1)`; odd half-spin; full spinor | `A=4`, `A−a_r=3`; `2`, `1`; minus at `i<r` and `r` gives `A−a_i≤A−a_r`; full spinor top `A` for both; CH ascending `(1,1,3,3)·(ε₂−ε₃)=−2` | separates; convention witness kept |
| `…_sl`, `…_sp`, `…_so`, `…_typeD` | `n=0,1,2` for `so`; `so(4)` `(2,2)`, `(3,1)`; `so(8)` `(4,4)`; `ι` of size `0,1,2,3` | `n=0`: kernel `⊥`, vacuous; `n=1,2`: zero triple only; `(2,2)`: eigenvalues `±1,±1`, kernel `0`; `(3,1)`: kernel 2-dim; `|ι|=2`: classes `(0,0),(t,0),(0,t),(t,t)` have (standard; `S⁺`) = (`0⁴`;`0,0`), (`±1,±1`;`±1`), (`±1,±1`;`0,0`), (`2,0,0,−2`;`±1`), pairwise distinct; `|ι|=3`: no very even partition of 6 | holds |
| §3.1 characteristic | `E₆` opposition; `G₂ (2,0)`; zero triple | `3⁴=81` of `729`; profile `4,0,2,0,1,0,2`, `d₄=1<d₆=2`; `0∉dominantNeutralElements` | holds |
| §3.2 `D_T` | `G₂`: `(0,1)`, `(1,0)`, `(0,2)`, `(2,2)`, `(−1,0)`; `F₄`: `(2,2,2,2)`, `(1,0,0,0)`, `(0,0,0,1)`; `a=0` | `4,4,1`; `4,2,1,2`; `4,0,4,0,1`; `2,0,2,0,1,0,1,0,1,0,1`; `(−1,0)`: `4,2,1,2`, bound `Σ|a_i|θ_i=3` (signed bound `−3` would kill `D₀=4`); `F₄` even degrees `4,4,3,3,3,3,2,2,1,1,1,1`, `F₀=28`; `22,14,1`; `22,8,7`; `a=0`: `14,52,78,133,248` | holds |
| §3.3 `C_T` injectivity | all of `{0,1,2}^r`, five types | roots `12,48,72,126,240`; `θ=(3,2),(2,3,4,2),(1,2,2,3,2,1),(2,2,3,4,3,2,1),(2,3,4,6,5,4,3,2)`; `2ht θ=10,22,22,34,58`; `|C_T|=7,28,34,274,245` with as many distinct profiles; `E₆` without opposition `212` vectors, `123` profiles, `(1,0,0,0,0,0)` and `(0,0,0,0,0,1)` equal; `C_(G₂)={(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,2)}` | every README value confirmed |
| `…_adjoint_exceptional` | `G₂` five classes; Layer 3 example | profiles pairwise distinct; `(0,2)`: `1,0,4,0,4,0,4,0,1`, cumulative `1,1,5,5,9,9,13,13,14`; `(1,0)`: `2,1,2,4,2,1,2`; differ at `i=−4` (`1` vs `0`) | holds |
| §3.5 CH tables | principal `E₈`, `F₄`, `G₂`; `F₄` `A1`, `~A1` | `E₈` even degrees `8,8,7,7,7,7,7,7,6,6,6,6,5,5,4,4,4,4,3,3,2,2,2,2,1,1,1,1,1,1`, odd `0`, `i_max=58`; `F₄` `4,0,4,…`; `22,14,1`, `22,8,7` | holds |
| `exists_innerAut_iff_finrank_weightFiltration` | `sl₂×sl₂`: `(t,0)`, `(0,t)`; `L=0`; `sl₃` | adjoint weights `2,0,−2,0,0,0` both; first standard pullback `±1` vs `0,0`; `L=0` trivial; `sl₃` standard jumps `3@0`, `1@−1,0,1`, `1@−2,0,2` | pullbacks needed, as stated |
| §5.1 coset | `A₁`, `ν(α)=½`; `ν(α)=⅓`; `Q=0` | `ν(±ω)=±¼`; `ν(α)=⅓∉½ℤ` with `λ=0`; trivial | hypothesis needed |
| `forall_weight_halfIntegral_iff_highestWeight` | Verma `λ(H)=−2`, `−1`; `K=ℚ`, `λ=−ω/2`, `ν(aω)=a/2`; `V(1)⊕V(0)`; `V(3)`, `ν(α)=⅓`; `L=0` | raising coefficients `k(λ(H)−k+1)`: `−k(k+1)`, `−k²`, `−k(k−½)`, nonzero for `k≥1`; `ν=−(k+1)/2` vs `−½` (T⇔T); `−¼−k/2` vs `−¼` (F⇔F); `−¼−k` vs `−¼` (F⇔F); reducible: right `0∈ℤ`, left fails at `±¼`; `2ν(3ω)=1`, `2ν(ω)=⅓`; `L=0`: `M` a line, `λ=0`, T⇔T | irreducibility and root hypothesis needed |
| `weightPattern`, `IsGeometricPoint` | `diag(2,½)` at `q=4,16,3`; Jordan block at `√q`; zero space | `2=4^(1/2)`: pattern `1` at `±1`; `diag(4,¼)` at `16` the same; traces `5/2`, `17/4`; `q=3`: `2^k=3^(i/2)` only at `k=i=0`; `dim ker=1`, not `2`; zero function | determines its object at semisimple points |
| `IsPositiveRealPart` | `G_m`, `s=2i`; unipotent `u`; `PGL₂`, `diag(±z,1)` | `r(t)=2`, `r(t⁻¹)=½`; `r=u` and `r=1` both satisfy it; `|α|=|z|` for both | pins `r` only at semisimple points, as stated |
| `exists_conj_positiveRealPart_of_weightPattern_eq` | `SL₂`: `diag(i,−i)`, `1`; `G_m`, `q=4`: `2i`, `2`; `2`, `½`; `q=3`: `diag(2,½)`, `diag(5,⅕)`; `u`, `r=u`, `r'=1`; `H=ℂ` | patterns `2δ₀` both, `r=r'=1`; `|(2i)^k|=4^(k/2)`, both `δ_k`, `r=r'=2`; `δ_k` vs `δ_(−k)`; equal patterns, parts not conjugate (non-geometric); semisimplicity needed; trivial group `g=1` | holds; `1<q` unused (see notes) |
| Bridge `n_(ν,τ)(i)=weightPattern q (τ(q^ν)) i` | adjoint `SL₃`, `ν=0`; adjoint `SL₂`, `ν=(½,−½)`, `q=4` | `6+2=8` vs `8`; eigenvalues `4,1,¼` at `2,0,−2` | holds |
| Conventions witnesses | increasing vs decreasing filtration; dual shift; `G₂` transpose; `q^(i/2)` vs `q^i` | `1,1,2,2,3` vs `3,2,2,1,1`; see §1.4 row; `(0,1)`↔`(1,0)` profiles exchanged; `diag(2,½)` at `q=4` has no integer degree under `q^i` | each convention pinned by a computed Check |

**Degenerate and junk values:** `weightPattern` on an infinite-dimensional space is `finrank = 0` (junk; used only on finitely generated comodules). `Real.sqrt q ^ i` for `q ≤ 0` is `0^i`: `1` at `i = 0`, `0` otherwise. Every hypothesis of a headline was checked to be in its own signature (the `#check` pass above).

**P3 notes, no change:**

- The hypothesis `1 < q` of `exists_conj_positiveRealPart_of_weightPattern_eq` is not needed for truth. For `0 < q < 1` the trace identity `tr τ(r(s)) = Σ n(i) q^(i/2)` still recovers the traces. For `q = 1`, and for `q ≤ 0` (where `Real.sqrt q = 0`), a geometric point has only eigenvalues of absolute value `1`, so `r = r' = 1`. It is kept because the source and every consumer fix `q > 1`, the residue cardinality.
- The finite-dimensionality and Killing hypotheses of the exceptional headline are redundant given LieHighestWeight Layer 8; the README already says so.

**Fixes from the reviewer read-through** (beyond the remapping): a missing comma in Scope (a list ran two items together); the Lean docstring's not-statable entry, which overstated what the pins lack; and the §2.1 parity claim, which duplicated LieHighestWeight §5.1 (above). No other statement was found false, vacuous or unsourced.

## Unresolved

- **GlobalShtukasAndFunctionFieldLanglandsPartII §8.0** (open, later in the order) restates the weight multiplicity function and its trace-separation recognition without citing this roadmap. This README names it a consumer and states the split. That pull request still has to import §§5.3–5.5 and keep only its normalization, relative-Weyl and Aubert-involution items.
- **Consumer contracts this roadmap does not plan.** Three later open roadmaps declare contracts or gaps against it:
  - SmoothRepresentationsOfLocalGroupsPartII: reductivity of the centralizer of an algebraic `sl₂`-triple; the graded open orbit for `Ad(s)` eigenspaces; Bala–Carter tables for `F₄`, `E₇`, `E₈`.
  - TwistedAutomorphicDescents: rational classical nilpotent orbits; classical dominance comparisons.
  - SheafConvolutionOnAbelianVarieties: a minuscule-weight table.

  The README says rational forms are treated by neither this roadmap nor NilpotentOrbits. Whether these belong here (a further Part), in NilpotentOrbits, or in the consumers is a scope decision for a human. The N0–N5 table keeps their existing citations resolvable.
- **Licence and version notes** (from REV~7, for the human reviewers): SOM is unpublished preliminary notes on a third party's university page; KIR is the author's lecture-notes draft, not the published book; CH is cited as arXiv v1, not the journal version.
- **The board copy of the package lags its fix branch** by six rounds. The worker may want the board updated, or the fix pull request closed against this port, so that the package and the roadmap do not diverge.

## Suspicious text

None. The review reports contain "Exact repair" instructions; I treated them as claims and checked each one. The board's package index suggests a `gh api` command for reading package heads; I used it only to read the four package files of the fix branch, read-only. No credential was read or printed.


Pull request: #2277 (roadmap/lie-highest-weight-part-ii at f68e387)

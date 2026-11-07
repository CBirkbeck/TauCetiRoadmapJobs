# GATE-QuaternionicModularForms~2: answers to human review

One comment (CBirkbeck, 2026-11-07T13:21:34Z), three points: the status of the five consumer pull
requests (H01), the option of consuming their statements (H02), and the option of keeping this
roadmap's own versions so that their citations switch back (H03). Repairs are in commit `f7ed2fe5`
on top of `69e6e45`.

## H01 (CBirkbeck) — answered

Confirmed at the heads (#931 `385d7a8`, #1005 `d3e151e`, #1007 `4ac373d`, #1019 `511de39`, #1270
`bd1e251`): none of the five READMEs or Lean files contains the string `QuaternionicModularForms`.
The material now sits in three places. GL2AutomorphicRepresentationsAndTransfer R17.3.8a–R17.3.8d
covers our §§1.3, 2.1–2.2 and 0.4/3.1. AutomorphicGaloisRepresentations §§0.2a–0.2f covers our
§§1.1–1.4, 2.2–2.3, 3.2–3.3, 4.1–4.3 and Layer 5. HilbertModularVarietiesAndShimuraCurves
R18.5.16b covers our §0.3. HMV R18.3, PadicFamilies (its *Uses* paragraph for Layer 5) and
CompletedCohomologyAndLocalGlobalCompatibility (§§1.6–1.7) cite those copies, not this roadmap.
Our §§2.4–2.6 (automorphic realisation, Bianchi) and §4.4 (annular model) are restated nowhere.

## H02 (CBirkbeck) — disputed

This roadmap cannot consume those statements, because every one of the five comes later in the
merge order: QuaternionicModularForms is line 67 of `ORDER.txt`, GL2AutomorphicRepresentationsAndTransfer
line 91, HilbertModularVarietiesAndShimuraCurves 154, AutomorphicGaloisRepresentations 159,
PadicFamilies 165 and CompletedCohomologyAndLocalGlobalCompatibility 249. Citing them would add
upward supplier edges. To avoid them, this roadmap would have to move below line 159, keeping only
§§0.1, 2.4–2.6 and 4.4, and the generic quaternionic carrier would then be owned by a
Galois-representation roadmap. The ids that QuaternionArithmetic (§§0.3, 3.1, Layer 0),
HilbertModularForms (§§0.3, 2.1, 3.1) and FuchsianOrbifolds (§0.3) cite here would also lose their
content. Two copies need one owner, and that owner is the earlier roadmap, so this one.

## H03 (CBirkbeck) — applied

This roadmap keeps its versions. Wherever a consumer's copy was more general, the statement here
is now generalised to match, so every citation can switch back with nothing lost:

- §0.3, compact-open levels in `D_fˣ` → any group `G₀ ⊇ Γ` and subgroups `U′≤U` (as in HMV R18.5.16b). Also added: finiteness of `Cl(U)` for every open `U`, and the change-of-representative bullet.
- §1.3, `L_{n,v}` over the `p`-adic field → any commutative ring. Added: the monomial basis; the comparison with Tau Ceti `TauCeti.symPowerRep`/`Representation.charTwist`; `K`-splittings at ramified places; the integral `Σ₀(t)` action with nebentypus (as in GL2 R17.3.8a/c).
- §2.1, compact levels → open levels. Added: finiteness over a Noetherian `R`; freeness of rank `#Cl(U)·r`; level maps with `tr∘res=[U:U′]`; colimits; central-character forms as AutomorphicFormsOnReductiveGroups §7.6's carrier at `U𝔸_{F,f}ˣ` (GL2 R17.3.8b).
- §2.2, classical forms "assume `F` totally real, `D` totally definite" → every `F` and `D`. Added: dimension; coefficient extension; independence of the splittings via `TauCeti.skolemNoether` (GL2 R17.3.8c). The definite hypothesis is kept for analytic and overconvergent forms only.
- §3.1: added the inversion formulas `[Uη_v⁻¹U]=S_v⁻¹T_v` and `[Uϖ_v⁻¹U]=S_v⁻¹`, and proved commutativity of the Hecke algebra away from `S` (GL2 R17.3.8d).
- §4.3, families on `‖T‖≤b`, `T=κ(exp(q))−1` (only `F_v=ℚ_p`) → any `F_v`: `N>e_v/(p−1)`, a `ℤ_p`-basis of `1+π_v^N𝒪_v`, domains `max‖T_i‖≤b` (AGR §0.2e).
- Layer 5, "over `ℚ`" → totally definite `D` over totally real `F`. It now has the twisted theta target `κ′_τ`, partial theta maps `Θ_τ`, the partial identity `H_κ(T)=H_{W_τ}(T)·H_{κ′_τ}(τ(π_v)^{r_τ}T)`, and the cutoff `v_p(μ)<min r_τ/e_v`. The `ℚ` statements (`Θ^r=c^{−r}D^r`, `H_κ(T)=det(1−TU_p|M_cl)·H_κ′(p^{k+1}T)`, cutoff `k+1`) stay as the one-label case (AGR §0.2f).

The Summary, Scope, Generality, How to read, supplier contracts, layer Dependencies, Downstream
consumers and the `Suggested.lean` docstring now say the same thing. Downstream consumers names
the consuming sections that exist at the heads: GL2 R17.3/R17.3.9, HMV R18.3/R18.5, AGR §0.3,
PadicFamilies Layer 5, and CompletedCohomology §§1.6–1.7 and 2.7. No section number changed.

Map for switching back:

| Consumer copy | Section here |
|---|---|
| GL2 R17.3.8a | §1.3 |
| GL2 R17.3.8b | §§0.3, 2.1 |
| GL2 R17.3.8c | §2.2 (classical) |
| GL2 R17.3.8d | §§0.4, 3.1 |
| HMV R18.5.16b | §0.3 |
| AGR §0.2a | §§1.1–1.2 |
| AGR §0.2b | §1.4 |
| AGR §0.2c | §§2.2–2.3 |
| AGR §0.2d | §§3.2–3.3 |
| AGR §0.2e | §§4.1–4.3 |
| AGR §0.2f | Layer 5 |

Two pre-existing errors were found while doing this and are fixed in the same commit:

- The §2.1 trace was written `Σ_{u∈U/U′}φ|u`, which depends on the coset representatives. It now reads `(tr φ)(g)=Σ_{u∈U/U′}φ(gu)|u⁻¹`, AutomorphicFormsOnReductiveGroups §7.4's formula, with a negative-control Check on `S₃`.
- A §0.3 Check cited "§0.5", which does not exist. It now cites Layer 0's Examples.

## Build and gate

- `lake build TauCetiRoadmap.QuaternionicModularForms.Suggested`: `Build completed successfully (8976 jobs).`
- Gate: `gate QuaternionicModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2366 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

## Other checks

- **Lean declarations.** `Suggested.lean` declares nothing; only its docstring changed, to the generalised §5.2–§5.3 headlines. With no named declaration there was nothing to `#check`. No headline became statable: the analytic weight action, Fredholm determinants on (Pr) modules and automorphic forms are still missing at the pins.
- **Library names.** Every library name added to the README was checked at the pins, with file and line:
  - Mathlib: `MvPolynomial.restrictSupport` (RingTheory/MvPolynomial/Basic.lean:91), `Subgroup.normalCore` (Algebra/Group/Subgroup/Basic.lean:724), `Subgroup.subgroupOf` (Subgroup/Map.lean:284), `Subgroup.relIndex` (GroupTheory/Index.lean:62), `Representation.averageMap` and `isProj_averageMap` (RepresentationTheory/Invariants.lean:126, 141; they need `[Fintype G] [Invertible (card G)]`), `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` (Units/DirichletTheorem.lean:318), `Nat.descFactorial` (Data/Nat/Factorial/Basic.lean:332).
  - Tau Ceti: `TauCeti.symPowerRep` (ClassicalGroups/SymmetricPower.lean:57, over a `CommRing`), `Representation.charTwist` (CharacterTwist.lean:86), `TauCeti.skolemNoether` (Algebra/CentralSimple/SkolemNoether.lean:107; target simple and finite-dimensional, source central simple).
  - `roadmaps resolve` on the new README: no cross-roadmap citation and no Lean name found nowhere.
- **Citation lead from the worker.** The lead was "README 180: `LocallySymmetric.AutomorphicForm`". This is ArithmeticLocallySymmetricSpaces' own ALS.F.6 target name (its README lines 996 and 1033 at head `360d0bc`), not a pinned library declaration, so the citation is correct.
- **Ownership.** No new construction was added. Each generalisation concerns an object this roadmap already owns, and the earlier owner wins. The open copies were checked by object: GL2 R17.3.8a–d, AGR §§0.2a–0.2f and HMV R18.5.16b, plus the users of §§0.3/2.1/3.1 in QuaternionArithmetic, HilbertModularForms and FuchsianOrbifolds, which keep their ids.
- **Overlaps.** The worker's overlaps file lists none. The vocabulary neighbours #1007, #931 and #1019 are the copies described above.
- **Sources.** No new source is cited; `needs-references.toml` is not needed. The generalised Layer 5 cites Buzzard (*On p-adic families*, §7, p. 19) only for the one-variable identity and for Proposition 4 over `ℚ`; the several-label statements are derived here from Bol's identity in each variable.
- **Suspicious text.** None in the comment.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3 fibre bijection `Γ_xuU′↦ΓxuU′` | well defined, injective and onto, for an arbitrary group | `x⁻¹γx=u′u″⁻¹u⁻¹∈U∩x⁻¹Γx` gives injectivity; `y=γxu` gives surjectivity | holds | stated for any `G₀,Γ,U′≤U` |
| §0.3 count, normal-core product | `S₃`, `Γ=⟨(01)⟩`, `U′=⟨(12)⟩` | `(01)(02)=(02)(12)` in both composition orders; orbits `{U′,(01)U′}`, `{(02)U′}`, so 2, not 3 | product formula fails off the normal core, as stated | Check added |
| §0.3 change of representative | `x′=γxu` | `Γ_{x′}=u⁻¹Γ_xu`; bijections differ by `wU′↦uwU′` | holds | bullet added |
| §0.3 open `U` finite | `U𝔸_{F,f}ˣ` | contains `U∩(𝒪_D⊗Ô)ˣ`, compact open; its class set maps onto `Cl(U)` | holds | sentence added |
| §1.3 basis and right action over a ring `R` | `n=1`, `v=0`, `γ=((1,1),(0,1))`, `δ=((1,0),(1,1))` | `(1|γ)|δ=z+1=1|γδ`, `γδ=((2,1),(1,1))`; `1|δγ=z+2` | right action; a left formula fails | Check added |
| §1.3 transpose identity | general `γ` | `w·adj(γ)·w⁻¹=((a,c),(b,d))=γᵀ` | holds | stated |
| §1.3 left action is `Sym^n⊗det^{−n−v}` | `(g⁻¹)ᵀ=det(g)⁻¹wgw⁻¹` | total factor `det^{−v}·det^{−n}`, conjugated by `Sym^n(w)` | holds; contragredient only if `n!` is a unit | stated |
| §1.3 scalar action | `uI` | `u^{2v}·u^n=u^{n+2v}` | holds | bullet |
| §1.3 integral `Σ₀(t)` action | `R=𝒪_K`, `n=0`, `v=−1`, `diag(π,1)` | algebraic: `σ(π)⁻¹∉𝒪_K`; normalised: `1`; at `v=1` they differ by `σ(π)` | needs the normalised determinant | wording and Check |
| §1.3 nebentypus | `γ,δ∈Σ₀(t)` | `d_{γδ}=c_γb_δ+d_γd_δ≡d_γd_δ mod π^t` | right action | bullet |
| §1.3 splitting exists iff `D_v⊗K` splits | Hamilton at 2, `K⊇ℚ₂(i)` | `−1=i²`, so `(−1,−1)` splits over `ℚ₂(i)`; `D_v⊗K→M₂(K)` injective, hence bijective by dimension | holds | Check in §2.2 |
| §1.3 parallel weight ⇔ finite unit image | `ℚ(√2)`, `n+2v=(0,2)` | `(1−√2)²=3−2√2`, of infinite order; parallel `w` gives `N(u)^w=±1` | holds | Dirichlet citation added |
| §2.1 Noetherian finiteness | `A` finite over Noetherian `R` | `⊕A^{Γ_i}⊂A^h`, a submodule of a finite module | holds | bullet |
| §2.1 nondefinite check | `D=M₂(ℚ)`, `U=GL₂(Ẑ)` | one class (`det`, strong approximation); `Γ_1=GL₂(ℤ)`; `−I` acting by `−1` gives `2a=0` | zero space when 2 is not a zero divisor | Check added |
| §2.1 trace over left cosets | `U=S₃`, `U′={1,(01)}`, trivial `Γ`, `A=ℤ` | left cosets `{1,(01)},{(012),(02)},{(021),(12)}`; right-coset sums: `a+b+c` vs `a+2c` | old `Σφ|u` was not well defined | formula fixed, Check added |
| §2.1 central characters | well definedness of `a|(uz)=ψ(z)(a|u)` | `uz=u′z′` gives `ψ(z)ψ(z′z⁻¹)=ψ(z′)`; level law at `U𝔸ˣ` is exactly `φ(gz)=ψ(z)φ(g)` plus level `U` | holds; needs `ψ` trivial on `Fˣ` | bullet and negative-control Check (`(ψ(z₀)−1)φ=0`) |
| §2.2 classical dimension | `n=v=0` | `M=K^{Cl(U)}`, dimension `#Cl(U)` for every `F,D` | holds | Check |
| §2.2 split algebra, nonzero weight | `M₂(ℚ)`, `GL₂(Ẑ)`, `(10,−5)` | `SL₂(ℤ)` Zariski dense in `SL₂`, so `Sym^{10}` has no invariants: space `0`, although `Δ∈S₁₂` | classical ≠ cusp | Check |
| §2.2 change of splitting | `ι′=hιh⁻¹`, `Φ(P)=P|h⁻¹` | `Φ(P|ι(g))=P|ι(g)h⁻¹=Φ(P)|hι(g)h⁻¹`; level law `φ′(γgu)=φ′(g)|′u` | holds | stated |
| §3.1 inversion | `η=diag(ϖ,1)` | `η⁻¹=ϖ⁻¹diag(1,ϖ)`; `diag(1,ϖ)=wηw⁻¹∈GL₂(𝒪)ηGL₂(𝒪)`; `T_{η⁻¹}φ=Σ(φ|ϖ⁻¹)|x_t=S_v⁻¹T_vφ` | holds for `Δ=D_fˣ` | stated |
| §3.1 central-character Check | trivial coefficients, character `ψ` | `(S_vφ)(g)=φ(gϖ_v⁻¹)=ψ(ϖ_v)⁻¹φ(g)` | `S_v⁻¹T_v=ψ(ϖ_v)T_v` | Check added |
| §3.1 division place | `D_v` division | `𝒪_{D_v}ˣ` normal (preserves `nrd`); `𝒪ˣΠ𝒪ˣ=Π𝒪ˣ` | one coset, no `q_v+1` relation | Check added |
| §3.1 commutativity | `U_v` against `⟨d⟩=[U diag(1,d)]` | `diag(1,d)diag(ϖ,1)=diag(ϖ,d)=diag(ϖ,1)diag(1,d)`; `diag(1,d)` normalises `U₁` | commute | stated |
| §4.3 `N>e_v/(p−1)` | `ℚ_p` with `p` odd, `ℚ₂`, `ℚ₃(√−3)` | `N=1` (`1>1/(p−1)`), `N=2`; `e=2`, `ζ₃∈1+(1−ζ₃)𝒪`, `log ζ₃=0` | the bound is needed | rewritten, Check added |
| §4.3 domains cover affinoids | open polydisc `max|T_i|<1` | an affinoid has a maximum `b<1` of `|T_i|` | holds | stated |
| Layer 5 target `κ′_τ`, scalar action | `n=τ^{n_τ}n^τ`, `ν₀′=ν₀τ^{r_τ}` | `τ^{−n−2}·τ^{2n+2}=τ^n`, so `n(u)ν₀(u)²` is unchanged | holds | intro |
| §5.1 analytic Bol | `F_v=ℚ_p`, trivial `κ`, `diag(p,1)` | `D(f(pz))=p·f′(pz)`; twisted target gives `1·p·f′(pz)`, normalised gives `f′(pz)` | twisted target required | Check added |
| §5.2 `Θ_τU_v=τ(π_v)^{r_τ}U′_vΘ_τ` | `det x_α=ϖ`, `e=1` | twisted over normalised `=τ(ϖ)^{r e}` | holds; over `ℚ` this is `p^r` | stated |
| §5.2 `ℚ` untwisting | `c^{−r}`, `c(g)^{−r}c(gx⁻¹)^r=c(x)^{−r}` | the term becomes `|nrd x|_f^{−r}(Θ^rφ)|_{κ″}x` | `Θ^rT_η=|nrd η|_f^{−r}T″_ηΘ^r` | kept |
| §5.2 no untwisting for `F≠ℚ` | `ℚ(√2)`, `ε=1+√2` | `ε^m∈U∩Fˣ`, `τ(ε)^{2mr}≠1` | holds for every totally real `F≠ℚ` (unit rank ≥1) | Check |
| §5.3 partial identity at one label | `F=ℚ` | `W=M_cl`, `c_τ=p^r`; `c^{−r}` conjugates `U′_{norm}` to `U″`, so `H_{κ′,norm}=H_{κ″}` | recovers `det(1−TU_p|M_cl)H_κ′(p^rT)` | stated |
| §5.3 cutoff | `e_v=2`, `n_τ=0` | `v_p(τ(π_v))=1/2`; cutoff `1/2`, so `v_p(μ)=3/4` is not covered | holds | Check added |
| §5.3 several places | `‖U_v‖≤1` for each `v`, `μ=∏μ_v`, `v_p(μ)≤h` | each `v_p(μ_v)≤h<min r_τ/e_v` | holds | stated |
| Layer 5 Example | `F` real quadratic, `p` split | one label per place, `e=1`, `r_i=n_i+1`, `n_1+2v_1=n_2+2v_2` | cutoffs `n_i+1` | Example added |

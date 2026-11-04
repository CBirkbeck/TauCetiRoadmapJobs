# Review of QuaternionicModularForms (pull request #934 at 84012cc)

**Verdict:** needs changes

Full review of the repaired head. The gate passes on every check (build included), the dependency check reports no problem, and the eleven findings of the previous review are repaired (table under Verified sound). What remains is one missing hypothesis in the Williams comparison (P2) and six P3 items: a false Check, three supplier or library citations that do not say what they are cited for, an undefined Hecke operator in a stated relation, and an undefined level with two style nits.

## R01 (P2) — The comparison with Williams needs a growth condition on his space

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:755`–`775`, “Prove that `Φ ↦ Φ·|det|_𝔸^{−k/4}` is an isomorphism from Williams's space onto `⊕_ω S_{k,k}(Ω₁(𝔫),ω)`”, with Williams's space described at lines 755–760 by his Definition 1.2.

**Claim:** the twist is an isomorphism from the space of Williams's Definition 1.2 onto a sum of spaces of automorphic cusp forms.

**Witness:** `williams` lines 199–217 list the five conditions of Definition 1.2: `SU₂(ℂ)×ℂˣ`-covariance, right `Ω₁(𝔫)`-invariance, left `GL₂(K)`-invariance, one Casimir eigenvalue equation, and vanishing of the unipotent integral. There is no moderate-growth (or `K`-finiteness-and-growth) condition. The target `S_{k,k}(U,ω)` is finite dimensional (ALS.F.6(i)), whereas the literal space is infinite dimensional: on a truncation `y ≤ Y` of each cusp region the Dirichlet problem for the Casimir eigen-equation (an elliptic equation on the vector bundle over the compact truncated core, `Y` chosen so that `k²/2+k` is not a Dirichlet eigenvalue) has a solution for every boundary datum; extending each nonzero Fourier mode into `y > Y` by its second-order ODE with the Cauchy data from the core gives a `C¹`, hence smooth, global eigensection, and vanishing of the constant term is two linear conditions per cusp on the datum. The generic such eigensection has `I`-Bessel (exponential) growth and satisfies all five conditions. Williams's own Fourier expansion at `williams` line 256 is taken from Hida, whose definition carries the growth condition.

**Repair:** in the description of Williams's space at line 756 add the moderate-growth condition (state it as part of the definition, citing that his Fourier expansion presupposes Hida's definition), and keep the theorem as stated. With that hypothesis both sides are the cuspidal, `K_∞`-finite, `Z(𝔤)`-finite, moderate-growth functions of the same type, and the isomorphism claim is the one the roadmap proves. Record the omission under Source issues (done below).

## R02 (P3) — The §2.4 Check identifies `𝒜_ℂ(U,1)` with the wrong class set

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:639`–`640`: “For totally definite `D` over `ℚ` and `W=ℂ`, `𝒜_ℂ(U,1)` is the space of functions on `Cl(U)`, the trivial-coefficient `M(U,ℂ)`.”

**Claim:** `𝒜_ℂ(U,1) ≅ M(U,ℂ)`.

**Witness:** the definition at line 616 imposes `f(zgu)=f(g)` for every `z∈𝔸_ℚˣ`, so `𝒜_ℂ(U,1)` is the functions on `Dˣ\D_fˣ/U𝔸_{ℚ,f}ˣ = Cl(UẐˣ)` (the archimedean part is constant: `J_ℂ` contains the Casimir, which acts on the `Sym^n` isotypic part of a `K_∞`-finite function on `ℍ¹` by a nonzero scalar for `n>0`, and `ω=1` kills the `ℝ_{>0}` direction). Take Hamilton's algebra, the Hurwitz order and `U=U₁(13)` at `13`, maximal elsewhere. Then `U₁(13)ℤ₁₃ˣ=U₀(13)`, so `𝒜_ℂ(U,1)` has dimension `#Cl(U₀(13))`. By §0.3 the fibre of `Cl(U₁(13))→Cl(U₀(13))` over `[x]` is the orbit set of `Γ_x` on `(ℤ/13)ˣ` through `d mod 13`. `Γ_x` is a subgroup of a maximal-order unit group (the binary tetrahedral group, order 24) whose reduction lies in a Borel of `SL₂(𝔽₁₃)`; `Q₈` is not in a Borel (`[i,j]=−1` is not unipotent), so `Γ_x` is cyclic of order at most `6`, every orbit count is at least `12/6=2`, and `#Cl(U₁(13)) ≥ 2·#Cl(U₀(13)) > dim 𝒜_ℂ(U₁(13),1)`. The Check holds only when `U ⊇ Ẑˣ`, for example at `U₀(𝔫)` or the maximal level.

**Repair:** replace the Check by “`𝒜_ℂ(U,1)` is the functions on `Dˣ\D_fˣ/U𝔸_{ℚ,f}ˣ`; the sum of `𝒜_ℂ(U,ω)` over the finitely many `ω` trivial on `𝔸_{ℚ,f}ˣ∩U` is `M(U,ℂ)`, as in §2.5”, and add the `U₁(13)` instance above as the negative control. On that instance the repaired statement gives `#Cl(U₀(13))` on the left and `#Cl(U₁(13))` for the sum, which §0.3 distinguishes.

## R03 (P3) — ALS.5b.8 does not state Clozel's purity lemma

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:751`–`752`: “Cusp forms of type `V_λ^∨` with `λ_τ=(a,b)`, `λ_τ̄=(a′,b′)` vanish unless `a−b=a′−b′` (Clozel's purity lemma, ALS.5b.8)”, used by the Check at line 800.

**Claim:** ArithmeticLocallySymmetricSpaces ALS.5b.8 supplies the purity condition on the weight.

**Witness:** at the open head of ArithmeticLocallySymmetricSpaces, ALS.5b.8 (its README line 4647 onward) is “Rational cohomology at a non-Eisenstein ideal is cuspidal and lives in `[q₀, q₀+ℓ₀]`”, for `GL_n` over a CM field with a Galois-type maximal ideal; its proof text does not contain the weight condition. The only “Clozel's lemma” in that README is ALS.F.7(iv) (lines 1085–1089 and 4520), the `L`-algebraic to `C`-algebraic twist, a different statement. No other section of that README or of AutomorphicFormsOnReductiveGroups mentions purity.

**Repair:** either state the purity lemma as a target of §2.6 with its own source (Clozel's purity lemma in *Motifs et formes automorphes*, 1990; cite its locator or mark it uncertified), or derive the `GL₂` case from ALS.F.7(iii)'s weight condition if that is what is intended, naming the section that states it. The instance `λ_τ=(1,0)`, `λ_τ̄=(0,0)` must then give `S=0`, which the present citation does not supply.

## R04 (P3) — The AdelicAlgebraicGroups §4.5 contract drops the supplier's noncompactness hypothesis

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:167`–`169`: “§4.5 the class-set bijection `G(F)\G(𝔸_f)/U ≃ D(F)\D(𝔸_f)/ν(U)` for connected reductive groups with simply connected derived group”.

**Claim:** the bijection holds for every connected reductive `G` with simply connected derived group.

**Witness:** AdelicAlgebraicGroups §4.5 at its open head (its README lines 4999–5003) states the bijection for `G^der` simply connected **and `G^der(F_∞)` noncompact on each `F`-simple factor**, with target `ν(G(F))\D(𝔸_{F,f})/ν(U)`. For a totally definite `D`, `D¹(F⊗ℝ)` is compact and the bijection is false: with the `U₁(13)` level of R02, `nrd(U₁(13))=Ẑˣ`, so the abelianised set `ℚˣ_{>0}\𝔸_{ℚ,f}ˣ/Ẑˣ` has one element while `#Cl(U₁(13)) ≥ 2`. The roadmap applies the bijection only to `GL₂=GL_1(M₂(F))` (line 631), where the hypothesis holds.

**Repair:** state the supplier's hypothesis in the contract (“`G^der(F_∞)` noncompact on each `F`-simple factor, satisfied by `GL₂`; not by `GL_1(D)` for definite `D`”) and the target as `ν(G(F))\D(𝔸_{F,f})/ν(U)`.

## R05 (P3) — `T_{v²}` is undefined and the constant in the local relation depends on it

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:823`: “prove their local relations (`T_v²−T_{v²}=q_vS_v` at good primes in the normalisation of §1.3)”.

**Claim:** a local Hecke relation with the constant `q_v`.

**Witness:** `T_{v²}` is defined nowhere in the README. In the spherical Hecke algebra at a good prime with `T_v=[K diag(ϖ,1) K]` and `S_v=[KϖK]`, counting right cosets gives `(q+1)² = (q²+q) + (q+1)`, so `T_v² = [K diag(ϖ²,1) K] + (q_v+1)S_v`. The stated constant `q_v` is right only when `T_{v²}` is Hecke's operator attached to all integral matrices of determinant valuation `2`, which is `[K diag(ϖ²,1) K] + S_v`; with the single double coset the constant is `q_v+1`.

**Repair:** define `T_{v²}` (as the sum of the two double cosets of determinant valuation `2`, or as the single double coset with the relation `T_v²=T_{v²}+(q_v+1)S_v`), and add the coset count above as a Check. State what the §1.3 normalisation does to `S_v` (the factor `ν_alg(ϖ_v)²` between the algebraic and normalised twists).

## R06 (P3) — The acceptance file names a Tau Ceti declaration that does not exist at the pin

**Location:** `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean:14`: “substitutes polynomials without constant term into it (`MvPowerSeries.restrictedSubst`)”.

**Claim:** the pinned Tau Ceti has `MvPowerSeries.restrictedSubst`.

**Witness:** `restrictedSubst` occurs nowhere in the pinned Tau Ceti or Mathlib (searched both trees). Tau Ceti's only power-series substitution file is `TauCeti/RingTheory/PowerSeries/Substitution.lean`, which proves one theorem, `TauCeti.hasSubst_binomialSeries_sub_one`, on top of Mathlib's `PowerSeries.subst` (`Mathlib/RingTheory/PowerSeries/Substitution.lean:157`), whose side condition `HasSubst` needs a nilpotent constant coefficient. The conclusion of the docstring (no analytic Möbius substitution at the pins) is right; the name is not.

**Repair:** replace the parenthesis by Mathlib's `PowerSeries.subst` with its `HasSubst` condition, and keep the sentence that `(az+b)/(cz+d)` has constant term `b/d`, which that condition excludes.

## R07 (P3) — An undefined level, a missing locator and LaTeX markup

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:755`, `:766`–`768` (`Ω₁(𝔫)`); `:462` (the weight dictionary); `:729` (`\overline{Sym^k(ℂ²)}`).

**Claim:** the reader can identify `Ω₁(𝔫)`, the source of the dictionary `k_σ=n_σ+2`, `w_σ=v_σ+n_σ+1`, and the conjugate representation.

**Witness:** `Ω₁(𝔫)` is used five times and defined nowhere; it is not `U₁(𝔫)` of §0.2 (no condition on `a`): `williams` lines 191–197 define it by `c∈𝔫Ô`, `a,d∈1+𝔫Ô`. The dictionary is Buzzard, *Eigenvarieties*, §8, p. 70 (`buzzard-eigen` line 2511), listed in References but not at the claim. `\overline{…}` is LaTeX markup inside a code span.

**Repair:** define `Ω₁(𝔫)` where it first appears (§2.6 or Conventions) and say that it is strictly smaller than `U₁(𝔫)`; add “(Buzzard, *Eigenvarieties*, §8, p. 70)” at line 462; write the conjugate factor in words or as `Sym^k(ℂ²)` with a conjugation bar in Unicode.

## Verified sound

**Gate and build.** The worker's gate at this head passes every check (`set_option=0 … build=0 OK`). I elaborated `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean` with `lake env lean` from the worktree: no output (no error, no warning; the file declares nothing). No file outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty); the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. No `set_option`, no LaTeX delimiters, no pull-request numbers, no process words (grep for former/previous/now/removed/round/checkpoint: none), no copied passages, no algorithms, no suspicious instructions.

**Dependency check**, run with `--movable` against the merge order and main:

```text
depcheck: 203 roadmaps, 1656 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The reciprocal edges of the previous R01 are gone: AdelicAlgebraicGroups at its open head no longer mentions QuaternionicModularForms (grep: 0 hits); AutomorphicFormsOnReductiveGroups names it only as a consumer (its lines 12, 1321); GL2AutomorphicRepresentationsAndTransfer (order position 87) and HilbertModularVarietiesAndShimuraCurves (146) consume this roadmap (64) and are cited here only under Downstream consumers. HilbertModularVarietiesAndShimuraCurves' contract (its lines 134–136) still expects an “order interface” and compact stabilisers from §§0.1–0.3 here, which this head consumes from AdelicAlgebraicGroups §5.3; that is drift on the consumer's side, not a defect of this folder. KleinianGroups is an open pull request by another author adding a new folder; its Layer 0 (upper half-space, Möbius action) and Layer 3 (`bianchi`, line 325) exist. No supplier gaps are declared, and none is needed.

**Previous findings.**

| Previous | Status at this head |
| --- | --- |
| R01 reciprocal suppliers | Repaired: norms, class sets and stabilisers consumed from AdelicAlgebraicGroups §§4.6, 5.3 (lines 44–53); carrier, evaluation, Hecke, Gross model from AutomorphicFormsOnReductiveGroups §§7.4–7.6 (54–59); no supplier later in the order is cited. |
| R02 definite comparison tensor | Repaired: `M_E(U,λ)` over `E` with `j:E↪K`, `ι:E↪ℂ`, two scalar extensions, no map `K→ℂ` (lines 654–699); the rank-one Check gives `M(U,K)` and `M(U,ℂ)` from one `E`-space. |
| R03 Williams twist | Repaired: explicit twist `|det|_𝔸^{−k/4}`, direction, central-character shift `|·|_𝔸^{−k/2}`, Hecke factor `|det η|_𝔸^{∓k/4}`, Euclidean convention sourced at `williams` lines 377 and 781 (lines 755–795). R01 above is a new, different point on the same target. |
| R04 headline acceptance | Repaired: the file states nothing and its docstring names each headline with its missing carrier; see headline coverage below. |
| R05 padding | Repaired: no declarations remain. |
| R06 imports | Repaired: `import Mathlib` only. |
| R07, R08 commit links and process history | Repaired: suppliers by name and section; `blob=0`, `prnum=0`; the pinned PhD link is an external implementation reference under Existing Lean work, as that review allowed. |
| R09 shape | Repaired: title and Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, layers with `*Needs:*` lines (counted 40), API bullets, three or more Checks per definition (§1.2 now 3, §0.3 3, §2.4 4, §2.5 5, §2.6 5), Examples and Dependencies at every layer end. |
| R10 locators | Repaired at every sampled claim (table below); only the §1.3 dictionary lacks its claim-level locator (R07). |
| R11 Lean/README reconciliation | Repaired by the empty file; every backticked name of the roadmap's own in the README is prose, none claims a Lean declaration (`readme-ids-missing=0`). |

**Headline coverage.** The README's end theorems: compactness of `U_π` (§3.3); Fredholm series, finite-slope summands and slope bounds (§§4.1–4.2); integrality and comparison of the annular series (§4.4); the factorisation and small-slope classicality (§5.3); the definite automorphic realisation (§2.5); the Bianchi comparisons (§2.6); the theta–Hecke relation (§5.2). None is statable at the pins: the analytic weight action needs substitution of a series with unit constant term into a restricted series (Mathlib's `PowerSeries.subst` requires a nilpotent constant coefficient, `Mathlib/RingTheory/PowerSeries/Substitution.lean:157`; RestrictedPowerSeries §2.2 is a roadmap target, not a declaration); the characteristic series `det(1−TU)` of a compact operator on a nonarchimedean Banach module exists in neither library (Tau Ceti's `TauCeti/Analysis/Fredholm/*` files are index theory; Mathlib's `IsCompactOperator`, `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean:69`, carries no determinant); automorphic forms, `(𝔤,K_∞)`-modules and cuspidal cohomology are ArithmeticLocallySymmetricSpaces targets. The class-set and stabiliser theorems that the previous file stated are now AdelicAlgebraicGroups §5.3's. The docstring names each headline and its lack (R06 corrects one library name in it). An empty acceptance file is the correct form here; no padding, no stand-in.

**Supplier citations resolved** (open heads via `roadmaps show`; main for the others).

| Citation | Where it resolves |
| --- | --- |
| AdelicAlgebraicGroups §1.2, §1.5, §3.4 *class-number-finite*, §4.5, §4.6 *quaternion-norm-images*, §5.3 *quaternion-class-sets*, *definite-quaternion-stabilizers* | its README lines 1161, 1366, 3186, 4925, 5008–5027, 5403–5448. §5.3 states the class set finite for every compact open `U` and every quaternion algebra, and `Γ_x/Z_x` finite for compact `U` with `D` totally definite, finite over `ℚ`: exactly what lines 170–172 assume. §4.6 gives `ℝ_{>0}` at ramified real places and the determinant comparison under splittings (§0.1). The hypothesis omission in §4.5 is R04. |
| ArithmeticLocallySymmetricSpaces ALS.F.1, F.5, F.6 (i),(iv), F.7 (iii) `(q₀,ℓ₀)=(1,1)` for `F` imaginary quadratic and `n=2`, 0.4, 0.6–0.8, 1.1, 1.3, 3.1, 5b.1, 5b.4, 5b.5 | lines 580, 949, 987–1056 (`LocallySymmetric.AutomorphicForm` at 989 and 1026, so the resolver's lead is a planned name, not a missing library name), 1058–1100 (`q₀=[F⁺:ℚ]n(n−1)/2=1`, `ℓ₀=[F⁺:ℚ]n−1=1`), 1301, 1391, 1433, 1459, 1755, 1892, 2683 (`[UαU]·m=Σ_i α_i m` for `UαU=⊔α_iU`, matching Convention 9), 4250, 4376, 4452 (the cuspidal decomposition with the central character on `A_∞` inverse to that of `V`, matching `ω_∞=|·|_ℂ^{−k}` for `V_{k,k}`). 5b.8 is R03. |
| AutomorphicFormsOnReductiveGroups §2.3, §2.6, §4.3, §7.2, §7.4 (`(f|δ)(g)=f(gδ⁻¹)|δ`, `T_ηf=Σ_t f|x_t` for `JηJ=⊔_tJx_t`, `S_ε∘S_δ=S_{δε}`, `inverseActionHeckeEquiv`, `LevelAlgebraicModularForm`, Gross model `f(g)=ρ(g_p)⁻¹F(g)`, `algebraicModularForm_iff_levelCovariant`, the `S₃` check), §7.5 (`automorphicEquiv`, hypotheses `G(F_∞)/A_∞` compact and `Z_G(F)` discrete in `Z_G(𝔸_f)`, which hold for definite `D` over `ℚ` and fail over a real quadratic field as the §2.5 Check says), §7.6 (`CentralCharacterAlgebraicModularForm`) | lines 389, 461, 661, 1152, 1222–1248, 1249–1269, 1270–1290. Conventions 4 and 9 agree with §7.4 and ALS.3.1: `T_η=Σ_t f(·x_t⁻¹)=[Uη⁻¹U]`. |
| RestrictedPowerSeries §§0.1, 1.1–1.3, 2.1–2.4; PadicFunctionalAnalysis §§0.3–0.4, 1.1–1.4, 2.1–2.2, 2.6, 3.2, 4.1–4.6, 5.2–5.6 (`H`, gauge `‖T‖=α`, `T↦t`, `(p,T)=(T)` at its lines 982–1028); CompactOperators §§0.1–0.3, 1.2, 1.4 (diagonal intertwining without bounded inverse, lines 400–416), 1.5, 1.6 (block-triangular factors, 432–442), 1.7 (`c0_completedBaseChange`, 461), Layers 3–4, `IsRowCompact` (44, 102); NewtonPolygons Layers 2, 4; AdicSpacesPartII R0.5 *completed-tensor-banach-module* (2759, 2789); ReductiveGroups Layer 6 (466) | all on main at the stated headings. |
| Downstream consumers | GL2AutomorphicRepresentationsAndTransfer R17.3 (its lines 1662–1746) and HilbertModularVarietiesAndShimuraCurves R18.3 (2701–2859) cite §§0.3, 1.3, 2.1–2.2, 3.1 here, as listed. |

**Pinned declarations opened** (paths relative to each library root): `QuaternionAlgebra.normForm` `TauCeti/Algebra/Quaternion/NormForm.lean:78`, `normForm_mul` `:130`; `reducedTrace_eq_of_algEquiv` `AlgEquiv.lean:93`, `normForm_eq_of_algEquiv` `:114` (both with `IsRegular (2:R)`, as the contract says), `map_star_of_algEquiv`, `trace_mulLeft` (named at `:10`, `:27`); `TauCeti.QuaternionAlgebra.baseChange` `BaseChange.lean:101`; `Split.lean`, `CentralSimple.lean` present; Hecke ring files `Basic`, `Multiplication`, `Associativity`, `One`, `Representation` present; `PowerSeries.IsRestricted.subring` `Mathlib/RingTheory/PowerSeries/Restricted.lean:87` (abbrev `IsRestricted` at `:28`), normed and complete by `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean` (`TauCeti.PowerSeries.norm_eq_gaussNorm` at its line 34); `TauCeti.SU2.symPower` `SU2/SymmetricPower.lean:97`, `isIrreducible_symPower` `SU2/Irreducible.lean:164`; `IsHeckeTriple` `Mathlib/NumberTheory/HeckeRing/Defs.lean:75`, `HeckeCosetModule` `:20`; `DoubleCoset.Quotient` `Mathlib/GroupTheory/DoubleCoset.lean:79`; `PowerSeries.derivative` `Derivative.lean:49`; `SymmetricPower` `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:52`; `IsCompactOperator` `Compact/Basic.lean:69`; `ZeroAtInftyContinuousMap` `ZeroAtInfty.lean:45`; `Matrix.charpoly` `Charpoly/Basic.lean:132`; `NumberField.IsTotallyReal` `TotallyRealComplex.lean:47`; `IsDedekindDomain.FiniteAdeleRing` `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean:94`; `IsModuleTopology` `ModuleTopology.lean:133`; `Algebra.IsCentral` `Mathlib/Algebra/Central/Defs.lean:67`; `IsSimpleRing` `SimpleRing/Defs.lean:27`. Only `MvPowerSeries.restrictedSubst` (R06) is missing. Duplication by object: no second owner of the half-weighted annular model, the definite Banach form spaces, the certified matrices or the quaternionic theta was found in Mathlib, Tau Ceti, main, or the open heads read; the class-set, stabiliser, carrier, evaluation and Hecke objects are correctly cited rather than restated.

**Seeded source audit.** Nine texts read through the sources service (Buzzard's two papers and Jacobs's thesis from Buzzard's author page; the rest from arXiv); Gross and Harder 1987 are paywalled and uncertified. A first fetch of “families.pdf” returned Buzzard's expository *Families of modular forms* (11 pages); the cited paper is *On p-adic families of automorphic forms* (`GL1.pdf` on the same page), which is what the table uses. Pages are printed pages of the versions read.

| Sample | Locator examined | Supports the statement as written? |
| --- | --- | --- |
| 0.1 | AdelicAlgebraicGroups §4.6 lines 5008–5027 (local image `ℝ_{>0}` at ramified real places, determinant under splittings); `trace_mulLeft` | Yes. Division algebra from definiteness is an elementary deduction stated as such. |
| 0.2 | AdelicAlgebraicGroups §1.5 line 1366; `williams` lines 191–197 for `Ω₁` (contrast) | Yes; indices and reduction maps recomputed below. |
| 0.3 | AdelicAlgebraicGroups §5.3 lines 5403–5425 (finite class sets, surjective refinement); `loeffler` lines 691–705 (Assumption 3.1.3, Proposition 3.1.4, p. 15) for the stabiliser theorem consumed there | Yes; the fibre bijection is the roadmap's own elementary target. |
| 0.4 | `jacobs` lines 719–732, Definition 1.27, p. 19: `Σ_α` is `p^α | c`, `p ∤ d`, `det ≠ 0` | Yes: `Σ_α = Σ₀(α)` as stated at line 345. |
| 1.1 | `jacobs` lines 733–746, (1.5.13), p. 19; `buzzard-families` lines 672 and 943 (the same action with `(cz+d)^{k−2}` on `L_k` at 494) | Yes: `n(u)=κ_J(u)u⁻²`; the extracted texts drop the minus sign of the exponent, the classical action at `buzzard-families` line 494 fixes it. |
| 1.2 | `buzzard-eigen` §10 and Lemma 8.1 as used at lines 2890–2896 | Yes for the action; the row bound `σ^{|m|}` is a deduction from the geometric series, recomputed below. |
| 1.3 | `buzzard-eigen` lines 2430–2451 (`L_{n,v}`, `n+2v` parallel), line 2511 (`k=n+2`, `w=v+n+1`, p. 70) | Yes; the claim-level locator is missing (R07). |
| 1.4 | `buzzard-eigen` lines 2715–2727 (discs `B_{r|π^s|}`, thickening) | Yes. |
| 2.1 | AutomorphicFormsOnReductiveGroups §7.4 lines 1222–1226 (evaluation equivalence with no finiteness); `jacobs` lines 757–765, Lemma 1.31, p. 19 | Yes. |
| 2.2 | `buzzard-eigen` lines 2716–2727, Proposition 11.1, p. 75 (full `GL₂(O_p)` component, reduced affinoid, thickening to `B_{r|π^{s+t}|}`); lines 2842–2876, Lemma 12.1, p. 78 | Yes, with the source's hypotheses carried (line 560). |
| 2.5 | `loeffler` lines 1047–1071, Proposition 3.8.1, p. 22 (fixes `ι:E↪ℂ`); AutomorphicFormsOnReductiveGroups §7.4–7.6 as above | Yes; no map `K→ℂ` is used at this head. |
| 4.1 | `buzzard-eigen` lines 2880–2896, Lemma 12.2, pp. 78–79; 2920–2932, Lemma 13.1, pp. 79–80; CompactOperators §§1.4–1.5 | Yes; intrinsic determinants are the supplier's. |
| 4.2 | `lwx` lines 692–712, Proposition 2.17, p. 15; CompactOperators §1.2 | Yes; the `h`-repeated row bound is a deduction, recomputed below. |
| 4.4 | `lwx` lines 1141–1156, Proposition 3.14, p. 21 (`𝔪^{max(m−⌊n/p⌋,0)}` for `a∈pℤ_p`, `𝔪^{max(m−n,0)}` on `M₁` = `q|c`, `p∤d`, `det≠0` at line 464); lines 826–846, Proposition 3.4 (`P_{mn}` as the `m`th Mahler coefficient); lines 1837–1876, §5.4, p. 34 (full weighting `T^n`, column decay); 1776–1824, Example 5.2 and Remark 5.3 | Yes; the `⌊n/2⌋` weighting is correctly flagged as new, and `(p,T)=(T)` in `H` is PadicFunctionalAnalysis §5.6's (its line 1015). |
| 5.2 | `buzzard-families` lines 868–891, §7, p. 19: `θ^{1−k}` with factor `(|ν(g)|det g_p)^{1−k}`, `[UηU]θ=|ν(η)|^{k−1}θ[UηU]`, `T_ℓθ=ℓ^{1−k}θT_ℓ` | Yes: with `k_Buzzard=k+2`, `r=k+1`, this is `Θ^r T_η=|nrd η|_f^{−r}T′_ηΘ^r` and `c(g)^{−r}`. |
| 5.1, 5.3 | `buzzard-families` lines 881–884 (Bol with `(ad−bc)^{k−1}(cz+d)^{−k}`), 893–909, Proposition 4, p. 19 (`v_p(λ)<k−1` classical, Neumann argument with `‖U_p‖≤1`) | Yes; strict inequality and the norm hypothesis are carried (line 1101). |
| 2.6 | `williams` lines 191–217 (Definitions 1.1–1.2, pp. 4–5), 237–249 (Theorem 1.3, p. 5), 377 and 781 (Euclidean `|·|`, pp. 7 and 13); `sengun` lines 555–561, §5, p. 14 (`H¹_cusp(Γ,V_{k,k}(ℂ))≃S_{k+2}(Γ)`) | Convention and `H¹` statement supported; the growth omission is R01; Theorem 1.3's component count is a source error (below); Harder's proof uncertified, as marked. |

**Computed adversarial pass.** “Pass” records agreement on the instance. Scripts ran on exact rational arithmetic (truncated power series for Bol, finite differences for Mahler coefficients, an exponent grid over `p∈{2,3,5,7}`, `0≤m,n<80`).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 regular determinant vs `nrd` | `diag(2,1)` in `M₂(ℚ)` | `nrd=2`, `det(left mult.)=4=2²`; reduced trace `3`, regular trace `6=2·3` | Pass |
| §0.1 definiteness | `ℍ[ℚ]`, `q=1+i`; `M₂(ℚ)`, `diag(1,−1)` | norms `2>0` and `−1` | Pass; the Check separates the two |
| §0.2 indices | `q=3`: `t=1` gives `4`, `8`; `t=2` gives `12`, `72`; primitive rows mod `9`: `81−9=72` | formulas `q^{t−1}(q+1)`, `q^{2t−2}(q²−1)` | Pass |
| §0.2 last-row map well defined and injective | `u∈U₁`: `(0,1)u≡(0,1)`; `(0,1)γ′≡(0,1)γ ⇒ γ′γ⁻¹∈U₁` | both directions | Pass |
| §0.2 `c(η_p)` | `p=5`: `π=p` gives `1`, `π=2p` gives `2`; `ℓ=3≠p`: `c=1/3` | `|nrd|_f·det(g_p)` | Pass; matches the Check |
| §0.2 global scalar | `nrd γ=2`: `|nrd|_f=1/2`, `det γ_p=2`, `c=1` | product formula | Pass |
| §0.3 fibre formula | `U′=U`: fibres of size `1`; Hurwitz level, `U′=U∩U₁(3)`: `U/U′` has `8` elements, `Γ_1≅SL₂(𝔽₃)` of order `24` acts transitively, `#Cl(U′)=1`; mass check `8/24=1/3=1/#Γ′` with `#Γ′=3` the row stabiliser | | Pass |
| §0.3 `U₁(13)` instance (R02, R04) | fibres `≥12/6=2`; `U₁(13)ℤ₁₃ˣ=U₀(13)`; `nrd(U₁(13))=Ẑˣ` | | Refutes the §2.4 Check and the unhypothesised §4.5 contract |
| §0.4 coset representatives | `π=3`, `t=2`: `x_αx_{α′}⁻¹=((1,0),(3^{t−1}(α−α′),1))` for `(α,α′)=(0,1),(0,3),(1,4)` gives lower-left `−3`, `−9`, `−9` | in `U₀(9)` iff `α≡α′ mod 3` | Pass |
| §0.4 `x_α∈UηU` | `x_α=η·((1,0),(π^tα,1))` with the second factor in `U` | | Pass |
| §0.4 `c` condition | `((1,0),(1,1))`, `z=−1 ↦ ∞` | | Pass |
| §1.1 scalar action | `2I`, `n=u³`: `ν₀=1` gives `8`, `ν₀(u)=u` gives `32=8·4` | `n(u)ν₀(u)²` | Pass |
| §1.1 Jacobs dictionary | `κ_J=u^k ε`: `n=u^{k−2}ε`, degree `k−2`; `κ_J=u²`: `n=1` | sign of the exponent fixed by `buzzard-families` line 494 | Pass |
| §1.1 `p=2` exponential | `exp` converges for `|x|<2^{−1}`, i.e. on `4ℤ₂` | | Pass |
| §1.2 right-action law | `γ=diag(3,1)`, `δ=((1,0),(3,1))`, `z=1`: `w_γ(w_δ(1))=3/4=w_{γδ}(1)`, reversed `3/10` | | Pass; a left-action formula fails |
| §1.2 row bound | `w=b/d+(det/d²)z(1+(c/d)z)⁻¹`: `z^m` coefficient `(det/d²)(−c/d)^{m−1}`, norm `≤σρ^{m−1}≤σ^m`; products of `r` factors keep `σ^{Σm_i}` | `γ=((1,0),(p,1))`: `(−p)^{m−1}` with `det=1` outside the hypothesis | Pass |
| §1.2 generating series | `w=3z`: coefficients `1,3z,9z²` of `(1−Xw)⁻¹` | | Pass |
| §1.3 `ν_alg` vs `ν_norm` | `diag(π,1)`, `v=1`: `π` vs `1`; unit `u`: `u` vs `u` | | Pass |
| §1.3 nonparallel unit | `ℚ(√2)`, `(n,v)=((0,2),(0,0))`: `1+√2` acts by `(1−√2)²=3−2√2`, infinite order | | Pass |
| §1.3 odd scalar | `−I` on `n=1`, `v=0` acts by `−1`; invariants `0` in characteristic `0`, everything over `𝔽₂` | | Pass |
| §2.1 norm | two classes: `max(‖a‖,‖b‖)`; non-isometric `‖·|u‖=p`: coordinate norm scales by `p` | | Pass |
| §2.2 dimension | `[U₀(p^t):U₀(p^{t+s})]=p^s`; one class, trivial stabilisers: `p^s(k+1)` | | Pass |
| §2.3 averaging | `C₂` on `ℤ_2` by sign: `|H|=2` not a unit; `‖1/2‖` is `1` at `p=3`, `2` at `p=2` | | Pass |
| §2.4 constant and Casimir | `W=ℂ`: `J_ℂ∋Ω`, `Ω^m f=0` kills every `Sym^n`, `n>0`; `ω=1` kills `ℝ_{>0}` | gives functions on `Cl(UẐˣ)` | R02 |
| §2.4 dual central character | `Sym²`: `z²` vs `z^{−2}` | | Pass |
| §2.5 homogenisation | `Y^n(f|γ)(X/Y)=(det)^v P(aX+bY,cX+dY)`; `(P|u⁻¹)(v)=(det u)^{−v}P(u⁻¹v)` is the natural action on `Sym^n(std^∨)⊗det^{−v}=(V_λ)^∨` | `λ=(n+v,v)` | Pass |
| §2.5 covariance of `f(g)=ρ(g_p)⁻¹Φ(g)` | `f(γgu)=ρ(u_p)⁻¹f(g)=f(g)|u` | | Pass |
| §2.5 Hecke transport | `Uη⁻¹U=⊔y_t⁻¹U`; `ρ(g_p)⁻¹ΣΦ(gy_t⁻¹)=Σ(f|y_t)(g)` with the algebraic `det^v` | `v=1`, `η=diag(p,1)`: factor `p` against the normalised `T_η` | Pass |
| §2.5 realisation side | `F(g_f,g_∞)=ρ(g_∞)⁻¹Φ(g_f)` is left `Dˣ`-invariant and `v^*↦⟨F,v^*⟩` is `D_∞ˣ`-equivariant from `(V_λ^∨)^∨=V_λ`; central `z∈ℝ_{>0}` acts by the character of `V_λ` | `π_∞≅ι(V_λ)`, `ω_∞` = central character of `ι(V_λ)` | Pass; agrees with AutomorphicFormsOnReductiveGroups §7.5's `V_ℂ^∨` |
| §2.5 dimension | one class, trivial stabilisers, degree `n`: `n+1=Σ m(π)dim(π^∞)^U·1` | | Pass |
| §2.6 `X^G` | `GL₂(ℂ)/U(2)ℝ_{>0}`: `8−5=3` | | Pass |
| §2.6 `τ_k` central triviality | `e^{iθ}`: `e^{i(2k+2)θ}·e^{−2i(k+1)θ}=1`; `k=0`: dimension `3` | | Pass |
| §2.6 `U(2)`-types of a principal series | weights `(n₁,n₂)`; `Sym^m⊗det^j` contains it iff `m+2j=n₁+n₂`, `0≤(n₂−n₁+m)/2≤m`: `m≥|n₁−n₂|`, parity, multiplicity one; `(k+1,−k−1)` gives minimal `τ_k` | | Pass |
| §2.6 Casimir value | `(n²−4−4t²)/8` at `(n,t)=(2k+2,0)` is `k²/2+k`; another unitary series with the same value needs `4t²=n²−(2k+2)²≤0`, i.e. `n=0`, `s=k+1≥1`, outside the complementary range | | Pass; supports the “unitarity up to twist” step |
| §2.6 Williams twist | `k=1`, `z=2`: `1/2·16^{−1/4}=1/4`; split centre `t=3`: `3^{−1}·(3⁴)^{−1/4}=3^{−2}=|3|_ℂ^{−1}` | | Pass |
| §2.6 Hecke factor | `[UηU](Φχ)=χ(η)χ·[UηU]Φ` for `χ=|det|^{−k/4}` trivial on `U`; `η=diag(ϖ_v,1)`: `q_v^{k/4}` | | Pass |
| §2.6 cuspidal degrees | `q₀=1`, `ℓ₀=1`; `Λ¹𝔭≅Λ²𝔭≅Sym²`, each of dimension `3` | | Consistent with ALS.F.7(iii) |
| §2.6 Williams's space without growth | Dirichlet data on a truncation plus ODE extension: infinite-dimensional cuspidal eigenspace | | R01 |
| §2.6 purity | `λ_τ=(1,0)`, `λ_τ̄=(0,0)`: `a−b=1≠0` must give `S=0` | no supplier states it | R03 |
| §3.1 composition order | `S₃`, `f(g)=g(0)`, `a=(01)`, `b=(12)`: `((f|a)|b)(e)=2=f|(ab)(e)`, `((f|b)|a)(e)=1=f|(ba)(e)` | | Pass; opposite-ring law |
| §3.1 eigenvalues on constants | `T_v`: `q_v+1`; `U_v`: `q_v`; `t=0` vs `t≥1` coset counts `q+1` vs `q` | | Pass |
| §3.1 local relation | `(q+1)²=(q²+q)+(q+1)` | constant `q+1` for the single double coset | R05 |
| §3.2 certificate | one class, trivial stabiliser: `B₁₁=Σ_t slash(u(1,t)x_t)`, `#k_v` terms; `jacobs` lines 851–862 | | Pass |
| §3.3 contraction | `diag(1,π,π²,…)`: rows null; `f(z₁,z₂)↦f(pz₁,z₂)`: `z₂ⁿ` fixed, not compact | | Pass |
| §4.1 | `f(z)↦f(πz)`: `H=∏(1−π^jT)`; nilpotent `U`: `H=1` on a nonzero space | | Pass |
| §4.2 polygon | `h=2`: exponents `0,0,1,1,2,2,3,3`, partial sums `0,0,0,1,2,4,6,9,12`; `h=1`: `n(n−1)/2`, at `n=4` equals `6`, attained by `∏(1−p^jT)` | | Pass |
| §4.2 cutoff bound | `h_U=2`, `v_p(π)=1`, `h=0`: exact maximum `n=2`, convenient bound `4` | `L(n)≤NP(n)≤nh` | Pass |
| §4.2 classical factor | `U_cl=((0,1),(0,0))`: `det(1−TU_cl)=1`, degree `0<2` | | Pass |
| §4.3 Gauss norm of `T` | `v_3(3ⁿ/n!)=n−v_3(n!)`: `1,2,2,…` | `|T|=1/3` | Pass |
| §4.4 Mahler action | `p=2`, `diag(2,1)`, inputs `n=1,2,3`: columns `[0,2,0,0,0]`, `[0,1,4,0,0]`, `[0,0,4,8,0]`; `p=3`: `[0,3,0,0,0]`, `[0,3,9,0,0]`, `[0,1,18,27,0]` | `v_p(P_{mn})≥max(m−⌊n/p⌋,0)` holds | Pass |
| §4.4 exponent inequality | grid `p∈{2,3,5,7}`, `m,n<80`: no counterexample to `w(n)−w(m)+max(m−⌊n/p⌋,0)≥⌈m/2⌉`, none to `w(n)−w(m)+max(m−n,0)≥0`; `p=2`, `m=5`, `n=4` gives `3`, `n=0` gives `3` | | Pass |
| §4.4 row exponents | `⌈⌊j/2⌋/2⌉` for `j<8`: `0,0,1,1,1,1,2,2`; `h=1`, `n=3`: `Σ_{j<3}⌈j/2⌉=2` | | Pass |
| §4.4 character example | `p=3`, `h≤m`: `ψ_m(1+3^hz)=1` iff `z∈3^{m+1−h}ℤ₃`; at `z=(exp 3^h−1)/3^h∈ℤ₃` the value is `ζ_{3^m}^{3^{h−1}}≠1` | | Pass |
| §5.1 Bol | `(a,b,c,d)∈{(2,1,3,1),(1,0,3,1),(5,2,0,1),(3,0,3,1)}`, `r=0..3`, `j=0..2`, at `z₀=1/2`: both sides equal (e.g. `−4/25` for `(2,1,3,1)`, `r=1`, `j=0`); with `bc−ad` the right side is `+4/25` | | Pass |
| §5.2 scalars | `p^r`, `ℓ^r`, `ℓ^{2r}` for `U_p`, `T_ℓ`, `S_ℓ` | `|nrd ϖ_ℓ|_f=ℓ^{−2}` | Pass |
| §5.3 factorisation | `U=((1,7),(0,3))`: `det(1−TU)=1−4T+3T²=(1−T)(1−3T)`; `DV=p^rU′D` gives `H_V(T)=H_{U′}(p^rT)` by `H_{au}(T)=H_u(aT)` | | Pass |
| §5.3 classicality | `v_p(λ)<r`: `‖(p^r/λ)U′_p‖<1`, Neumann; at `v_p(λ)=r` the eigenvalue `λ/p^r` is a unit, the argument fails; `k=0` example: `(1−pT)H_{κ′}(pT)` with the constants of slope `1=r` | | Pass |

## Not verifiable

- **Gross, *Algebraic modular forms* (1999):** DOI `10.1007/BF02780173` resolves only to a paywalled page; cited as consumed through AutomorphicFormsOnReductiveGroups §7.4, which I read instead.
- **Harder, *Eisenstein cohomology of arithmetic groups. The case GL₂* (1987), §3:** paywalled; the README marks it uncertified. Şengün §5 (read) states the `H¹` comparison without proof.
- **Published numbering of Williams (2017):** arXiv v2 was read; the printed version was not compared.

## Source issues

- **Gap** in williams at Definition 1.2, printed p. 4: the source defines cusp forms by covariance, invariance, one Casimir equation and the cuspidal integral, with no growth condition; it should include moderate growth, which the Fourier expansion it takes from Hida presupposes; affects a stated result.
- **Error** in williams at Theorem 1.3, printed p. 5: the source says the level `Ω₁(𝔫)` decomposition has one component per ideal class; it should have one per class of `Kˣ\𝔸_{K,f}ˣ/(1+𝔫Ô_K)ˣ`, since `det Ω₁(𝔫)=1+𝔫Ô_K` by Definition 1.1; affects a stated result.

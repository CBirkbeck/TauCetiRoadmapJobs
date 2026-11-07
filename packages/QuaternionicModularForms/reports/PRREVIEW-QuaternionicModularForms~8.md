# Review of QuaternionicModularForms (pull request #934 at f7ed2fe)

**Verdict:** needs changes

Full review of the whole folder: the head changed by 517 lines since 69e6e45 (the previous review's head), which exceeds the incremental threshold. The previous review (at 69e6e45) accepted the folder with no finding, so there is no earlier finding to re-check; the one finding it had carried (the acceptance docstring's library claim) was repaired at 69e6e45 and stays repaired at this head (`Suggested.lean:14`–`26` unchanged in substance). The present change generalises the roadmap's own versions of material that five consumer roadmaps had restated (group-theoretic refinement fibres, coefficient modules over every commutative ring, level forms at every open level, classical forms for every quaternion algebra, Hecke inversion formulas and the commutative Hecke algebra, families over every `F_v`, partial theta maps and classicality over totally real fields), and the acceptance docstring follows. Three findings remain, one blocking.

## R01 (P2) — Independence of splittings is claimed for the nebentypus variant, where the stated map does not exist

**Location:** `TauCetiRoadmap/QuaternionicModularForms/README.md:664`–`677`, §2.2 "Classical forms": the paragraph defines the spaces "with `Δ=D_fˣ`; at a split place `v|p` whose level component lies in the preimage of `Σ₀(t)`, take `Δ` the elements whose `v`-component lies there and allow §1.3's nebentypus", then states "Prove independence of the splittings: two choices are conjugate … and `φ↦(g↦φ(g)|h⁻¹)` carries the space formed with `ι` onto the space formed with `ι′`, compatibly with level maps and Hecke operators."

**Claim:** for every variant the paragraph defines, including the `Σ₀(t)` monoid with nebentypus `ε`, conjugating the splitting by the Skolem–Noether unit `h` and slashing by `h⁻¹` identifies the two form spaces.

**Witness:** take `n=0`, `v=0`, so `L_{0,0}(K)=K` with `γ` acting by `ε(d_γ mod π_v^t)`, the level component `U_v={γ∈GL₂(𝒪_v): b,c∈π_v^t𝒪_v}` (its image under `ι` and under `ι′=wιw⁻¹`, `w=((0,1),(−1,0))`, both lie in `Σ₀(t)`), and `ε` nontrivial with `ε(α)≠1`. Conjugation by `w` sends `((a,b),(c,d))` to `((d,−c),(−b,a))`, so `d(ι′(u))=a(ι(u))`. For `u=diag(α,1)`: a form for `ι` satisfies `φ(gu)=ε(1)φ(g)=φ(g)`, a form for `ι′` satisfies `φ(gu)=ε(α)φ(g)`. The map `φ↦φ|h⁻¹` with `h=w` is the identity on values (`w⁻¹∉Σ₀(t)`, and on `K` with `(n,v)=(0,0)` the `GL₂(K)`-action is trivial), so it carries a nonzero `ι`-form to a function that is not an `ι′`-form: `(ε(α)−1)φ(g)=0` forces `φ=0`. The `Δ=D_fˣ` case, and the `Σ₀(t)` case without nebentypus, are correct: there the scalar between the normalised and algebraic actions depends only on `det ι(u)=det ι′(u)`, so `φ′(γgu)=φ′(g)|_{ι′}u` follows from `ι(u)h⁻¹=h⁻¹ι′(u)`.

**Repair:** state the independence for `Δ=D_fˣ`, and for the `Σ₀(t)` variant without nebentypus under the hypothesis that `ι′(U_v)⊂Σ₀(t)` as well; for the nebentypus variant require `h` to normalise `ι(U_v)` and to satisfy `d(hγh⁻¹)≡d(γ) mod π_v^t` on `ι(U_v)` (for instance `h∈Kˣ·U₀(π_v^t)`), or drop the nebentypus from that sentence. Add the Check: `u=diag(α,1)`, `ε(α)≠1`, `h=w` as above, where the two spaces impose `φ(gu)=φ(g)` and `φ(gu)=ε(α)φ(g)`.

## R02 (P3) — ALS.5b.4 is cited for a boundary-restriction statement that section does not make

**Location:** `README.md:207` ("ALS.5b.4 boundary restriction" in the ArithmeticLocallySymmetricSpaces contract), `README.md:969`–`970` (Check: "restriction to the boundary tori is nonzero on Eisenstein classes (ALS.5b.4)"), and the Layer 2 Dependencies at `README.md:996`.

**Claim:** ArithmeticLocallySymmetricSpaces ALS.5b.4 supplies restriction to the boundary (tori) of a Bianchi threefold and its nonvanishing on Eisenstein classes.

**Witness:** at #871's head, ALS.5b.4 (`pr871` line 4384) is "The automorphic comparison and Franke's input": the decomposition of cohomology by parabolic classes, with the Check that for `GL_{2,ℚ}` and `V=ℂ` the `{B}`-summand of `H¹(X_K,ℂ)` is spanned by Eisenstein classes (lines 4449–4452). No sentence in ALS.5b.4 defines a restriction to a boundary or evaluates it; boundary strata belong to ALS Layer 2 (Borel–Serre corners, index line 50). The Check's conclusion (cuspidal cohomology is a proper summand in general) is supported by the `{B}`-summand statement, not by a boundary restriction.

**Repair:** at line 207 write "ALS.5b.4 the decomposition by parabolic classes and its Eisenstein (`{B}`) summand"; at lines 969–970 write "Cuspidal cohomology is a proper summand of `H¹(X_U,ℂ)` in general: the `{B}`-summand of ALS.5b.4 is spanned by Eisenstein classes", or cite ALS.2 for the boundary strata if the restriction map is wanted.

## R03 (P3) — Jacobs's `Σ_α` is on page 19, not page 18

**Location:** `README.md:388`: "Jacobs's `Σ_α` is our `Σ₀(α)` (Jacobs, §1.5, p. 18)."

**Witness:** `jacobs` (cache `830b1901`) page 19 begins at line 714; Definition 1.27, which defines `Σ_α` as the integral matrices with `p^α | c`, `p ∤ d`, `det ≠ 0`, is at lines 719–732. Section 1.5 begins on page 18 (line 696) but contains no `Σ_α` there. The README's own §1.1 cites the same definition correctly as "Definition 1.27 … p. 19".

**Repair:** "(Jacobs, Definition 1.27, p. 19)".

## Verified sound

**Gate, build, dependency check.** I ran the push gate on this head from the pull-request worktree: every check passes (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`), agreeing with the worker's gate. `lake env lean` on `TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`: exit 0, no output. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The dependency check with `--movable` against the merge order and main:

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No supplier gap is declared and none is needed. The pins of `lake-manifest.json` are Tau Ceti `a91d3aa` and Mathlib `6b7abb3c`.

**Suggested.lean.** Single `import Mathlib`, one module docstring, an empty namespace `TauCetiRoadmap.QuaternionicModularForms`, no declaration, no `set_option`, no `lemma`, no stand-in. The docstring names the headline theorems (compactness of the controlling operator and the partial theta–Hecke relations; the Fredholm series, finite-slope summands and the partial determinant identity with its case over `ℚ`; small-slope classicality over totally real fields with the cutoff `min_τ r_τ/e_v`, and `k+1` over `ℚ`; the definite automorphic realisation, the finite dimensionality and decomposition of automorphic forms on `Dˣ`, and the Bianchi comparisons) and for each the carrier the pins lack: the analytic weight action of `Σ₀(t)` on the Tate algebra (the two substitution mechanisms at the pin and why each fails were verified in the previous review and are unchanged), the local component map at a split place, Fredholm determinants of compact operators on (Pr) modules, the annular ring `H`, automorphic forms and cusp forms on adelic groups, `(𝔤,K_∞)`-modules, local systems and cuspidal cohomology. The docstring's statements of the headlines agree with README §§3.3, 5.2, 4.1–4.2, 4.4, 5.3, 2.4–2.6. Nothing is declared, so there is no signature to compare with the README (`signatures.md` records none; I confirm) and nothing to probe for padding.

**Library declarations opened at the pins** (every name the change set adds to the supplier contracts).

| Name | Where at the pin | What it says; matches the README's use? |
| --- | --- | --- |
| `MvPolynomial.restrictSupport` | `Mathlib/RingTheory/MvPolynomial/Basic.lean:91`; `basisRestrictSupport` at `:95` | the submodule of polynomials with support in a set `s` of exponents, with a canonical basis indexed by `s`. README §1.3: exponents bounded by `n`, free of rank `∏(n_σ+1)`. Yes. |
| `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:317` | the unit lattice spans the trace-zero log space. README §1.3: `(n_σ+2v_σ)_σ` orthogonal to that hyperplane. Yes. |
| `Subgroup.normalCore` | `Mathlib/Algebra/Group/Subgroup/Basic.lean:718` | `{a : ∀ b, b a b⁻¹ ∈ H}`, the largest normal subgroup of `G` inside `H`. README §0.3 applies it to `U′` inside `U` through `subgroupOf`. Yes. |
| `Subgroup.subgroupOf`, `Subgroup.relIndex` | `Mathlib/Algebra/Group/Subgroup/Map.lean:284`; `Mathlib/GroupTheory/Index.lean:62` | `relIndex H K = (H.subgroupOf K).index`, `0` when infinite. README §0.3 uses `[U:U′]` finite. Yes. |
| `Representation.averageMap`, `Representation.isProj_averageMap` | `Mathlib/RepresentationTheory/Invariants.lean:126`, `:141`, under `[Fintype G] [Invertible (Fintype.card G : k)]` (`:122`) | the projection onto invariants. README §2.3: "for a finite group whose order is invertible in the scalars". Yes. |
| `Nat.descFactorial` | `Mathlib/Data/Nat/Factorial/Basic.lean:332` | the falling factorial `(m)_r`. README §5.1. Yes. |
| `TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59`, `variable [CommRing k]`, arguments `k n d` | `Representation k (GL (Fin n) k) (Sym[k]^d (Fin n → k))`. README writes `TauCeti.symPowerRep R 2 n`: ring, size `2`, degree `n`. Yes. |
| `Representation.charTwist` | `TauCeti/RepresentationTheory/CharacterTwist.lean:86`, `χ : G →* kˣ` | `g ↦ χ g • ρ g`. README §1.3: twist by `det^{−n−v}`. Yes. |
| `TauCeti.skolemNoether` | `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`: `[IsSimpleRing A] [FiniteDimensional K A] [Algebra.IsCentral K B] [IsSimpleRing B] (f g : B →ₐ[K] A) : ∃ u : Aˣ, ∀ x, g x = u * f x * u⁻¹` | README §2.2 applies it to `B=D_v⊗_{F_v,σ}K` (central simple over `K`), `A=M₂(K)`. Yes. |
| `TauCeti.SU2.symPower` | `TauCeti/RepresentationTheory/SU2/SymmetricPower.lean:97`, equal to `symPowerRep ℂ 2 d (toGL g)` (`:101`) | README §2.5. Yes. |

**Supplier citations resolved at the heads named in the brief.**

- AutomorphicFormsOnReductiveGroups (#1037 head, `pr1037` lines 1220–1300): §7.4 defines the abstract carrier `S_Γ(J,M)` with `f(γgu)=f(g)|u`, the evaluation equivalence `∏_i M^{J∩c_i⁻¹Γc_i}` "needing neither a finite class set nor finite stabilisers", restriction, the trace `Σ_{uJ′∈J/J′} f(gu)|u⁻¹` over left cosets with `tr∘res=[J:J′]·id`, the slash `(f|δ)(g)=f(gδ⁻¹)|δ`, `T_η f=Σ_t f|x_t` with independence and the antihomomorphism, `inverseActionHeckeEquiv`, Gross's model and `algebraicModularForm_iff_levelCovariant`; §7.5 `automorphicEquiv` with its two hypotheses; §7.6 the central-`ψ` submodule with `ψ` trivial on `Z_G(F)`, the level action on `Z_f∩J` by `ψ⁻¹` (that is, `m|z=ψ(z)m` in the right-action notation), the extension `m|(uz)=ψ(z)(m|u)` and the identification with the carrier at level `JZ_f`; §5.5 `clozelPurity`; §§2.3, 2.6, 4.3, 7.2 exist. README Conventions 4, 6, 9 and §§2.1, 2.5, 3.1 match these conventions exactly (trace over left cosets, slash composition `S_ε∘S_δ=S_{δε}`).
- AdelicAlgebraicGroups (#792 head, `pr792`): §1.2 (line 1166), §1.5 (1404), §3.4 *class-number-finite* (3199), §4.5 the class-set bijection for `G^der` simply connected and `G^der(F_∞)` noncompact on each simple factor (lines 5095–5098), §4.6 *quaternion-norm-images* (5102), §5.3 *quaternion-class-sets* (finite class sets for every compact open level and every quaternion algebra, representatives, factorisations, surjective refinement maps; "neither a division hypothesis nor definiteness is used") and *definite-quaternion-stabilizers* (`Γ_x/Z_x` finite for compact `U`, `Γ_x` finite over `ℚ`) at 5497–5560. The README's contract (lines 189–198) restates exactly these.
- ArithmeticLocallySymmetricSpaces (#871 head, `pr871`): ALS.F.1 (580), F.5 (957), F.6 with (i) finite dimensionality and (iv) discreteness of the cuspidal spectrum (995, 1012–1018, 1036–1039), F.7 (1066), 0.4 (1309), 0.6–0.8 (1399, 1441, 1467), 1.1 (1763), 1.3 (1900), 3.1 with `[UαU]·m=Σ_i α_i m` for `UαU=⊔α_iU` (2691–2698, matching Convention 9), 5b.1 (4258), 5b.5 (4460), and `LocallySymmetric.AutomorphicForm` (997, 1034): the resolver's one lead is the planned name of ALS.F.6, as in earlier rounds. 5b.4: see R02.
- KleinianGroups (#432 head, `pr432`): Layer 0 (the upper half-space and its Möbius action, line 227) and Layer 3 (Bianchi groups, deliverables `bianchi`, `bianchiGamma`). Yes.
- On main: RestrictedPowerSeries §§0.1, 1.1–1.3, 2.1–2.4; PadicFunctionalAnalysis §§0.3, 0.4, 1.1–1.4, 2.1, 2.2, 2.6, 3.2, 4.1–4.6, 5.2–5.6; CompactOperators §§0.1–0.3, 1.2, 1.4–1.7 and Layers 3–4; NewtonPolygons Layers 2 and 4; AdicSpacesPartII R0.5 (line 2759); ReductiveGroups Layer 6 "reductive and semisimple groups" (line 466). All exist with the stated contents.

**Ownership and overlap.** The five roadmaps that had restated this roadmap's material cite it again at their current heads: #1005 HilbertModularVarietiesAndShimuraCurves names this roadmap as owner of §§0.2–0.4, 1.3, 2.1–2.3, 3.1 (`pr1005` lines 10, 34, 135; R18.5.17a takes the refinement fibres from §0.3); #931 resolves R17.3.8a–d to §§1.3, 2.1, 2.2–2.3, 0.4 and 3.1 (`pr931` lines 85–94; R17.3.9 exists at line 1738); #1007 §0.3 consumes §§2.2–2.3 and 4.3 (`pr1007` line 732); #1019 §5.2 consumes §0.3 (`pr1019` line 2681). #1270 CompletedCohomologyAndLocalGlobalCompatibility §§1.6, 1.7, 2.7 cite HilbertModularVarietiesAndShimuraCurves R18.3 and GL2AutomorphicRepresentationsAndTransfer R17.3, which cite this roadmap, so the Downstream line for it is indirect; no second owner there. `roadmaps grep`: "Bol" occurs in no other roadmap; "small-slope classicality" only here and in #1007, which consumes it; the refinement-fibre bijection is stated in no other open roadmap. #1422 OverconvergentAutomorphicForms is the Hilbert geometric theory (torsors, coefficient sheaves) and names no definite quaternionic object. The overlaps report lists no dropped id and no conflicting head. Ownership against open pull requests whose files the brief does not give was not checked.

**Seeded source sample** (every locator opened in the cache; page markers checked).

| Target | Source, locator, cache lines | Verified |
| --- | --- | --- |
| 0.2 | AdelicAlgebraicGroups §1.5, §4.6 (`pr792` 1404, 5102); own computations below | index formulas and `c(η_p)=π_p/p` computed |
| 0.4 | `jacobs` Definition 1.27, lines 719–732 (page 19) | `Σ_α` = integral matrices, `p^α | c`, `p ∤ d`, `det≠0`: the README's `Σ₀(α)`; page wrong (R03) |
| 1.1 | `jacobs` Definition 1.27 and (1.5.13), lines 733–746: `z^k ↦ κ(cz+d)(cz+d)^{−2}(w)^k`, `κ(cz+d)` by its expansion at zero, right action | yes (the exponent `−2` agrees with Buzzard's `(cz+d)^{k−2}`, `b96bba92` line 884) |
| 1.2 | RestrictedPowerSeries §2.2 (main, line 324); PadicFunctionalAnalysis §1.1 (main, 328) | yes |
| 1.3 | `buzzard-eigen` lines 2510–2518 (page 70): `k=n+2`, `w=v+n+1`, `n+2v∈ℤ`, `κ=(n,v)` on `O_pˣ×O_pˣ` | yes |
| 1.4 | PadicFunctionalAnalysis §§4.1–4.3 (main 658, 673, 682); AdicSpacesPartII R0.5 | yes |
| 2.2 | `buzzard-eigen` Proposition 11.1 lines 2726–2727 (page 75): `L(U∩U₀(π^t),A_{κ,r|π^s|})≅L(U∩U₀(π^{t+s}),A_{κ,r})`; Lemma 12.1 line 2842 (page 78); §10 line 2532 | yes |
| 2.3 | AdelicAlgebraicGroups §5.3 (`pr792` 5520–5546); PadicFunctionalAnalysis §2.2 (main 400); `averageMap` at the pin | yes |
| 2.5 | `loeffler` Assumption 3.1.3 and Proposition 3.1.4 lines 691–703 (page 15: 671–); Proposition 3.8.1 line 1052 (page 22: 1013–) | yes |
| 3.2 | `jacobs` §1.6 lines 768–830 (pages 20–21): `[UvU]φ=Σ_t φ|_κ v_t` for `UvU=⊔Uv_t`, the matrix through `(φ(c_i))_i` and the block endomorphisms `ε_{i,j}` | yes |
| 3.3 | `buzzard-eigen` Lemma 12.2 lines 2880–2885 (pages 78–79): `U_π` = inclusion into radius `r|π|` followed by a norm-decreasing map, compact; Lemma 13.1 lines 2920–2925 (pages 79–80): links | yes |
| 4.1 | CompactOperators §§1.4, 1.5, Layers 3–4 (main 400, 418, 613, 784) | yes |
| 4.3 | CompactOperators §1.7 (main 444); PadicFunctionalAnalysis §§5.3–5.5 (main 880, 942, 961); `log` isometry threshold computed below | yes |
| 4.4 | `lwx` Proposition 3.14 lines 1141–1156 (page 21: 1140–): `𝔪^{max(m−⌊n/p⌋,0)}Λ` for `a∈pℤ_p`, `c∈qℤ_p`; `𝔪^{max(m−n,0)}Λ` on `M₁`; §5.4 line 1837 (page 34: 1826–); Example 5.2 line 1776, Remark 5.3 line 1810 | yes |
| 5.1 | `b96bba92` (Buzzard, families) lines 881–885 (page 19): `D^{k−1}((cz+d)^{k−2}F(w))=(ad−bc)^{k−1}(cz+d)^{−k}F^{(k−1)}(w)` | yes: with `r=k−1`, `F=z^{j+r}` this is the README's local Bol identity |
| 5.2 | same, lines 870–891: `θ^{1−k}=(|ν(g)|det g_p)^{1−k}D^{k−1}`, `[UηU]θ^{1−k}=|ν(η)|^{k−1}θ^{1−k}[UηU]` | yes: `Θ^rT_η=|nrd η|_f^{−r}T′_ηΘ^r` with `r=k−1` |
| 5.3 | same, Proposition 4 lines 893–909: kernel of `θ^{1−k}` is the classical forms; `v_p(λ)<k−1` with `‖U_p‖≤1` gives classical by the Neumann argument | yes, cutoff `k−1` = our `r=k+1` after `k_B=k+2` |
| 2.6 (carried) | `williams` Definition 1.1 lines 191–198 (page 4: 155–); `|a|_f=|a|_∞^{−2}` line 781 (page 13: 736–); `|α|^{−2s}` line 377 (page 7: 339–) | yes |

**Computed adversarial pass.** One row per statement checked at this head; rows marked "carried" were computed in the reviews at 84012cc, 67bcbf6, 1261875, cd50077 and 4798494 and their text is unchanged.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.3 fibre bijection `Γ_x\U/U′ → fibre over ΓxU`, `Γ_xuU′ ↦ ΓxuU′` | general `G₀`; injectivity | `ΓxuU′=Γxu′U′` ⇒ `xu=γxu′w`, `w∈U′` ⇒ `g=x⁻¹γx=uw⁻¹u′⁻¹∈U`, so `g∈Γ_x` and `uU′=gu′U′`; well defined since `Γxgu=Γγxu` | Pass |
| §0.3 Check `S₃`, `Γ=⟨(01)⟩`, `U′=⟨(12)⟩` | left cosets `U′`, `(01)U′`, `(02)U′` | `(01)(02)` and `(02)(12)` both send `0↦2,1↦0,2↦1` (right-to-left) and both send `0↦1,1↦2,2↦0` (left-to-right), so `(01)(02)U′=(02)U′`; orbits `{U′,(01)U′}`, `{(02)U′}`: `#=2`, not `3`, not `1` | Pass |
| §0.3 open noncompact `U𝔸_{F,f}ˣ` has finite class set | `U` compact open | `U∩(𝒪_D⊗Ô_F)ˣ` compact open, contained in `U𝔸_{F,f}ˣ`, its class set surjects (refinement) | Pass |
| §0.2 indices (carried) | `p=3`, `t=1` | `[GL₂(ℤ₃):U₀(3)]=4=3^0·4`, `[GL₂(ℤ₃):U₁(3)]=8=3^0·8` | Pass |
| §1.3 right action `z^m↦det^v(az+b)^m(cz+d)^{n−m}` is `det^v·Sym^n(γᵀ)` | `e₁↦ae₁+be₂`, `e₂↦ce₁+de₂` | matrix with these columns is `((a,c),(b,d))=γᵀ`; `Sym^n((γδ)ᵀ)=Sym^n(δᵀ)Sym^n(γᵀ)` gives `(P|γ)|δ=P|(γδ)` | Pass |
| §1.3 `γᵀ=det(γ)·wγ⁻¹w⁻¹`, `w=((0,1),(−1,0))` | `adj γ=((d,−b),(−c,a))` | `w·adj γ=((−c,a),(−d,b))`; `·w⁻¹=((a,c),(b,d))=γᵀ` | Pass |
| §1.3 left action `g↦(·)|g⁻¹` is `Sym^n(std)⊗det^{−n−v}` after `Sym^n(w)` | general `g` | `det(g)^{−v}Sym^n((g⁻¹)ᵀ)=det(g)^{−v−n}Sym^n(w)Sym^n(g)Sym^n(w)⁻¹` | Pass |
| §1.3 contragredient of `Sym^n(std)⊗det^v` when `n!` is a unit | `GL₂` | `std^∨≅std⊗det^{−1}` by `w`; `Sym^n(V)^∨≅Sym^n(V^∨)` with `n!` invertible; so `(Sym^n⊗det^v)^∨≅Sym^n⊗det^{−n−v}` | Pass (agrees with §2.5) |
| §1.3 scalar `uI` acts by `u^{n_σ+2v_σ}` | `n=1,v=0,u=−1` | `(−1)^1=−1`: `−I` kills invariants in characteristic zero (Check) | Pass |
| §1.3 Dirichlet: finite image iff `n_σ+2v_σ` parallel (totally real) | `w_σ=w` parallel; converse | `∏σ(u)^w=N(u)^w=±1`; finite image ⇒ `Σ_σ w_σ log|σ(u)|=0` for all units; unit lattice spans the trace-zero hyperplane ⇒ `(w_σ)` constant | Pass |
| §1.3 Check `ℚ(√2)`, `(n₁,n₂)=(0,2)`, `v=0` | `u=1+√2` | acts by `σ₂(u)^2=(1−√2)^2=3−2√2`, not a root of unity | Pass |
| §1.3 Check composition `n=1,v=0` | `γ=((1,1),(0,1))`, `δ=((1,0),(1,1))` | `1|γ=1`; `(1|γ)|δ=z+1`; `γδ=((2,1),(1,1))`, `1|(γδ)=z+1`; `δγ=((1,1),(1,2))`, `1|(δγ)=z+2` | Pass |
| §1.3 integral monoid: `Σ₀(t)` acts over every `𝒪_K`-algebra with normalised determinant and nebentypus | `γ,δ∈Σ₀(t)` | entries integral; `ν_norm` multiplicative on `F_vˣ`; `d_{γδ}=c_γb_δ+d_γd_δ≡d_γd_δ mod π^t` since `c_γ∈π^t` | Pass |
| §1.3 Check `R=𝒪_K`, `n=0`, `v=−1`, `diag(π,1)` | algebraic vs normalised | `det^{−1}=π⁻¹∉𝒪_K`; normalised `ν_alg(π^{−1}·π)=1`; `v=1`: `π` vs `1` | Pass |
| §2.1 trace `(trφ)(g)=Σ_{u∈U/U′}φ(gu)|u⁻¹` | representative change `u↦uu′`; level; `tr∘res` | `φ(guu′)|(uu′)⁻¹=(φ(gu)|u′)|u′⁻¹u⁻¹=φ(gu)|u⁻¹`; `(trφ)(gu₀)=(trφ)(g)|u₀` by `u↦u₀u`; `Σ_u(φ(g)|u)|u⁻¹=[U:U′]φ(g)` | Pass (same as AFRG §7.4) |
| §2.1 central extension `a|(uz)=ψ(z)(a|u)` well defined | `uz=u′z′` | `u′⁻¹u=z′z⁻¹∈U∩𝔸_{F,f}ˣ`, `a|u=(a|u′)|(z′z⁻¹)=ψ(z′)ψ(z)⁻¹(a|u′)` | Pass |
| §2.1 Check `D=M₂(ℚ)`, `U=GL₂(Ẑ)` | `Γ_1` | one class, `Γ_1=GL₂(ℚ)∩GL₂(Ẑ)=GL₂(ℤ)`; `a|(−I)=−a` ⇒ `2a=0` | Pass |
| §2.1 Check `z₀` acting trivially, `ψ(z₀)≠1` | `A=R` | `φ(gz₀)=φ(g)|z₀=φ(g)` and `=ψ(z₀)φ(g)` ⇒ `(ψ(z₀)−1)φ=0` | Pass |
| §2.1 finiteness | Noetherian `R`, finite `A` | `⊕_iA^{Γ_{c_i}}` is a finite sum of submodules of a finite module | Pass |
| §2.2 Check `(n,v)=(10,−5)` on `GL₂(ℤ)` | parity and density | `−I` acts by `(−1)^{10−10}=1` (no parity kill); `SL₂(ℤ)` Zariski dense, `Sym^{10}` irreducible of dimension `11` ⇒ invariants `0`; `k=n+2=12`, `S₁₂∋Δ` | Pass |
| §2.2 Hamilton at `2` | `K⊇ℚ₂(i)` | `−1=i²`, so `(−1,−1)_K` splits; no splitting over `ℚ₂` | Pass |
| §2.2 splittings exist iff `D_v⊗_{F_v,σ}K` splits | dimension `4` | an `F_v`-algebra map `D_v→M₂(K)` is a `K`-algebra map `D_v⊗_{F_v,σ}K→M₂(K)`, injective (simple) and bijective by dimension | Pass |
| §2.2 independence of splittings | `Δ=D_fˣ`; `Σ₀(t)` without nebentypus; with nebentypus | first two: `φ′(γgu)=φ′(g)|_{ι′}u` from `ι(u)h⁻¹=h⁻¹ι′(u)` and a scalar depending on `det ι(u)=det ι′(u)`; third: counterexample `h=w`, `u=diag(α,1)`, `ε(α)≠1` (R01) | Fail on the third (R01) |
| §2.2 base change `M(U,L(K))⊗K′≅M(U,L(K′))` | finite-dimensional `V`, any `Γ` | `V^Γ=∩_γ ker(γ−1)`, finitely many suffice (descending chain), kernels commute with `⊗_K K′` | Pass |
| §2.3 `E_i=|H_i|⁻¹Σ slash(h)` is `averageMap` for `h↦slash(h⁻¹)` | sum over `H_i` | `Σ_h slash(h⁻¹)=Σ_h slash(h)`; invariants of left and right actions coincide; `isProj_averageMap` | Pass |
| §2.4 Check `U₁(13)` (carried) | `Γ_x` | finite subgroup of `ℍˣ` with injective reduction into a Borel of `SL₂(𝔽₁₃)`, no element of order `13`, cyclic of order `≤6` (cyclotomic fields of degree `≤2`); orbits on `(ℤ/13)ˣ` of size `≤6`, so `≥2` per fibre | Pass |
| §3.1 `[Uη_v⁻¹U]=S_v⁻¹T_v` | `η=diag(ϖ,1)` | `η⁻¹=ϖ⁻¹diag(1,ϖ)`, `diag(1,ϖ)=w·η·w⁻¹∈UηU`; `Uη⁻¹U=⊔Ux_tϖ⁻¹`; `Σφ|(x_tϖ⁻¹)=(T_ηφ)|ϖ⁻¹=S_v⁻¹T_vφ`; `ϖ` central so the order is immaterial | Pass |
| §3.1 `S_v` commutes with every `T_η` | `ϖ` central | `(T_ηφ)|ϖ=Σφ|(x_tϖ)=Σφ|(ϖx_t)=T_η(φ|ϖ)` | Pass |
| §3.1 diamond `diag(1,d)` commutes with `U_v` | `x_α=((π,0),(π^tα,1))` | `diag(1,d)x_α=((π,0),(π^tαd,d))=x_{αd}diag(1,d)`; `αd` runs over a section | Pass |
| §3.1 Check central-character form | trivial coefficients | `(φ|ϖ)(g)=φ(gϖ⁻¹)=ψ(ϖ)⁻¹φ(g)` | Pass |
| §3.1 Check division place | `𝒪_{D_v}ˣ` | kernel of the valuation `D_vˣ→ℤ`, normal; `UΠU=UΠ` | Pass |
| §3.1 Hecke relation (carried) | `q=2` | `(2+1)²=9=(4+2)+(2+1)` | Pass |
| §4.3 `log:1+π^N𝒪_v→π^N𝒪_v` isometric iff `N>e_v/(p−1)` | `ℚ_p`, `p` odd: `N=1`; `p=2`: `N=2`; `ℚ₃(√−3)`: `e=2` | `v_p(π^N)=N/e_v>1/(p−1)`; `1>1/(p−1)` for `p≥3`; `2>1`; `ℚ₃(ζ₃)`: `N>1`, and `ζ₃=1−π∈1+π𝒪` with `log ζ₃=0` is torsion, so `N=1` fails | Pass |
| §4.3 Check `p=3`, `T=exp(3w)−1` | Gauss norm | `v₃(3^n/n!)≥n−(n−1)/2=(n+1)/2≥3/2`, so `≥2` for `n≥2`; `n=1` gives `1/3`; `‖T‖=1/3≤b` | Pass |
| §4.3 affinoid subdomains of the open polydisc lie in `max‖T_i‖≤b<1` | maximum modulus | each `T_i` bounded by `<1` on an affinoid | Pass |
| §4.4 (carried) exponent identity | `p=2`, `m=5`, `n=4`; `n=0` | `2−2+3=3=⌈5/2⌉`; `0−2+5=3` | Pass |
| Layer 5 target: scalar action unchanged | `κ′_τ` | `τ^{−n−2}n^τ(ν₀τ^{n+1})²=τ^{n}n^τν₀²` | Pass |
| §5.1 local Bol | `F=z^{j+r}`, `r=k−1` in Buzzard's identity | `(cz+d)^{k−2}(N/L)^{j+r}=N^{j+r}L^{−(j+1)}`; RHS `(ad−bc)^rL^{−(r+1)}(j+r)_r(N/L)^j=(ad−bc)^r(j+r)_rN^jL^{−(j+r+1)}` | Pass |
| §5.1 analytic Bol with the twisted target (no `det^r` factor) | `f=z^{j+r}`, `n(cz+d)=uL^{n_τ}`, `r=n_τ+1` | `D^r(f|_κγ)=ν(det)u(det)^r(j+r)_rN^jL^{−(j+r+1)}`; `(D^rf)|_{κ′}γ=(j+r)_ruL^{−n−2−j}ν′(det)N^j`; equal iff `ν′(x)=ν(x)x^{r}`, the target's determinant character | Pass |
| §5.1 Check `γ=diag(p,1)`, trivial `κ` | `r=1` | `D(f(pz))=pf′(pz)`; target: `L^{−2}=1`, `ν′(p)=ν(p)p=p` | Pass |
| §5.2 normalised-target scalar `τ(π_v)^{r_τe}` | `det` valuation `e` | `ν′(π^eu)=ν₀(u)τ(u)^rτ(π)^{er}`, `ν′_norm(π^eu)=ν₀(u)τ(u)^r`; ratio `τ(π)^{er}`; `e=1` for `U_v` | Pass |
| §5.2 scalars over `ℚ` (carried) | `U_p`, `T_ℓ`, `S_ℓ` | `|p|_f^{−r}=p^r`, `ℓ^r`, `|ℓ²|_f^{−r}=ℓ^{2r}` | Pass |
| §5.2 Check `ℚ(√2)`: no character untwists | `ε=1+√2`, `ε^m∈U` central | a character trivial on `Dˣ` gives `1` at `ε^m`, the required restriction gives `τ(nrd ε^m)^r=τ(ε)^{2mr}≠1` | Pass |
| §5.3 `W_τ=kerΘ_τ` is `U_P`-stable; `H_κ=H_{W_τ}H_V` | block form | `Θ_τU_v=c_τU′_vΘ_τ` with `c_τ=τ(π_v)^{r_τ}` and `Θ_τU_w=U′_wΘ_τ` (`w≠v`), so `Θf=0⇒Θ(U_Pf)=0`; `N_τ` closed with bounded coefficient projection | Pass |
| §5.3 `H_V(T)=H_{κ′_τ}(c_τT)` | `Θ_τ` on `N_τ`: `w^m↦(m)_rρ^{−r}w^{m−r}` | entries nonzero in characteristic zero for `m≥r`; CompactOperators §1.4 diagonal intertwining with `ΘV=c_τU′_PΘ` | Pass |
| §5.3 cutoff `v_p(μ)<r_τ/e_v` | `|τ(π_v)|=p^{−1/e_v}` | `|μ/c_τ|=p^{−v_p(μ)+r/e_v}>1` iff `v_p(μ)<r/e_v`; then `U′_v−μ/c_τ=−(μ/c_τ)(1−(c_τ/μ)U′_v)` invertible by Neumann since `‖U′_v‖≤1` | Pass |
| §5.3 Check `e_v=2`, `n_τ=0` | `v_p(μ)=3/4` | `3/4<1=r_τ` but `3/4≥1/2=r_τ/e_v`: not covered | Pass |
| §5.3 slope-`≤h` summands agree for `h<min r_τ/e_v` when `‖U_v‖≤1` | `μ=∏μ_v` | finite-dimensional summand of `U_P` splits into simultaneous generalised eigenspaces of the commuting `U_v`; `v_p(μ_v)≥0` for all `v` gives `v_p(μ_v)≤v_p(μ)≤h` | Pass |
| §5.3 Example `k=0` over `ℚ` (carried) | one class | `U_p` on constants `=p`; `H_κ=(1−pT)H_{κ′}(pT)`; slope `1=r`, at the boundary | Pass |
| §5.3 Example real quadratic, `p` split | `e_v=1` | cutoffs `n_i+1` | Pass |

**Context and generality.** Layer 5 states its standing hypotheses (`F` totally real, `D` totally definite and split at `P`) once at the top and §5.3 restates "every stabiliser acts trivially on both weights" for the determinant identity and drops it for classicality; the general classicality statement carries "classical shape at every label, `ν₀` algebraic, `n_σ+2v_σ` parallel" and the summand statement "every `U_v` of norm at most one". §2.2's analytic forms keep the totally definite hypothesis; its classical forms drop it, consistently with §2.1 and with AdelicAlgebraicGroups §5.3's class-set theorem, which needs no definiteness. The Summary and Scope paragraphs agree with the layers.

**Policy.** No process word, pull-request number, LaTeX delimiter, machine path or local path in the README or docstring (gate `prnum=0 latex=0 tex=0 private-paths=0 round-labels=0`); the "Existing Lean work" section cites a fixed commit of an external repository as secondary provenance, as in every earlier round. Every target has a locator or a supplier section; every definition has at least three Checks; every layer ends with Examples and Dependencies.

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, recorded as uncertified in earlier rounds; cited by locator only, unchanged.
- **Published numbering of Williams (2017):** the arXiv v2 text in the cache was read; the published page numbers were not compared.
- **Ownership against open pull requests** whose files the brief does not give: not checked beyond the `roadmaps grep` probes above.

## Source issues

- none

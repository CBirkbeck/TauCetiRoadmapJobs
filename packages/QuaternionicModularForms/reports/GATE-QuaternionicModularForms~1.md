# GATE-QuaternionicModularForms~1: answers to review of 76032ac

Repairs are in commit `84012cca` on the pull-request branch (not pushed). Files edited:
`TauCetiRoadmap/QuaternionicModularForms/README.md` (rewritten into the house shape) and
`TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`.

## H01 (CBirkbeck) — applied

The reciprocal contracts are removed. At their current heads AdelicAlgebraicGroups §5.3 already owns
quaternion class sets for every quaternion algebra and compact open level (*quaternion-class-sets*)
and the definite compact-level stabiliser theorem (*definite-quaternion-stabilizers*), §4.6 owns the
reduced norm; AutomorphicFormsOnReductiveGroups §7.4 owns the abstract carrier, evaluation, slash and
opposite-ring Hecke action. Neither of them consumes this roadmap any more. Old README lines 36–56
and 277–300 (own class-set/stabiliser targets, "dependency at the theorem level in both directions")
→ Scope and ownership now consumes AAG §§4.6, 5.3 and AFRG §§7.4–7.6. §0.3 keeps only an own target
(fibres of class-set refinement), §2.1/§3.1 keep only the Banach structure and the specific operators
`U_v`, `T_v`, `S_v`. Every citation of GL2AutomorphicRepresentationsAndTransfer (R16.1.6, R16.2.13,
R16.4, R17.3.9) and HilbertModularVarietiesAndShimuraCurves (R18.3.3, R18.3.20–22) as a supplier is
gone: the `M₂(F)` restriction map in §2.4 is a target here (with AAG §§4.5, 5.3 for class sets), the
`GL₂(ℂ)` principal-series `K`-types became an archimedean target in §2.6, non-cuspidality of the
finite-dimensional module now uses AFRG §4.3 (cuspidal genericity), and the "must agree with R17.3.9 /
R18.3.20–22" sentences are deleted (agreement is the consumers' check). Those two roadmaps appear
only under Downstream consumers. Depcheck shows no UPWARD or CYCLE line (output below).

Outside this folder (not edited, for the consumers): PadicFamilies and HilbertModularVarietiesAndShimuraCurves
still name `finite_classSet` and `classSet` "of QuaternionicModularForms §0.3". Those names are no
longer declared here; the theorem is AdelicAlgebraicGroups §5.3's.

## H02 (CBirkbeck) — applied

`M(U,L_{n,v}) ⊗_{K,ι} ℂ` (old line 653) did tensor along a map `K→ℂ` the stated data never
supplied. §2.5 now defines the `E`-rational space `M_E(U,λ)` (Gross's covariance model of
AutomorphicFormsOnReductiveGroups §7.4 over `E`) and states two theorems: `M_E⊗_{E,j}K ≅ M(U,L_{n,v})`,
`Φ⊗1 ↦ ρ(g_p)⁻¹Φ`, and `M_E⊗_{E,ι}ℂ ≅` the automorphic side. Each comes with its Hecke dictionary.
Base change uses `V^Γ⊗_EK=(V⊗_EK)^Γ` for finite-dimensional `V`. The text says explicitly that no
map `K→ℂ` is assumed. Computing the Hecke transport also corrected the dictionary: Gross's
`T^E_{η⁻¹}` corresponds to §3.1's algebraic-twist `T_η`, and `T^E_η` to `[UηU]` on `(π^∞)^U`. A
rank-one Check (`M_E` = `E`-valued functions on `Cl(U)`, extending to `M(U,K)` and `M(U,ℂ)`) is
added.

## H03 (CBirkbeck) — applied

Williams leaves `|·|` undefined in Definition 1.2 (`williams` line 185, 199–217). His §1.2 writes
`N(α)^{−s}=|α|^{−2s}` (`williams` line 378, p. 7) and §2.6 writes `|a|_f=|a|_∞^{−2}` (line 781, p. 13),
so his `|·|` on `ℂ` is Euclidean and his central factor is `(zz̄)^{−k/2}`. Old lines 743–745 ("the
power of `|det|_𝔸` determined by `k` and his absolute-value convention") → the map
`Φ ↦ Φ·|det|_𝔸^{−k/4}`. It sends central character `ω_W` to `ω_W·|·|_𝔸^{−k/2}`, and the Hecke factor is
`[UηU]_ours∘twist = |det η|_𝔸^{−k/4}·twist∘[UηU]_W` (`+k/4` for `[Uη⁻¹U]`). Convention 10 fixes
`|z|`, `|z|_ℂ=zz̄` and `|·|_𝔸`. Two Checks are added: the `k=1`, `z=2` computation `1/2·16^{−1/4}=1/4`,
and the factor `q_v^{k/4}` at `η=diag(ϖ_v,1)`.

## H04 (CBirkbeck) — applied differently

`theta_kills_generalized_eigenvector` and the other stand-ins are deleted. The new `Suggested.lean`
declares nothing. Its docstring names each headline (compactness of `U_π`, Fredholm series and slopes,
annular integrality, the determinant factorisation, small-slope classicality, §§2.4–2.6) and the
carrier each one lacks at the pins. Tau Ceti substitutes only polynomials without constant term into
Tate algebras (`MvPowerSeries.restrictedSubst`, `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Subst.lean`),
so there is no analytic Möbius action. There is no nonarchimedean Fredholm series. There are no
automorphic-form or cuspidal-cohomology carriers. The suggested Hecke-preservation and opposite-action
statements are not added because they are AutomorphicFormsOnReductiveGroups §7.4's theorems ("prove that
it preserves `S_Γ(J,M)`, is independent of the representatives … a homomorphism from the opposite Hecke
ring"). Stating them here would plan them a second time. The `S₃` singleton test is that section's Check,
and §3.1 here cites it.

## H05 (CBirkbeck) — applied

All nine declarations (`hamilton_normForm_eq_normSq`, `stab_top`, `hamilton_negative_norm`,
`detCharacter_comparison`, `normalizedDetCharacter_uniformizer`, `mahlerWeight_le`,
`mahler_column_exponent`, `mahler_row_exponent`, `theta_eval`) are deleted along with every other
declaration. Their mathematics stays as README prose and Checks (§§0.1, 1.3, 4.4).

## H06 (CBirkbeck) — applied

`Suggested.lean` lines 1–15 (thirteen `Mathlib.*` imports, `TauCeti.Algebra.Quaternion.NormForm`,
`Lean.Elab.Tactic.Omega`) → the single line `import Mathlib`. No Tau Ceti module is used now that
nothing is declared. Gate: `imports=0 mathlib-subimports=0 no-import-mathlib=0`.

## H07 (CBirkbeck) — applied

The commit-pinned links (old lines 51 and 1268–1276, including the fork copies of RestrictedPowerSeries,
PadicFunctionalAnalysis, CompactOperators and NewtonPolygons) are deleted. Suppliers are now cited by
roadmap name and section in "Exact supplier contracts". Every cited section was checked on main or at the
listed open head, for example CompactOperators §1.4 (diagonal intertwining) and PadicFunctionalAnalysis
§5.6 (`(p,T)=(T)`). Gate: `blob=0`.

## H08 (CBirkbeck) — applied

All pull-request numbers and the history in old lines 29–71 ("replace the former `OverconvergentForms`
supplier name", "now name these six interfaces") are gone. The Mathlib pull-request paragraph went with
them. The scope section is now a timeless owns/consumes list. Gate: `prnum=0`.

## H09 (CBirkbeck) — applied

The README now has the house shape: `# Roadmap: quaternionic modular forms`, **Summary.**, Scope and
ownership, Conventions, Exact supplier contracts (From Mathlib / Tau Ceti / each roadmap), How to read
the build, and Downstream consumers. Every subsection has a `*Needs:*` line, API bullets in prose and at
least three `**Checks.**` bullets, and every layer ends with `### Examples` and `### Dependencies`.
§1.2 gained three computed Checks: the `diag(p,1)` diagonal `p^r`, the `((1,0),(p,1))` column
`(−p)^{m−1}`, and the right-action test at `z=1` (`p/(p+1)` against `p/(p²+1)`).

## H10 (CBirkbeck) — applied

These locators were checked against the legally fetched texts and attached at each claim: Buzzard,
*Eigenvarieties*, Proposition 11.1 (p. 75, `buzzard-eigen` line 2726), Lemma 12.1 (p. 78), Lemma 12.2
(pp. 78–79, line 2880), Lemma 13.1 (pp. 79–80, line 2920); Buzzard, *On p-adic families*, §7 and
Proposition 4 (p. 19, `buzzard-families` lines 880–909), with the shift `k_Buzzard=k+2`; Jacobs §1.6
(pp. 20–21) and Definition 1.27/(1.5.13) (p. 19); LWX Proposition 3.14 (p. 21, `lwx` line 1141) and §5.4
(p. 34, line 1837); Loeffler Proposition 3.1.4 (p. 15) and Proposition 3.8.1 (p. 22, `loeffler` line
1052); Williams pp. 4–5, 7, 13. Steps that are new deductions are marked as such: §4.4's
`T`-divisibility (LWX gives `𝔪=(p,T)` powers, and PadicFunctionalAnalysis §5.6 gives `(p,T)=(T)`) and
the half-weighting. Harder (1987) is marked uncertified.

## H11 (CBirkbeck) — applied

No Lean declaration is left, so README and Lean agree trivially (gate `readme-ids-missing=0`). The
module docstring now has the required "target signatures" form, with the list of headlines that are not
statable. The README no longer backticks any name as this roadmap's own declaration.

## Build and gate

- `lake build TauCetiRoadmap.QuaternionicModularForms.Suggested`: `Build completed successfully (8976 jobs)`
  with no warnings (the file has no declarations).
- `#check @name` comparison: the file declares nothing, so there were no signatures to compare. Before
  the change, the 44 signatures in `signatures.md` had lost no binder. All 44 are deleted.
- Gate summary line: `gate QuaternionicModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`
  The only failing counter is `depcheck: NOT IN ORDER: QuaternionicModularForms (insert it after its last supplier)`.
  The roadmap is absent from `ORDER.txt`; the brief says this is not a defect before intake.
- Depcheck (`--movable`) output, in full:

```text
NOT IN ORDER: QuaternionicModularForms (insert it after its last supplier)
depcheck: 204 roadmaps, 1659 edges, 1 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. Its suppliers are now AdelicAlgebraicGroups (31),
ArithmeticLocallySymmetricSpaces (62) and AutomorphicFormsOnReductiveGroups (63), plus roadmaps on main
and KleinianGroups, which is a new-folder open pull request by another author and is absent from the
order. So the roadmap can sit before its consumers GL2AutomorphicRepresentationsAndTransfer (86) and
HilbertModularVarietiesAndShimuraCurves (145).

## Ownership and citations

- `roadmaps resolve` on the new README reports no unresolved cross-roadmap citations and no unresolved
  Lean names.
- Ownership was checked against main and the open heads with these results. Quaternion class sets,
  stabilisers and norms belong to AdelicAlgebraicGroups. The abstract forms and Hecke action belong to
  AutomorphicFormsOnReductiveGroups. OverconvergentAutomorphicForms (open) treats Hilbert and geometric
  coefficients, not definite quaternion forms. QuaternionArithmetic, HilbertModularForms, PadicFamilies,
  AutomorphicGaloisRepresentations and CompletedCohomologyAndLocalGlobalCompatibility are consumers.
- This roadmap still owns: the structure of `GL_1(D)` as an inner form of `GL₂`, the levels and norm
  character, refinement fibres, certificates, weight actions, Banach form spaces, compactness, the
  annular model, theta and classicality, and the specialisations of §§2.4–2.6. Grepping main, the open
  heads and the pins found no other owner for any of these.
- No notion moved down from a later roadmap. Sources were all readable; no `needs-references.toml` was
  written. The manifest `sources.toml` is outside the files this job may edit, so the fetched sources are
  recorded only by their service ids (`williams`, `buzzard-eigen`, `buzzard-families`, `jacobs`, `lwx`,
  `loeffler`, `sengun`).

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.3 refinement fibre `≅ Γ_x\U/U′` | Hurwitz level, `U′=U∩U₁(3)` | `U/U′` = 8 nonzero rows; `Γ_1→SL₂(𝔽₃)` has order 24 and is transitive, so the fibre is 1 | first draft said "free action ⇒ `[U:U′]·#Cl(U)`", which is false (free gives `[U:U′]/#Γ`) | condition changed to "`Γ_x` in the normal core"; Check gives `#Cl(U′)=1`, not 8 |
| §0.2 indices of `U₀`, `U₁` | `q=3`, `t=1` | `q^{t−1}(q+1)=4`; `q^{2t−2}(q²−1)=8` | correct | added index formula for `U₁`; reduction stated as `U\GL₂` via `γ↦(0,1)γ` |
| §0.2 `c(g)=|nrd g|_f det g_p` | `γ` global with `nrd γ=2`; `η_p=diag(π_p,1)`; `η_ℓ` | `1/2·2=1`; `π_p/p`; `ℓ⁻¹` | correct | product formula now over all `w|∞`, not only real places |
| §0.4 distinct cosets | `x_αx_{α′}⁻¹` | `((1,0),(π^{t−1}(α−α′),1))`, which is in `U₀(π^t)` iff `α≡α′ mod π` | correct | new Check replaces the left/right transpose remark, which was wrong |
| §1.1 central action `n(u)ν₀(u)²` | `u=2`, `n=u^k`, `ν₀=1` or `u` | `2^k` and `2^{k+2}` | correct | Check added |
| §1.1 at `p=2` | `exp` on `2ℤ₂` against `4ℤ₂` | radius `v₂(x)>1` | old wording ("log analytic on `1+4ℤ₂` not `1+2ℤ₂`") was imprecise | reworded to convergence of `exp` |
| §1.2 right-action law | `γ=diag(p,1)`, `δ=((1,0),(p,1))`, `z=1` | `w_γ(w_δ(1))=p/(p+1)`, `w_δ(w_γ(1))=p/(p²+1)` | law holds for `w_{γδ}=w_γ∘w_δ` | Check reworded (the draft called the correct order wrong) |
| §1.2 row bound | `γ=((1,0),(p,1))` | column `(−p)^{m−1}`; `det γ=1` | bound hypotheses fail, yet the column decays | Check states this |
| §1.3 normalisation | `diag(π,1)`, `n=0`, `v=1` | `ν_alg(π)=π`, `ν_norm(π)=1` | correct | — |
| §1.3 parallel weight | `ℚ(√2)`, `n=(0,2)`, `v=0`, `u=1+√2` | `σ₂(u)²=3−2√2`, infinite order | correct | Check added |
| §2.1 restriction and trace norms | isometric and non-isometric `U`-actions | value at `c_iu` is `φ(c_i)|u`, so bound `sup‖·|u‖`; ultrametric trace has no index factor | draft "norm ≤ 1, trace ≤ index" was wrong for non-isometric actions | corrected |
| §2.5 Hecke transport | `UηU=⊔Uy_t` | `Σρ(g_p)⁻¹Φ(gy_t⁻¹)=Σ(f|y_t)(g)` | Gross `T^E_{η⁻¹}` ↔ our `T_η`; `T^E_η` ↔ `[UηU]` | old "`T_η^E⊗1` ↦ `T_η`" corrected |
| §2.5 dimension Check | `F=ℚ`, trivial stabilisers | `h(n+1)=Σ m(π)dim(π^∞)^U`, Hom 1-dimensional | draft had an extra `(n+1)` | removed |
| §2.5 scalar Check | `v=1`, `n=0`, `π_p=p`, `η=diag(p,1)` | `ν_alg(p)^1=p` | correct with `T^E_{η⁻¹}` | wording fixed |
| §2.5 base change | finite-dimensional `V`, infinite `Γ` | invariants cut out by finitely many `γ` (descending chain in `V`) | holds | stated |
| §2.6 Williams twist | `k=1`, `z=2`; `η=diag(ϖ_v,1)` | `2^{−1}·16^{−1/4}=1/4=(2·2)^{−1}`; factor `q_v^{k/4}` | correct, Euclidean reading from `williams` lines 378, 781 | stated with both Checks |
| §2.6 `K`-types | Frobenius reciprocity on `U(1)²` weights `(m−l+a,l+a)` | types `Sym^m⊗det^{(n₁+n₂−m)/2}`, `m≥|n₁−n₂|`, same parity, multiplicity 1; `n₁+n₂=0`, `|n₁−n₂|=2k+2` gives `τ_k` | correct | target stated |
| §2.6 finite-dimensional module not cuspidal | `V_{k,k}^∨` | unipotent acts by polynomials in `x`, so `λ(n(x)v)=ψ(x)λ(v)` forces `λ=0` | correct; replaces the GL2AutomorphicRepresentationsAndTransfer R16.4 citation | uses AFRG §4.3 |
| §3.2 certificate change | `s∈Γ_{c_j}`, `c_js=δc_j` | `(d,u)↦(dδ⁻¹,su)`; term `a|(ux)` becomes `(a|s)|(ux)` | equal on invariants only | Check corrected |
| §4.1 Check | `f(z)↦f(πz)` | `∏(1−π^jT)` | the draft attributed this to `U_v` itself, which is wrong | attributed to the single operator |
| §4.2 bound | `h=1`, `s=|p|`; `h=2` | `n(n−1)/2`, attained by `∏(1−p^jT)`; slopes `0,0,1,1,…` | correct | — |
| §4.3 family norm | `T=exp(3w)−1` on `K⟨w⟩` | `v₃(3^n/n!)≥2` for `n≥2`, Gauss norm `1/3` | correct | Check made explicit |
| §4.4 row exponent | `p=2`, `m=5`, `n=4` and `n=0` | `2−2+3=3`; `0−2+5=3`; `⌈5/2⌉=3` | correct | Check added |
| §5.3 boundary | `k=0`, one class, constants | `U_p·1=p`; slope `1=r` | classical at the boundary, where the theorem is silent | Example replaces a garbled sentence |
| §5.1 Bol | `r=1`, `j=0`; `γ=1` | `D(N/L)=(ad−bc)/L²`; `D^r z^{j+r}=(j+r)_r z^j` | correct | Checks added |

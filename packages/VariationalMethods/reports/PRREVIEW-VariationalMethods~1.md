# Review of VariationalMethods (pull request #1028 at 515847c)

**Verdict:** needs changes

Reviewed: `TauCetiRoadmap/VariationalMethods/README.md` (573 lines) and `TauCetiRoadmap/VariationalMethods/Suggested.lean` (211 lines). The pull request changes nothing outside the folder (`metadata.toml` is the folder's own). The gate at this head fails (build, imports, blob links): no acceptance while it fails.

## R01 (P1) — Cycle with UnboundedOperators: V2.3 → UO-D06 → V5.1

Location: README lines 43–48 ("The order is V2.3 → UO-D06 → V5.1 → V5.2"), line 435 (`CompactFormPair.operator` is UO-D06's `closedFormOperator`); `Suggested.lean` lines 138–150.

Claim: V5.1 consumes UO-D06's `closedFormOperator`; UO-D06 (OperatorTheory/UnboundedOperators README at its pull-request head, section UO-D06, "Use native real Lax–Milgram and the scalar-generic coercive adapter specified in VariationalMethods V2.3", and its Milestone table: "D06 ... plus VariationalMethods V2.3") consumes this roadmap's V2.3.

Witness: UnboundedOperators README §UO-D06 cites "VariationalMethods V2.3 ... whose complexification and real restriction are proved there"; this README line 44–45 cites "UnboundedOperators UO-D06 owns the general closed semibounded-form representation". Two roadmaps cite each other. The dependency check reports 0 problems only because UnboundedOperators is in no merge order and not on main, so it sees neither edge; placed after its last supplier it lands after VariationalMethods, which makes V5.1's citation upward.

Repair: one direction of supply. Since UO-D06 is the general representation theorem and V5.1 must consume rather than re-plan it, remove from V2.3 everything D06 consumes (the `[RCLike 𝕜]` coercive adapter with `RealHilbert`, `toRealBilin` and the real/complex weak-topology dictionary; the Hilbert complexification, conjugation and `P_R`/`g_R` restriction, see R04) and cite those from UnboundedOperators UO-D06 (which must then own them, in its own pull request). V2.3 keeps only the variational applications (`EnergySpace`, near-minimizer convergence, forcing maps). Delete the sentence that orders V2.3 before UO-D06. Then rerun the dependency check with UnboundedOperators placed before this roadmap.

## R02 (P1) — Cycle with ComplexKahlerGeometry and PseudodifferentialOperators through V5.3 and V6.2

Location: README lines 49–68 (PDE/CKG/PDO paragraph), V5.3 lines 493–528 ("For the geometric specialization ... Consume PDO/CKG smooth-core and distributional elliptic-regularity inputs ... prove this equals K5's H² Hodge-Laplacian realization; compare the P7 positive Laplace realization"), V6.2 rows p22, p23, p25, p27, p28 ("using K5 Rellich", "K5 regularity", "CKG K5's Hodge theory", "AT6 and DG9", "DG9.3").

Claim: V5.3 and V6.2 consume ComplexKahlerGeometry K5 and PseudodifferentialOperators P6–P7.

Witness: ComplexKahlerGeometry on main (README lines 1049–1070) consumes "VariationalMethods V5.1's `CompactFormPair.operator`", "V2.2–V2.4's RCLike coercive solution operator", "V3–V4's abstract compact-embedding ... spectral theorem" and "V5.1–V5.2's same-operator compact-resolvent, graph/domain and eigen-expansion comparisons"; line 1153 consumes "VM V3.1's finite orthogonal-sum transport"; lines 1655–1657 state "VM V2.3 → UO-D06 → VM V5.1 ... VM V5.3's geometric comparison follows K5a". PseudodifferentialOperators 7.1 (pull-request head) consumes K5a's realization of `1+∇*∇`. So VariationalMethods → PseudodifferentialOperators → ComplexKahlerGeometry → VariationalMethods and VariationalMethods → ComplexKahlerGeometry → VariationalMethods are cycles at layer level, acknowledged in both READMEs. A roadmap on main already consuming this one fixes the direction: this roadmap is the supplier and cannot cite ComplexKahlerGeometry or anything that consumes it.

Repair: V5.3 keeps the abstract adapter only (D₀ with domain `range j`, closedness from the graph estimate, `Dom A = {j u | D u ∈ Dom D₀*}`, `A(j u) = D₀*(D u)`, the restricted `D₀*D₀` carrier). Delete its geometric specialization (H¹(E)/L²(E)/L²(F), the H² identification by P6, the comparison with K5's Hodge realization and with P7's `1+∇*∇`, the `σ_F`/`σ_geom` symbol adapter): ComplexKahlerGeometry K5 already states "Prove here that the operator domain and adjoint/maximal weak domain are H² by elliptic regularity", so that is its target, consuming the abstract V5.3 adapter by name. Delete the geometric rows p22, p23, p25, p27, p28 of V6.2 (they consume K5 Rellich, regularity and Hodge theory, AT6 and DG9.3) or move them to a "VariationalMethods, Part II" placed after ComplexKahlerGeometry and PseudodifferentialOperators; keep p21, p24, p26 as abstract acceptance examples on the `CompactFormPair` carrier. Rewrite lines 49–68 as a `## Scope and ownership` section that names PDE, ComplexKahlerGeometry and PseudodifferentialOperators as downstream consumers, not suppliers.

## R03 (P1) — Suggested.lean imports a pull-request roadmap's module and does not build

Location: `Suggested.lean` lines 1–8, 138–150, 172–185.

Claim: the file states the roadmap's headlines against the pins.

Witness: gate at 515847c: `build=3` ("bad import 'TauCetiRoadmap.OperatorTheory.UnboundedOperators.Suggested'", "no such file"), `imports=1`, `mathlib-subimports=7`, `no-import-mathlib=1`. Line 8 imports another roadmap's module from an open pull request; lines 1–7 import `Mathlib.*` submodules and there is no `import Mathlib`. `CompactFormPair.operator` (line 138) is data defined by `Classical.choose` of `existsUnique_selfAdjoint_of_closed_form`, which is `sorry` in that module: a definition whose body depends on `sorry`. `operator_spec` closes by one `exact` of the supplier's spec and `operator_domain` restates its domain: API, not headlines.

Repair: replace lines 1–8 by the single line `import Mathlib` (no `TauCeti.*` module is used). Delete `operator`, `operator_spec`, `operatorDomain`, `operator_domain`; keep `operatorDomainV` (a real body on native carriers, used by R05). Say in the module docstring that the represented operator of V5.1 is not statable at the pins because UO-D06's `closedFormOperator` is not in the pinned libraries, and state V5's headlines through `operatorDomainV` (R05). I elaborated such a copy (imports replaced, lines 135–186 removed): every remaining declaration elaborates with `sorry` as the only warning.

## R04 (P2) — V2.3 re-plans objects owned on main and in UO-D06

Location: README lines 263–320 (the Hilbert complexification, conjugation `J`, Taylor comparison, `P_R`, `g_R`).

Claim: V2.3 "Own[s] the Hilbert complexification required for real operators" and the real projection family `P_R(B)=π_R ∘ P_(A_C)(B) ∘ ι_H` with the bounded real calculus `g_R`.

Witness: GeneralizedCohomology on main, section G5, README lines 1940–1956: "construct `RealHilbertComplexification H` as a separate synonym of native `TauCeti.Complexification H` ... inner product ⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′)), with norm √(‖x‖²+‖y‖²) ... real embedding is isometric, conjugation J(x+iy)=x−iy is an antilinear isometry, ... complete ... ‖z‖_T≤‖z‖_H≤√2·‖z‖_T. Transport native `ContinuousLinearMap.complexify` ... equality of operator norms": the same object, laws and comparison constants as lines 263–281 here. FreeProbability F3 (line 341) constructs the same complexification again. UnboundedOperators §UO-D06 (its "D06 real unbounded spectral restriction" paragraph) also defines `P_R(B)=π_R∘(P_{A_ℂ}(B)).restrictScalars ℝ∘ι_H`, its diagonal measure `P_{A_ℂ}.diagMeasure (ι_H x)` and the bounded restricted calculus `g↦π_R∘(g[P_{A_ℂ}]).restrictScalars ℝ∘ι_H`: two owners for one object.

Repair: cite GeneralizedCohomology G5's `RealHilbertComplexification`, its real inclusion, conjugation, Taylor comparison and `complexify` transport in the supplier contracts and delete lines 263–281; keep here only what no roadmap owns (the complexified form `b_ℂ` with its Hermitian/boundedness/compactness-transport laws and the `LinearPMap` complexification on `Dom A × Dom A`), unless R01's repair moves those to UnboundedOperators as well. Delete the `P_R`/`g_R` paragraph (lines 294–316) and cite UO-D06 for it.

## R05 (P2) — Statable headlines absent; a definition stands in for V5.3

Location: `Suggested.lean` lines 187–197 (`adjointProductDomain`, `exists_restricted_adjointProduct`); README V4.4 (lines 416–431), V5.2 (lines 464–491), V5.3 (lines 493–503).

Claim: the file states the roadmap's headline theorems.

Witness: Courant–Fischer (V4.4) is statable at the pins on the data of `exists_ordered_eigenbasis` (`Submodule 𝕜 E` of `finrank` `n+1`, `sInf`/`sSup` of real sets). The V5.2 domain expansion is statable through `operatorDomainV`: `u ∈ P.operatorDomainV ↔ Summable (fun n => (eigenvalue n)^2 * ‖inner 𝕜 (b n) (P.inclusion u)‖^2)` for the data of `exists_ordered_eigenbasis`. The V5.3 identification is statable with native `LinearPMap.adjoint` (Mathlib `Analysis/InnerProductSpace/LinearPMap.lean` line 151) on `D₀ : H →ₗ.[𝕜] K` with domain `LinearMap.range P.inclusion` and action `D ∘ (LinearEquiv.ofInjective …).symm`: `u ∈ P.operatorDomainV ↔ D u ∈ D₀.adjoint.domain`, with the representing vector `D₀.adjoint ⟨D u, _⟩`. None is stated. `exists_restricted_adjointProduct` asserts the existence of a `LinearPMap` with a prescribed domain and action: a definition written as a theorem, for an arbitrary `D` whose `adjoint` is junk (`toFun := if Dense … then … else 0`) when `D` is not densely defined; it carries no headline.

Repair: state the three headlines above (each with `sorry`), define `D₀` with a real body, and delete `adjointProductDomain` and `exists_restricted_adjointProduct` (the README keeps the restricted-composite carrier as a V5.3 target).

## R06 (P3) — Links into pull-request branches and pinned commits

Location: README lines 43 (`blob/roadmap/unbounded-operators/...`), 59 (`blob/8b03be51.../ComplexKahlerGeometry/README.md`), 64 (`blob/063cf517.../PseudodifferentialOperators/README.md`).

Witness: gate `blob=2` (lines 59, 64); line 43 links a branch of an open pull request.

Repair: cite by roadmap name and section ("UnboundedOperators UO-D06", "ComplexKahlerGeometry K5", "PseudodifferentialOperators P5–P7"), or link a path on main.

## R07 (P3) — README shape: no scope, supplier-contract, references or checks sections; no `*Needs:*` lines; Lean names the file does not declare

Location: whole README; lines 268 (`RealHilbert 𝕜 V`), 276 (`toRealBilin`), 278 (`EnergySpace a`), 210 (`indicator_C`).

Witness: the headings are `## Conventions and suppliers`, `## Existing declarations to consume`, `## V1`–`## V6`. There is no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers` or `## References`; no layer ends with `### Examples` and `### Dependencies`; no definition has a `**Checks.**` list; no target has a `*Needs:*` line; the only locators in 573 lines are Ivrii §13.1 and Hunter §4.2/§4.10 at lines 565–568 (no theorem numbers) and the unlocatable scan of R08. `RealHilbert`, `EnergySpace`, `toRealBilin` and `indicator_C` are written as this roadmap's Lean identifiers but `Suggested.lean` declares none of them. The Lean namespace is `VariationalMethodsSuggested`, not `TauCetiRoadmap.VariationalMethods`; the module docstring does not say which headlines are not statable (the V5.1 represented operator, the V5.2 spectral-projection and resolvent-formula comparisons that need SAST's PVM carrier, V6.1 Ritz values).

Repair: restructure to the house shape; give each of the direct method, the compact form pair, the constrained sphere, the kernel-orthogonal connector, the ordered family and the Ritz pair three discriminating Checks (the README's own counterexamples at V1.3, V3.2 "W ≠ 0 alone", V4.4 "first n eigenvectors" and V6.2 "non-dense J" are ready-made); add `*Needs:*` lines and locators (Ivrii §13.1 Theorem 4 and Corollary 1 for V4.1–V4.4; Hunter Proposition 4.5, p. 94, for V2.2 and Theorem 4.25, p. 109, for V5.1–V5.2); either declare the four names in `Suggested.lean` or write them as prose. Rename the namespace; expand the docstring. Minor: `hbelow` in `exists_isMinOn_of_weak_closed` is unused (the nonempty bounded weakly closed sublevel at `b = E s₀` is compact and `LowerSemicontinuousOn.exists_isMinOn` needs no lower bound), and `[CompleteSpace V]` is unused in `zero_mem_weak_closure_embedded_unitSphere`.

## R08 (P3) — Sources: an unlocatable scan, no manifest, one misnamed Mathlib lemma

Location: README lines 550–552 ("Math240, `0226_001`, physical pages 21–28 (overall archive pages 130–137)"), line 110 (`fderivWithin_eq_zero`), lines 565–568.

Witness: `0226_001` names a scanned file, not a published or legally hosted text; it is in neither the sources cache nor the operator's local source directory, and the roadmap has no `sources.toml` (the brief records none). Mathlib at the pin has no `fderivWithin_eq_zero`; the lemma meant is `IsLocalMinOn.fderivWithin_eq_zero` (`Analysis/Calculus/LocalExtr/Basic.lean` line 165). Ivrii §13.1 and Hunter §4.2/§4.10 are cited without theorem numbers; both were fetched and read (ids `ivrii-pde-13-1`, `hunter-pde-notes`).

Repair: record `ivrii-pde-13-1` and `hunter-pde-notes` in `sources.toml` with theorem locators; for the Math240 acceptance rows either cite a locatable text that states each item (Ivrii §13.1 Theorem 4 covers p26; Hunter Theorem 4.25 covers p25/p27's spectral output) or record the scan as operator-local only if a human places it in the local source directory. Write `IsLocalMinOn.fderivWithin_eq_zero`.

## R09 (P3) — Overclaims about suppliers and consumers

Location: README lines 49–52 (PDE Lane D/E "consuming V1–V5's abstract variational and operator results"), 287–288 ("Prove complete Hilbert spaces reflexive by Riesz"), 187–189 (sequential-to-topological semicontinuity "using B2").

Witness: PDE on main, Lane D items 17–19, consumes Mathlib `continuousLinearEquivOfBilin`, Tau Ceti `FredholmAlternative` and `InnerProductSpace/Spectrum`; it does not cite VariationalMethods (grep of its README: no hit). Reflexivity of a complete inner-product space follows from BanachSpaceTheory B2 "Milman–Pettis: every uniformly convex Banach space is reflexive" and Mathlib's `InnerProductSpace.toUniformConvexSpace` (`Analysis/InnerProductSpace/Convex.lean` line 36). The sequential-to-topological lower-semicontinuity converse on a weakly compact set needs the sequential-closure form of Eberlein–Šmulian (every point of the weak closure of a relatively weakly compact set is a weak limit of a sequence in it); B2's bullet states only the compactness equivalence.

Repair: describe PDE as a downstream consumer whose Lane D/E stays as it is on main; cite B2 Milman–Pettis for Hilbert reflexivity (the Riesz route may stay as a proof sketch); name the sequential-closure form of Eberlein–Šmulian as the B2 input, or prove it in V1.1 from B2's compactness equivalence and separable reduction.

## Verified sound

Sampled targets (15 of the worker's seed) and the headlines, checked against the texts and the pins. Elaboration: a scratch copy of `Suggested.lean` with `import Mathlib` and lines 135–186 removed elaborates under `lake env lean` with `sorry` the only warning (9 declarations), plus `#check @name` for every declaration and 14 library names; each elaborated type was compared with its README statement and agrees (the only discrepancy is the unused `hbelow` noted in R07).

Adversarial table (one row per statement; values computed on each side):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| V2.2 expansion `E(u+tv)−E(u)=2t Re(a(u,v)−ℓ(v))+t²q(v)` | Hermitian `a`, real `t` | `q(u+tv)=q(u)+t Re a(u,v)+t Re a(v,u)+t²q(v)`; `Re a(v,u)=Re a(u,v)` by `a(v,u)=star a(u,v)`; `−2Re ℓ(u+tv)=−2Re ℓ(u)−2t Re ℓ(v)` | holds | none |
| V2.2 complex weak equation needs the `I•v` test | `𝕜=ℂ`, `a(u,v)=i`, `ℓ=0` | real-part identity `Re(a(u,v)−ℓ v)=0` holds for `v` but `a(u,v)≠0`; with `I•v`: `Re(−i·i)=1≠0` | the `I` test is necessary, as stated | none |
| V2.2 energy gap at a weak solution | `h` arbitrary | `E(u+h)−E(u)=2Re(a(u,h)−ℓ(h))+q(h)=q(h)` | holds | none |
| V2.3 realification `ℓ(x)=f(x)−i f(i•x)` | `f=Re` on `ℂ`, `x=1`, `x=i` | `ℓ(1)=1−i·0=1`, `ℓ(i)=0−i·(−1)=i`; `ℓ(i·1)=i·ℓ(1)` | complex linear | none |
| V2.3 forcing map scalar types | `S:H→V`, `F:V*→V`, scalar `c` | `a_α(S(ch),v)=conj(c)⟨h,jv⟩=a_α(cSh,v)` so `S` linear; `a_α(F(cℓ),v)=cℓ(v)=a_α(conj(c)Fℓ,v)` so `F` conjugate linear | matches `H →L[𝕜] V`, `StrongDual 𝕜 V →L⋆[𝕜] V` | none |
| V2.4 shift coercivity | `α ≥ ω`, `u` arbitrary | `q(u)+α‖ju‖² ≥ q(u)+ω‖ju‖² ≥ c‖u‖²` since `‖ju‖² ≥ 0` | holds; fails for `α<ω` when `j≠0` (take `q=−‖j·‖²`, `ω=1`, `c`-bound from an equivalent norm) | none |
| V3.2 bounded sublevels on `S_W` | `b` real | `c‖u‖² ≤ q(u)+ω·1 ≤ b+ω`; empty when `b+ω<0` | bounded | none |
| V3.2 weak compactness of the sublevel though `S_W` is not weakly closed | net in the closed ball `B` | on `B`, `j` is weak-to-norm continuous (V1.3.2): `‖ju‖=1`, `ju∈W`; `q+ω‖j·‖²` convex continuous hence weakly lsc: `q(u) ≤ b` | closed in weakly compact `B` | none |
| V3.3 constrained equation | path `(u+tv)/‖j(u+tv)‖`, `jv∈W` | derivative at 0: `2Re(a(u,v)−q(u)⟨ju,jv⟩)=0`; with `I•v`: imaginary part `0` | `a(u,v)=q(u)⟨ju,jv⟩` | none |
| `equation_of_constrained_minimum` without `IsClosed W` | `W` any submodule | path stays in `S_W` (submodule), closedness unused | true as stated | none |
| V3.4 kernel finite-dimensional | `u∈N`, `ω>0`; `ω≤0` | `c‖u‖² ≤ ω‖ju‖²`: `j` bounded below on `N`, compact so `dim N<∞`; `ω≤0` gives `N=0` | holds | none |
| V3.4 positivity of the minimum on `(jN)ᗮ` | minimiser `u` with `q(u)=0` | `u∈N`, `ju∈jN∩(jN)ᗮ`, `‖ju‖=1` | contradiction, so `δ>0` | none |
| V4.1 nonemptiness below `dim H` | `n<dim H`, chosen `u₀..u_{n−1}` | if `range j ⊆ span(ju_i)` then density gives `dim H ≤ n`; `ju−proj = j(u−Σc_i u_i) ≠ 0` | holds | none |
| V4.1 full equation from the restricted one | `v=u_k`, `k<n` | `a(u_n,u_k)=star a(u_k,u_n)=star(λ_k⟨ju_k,ju_n⟩)=0=λ_n⟨ju_n,ju_k⟩` | holds without completeness | none |
| V4.1 `λ_n → ∞` | bounded subsequence `λ_{n_k} ≤ M` | `c‖u_{n_k}‖² ≤ M+ω`; compact `j` gives a norm-Cauchy subsequence of `ju_{n_k}` but `‖ju_n−ju_m‖²=2` | contradiction | none |
| V4.1 lower bound `λ_n ≥ −ω` and `λ_n+α>0` | `‖ju_n‖=1` | `c‖u_n‖² ≤ λ_n+ω`, `u_n≠0` so `λ_n+ω>0`, hence `λ_n+α>0` for `α≥ω` | holds (strict) | none |
| V4.2 energy vs `H` orthogonality | `a_α(u_n,v)` | `=(λ_n+α)⟨ju_n,jv⟩`, factor `≠0` | equivalent | none |
| V4.3 energy Parseval | energy-orthonormal `e_n=u_n/√(λ_n+α)` | `|a_α(e_n,u)|²=(λ_n+α)|⟨ju_n,ju⟩|²` | `q(u)+α‖ju‖²=Σ(λ_n+α)|⟨ju_n,ju⟩|²` | none |
| V4.4 Courant–Fischer lower estimate | `L` of dim `n+1` | nonzero `u∈L` with `ju ⊥ ju_0..ju_{n−1}` (n constraints), `ju≠0` by injectivity, `q(u) ≥ λ_n‖ju‖²` | holds; Ivrii's Corollary 1 uses `n` constraints on an `n`-dim `L` (see Source issues), the README's "first n" is the correct count | none |
| V4.4 PD ordering `k↦d−1−k` | PD-A51: `k`-th sorted eigenvalue is `sup` over `(k+1)`-dim subspaces of `inf` | PD sorts decreasing | conversion correct | none |
| V5.1 sign `S_α=−R_A(−α)` | `R_A(z)=(zI−A)⁻¹` | `R_A(−α)=(−α−A)⁻¹=−(A+α)⁻¹` | holds | none |
| V5.3 adjoint convention | Mathlib `⟪T x, y⟫ = ⟪x, T† y⟫` | conjugating: `⟨Du, D₀(jv)⟩=⟨D₀*(Du), jv⟩`, so `f=D₀*(Du)` | matches `a(u,v)=⟨f,jv⟩` | none |
| V5.3 graph norm equivalence | `‖ju‖²+‖Du‖²` | `c‖u‖² ≤ q(u)+ω‖ju‖² ≤ max(1,ω)(‖Du‖²+‖ju‖²) ≤ C'‖u‖²` | `D₀` closed | none |
| V5.3 symbol conventions | first-order `D=ΣA_j∂_j+B` | `σ_F(D)=iΣA_jξ_j`, `σ_F(D*)=−iΣA_j*ξ_j=σ_F(D)*`; `σ_geom(D*)=−σ_geom(D)*` | `σ_F(D*D)=σ_F(D)*σ_F(D)`, `σ_geom(D*D)=−σ_geom(D)*σ_geom(D)` | none (section moves per R02) |
| V6.1 matrix convention | `u=Σc_jφ_j` | `a(u,u)=Σ conj(c_i)c_j a(φ_i,φ_j)=c*A_m c` with row index conjugate | consistent | none |
| V6.2 p21 inequality | `t=0, 1/4, 1` | `√t ≤ t+1/4`: `0≤1/4`, `1/2≤1/2`, `1≤5/4`; `t−√t+1/4=(√t−1/2)²` | holds | none |
| `exists_isMinOn_of_weak_closed` | `S` nonempty, `b=E s₀` | sublevel nonempty, bounded, weakly closed; `isCompact_closure_of_isBounded` with surjective bidual inclusion gives compactness; `LowerSemicontinuousOn.exists_isMinOn` | true; `hbelow` unused | R07 note |
| `exists_isMinOn_of_bounded_minimizing_sequence` | subsequence of `u` | ES (B2) gives `u_{n_k}⇀v`; `hseqclosed` on the subsequence: `v∈S`; `hseqlsc` with `r=sInf`: `E v ≤ sInf ≤ E v` | true | none |
| `compactMap_continuousOn_weak_bounded` | `K=closure(J '' B)` norm-compact | `J` weak-weak continuous; on `K` norm and weak topologies agree (compact to Hausdorff) | true | none |
| `zero_mem_weak_closure_embedded_unitSphere` | basic weak neighbourhood `{|f_1|,…,|f_m|<ε}` | `⋂ker f_i` has codim `≤m<∞`, contains `u≠0`; `Ju≠0`; `u/‖Ju‖` in the neighbourhood and on the sphere | true; compactness and completeness unused | R07 note |
| `exists_minimum_on_unitConstraint` | `W=⊥` or `H=0` | `hne` false, statement vacuous; `W` closed, `hne`: sublevel bounded, subsequence `u_k⇀u`, `ju_k→ju` in norm, `‖ju‖=1`, `ju∈W`, `q(u) ≤ liminf q(u_k)` | true | none |
| `exists_shifted_solution_maps` | `α=shift` | `a_α` coercive with constant `c`; Lax–Milgram on the realification | true | none |
| `exists_ordered_eigenbasis` | `¬FiniteDimensional 𝕜 H` | `H` separable: `j(ball)` relatively compact so separable, `range j=⋃ j(n·ball)` dense; ℕ-indexed Hilbert basis exists; `λ_n` monotone, `→∞`, full equations as in V4.1 | true | none |
| `exists_restricted_adjointProduct` | non-dense `D` | `D.adjoint.toFun=0` (junk) but the statement is still true by construction | true, but a definition (R05) | R05 |

Library declarations opened at the pin: Tau Ceti `Analysis/InnerProductSpace/Variational/Spectrum.lean` lines 93 (`formSolutionMap`), 104, 110, 128, 140, 146, 210, 340, 434 (`exists_hilbertBasis_forall_apply_eq_smul_inner`, real coercive `B`, compact dense `J`, `s`-indexed basis, as the README says), `Variational/Rayleigh.lean` lines 130 (`isLeast_rayleighQuotient`, needs `IsCompactOperator J`, symmetry, `J ≠ 0`) and 149 (`isGreatest_inv_norm_formSolutionOperator`, no compactness), `Variational/Fredholm.lean` lines 65, 84, 121, 132 (`fredholmAlternative_formPerturbation`), `Analysis/PDE/Spectrum.lean` header (Dirichlet spectrum through the solution operator), `LinearAlgebra/LinearPMap/Shift.lean` line 34 (`subScalar`), `Analysis/Normed/Operator/Resolvent/Unbounded.lean` line 168 (`resolventSet`), `Analysis/Normed/Module/Complexification.lean` lines 80 (`Complexification`, Taylor norm) and 356 (`complexify`), `Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean`. Mathlib: `Convex.toWeakSpace_closure`, `toWeakSpace_closedConvexHull_eq`, `LowerSemicontinuousOn.exists_isMinOn`, `NormedSpace.isCompact_closure_of_isBounded`, `IsSelfAdjoint.eq_smul_self_of_isLocalExtrOn`, `IsLocalMinOn.hasFDerivWithinAt_nonneg`, `posTangentConeAt`, `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt_1d`, `InnerProductSpace.rclikeToReal`, `NormedSpace.inclusionInDoubleDual`, `ContinuousLinearMap.rayleighQuotient`, `IsSelfAdjoint.hasEigenvector_of_isMaxOn`, `LinearPMap.adjoint` (`Analysis/InnerProductSpace/LinearPMap.lean` line 151), `IsCoercive` (real forms only, as the README says), `InnerProductSpace.toUniformConvexSpace`; `fderivWithin_eq_zero` absent (R08). Mathlib has no reflexivity of Hilbert spaces and no weak-to-norm lemma for compact operators at the pin (`Analysis/Normed/Operator/Compact/*` has no `weak`), so V1.3 is new work.

Cross-roadmap citations resolved: BanachSpaceTheory B1 (Goldstine, Mazur tail form, closure comparison), B2 (Eberlein–Šmulian, reflexivity, Milman–Pettis) on main lines 41–111; OperatorTheory/OperatorIdeals Part A; SelfAdjointSpectralTheory Parts C–E, SA-D02 (line 1067, `TauCeti.LinearPMap.spectrum` as complement of `resolventSet`), SA-E03 (line 1208), SA-E05 (line 1211); PolarDecomposition PD-A50–A53 (lines 252–262); PDE Lane D 16–19 and Lane E (lines 303–340); ComplexKahlerGeometry K5/K5a (lines 568, 1046–1070); PseudodifferentialOperators P5–P7 at its pull-request head (Layers 5–7, 7.1 consumes K5a's realization of `1+∇*∇`); DifferentialGeometry Layer 9 (Poincaré duality, line 862); AlgebraicTopology Stage 6 (AT6.3); UnboundedOperators UO-D06 and `closedFormOperator`/`closedFormOperator_spec`/`closedFormOperator_eq_of_witnesses` at its pull-request head (Suggested.lean lines 117–155). Dependency check output: `depcheck: 207 roadmaps, 1463 edges, 0 problem(s)` (no UPWARD or CYCLE line for this roadmap; see R01/R02 for the cycles it cannot see). Ownership sweep over main and the open pull requests for Courant–Fischer (owner PolarDecomposition, consumed here), Ritz, Friedrichs extension (UnboundedOperators, CongruenceSpectralGap, AutomorphicSpectralTheory, MaassForms: all consumers of a Friedrichs extension, none plans the form-domain direct method), direct method and weak lower semicontinuity (no other owner), Eberlein–Šmulian (BanachSpaceTheory), Hilbert complexification (GeneralizedCohomology G5, FreeProbability F3: R04).

Sources read: `ivrii-pde-13-1` (Theorem 1 lines 65–68, Theorem 4 lines 101–142: ordered minimisation, divergence by orthonormality and compactness, completeness through the `K`-inner product, agreeing with V4.1–V4.2; Corollary 1 lines 152–168: min–max), `hunter-pde-notes` (§4.2 lines 5098–5173, Proposition 4.5 printed p. 94: derivative of the quadratic functional with gap `½∫|Dh|²`, agreeing with V2.2; §4.10 lines 6032–6115, Theorem 4.25 printed p. 109: compact self-adjoint resolvent, eigenvalues of finite multiplicity tending to infinity, orthonormal eigenbasis, Example 4.26 noncompact case, agreeing with V5.1–V5.2 and V6.2's noncompact example).

## Not verifiable

- The Math240 scan `0226_001`, physical pages 21–28: not a published text, not in the sources cache, not in the operator's local source directory; the eight V6.2 rows citing it were checked only for internal consistency with V1–V5 and against Ivrii §13.1 and Hunter §4.10.
- Ownership against open pull requests was checked only through the project's roadmap index (grep over the open heads of 434 pull requests), not by reading every sibling folder.

## Source issues

- **Misprint** in ivrii-pde-13-1 at Theorem 4, proof step 1 (web page, lines 121–124): the proof cites "Theorem 1(3)" for the trace estimate and has a broken sentence before it; it should be Theorem 3, part (3), the inequality (13.1.6); affects nothing.
- **Error** in ivrii-pde-13-1 at Corollary 1, proof (lines 162–168): the proof says an n-dimensional subspace not spanned by the first n eigenfunctions contains a nonzero vector orthogonal to all of u_1,…,u_n, giving the bound with λ_{n+1}; it should be a nonzero vector orthogonal to u_1,…,u_{n−1}, giving the bound with λ_n, which is what the min–max formula needs; affects the proof.
- **Misprint** in ivrii-pde-13-1 at Theorem 5, proof (lines 182–184): refers to the right-hand side of (13.1.6), the trace inequality; it should be the min–max formula (13.1.8); affects nothing.
- **Gap** in hunter-pde-notes at Theorem 4.25, printed p. 109: states the first eigenvalue is simple (λ₁ < λ₂) for a general symmetric uniformly elliptic operator on a bounded open set; the proof from the compact self-adjoint resolvent gives only λ₁ ≤ λ₂, and the strict inequality fails on a disconnected Ω; affects a stated result.

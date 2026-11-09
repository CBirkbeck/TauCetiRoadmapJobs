# Review of UnboundedOperators (pull request #1027 at d0d839e)
Folder: `TauCetiRoadmap/OperatorTheory/UnboundedOperators/`
**Verdict:** needs changes

Two P3 findings, no blocking finding. Below, `README.md` and `Suggested.lean` mean the two files of this folder.

**Previous review (r9, at 45b4d4d), finding by finding.** All five are repaired.

- **R01 (P2), repaired.** `Suggested.lean:125–132` now states `commute_resolvent_iff_commute_stoneGroup`, imports `TauCeti.Analysis.Semigroups.Group.Unitary` (`:10`), and the docstring now lists only "the spectral-projection form of strong commutation (§2.3, form (i))" as unstatable (`:47`). `README.md:405` names the headline. The author generalised the requested statement from z = w = i to an arbitrary pair `z∈ρ(A)`, `w∈ρ(B)`, real points included. That version is true, because Teschl's Lemma 4.4 (`teschl line 4904–4914`) allows any z off the closed set σ(A). Rows 6–8 of the table check it.
- **R02 (P3), repaired.** `Suggested.lean:9` imports `TauCeti.LinearAlgebra.LinearPMap.SmulSub`. `A.smulSub z` replaces the hand-written shift at `:170–171`, `:187–189` and `:423–424`. `README.md:54–57` cites `LinearPMap.smulSub` with its file, and §3.2 (`:528`) uses it.
- **R03 (P3), repaired.** `README.md:218–228` adds "Milestone names and dependency order" with UO1–UO5. Its anchor is the one that `TauCetiRoadmap/LocalVariationalFieldTheory/README.md:1167` on main cites. The five milestones cover the 39 target ids of the README exactly once (9 + 11 + 10 + 5 + 4), and no milestone needs a later one.
- **R04 (P3), repaired.** `README.md:36–40` now reads "it upgrades `B♯ = InnerProductSpace.continuousLinearMapOfBilin B` … Its inverse, composed with the inverse Riesz map … sends a continuous functional ℓ to the unique u". §4.7 (`:711–715`) adds the V=ℝ example, including the value 12 that the wrong reading gives.
- **R05 (P3), repaired.** `README.md:448–452` gives §2.4 an **API.** block with three bullets: the regular quotient, the completion, and the CW structure with its homology. It agrees with the five Checks (row 10).

## R01 (P3) — The extremal half of the Friedrichs headline has no locator, and the cited source does not contain it

**Location.**
- `README.md:785–790`: "Prove the form-order/resolvent-order extremal property among self-adjoint extensions with the same lower bound … `R_T(λ)≤R_(S_F)(λ)`".
- `Suggested.lean:228–233`: "(Teschl, Theorem 2.12) that is largest among all such extensions in form order".

**Claim.**
- `friedrichs_extension_extremal` has two halves: existence of S_F, and extremality in resolvent order among self-adjoint extensions with the same bound.
- Only existence has a locator. Teschl's Theorem 2.12 states existence, the same lower bound, and uniqueness among extensions whose domain lies in `H_(A−γ)`. It says nothing about form order.
- Neither the Problems after Theorem 2.13 (2.10–2.16, pp.72–73) nor anything else in the text states the extremal property. So a headline target carries a claim with no source and no stated route.

**Witness.** `teschl line 2914–2917` is the whole statement of Theorem 2.12. A search of the extraction for "largest" or "Krein" finds no extremality statement, and `teschl line 3011–3028` (Problems 2.10–2.16) have none either.

**Repair.**
- In §4.7, after "since `R(λ)=−(·−λ)⁻¹`." (`:790`), add: "Teschl proves existence and uniqueness only; the extremal property is proved here. For T as above, `q_T` and `q_S` agree on `dom S`, so the closure of `dom S` in the form norm of `q_T` is `dom q_(S_F)`, with `q_T=q_(S_F)` there. For λ<γ, `⟨h,(T−λ)⁻¹h⟩=sup_(u∈dom q_T)(2Re⟨h,u⟩−q_T[u]+λ‖u‖²)`. The supremum for S_F runs over the smaller set `dom q_(S_F)`, which gives `(S_F−λ)⁻¹≤(T−λ)⁻¹`."
- In the docstring at `Suggested.lean:230–231`, write "(existence: Teschl, Theorem 2.12; the extremal property is proved in README §4.7)".
- Alternatively, cite a legal source with its exact theorem and page.

**Tested** on the README's own Check: −d² on `C_c∞(0,1)`, T Neumann, S_F Dirichlet, h=1, λ=−1.
- For T the supremum over H¹ is attained at u=1, with value 2−1=1.
- For S_F it is attained at the Dirichlet solution of −u″+u=1, with value ∫u = 1−2tanh(½) ≈ 0.0758 ≤ 1.
- So `⟨1,R_T(−1)1⟩=−1 ≤ −0.0758=⟨1,R_(S_F)(−1)1⟩`, as the Check states.

## R02 (P3) — §2.3's *Needs:* line omits SA-E01, which the same paragraph says form (i) needs, and the inputs of the route's commutant step; Layer 2's Dependencies omit the new group inputs

**Location.**
- `README.md:405`: "form (i) needs the spectral measures `P_A`, `P_B` of SA-E01 … apply Teschl's Lemma 4.9".
- `README.md:426`: "*Needs:* SelfAdjointSpectralTheory SA-D17, SA-D20, SA-E26 and SA-E43; Tau Ceti's unitary C₀-groups … §1.1".
- `README.md:496`: "Layer 1; SelfAdjointSpectralTheory Stone/resolvent contracts; VonNeumannAlgebras bounded projections; Tau Ceti's finite-CW …".

**Claim.**
- Statement (i) is about `P_A(Ω)` and `P_B(Ω′)`, which are SA-E01, and SA-E01 is not on the *Needs:* line.
- The route's central step is Teschl's Lemmas 4.5 and 4.9: a bounded operator commutes with `R_A(z)` exactly when it commutes with every bounded Borel function of A, in particular every `exp(isA)`. It goes through the spectral calculus: the resolvent as a spectral integral (SA-E05) and a commutant theorem. No layer and no listed supplier provides either.
- The *Needs:* rule asks for the statement's and the route's inputs item by item.
- Layer 2's Dependencies paragraph still omits Tau Ceti's unitary C₀-groups with Stone's theorem and Mathlib's Fuglede theorem, which §2.3 now uses. Layer 6's paragraph (`:1092`) was updated in the same way.

**Witness.** On main, `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md` has:
- SA-E01 at `:1202`;
- SA-E05, `⟪ξ,R(z)ξ⟫=∫(z−s)⁻¹dμξ(s)`, at `:1211`;
- SA-B57, which says a bounded operator commutes with normal a exactly when it commutes with every `P(B)`, at `:460`.

None of the three appears in `README.md:426`.

**Repair.**
- At `:426`, write "*Needs:* SelfAdjointSpectralTheory SA-D17, SA-D20, SA-E01 (form (i)), SA-E05, SA-E26 and SA-E43, and SA-B57 applied to the bounded normal operator `R_A(z)` for the route's step that a bounded operator commutes with `R_A(z)` exactly when it commutes with every `P_A(Ω)`, hence with every `exp(isA)`; …" and keep the rest of the line.
- At `:496`, add "Tau Ceti's unitary C₀-groups and Stone's theorem, and Mathlib's `IsStarNormal.commute_star_right`, for §2.3".

**Tested.**
- SA-E01, SA-E05 and SA-B57 resolve on main and at both open SelfAdjointSpectralTheory revisions (#1854, #1187). They add no edge to the dependency check, because SelfAdjointSpectralTheory is on main.
- On the §2.3 Check A=diag(0,1), z=½: the spectral projections of `R_A(½)=diag(2,−2)` are diag(1,0) and diag(0,1), which are `P_A({0})` and `P_A({1})`. diag(2,3) commutes with both, and X with neither, which matches the Check's two outcomes.

## Verified sound

**Gate and dependency check.**
- The worker's gate at `d0d839e` has every rule at 0 (`OK`).
- My rerun of the brief's gate command, which reads the configured merge order, has every rule at 0 except `depcheck=1: NOT IN ORDER: UnboundedOperators (insert it after its last supplier)`. That is not a finding: the candidate order lists this roadmap at line 10, after VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8) and OperatorKTheory (9).
- The dependency check against the candidate order:

```
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean` of this folder; nothing changes outside it.

**Elaboration, signatures and the one-tactic probe.**
- `lake env lean` on `Suggested.lean` takes 10.2 s and gives 22 `sorry` warnings, one per theorem, and nothing else.
- One scratch file `#check`s all 30 declarations; I compared every elaborated type with its README statement.
  - The two new theorems carry `[CompleteSpace H]` (and `[CompleteSpace K]`) and every hypothesis of the README sentence.
  - The Nelson theorems carry `[CompleteSpace H]` explicitly.
  - No section binder is lost, and the file is unchanged by the review.
  - `example : A.smulSub z = z • A.domain.subtype - A.toFun := rfl` closes.
- One-tactic probe: each `sorry` was replaced by `first | (rfl; done) | (trivial; done) | (infer_instance; done) | (decide; done) | (exact?; done) | sorry`. `simp` and `aesop` were added for the four new or changed theorems.
  - `simp` hits a non-recoverable recursion error on `exists_realAnalytic_eigenvalue_branches` and `stoneGroup_tensorSum_apply_tmul`, and `exact?` hits the heartbeat limit on the Kato theorem.
  - Those three were rerun without them.
  - All 22 theorems stay at `sorry`.
- No declaration is padding. `stoneGroup_tensorSum_apply_tmul` is §6.3's group factorization, which needs the closure, Stone uniqueness and a core argument. It mirrors no Check.

**Headline theorems** (README §§1–6), stated at the pins:

| README | Headline |
|---|---|
| §§1.1–1.2 | `existsUnique_spectralIntegral` |
| §1.7 | `existsUnique_maximal_multiplier` |
| §2.2 | `existsUnique_projValMeasure_of_normal` |
| §2.3 | `commute_resolvent_iff_commute_stoneGroup` |
| §2.5 | `existsUnique_jointProjValMeasure` |
| §2.6 | `existsUnique_projValMeasure_of_unitary_representation` |
| §3.2 | `notMem_essentialSpectrum_iff`, with `discreteSpectrum` and `essentialSpectrum` |
| §3.3 | `exists_spectralType_decomposition` |
| §4.2 | `resolventSet_alternatives_of_isClosed_symmetric` |
| §4.7 | `existsUnique_selfAdjoint_of_closed_form`, `friedrichs_extension_extremal` |
| §5.1 | `integralOperator_counterexample` |
| §5.3 | `nelson_essential_selfAdjoint`, `nelson_resolvent_commute` |
| §5.4 | `essentialSpectrum_eq_of_isCompactOperator_resolvent_sub`, `isSelfAdjoint_add_and_essentialSpectrum_eq` |
| §5.5 | `exists_analytic_eigenvalue_branch`, `exists_realAnalytic_eigenvalue_branches` |
| §5.7 | `isSelfAdjoint_closure_neg_laplacian_add_potential` |
| §§6.2–6.3 | `existsUnique_tensorSum`, `existsUnique_tensorProd`, `stoneGroup_tensorSum_apply_tmul` |

Confirmed as not statable at the pins:
- **`P_A` and everything built on it.** No constructor of a `ProjValMeasure` from a self-adjoint `LinearPMap` exists at the Tau Ceti pin.
- **Sturm–Liouville minimal and maximal operators.**
- **The translation surface.**

Every Lean name of the file appears in the README.

**Adversarial table.** Conventions:
- inner products are conjugate-linear in the first slot;
- `R_A(z)=(zI−A)⁻¹` (Tau Ceti), against Teschl's `(A−z)⁻¹`;
- `U(t)=exp(itA)`, with complex generator `i•A`;
- `N₊=ker(S*−i)`.

Rows 6, 7 and 37 were checked numerically on 2×2 and 4×4 matrices (power-series exponentials, error below 10⁻⁹).

| # | Statement | Instances | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1 | `existsUnique_spectralIntegral` | atoms 0,1 on ℂ², x=(1,2), f=(2,i); X=∅ | f[P]x=(2,2i), ‖·‖²=8=4·1+1·4; unconjugated ∫f²dμˣ=4−4=0; X=∅ forces I=P(∅)=0, H=0 | true |
| 2 | §1.4 pushforward (sampled) | A=diag(−1,1), f=t², g=√; f=t³, g=∛ | P_{f(A)}({1})=P_A({−1,1})=I; g∘f=\|t\|≠t at −1 with P_A({−1})≠0, so g(f(A))=I≠A; for t³, P_A({g∘f≠id})=P_A(∅)=0 | true both ways |
| 3 | §1.5 spectral family (sampled) | A=aI, a<b; diag(0,1); H=0 | E(a)=E(b)=I, P((a,b])=0, P([a,b])=I; E(1)−E(0)=I−diag(1,0)=diag(0,1); H=0 all 0 | true |
| 4 | `existsUnique_maximal_multiplier` | one point, f=i; counting ℕ₊, f=n | T=iI, T*=−iI, star f=−i≠i so the realness premise fails; x=n⁻²: Σn²n⁻⁴=π²/6 (in); x=n⁻¹: Σ1=∞ (out) | true |
| 5 | `existsUnique_projValMeasure_of_normal` | diag(1,i); [[0,1],[0,0]] | ‖Ne₂‖=‖N*e₂‖=1, ⟨e₂,Ne₂⟩=i=∫z dδ_i; nilpotent ‖Ne₂‖=1≠0=‖N*e₂‖, `hnorm` fails | true |
| 6 | `commute_resolvent_iff_commute_stoneGroup` | Pauli X,Z, z=w=i | LHS: [R_X(i),R_Z(i)]=[[0,−½],[½,0]]=(XZ−ZX)/4≠0; RHS: U(π/2)V(π/2)=−XZ≠−ZX | false=false |
| 7 | same, real point | A=diag(0,1), z=½; B=diag(2,3), w=i; B=X, w=2 | R_A(½)=diag(2,−2); with B=diag(2,3) both sides true; with X, [R_A(½),R_X(2)]≠0 and exp(iπA)=Z vs exp(iπX/2)=iX do not commute | true at a real point |
| 8 | same | A=B; H=0 | resolvent identity makes LHS true; one generator's group commutes, RHS true; H=0 both true | true |
| 9 | §2.3 *Needs:* | `:405` against `:426` | text: form (i) needs SA-E01; line: SA-D17, D20, E26, E43 only | R02 |
| 10 | §2.4 API (new) | completed surface | angles 8·π+4·(3π/2)=14π; regular point 4·π/2=2π; χ=2−16+8=−6=2−2·4; ranks 1,8,1 | consistent |
| 11 | `existsUnique_jointProjValMeasure` | n=0; diag(0,1),diag(2,3); X,Z | Fin 0→ℝ is a point, P=I unique; atoms (0,2),(1,3); `hcomm` fails for X,Z | true |
| 12 | §2.6 Stone (sampled) | n=1, A=diag(0,1); n=0 | ⟨e₂,U(t)e₂⟩=e^{it}=∫e^{its}dδ₁; the sign exp(−i…) would put the atom at −1; n=0: U(0)=U(0)² unitary, so I | true |
| 13 | `discreteSpectrum`, `essentialSpectrum` | diag(0,1); 0 on ℓ²; diag(1/n); ℚ-diagonal | σ_ess=∅; {0} (dim ker=∞); {0} (0 not an eigenvalue); ℝ, and dropping isolation would give ℝ∖ℚ | true |
| 14 | `notMem_essentialSpectrum_iff` | rank-one P on ℓ², z=1,0,i; ℚ-diagonal at q | z=1: dim ker 1, range ker P closed, codim 1 / 1∈σ_d; z=0: dim ker ∞ / 0∈σ_ess; z=i: ker 0, range H / i∉σ; q: range not closed / q∈σ_ess | true both ways |
| 15 | `exists_spectralType_decomposition` | diag(0,1); M_x on L²[0,1]; Cantor | H_pp=ℂ²; H_ac=H; H_sc=H; μ^{x+y}≤2(μˣ+μʸ) gives submodules | true |
| 16 | §3.5 realization (sampled) | A=diag(n) on ℓ²(ℕ₊), F=[0,1], D=ℚ∩[0,1]; m=2, F={i,5}; H=0 | g(n)=q_n: σ_p=D, σ=[0,1], σ_c=[0,1]∖ℚ, σ_r=∅; m=2: σ=σ_p=F, \|F\|=2≤m; H=0: all ∅ | true |
| 17 | `resolventSet_alternatives_of_isClosed_symmetric` (sampled §4.2) | 2I; −i d/dx on H₀¹(0,∞); on H₀¹(0,1); H=0 | ρ=ℂ∖{2} (fourth, s.a.); \|e^{iz̄x}\|=e^{(Im z)x}∈L² iff Im z<0, ρ={Im z>0} (third); ρ=∅ (first); ρ=ℂ (fourth) | true |
| 18 | §4.3 partial isometries (sampled) | interval (1,1) ⊕ half-line (1,0); partial U | indices (2,1); (T+i)(x₊+Ux₊)=2ix₊ and (T−i)(x₊+Ux₊)=−2iUx₊, so N₊(T)=N₊⊖dom U, N₋(T)=N₋⊖ran U | true |
| 19 | §4.4 conjugation (sampled) | i∂ on split line with Jψ=conj ψ(−x); plain K | AJψ=JAψ=−i conj ψ′(−x); A(Kψ)=+i conj ψ′ vs K(Aψ)=−i conj ψ′ | commute vs anticommute |
| 20 | §4.5 boundary form (sampled) | unit x₊, x₋; C=iI, [[1,1],[0,1]], diag(2,1); (k,λ,μ)=(1,i,0) | G(x₊,x₊)=−i−i=−2i, (i/2)G=1; x₋: 2i, −1; C*JC=J for iI (det −1) and [[1,1],[0,1]], fails for diag(2,1) (ād−c̄b=2); kλ̄=−i not real, the form gives 2iḡ′(0)f′(0)≠0 | true |
| 21 | §4.6 examples (sampled) | φ₊=Ce·e^{−x}, φ₋=Ceˣ; λ=e^{0.7i}, ±1; half-line | ‖φ±‖²=C²(e²−1)/2=1; u(0)=C(1+eλ), u(1)=C(λ+e); \|(λ+e)/(1+eλ)\|=1.000; λ=1→1, λ=−1→−1; half-line: e^{−x}∈L², eˣ∉L², (1,0), σ the closed lower half-plane | true |
| 22 | `existsUnique_selfAdjoint_of_closed_form` (sampled §4.7) | ℂ: j=id, q=2ūv; j=2id, q=ūv; q=0 with α=1,2 | A=2I: q(1,i)=2i=⟨2,i⟩; A=I/4: ⟨2u/4,2v⟩=ūv; A=0 for both shifts | true |
| 23 | `friedrichs_extension_extremal` (sampled §4.7) | −d² on C_c∞(0,1), Neumann T, h=1, t=−1 | ⟨1,R_T(−1)1⟩=−1 ≤ −0.0758=⟨1,R_SF(−1)1⟩; variational suprema 1 (over H¹) and 0.0758 (over H₀¹) | true; R01 |
| 24 | Lax–Milgram contract | V=ℝ, q=2uv, ℓ=6v | equivalence v↦2v; inverse(6)=3 and q(3,v)=6v; equivalence(6)=12 | README right |
| 25 | §4.8 Green, LC/LP (sampled) | p=w=1, q=0 on (0,1), f=x², g=1; ν=½, 3/2 | ⟨g,τf⟩=−2, ⟨τg,f⟩=0, W₀−W₁=0−2=−2 (README), Teschl's W₁−W₀=+2; ν=½: 1, r ∈ L² (LC); ν=3/2: −(r⁻¹)″+2r⁻³=0, r⁻¹∉L² (LP) | README right; Source issues |
| 26 | `integralOperator_counterexample` | f_n=n⁻¹1_[0,n] | ‖f_n‖²=1/n→0, ∫f_n=1, so (0,1)∈cl graph; f↦ȳ∫f continuous only for y=0 | true |
| 27 | `nelson_essential_selfAdjoint` (sampled §5.3) | k=1, S=2I, x=1, C=R=2; S=iI; k=0 | n=0,1,2: (1,2),(2,4),(4,16); ⟨i,1⟩=−i≠i=⟨1,i⟩, `hsym` fails; k=0 vacuous | true |
| 28 | `nelson_resolvent_commute` | Pauli X,Z, x=e₁; diag pair on D=ℂ² | XZe₁=e₂, ZXe₁=−e₂, `hcomm` fails; diag(0,1), diag(2,3): resolvents at i commute | true |
| 29 | Weyl `essentialSpectrum_eq_…` | A=0, B=P rank one; B=I on ℓ² | R₀(i)−R_P(i)=(1/i−1/(i−1))P=((1−i)/2)P compact, σ_ess={0} both; B=I: ((1−i)/2)I not compact, σ_ess {0}→{1} | true |
| 30 | `isSelfAdjoint_add_and_essentialSpectrum_eq` | A=0, V=P; V=I | K=V R₀(i)=−iP compact, σ_ess(P)={0}; V=I: −iI not compact, premise fails | true |
| 31 | `exists_analytic_eigenvalue_branch` (sampled §5.5) | A=diag(0,1), B=[[1,1],[1,0]], z=10⁻³ | λ(10⁻³)=0.000998999 against z−z²=0.000999; λ′(0)=1=⟨e₁,Be₁⟩; A−zB gives −1 | true |
| 32 | `exists_realAnalytic_eigenvalue_branches` | A=0 on ℂ², B=diag(1,−1), m=2; m=0 | branches ±t with e₁,e₂; the ordered pair (−\|t\|,\|t\|) is not analytic at 0; m=0 is excluded by `hiso`, since an isolated point of σ(A) is an eigenvalue | true |
| 33 | Kato (sampled §5.7) | u(λx); V₂=\|x\|⁻¹1_{\|x\|<1} | the GN bound scales as λ^{−3/8}λ^{3/8}=1; ∫_{\|x\|<1}\|x\|⁻²=4π; a non-decaying L^∞ part has bound 0 via ‖V∞u‖≤‖V∞‖∞‖u‖ | true |
| 34 | `existsUnique_tensorSum` (sampled §6.2) | 2I,3I; diag(0,1),X; H=0 | S=5I, σ={5}; σ(S)={−1,0,1,2}={0,1}+{−1,1}; H=0: ∅=∅ | true |
| 35 | §6.2 domains (sampled) | A=M_n, B=−M_n, x=Σn⁻¹e_n⊗e_n | ∫\|s+t\|²dμˣ=0, so x∈dom S; Σn²n⁻²=∞, so x∉dom(A⊗I); Σn⁴n⁻²=∞, so x∉dom P | true |
| 36 | `existsUnique_tensorProd` (sampled §6.3) | spectra ℕ₊ and {0}∪{1/n}; ℕ₊ and {−n+1/n} | products ℚ≥0, closure [0,∞); sums m−n+1/n never 0 (n=1 gives m, n≥2 non-integer), closure contains 0 | true |
| 37 | `stoneGroup_tensorSum_apply_tmul` (new) | A=2I,B=3I on ℂ; A=diag(0,1), B=X, t=0.83 | e^{5it}=e^{2it}e^{3it}; exp(itS)=exp(itA)⊗exp(itX) on ℂ²⊗ℂ²; exp(−itA)⊗exp(itX) differs; H=0 both 0 | true |
| 38 | milestone map | UO1–UO5 against headings | 9+11+10+5+4=39 ids, each once; anchor matches LocalVariationalFieldTheory `:1167` | resolves |
| 39 | `smulSub` | any A, z | `A.smulSub z = z • A.domain.subtype - A.toFun` closes by `rfl` | identical |

**Sources read at their locators (the seeded sample and the changed §2.3).** For `teschl`, printed page = PDF page − 12; every locator below is on its stated printed page.

| Target | Locator | Lines | Verdict |
|---|---|---|---|
| §1.4 | (3.67), Lemma 3.11, p.101 | `teschl line 4194`, `4199–4201` | supported |
| §1.5 | (3.14) and the inverse construction, p.89 | `teschl line 3633–3644` | supported |
| §2.3 | (4.21), Lemma 4.4, p.115; Lemma 4.5, p.116; (4.24)–(4.25), Lemma 4.9, Problem 4.2, p.117; (5.5), p.126 | `teschl line 4904–4923`, `4926–4930`, `4967–4987`, `5277–5280` | supported; Lemma 4.4 admits real resolvent points |
| §2.6 | Theorem 5.2, p.124 | `teschl line 5232–5233` | supported, in the opposite sign as stated |
| §3.5 | Theorem 2.21, p.78; Lemma 3.12, p.101 | `teschl line 3203–3205`, `4206–4211` | supported for real symbols; the complex case is §1.8's own |
| §4.3 | Theorems 2.25–2.26, pp.81–82 | `teschl line 3327`, `3334–3336`, `3365–3372` | supported; Teschl's `K±=Ker(A*∓i)` are N± |
| §4.4 | (2.111), Theorem 2.28, p.83 | `teschl line 3408–3418` | supported |
| §4.5 | Lemma 9.4, p.184; Theorem 9.6, p.187 | `teschl line 7818–7822`, `7937–7950` | supported for separated conditions; coupled conditions are proved here, as stated |
| §4.6 | Problem 2.27, p.84 | `teschl line 3453–3455` | supported (Teschl's +i sign) |
| §4.7 | Lemma 2.10, p.68; Theorem 2.12, p.70; Theorem 2.13, pp.71–72 | `teschl line 2803–2807`, `2914–2917`, `2960–2966` | representation and existence supported; extremality absent (R01) |
| §4.8 | Theorem 9.1, p.182; Lemma 9.4; Theorem 9.6; Theorem 9.9, p.191; EGNT Hypothesis 2.1, Theorem 2.2 | `teschl line 7677–7682`, `7818`, `7937`, `8118–8120`; `eckhardt-gesztesy-nichols-teschl line 227–229`, `257–259` | supported; Source issues for (9.4)/(9.7) |
| §5.3 | FSSS p.424; Hypothesis (C), p.428; Theorem 1, p.430 | `flato-simon-snellman-sternheimer line 58–62`, `230–232`, `277–279` | supported |
| §5.5 | Kato VII §§1–3, II §6 | none | uncertified (Not verifiable) |
| §5.7 | Lemma 10.1, p.221; Theorem 10.2, p.222 | `teschl line 9562–9564`, `9578–9584` | supported; Teschl's bounded part vanishes at ∞, and the README covers the general L^∞ case |
| §6.2 | Theorem 4.14, p.121 | `teschl line 5127–5152` | supported (domain `D(A_j^N)` for degree N, as §6.2 says) |
| §6.3 | (4.43)–(4.44), p.121; Corollary 5.3, p.125 | `teschl line 5153–5156`, `5271–5274` | supported; the closure bars are lost in the extraction |

**Library declarations opened at the pins** (manifest pins; file and line).
- Tau Ceti:
  - `LinearPMap.smulSub` (`LinearAlgebra/LinearPMap/SmulSub.lean:39`);
  - `TauCeti.Semigroups.StronglyContinuousGroup`, with `toFun : ℝ → X →L[ℝ] X` (`Analysis/Semigroups/Group/Basic.lean:74`);
  - `StronglyContinuousGroup.IsUnitary`, inner-product preservation (`Analysis/Semigroups/Group/Unitary.lean:107`);
  - `StronglyContinuousGroup.complexGenerator` (`…/Group/Unitary.lean:249`);
  - `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` (`…/Group/Stone/Unbounded.lean:106`, with `[CompleteSpace H]` at `:65`);
  - `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul` (`…/Stone/Unbounded.lean:115`).

  The README's From Tau Ceti paragraph (`:54–69`) describes each of these correctly.
- Mathlib: `IsStarNormal.commute_star_right` (`Analysis/CStarAlgebra/Fuglede.lean:178`).
- The other pinned declarations the README cites were not changed by this head; r9 opened them at the same pins.

**Cross-roadmap citations resolved.** Main is at `bbbde05`; OperatorKTheory is read at its open head.
- SelfAdjointSpectralTheory: all 29 SA ids the README cites (SA-A21 `:225` to SA-E44 `:1316`), and SA-B55–B57 (`:455–460`). They are also all present at the heads of #1854 and #1187.
- HilbertModules: H6 at `:705`; H7 at `:762`, with `D_λ` and `α_+=λα_-` at `:796–797`.
- VonNeumannAlgebras:
  - V2 (Layer 2 at `:523`, completed tensors at `:625`) and V2.RectangularL2 (`:634`);
  - V10.ClosedOperators (`:2249`) and V10.Affiliation (`:2305`).
- BanachSpaceTheory B5: `hilbertBasis_lift_mk_eq` and `nonempty_linearIsometryEquiv_iff_lift_mk_eq` (`Suggested.lean:159`, `:165`).
- GeneralizedCohomology G5.5-RealHilbert (`:1939`), with `D_C` and `(D_C)†=(D†)_C` at `:1962–1964`.
- PolarDecomposition PD-B23, B29, B32 and B34 (`:371`, `:384`, `:389`, `:393`).
- BanachAlgebras Layer 2 (`:440`) and §2.1 (`:442`).
- PDE §§1.1, 1.3, 1.4 and 1.6 (`:677`, `:769`, `:803`, `:905`).
- LieGroups Layers 2 and 5 (`:356`, `:518`).
- OperatorAlgebraDynamics D8 (`:12`).
- Completed OrthogonalL2Bases Parts A and D (`:147`, `:372`).
- OperatorKTheory §8.4 (`README.md:2088`, and `essentialSpectrum` at `Suggested.lean:86`, namespace `TauCetiRoadmap.OperatorKTheory`).
- The resolver's one lead, `applyWord`, is `CommonInvariantDomain.applyWord` at `Suggested.lean:321`.

**Ownership and overlaps.**
- The overlap listing reports no pull request changing this roadmap, no dropped id and no id that only an open revision defines; I confirmed all three.
- Every `UO-…` id cited by another roadmap on main or at an open head is a heading here.
- Two-operator strong commutation has no second owner:
  - SelfAdjointSpectralTheory on main owns only the same-operator facts SA-E06 and SA-E30, and the bounded commutant SA-B57;
  - `roadmaps grep` over the open heads finds only consumers: NoncompactQuantumSymmetry `:202`, QuantumFoundations and RelativisticQuantumFieldTheory.
- The tensor-sum group factorization has no second owner. QuantumFoundations §6.3 consumes UO-F02/F03 for `Γ(exp(itA))=exp(it dΓ(A))`.
- VariationalMethods (`README.md:45–56`) defers UO-D06 here. It names `closedFormOperator`, which this file does not declare; repointing that is VariationalMethods' job, not a finding here.
- No other `Suggested.lean` uses the namespace `TauCetiRoadmap.UnboundedOperators`.

**Other checks.**
- The family index `TauCetiRoadmap/OperatorTheory/README.md` is identical to main and does not list this child. r6 set this aside under `CONTRIBUTING.md:144`, and I agree.
- The pull-request description still describes earlier heads (`IntegralCounterexampleTargets.lean`, "eleven intentional admissions"). Nothing in the folder depends on it, and it contains no instruction to the reviewer.

**README form.**
- There are no LaTeX delimiters (the one `\` is a set difference inside a code span at `:410`), no `lemma`, no `set_option`, no pull-request numbers and no machine paths.
- "removed" occurs only for the removed vertices of the surface.
- Every layer ends with Examples and Dependencies.
- The new **API.** blocks of §2.3 (three bullets, three Checks) and §2.4 (three bullets, five Checks) agree with their Checks (rows 6–10). The README's other API blocks are unchanged since r9, which checked them.

## Not verifiable

- **Kato (1995), Nelson (1959) and Weidmann (1987).** All three are settled as uncertified in the manifest and cited by section or lemma only.
  - The sampled §5.5 (Kato VII §§1–3, II §6) was checked mathematically in rows 31–32.
  - Nelson's Lemma 5.1 in §5.3 was checked in rows 27–28.
  - Weidmann §§3–6 in §4.8 was checked in row 25.

## Source issues

- **Error** in teschl at (9.4) and (9.7), printed p.182: the source says the Lagrange boundary term is `W_d(g*,f)−W_c(g*,f)`, respectively `W_b−W_a`; it should be `W_c−W_d`, respectively `W_a−W_b`, since f=x², g=1 on (0,1) gives −2, not +2; affects a stated result.
- **Misprint** in teschl at Theorem 4.14 (proof), printed p.121: the source says the test vector is `ψ_(1,k)⊗⋯⊗ψ_(1,k)`; it should be `ψ_(1,k)⊗⋯⊗ψ_(n,k)`; affects nothing.
- **Gap** in teschl at Theorem 4.14 (proof), printed p.121: the source says Weyl sequences with `(A_j−λ_j)ψ_(j,k)→0` give `(P−λ)ψ_k→0` for P of degree N; it should use vectors from the windows `P_(A_j)((λ_j−1/k,λ_j+1/k))`, since for N≥2 first-order smallness does not control higher powers; affects the proof.

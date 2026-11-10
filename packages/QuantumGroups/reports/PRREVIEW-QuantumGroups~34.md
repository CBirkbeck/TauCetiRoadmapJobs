# Review of QuantumGroups (pull request #1649 at 5a9e439)

**Verdict:** accepted

This is an incremental re-review of the 29 lines of `TauCetiRoadmap/QuantumGroups/` that changed since `5155098`, the head the previous review (`~32`) read. The one finding of that review is repaired, the repair introduced no new problem, and no finding remains. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with only its four `sorry` warnings. The folder is ready for a human's final approval.

Two matters that earlier rounds settled as not repairable in this folder are still as they were. They are recorded under "Verified sound" for the final approver and are not findings.

## Previous findings

- R01 — repaired: `Suggested.lean:69–73` now states `AlgebraicHaar` as a positive normalized two-sided invariant integral with its four laws; `:85–93` states hypotheses, both orthogonality formulas, `Tr F̃ = Tr F̃⁻¹` and `F̃ = ρᵗ` with Neshveyev–Tuset locators.

The repair went beyond the docstrings: it added the Neshveyev–Tuset identification at `README.md:634–636`, a prose `AlgebraicHaar` API bullet at `:660`, two Checks at `:666` and `:668`, locators on the `*Needs:*` line at `:671` and two locators in the reference entry at `:1755`. Each was checked in full (below); none introduces a problem.

## Verified sound

**The changed passages.**

- **`README.md:634–636` and the docstring at `Suggested.lean:91–93` (`F̃ = ρᵗ`).**
  - `nt` line 450, Theorem 1.4.2(i), printed p.9, reads `h(u_kl u_ij*) = δ_ki ρ_jl / dim_q U` and `h(u_ij* u_kl) = δ_jl (ρ⁻¹)_ki / dim_q U`.
  - Renaming indices in the first gives `h(u_ij u_kl*) = δ_ik ρ_lj / dim_q U`. Against the roadmap's `δ_ik F̃_jl / Tr F̃` this is `F̃_jl = ρ_lj`, so `F̃ = ρᵗ`. The second gives `(F̃⁻¹)_ik = (ρ⁻¹)_ki`, the same identification.
  - `nt` lines 427–430 (p.9): ρ_U is the positive invertible element of `Mor(U, U^cc)` with `Tr ρ = Tr ρ⁻¹`; line 1020 gives `(ι⊗S²)(U) = U^cc`. So ρ is the roadmap's `F ∈ Hom(u, S²u)` of `README.md:653–654`.
  - `nt` line 943, Definition 1.7.1, printed p.21: `(ι⊗f_z)(U) = ρ_U^z`, so `ρ_ij = f₁(u_ij)`, matching §3.2's `f_z(u_ij) = (F^z)_ij` at `README.md:681`.
- **`README.md:660` and the docstring at `Suggested.lean:69–73` (`AlgebraicHaar`).**
  - `nt` lines 819–820, Theorem 1.6.6, Step 1, printed p.18, states exactly `h(1) = 1`, `(ι⊗h)Δ(a) = h(a)1` and `(h⊗ι)Δ(a) = h(a)1`. The bullet and the docstring cite it for these three equations only; positivity is not attributed to it.
  - The four fields at `Suggested.lean:76–83` are these three equations and `0 ≤ h(a⋆a)`, in the docstring's order.
  - "The normalization forces the algebra to be nonzero": in the zero ring `h(1) = h(0) = 0 ≠ 1`.
  - The bullet's backticked `AlgebraicHaar` is declared in `Suggested.lean`; the gate's `readme-ids-missing` is 0.
- **New Check, `README.md:666` (the W basis).** Recomputed in full; values are in table row C3.
- **New Check, `README.md:668` (the counit on ℂ[C₂]).** Recomputed; values are in table row C4.
- **`README.md:671` and `:1755`.** The three added locators (Theorem 1.4.2 p.9, Theorem 1.6.6 Step 1 p.18, Definition 1.7.1 p.21) are the ones verified above. The reference entry's "whose weight ρ is the transpose of F̃" agrees with `:634–636`.
- **Docstring hypotheses against the signature (`Suggested.lean:85–97`).** "Coproduct preserves the star" is `[TauCeti.StarCoalgebra ℂ A]`; "irreducible" is `[IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]`; "finite-dimensional … orthonormal basis `b`" is `OrthonormalBasis ι ℂ H` with `[Fintype ι]`; "unitary" is `hu`. The three conclusions match `:98–106` term by term.
- **Text depending on the change.** `README.md:626–632` (the headline and its two displayed formulas), `:653–654` (`F̃ = Fᵗ` proved as a theorem) and `:658` are consistent with the new sentences. The native names in the neighbouring untouched paragraph resolve at the Tau Ceti pin: `TauCeti.HopfAlgebra.antipode_star_antipode_star` (`Algebra/HopfAlgebra/Star.lean:65`), `antipode_bijective` (`:85`), `TauCeti.StarCoalgebra.counit_star` (`Algebra/Coalgebra/Star.lean:91`).
- **Policy.** The added text has no process word, pull-request number, LaTeX delimiter or copied passage. No statement, binder or import changed in `Suggested.lean`; the diff touches two docstrings only.

**Gate.** Rerun on this head: every scanner reports 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 234 roadmaps, 2268 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The diff adds no supplier citation.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:94`, `:122`, `:133`, `:141`) and nothing else.

**Elaborated signatures.** I put `#check @name` for all six declarations in a scratch copy and elaborated it. The six types are identical to those recorded in `~32` and in `scratch/signatures.md`. The flagged `[StarModule ℂ A]` is absent only from `AlgebraicHaar`, none of whose fields uses it; the four theorems keep it. I changed nothing.

**Padding and headlines.** No declaration was added, removed or restated, so the padding probe (24 one-tactic attempts, none closing) and the headline table of `~32` stand. The four stated headlines are `schur_orthogonality`, `compactType_iff`, `haar_modular_automorphism` and `haar_trace_iff_antipode_involutive`; the module docstring, unchanged, names the rest as not statable or as proved at the pin.

**Seeded sample.** Of the sampled targets, only §3.1 falls in the changed passages; its new locators are verified above against `nt`. The README flags no locator as unverified. The other sampled targets are untouched and were verified in `~32` (Longo–Roberts and `nt` for 0.1; `nt` for 1.2, 3.2, 3.4; `bmt` for 4.3; `malacarne` for 6.3; `banica` for 7.2; `virelizier` for 8.4, 8.7; `kustermansvaes` for 1.1).

**Overlap and ownership.**

- `scratch/overlaps.md`: no dropped id in either direction and no id defined only by an open revision. The other pull request that changes this folder conflicts with this head; the description's merge-order block orders them (this pull request first).
- `scratch/citations.md`: nothing unresolved.
- No new object is stated by the diff, so no new ownership question arises. `scratch/library-matches.md` has no same-name hit, as before.

**Remarks for the final approver (settled in earlier rounds; not findings, no change asked of this folder).**

- The open heads of CategoricalOperatorAlgebras (`b9c0a6f`, `README.md:44–46`) and TemperleyLiebOperatorAlgebras (`ba43cc7`, `README.md:72–76`) are unchanged and still call themselves the single home of objects this roadmap owns in §§0.1–0.2. This roadmap is on main and cannot consume an open roadmap, so the citations have to come from those two.
- The pull-request description still opens "Current head `d7a6c540…`" and says "All pre-existing public README bytes, Suggested.lean and metadata remain unchanged"; the head shows both files changed against main. The author can correct it before approval.

**Adversarial table.** Rows C1–C6 are computed in this review for the changed passages. The numbered rows are carried from `~32` for statements the diff leaves untouched; rows 12, 13 and 33 of `~32` are replaced by C1, C2 and C6. Carried rows keep the line numbers of `5155098`: README lines after `:660` are now 3 to 5 lines lower, and the Lean declarations 11 lower.

| # | Statement (README line or Lean decl) | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| C1 | `schur_orthogonality` and its docstring (Lean `:85–107`); `README.md:634–636` | SUq(2) at q=½; index renaming in NT 1.4.2(i); the wrong model `F̃ = ρ` | F̃=diag(2,½): h(a*a)=(½)/(5/2)=1/5, h(aa*)=2/(5/2)=4/5. NT: h(u_ij u_kl*)=δ_ik ρ_lj/dim_q, so F̃_jl=ρ_lj. A diagonal F̃ cannot tell ρ from ρᵗ; row C3 does (3i/10 against −3i/10) | pass | none |
| C2 | `AlgebraicHaar` and its docstring (Lean `:69–83`); API bullet `README.md:660` | ℂ[C₂] with h(x+yu)=x; counit; zero functional; zero ring | h(1)=1, h((1+u)*(1+u))=h(2+2u)=2≥0, (id⊗h)Δu=h(u)u=0=h(u)1; counit: row C4; zero functional: h(1)=0≠1; zero ring: h(1)=0≠1 | pass | none |
| C3 | Check `README.md:666` (W basis) | W=(1/√2)[[1,i],[i,1]], F=diag(2,½) | WW*=½[[2,0],[0,2]]=I. δ(f_j)=Σ_m f_m⊗(WuW*)_mj. WFW*=½[[5/2,−3i/2],[3i/2,5/2]]=[[5/4,−3i/4],[3i/4,5/4]]; transpose has (1,2) entry 3i/4. Direct: h(v₁₁v₁₂*)=Σ_a\|W_1a\|²·(W̄F̃Wᵗ)₁₂/(5/2)=(i−i/4)/(5/2)=3i/10; with F_v: −3i/10 | pass | none |
| C4 | Check `README.md:668` (counit on ℂ[C₂]) | ε(x+yu)=x+y | (x+yu)*(x+yu)=(\|x\|²+\|y\|²)+(x̄y+ȳx)u, ε of it is \|x+y\|²≥0; ε(1)=1; (id⊗ε)Δu=u≠1=ε(u)1. Invariance: h(u)u=h(u)1 forces h(u)=0, so h(x+yu)=x | pass | none |
| C5 | Reference entry `README.md:1755` and `*Needs:*` `:671` | three added locators | `nt` line 447 is Theorem 1.4.2 on printed p.9; line 819 is Step 1 of Theorem 1.6.6 on p.18; line 941 is Definition 1.7.1 on p.21 | pass | none |
| C6 | Docstrings `:69–73`, `:85–93` against the Lean form rule (`~32` R01) | read against the fields `:76–83` and the statement `:94–106` | 4 laws named for 4 fields; 5 hypotheses and 4 conclusions named for the signature's 5 and 4; source locators present | pass | none |
| 1 | §0.1 minimal norm product; rescaling not standard (`:219–223`, `:253–254`) | R=2e₀⊗e₀+e₁⊗e₁, R̄=½e₀⊗e₀+e₁⊗e₁; standard pair rescaled by 2, ½ | zigzags ½·2=1, 1·1=1; ‖R‖‖R̄‖=√5·√(5/4)=5/2>2; rescaled squared norms 8 and ½, product 2, traces scale 4 and ¼ | pass (carried, `~32` row 1) | none |
| 2 | §0.1 signed self-duality (`:229–233`, `:256–257`) | SU(2) cup; symmetric cup; J | R=[[0,1],[−1,0]] gives R̄R=−I, so ε=−1; I gives +1; J²(z₁,z₂)=(−z₁,−z₂); NT τ=−ε | pass (carried, `~32` row 2) | none |
| 3 | §0.1 C*-identity Checks (`:251–252`) | diag(2,1); [[1,1],[0,0]] | ‖T†T‖=4=‖T‖²; HS √17 against 5; ‖[[1,1],[0,0]]‖=√2 | pass (carried, `~32` row 3) | none |
| 4 | §0.2 closure formula and signed loop (`:274–280`, `:347`) | X=ℂ², ε=−1, d=2 | e=−RR*, e²=R(R*R)R*=2RR*=−2e; n=1: ε·T₁(1)=(−1)(−2)=2=R*R; Φ(cup)†=R*=ε(εR*) | pass (carried, `~32` row 4) | none |
| 5 | §0.2 tr_n(sx)=(−1)ⁿtr′_n(x) (`:294–300`) | strand step; Markov step; n=2 | (−1)^{n+2}(−δ)=δ(−1)^{n+1}; s⁻¹(incl x·e_last)=−incl(s⁻¹x)e_last gives (−1)^{n+1}tr′_{n+1}; T₂(se)=−d=T₂^{(−d)}(e) | pass (carried, `~32` row 5) | none |
| 6 | §0.2 pullback criterion applied (`:315–316`) | ρ=Φ_R∘s⁻¹, σ_n=d⁻ⁿR_n*(·⊗1)R_n on the image | σ_n∘ρ_n(y)=d⁻ⁿ(−1)ⁿT_n^{(−d)}(s⁻¹y)=d⁻ⁿT_n^{(d)}(y); tracial on the image; Subfactors `:752–754` needs no injectivity | pass (carried, `~32` row 6) | none |
| 7 | §0.2 Checks d=3/2 and full Φ_R (`:324–330`, `:350`) | d=3/2; X=sign of C₂ at d=1 | [3]=5/4, [4]=3/8, [5]=−11/16; at d=1, X≇1 gives Hom(X,1)=0 and full Φ_R, f₂ in the radical | pass (carried, `~32` row 7) | none |
| 8 | §1.1 C₀ identification and diagrams (`:377–437`) | ℤ; S₃ | {\|F(x)(y)\|≥ε}⊆K×⋃L_i; Δ1[0](N,−N)=1∉C₀; r₊(1[1]⊗1[−1])=1[1]; (12)(23)=(123), (23)(12)=(132) | pass (carried, `~32` row 8) | none |
| 9 | §1.2 cancellation, Haar, Fell absorption (`:443–498`) | monoid {1,0}; C(C₂); ℤ | span of Δ(A)(A⊗1) has dim 2+1=3<4; h(1[e])=½≠1=ε(1[e]); W(λ_s⊗1)W*(δ_g⊗δ_k)=δ_{sg}⊗δ_{sk} | pass (carried, `~32` row 9) | none |
| 10 | §2.1 column convention (`:549`) | S₃ permutation representation | u₁₃(σ)=1 iff σ(3)=1: (123)(3)=1, (132)(3)=2 | pass (carried, `~32` row 10) | none |
| 11 | §2.2 averaging (`:555–558`, `:576`) | C₂, U(s)=[[1,2],[0,−1]] | U(s)²=I; U*U=[[1,2],[2,5]]; T=[[1,1],[1,3]], det 2; U*TU=T; identity by right invariance on legs 1,3 | pass (carried, `~32` row 11) | none |
| 14 | `unitaryCoefficientSet` (Lean `:103`) | ℂ[C₂]; n=0; zero ring | v↦v⊗u gives [u], unitary; Fin 0 gives nothing; over 0 no comodule on ℂⁿ for n≥1 | pass (carried, `~32` row 14) | none |
| 15 | `compactType_iff` (Lean `:111`, §4.1) | ℂ; zero ring; ℂ[x] primitive | ℂ: both true; zero ring: RHS true, LHS false, excluded by `[Nontrivial A]`; ℂ[x]: (id⊗h)Δx=x+h(x)≠h(x)1, both false; NT 1.6.6 | pass (carried, `~32` row 15) | none |
| 16 | `haar_modular_automorphism` (Lean `:122`) | SUq(2) q=½; ℂ[S₃] | σ_{−i}(U)=ρUρ (NT 1.7.3): θ(a)=4a, h(aa*)=4/5=h(a*·4a); θ⁻¹ gives 1/20; ℂ[S₃] θ=id; uniqueness from faithfulness | pass (carried, `~32` row 16) | none |
| 17 | `haar_trace_iff_antipode_involutive` (Lean `:130`) | ℂ[S₃]; SUq(2) | δ_{gk,e}=δ_{kg,e} and S²u_g=u_g; h(aa*)=4/5≠1/5=h(a*a) and S²(c)=c/4≠c | pass (carried, `~32` row 17) | none |
| 18 | §3.2 characters, θ multiplicative, Vandermonde (`:675–700`) | SUq(2) q=½; λ=1,2 | f₁*f₁(a)=4+f₁(−qc*)f₁(c)=4=f₂(a); h(cθ(ab))=h(abc)=h(cθ(a)θ(b)); [[1,1],[1,4]] det 3 | pass (carried, `~32` row 18) | none |
| 19 | §3.3 traces and intrinsic dimension (`:731–744`, `:758`) | F=diag(2,½) | tr(F·diag(1,0))=2, tr(F⁻¹·diag(1,0))=½; d=5/2; metric on V** F⁻² makes j unitary; Tr F=Tr F⁻¹ forces Tr F≥n | pass (carried, `~32` row 19) | none |
| 20 | §3.4 KMS sign (`:771`, `:794–795`) | ρ-model φ=Tr(ρ·) | φ(xσ_{−i}(y))=Tr(ρxρyρ⁻¹)=φ(yx) for σ_t=ρ^{it}·ρ^{−it}; σ_t(c)=c, τ_{−i}(c)=c/4 | pass (carried, `~32` row 20) | none |
| 21 | §4.2 regular unitary (`:885–892`, `:913`) | Γ=ℤ | inner product (h⊗h)((1⊗b*)Δ(a*c)(1⊗d))=h(a*c)h(b*d); both pentagon words send (1,2,3) to (1,3,6) | pass (carried, `~32` row 21) | none |
| 22 | §4.3 criteria (`:921–948`, `:961–963`) | ℤ; F₂ | BMT 2.2, 2.8, 2.9, 3.6 as stated; Følner 2/(2N+1); Kesten 2√(2·2−1)=2√3<4 | pass (carried, `~32` row 22) | none |
| 23 | §5.2 cup and AM–GM (`:1024–1036`, `:1049–1051`) | F=[[0,1],[−2,0]] | F²=−2I; E=−2e₀⊗e₁+e₁⊗e₀, ‖E‖²=5; J(e₀)=−√2e₁; Tr F*F=5≥2·2; \|det F\|²=4=c² | pass (carried, `~32` row 23) | none |
| 24 | §6.3 uniqueness and commutative case (`:1149–1168`, `:1177–1179`) | {e}→C₂; {1,0}; C(C₂) | (a,b)↦a; 0·1=0·0 with 1≠0; Haar ½,½; Malacarne 4.1 uniqueness of the Hopf *-algebra | pass (carried, `~32` row 24) | none |
| 25 | §7.1 Haar and the q=−1 model (`:1199–1232`, `:1242–1244`) | q=½; q=−1 | 1/(1+q²)=4/5; (1−q²)/(1−q⁶)=16/21; endpoint ½, ⅓; ac=−ca and a*a+c*c=1 in the σ-model; multiplicative-domain step φ(a*a)=χ(a₀*a₀)=1 | pass (carried, `~32` row 25) | none |
| 26 | §7.2 Banica, n=2 normal form (`:1250–1290`, `:1300–1302`) | F=[[0,1],[−q⁻¹,0]]; F=I₂ | F²=−q⁻¹I, d=\|q\|+\|q\|⁻¹; FūF⁻¹=[[a,−qc*],[c,a*]]; I₂ gives q=−1, VVᵗ=[[0,1],[1,0]] for V=(1/√2)[[1,i],[1,−i]]; dims 1, 5/2, 21/4, 85/8 | pass (carried, `~32` row 26) | none |
| 27 | §8.1 relations and Hopf convention (`:1325–1363`, `:1383–1386`) | q=½; q=0, ±1 | L₁⁺: EF−FE=diag(1,−1)=(K−K⁻¹)/(−3/2); S²(E)=K⁻¹EK=Ad(K⁻¹)E; q=0: KE=0 forces E=0 | pass (carried, `~32` row 27) | none |
| 28 | §8.3 Casimir separation (`:1441–1449`, `:1488–1490`) | q=½; signs ε≠ε′ | 10/9, 17/9, 65/18; ε=−ε′ needs q^{m−m′}=−1 or q^{m+m′+2}=−1, impossible at a generic q | pass (carried, `~32` row 28) | none |
| 29 | §8.4 type 1 (`:1504–1518`, `:1528–1530`) | L₀⁻; Verma of weight 1 | \|q^k\|=2^{−k}=1 only at k=0 and q⁰≠−1; F^jv₀ has weight 4^j | pass (carried, `~32` row 29) | none |
| 30 | §8.5 CG coefficients and Δ(E^r) (`:1602–1615`, `:1647–1650`) | m=n=j=1, q=½; r=2 | coefficient of v_i⊗v_{j−i−1}: α_{i+1}ε[m−i]+α_iεq^{m−2i}δ[n−j+i+1]=0; α₁=−½; middle term (1+q²)EK⊗E=q[2] | pass (carried, `~32` row 30) | none |
| 31 | §8.6 pairing (`:1671–1677`, `:1688–1690`) | q=½ | ⟨K,·⟩ multiplicative (a*a+c*c↦1); ⟨E,ac*⟩=−q^{−1/2}=q⟨E,c*a⟩; h₁=q; E*=KF | pass (carried, `~32` row 31) | none |
| 32 | §8.7 specialization (`:1696–1707`, `:1723–1725`) | v=1, m=2 | F coefficients 1, 2, 0; E coefficients 0, 2, 1; [E,F]=diag(2,0,−2) | pass (carried, `~32` row 32) | none |
| 34 | Layer 0 ownership (`README.md:29–46`) | #888 `:44–46`; #867 `:72–76` | both heads claim the single home; QuantumGroups is on main | settled (carried, `~32` row 34) | none |

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), is recorded `uncertified` in the manifest and is cited by locator only. The changed `*Needs:*` line at `README.md:671` keeps its Propositions 3.2.9, 3.2.17 and Theorem 5.4.1; the diff adds the Neshveyev–Tuset locators beside them, and those were read.
- The head of the other pull request that changes this folder was not read; its conflict with this head is taken from `scratch/overlaps.md`, and the order from the description's merge-order block.

## Source issues

- none

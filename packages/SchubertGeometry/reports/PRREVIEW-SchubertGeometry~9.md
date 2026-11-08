# Review of SchubertGeometry (pull request #1224 at aab273f)

**Verdict:** needs changes

Incremental re-review of the 10 lines changed in `TauCetiRoadmap/SchubertGeometry/README.md` since 39437f2 (the S4.7 API bullets and Checks), together with everything they cite: the From Tau Ceti contract names they use, the S3.2 and S3.4 Checks they refer to, the LLM locators of the S4.7 prose, and the manifest pin that the previous R01 is about. One blocking finding carried from the previous review and one new P3 introduced by the repair. The gate passes; the verdict is a request for repairs before the next review, not an approval.

## R01 (P2) — The branch still pins a Tau Ceti revision that has none of the Lakshmibai–Seshadri, crystal or Demazure files the README consumes, so the S4 headlines stay unstated

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:3`, “The finite-type Lakshmibai–Seshadri path engine is consumed from the pinned Tau Ceti, whose `TauCeti/RepresentationTheory/LSPath/` and `TauCeti/RepresentationTheory/Crystal/` files already prove…”; the From Tau Ceti contract (lines 73–336); the new S4.7 bullet at line 1127, “`TauCeti.PLPath.endpoint` of `TauCeti.LSPath.toPLPath`”. `TauCetiRoadmap/SchubertGeometry/Suggested.lean:21–23`, “the Tau Ceti revision pinned by this folder's manifest has none of these files.”

**Claim:** The README cites these declarations as present at the pin this folder builds against; the Lean file says the pin lacks them; both cannot hold. The S4 headlines (operator stability, generation, character formula) are statable on native carriers at main's pin and are absent from `Suggested.lean`.

**Witness:** `lake-manifest.json` at aab273f still pins Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`; the merge base is still `fee8e0ea`. The pinned checkout `.lake/packages/TauCeti/TauCeti/RepresentationTheory/` has no `LSPath` directory. The two names the repair added resolve at main's pin only: `TauCeti.LSPath.toPLPath` at `TauCeti/RepresentationTheory/LSPath/Basic.lean:217` and `TauCeti.PLPath.endpoint` at `TauCeti/RepresentationTheory/LSPath/PLPath.lean:464` of `2fd255d9`; the only `def endpoint` at `a91d3aafa` is in `AlgebraicTopology/UniversalCover/BasedPath.lean`. `Suggested.lean` is byte-identical to the previous head and declares nothing. This is the previous review's R01, unrepaired, and no repair report marks it not actionable.

**Repair:** As in the previous review: (1) merge main into the branch so the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b` (every library name of the README, including the two added ones, resolves there); (2) state the S4 headlines in `Suggested.lean` with `sorry` and no new definitions, in the hypothesis pattern of `TauCeti.LSPath.forall_raise_eq_none_iff` (`RepresentationTheory/LSPath/Highest.lean:73`): operator stability (if `PLPath.lower (F i) (f (P.root i)) (π.toPLPath 𝕜 f) = some q` then `q` is the realization of some `π' : LSPath P b lam`, and the same for `raise`), generation (every `π` is reached from `LSPath.straight lam` by a finite list of simple lowerings), and the ℤ[X] character identity `weylDenominator P b * ∑ᶠ π, single (wt π) 1 = dotAlternatization P b (single lam 1)` with `f (wt π) = (π.toPLPath 𝕜 f).endpoint`; (3) delete “the Tau Ceti revision pinned by this folder's manifest has none of these files” from the S3 and S4 docstring items.

**Retest:** `ls .lake/packages/TauCeti/TauCeti/RepresentationTheory/LSPath` in the worktree lists `Basic.lean`, `PLPath.lean`, `Highest.lean`; `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean` reports only `sorry` warnings.

## R02 (P3) — The first S4.7 Check names the wrong value for the dictionary that drops w₀

**Location:** `TauCetiRoadmap/SchubertGeometry/README.md:1131`, “A dictionary that dropped the sign or the w₀ would assign the fibre the weight κ or −λ.”

**Claim:** The Check's negative control is miscomputed. The rule is weight −w₀π(1) with π(1)=κ for the straight encoding. Dropping the sign gives w₀κ=w₀(−w₀λ)=−λ, as stated. Dropping the w₀ gives −π(1)=−κ=w₀λ, not κ; κ is what dropping both the sign and the w₀ gives.

**Witness:** GL₃, λ=e₁, the instance of the third Check: κ=−e₃, so −κ=e₃=w₀λ while κ=−e₃. The Check's two listed wrong values are −e₃ and −e₁; the two wrong dictionaries actually produce −e₁ and e₃. The row “S4.7 Check 1” in the table below has the values.

**Repair:** Replace the sentence by “A dictionary that dropped the sign would assign the fibre the weight −λ, one that dropped the w₀ the weight −κ=w₀λ, and one that dropped both the weight κ; for GL₃ and λ=e₁ these are −e₁, e₃ and −e₃, none of them e₁.” Retest: with λ=e₁ and κ=−e₃, w₀κ=−e₁, −κ=e₃, κ=−e₃.

## Previous findings

- R01 — not repaired: `lake-manifest.json` pins Tau Ceti `a91d3aafa`; no `RepresentationTheory/LSPath` at that pin; `Suggested.lean` unchanged, “the Tau Ceti revision pinned by this folder's manifest has none of these files.” Now R01.
- R02 — repaired: S4.7 (lines 1126–1134) now has three API bullets (index test in W/W_κ, weight −w₀π(1), the partial-flag projections) and three Checks (w=e, w=w₀, GL₃ λ=ω₁ w=s₂); the wall case computes one section. The repair introduced R02 of this report (one wrong negative-control value).

## Verified sound

**Scope and gate.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchubertGeometry'` is empty. My run of the gate at aab273f: every check zero, `OK` (the worker's run adds `build=0`). My run of the brief's dependency check printed

    depcheck: 236 roadmaps, 2419 edges, 0 problem(s)

with no UPWARD, CYCLE or moved line for SchubertGeometry (it is on main). `lake env lean TauCetiRoadmap/SchubertGeometry/Suggested.lean`, run from the worktree, exits 0 with no output in 21 s; the file has `import Mathlib`, one module docstring, an empty namespace, no declaration, no `set_option`, no sorry'd data, so there is nothing to probe with one tactic and no fully qualified name that can collide. The ten added lines contain no LaTeX delimiters, process words, pull-request numbers, `lemma` or machine paths (grep for “so far”, “current”, “removed”, “round”, “pull request”, `#NNN`, `$`, `\(` and a home-directory prefix: no hit).

**The changed passage against its sources and contract.** The S4.7 prose's locators were re-read: LLM lines 809–811 (Proposition 14, printed p. 312) state that the LS chains whose first direction is bounded by w=w_max(i) index a basis of V_λ(w); LLM line 946 (§4.1, pp. 314–315) is the dual embedding V*_{i,m} ↪ H⁰(Z_{i,m}, L_{i,m}) ↪ H⁰(Z_i, L_{i,m}). The two native names added at line 1127 are in the From Tau Ceti contract already (lines 228 and 260) and resolve at main's pin as under R01: `toPLPath : LSPath P b lam → PLPath 𝕜 V` (`LSPath/Basic.lean:217`), `endpoint : PLPath 𝕜 V → V` (`LSPath/PLPath.lean:464`); the first bullet's “τ₀ … a minimal representative of W/W_κ” matches the `dir` field of `TauCeti.LSPath` (`Basic.lean:101`, minimal coset representatives of `wallIndices`, which `parabolic_wallIndices_eq_stabilizer` identifies with the stabilizer). The S3.2 Check the third S4.7 Check cites is at line 815 (L(ω₁) has degree ⟨ω₁,α₂∨⟩=0 on X(s₂), one-dimensional section space): the two agree. The second Check's “V(κ)=V(λ)*” is used only at the level of weights with multiplicity, where it holds in every characteristic (Δ(κ)≅∇(λ)* and both have the Weyl character), consistent with S3.4's every-characteristic ∇(λ).

**Mathematics of the three bullets.** Bullet 1: for a minimal coset representative τ₀ and any u∈W, τ₀≤u in W iff τ₀≤min(uW_κ) in W: if τ₀≤min(uW_κ) then τ₀≤min(uW_κ)≤u; if τ₀≤u then, the projection onto minimal representatives being order preserving, τ₀=min(τ₀W_κ)≤min(uW_κ). Bullet 3: λ trivial on the Levi roots of P gives W_P⊆W_λ, and θ(W_P)=w₀W_Pw₀⊆w₀W_λw₀=W_{w₀λ}=W_{−w₀λ}=W_κ; θ(wu)=θ(w)θ(u) with θ(u)∈W_κ makes the test independent of the representative of wW_P. Bullet 2 and the sign/orientation of the whole dictionary were recomputed on GL₃, λ=e₁ for all six w (table).

**Adversarial table.** Rows marked (r8) are carried from the review at 39437f2 for statements the diff leaves untouched, with the values computed there; the S4.7 rows were computed this round by hand.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| S1.0 canonical line | GL₂ over ℤ, Borel scheme ℙ¹ | det(End E)=O; 0→Lie B→End E→Hom(L,E/L)→0 with L=O(−1), E/L=O(1): Hom=O(2); det(Lie B)*=O(2), degree 2; weight-one line degree 1 | pass (r8) |
| S1.0 Borel of ℍ | adjoint group of (−1,−1)/ℝ | conic x²+y²+z²=0, norm form of pure quaternions; no real point, ℙ¹ over ℂ | pass (r8) |
| S1.0 cells | GL₃/𝔽₂; ℙ² | lengths 0,1,1,2,2,3: 1+2+2+4+4+8=21=168/8; 1+2+4=7 | pass (r8) |
| S1.1 incidence | rank 3, ranks (1,2); k[ε] | ℙ²×ℙ²* dim 4, flag dim 3; F₁→E/F₂ sends e₁+εe₃ to ε·ē₃≠0 | pass (r8) |
| S1.3 pivots | Gr(2,4): (1,2),(1,3),(3,4); N=0 | Σ(p_i−i)=0,1,4; λ=(2,2),(2,1),(0,0), 4−|λ| agrees; rank 0 point, rank 1 empty | pass (r8) |
| S1.5 Gram | columns (u_{1..r}; u_{r+1..m}, f_{r+1..m}; f_{1..r}), Q(u_i,f_j)=H_{i,m+1−j}=δ_{ij} | blocks (1,3)=I_r, (3,1)=−I_r, (2,2)=J₀ | pass (r8) |
| S1.5 product/inverse | r=s=1, Y=(1,2), Y′=(3,4), Z=5, Z′=6 | YᵀJ₀Y′=4−6=−2; product ((4,6),9), reversed sign 13; Z+(−Zᵀ)−YᵀJ₀Y=0 | pass (r8) |
| S1.5 conjugation | l=diag(A,D,A^{−T}) | (1,2) block A·YᵀJ₀·D⁻¹=AYᵀDᵀJ₀ by DᵀJ₀D=J₀; (2,3) DYAᵀ; (1,3) AZAᵀ; l symplectic for J_{(r,s)} | pass (r8) |
| S1.5 dimension | m=2: r=1,2,3 | 3, 3, empty; Levi+radical: (1+3)+(2+1)=7, (4+0)+(0+3)=7, 10−7=3 | pass (r8) |
| S2.3 weights | Q=i; Q=ii | β=±α_i; fibres λ, s_iλ; δ(ii)=max(s_i,e)=s_i; sections ε↦e,s_i,s_i,e | pass (r8) |
| S2.5 kernel | SU₂×U₁→U₂ | {(I,1),(−I,−1)}, size 2 | pass (r8) |
| S3.1 sign | SL₂, λ=1; GL₂ det | degree ⟨λ,α∨⟩=1; det restricts to degree ⟨det,α∨⟩=0 | pass (r8) |
| S3.2 dual weight | B− acting on ev_e | (b·ev_e)(f)=f(b)=λ(b)⁻¹f(e): weight −λ; X(e) dual weight −1 for SL₂ λ=1 | pass (r8) |
| S3.3 D_i strings | m=0,−1,−2 | e^λ; 0; −e^{λ+α} (augmentations 1,0,−1) | pass (r8) |
| S3.3 Δ_i=ιD_iι | m≤0, m=1, m≥2 | Σ_{j=0}^{−m}e^{λ+jα}; 0; −Σ_{j=1}^{m−1}e^{λ−jα}; (1−e^α)Δ_i(p)=p−e^αs_ip; s_iN=−e^{−α}N | pass (r8) |
| S3.6 word 121 | χ₀=e^{(0,5,7)} | augmentations 1,6,33,81; χ₁,χ₂ multiplicity-free | pass (r8) |
| S3.6 coefficient formula | 46 weights | 1+min{2,a,b,c,7−a,7−b,7−c}=χ₃ coefficientwise; histogram 21/15/10; (4,4,4)↦3; (9,3,0): χ₃=0, formula −1 | pass (r8) |
| S3.6 word 212 | ψ₁..ψ₃ | 1,3,21,81; ψ₃=χ₃; Δ₁χ₃=Δ₂χ₃=χ₃; S₃-invariant | pass (r8) |
| S3.6 Gelfand–Tsetlin | 7≥u≥5≥v≥0, u≥w≥v | 81 patterns, multiplicities equal χ₃ coefficientwise | pass (r8) |
| S3.4 longest word | D₁D₂D₁e^{(7,5,0)} (native convention) | equals χ₃ | pass (r8) |
| S4.1 shift obstruction | φ(1/2)=1/4, χ=(1,1) | (1/4,0)+(1/2,1/2)=(3/4,1/2): x−2y=−1/4; canonical (1,1/2): 0 | pass (r8) |
| S4.2 lowering | SL₂ shape 2 | straight→(s₁,1;0,1/2,1), endpoint 0→(s₁;0,1), endpoint −2; cut times per Prop 4.7(a) | pass (r8) |
| S4.2 central path | GL₂ (t,t) | height ⟨(t,t),α∨⟩=0; strings 0 | pass (r8) |
| S4.3 connectedness route | τ₀≠e | τ₀λ not dominant ⇒ some ⟨τ₀λ,α_i∨⟩<0 ⇒ min H_i<0 ⇒ e_i defined; top of string has first direction s_iτ₀<τ₀ | pass (r8) |
| S4.3 bond 2 | a=1/2, 1/3 | 2·(1/2)=1; 2·(1/3)=2/3; three encodings; break 1/3 would add two: five | pass (r8) |
| S4.3 bond sign vs CFL | x>y=s_βx | README −⟨xλ,β∨⟩=⟨yλ,β∨⟩; CFL ⟨σλ,β∨⟩ with σ smaller: agree | pass (r8) |
| S4.3 transport laws | T(λ,χ;σ) | composite B(λ)^{σ+χ+ψ}→B(λ+χ+ψ)^σ types match T(λ,χ+ψ;σ); inverse T(λ+χ,−χ;σ+χ) | pass (r8) |
| S4.4 PGL₂ | X=ℤα, λ=α | Δ·char=(1−e^{−α})(e^α+1+e^{−α})=e^α−e^{−2α}; J(e^α)=e^α−e^{s(α+ρ)−ρ}=e^α−e^{−2α}; e^{α/2}∉ℤ[ℤα] | pass (r8) |
| S4.4 SL₂ | X=ℤω, λ=ω | (1−e^{−2ω})(e^ω+e^{−ω})=e^ω−e^{−3ω}=J(e^ω); ×e^ω: e^{2ω}−e^{−2ω} | pass (r8) |
| S4.4 λ=0 | nonempty W | J(1)=Δ ⇒ char B(0)=1; Σ sgn(w)=0 would give 0; PGL₂ unshifted at α: e^α−e^{−α}≠e^α−e^{−2α} | pass (r8) |
| S4.4 ρ−wρ | w=s_i | ρ−s_iρ=α_i=Σ_{β>0,s_iβ<0}β | pass (r8) |
| S4.4 domain step | ℤ[X], X free | Laurent polynomial ring, Δ≠0: Δ·char=Δ·D_{w₀}(e^λ) ⇒ char=D_{w₀}(e^λ) | pass (r8) |
| S4.4 adjoint | sl₃ matrix units | [E₁₂,E₂₁]=H₁; [E₁₃,E₃₁]=H₁+H₂; [E₁₂,H₁]=−2E₁₂, [E₁₂,H₂]=E₁₂; determinants of (H₁),(H₂),(H₁+H₂) in basis (H₁,H₂): 1,1,−1 | pass (r8) |
| S5.1 trace | char 2, k[x] | Tr(1)=0, Tr(x)=1, Tr(x³)=x; σ=Tr(x·): σ(1)=1, σ(x²)=x vs x²; n=0: c^{1/p} | pass (r8) |
| S5.2 ideals | σ=Tr(x·) | σ(x·x^a)=x^{(a+1)/2}∈(x) for odd a, 0 otherwise; σ(x²)=x∉(x²) | pass (r8) |
| S5.3 kernel | SL₂→PGL₂, char 2 | μ₂=k[u]/(u²−1)=k[u]/((u−1)²), nonreduced | pass (r8) |
| S5.5 mixed union | ℙ¹, Y={0,∞}, λ=0 | H⁰(O_Y)=k², diagonal k→k², H¹(I_Y)=H¹(O(−2))=k | pass (r8) |
| S5.7 Q=ii | L=O(−2) | source ℙ¹-bundle over ℙ¹; H⁰=0, H¹=k both sides | pass (r8) |
| S6.4 SL₂ | degree 2 | three products x²,xy,y² vs 4; at [1:0] only x² survives | pass (r8) |
| S7.1 covers | GL₃, ω₁, w=s₁s₂ | v=s₁: β=α₂, ⟨ω₁,α₂∨⟩=0, both weights ε₂; v=s₂: s₁s₂s₁s₂s₁=s₂, β=α₁+α₂, coefficient 1, cover ε₂>ε₁ | pass (r8) |
| S7.1 non-cover | w=s₂s₁ | v=s₂: β=α₁, coefficient 1, ε₃>ε₁ through ε₂; v=s₁: β=α₁+α₂, wβ=−α₂, γ=α₂, bond −⟨ε₃,α₂∨⟩=1 | pass (r8) |
| S7.1 bond sign | v=ws_β<w | wβ<0, γ=−wβ>0, −⟨wλ,γ∨⟩=⟨λ,β∨⟩ | pass (r8) |
| S7.1 ρ | w=s₁s₂, λ=ρ | 1 on X(s₁), 2 on X(s₂) | pass (r8) |
| S7.2 cone | Gr(2,4), X_(1) | p₃₄=0 and p₁₃p₂₄=p₁₄p₂₃ in ℙ⁴, vertex p₁₂; p₂₄=0 ⇒ p₁₄p₂₃=0: X_(2) (p₂₃=p₂₄=p₃₄=0) ∪ X_(1,1) (p₁₄=p₂₄=p₃₄=0); λ=(1,0), dim 3; X_(2,1) pivots (1,3), λ=(2,1), dim 1 | pass (r8) |
| S8.1 classes | ℙ¹; Gr(2,4) | [O_e]=[O]−[O(−1)], rank 0, χ=1; six cells, rank 6 | pass (r8) |
| S8.2 | SL₂, t=[O(−1)] | (1−t)²=0 ⇒ t(2−t)=1, [O(1)]=2−t | pass (r8) |
| S8.3 | SL₂, z | 1⊗z: z at e, z⁻¹ at s; z⊗1: z,z; P=G: R(T) | pass (r8) |
| S8.4 | PGL₂, u=[O(1)]−1 | [O(2)]=(1+u)²=1+2u; image ℤ+2ℤu misses u; over ℚ u=([O(2)]−1)/2 | pass (r8) |
| S8.5 | ℙ¹ | χ(O)=1, χ(O(−1))=0, χ(O(−2))=−1 | pass (r8) |
| S9.0 base change | ℙ¹ over ℂ[t], class t | RΓ(E)=[A→A] by t; H⁰=0, H¹=A/t; at t=0 H⁰=ℂ | pass (r8) |
| S9.0 dual numbers | Spec ℂ[ε]/(ε²) | H⁰ basis 1,ε both sides; R¹π_*O(−2)=O over ℂ[s] | pass (r8) |
| S9.5 | GL₂ (t,0) | height t; f: s_α(t,0)=(0,t), endpoint (0,1); +(1,1): (2t,t), endpoint (2,1) | pass (r8) |
| S9.6 | SU₂; SU₃; torus | S²/antipodal=ℝP²: H⁰=ℤ, H¹=0, H²=ℤ/2; χ=2/2=1, 6/6=1; point | pass (r8) |
| S9.7 Kähler form | J_flag=sign(α(p))J_α | ω(v,J_flag w)=sign(α(p))B(J_αv,J_αw)/α(p)=B(v,w)/|α(p)|>0 | pass (r8) |
| S9.7 gradient | g=ω(·,J·) | g(JX_O,w)=ω(X_O,w)=df_X(w) ⇒ grad f_X=JX_O; indices 2ℓ(w) negative chamber, dim−2ℓ(w) positive (R2a item 3) | pass (r8) |
| S9.7 ℙ¹ | regular; central X | indices 0,2: 1+q², χ=2; constant height, critical set ℙ¹ | pass (r8) |
| S9.8 | SL₂/B−; torus | O(1), degree +1; characters 0,1 one ordinary line | pass (r8) |
| Worked: incidence flag | v=(a,b,c), ω | v∧ω=(ax+by+cz)e₁₂₃; trace of u↦v⊗(u∧ω) is v∧ω; dim sl₃⊗det=8, weights (2,1,0) and dual (0,−1,−2) | pass (r8) |
| Worked: blowup 121 | V=k³, P₀ | fibre over (L,P) with P≠P₀ is the point P∩P₀, over P=P₀ a ℙ¹; C=ℙ(P₀) codim 2; N=T_{P₀}B⊗O_C rank 2 trivial; E=ℙ¹×ℙ¹; charts v=ur, u=vs, rs=1 | pass (r8) |
| Worked: fixed plane | n=4, k₀=2 | d∈{0,1,2}: 3=min(2,2)+1; Z₀=Gr (no 3-minors) | pass (r8) |
| Contract: tie rule | native `lower_mul` | lowering on p iff ε(q)<φ(p), on q when φ(p)≤ε(q): as line 1045 | agree (r8) |
| Contract: Demazure longest | native `:135` | Δ·D_{w₀}f=Σ sgn(w)e^{−(ρ−wρ)}w(f): as lines 161–171 | agree (r8) |
| S4.7 bullet 1, index test | GL₃, λ=e₁, κ=−e₃, W_κ=⟨s₁⟩; w=e,s₁,s₂,s₁s₂,s₂s₁,w₀ | θ(w)=e,s₂,s₁,s₂s₁,s₁s₂,w₀; min rep of θ(w)W_κ: e,s₂,e,s₂,s₁s₂,s₁s₂; directions τ₀≤ that: {e},{e,s₂},{e},{e,s₂},{e,s₂,s₁s₂},{all}: 1,2,1,2,3,3 sections. Geometry: image of w in W/W_λ=W/⟨s₂⟩ is e,s₁,e,s₁,s₂s₁,s₂s₁, so X(w)→point,ℙ¹,point,ℙ¹,ℙ²,ℙ² and H⁰(O(1)) has dimension 1,2,1,2,3,3 | pass |
| S4.7 bullet 1, equivalence in W vs W/W_κ | τ₀=s₂, u=s₁s₂ (min rep s₁s₂): s₂≤s₁s₂ both ways; τ₀=s₁s₂, u=s₂s₁ (min rep s₂): s₁s₂≰s₂s₁ in W (length 2 both, distinct) and s₁s₂≰s₂ | both directions agree | pass |
| S4.7 bullet 2, weights | w=s₁: surviving e,s₂ with endpoints −e₃,−e₂; weights −w₀(−e₃)=e₁, −w₀(−e₂)=e₂ | X(s₁)=α₁-curve, L(e₁) of degree ⟨e₁,α₁∨⟩=1, section weights λ, s₁λ=e₁,e₂ | pass |
| S4.7 bullet 2, w₀ | weights −w₀π(1), π(1)∈{−e₃,−e₂,−e₁} | e₁,e₂,e₃ = weights of ∇(e₁)=k³; −w₀(−wt V(λ))=w₀ wt V(λ)=wt V(λ) by W-stability | pass |
| S4.7 bullet 3, partial flags | λ=e₁, P with W_P=⟨s₂⟩=W_λ; coset s₂⟨s₂⟩={e,s₂} | θ(e)W_κ=θ(s₂)W_κ=⟨s₁⟩=W_κ, same min rep e; θ(W_P)=⟨s₁⟩=W_κ ✓ | pass |
| S4.7 bullet 3, descent condition | λ=ρ=(2,1,0), P with W_P=⟨s₂⟩ | ⟨ρ,α₂∨⟩=1≠0: W_P⊄W_λ={e}, λ does not descend; the bullet's hypothesis excludes it | pass |
| S4.7 Check 1 | w=e; general λ and GL₃ λ=e₁ | τ₀≤e ⇒ τ₀=e, single direction (LS directions strictly decrease); weight −w₀κ=λ ✓. Wrong models: drop sign w₀κ=−λ (=−e₁); drop w₀: −κ=w₀λ (=e₃), not κ (=−e₃); drop both: κ | correct computation; negative control misnamed: R02 |
| S4.7 Check 2 | w=w₀, GL₃ λ=e₁ | all three encodings; weights e₁,e₂,e₃ (as bullet 2 row) | pass |
| S4.7 Check 3 | GL₃, λ=e₁, w=s₂ | κ=−e₃=ω₂−det ✓; θ(s₂)=(13)(23)(13)=(12)=s₁ ✓; W_κ=⟨s₁⟩ ✓; min reps of W/⟨s₁⟩: e,s₂,s₁s₂ (no right descent s₁) ✓; minuscule κ: ⟨τκ,β∨⟩∈{0,±1} so no break, all three straight ✓; endpoints −e₃,−e₂,−e₁ ✓; s₁W_κ=W_κ min rep e ⇒ one section of weight e₁ ✓; degree ⟨e₁,α₂∨⟩=0 ✓; untransported s₂ admits e,s₂: 2 ✗ as claimed; W_λ=⟨s₂⟩ ✓ | pass |
| S4.7 degenerate | λ=0; rank 0 | κ=0, W_κ=W, one encoding, weight 0 for every w; rank 0: w₀=e, κ=−λ, weight −κ=λ for the single point | pass |

**Cross-roadmap and ownership facts** are unchanged from the previous review (consumers KacMoody, QuantumEnvelopingAlgebras, CharacteristicClasses, FlagVarieties; GeometricQuantization, TensorProductCombinatorics and SpringerResolution at their open heads; ShimuraData and ComplexComparisonPartII as later restaters). `scratch/overlaps.md` at this head: no open pull request changes this roadmap, no dropped id in either direction. The changed passage cites no roadmap other than ReductiveGroups (opposition and contravariant duality, in its *Needs:* line, already resolved at Layers 7–10 on main in the previous review).

## Not verifiable

- Steinberg1975, Pittie1972, Jantzen and MehtaRamanathan1985 are uncertified and cited by locator only; no text read.
- LLM Proposition 14 (line 810): the OCR reads the condition as “w>τ₁”; the README's “initial direction at most w” is the mathematically forced reading (the extremal chain must index v_{wλ}∈V_λ(w)). I could not tell OCR loss from print.
- LLM printed pages: read in the author copy; the +292 page map is self-consistent, not compared with the journal typesetting.
- The seeded-sample targets outside S4.7 fall in text the diff leaves untouched; their locators were read in the previous review and not re-read this round.

## Source issues

- none

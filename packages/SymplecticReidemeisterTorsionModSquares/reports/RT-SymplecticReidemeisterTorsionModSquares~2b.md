<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1576#issuecomment-6400722026 -->
Red team round 2 pass b (claude) of 53d8650

Verdict: needs_changes

1. **F01** (P3) Three Needs lines cite "AlgebraicTopology Stages 6.1–6.4.1", an item that does not exist

   **Location.** `packages/SymplecticReidemeisterTorsionModSquares/README.md:499` (§2.2), `:513` (§2.3), `:854` (§4.7): "AlgebraicTopology Stages 6.1–6.4.1".

   **Claim.** Stage 6 of AlgebraicTopology has a sub-item 6.4.1.

   **Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` on main, Stage 6 (line 946) has items 0–5 only (lines 954, 1011, 1056, 1180, 1515, 1560); `grep -n '6\.4\.1'` returns nothing. The supplier contract at line 55 and the Layer 0 and Layer 2 "Dependencies" paragraphs correctly say "Stages 6.1–6.4".

   **Repair.** In the three lines replace "AlgebraicTopology Stages 6.1–6.4.1" by "AlgebraicTopology Stages 6.1–6.4". Tested: after the edit every AlgebraicTopology citation in the README is one of Stage 2, Stage 4, Stage 5, Stages 6.1–6.4, Stage 6.4, Stages 4 and 6, all present on main.

2. **F02** (P2) AlgebraicTopology Stage 5 is cited for a local-coefficient Wang sequence it does not state

   **Location.** `README.md:55`: "Stage 5: the Wang cone for a mapping torus with a chosen coefficient intertwiner"; `README.md:833` (§4.6 `*Needs:*` "AlgebraicTopology Stage 5"); the route at `:825` ("The Wang sequence gives H⁰(M_f)=0 and H¹(M_f)=ker(1−T)") and `:1179` (§7.6, "The Wang sequence gives χ₁/₂(M_f)=−h").

   **Claim.** The supplier provides the Wang triangle for H*(M_f;ρ_f) where ρ_f is the local system glued from a symplectic intertwiner f*ρ≃ρ, with endomorphism 1−T on H*(Σ;ρ).

   **Witness.** AlgebraicTopology main, Stage 5 item 2 (lines 868–869): "Derive the Wang long exact sequence for a mapping torus from a mapping-cone model. Identify its endomorphism as `id - f_*`, and prove naturality under commuting squares of monodromies." Stage 5 is built on singular chains with ring coefficients; no local system, twisted cochains or intertwiner appears in items 2–7 (the only Stage 5 lines mentioning local coefficients are 857, 896–904 and 911–926, about products, Cartan–Leray and Serre). The twisted statement §§4.6 and 7.6 consume (H⁰(M_f;ρ_f)=ker(1−T|H⁰), H¹(M_f;ρ_f)=ker(1−T|H¹) when H⁰(Σ;ρ)=0) is not what the cited item says.

   **Repair.** The input is derivable inside the package from Stage 6.1 (local-coefficient cochains with "the Mayer–Vietoris sequence of a binary open cover", line 1030). Line 55: replace "Stage 5: the Wang cone for a mapping torus with a chosen coefficient intertwiner and integral finite-cover transfer with inclusion after transfer equal to subgroup index." by "Stage 5: the constant-coefficient Wang cone of a mapping torus and integral finite-cover transfer with inclusion after transfer equal to subgroup index. Section 4.6 derives the local-coefficient Wang triangle for (M_f,ρ_f) from Stage 6.1's binary Mayer–Vietoris sequence." In §4.6's route replace "Use the two-cylinder Mayer–Vietoris model or the Wang triangle C*(M_f)→V[−1]→(1−T)V[−1]." by "Cover M_f by two cylinders over Σ whose intersection is two copies of Σ; Stage 6.1's Mayer–Vietoris sequence with coefficients ρ_f, with the intertwiner identifying the second restriction with T, gives the Wang triangle C*(M_f;ρ_f)→C*(Σ;ρ)→(1−T)C*(Σ;ρ) as a local statement." Replace `*Needs:* §4.5; §4.4; AlgebraicTopology Stage 5; §2.2.` by `*Needs:* §4.5; §4.4; AlgebraicTopology Stage 6.1; §2.2.` and drop "AlgebraicTopology Stage 5" from the Layer 4 "Dependencies" line (§7.2 keeps Stage 5 for the transfer). Tested on the Gaussian system: the two-cylinder sequence gives H⁰(M_f;ρ_f)=ker(1−T|H⁰)=0 and H¹(M_f;ρ_f)=ker(1−T|H¹)=0 for characteristic polynomial x⁴+1, and h=4 for T=1, as §4.6's Checks state.

Round 2. Files reviewed in full: `packages/SymplecticReidemeisterTorsionModSquares/README.md` (1251 lines, 60 numbered targets), `packages/SymplecticReidemeisterTorsionModSquares/Suggested.lean` (57 lines, one declaration), `design/plan.json` (gaps), `metadata.toml`, `sources.toml`. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aa`, read from the local pinned copies. No Lean command, build, git write or post was run; the worker's elaborated signature file was used for the one declaration.

## Earlier findings at this head

| id | status | witness at 53d8650 |
|---|---|---|
| r1a F01 (P1) Lagrangian versus Darboux volume | repaired | §2.1 API bullet: "the vector-space Lagrangian volume is (−1)^r times the ordered Darboux volume, so their square classes differ by [(−1)^r]"; §1.8 Check 3 "both give ν_L=−e∧f"; §2.1 `*Needs:*` now lists §1.8. Recomputed: L=ℚe gives q(f)=−e*, ν_L=−e∧f; L=ℚf gives q(e)=f*, ν_L=f∧e=−e∧f; rank 2r gives (−1)^r·(−1)^{r(r−1)/2}·(−1)^{r(r−1)/2}=(−1)^r. No new error: the §2.4 fibre scalar (−1)^d is unchanged by rescaling ν by (−1)^d (ν′=(−1)^dν ↦ ν^{−1}=(−1)^dν′^{−1}). |
| r1a F02 (P2) projective fibres as group labels | repaired | Conventions line 24: "Its manifold labels use local systems with a fibre identified with the standard free symplectic module R²ʳ; arbitrary finite-projective families use §3.5"; §3.7: "For ρ on M equipped with a symplectic identification of its fibre with R²ʳ". New §3.5 Check 4 verified: n·n=1 gives R³=P⊕Rn, (n×)²=−1 on P, the dot product is nondegenerate on n^⊥ over every residue field, so ω is perfect; a frame would trivialise TS². |
| r1a F03 (P1) smooth realisation of the twists | settled (`not actionable in this package`, reason correct) | `gap:marked-surface-twists` is slug 2 of 14 in `plan.json` and README line 67; §4.8 states the realisation target and three relator Checks; its `*Needs:*` lists GeometricTopology Layer 3 and the gap. Recomputed T₃(R)=a₂⁻¹b₁a₁⁻¹b₁⁻¹a₂b₂a₂⁻¹b₂⁻¹a₁a₂=(a₂⁻¹a₁⁻¹)R(a₁a₂). Not re-raised. |
| r1a F04 (P3) §2.7 boundary Check | repaired | §2.7 Check 2: "C=K² concentrated in degree zero with the zero skew-symmetric dimension-four pairing and j=1 ... K² in degrees −1 and 4". Recomputed: (C∨[−4])^q≠0 only at q=4, C^{q+1}≠0 only at q=−1; χ(C)=2, χ½(D)=(−1)^{−1}·2=−2, r≡0. |
| r1a F05 (P3) cochain supplier stage | repaired | Line 55: "Stage 6.1: local-system cellular cochains and their singular comparison. Section 4.7 derives its presentation-specific crossed-homomorphism description from that cellular model." AlgebraicTopology on main, Stage 6 item 1 (lines 1011–1030) constructs cellular cochains with local coefficients and the relative cellular-to-singular comparison. |
| r1b F01 (P1) nonexistent consumer roadmap | repaired (differently) | Line 15: "The arithmetic application to central values of symplectic L-functions modulo squares and Hurwitz/PEL geometry is outside this roadmap's ownership." "Downstream consumers" names no roadmap. `grep` finds the old name in neither README nor Suggested.lean; it survives only in the frozen `design/README.md`, which the package stage does not edit. |
| r1b F02 (P2) compound gaps | repaired | `plan.json` `gaps` has 14 entries whose slug, supplier, section and `needs` sentence equal the 14 README contracts (lines 59–129); §7.1 Needs cites the three arithmetic-scheme slugs, §5.4 the rank and reduction slugs, §8.1 `real-chern-bockstein`, §8.2 `real-chern-bockstein-compatibility`. Nothing outside `gaps` changed in `plan.json`. |
| r1b F03 (P3) §6.3 auxiliary prime | repaired | §6.3 route: "Choose r>N in the unit class 1+h modulo 2h using `Nat.forall_exists_prime_gt_and_eq_mod` ... Chebotarev §7.2 gives irreducibility"; Mathlib pin `NumberTheory/LSeries/PrimesInAP.lean:442` has `(ha : IsUnit a) (n : ℕ) : ∃ p > n, p.Prime ∧ (p : ZMod q) = a`; Chebotarev main 7.2 at line 265. |
| r1b F04 (P3) Stage 6.3 versus 6.4 | repaired, with one new slip (S01) | Line 55: "Stage 6.4: Poincaré–Lefschetz duality, including `compactTriadPoincareLefschetz`"; `plan.json` gap section "Stage 6.4"; AlgebraicTopology main line 1534 owns that name. Three `*Needs:*` lines now say "Stages 6.1–6.4.1", an item that does not exist (S01). |
| r1b F05 (P3) page-break locators | repaired | AV-v1 3415 (B.4.1), 3427 ((B.13)), 3498 (B.4.2), 3513 ((B.15)), 3526 (B.4.3), 3565 (B.5), 3583 ((B.18)), 3588 ((B.19)), 3653 (B.6), 3675 ((B.20)), 3840 ((B.30)), 3854 ((B.31)), 94 ((1.5)), 509 (even-dimensional volume form), 3766 (smooth triangulation), 3770 (e_X), JRV 855 (Lemma 6.1): each line begins the cited statement. |

## Verified sound

**Lean declaration (1 read), against the pins by grep.** `zassenhaus_primary_formula`: every binder it needs is in its own signature (`Field K`, `Invertible (2:K)`, `AddCommGroup V`, `Module K V`, `FiniteDimensional K V`, `Q`, `hQ : Q.Nondegenerate`, `A : orthogonalGroup Q`); the worker's elaborated type shows none dropped. Carriers at the pins: `TauCeti.QuadraticMap.orthogonalGroup Q : Subgroup (V ≃ₗ[K] V)` (`OrthogonalGroup/Basic.lean:180`), `CliffordAlgebra.orthogonalSpinorNorm Q hQ : orthogonalGroup Q →* Multiplicative (SquareClassGroup K)` under exactly the file's variables `[Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V] [Invertible (2 : K)]` (`SpinorNorm/Basic.lean:64, :96`), reflection value `squareClassHom (unitOfInvertible (Q v))` (`:121`), `TauCeti.squareClassHom : Kˣ →* Multiplicative (SquareClassGroup K)` (`SquareClassGroup/Basic.lean:73`), `QuadraticMap.Nondegenerate` = radical zero plus polar-radical rank ≤ 1 (`QuadraticForm/Radical.lean:115`; with 2 invertible the polar form is nondegenerate, `:125`), `QuadraticMap.associated` (`QuadraticForm/Basic.lean:962`) with `associated_eq_self_apply` giving B(v,v)=Q(v) (`:909`), `LinearMap.restrict` (`Submodule/LinearMap.lean:209`), `LinearMap.det` (`Determinant.lean:173`). The statement is JRV (5.1) (JRV lines 799–803): sn(γ)=det(M(−1,γ),Ψ)·det((γ+1)/2 on the stable image), with Ψ=B since the pinned reflection norm is [Q(v)]=[B(v,v)]. Instances recomputed (D = Gram det of B on V₋ times det((1+A)/2 on U); spinor norm by reflections):

| instance | V₋, U | D | spinor norm | result |
|---|---|---|---|---|
| V=0 | 0,0 | 1 | 1 | ok |
| B=(2), A=−1 | V,0 | 2 | [Q(v)]=[2] | ok; B=(3) gives [3] |
| B=I₂, rotation by 90° | 0,V | det(1+A)/4=2/4 | reflections Q=1,2: [2] | ok |
| B=diag(1,2,1,2), A=diag(1,1,−1,−1) | ⟨e₃,e₄⟩, ⟨e₁,e₂⟩ | 2·1 | [Q(e₃)Q(e₄)]=[2] | ok |
| H⊕H over 𝔽₃, A=diag(U,U^{−T}) unipotent | 0,V | 1·1/16=1 | 1 | ok |
| hyperbolic plane, A=−1 | V,0 | −1 | [2·(−2)]=[−1] | ok |

Nonvanishing: V₋ is nondegenerate (JRV line 796), and A+1 is an automorphism of the stable image, so `D ≠ 0` is a proved assertion, not an assumption. The basis `b` changes the Gram determinant by a square; `hU` is a proposition that is true. The one-tactic probe finds no library lemma identifying the spinor norm with this product; no padding. Headlines: the module docstring names every other headline (§§2.8, 3.2, 3.5, 4.4, 4.6, 4.8, 5.1–7.3, 7.4–7.6, 8.1–8.2) with its missing carrier; none is statable at the pins (no cellular cochains with local coefficients on smooth manifolds, no signed Poincaré-complex carrier, no oriented bordism, no étale Chern class of a discrete-group representation); nothing is forced through a stand-in. Imports: `import Mathlib` and one existing Tau Ceti module. No `lemma`, `set_option`, `#eval`, `True` placeholder, process word or pull-request number in the package (grep; the word "lemma" occurs only in the mathematical names "transfer lemma").

**Targets read: 60 of 60; values computed.**

| statement | instances tried | values on each side | result |
|---|---|---|---|
| Conventions, dual differential and shift | K —2→ K degrees 0,1 | shifted differential −2; dual-shift coefficients +1, −1; chain equation (−1)·2=−2·1 | consistent |
| §0.3 boundary pairing, displayed formula | n=0, ε=+1, C=K⁰⊕K¹ with d=c, T₀₀=t | symmetry: ε(−1)^{pq}T((β,y),(α,x))=(−1)^qα(y)+ε(−1)^{pq+p}β(x) identically; closedness T(du,v)−T(u,dv)=(cay+txy+bcx)−(acy+cbx+txy)=0; cross matrix [[0,1],[−1,0]] | formula is ε-symmetric, closed and strict independently of f |
| §0.6 parity | C⁰=C¹=K², cross I₂, d=J; 𝔽₂ model d=1 | T(dx,y)=−T(dy,x), radical ker d⁰, rank d⁰=2 even; Σ_{q≤0}(−1)^q(dim C^q−dim H^q)=rank d⁰ by telescoping; over 𝔽₂: χ≤0=0, term rank 1 | theorem and negative control correct |
| §0.7 splitting | K in degrees 0,1 paired, d=0 | Q=K[0], E=0; degrees of Q∨[−1] are ≥1 since H^q(Q∨[−1])=H^{1−q}(Q)* | consistent |
| §1.3 reverse wedge | n=0..4 | n(n−1)/2=0,0,1,3,6; signs +,+,−,−,+ | matches |
| §1.5 truncation quotient | r=1 | σ≥0C/σ≥1C=C⁰ in degree 0=C⁰[1−1] | matches |
| §1.8 and §2.1 Lagrangian volumes | r=1 both coordinate lines; general r | −e∧f both; (−1)^r·((−1)^{r(r−1)/2})²=(−1)^r | matches the repaired bullets |
| §2.4 fibre duality scalar | d=1; d=2 | e∧f ↦ f*∧(−e*)=e*∧f* ↔ −(e∧f)^{−1}; d=2: reversal of 4 dual vectors, sign (−1)^{6}=+1; general (−1)^{d(2d−1)}=(−1)^d | matches (−1)^{dχ} on a point |
| §2.5 torsion of S³, constant K² | minimal cell structure, d=0 | e=ν₀⊗ν₃^{−1}; L=H³; quotient H⁰≅(H³)∨ by e↦f*, f↦−e*; e*∧f* ↔ −ν^{−1}; e=−ν_L | RT=[−1], N=[(−1)^{2/2}]·[−1]=1; matches AV Theorem 2.2 |
| §2.5 disjoint-union sign versus §4.4 | two circles with A=diag(1,−1) on I₂, χ½=1 each | §2.5 predicts RT(S¹⊔S¹)=RT²·[(−1)^{1·1}]=[−1]; §4.4 on diag(1,1,−1,−1)⊂SO(I₄): h=2, θ=disc⟨e₃,e₄⟩·det(1)=1, RT=[(−1)^{1}]=[−1] | the two sections agree on an odd-semicharacteristic instance |
| §2.6 orientation reversal | circle, A=1 on I₂; 3-manifold | negating the pairing scales ν_{H^{>m}} by (−1)^{Σ_{q>m}dim H^q}=(−1)^{χ½} | matches the exponent |
| §2.7 (B.23) | C=0; C=K² in degree 0 with zero pairing | r=0; χ=2, χ½(D)=−2, r≡0 | matches Checks 1–2 |
| §2.8 | ∂D⁴ rank 2; rank 4 | χ½=2, RT=[−1], N=1; rank 4: reversal sign (−1)^{2·3}=+1, RT=1, χ½=4 | matches Checks 1 and 3 |
| §3.1 bordism | AHSS total degree 3 | E²_{3,0}=H₃, E²_{2,1}=E²_{1,2}=E²_{0,3}=0 (Ω₁=Ω₂=Ω₃=0 at TB B3.1), no differentials into or out of (3,0) | iso for d≤3; d=4 sees Ω₄=ℤ |
| §3.2 restriction multiplier | q=3; q=5 | K₃(𝔽_q)=ℤ/(q²−1)→ℤ/(q⁴−1), 1↦q²+1: 10, 26 ≡ 0 mod 2 | parity homomorphism vanishes on 𝔽_q |
| §3.5 half-sign algebra | s even, s−h=2r | (−1)^{s/2+r}=(−1)^{s−h/2}=(−1)^{h/2}; h=χ≤0(C[1])=−χ½(C) | field-fibre formula holds |
| §3.7 bordism invariance | M=∂N over R normal | N_R(M)∈H¹(R,μ₂)↪H¹(Frac R,μ₂) (gap), generic value 1 by §2.8; reversal N(−M)=N(M); disjoint union sign (−1)^{χ½χ½′}=1 | homomorphism well defined on Ω₃=H₃ |
| §4.3 sign budget | n−h=2r | h/2+n/2+r=n even | sign 1 |
| §4.3 evenness of h | A∈SO, 1+A invertible, n even | P(x,(1−A)y)=B((A−A⁻¹)x/2,y) alternating with radical ker(1−A): n−h even | h even without a discriminant hypothesis |
| §4.4 | 𝔽₃, H⊕H, A=diag(U,U^{−T}) | A^TBA=B, det A=1, h=2, det(1+A)=4·4≡1, D=1, θ=1, RT=[−1] nonsquare in 𝔽₃; disc B=1 | matches Check 2 |
| §4.4 second formula | diag(1,1,−1,−1) on diag(1,2,1,2) | disc(V₊)=[2], det(1−A|V₊⊥)=4: [2]; Lean formula [2]·1 | the two formulas agree |
| §4.6 Check 3 | fixed space of diag(U,U^{−T}) | ⟨e₁,e₄⟩, B(e₁,e₄)=B(e₁,e₁)=B(e₄,e₄)=0 | determinant 0 as stated |
| §4.7 relator coefficient | expand φ(a₁b₁a₁⁻¹b₁⁻¹a₂b₂a₂⁻¹b₂⁻¹) | coefficient of φ(a₁): 1−ρ(a₁b₁)ρ(a₁)⁻¹=1−ρ(a₁b₁a₁⁻¹); T̃φ_v=φ_{M⁻¹v} | matches |
| §4.8 first system | t=T₁∘T₃∘T₂∘T₄∘T₄ on all four generators | t(a₁)=a₂⁻¹b₁a₁⁻¹ ↦ diag(i,−i)=Mρ(a₁)M⁻¹; t(b₁)=a₁⁻¹a₂⁻¹b₁a₁⁻¹ ↦ −I; t(a₂)=a₂; t(b₂)=a₂⁻¹a₁⁻¹b₂a₂⁻² ↦ ½[[−1+i,−1+i],[1+i,−1−i]]=Mb₂M⁻¹; det(1−M⁻¹)=2; 2=(1−i)²i; (a+bi)²=i forces 2a²=±1 | all four intertwining equations hold; [2]=[i]≠1 |
| §5.3 | a=c_et(x), b=N(x) | a_y=0 ⇒ x_y=0 ⇒ b_y=0; b∉span(a) ⇒ pattern (0,1) occurs (gap); k₀ good ⇒ b_{k₀}=a_{k₀}≠0 ⇒ b=a ⇒ b_{k₁}=a_{k₁}≠0 ⇒ k₁ good | iff holds |
| §5.8 orbit criterion | G=D₄, H=⟨s,r²⟩, S_M={s} | G-closure {s,r²s} meets H in {s,r²s}⊋S_M; but every class in the closure meets S_M itself, so a degree-one place with Frobenius in S_M exists | the "iff" survives; the route's phrase "meets Gal(E/M)" should read "meets S_M" (note, not a finding) |
| §6.3 | h=4, r=5,13,17 | (r−1)/h=1,3,4; −1 lies in the order-m subgroup of (ℤ/r)ˣ iff m even: no, no, yes | matches Checks |
| §6.4 | δ=1/2; δ=1/4; general | least even h with 2^{−h/4}≤δ/2: 8, 12; minimality gives h<6+4log₂(1/δ)≤8/δ² for δ≤1/2; N≥h/2 ⇒ 2^{−N}≤δ/2; gain ≥δ/(2h)≥δ³/16 | recurrence correct |
| §6.5 | ℚ(i)/ℚ, S={id} | δ=1/2; α=−1 nonsquare in every L disjoint from ℚ(i); (L(i)/L,{id}) controlling by §5.8 descent | route closes |
| §7.1 | d=2, Spec ℤ[1/2,t] | Σ_{p≤Q}p log p ~Q²/2; bad weight ≤CQ^{d−1}·o(Q)+O(Q^{d−1/2}(log Q)²)=o(Q^d) | matches |
| §7.2 | Sp₂(𝔽₃) | order 24, Sylow 8, index 3≡1; obstruction in H²(Q;sp(k)) vanishes since 8 is a unit | lift exists |
| §8.1, §8.2 | C₂ | β(t)=t²≠0, β(t²)=0; (3,2)-component of β(c₂)=0 gives β_G c₂₂=(1⊗β_et)c₃₁ over 𝔽₂ | vanishing follows from the two gaps |

**Checks tested: 41** with the values above; the remaining Checks were read against their section's formulas; none found false, vacuous or a restatement; every definition has at least three.

**Locators verified: 77 distinct line locators** (AV-v1 74, JRV 2, Thom 1), each read in the cached text; each begins or lies inside the cited statement (list in the table above for the relocated ones; the others were checked at their printed line). Statements restated in the README checked against the text: Theorem 2.1 (422), Theorem 2.2 (605), Lemmas 2.9.1–2.12.3 (767–992), §§2.13–2.16 (1096–1152), A.3 (2963–2983, symmetry (A.6) and the ε(−1)^{pq} adjoint remark), A.5 (3015–3043), A.6–A.7 (3047–3107), B.1–B.6 (3181–3675), B.7–B.7.1 (3751–3783), B.9.1 (3840–3854), C.1–C.4 (4053–4246), JRV Theorem 5.1 and (5.1) (782–810), Thom Théorème IV.13 (2527).

**Sibling and supplier citations checked: 12 roadmaps, 33 section citations**, each present where cited: AlgebraicTopology main (Stages 2, 4, 5 items 2–3, 6 items 1–4, `compactTriadPoincareLefschetz` line 1534; see S01, S02), GeometricTopology main (Layers 1, 3, 11; smoothing comparison line 930), Chebotarev main (7.1–7.2, 11.3, 13 with ϑ_C/x→#C/#G), PadicMeasuresIwasawaAlgebras main §5.1 (`detLine_shift`, `detLine_dual`, acyclic coefficient a^{−1} in degrees −1,0, which the README's degree-0,1 convention inverts, as its Conventions say), SchemeAndStackFoundations main §§0.9, 0.21, 2.9, 2.11, RepresentationTheory/LieGroups main Layer 5, TangentialBordism #942 (B1, B2.1–B2.5, B3.1 table Ω^SO_0=ℤ, Ω^SO_{1,2,3}=0, Ω^SO_4=ℤ), KTheoryLowDegrees #1248 §§14.1–14.4, StableHomotopyKTheory #1227 §§1.17, 1.30, 1.32, KTheoryFiniteLocalFields #1281 §§1.5 (multiplier (q^{di}−1)/(q^i−1)), 1.8 (universal classes on commutative rings with ℓ invertible, slant, `chern_edge_finiteField` multiplier (i−1)! which is 1 at i=2), 1.9 (odd H₂, SL₂(𝔽₉)), MetaplecticAutomorphicForms #1063 §2.4b (local fields of characteristic ≠2 including ℝ, W=0 gives μ₂), K3BlochGroups rev/1430 §§2.4, 2.5, 4.20, 6.7 (ℤ/48→ℤ/24 at line 498). All suppliers are on main or earlier in the merge order, or other-author new-folder pull requests. The 14 declared gaps: each has a named supplier and section, the same slug and sentence in `plan.json` and the README, and a single-theorem `needs`; `gap:normal-torsor-gluing` is not already provided (no generic full faithfulness for étale covers of normal schemes in SchemeAndStackFoundations on main, grep); `gap:witt-sylow-lift`, the real Chern gaps and the dyadic gaps are not in the cited heads.

**Dependency gate** (no UPWARD, CYCLE or moved line):

```text
depcheck: 55 roadmaps, 618 edges, 0 problem(s)
```

**Policy.** `git diff --stat origin/main...HEAD` lists seven paths, all inside `packages/SymplecticReidemeisterTorsionModSquares/` (README, Suggested.lean, `design/plan.json` changed only in its top-level `gaps`, `metadata.toml` adding `topic = "math.GT"`, two reports, `sources.toml`).

**Duplication by object.** `roadmaps grep` for Reidemeister torsion, Zassenhaus and semicharacteristic over main and the open pull requests: MorseNovikov #1161 (ordinary based torsion, not in this brief's merge order), DGFloer #900 (Floer analogue), KTheoryFiniteLocalFields #1281 (cites AV-v1 as a source). No roadmap states the signed nonacyclic torsion, the Zassenhaus formula or the torsion–Chern comparison; this roadmap is the owner.

## Not verifiable

- Lean elaboration and `#check @zassenhaus_primary_formula` were not run (read-only pass); the worker's `signatures.md` and the pinned sources were used instead.
- Minimality of `gap:arithmetic-scheme-residue-order-count` against an earlier Lang–Weil-type owner (WeilConjectures, ArithmeticStatistics) was not established.
- TangentialBordism (#942) is absent from `ORDER.txt`; the gate accepts it and its placement is for the intake.
- Ownership against open pull requests not named in the brief was checked only through `roadmaps grep` by object, not file by file.
- The full 6×6 determinant det(1−T̃)=4 of §4.8 was not recomputed here; the four intertwining equations, det(1−M⁻¹)=2 and the square-class identity were, and both earlier passes reproduced the determinant.

## Source issues

- **Error** in JRV at §5 before Theorem 5.1, printed p. 16 (JRV line 773): the source says the spinor norm is onto whenever the dimension is at least two; it should be onto the classes represented by the form, since a positive definite real plane has image {1}; affects a stated result.
- **Misprint** in AV-v1 at (C.2), printed p. 87 (AV-v1 line 4080): the source says the discriminant is taken on the fixed space of T; it should be the generalized 1-eigenspace as in (B.31), the 𝔽₃ unipotent model having a degenerate fixed space; affects a stated result in the non-semisimple case.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "53d865070df5be183898481fae0fd7e1d644e90c", "job": "RT-SymplecticReidemeisterTorsionModSquares~2b", "model": "fable", "worker": "chris-h"} -->

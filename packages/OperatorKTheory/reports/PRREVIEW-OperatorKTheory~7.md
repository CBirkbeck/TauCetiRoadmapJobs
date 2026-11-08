# Review of OperatorKTheory (pull request #866 at 1377338)

**Verdict:** accepted

No finding. Both findings of the previous review are repaired, the gate passes, every sampled
locator and library name checks out, and the adversarial table below holds at every instance
tried. This folder is ready for a human's final approval.

## Status of the previous review's findings (head b328ec0)

- **R01 (P2, `C*(L,c)` had three owners): repaired.** The direction requested last round is the
  one taken.
  - Scope, lines 22–23: "the centre and the simplicity criterion of the twisted group C*-algebras
    `C*(L,c)` … (7.5)"; lines 50–53: "OperatorAlgebraDynamics owns the scalar twisted group
    C*-algebras `C*(L,c)` … (D1.CentralTwists, D2.CentralTwists); 7.5 proves their centre and
    simplicity criterion".
  - A new contract bullet, lines 236–248, lists the consumed objects (generators and star law,
    `twistedMonoidAlgebra` comparison, twisted regular representation, universal property,
    trace `τ=E` with coefficient uniqueness, full=reduced for amenable G, gauge action with its
    point-norm continuity and Haar average).
  - 7.5, lines 1837–1849, consumes them "at coefficient algebra ℂ, trivial action, scalar
    cocycle ω=c and counting Haar measure"; the five construction bullets are gone; ρ, C_ρ, H_ρ,
    Q, the centre, the simplicity criterion, the rotation identification and all Checks stay.
  - `TauCeti.twistedTranslation`, `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.lift` and
    `.algHom_ext` left the contracts and the *Needs* line; VonNeumannAlgebras V0 left the
    contracts and the K7 Dependencies (it was used only for the universal property).
  - The Downstream bullet claiming HeisenbergImprimitivity Layer 3 and
    CompactQuantumMetricSpaces §6.0 as instances of 7.5 is deleted.
  - The `Suggested.lean` docstring, lines 36–45, now says the carrier is OperatorAlgebraDynamics'
    and is consumed, not built.
  - I checked each clause of the contract against the #1137 head (b15a0d4c): D1.CentralTwists at
    README lines 859–1016 (no second-countability hypothesis at 889; `i_G(t)*=…ω(t⁻¹,t)*…` at
    967; the `twistedMonoidAlgebra ℂ G ω` identification at 1012–1016; universal property and
    pair recovery at 968–969) and D2.CentralTwists at 1449–1527 (`V_sξ(r)=ω(s,s⁻¹r)ξ(s⁻¹r)`,
    `u_s*=ĩ_A(ω(s⁻¹,s)*)u_(s⁻¹)`, `E(Σa_su_s)=a_e`, full=reduced for amenable G, gauge action
    `α̂_γ(u_s)=γ(s)u_s` by `M_γ`, point-norm continuity, `∫α̂_γ=E(x)1`). Its Downstream bullet
    at 3464–3475 says K7.5 consumes the instance. Nothing is built twice.
- **R02 (P3, 9.1 separable only): repaired.** Line 2185: "For C*-algebras A,B define an
  asymptotic morphism"; lines 2188–2189: "no separability of A or B, is required; separability
  enters with composition (9.3)"; line 2250: "For separable C*-algebras A, B and C". The B(H)
  instance is now a Check (lines 2203–2205).

## Verified sound

**Gate and direction.**
- The worker's `gate.md` passes every check (depcheck=0, build=0).
- My rerun with `--base origin/main` prints only `depcheck: UPWARD: OperatorKTheory (#9) ->
  AlgebraicKTheory (#15)`, the live order before the move, as last round.
- The brief's `--movable` check against the moved order prints
  `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- `roadmaps overlaps`: no other pull request changes this roadmap; no cited id is dropped. The
  README cites OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists (lines 175, 236,
  1830, 1890), which only #1137 defines: that pull request merges first. The description names
  #1137 in its "Supplier links" sentence; its depends-on block lists #1142, #861 and #860 only.
  Worker: the merge-order block does not list #1137.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.

**Elaboration, signatures and the probe.**
- `lake env lean` on a scratch copy of `Suggested.lean` with each `sorry` replaced by
  `first | rfl | simp | simp_all | infer_instance | trivial | tauto | aesop | exact?`: the three
  theorems (lines 65, 94, 108) all fail with "unsolved goals". None is padding.
- `#check @` on all five declarations: each matches `signatures.md` and its README statement
  (4.1 and 8.4). Atkinson keeps `[CompleteSpace H₀] [CompleteSpace H₁]`; both BDF theorems keep
  `[CompleteSpace H] [SeparableSpace H]`; `essentialSpectrum` drops `[CompleteSpace H]`, which
  `IsFredholm` does not need, so the lead in `signatures.md` is harmless.
- File form: `module` line, single `import Mathlib`, `noncomputable section`, one namespace, no
  `set_option`, no sorried data, `theorem` only, docstrings on every declaration.

**Headline theorems.** The Summary (lines 9–14) lists ten: Bott periodicity, the six-term
sequence, Atkinson with the module index, Ext(A,B) for separable nuclear A, associativity of the
Kasparov product, Green–Julg/Pimsner–Voiculescu/Connes–Thom, the free-group, rotation and Cuntz
K-groups, UCT and Künneth, Brown–Douglas–Fillmore, the universal property of E-theory. Atkinson
(parametrix form) and both BDF statements are stated; the docstring names the missing carrier of
each of the others, and I confirmed at the pins (grep over `Mathlib/` and `TauCeti/`) that there
is no Calkin algebra, no reduced crossed product, no spatial C*-tensor product, no Cuntz
algebra, no asymptotic algebra, no adjointable operators on `CStarModule` and no completion
`C*(L,c)`.

**Library declarations at the pins (49 names).**
- Tau Ceti, by file and line: `Amenable.of_commGroup` (Amenable/Abelian.lean:47, an instance
  for `[CommGroup G] [TopologicalSpace G]`), `IsFactorSet` (Twisted/Basic.lean:99, with the
  cocycle law of README line 173), `twistedMonoidAlgebra` (:288), `TwistedMonoidAlgebra.lift`
  (:397) and `algHom_ext` (:376, both now cited only through the contract bullet),
  `SmoothNoncommutativeTorus.twist` (SmoothTorus/Basic.lean:180, `𝐞(θ·y₂z₁)` at :185, matching
  README line 1869), `FullCrossedProduct` (CrossedProduct/Full.lean:266), `.of` (:282), `.lift`
  (:378), `integratedFull` (:417), `CovariantRepresentation.regular` (Covariant/Regular.lean:127),
  `SplitK0` (GrothendieckGroup/Split.lean:128), `finiteProjectiveModules`
  (CartanMap/Basic.lean:129), `IsPartialIsometry.isStarProjection_star_mul_self` (:71) and
  `_mul_star_self` (:78), `isFredholm_one_sub` (CompactPerturbation.lean:64),
  `IsFredholm.add_of_isCompactOperator` (:87), `index_add_of_isCompactOperator` (:137),
  `Continuous.isLocallyConstant_index` (ContinuousFamily.lean:54), `Path.index_eq` (:81),
  `Matrix.fromBlocks_one_sub_mul_self_of_mul_eq` (Block.lean:70) and
  `…_fromBlocks_one_sub_of_mul_eq` (:86), `Mean` (Amenable/Mean.lean:61).
- Mathlib: `ContinuousLinearMap.IsFredholm`, `isFredholm_iff_exists_isQuasiInverse`,
  `FredholmPackage` (Fredholm/Basic.lean:178), `IsQuasiInverse` (FiniteRange.lean:328),
  `index_continuousOn_isFredholm` (Fredholm/Open.lean:104), `LinearMap.index`,
  `Unitary.mem_pathComponentOne_iff` (Unitary/Connected.lean:337), `Unitary.joined` (:312, needs
  `‖v−u‖<2`), `GrothendieckAddGroup`, `CompletelyPositiveMap` (CompletelyPositiveMap.lean:51),
  `NonlinearRightInverse` (Banach.lean:38), `exists_nonlinearRightInverse_of_surjective` (:279),
  `LowerHemicontinuous.exists_continuous_selection` (Michael.lean), `LocallyConstant.freeOfProfinite`
  (Nobeling/Induction.lean:154), `SimpleGraph.mulCayley` (Cayley.lean:36), `SimpleGraph.IsTree`,
  `FreeGroup.toWord` (Reduce.lean:193), `ShortExact.extClass` (Ext/ExtClass.lean:76),
  `CategoryTheory.Tor` (Monoidal/Tor.lean), `lp.hasSum_single` (lpSpace.lean:1171),
  `CStarMatrix.conjTranspose` (CStarMatrix.lean:101), `IsStarProjection`
  (StarProjection.lean:29), `PontryaginDual` (PontryaginDual.lean:40),
  `MeasureTheory.Measure.haar` (elaborated).

**Cross-roadmap citations resolved.**
- OperatorAlgebraDynamics on main: D1 (line 75), D2 (143), D3 (205), D4 (254), D6 with O_n (358,
  457). D1.CentralTwists and D2.CentralTwists at the #1137 head as above.
- CStarAlgebras on main: C1.4 (380), C1.6 (435), C1.7 (468), C5.1–C5.5 (1112–1230), C6.1–C7.4
  (1272–1545), C8.1–C8.2 (1587–1617).
- HilbertModules (#861, bbc2ad5): H1–H7 at lines 126, 179, 262, 325, 356, 705, 762.
- AlgebraicKTheory (#1142, 7c414ba): 0.1 (87), 0.3 (123), 0.4 (141), A1 (219), A2 (293), A6
  (563), A8 (679).
- BanachAlgebras 1.2 (255) and Layer 2 (440); TopologicalKTheory T1–T7 (163–1148); FactorRigidity
  Layer 4 (415); VonNeumannAlgebras V11, the harmonic-analysis layer with Pontryagin duality
  (3149–3160; References line 4250 names it V11); GrothendieckEulerForms' build section (176).
- Consumers named in Downstream consumers exist on main: NoncommutativeGeometry,
  FreeProbability, OperatorTheory, SeibergWittenTheory, GeneralizedCohomology.
- Ownership against open work: HeisenbergImprimitivity (#1149, a9eeb6ec) lines 818–827 call the
  commutator bicharacter, centre, simplicity criterion and rotation identification
  OperatorKTheory's, which is exactly what 7.5 now owns; its claim that the algebra itself is its
  §3.1's is a HeisenbergImprimitivity/OperatorAlgebraDynamics matter settled in that review.
  CompactQuantumMetricSpaces (#1155) lines 103, 309, 1509, 1538 and 1699 still cite K7.5 for the
  point-norm continuity of the gauge action, which 7.5 now consumes from D2.CentralTwists; that
  citation is for the CompactQuantumMetricSpaces pull request to repoint, and nothing here claims
  it. No open roadmap other than this one states the centre or the simplicity criterion
  (`roadmaps grep` over the open heads for `C_ρ`, "simplicity criterion", `IsEssentiallyNormal`,
  `essentialSpectrum`, Atkinson). The brief lists no further open pull requests without files.

**Sources read at their locators (seeded sample), as `<id> line N`.**
- 1.3: Blackadar1998 lines 1586 (5.4.1, `K₀(A⁺,A)≅ker π_*`), 1605 (5.5.1), 1622 (5.5.3,
  `K₀(C₀(ℝ²))≅ℤ`, `K₀₀=0`).
- 1.4: lines 723 (1.7.2), 1337 (4.6.2, `p=ee*r`-type projection with `ep=p`, `pe=e`), 1352
  (4.6.4, polar decomposition); Roe2017 line 330 (Lemma 2.13: ranges isomorphic iff `xy=e`,
  `yx=f`).
- 1.5: lines 1744 (§6.3, unital standing assumption, `K₀(C₀(ℝ²))⁺=0`), 2064 (§6.9, states from
  tracial states and quasitraces). The positive-tracial-functional pairing is the roadmap's own
  extension, as 1.5 says.
- 2.3: lines 1547 (5.2.4), 2844 (8.1.5, K₁ continuity), 2859 (8.2.2), 2900 (8.2.3); Roe2017 lines
  1236 (7.11, injective maps), 1273 (7.14, stability), 2225 (12.17, Morita).
- 3.2: lines 2921 (8.3.1), 2934 (8.3.2, `[1−v*v]−[1−vv*]`, Fredholm index), 3154 (9.3.1 for local
  Banach algebras, no separability), 3171 (9.3.2, `[exp(2πix)]`).
- 3.4: line 10169 (23.1.3: A∈N, B arbitrary, α of degree 0, isomorphism when torsion-free).
- 4.1: Zois2010 lines 1646–1658 (Definition 4 and Theorem 1 for `T:H₀→H₁`, `S:H₁→H₀`); Blackadar
  line 2934; Roe2017 line 1269 (Exercise 7.13).
- 5.2: lines 6231 (17.1.1: countably generated graded E, graded commutator `[F,φ(a)]`, `(F²−1)φ(a)`,
  `(F−F*)φ(a)` compact; degenerate when zero), 6483 (17.3.1, `KK_n=KK(A,B⊗̂C_n)`).
- 5.4: lines 6740 and 6745 (17.5.5–17.5.6 for trivially graded σ-unital B).
- 6.2: lines 7458 (18.3.1, the two connection conditions with `(−1)^(∂x·∂F₂)`), 7644 (18.4.3: A
  separable, D σ-unital), 7823 (18.6.1: A, D₁ separable, D₂ σ-unital).
- 7.1: lines 9000 (standing second-countable/separable scope), 9007 (20.1.1), 9019 (20.1.2 and the
  remark that G-continuous elements form a C*-subalgebra containing K(E)), 9060 (20.1.5: even
  G-continuous M, N with `g·M−M∈J`, invariant for compact G), 9069 (20.2.1, the four conditions),
  9081 (20.2.2), 9120 (20.3.1).
- 7.2: lines 9112 (20.2.7(a), `K^G_i(B)≅K_i(B⋊G)` for compact G), 9238 (20.6.2, descent
  functorial and product-compatible, `j_G(1_A)=1`).
- 7.5: Phillips2006 lines 95 (Remark 1.2), 131 (Lemma 1.5), 139 (Definition 1.6, nondegeneracy),
  162–167 (Theorem 1.9: simple iff nondegenerate, the simplicity direction from Slawny, Theorem
  3.7, with a unique tracial state when simple).
- 9.1: lines 11272 (25.1.1, arbitrary A and B), 11337 (25.1.3, `limsup‖φ_t(a)‖≤‖a‖`), 11345
  (25.1.4(a), the *-homomorphism into `B_∞`).
- 9.3: lines 11482 (25.3.1, separable A, B, C), 11593 (25.3.2).
- 9.4: lines 11650 (25.4.4, `E(A,B)=[[SA,SB⊗K]]`), 11663 (25.5.1, quasicentral approximate unit).
- Also reread: 14.1.1 and 14.1.2 (5069, 5098), 13.6.2 (4976), 12.4.2 (4721), 15.2.1 (5376),
  17.6.5 (6886), 19.5.7 (8700), 19.7.1 (8769); Roe 1.12 (177), 6.2 (1023), 12.15 (2178), 12.16
  (2191), 14.5 (2533), 14.7 (2548), 16.3 (2970), 19.1 (3460).

**Adversarial table.** Values computed on both sides; every row holds.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 nonunital K₀ (sample) | A=ℂ; C₀(ℝ²); K | `ℂ⁺≅ℂ×ℂ`, `K₀=ℤ²`, ε second projection, kernel `ℤ×0`; no nonzero projection over C₀(ℝ²) (rank locally constant, vanishing at ∞) yet `K₀=ℤ` by Blackadar 5.5.3; `e₀₀∈K` generates ℤ | holds | none |
| 1.4 projective modules (sample) | ℂ; e=[[1,1],[0,0]]; B(H); ℂ→M₂ | `z=1+(e−e*)(e*−e)=2`, `p=diag(1,0)`, `ep=p`, `pe=e`, `eℂ²=pℂ²≅ℂ`; `A²≅A` gives `[A]=0=K₀(B(H))`; `[1]↦2[e₁₁]` and `[ℂ]↦[M₂]=2[e₁₁M₂]` | holds | none |
| 1.5 trace pairing (sample) | Mₙ(ℂ), tr/n; C(X), ev_x; K; φ:ℂ→ℂ²; Bott class | rank-one `1/n`, `[1_(M_k(A))]↦k·tr(1_n)/n=k`; rank at x is an integer; `Nτ(e₀₀)≤‖τ‖` for all N so τ=0 on K; `τ∘φ=0`, `(τ∘φ)_*[1]=0=τ(1,0)`; `trace p(x)−1=0=τ₂(p−p(∞))`, without −n the zero class pairs to 1 | holds | none |
| 2.3 continuity and limits (sample) | CAR algebra; τ_k | `τ_k(e)=2^(−k)`, `τ_(k+1)(diag(e,e))=2^(−k)`; `K₀=ℤ[1/2]`, pairing the inclusion | holds | none |
| 2.4 local normed | ℂ; g=1/10; ℂ[z]; 0 | GL₁(ℂ) connected; `|g−1|=0.9<1`, `|g⁻¹−1|=9`; `(z−2)⁻¹=−Σzⁿ/2^(n+1)` not polynomial; `GL_n(0)` trivial | holds | none |
| 3.1 Bott map (headline) | H(r,s) edges; A=ℂ; M | s=0: `exp(2πi(1−r)p)exp(2πirp)=1`; s=1: `exp(2πie)=1`; r=1: `f_e(s)f_p(s)⁻¹` since `exp(2πip)=1`; `b_ℂ[1]=exp(2πit)` winding +1; `M²=(1+|z|²)M` | holds | none |
| 3.2 six-term (headline, sample) | Toeplitz; split; B(H)→Q(H) | `δ₁[z]=[1−S*S]−[1−SS*]=0−[e₀₀]=−1=0−1=index S`; both boundaries 0; `K₁(Q(H))≅ℤ` via δ₁ | holds | none |
| 3.4 external products (sample) | ℂ⊗ℂ; 𝕋²; flip | `[1]×[1]=[1]`; Künneth count `ℤ⊗ℤ⊕ℤ⊗ℤ=ℤ²=K₀(C(𝕋²))`; flip gives `−q*β`, and `2q*β=0` is false in ℤ² | holds | none |
| 3.5 Fréchet subalgebras | C¹(𝕋); 2+z | `‖(fg)′‖≤‖f′‖‖g‖+‖f‖‖g′‖`, C=1; `1/(2+z)` has all modes n≥0 | holds | none |
| 4.1 Atkinson, Lean (headline, sample) | S; Vδₙ=δ₂ₙ; compact on ℓ²; 0:{0}→ℂⁿ; ℓ²→{0}; dim<∞ | `S*S−1=0`, `SS*−1=−e₀₀`, index −1; `VV*−1=−P_odd` not compact, coker infinite, both sides false; `S0−1=−1` not compact; `0∘0−1=0` on {0}, `0∘0−1=−1` on ℂⁿ compact, index −n; ker ℓ² and `S0−1=−1` not compact; finite dimension both true | holds; probe open | none |
| 4.2 module index (headline) | [[0,S*],[S,0]]; swap on ℂ^(1\|1) | `F²−1=diag(0,−e₀₀)`, index −1; `F²=1`, index 0 | holds | none |
| 4.3 dilation | φ=a₁₁ on M₂; φ(λ)=λ/2; order of `φ(a*b)` | null space = zero first column, `dim E_φ=4−2=2`; `V*V=1/2`; `φ(e₁₁)=1≠0=φ(e₂₂)` with the wrong order | holds | none |
| 4.4 complete pairs | even/odd; 3n,3n+1; U=t₀s₀*+t₁s₁* | range sum 1; range sum `1−R`, R infinite rank; `U*U=Σs_is_i*=1`, `UU*=Σt_it_i*=1`, `Us_i=t_i` | holds | none |
| 4.5 Ext (headline) | Toeplitz; (Mₙ,K); C(X) | lift would give index 0 against −1; ordinary class 0 against ℤ/n; inverse sends z to [S*], index +1 | holds | none |
| 5.1 Clifford conventions | e₁,e₂; se₂+te₁ | `e₁e₂=diag(−i,i)=−e₂e₁`; block `t−is=−iz` winding +1, unswapped `s−it=z̄` winding −1; `pq+(p+q)r=qr+p(q+r)` mod 2 | holds | none |
| 5.2 Kasparov cycles (sample) | (A,id,0); diagonal on H_A; (ℂ^(1\|0),id,0); inverse cycle | `K_A(A)=A`, so `(0²−1)a=−a` compact; `diag(a,a,…)` not compact for a≠0; class 1; swap W odd, unitary, anticommutes with `F⊕−F`, rotation to degenerate | holds | none |
| 5.4 degrees (sample) | x=−cot πt; KK₂(ℂ,ℂ); (L²(𝕋),f↦f,0) | `(x−i)/(x+i)=exp(2πit)` exactly; `KK(ℂ,Cl₂)≅ℤ` via ℂ^(1\|1); `(0²−1)φ(1)=−1` not compact | holds | none |
| 5.5 unbounded cycles | −i d/dx; D=0 on ℂ^(1\|0); D=0 on infinite H | `F²−1=−(1+ξ²)⁻¹`; F=0 class 1; `(1+D²)⁻¹=1` not compact | holds | none |
| 6.2 Kasparov product (headline, sample) | 1_D; [f]⊗[g]; two odd classes | `x⊗1_D=x`; `[g∘f]`; sign `(−1)^(1·1)=−1` | holds | none |
| 6.3 KK-category | (λ1,λ(1−e₀₀)); degenerate; corners | difference `(0,e₀₀)`, class +1, swapped −1; `s₀=s₁` gives 0; rank one 1, rank two 2 not invertible | holds | none |
| 6.4 semisplit | Toeplitz; split; cone | `[z]⊗δ=−1`; 0; generator of `KK₁(ℂ,Sℂ)` | holds | none |
| 6.5 Manuilov–Thomsen | (Mₙ,K); (ℂ,J); (C(𝕋),K) | unit evaluation ×n, `KK₁=0`, `U=ℤ/n`; identities, `U=0`; ev onto, `K₁(K)=0`, `U≅ℤ` | holds | none |
| 6.6 index pairing | [P,u]; PuP; Pu*P; u=1 | `[P,u]δ₋₁=δ₀`, others 0; index −1; index +1; index 0 | holds | none |
| 7.1 equivariant KK (sample) | trivial G; L²(G); C(𝕋) rotation; f,h on ℝ | `KK_G=KK`; `(0²−1)φ(1)=−1` not compact; `β_g(ξ)β_g(b)≠β_g(ξ)b`; `fh=0`, `f(x_k)=1`, `h(y_k)=1`, `y_k−x_k=π/(x_k+y_k)→0`, `M(x_k)→0`, `M(y_k)→1`, M not uniformly continuous | holds | none |
| 7.2 Green–Julg (headline, sample) | p_G; trivial G; ℤ/2 on ℂ | `p_G*=p_G`, `(1∗1)=1`; `p_G=1`, identity map; `R(ℤ/2)=ℤ²=K₀(ℂ²)`, degree one 0 | holds | none |
| 7.3 free groups (headline) | Γ_n; n=0,1; m≠n | `g_nΓ_n=Γ_n∖{1}`, `g_iΓ_n=Γ_n`; (ℤ,0), (ℤ,ℤ); `δ₁[u_n]=−[P₁]=−[1]`; ℚ-ranks m≠n | holds | none |
| 7.4 PV and rotation (headline) | UaU*=α(a); θ=1/2; θ=p/q | `(1−(α⁻¹)_*)(−α_*)=1−α_*`; `uv=e(θ)vu`; `ℤ+½ℤ=½ℤ`, τ_* not injective on ℤ²; `(1/q)ℤ` | holds | none |
| 7.5 consumed objects (sample, changed) | V_x on ℓ²(L); W_x*; τ; M_χ | `(V_xδ_y)(z)=c(x,z−x)δ_y(z−x)`, nonzero only at z=x+y with value c(x,y), so `W_xδ_y=c(x,y)δ_(x+y)`; `W_xW_(−x)=c(x,−x)`, so `W_x*=c(x,−x)̄W_(−x)=c(−x,x)̄W_(−x)` by the cocycle at (x,−x,x); `⟨δ₀,W_xδ₀⟩=δ_(x,0)`; `M_χW_xM_χ*δ_z=χ(z)̄c(x,z)χ(x+z)δ_(x+z)=χ(x)W_xδ_z` | holds; matches D2.CentralTwists | none |
| 7.5 centre and simplicity (sample) | rotation ρ; (ℤ/2)²; ℤ/2; L=0; trivial c; H_ρ | `ρ=e(θ(nm′−n′m))`: C_ρ=qℤ² for p/q, 0 irrational, ℤ² at θ=0; `ρ((1,0),(0,1))=ρ((1,1),(1,0))=ρ((0,1),(1,0))=−1`, C_ρ=0, M₂(ℂ), radical of c `{0,(1,0)}`; ℤ/2 with c(1,1)=−1: `W₁²=−1`, `W₁*=−W₁`, `W₁W₁*=1`, ρ(1,1)=1, ℂ⊕ℂ by `W₁↦(i,−i)`, c normalized and a cocycle at (1,1,1) and (1,1,0); ℂ simple; `C(L̂)` not simple for L≠0; `Ann_L(H_ρ)=C_ρ`, so `Ann(C_ρ)=H_ρ` by duality for discrete L; `∫_(H_ρ)χ(y)dχ=1` iff y∈C_ρ | holds | none |
| 7.5 convention witness | x=(0,1), y=(1,0) | `c(x,y)=e(θ)`, `c(y,x)=1`, `uv=e(θ)W_(1,1)`, `vu=W_(1,1)`, `uv=e(θ)vu` as in 7.4; `twist θ y z=𝐞(θ·y₂z₁)` at the pin | holds | none |
| 7.5 simplicity route | nonzero ideal I; Z=ℂ1 | `Ad(W_x)=α_(κ_x)` preserves I, closure H_ρ by continuity, `Q(I)⊆I`; `τ(Q(a))=τ(a)>0` for a>0 in I; `Z∩I≠0` and Z=ℂ1 force I=A; conversely a non-scalar central z gives the proper ideal of `z−λ`, λ∈σ(z) | holds | none |
| 7.6 Cuntz (headline) | n=1,2,3 | vacuum class `(1−n)[1]`; ℤ/0=ℤ; K₀(O₂)=0; K₀(O₃)=ℤ/2 | holds | none |
| 7.7 Connes–Thom (headline) | u=(x+i)/(x−i) | `arg u=2arg(x+i)` from 2π to 0, winding −1 | holds | none |
| 8.1 bootstrap | 0; Sℂ; B(H); Cr*(F₂) | `0→ℂ→ℂ→0→0`; Cℂ contractible; B(H) not separable; Cr*(F₂) not nuclear | holds | none |
| 8.3 UCT (headline) | A=ℂ; (O_n,ℂ) | Ext terms 0; `KK₀=Hom(ℤ/(n−1),ℤ)⊕Ext(0,ℤ)=0`, `KK₁=Ext¹(ℤ/(n−1),ℤ)=ℤ/(n−1)` | holds | none |
| 8.4 BDF, Lean (headline) | S; S⊕S*; dim<∞ | `S*S−SS*=e₀₀`; `index(S−λ)=−1` for \|λ\|<1; `−1+1=0`; σ_e=∅ and both sides true | holds; probes open | none |
| 8.5 Künneth (headline) | O₃⊗O₃; A_θ⊗A_θ′; C(𝕋)⊗B | `K₀=ℤ/2⊗ℤ/2=ℤ/2`, `K₁=Tor(ℤ/2,ℤ/2)=ℤ/2`; `ℤ⁴⊕ℤ⁴=ℤ⁸`; free so isomorphism | holds | none |
| 9.1 asymptotic morphisms (sample, changed) | (1+1/t)φ; 2a on ℂ; (1+1/t)id on B(H) | defect `−(1/t)(1+1/t)φ(ab)→0`; defect −2 for all t; admitted now, with B(H) nonseparable; Blackadar 25.1.1 for arbitrary A, B | holds | none |
| 9.3 composition (changed) | r(t)→∞; φ:ℂ→ℂ | `(1+1/r(t))(1+1/t)ψφ∼ψφ`; `x_t²−x_t→0` forces x_t near 0 or 1, classes {0,id} | holds | none |
| 9.4 E-theory (sample) | E(ℂ,ℂ); reversed suspension | `E(ℂ,B)≅K₀(B)`, identity class 1; `exp(−2πit)` is the inverse | holds | none |
| 9.5 universal property (headline) | (O_n,ℂ) | `E₀=KK₀=0`, `E₁=KK₁=ℤ/(n−1)` | holds | none |

**Declared gaps.** None declared (no readable `design/plan.json`), and the README states no
`gap:` contract.

## Not verifiable

- Slawny1972 is recorded as uncertified (paywalled); it is cited only through Phillips2006
  Theorem 1.9, whose attribution I read at Phillips2006 line 166.
- Cuntz1981, PimsnerVoiculescu1982, Julg2013, ManuilovThomsen2005, Messerschmidt2016,
  Schochet1984 and StacksProject were not reread this round: they are outside the seeded sample,
  the passages citing them are unchanged since the heads at which earlier rounds verified them,
  and the README flags no locator as unverified.
- Ownership against open pull requests was checked through the sibling heads the brief lists
  (OperatorAlgebraDynamics #1137 and #1097, HeisenbergImprimitivity #1149,
  CompactQuantumMetricSpaces #1155, NoncommutativeGeometry #1143, CStarAlgebras on main,
  HilbertModules #861, AlgebraicKTheory #1142, OperatorTheory #1027, IndexTheory #1077) and by
  `roadmaps grep` over all open heads; packages on the board without a checkout were not read.

## Source issues

- **Misprint** in Blackadar1998 at Definition 20.1.1, printed p. 205: the source glosses strong
  continuity of the group action on a Hilbert module as continuity of `g↦‖⟨g·x,g·x⟩‖`, the norm
  of the orbit; it should be norm continuity of the orbit map `g↦g·x` for every x; affects
  nothing (the roadmap states the orbit-map condition).

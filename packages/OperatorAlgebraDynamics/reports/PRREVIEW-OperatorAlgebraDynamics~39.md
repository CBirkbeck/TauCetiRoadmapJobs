# Review of OperatorAlgebraDynamics (pull request #1137 at 98be87d)

**Verdict:** needs changes

This is an incremental re-review of the 42 lines the folder changed since e2d8e4d. One finding remains, P3, and it is in the pull-request description, not in the folder:
- the description still says the branch deletes six files of other roadmaps, which this head no longer does.

Both findings of the previous review are repaired, the gate passes, and `README.md` and `Suggested.lean` are byte-identical to the files the previous review read.

## R01 (P3) — The description says the branch deletes six files that this head restores

**Location.** The author's prose of the pull-request description, section "Outside the folder" (outside the generated `merge-order` block): "At this head the branch also deletes `PROGRESS.md` and `STATUS.md` of FiniteGroupExtensionSplitting, LieGroupoidsPoisson and PrimitivePrimeDivisors, which a merge of main dropped."

**Claim.** The sentence, and the one after it ("the six files are to be restored from main before this pull request merges"), are false at 98be87d. They were written for the previous head; the commit that repaired the deletion made them wrong.

**Witness.**
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` at 98be87d prints nothing: the branch changes no file outside the folder.
- The head commit 98be87d8 is "Restore six progress files of other roadmaps"; the merge base is main's 641eaf38.
- The gate reports `outside-folder=0`.

**Repair.** Delete the section "Outside the folder" (its heading and its one paragraph) from the description. The first paragraph's "No other file of the folder changes" then stands alone and is correct: against main the branch changes only `README.md` and `Suggested.lean`.

## Previous findings

- R01 — repaired: the branch no longer deletes the six `PROGRESS.md`/`STATUS.md` files; the diff against main outside the folder is empty and the gate gives `outside-folder=0`.
- R02 — partly repaired: the description now states "23 declarations: 18 headline theorems … five definitions" and "no companion Lean files", all correct; the replacement added the "Outside the folder" paragraph, now false. Raised as R01 above.

## Verified sound

### What changed since e2d8e4d

- **In the folder:** only `PROGRESS.md` (+9) and `STATUS.md` (33 changed lines). Both are the generated progress files, brought in by the merge of main (3482a622), and both are byte-identical to main's copies: `git diff origin/main HEAD` on the two paths is empty. They are not part of this pull request's change against main.
- **`README.md`, `Suggested.lean`, `metadata.toml`:** `git diff --quiet e2d8e4d HEAD` on the three paths reports no difference. No statement, Check, locator, *Needs:* line or Lean declaration changed, so there is no changed passage to review by the full steps and no changed statement to add to the adversarial table.
- **Outside the folder:** the list in `scratch/changes.md` is the merge of main. Against main (`origin/main...HEAD`) the branch changes nothing outside the folder.
- **Pins:** `lake-manifest.json` and `lean-toolchain` are unchanged since e2d8e4d: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. The library checks of the previous review therefore still hold. In particular the pinned Tau Ceti has `Action/CrossedProduct/{ApproximateUnit,Full,Functoriality,Multiplier}.lean` and no `Regular.lean`, so the module docstring's "reduced crossed product not statable at the pin" is still true, even though `STATUS.md` reports a concrete regular algebra in a later Tau Ceti.
- **Suppliers on main:** main moved from f8836c4 to 641eaf38. `git diff --stat f8836c4 641eaf38` shows no change to the README of any roadmap this one cites (CStarAlgebras, HilbertModules, VonNeumannAlgebras, BanachAlgebras, SelfAdjointSpectralTheory, LieGroupoidsPoisson, FreeProbability, AmenableGroups, CompactGroups, SpinRepresentations, OneParameterSemigroups). The 40-odd section citations the previous review resolved are unchanged. `scratch/citations.md`, computed at 641eaf3 and 448 open heads, lists no unresolved citation and no unresolved Lean name.

### Gate, dependency check, elaboration

- **Gate** (my run at 98be87d): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. It agrees with the worker's `gate.md`, which adds `build=0`.
- **Dependency check:** `depcheck: 234 roadmaps, 2265 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` exits 0 in 12 s. The only diagnostics are 18 `declaration uses 'sorry'` warnings, at lines 109, 122, 137, 222, 241, 267, 287, 303, 324, 345, 356, 373, 389, 411, 437, 449, 472 and 491: one per headline theorem.
- **Signatures and padding:** the file is unchanged and the pins are unchanged, so the `#check @` comparison of all 23 declarations and the one-tactic probe of the previous review (all 18 theorems fail every one-tactic closer; five definitions with real bodies) carry over. `scratch/signatures.md` reports 0 lost binders and `scratch/library-matches.md` 0 same-name hits.

### Seeded sample

The three sampled targets ("Worked example: the saddle flow", "D5.Fields — the standard-fibre model as a measurable field", "Concrete Cuntz families on separable Hilbert space") lie in untouched text. The previous review checked each against its source (`williams-cpcsa-draft31` Example 3.32 at lines 6178–6195, pp. 96–97; Definition E.16 and Theorem E.17 at lines 23770–23776, p. 405; Definition F.1 at line 23897, p. 409) and by computation (rows 23, 26, 27 and 28 below). Nothing in them changed. The README flags no locator as unverified.

### Overlaps and ownership

- `scratch/overlaps.md`: no id dropped, none that only an open revision defines. Its one conflict, the pin bump #1187, is ordered in the description's generated `merge-order` block ("`OperatorAlgebraDynamics`: this pull request → #1187").
- The ownership findings of the previous review (`O_n`, `C*(L,c)`, no clash of fully qualified names) concern untouched text and are carried.

### Description

Apart from R01, the description matches the head: the branch changes `README.md` and `Suggested.lean` of the folder; `Suggested.lean` imports `Mathlib` and nine `TauCeti.*` modules and has 23 declarations, 18 sorried theorems and five definitions; the folder has no companion Lean file.

### Adversarial table

The diff changes no statement. Every row is carried from the review of e2d8e4d, where the values were computed; rows 1–25 are the stated declarations, 26–28 the seeded sample, 29–40 conventions and Checks.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` | ℤ counting, `f=δ_0⊗a+δ_1⊗b`; `f(n)=2^(−\|n\|)a`; uncountable discrete G with counting measure | `T=π(a)+π(b)U_1`; `‖f‖₁=‖a‖(1+2Σ_(n≥1)2^(−n))=3‖a‖`; finite-measure sets are finite, hence compact, and integrable f has countable support | holds | none (carried from the review of e2d8e4d) |
| 2 | `exists_covariantRepresentation_integratedFull` | G trivial, A=ℂ², `L(x,y)=x`; L=0 on H=ℂ; A=0 | P=(L,1); for L=0 the span of the vectors `L(x)ξ` is 0, not dense in ℂ, so `hL` excludes it; for A=0 only H=0 is nondegenerate | holds | none (carried from the review of e2d8e4d) |
| 3 | `fullCrossedProductMap_exact` | G trivial; A=ℂ², trivial action, I=ℂ⊕0; I=A | `0→I→A→A/I→0`; the kernel of the second projection is the first summand; I=A forces B=0 and makes the first map onto | holds | none (carried from the review of e2d8e4d) |
| 4 | `CentralCocycle` | (r,s,t)=(s,s⁻¹,s); ℤ/2 on M₂, `ω(a,a)=diag(1,−1)` | `α̃_s(ω(s⁻¹,s))ω(s,e)=ω(s,s⁻¹)ω(e,s)`, the README's inverse identity; at (a,a,a) both sides are `diag(1,−1)` so the cocycle law holds, but `diag(1,−1)E₁₂=E₁₂≠−E₁₂=E₁₂diag(1,−1)`, so only `central` fails | discriminating | none (carried from the review of e2d8e4d) |
| 5 | `CentralCovariantPair` | associativity of `U_rU_sU_t` | `(U_rU_s)U_t=π̃(ω(r,s)ω(rs,t))U_rst`; `U_r(U_sU_t)=π̃(α̃_r(ω(s,t))ω(r,st))U_rst`; these are equal exactly by the `cocycle` field on left actions | consistent | none (carried from the review of e2d8e4d) |
| 6 | `twistedConvolution` | `T_fT_g`; (ℤ/2)², `ω=(−1)^(ba′)`, u=(1,0), v=(0,1) | `π(f(r))U_rπ(g(t))U_t=π(f(r)α_r(g(t))ω(r,t))U_rt`; t=r⁻¹s gives the right multiplier `ω(r,r⁻¹s)` (`.snd`); `δ_u*δ_v=ω(u,v)δ_(u+v)=δ_(u+v)`, while `ω(r⁻¹s,r)` gives `−δ_(u+v)` | pins the argument order | none (carried from the review of e2d8e4d) |
| 7 | `centralIntegrated_twistedConvolution` | ℤ/2, `ω(a,a)=−1`, H=ℂ; `U_a=i` and `U_a=1` | `T_(δ_a*δ_a)=−1=i²`; `U_a=1` gives 1≠−1 and fails the `projective` field (1·1≠−1·1), so it is not a `CentralCovariantPair` | holds; uses ω | none (carried from the review of e2d8e4d) |
| 8 | `continuous_of_measurable_monoidHom` | Hamel ℚ-linear map ℝ→ℝ; D.11 | discontinuous, hence not Borel; D.11's "separable metric groups, G Polish" (line 21995) are the Lean classes | holds | none (carried from the review of e2d8e4d) |
| 9 | `IsAnalyticBorelSpace` | ℝ with its Borel sets; ℝ with the countable–cocountable σ-algebra | holds with X=ℝ, s=univ; the second fails: countably many countable or cocountable generators cannot separate two points outside the union of the countable ones, while a relative Borel structure of a Polish space is countably separated | discriminating | none (carried from the review of e2d8e4d) |
| 10 | `existsUnique_groupTopology_of_isAnalyticBorelSpace` | ℝ with Lebesgue; φ swapping [0,1) and [1,2); counting measure on ℝ; μ=0 on `ℝ^ℕ` | usual topology; `U=φ((−½,½))=(−½,0)∪[1,3/2)` is τ′-open, `U−1=(−3/2,−1)∪[0,½)`, `φ(U−1)=(−3/2,−1)∪[1,3/2)` is not open, so τ′ is no group topology; counting measure is not σ-finite; an lcsc group topology on `ℝ^ℕ` would be homeomorphic to the product topology, which is not locally compact | holds; "group", σ-finite and μ≠0 all needed | none (carried from the review of e2d8e4d) |
| 11 | `injective_integratedFull_regular_of_amenable` | ℤ, A=ℂ; F₂, `h=δ_a+δ_(a⁻¹)+δ_b+δ_(b⁻¹)`; ρ(z)=z⊕0 | `‖λ(f)‖=sup_𝕋\|f̂\|`; the trivial character gives 4, while `‖λ(h)‖=2√3<4`; a degenerate faithful ρ adds a zero summand and keeps the kernel | holds; amenability needed | none (carried from the review of e2d8e4d) |
| 12 | `transitive_commutant_scalar` | general; trivial action on {p,q}; I empty | `value f j·T_ij=value f i·T_ij` gives `T_ij=0` for i≠j; transitivity makes the diagonal constant; under the trivial action `diag(1,0)` commutes and is not scalar; I empty gives lp=0, so any c | holds | none (carried from the review of e2d8e4d) |
| 13 | `exists_powers_partition` | general f with \|p\|,\|q\|<L; F={b}, L=2; ℤ, F={1}, N=3; N=0 | `w f w⁻¹=a b^(L+p) g b^(q−L) a⁻¹` or `a b^k a⁻¹`, reduced, starting with a and ending with a⁻¹; `wbw⁻¹=aba⁻¹`; ℤ fails at N=3 by the density count; N=0 is vacuous | holds; a≠b needed | none (carried from the review of e2d8e4d) |
| 14 | `generatedCStarAlgebra` | λ on F₂ without closure; bilateral shift | the augmentation ideal of ℂ[F₂] is proper; the shift generates C(𝕋) | discriminating | none (carried from the review of e2d8e4d) |
| 15 | `reducedFreeGroup_isSimpleRing` | singleton basis; {a,b}; nonclosed ideals | C(𝕋) has the ideal of functions vanishing at 1; the closure of a proper ideal of a unital C*-algebra is proper (open invertibles), so closed-ideal simplicity gives `IsSimpleRing` | holds; a≠b needed | none (carried from the review of e2d8e4d) |
| 16 | `reducedFreeGroup_trace_unique` | singleton basis; {a,b} | `ev_z(λ(b))=z≠0=τ(λ(b))`; `⟨δ_1,λ(g)δ_1⟩=δ_1(g⁻¹)=[g=1]`, linear in the second variable | holds | none (carried from the review of e2d8e4d) |
| 17 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` | ℤ/2; S₃; involution | `f̂(1)=f₀+f₁`, `f̂(χ)=f₀−f₁`, `δ_a↦(1,−1)`, `‖δ_e+δ_a‖=2`; `C*(S₃)=ℂ²⊕M₂` is not commutative; `(f*)^(χ)=∫conj(f(y))χ(y⁻¹)=conj(f̂(χ))` | holds | none (carried from the review of e2d8e4d) |
| 18 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` | G=ℤ; ν↦cν | the unitary of `C*(𝕋)` at z goes to `n↦zⁿ`; f with respect to cν is cf with respect to ν | holds | none (carried from the review of e2d8e4d) |
| 19 | `lcaWeyl_classification` | ℤ/2; ℤ; ℤ/3 shift with `V_χ=diag(1,ω,ω²)`; E=0 | `U_aV_χU_a*=diag(−1,1)=−V_χ`; `U_sV_zU_s*=conj(z^s)V_z`; `U₁V_χU₁*=ω⁻¹V_χ` but `V_χU₁V_χ*=ωU₁`, so the phase is not symmetric; E=0 gives ι=∅ | holds | none (carried from the review of e2d8e4d) |
| 20 | `cuntz_isSimpleRing` | n=1 bilateral shift; H=0; finite-dimensional H, n=2 | `U*U=UU*=1` and `C*(U)=C(𝕋)` is not simple; H=0 gives the zero ring, which is not simple; n orthogonal copies of H inside H are impossible | holds; `2≤n` and `Nontrivial H` needed | none (carried from the review of e2d8e4d) |
| 21 | `mem_extremePoints_kmsStates_iff` (β≠0) | ℂ⊕ℂ, trivial dynamics; M₂, K=diag(0,1); rotation of C(S¹) | (½,½) has `π_ω(A)''=ℂ²`, so it is neither extreme nor a factor state; the Gibbs state is the unique KMS state, a factor state (`M₂⊗1`) but not pure; for the rotation `K_β=∅` while `ev_z` is a factor state, so `hω` is needed | holds | none (carried from the review of e2d8e4d) |
| 22 | `mem_extremePoints_kmsStates_iff` (β=0) | traces, central z | `K_0` is the tracial states (`isKMSState_zero_iff`); `ω̄(zπ(a)π(b))=ω̄(π(b)zπ(a))=ω̄(zπ(b)π(a))`, so the split states are tracial; `ω=0` is excluded by `norm_eq_one` | holds | none (carried from the review of e2d8e4d) |
| 23 | `exists_residue_family` (sampled) | n=2; n=1; shift family | `⟨b_k,S_jb_m⟩=[k=nm+j]` gives the adjoint formula; `S₀*b₃=0`, `S₁*b₃=b₁`, `(S₀S₀*+S₁S₁*)b₃=S₁b₁=b₃`; n=1 gives `S₀=id`; `S_jb_k=b_(k+j)` gives `S₁*S₀=S₁*≠0` | holds | none (carried from the review of e2d8e4d) |
| 24 | `vonNeumannEntropy_strong_subadditivity` | GHZ; 2·GHZ; `\|0⟩⟨0\|⊗Φ⁺`; ρ=0 | `0+log2≤2log2`; `S(2σ)=2S(σ)−2log2` gives `−2log2≤0`; `log2=log2`, and with `ρ_A` in place of `ρ_AB` it reads `log2≤0`, false; `0≤0` | holds; partial traces pinned | none (carried from the review of e2d8e4d) |
| 25 | `CentralCocycle` continuity and `twistedConvolution` integrability | f, g ∈ C_c | `‖ω(q).snd‖≤1` plus pointwise strict continuity give joint continuity of `(q,a)↦ω(q).snd a`, so the integrand is continuous and compactly supported | integrable | none (carried from the review of e2d8e4d) |
| 26 | Saddle flow (sampled) | (1,1), (−1,−1), (1,−2); `{x>0,\|xy\|<ε}` | orbits `{(u,1/u):u>0}`, `{(u,1/u):u<0}`, `{(u,−2/u):u>0}`; the set is saturated and open, misses 0, and meets the Q₁ and Q₄ branches with r<ε; the +x and +y neighbourhoods share Q₁ branches | holds; locator correct | none (carried from the review of e2d8e4d) |
| 27 | D5.Fields (sampled) | N={0} below ½, {0,1} from ½; non-measurable S; S=[0,½] | `1_(x≥½)E₀₁` is a field; constant `E₁₀` sends `e₀` outside `span e₀` below ½; `1_Se₀` is not measurable; zero fibres give `L²(S)` | holds; locators correct | none (carried from the review of e2d8e4d) |
| 28 | Concrete Cuntz families (sampled) | basis change W | `WS_jW*` is the residue family of `b′=Wb` | holds | none (carried from the review of e2d8e4d) |
| 29 | D1 convolution direction | ℤ/3 shift on ℂ³ | `(f*g)(2)=e₀α₁(e₂)=e₀`; the inverse convention gives `e₀e₁=0` | holds | none (carried from the review of e2d8e4d) |
| 30 | `T_b` and `ψ_b` directions | ℤ/3, `b(1)=i`, `b(2)=1`; ℤ/2 | `U^b_sU^b_t=π̃(ω^b(s,t))U^b_st` and `T^(U^b)_f=T^U_(fb)`; `ω^b(1,2)=i`; `(iδ₁)δ₂=iδ₀`, reversed `−δ₀`; `(1,a)⁴=(1,e)`, `(i,a)²=(i·i·(−1),e)=(1,e)` | holds | none (carried from the review of e2d8e4d) |
| 31 | Twisted involution and multiplier formulas | U_s* algebra; right action | `U_s*=U_(s⁻¹)π̃(ω(s,s⁻¹))*`, `s↦s⁻¹` with factor `Δ(s⁻¹)=c(s)` gives `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)`; `T_fU_t` with `r=st⁻¹` gives `c(t)f(st⁻¹)ω(st⁻¹,t)` | holds | none (carried from the review of e2d8e4d) |
| 32 | Twisted regular family | `V_sV_t` | equals `Π̃(ω(s,t))V_st` via the cocycle at (s,t,t⁻¹s⁻¹r) and centrality; scalar case: `W_bV^(ω^b)_sW_b*=b(s)V^ω_s` | holds | none (carried from the review of e2d8e4d) |
| 33 | D3 modular factor | star law of `⟨f,g⟩_(A⋊H)` | `⟨f,g⟩*(h)=Δ_H(h⁻¹)γ(h⁻¹)Δ_G(h)∫…`, so the law holds iff `γ²=Δ_G/Δ_H` | holds | none (carried from the review of e2d8e4d) |
| 34 | D5 dictionaries | one-unit groupoid; transformation groupoid | `(Δ^½f)*(Δ^½g)=Δ^½(f*g)`; both stars give `Δ(s)^(−½)conj(f(s⁻¹))`; `(f*h)(s,x)=Δ(s)^½(F*G)(s)(sx)` | holds | none (carried from the review of e2d8e4d) |
| 35 | D2 sequence algebras | `E_ij`; parity p; e | `E_ijδ_n=[n=j]δ_i`; `UpU*=1−p`, so there is no character; e is full since its ideal contains K and `q(e)=1`; `eUe=S` | holds | none (carried from the review of e2d8e4d) |
| 36 | D6 strong effectiveness and full shift | ℤ on `ℤ⊔{+∞}`; `(0^m10^∞,·,0^∞)` | the isotropy interior is the units, the reduction to {+∞} is ℤ, and there are three invariant opens against the ideals indexed by closed subsets of 𝕋; in the subspace topology non-unit arrows converge to a unit, and `Z([0],1,0,X)` is not open | holds | none (carried from the review of e2d8e4d) |
| 37 | KMS sign, modular group, perturbation | K=diag(0,1), a=E₁₂, b=E₂₁; P=−K | `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(ba)`; `ρ^(it)xρ^(−it)=τ_(−βt)(x)`; `F(t)=ω̄(τ̄_(−βt)(b)a)`, `F(t+i)=ω̄(aτ̄_(−βt)(b))`; `Ω^Q=e^(−β(K+P)/2)/√Z_K`, `u_t=diag(1,e^(iβt))`, `Ad(u_t)∘τ_(−βt)=id` | holds | none (carried from the review of e2d8e4d) |
| 38 | CAR and permutations | f⊥g; σ=(1 2), τ=(2 3) on ℂ³; one-mode Bogoliubov | without √(n+1): `bb†g=‖f‖²g/2`; `U_σU_τe₁₂₃=e₃₁₂=U_(στ)e₁₂₃`, `V_(στ)e₁₂₃=e₂₃₁`; `uv=0` and `\|u\|²+\|v\|²=1` leave `λa` or `λa*` | holds | none (carried from the review of e2d8e4d) |
| 39 | Weyl and Fock | Schrödinger on ℝ²; h=ℂ, f=1, g=i; ξ with `\|ξ\|²=c/(1+\|λ\|⁵)` | BCH gives `e^(isx)e^(t∂)=e^(−ist/2)e^(isx+t∂)`; `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`, `W_F(i)W_F(1)=e^(i/2)W_F(1+i)`; vacuum variance ½ and fourth moment ¾; c=1/2.138=0.4677, second moment 0.618, fourth moment infinite | holds | none (carried from the review of e2d8e4d) |
| 40 | D9 values | Ising, λ=1, d=2; on-site h; d=1 | `M_λ=\|h\|+2\|J\|e^λ`, `M_(λ,2)=\|h\|+8\|J\|e^λ`, bound `(½)/(1+8e)=1/(2+16e)`; `p=log2coshβh`, `s−βe=p`; `p=−β`, `e=1`, `s=0` | holds | none (carried from the review of e2d8e4d) |

## Not verifiable

Unchanged from the previous review; the manifest records these as uncertified (paywalled), and they were not read:

- **Cuntz 1977, §1**, behind the sampled "Concrete Cuntz families" target and `cuntz_isSimpleRing`: checked by computation only (rows 20 and 23).
- **Bratteli–Robinson 2**, Theorems 5.3.30, 5.2.8, 5.4.4, 6.2.4, 6.2.18, 6.2.40, 6.2.42, Proposition 6.2.45 and §§5.2.1, 5.2.4, 5.2.5: checked on instances only (rows 21, 22, 37, 40).
- **Bratteli–Robinson 1, Renault 1980, Brown–Ozawa Proposition 5.1.3.**

Ownership against open pull requests was not re-run this round beyond `scratch/overlaps.md` and `scratch/citations.md`; the previous review's `roadmaps grep` results are carried.

## Source issues

- none

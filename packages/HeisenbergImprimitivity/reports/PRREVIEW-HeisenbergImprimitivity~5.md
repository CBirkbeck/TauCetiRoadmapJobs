# Review of HeisenbergImprimitivity (pull request #1149 at ea88c1a)
Folder: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/`
**Verdict:** needs changes

This is an incremental re-review of the 70 README lines changed since 950df62. `Suggested.lean` is unchanged. The new mathematics is correct: the §5.1 smooth-vector and inverse-closedness argument, its three new Checks, the σ_Θ coboundary Check of §3.1, the `contDiffAt_ringInverse` contract, and the D8 and CompactQuantumMetricSpaces sentences all recompute (table below). The changed Scope bullet restates this roadmap's ownership of `C*(L,c)`. Checked against the open heads, that ownership is contested twice.

## R01 (P2) — Two roadmaps claim `C*(L,c)` and the Schrödinger family: this one and the OperatorAlgebraDynamics revision

- **Location.** `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md` lines 21 and 30–38: "owns … the Schrödinger family, the Heisenberg cocycle …"; "the twisted group C*-algebra `C*(L,c)` … No roadmap on main owns the twisted group C*-algebra of a general 2-cocycle". Also §1.1 (lines 202–208) and §3.1 (lines 442–463).
- **Claim.** §1.1 builds the Schrödinger family on L²(M) for every locally compact abelian M, with its projective relation, adjoint phase and strong continuity. §3.1 builds the scalar twisted group C*-algebra: `ℓ¹(L,c)` with the `twistedMonoidAlgebra` comparison, `C*(L,c)`, `C*_r(L,c)` with `λ_c`, the universal property, the trace τ, the gauge action, and full = reduced. Both are presented as this roadmap's own.
- **Witness.** In the OperatorAlgebraDynamics README at the head of #1137 (2ccd93b), lines 37–45 declare it the "single owner" of exactly these objects (D1.CentralTwists, D2.CentralTwists; lines 683–685 give the family `(Π_(m,χ)ξ)(x)=χ(x)ξ(x+m)`). Lines 2924–2939 say that §3.1 here restates them.
- **Corroboration.** This pull request's description says it depends on #1137 "for the central twisted/scalar sector and general Schrödinger prefixes". The README consumes neither. The description, this README and that revision therefore name three different arrangements.
- **Repair.** Settle one owner and state it the same way in both READMEs and in this description. The supply direction already runs from OperatorAlgebraDynamics to this roadmap (D1–D2 are consumed here), and D1.CentralTwists/D2.CentralTwists are the general construction (locally compact G, central cocycles) of which §3.1 is the discrete abelian scalar case. So cite them:
  - §1.1 takes the Schrödinger family, `π_xπ_y=β(x,y)π_(x+y)`, the adjoint phase and strong continuity from D1.CentralTwists. It keeps β's bicharacter property, σ, its nondegeneracy, and the ℝ^k specialisation that `Suggested.lean` uses.
  - §3.1 takes `ℓ¹(L,c)`, the `twistedMonoidAlgebra` comparison, `C*(L,c)`, `C*_r(L,c)` with `λ_c`, the universal property, τ with Fourier uniqueness, the gauge action and full = reduced from D1.CentralTwists and D2.CentralTwists. It keeps the coboundary-isomorphism bullet, the gauge-invariant-ideal bullet and the Checks.
  - Rewrite the Scope bullet (lines 30–42), the "From TauCetiRoadmap.OperatorAlgebraDynamics" contract (lines 164–167, which now says "Only untwisted actions are assumed of it"), §3.1's and Layer 3's `*Needs:*`/Dependencies, and the Downstream consumers sentence on CompactQuantumMetricSpaces.
  - The merge-order paragraph names the OperatorAlgebraDynamics revision as a dependency.
- **Repair tested.** The conventions match, so the citation is exact. D1.CentralTwists' `Π` with `ω((m,χ),(n,ψ))=ψ(m)` is this README's `π_(m,χ)ξ(t)=χ(t)ξ(t+m)` with `β((m,χ),(n,ψ))=ψ(m)`. That revision's line 2936 quotes this README's `(λ_c(x)h)(y)=c(x,y−x)h(y−x)` verbatim.
- **Why not the reverse.** Keeping §3.1 as owner instead would require the revision to drop the scalar discrete case from its general construction and cite this roadmap. Meanwhile this roadmap cites its D1–D2, so the two roadmaps would cite each other.

## R02 (P2) — OperatorKTheory §7.5 builds `C*(ℤ^d,c)` a second time without citing an owner

- **Location.** `README.md` lines 30–36: "the twisted group C*-algebra `C*(L,c)` … The quantum tori `C*(ℤ^d,σ_Θ)` are the case L=ℤ^d". Also Downstream consumers (lines 812–820), which lists CompactQuantumMetricSpaces and no other builder of the ℤ^d case.
- **Claim.** This roadmap (merge position 10) owns `C*(L,c)` for every discrete abelian L, the ℤ^d case included. OperatorKTheory is at position 11, after it.
- **Witness.** OperatorKTheory README at the head of #866 (c0a811d), §7.5 lines 1561–1574: for L=ℤ^d and any normalised c, twisted shifts `W_xδ_z=c(x,z)δ_(x+z)`, "define C*(L,c)", faithful trace, gauge action, universal property via Fell absorption. Its `*Needs:*` (lines 1557–1559) cites no HeisenbergImprimitivity.
- **Repair.** OperatorKTheory §7.5 should take from the owner settled in R01 the following: the construction, the regular model, the faithful trace with Fourier uniqueness, the gauge action and the universal property (full = reduced). It keeps its own centre/simplicity theorem and the rotation-algebra identification. In this folder, the Downstream consumers section names OperatorKTheory §7.5 in the form of the CompactQuantumMetricSpaces sentence, citing the R01 owner. Without that line, this README's ownership statement and the second construction stand unreconciled.
- **Repair tested.** The objects coincide, so the citation drops in. At `h=δ_z`, `(λ_c(x)h)(y)=c(x,y−x)h(y−x)` is nonzero only at `y=x+z`, with value `c(x,z)`: that is `W_xδ_z`. §7.5's `τ(a)=⟨δ_0,aδ_0⟩` is §3.1's `τ(f)=f(0)`. Its rotation cocycle `exp(2πiθnm′)` is the cocycle `e(θnm')` of the §3.1 Check.

## Previous findings

- none — the previous report (at 950df62) raised no finding. One item from an earlier round stays settled: the child's `metadata.toml` (`topic = "math.OA"`). The parent `TauCetiRoadmap/HilbertModules/` is still not on main (main at eaf17b1 has no such folder), so the reason it was not actionable still holds; the person who merges the folder after HilbertModules deletes the file then.

## Verified sound

**Scope of this pass.** The diff touches only `README.md`: the Scope bullet (lines 30–42), one Mathlib contract (128–131), one new §3.1 Check (495–501), §5.1 (624–671, rewritten text and three new Checks), Layer 5 Dependencies (734) and Downstream consumers (816–820). `git diff --stat 950df62 HEAD` on the folder confirms that `Suggested.lean` is unchanged. Every passage and citation these lines add or depend on was rechecked below.

**Gate and dependency check.**
- The worker's gate at ea88c1a passes every check, `build = 0` included.
- I re-ran the gate as the brief instructs. Every text check passes (`set_option`, `latex`, `prnum`, `sorry-data`, `statement-hygiene`, `stray-files`, `outside-folder`, `metadata` and the rest are all 0). It reports `depcheck: NOT IN ORDER: HeisenbergImprimitivity`. That run reads the board's `merge-order/ORDER.txt`, which does not yet list this roadmap: its only difference from the candidate order is the line `HeisenbergImprimitivity` after `HilbertModules`. This is the worker's insertion, not a defect.
- The dependency check against the candidate order, run as the brief gives it, prints `depcheck: 240 roadmaps, 2433 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Positions: CStarAlgebras 8, HilbertModules 9, HeisenbergImprimitivity 10, OperatorKTheory 11, CompactQuantumMetricSpaces 210.
- The outside-folder diff against `origin/main`, excluding the folder and the family index, is empty.

**Lean.** On a scratch copy of `Suggested.lean`, `lake env lean` with `#check @name` for all 10 declarations gives exactly three `declaration uses 'sorry'` warnings (lines 82, 103, 112) and no other diagnostic. The elaborated types match `signatures.md` and the previous review:
- `fundamental_identity`, `exists_parsevalFrame` and `parsevalFrame_trace` each carry `[DiscreteTopology ↥L] [IsZLattice ℝ L]` in their own signature.
- `parsevalFrame_trace` ends in `= ZLattice.covolume L MeasureTheory.volume`.

The headline audit, form audit and one-tactic probe of the previous review carry over unchanged, since the file is unchanged. No change in the README adds a headline: S(L,c) and its inverse-closedness are intermediate targets of §5.1, and the docstring's not-statable list (S(M), `C*(L,c)`, the module completion) is still accurate at the pins.

**Library declarations opened at the pin.**
- `contDiffAt_ringInverse` (`Mathlib/Analysis/Calculus/ContDiff/Operations.lean` line 772, section `AlgebraInverse` with `[NormedRing R] [NormedAlgebra 𝕜 R]`) elaborates as `∀ 𝕜 [NontriviallyNormedField 𝕜] {n : WithTop ℕ∞} {R} [NormedRing R] [NormedAlgebra 𝕜 R] [HasSummableGeomSeries R] (x : Rˣ), ContDiffAt 𝕜 n Ring.inverse ↑x`. "C^n for every n" is right, ω included.
- `HasSummableGeomSeries` (`Mathlib/Analysis/SpecificLimits/Normed.lean` line 277) has the instance `[CompleteSpace R] : HasSummableGeomSeries R` at line 302, in the `NonUnitalNormedRing` section. So "every complete normed ring has it" is right, and C*(L,c) and its matrix algebras qualify.
- `Ring.inverse` (`Mathlib/Algebra/GroupWithZero/Units/Basic.lean` line 83) is the inverse at units and 0 elsewhere. On a gauge orbit of an invertible element every point is a unit, so the composite is the honest inverse.

**Source at the changed locator.** In `rieffel88`, lines 921–931 lie between the page markers at lines 892 (PDF page 24) and 935 (page 25); with printed page = PDF page + 256 they are on p. 280. They say:
- the dual action of 𝕋^n on `C*(ℤ^n, β̄)` has exactly `S(ℤ^n)` as its C^∞-vectors;
- likewise `S(D)` for `D = ℤ^n × F₀`;
- these Schwartz algebras are closed under holomorphic functional calculus;
- an element of `S(D,β)` invertible in `C*(D,β)` has its inverse in `S(D,β)`.

This supports §5.1 for every finitely generated L ≅ ℤ^r × finite. Rieffel uses the full dual group; the §5.1 Check justifies restricting to its identity component. The narrowed range (previously lines 919–930) now starts at the sentence that introduces the dual action. Lines 937–950 (Proposition 3.7, p. 281, with its inverse-closedness hypothesis on `B₀`) were re-read: §5.1's use of S(E) as `A₀` and S(D) as `B₀` meets that hypothesis by the inverse-closedness just proved.

**Cross-roadmap citations resolved.**
- OperatorAlgebraDynamics on main, D8 (heading at line 554; lines 582–585) states `W(f)W(g)=exp(−iσ(f,g)/2)W(f+g)` and `W(f)*=W(−f)`, with symplectic functoriality, the canonical trace, simplicity and regular representations. That is the Scope sentence's description.
- On main, D1–D2 have no 2-cocycle twist: the only "cocycle" hits in that README are at lines 311, 467, 476 and 548, all outside D1–D2. So "No roadmap on main owns…" is true of main; R01 concerns the open revision.
- CompactQuantumMetricSpaces at the head of #1155 (9647ef8), §6.0 (lines 1382–1440), consumes HeisenbergImprimitivity §3.1 at `L=ℤᵈ`, `c=σ_Θ` with `Θ₁₂=−θ`. It uses `λ_Θ(p)δ_q=σ_Θ(p,q)δ_(p+q)`, `α_z(W_p)=z^pW_p` and the coefficient trace. Its "Agreement with the supplier's convention" Check recomputes this README's `λ_c`. All four items of the Downstream consumers sentence are there.
- NoncommutativeGeometry N6 (main): `U₂U₁=e(θ)U₁U₂`, as the §3.1 Checks use.

**Ownership of the §5.1 inverse-closedness.**
- SmoothBanachRepresentations (#1145, 2e5d798), §8.1 line 492, states the general `smooth_inverse` for any Lie group action on a Banach algebra, by the same `contDiffAt_ringInverse` route. It is not in the candidate order and consumes AutomorphicFormsOnReductiveGroups (position 70), so it lands after this roadmap and cannot supply it.
- §5.1 states only the gauge-action special case, and the Scope bullet disclaims the general theory. This roadmap is therefore the owner of S(L,c) and its inverse-closedness, as a notion moved down. SmoothBanachRepresentations does not name this roadmap.
- `roadmaps grep` over main and all 466 open heads finds no other builder of a twisted group C*-algebra beyond R01 and R02. The twisted group algebras of TemperleyLiebOperatorAlgebras, ScatteringDiagrams and ClusterAlgebras are algebraic, not C*-completions.

**Adversarial table.** Rows for changed statements were computed in this pass. Rows marked "carried" are the previous review's, at 950df62, for statements this diff leaves untouched. Conventions: `e(t)=exp(2πit)`, `⟨ξ,η⟩=∫conj ξ·η`, `π_(m,χ)ξ(t)=χ(t)ξ(t+m)`, `β(x,y)=ψ_y(m_x)`, `σ=β·conj β∘flip`.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Scope: D8 Weyl algebra = `C*(V_d, exp(−iσ/2))` (new) | V=ℝ², σ(e₁,e₂)=1 | `c(f,g)=exp(−iσ(f,g)/2)` bilinear, hence a cocycle; `c(0,g)=1`; `c(−f,f)=exp(iσ(f,f)/2)=1`, so `δ_f^*=δ_(−f)`, matching `W(f)*=W(−f)`; `W(e₁)W(e₂)=exp(−i/2)W(e₁+e₂)=c(e₁,e₂)δ_(e₁+e₂)` | equal | none |
| Contract `contDiffAt_ringInverse` (new) | elaborated at pin | `{n : WithTop ℕ∞}`, `[NormedRing R] [NormedAlgebra 𝕜 R] [HasSummableGeomSeries R] (x : Rˣ)`; instance from `[CompleteSpace R]` at Normed.lean 302 | matches the contract | none |
| §3.1 σ_Θ Check: `σ_Θ=c·δu` (new) | general p,q; p=(1,0), q=(0,1) | `pᵀΘq=θ(p₂q₁−p₁q₂)`; `δu=exp(πiθ(p₁p₂+q₁q₂−(p₁+q₁)(p₂+q₂)))=exp(−πiθ(p₁q₂+q₁p₂))`; `c·δu=exp(πiθ(2p₂q₁−p₁q₂−q₁p₂))=σ_Θ`; `equivOfCoboundary` hypothesis `σ_Θ(x,y)u(x+y)=c(x,y)u(x)u(y)` holds | equal | none |
| §3.1 σ_Θ Check: products (new) | (1,0),(0,1) both orders | `σ_Θ((1,0),(0,1))=exp(−πiθ)`, times `u(1,1)=exp(πiθ)` gives 1 = `c((1,0),(0,1))=e(0)`; `σ_Θ((0,1),(1,0))=exp(πiθ)`, times `u(1,1)`, gives `e(θ)=c((0,1),(1,0))`; `u(1,0)=u(0,1)=1`; both commutators `e(θ)`; u≡1 leaves `exp(−πiθ)≠1` | equal; control right | none |
| §5.1 identity component (new) | L=ℤ^r×T, T finite | `Hom(L,ℝ)=ℝ^r` (t vanishes on T); `γ_t` trivial on T; image = `(L/T)^≅𝕋^r`, the identity component of `𝕋^r×T̂` | equal | none |
| §5.1 Fourier coefficient and derivative (new) | `a=Σa(y)δ_y` | `τ(aδ_x^*)=a(x)·conj c(−x,x)·c(x,−x)=a(x)`; `d^j/ds^j|₀ a(x)e(s·t(x))=(2πi t(x))^j a(x)`; `|τ(aδ_x^*)|≤‖a‖` since τ is a state | equal | none |
| §5.1 smooth vectors = S(L,c) (new) | L=ℤ×ℤ/2, t₁ = first coordinate | `|x|≤1+|t₁(x)|` (torsion bounded), so `(1+|x|)^N|a(x)|≤C·Σ_(j≤N)‖∂^j a‖`; conversely, for rapid a, `Σ_x|2πt(x)|^j|a(x)|<∞` (Σ(1+|x|)^(−2)<∞ on ℤ×ℤ/2), so the termwise series converge in ℓ¹ ⊆ C*(L,c) | both inclusions hold | none |
| §5.1 inverse-closedness via `Ring.inverse` (new) | a smooth and invertible | `α_t(a⁻¹)=α_t(a)⁻¹=Ring.inverse(α_t a)`; each `α_t a` is a unit; ContDiffAt at every t gives ContDiff; on `M_n`, the entrywise action and an equivalent norm give smooth vectors `M_n(S(L,c))`; `∂(a⁻¹)=−a⁻¹(∂a)a⁻¹` from `∂(aa⁻¹)=0` | holds | none |
| §5.1 Check `2δ_0+δ_1` (new) | n=0,1,2 | `min_(|z|=1)|2+z|=1` at z=−1; `b_n=(−1)^n2^(−n−1)`: ½, −¼, ⅛; coefficients of `(2δ_0+δ_1)b`: n=0: `2·½=1`; n=1: `−½+½=0`; n=2: `¼−¼=0`; support ℕ, infinite | equal | none |
| §5.1 negative control (new) | one-sided subalgebra | supports add, so `ℕ+ℕ⊆ℕ`; closed under rapid-decay seminorms; `δ_1δ_(−1)=δ_0`, with `δ_(−1)` outside | holds | none |
| §5.1 Check L finite (new) | L=(ℤ/2)²; nontrivial component | `2t(x)=t(2x)=0` gives `Hom(L,ℝ)=0`; dimension 4 = `Nat.card`, `≅M₂(ℂ)`; `α_(γ₀γ_t)=α_(γ₀)∘α_(γ_t)` with `α_(γ₀)` bounded linear | same set | none |
| Downstream consumers vs CompactQuantumMetricSpaces §6.0 (new) | x, δ_q; d=2 | `(λ_c(x)δ_q)(y)=c(x,y−x)δ_q(y−x)`, nonzero only at `y=x+q` with value `c(x,q)`, i.e. `λ_Θ(x)δ_q`; `σ_Θ(p,−p)=exp(−πi pᵀΘp)=1`; `α_z(δ_p)=z^pδ_p` is `α_γ` for `γ=z∈𝕋^d=(ℤ^d)^` | equal | none |
| §1.1 vs OperatorAlgebraDynamics D1.CentralTwists (#1137) | formula | `(Π_(m,χ)ξ)(x)=χ(x)ξ(x+m)`, `ω=ψ(m)` versus `π_(m,χ)ξ(t)=χ(t)ξ(t+m)`, `β=ψ(m)` | same object, two owners | R01 |
| §3.1 vs OperatorKTheory §7.5 (#866) | δ_z; trace; gauge | `W_xδ_z=c(x,z)δ_(x+z)=λ_c(x)δ_z`; `⟨δ_0,aδ_0⟩=a(0)=τ(a)`; `α_χ(W_y)=χ(y)W_y=α_χ(δ_y)` | same object, two owners | R02 |
| 1.1 `π_xπ_y=β(x,y)π_(x+y)`, β bicharacter | ℝ, x=(1,0), y=(0,1/2), (0,1/4) | `π_xπ_yξ(t)=e((t+1)/2)ξ(t+1)=−π_(x+y)ξ(t)`, `π_yπ_x=π_(x+y)`; y=(0,1/4): β=e(1/4)=i, convention `χ(t)ξ(t−m)` gives −i | equal, control separates | carried |
| 1.1 adjoint; Lean `schrodingerAdjoint` | x=(1,1/4) | both `i·e(−t/4)ξ(t−1)`; Lean body `e(−(s⬝(t−m)))ξ(t−m)` | equal | carried |
| 1.1 Lean `symplecticChar` | x=(m,s), y=(n,u) | `β(x,y)conj β(y,x)=e(u·m)e(−s·n)`; Lean `fourierChar(y.2⬝x.1−x.2⬝y.1)` | equal | carried |
| 1.1 σ nondegenerate; ℤ/2 | `σ(x,·)≡1` | `ψ(m)=1 ∀ψ ⇒ m=0`; `χ(n)=1 ∀n ⇒ χ=1`; `σ((1,χ₀),(0,χ₁))=χ₁(1)=−1` | true | carried |
| 1.2 annihilators | `aℤ×bℤ`; `ℝ×{0}`; ℤ/2 | `D^⊥=(1/b)ℤ×(1/a)ℤ`; `L^⊥=L`; `D^⊥=D` | equal | carried |
| 1.3 `L^⊥=J⁻¹L^∨`, covolumes | `L=Pℤ²`, `P=[[2,1],[0,1]]` | `covol(J⁻¹L^∨)=covol(L)⁻¹`, det J=1; covolumes 2 and 1/2 | equal | carried |
| 1.3 finite F masses | F=ℤ/2 | `c_D=|F|/|D|`, `|D||D^⊥|=|F|²`; product 1 | equal | carried |
| 2.1 Checks | 𝕋, ℤ, F | `1_[0,1/2)` coefficients ~1/n; `|n|³/(1+n²)` unbounded; `|F|·id` | true | carried |
| 2.2 Gaussian coefficient | `g=2^(1/4)e^(−πt²)` | `⟨g,π_(m,s)g⟩=e^(−π(m²+s²)/2)e(−sm/2)`; `‖g‖₂²=1` | equal | carried |
| 2.3 transport `F_sF(e)=𝓕F(−Je)` | e=(n,u); Gaussian `e(m)`, e=(0,1) | `−Je=(−u,n)`; `F_sF(0,1)=e^(−4π)`; `𝓕F(Je)=1` | equal; control right | carried |
| 2.3 Poisson Checks | `ℤ×2ℤ`; ℤ/2, D=G; k=0 | `θ(1)θ(4)` vs `(1/2)θ(1/4)θ(1)`, `θ(1/4)=2θ(4)`; `2·(1/2)ΣF=ΣF`; `F(0)` | equal | carried |
| 2.4 `fundamental_identity`; Checks | `ℤ×2ℤ`, k=0 | left `θ(1)θ(4)`, right `(1/2)θ(1/4)θ(1)`; with `schrodinger` odd terms flip; k=0 both `conj(η)ξζ` | equal; control right | carried |
| 3.1 involution, unitarity | δ_x | `δ_x^*δ_x=1` needs `c(x,−x)=c(−x,x)`, the cocycle at (x,−x,x) | consistent | carried |
| 3.1 universal property via `lift`; coboundary bullet | V c-projective; u | `V_0=1`; `c'(x,y)u(x+y)=c(x,y)u(x)u(y)` ⇔ `c'=c·δu`, from the c'-algebra to the c-algebra | equal | carried; ownership R01 |
| 3.1 Checks | (ℤ/2)²; ℤ² `e(θnm')`; c≡1 | Pauli X,Z anticommute, dimension 4; `U₂U₁=e(θ)U₁U₂`, reversed −θ; `C(𝕋)` | equal | carried |
| 3.1 gauge-invariant ideals | L=ℚ, c=1 | ideals of `C(ℚ̂)` invariant under the transitive action: 0 and all | holds | carried |
| 3.2 actions and pairings | a=δ_f; x=(1,0), y=(0,1/4) | `π_eπ_f^*=conj β(e−f,f)π_(e−f)`; `conj β(x,y)=−i` vs `β(y,x)=1` | equal | carried |
| 3.3 positivity, Checks | ℤ/2, D=0; Gaussian | `⟨δ_0,δ_0⟩_A` acts as 2p, `τ_A=1`; `Σ|⟨g,π_eg⟩|²=θ(1)²` | equal | carried |
| 4.1 `‖ξ‖₂≤‖ξ‖_A`; faithfulness | ℤ/2, D=0; M=ℤ | `√2>1`; `δ_0−δ_1` killed by `a↦Σa(n)`, `a(0)` gives 2 | consistent | carried |
| 4.2 fullness; Example | `D=ℤ×θ⁻¹ℤ` | `E=θℤ×ℤ`, `UV=e(1/θ)VU` | sound | carried |
| 5.1 frames: A-frame = Parseval; Checks | `(1/2)ℤ×ℤ`; `ℤ×ℤ`; k=0; n=0 | `∫Σ|g(t+n/2)|²|f|²=‖f‖₂²`; `1_[0,1)` not Schwartz; g=1; n=0 forces ‖f‖=0, so `∃n` not vacuous | equal | carried |
| 5.2 `parsevalFrame_trace`, trace formula | window at `(1/2)ℤ×ℤ`; index 2 | `‖g‖₂²=1/2=covol`; both sides double; `τ_A(p)=c_E=1/c_D` | equal | carried |
| 5.3 rephasing, Fourier, dilation | `u=e(m⬝s)`; x=(1,0) | `β'=conj β(y,x)`, `σ'=σ`; `F₊π_xξ=e(−s)F₊ξ`; `(am,s/a)` | equal | carried |
| 6.1 Checks | ℤ/3; `2ℤ×(1/3)ℤ`; ℝ×ℤ/2 | `|E|=3`, dimension 1; `c_E=3/2`, n≥2; covolume `1/2=1/c_D` | equal | carried |
| 6.2 embedding | q=1; q=2; a=0 | covolume `q|ab|`; parameter 3/2, covolume 2; `φ(0,q)=0` | equal | carried |
| 6.3 dictionary, single window | `E_θ`, N7 | `δ_(1,0)=U₂`, `δ_(0,1)=U₁⁻¹`, `U₂U₁=e(θ)U₁U₂`; `τ(p)=θ` | equal, N7 matched | carried |

**Policy and shape of the changed lines.**
- Unicode mathematics and no LaTeX delimiters.
- No process words, pull-request numbers or round labels.
- The one new backticked library name (`contDiffAt_ringInverse`) exists at the pin, and no new own Lean name was introduced (the worker's `roadmaps resolve` found none missing).
- §5.1 keeps its `*Needs:*`, now with the Mathlib name, and Layer 5's Dependencies list it.
- The three new §5.1 Checks discriminate: the first refutes the finitely supported algebra, the second refutes "rapid decay suffices", and the third pins the identity-component choice.

## Not verifiable

- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 24.10 (README §1.2): `uncertified` in the manifest (paywalled); cited by its locator only. Its line is unchanged.
- The published JFAA version of Austad–Enstad 2020 is behind a Springer paywall. Propositions 3.5 and 3.7 were checked earlier in arXiv 1904.10826v2, the version the manifest records; those lines are unchanged.

## Source issues

- none

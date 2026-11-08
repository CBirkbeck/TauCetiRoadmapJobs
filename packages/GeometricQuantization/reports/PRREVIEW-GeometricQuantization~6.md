# Review of GeometricQuantization (pull request #1186 at 663f762)

**Verdict:** needs changes

Full re-review: the folder changed by 184 lines since b7f61a5. The repair deleted the companion file but copied its fourteen declarations into `Suggested.lean`. The gate, re-run at this head, now fails because one supplier the README cites is on the project's dropped list. Two findings block acceptance (R01, R02) and two are P3 (R03, R04).

## R01 (P2) — The gate fails: ten citations of the dropped HamiltonianSystems roadmap

**Location.** `TauCetiRoadmap/GeometricQuantization/README.md` lines 30, 49, 132, 134, 332, 400, 447, 458, 807, 847. For example, line 134: "HamiltonianSystems Layer 1 supplies the contraction and Poisson conventions, Layer 2 the Hamiltonian dynamics, and Layer 3 the moment-map Lie cocycle."

**Claim.** HamiltonianSystems is on the project's dropped-names list. It is not on main and it is not in the merge order. Pinned Tau Ceti has no Hamiltonian-vector-field or Poisson-bracket declaration. As a result, the Conventions, §2.1, §2.3 and §4.2 take `ι_(X_f)ω=df`, the Poisson bracket and its laws, and the moment-map Lie cocycle from a supplier that will never merge. The README's other citation for this convention, LieGroupoidsPoisson §G4.2a, is itself only an adapter for HamiltonianSystems' predicate. The depcheck nevertheless reports 0 problems.

**Witness.** My gate at 663f762: `dropped=10 … FAIL`, one hit per line above (the worker's earlier record shows `dropped=0`). A grep for `hamiltonian` over pinned `TauCeti/` finds no Hamiltonian-field API.

**Repair.** Repoint every mention to owners that are on main:
- The symplectic Poisson bracket: LieGroupoidsPoisson §G4.2 (a nondegenerate π is the same as a symplectic ω, through `π♯=−(ω♭)⁻¹`).
- The Hamiltonian homomorphism: LieGroupoidsPoisson §G4.3 (`π♯d{f,g}=[π♯df,π♯dg]`). Write `X_f:=−π♯df`; this gives `ι_(X_f)ω=df` and `[X_f,X_g]=−X_{ {f,g} }`.
- Hamiltonian flows: DifferentialGeometry Layer 3.
- Moment maps and their group defect: HamiltonianReduction R1, whose defect θ has derivative `c_μ`.
- In §2.3, prove here that `c(ξ,η)` is locally constant and a Lie-algebra 2-cocycle, as a deduction from §G4.3 and the antihomomorphism `ξ↦ξ_M`.
- In the Conventions and in the supplier heading at line 132, replace §G4.2a by §§G4.2–G4.3.
- In §4.2, label the closure and module statements as deductions from §G4.3 and the involutivity of P. As written, §4.2 cites nothing.

I checked this repair on the plane:
- §G4.2's Check (for `ω=dx∧dp`, `π♯dx=∂_p` and `{x,p}=1`) and §G4.3's Check (`π♯dx=−X_x` with `X_x=−∂_p`) reproduce this README's values `X_q=−∂p`, `X_p=∂q`, `{q,p}=1`.
- With `π♯d{f,g}=[π♯df,π♯dg]`, the identity `[X_f,X_g]=−X_{ {f,g} }` holds.

After the change the gate must report `dropped=0`.

## R02 (P2) — §2.3: the kernel that controls descent must be the covering kernel

**Location.** README.md:413–417: "The action projects to the original left action on M. Its kernel K acts by a circle character χ; descent to G holds iff χ is trivial. Construct Ĝ=(G̃×Circle)/{(k,χ(k)⁻¹):k∈K}".

**Claim.** As written, K is the kernel of the G̃-action on M. §2.3 assumes only that M and G are connected and nonempty, so the action need not be effective. When it is not, K is strictly larger than ker(G̃→G). Then "descent iff χ is trivial" is false, and Ĝ is an extension of G̃/K, not of G. The SO(3) Check and §3.1 both use the covering kernel, which is what the construction needs.

**Witness.** Circle acting trivially on a point, ω=0, μ≡ℏ: G̃=ℝ, lift `p↦p·exp(−it)`. The action kernel is ℝ and χ(t)=exp(−it)≠1, yet χ(2π)=1, so the action descends. §3.2's Check gives the character z at moment 1, ℏ=1.

**Repair.** Replace the passage with: "Let F=ker(G̃→G), which is discrete and central. F acts by a circle character χ, and descent to G holds iff χ is trivial on F. Construct Ĝ=(G̃×Circle)/{(f,χ(f)⁻¹):f∈F}." Add the point example as a negative-control Check. I checked the new wording on both examples:
- Point example: F=2πℤ and χ(2π)=exp(−2πi)=1, so the action descends.
- SO(3) Check, unchanged: F={±I} and χ(−I)=(−1)^k.

## R03 (P3) — Delete the fourteen character wrappers from `Suggested.lean`

**Location.** `TauCetiRoadmap/GeometricQuantization/Suggested.lean:59`–151. Line 65 reads: "stabilizer, coroot-period and flag dictionaries are specified in Q2A and S3P."

**Claim.** The block contains:
- six `def`s that only rename Mathlib operations;
- eight theorems closed by `rfl`, `Iff.rfl` or extensionality;
- a second free-form `/-! -/` block written in process language.

No headline uses any of them, and none of the 14 names appears in the README. README:37–38 says these operations "are Mathlib operations, not new character wrappers." The label "S3P" exists in no roadmap. The previous review's repair said to delete the companion file and not to move the declarations here.

**Witness.** I restated each wrapper on the native operations and closed it in one step; all elaborated with exit 0:
- `MonoidHom.mem_ker` (`Mathlib/Algebra/Group/Subgroup/Ker.lean:249`)
- `QuotientGroup.lift_mk` (`Mathlib/GroupTheory/QuotientGroup/Defs.lean:253`)
- `QuotientGroup.lift_comp_mk'` (`Mathlib/GroupTheory/QuotientGroup/Defs.lean:262`)
- `rfl`
- `simp [DFunLike.ext_iff]` on `(AddMonoidHom.compHom' j).ker`

**Repair.** Delete lines 59–151, the whole `section HomogeneousCharacters` block. The result is byte-identical to `Suggested.lean` at b7f61a5, and `lake env lean` elaborates it with exit 0 and no output. The character Checks stay in README §3.1.

## R04 (P3) — Two supplier contracts misdescribe or leave unnamed what they consume

**Location.** README.md:119–120, "§3.5's smooth parameter-dependent flows", and README.md:426–427, "smooth parameter-dependent manifold flows from DifferentialGeometry 3.5". Also README.md:1130–1132, "consume the native identification with honest weight spaces and its integral-support theorem".

**Claim.**
- DifferentialGeometry §3.5 on main is about time-dependent flows, not dependence on a parameter.
- The two Tau Ceti theorems that §6.3 consumes are described but not named.

**Witness.**
- DifferentialGeometry README on main, line 400: "**3.5 Time-dependent flows** (`exists_timeDependentFlow`) [Lee, Thm. 9.48]".
- The pinned names are `TauCeti.formalCharacter_coeff_eq_finrank_weightSpace` and `TauCeti.isIntegralWeight_of_formalCharacter_coeff_ne_zero`, in `TauCeti/Algebra/Lie/Weights/FormalCharacter.lean` at lines 485 and 493.

**Repair.**
- Cite DifferentialGeometry §3.1 (joint smooth dependence, with the parameter adjoined as a constant coordinate) and §3.2.
- Cite Tau Ceti `ODE.exists_contDiffAt_picard_solution` in `TauCeti/Analysis/ODE/SmoothParameter.lean`.
- Drop §3.5; this roadmap uses no time-dependent flow.
- Name the two theorems in §6.3 and in its `*Needs:*` line.

## Previous findings

- **R01 of b7f61a5 (delete the companion file): not repaired.** `HomogeneousCharacterTargets.lean` is gone, but its 91 lines reappear verbatim inside `Suggested.lean`. This is this report's R03.
- **R02 of b7f61a5 (add a `sources.toml` to the folder): withdrawn.** No roadmap folder on main carries a `sources.toml` (0 found under `TauCetiRoadmap/`). The gate's stray-files rule treats any non-roadmap file in the folder as a defect whose repair is deletion. The source manifest belongs to the board package, not to the roadmap folder, so the folder is right to have none.
- No repair report marks a finding "not actionable in this package"; nothing is re-raised.

## Verified sound

**Gate, dependencies and elaboration.**
- My full gate run at 663f762: every counter is 0 except `dropped=10` (R01). My invocation prints no build field.
- Dependency check, complete output: `depcheck: 243 roadmaps, 2457 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. GeometricQuantization is at line 150 of the merge order, right after LieGroupoidsPoisson.
- `lake env lean` on `Suggested.lean` from the worktree root: exit 0, no output, 10 s. There is no `sorry`, so no warning is expected.
- Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.

**`#check @` comparison.** I elaborated `#check @` for all 14 declarations in one scratch copy. No binder was lost: each def carries `[Group G] [TopologicalSpace G]` or `[AddCommGroup Q] [AddCommGroup Y]` as its type needs. None has a README statement to compare with; that is part of R03. The worker's signature file attributes the last five declarations to the parent namespace; they are in fact in `…GeometricQuantization.HomogeneousCharacters`.

**Library declarations opened at the pins.**

| Declaration | File:line | What is used |
|---|---|---|
| `CovariantDerivative` | Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:365 | structure exists |
| `jacobiTheta₂`, `summable_jacobiTheta₂_term_iff`, `jacobiTheta₂_add_left`, `jacobiTheta₂_add_left'` | Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean:251, 123, 384, 390 | summability iff `0<im τ`; z+1 law |
| `LieAlgebra.IsKilling.rootSystem`, `…exists_isSl2Triple_of_weight_isNonZero` | Mathlib/Algebra/Lie/Weights/RootSystem.lean:411; Killing.lean:555 | under `CharZero`, `IsKilling`, splitting Cartan |
| `ContinuousMonoidHom.comp`, `MonoidHom.ker`, `QuotientGroup.lift`, `continuous_quot_lift` | ContinuousMonoidHom.lean:152; Ker.lean:238; QuotientGroup/Defs.lean:249; Topology/Constructions.lean:729 | as in the supplier contract |
| `TauCeti.SmoothTwoForm.IsSymplectic` | TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:92 | closed and nondegenerate |
| `TauCeti.fourierChar`, `TauCeti.fourierRep` | TauCeti/RepresentationTheory/Compact/Circle.lean:126, 142 | value is `fourier n`, i.e. `exp(2πinx/T)`; frequency `2πn/P` as §6.3 says |
| `TauCeti.formalCharacter` and the two theorems of R04 | TauCeti/Algebra/Lie/Weights/FormalCharacter.lean:156, 485, 493 | hypotheses `IsAlgClosed`, `CharZero`, `IsKilling`, Cartan, as §6.3 states |
| `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul` | TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean:115 | the native Stone theorem that SelfAdjointSpectralTheory SA-A22 consumes |
| `ODE.exists_contDiffAt_picard_solution` (file) | TauCeti/Analysis/ODE/SmoothParameter.lean | smooth dependence on a parameter |

**Cross-roadmap citations resolved.** These are on main unless marked as an open head.

| Citation | Where | Outcome |
|---|---|---|
| SmoothBundlesConnections B1.4, B2.1, B2.2, B2.4, B3.1, B4.1, B5.0, B5.2, B6.2–B6.5 | headings at lines 421–1780 | exist. B6.3 gives Chern–Weil and the integral criterion; B6.5 gives the H¹(M;ℝ/ℤ) torsor; B2.2 gives density of C_c^∞ sections |
| DifferentialGeometry §0.4, §1.4, Layer 3, Layer 4/§4.3, §5.4, Layers 5–8 | lines 294–845 | exist; §3.5 is R04 |
| LieGroupoidsPoisson §G4.2, §G4.2a, §G4.3 | lines 1181–1258 | exist; the R01 repair targets them |
| CotangentLagrangian C1; HamiltonianReduction R1, R2, R2a, R3 | SymplecticGeometry sub-roadmaps | exist. R1 defines the group defect, whose derivative is the dropped roadmap's cocycle (hence the R01 repair) |
| ConvexityToric T1, T3, T4 | main, and the open revision head | exist. At that head "T1–T5 denote these same five layers" (line 133), and the ‖μ‖² semiflow is still in Layer 3 (line 434). Applying T3 to the torus moment map μ−ξ gives the translated flow |
| OperatorTheory SelfAdjointSpectralTheory Part A | SA-A21 von Neumann criterion; SA-A22 `(U(t)ψ−ψ)/(it)` generator | matches §2.2's convention |
| ComplexKahlerGeometry K1–K7.2 | K3 line 437 (locally bounded extension); K5b.1 line 1208; K6.0/K6.1; K7.2 lines 1444–1517 | exist. K7.2 has the polynomial basis, `binomial(n+k,n)` and the complex torus, and assigns the theta sections to this roadmap (line 1516) |
| ComplexComparisonPartII C0.3, C1.7–C1.9, C5.1, C5.4 | open head; merge-order line 43 | exist. C5.4 has the exponential-sequence connecting map; C1.8 has analytic Serre vanishing |
| IndexTheory I6, I7.3, I8 items 2–4 | open head; merge-order line 11 | exist. I7 item 3 is Dolbeault; I8 item 4 is the section convention `(g·s)(x)=g_E s(g⁻¹x)`; item 3 is the isolated case |
| PseudodifferentialOperators P1, P2; Orbifolds O1–O5, O4-T/O4-W/O4-S; AlgebraicTopology Stages 4–6 | main | exist |
| RepresentationTheory CompactGroups; LieGroups Layers 0–9; LieHighestWeight Layer 0 | main | exist (Layer 7 complexification, Layer 8 Borel–Weil) |
| SchubertGeometry S9 items 1 and 7 | main | exist. The open revision says the ordinary Picard and forgetful maps "belong to GeometricQuantization §§3.3–3.4" |

**Ownership.** I searched main and every open head by object: prequantum line, Bohr–Sommerfeld, Kostant lift, half-density, Kodaira embedding, quantization commutes with reduction. No other roadmap owns these objects. ComplexKahlerGeometry K7.2 assigns the torus theta sections here. No other roadmap owns the equivariant positive-line embedding; §6.2 owns it and cites Demailly for the non-equivariant theorem. QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups uses KKS only through HamiltonianReduction R2. The overlap tool reports no dropped ids. "SchubertGeometry, Part II" is a downstream consumer that SchubertGeometry's revision also plans; it is not a dependency.

**Sources at the sampled locators.** Each source was fetched through the sources service into a scratch manifest; page numbers are printed pages.

| Target | Locator | Found at | Outcome |
|---|---|---|---|
| 1.1 | Schottenloher v15.6 (Aug 27, 2025), Ex. 7.3 and Rem. 7.4, pp. 96–97 | schottenloher lines 3994, 4011 | exact-potential trivial line with curvature dA=ω; exact ω is quantizable. Supports the statement after the stated conjugation |
| 2.1 / 2.2 | Thm 7.8 p. 99; Prop 7.10 p. 101; Props 7.15–7.16 p. 105 | lines 4103, 4171, 4342, 4352 | Dirac conditions; lift preserving α; symmetric operator; complete X_F gives essential self-adjointness |
| 2.3 | Tuynman v2, Thm 7.9, p. 39 | tuynman line 1920 | unique global left action for complete even fields, connected and simply connected group |
| 3.1 / 3.4 | Graham–Vogan, Ex. 5.8, p. 25 | graham-vogan line 1083 (OCR) | relation (gh,v)~(g,τ(h)v), same as README's L_λ |
| 3.2 | Graham–Vogan, Def. 6.4, p. 37 | line 1623 | `ρ(exp Y)=χ(f(Y))`; README takes the one-dimensional case with χ=exp(it/ℏ) |
| 3.3 | Demailly V §11 p. 267; VI §9.1 eq. (9.1) p. 314 | demailly lines 13167, 15569 | Pic=H¹(X,𝒪^×) (11.2); exponential sequence with c₁ for connected compact Kähler |
| 4.1 | Schottenloher Def. 9.8 p. 125, Def. 10.1 p. 141; Demailly V (11.3), (12.1), pp. 267–268 | lines 5064, 5745; demailly 13179, 13221 | integrable maximal isotropic distribution; ∇_X s=0; canonical (0,1)-connection; Chern connection |
| 4.2 | none | — | elementary deductions, recomputed below; R01's repair labels them |
| 5.2 | ComplexKahlerGeometry K7.2 | main lines 1444–1460 | polynomial dictionary and binomial dimension |
| 5.3 / 4.3 | Schottenloher Def. 11.4, Prop. 11.5, pp. 167–168 | lines 6877, 6894 | Bohr–Sommerfeld variety; polarized sections vanish off it |
| 6.2 | Demailly VII Thm 13.1 pp. 358–359, Cor. 13.3, Thm 14.1 p. 359 | lines 17562, 17617, 17625 | positive implies jets surjective for k≥C(m+1); ample iff positive; Kodaira criterion |
| 6.3 | Tau Ceti declarations | table above | as stated |
| 6.3a | Meinrenken v2, (3)–(5), p. 2; Vergne v1 §3 p. 4, Thm 3.2 p. 5 | meinrenken lines 55–67; vergne lines 159, 208 | fixed-component formula with `det(I−(g♯)⁻¹e^(−iF/2π))`; delocalized RR and `Θ_M(k)~k^d Σ k^(−n) DH_n` |
| 6.4 | Vergne Thm 3.2 p. 5 | vergne line 208 | k^(−d)Θ_M(k)→DH₀, and `(2iπ)^(−d)∫e^{iΩ}` gives (2π)^(−d)ω^d/d! |
| 6.5 / 6.9 | Meinrenken Thm 2.1 p. 5; (17)–(21) pp. 6–7 | lines 181, 219–240 | regular-value multiplicity formula; sector phases and arithmetic polynomials |
| 6.6 / 6.7 | Sjamaar v1 Prop. 2.2 p. 19, Thm 2.8 p. 22, §2.2 (2.3) p. 24, Prop. 2.11 pp. 24–25, Thm 2.15 pp. 27–28 | sjamaar lines 1000, 1155, 1233–1254, 1264, 1439 | semistable set with analytic complement; regular quotient is an orbifold; section action `−∇+2πiΦ`; V-line; Γ(M₀)≅Γ(M^ss)^G≅Γ(M)^G |
| 6.8 | Ma–Marinescu v1 §5.2, (5.12), Thm 5.4, p. 33 | ma-marinescu lines 1540, 1605, 1608 | as cited |
| 6.11 | ComplexKahlerGeometry K7.2 | main | direct counts, below |

**Adversarial table.** Each row gives the instances and the values computed on each side. "Agrees" means both sides match.

| Statement | Instances and values | Result |
|---|---|---|
| Conventions: `ι_(X_f)ω=df`, `{f,g}=df(X_g)` | ω=dq∧dp: `ι_(−∂p)ω=dq`, `ι_(∂q)ω=dp`; {q,p}=dq(∂q)=1=ω(−∂p,∂q) | agrees |
| Conventions: line and connection | θ=p dq: dθ=−ω, a=dt−θ/ℏ, da=ω/ℏ; ∇=d+iθ/ℏ gives F=−iω/ℏ, so F(∂q,∂p)=−i/ℏ and c₁=[iF/2π]=[ω/2πℏ] | agrees |
| 1.1 holonomy and integrality | ∮β=ℏ/2 gives exp(−i/2); ∮β=2πℏ gives 1; area 2πℏk gives Chern number k; area πℏ gives 1/2, rejected | agrees |
| 2.1 lifts (headline) | ℏ=1: Y_q=∂p+q∂t, Y_p=−∂q, [Y_q,Y_p]=∂t=Y₁. F_q=−∂p+q∂t, F_p=∂q+2p∂t, bracket −2∂t−∂t=−3∂t=F_(−1)−2V. `L_F a=(df+ι_Hω)/ℏ` vanishes iff H=−X_f | agrees |
| 2.2 operators (headline) | ℏ=1: Q_q q=q², Q_p q=i−pq+pq=i; Q_q(i)=iq, Q_p(q²)=2iq; commutator −iq=−iℏQ₁q | agrees |
| 2.2 complete flow | f=c: U_t=exp(itc/ℏ), (U_t−1)/(it)→c/ℏ=Q_c/ℏ | agrees |
| 2.2 deficiency on the half-line | +i: u=e^{q/ℏ}, not L²; −i: u=e^{−q/ℏ}, ‖u‖²=ℏ/2; indices (0,1) | agrees |
| 2.3 defects | translations: c={q,p}−0=1, central bracket −1/ℏ. SO(3): SU(2) kernel acts by (−1)^k (k=1: −1; k=2: +1) | agrees |
| 2.3 kernel (R02) | trivial Circle on a point, μ≡ℏ: action kernel ℝ, χ(t)=e^{−it}≠1, but χ(2π)=1 and the action descends | false as written; R02 |
| 3.1 Checks | H=μ₂: sign character sends −1↦−1; S₃: ker sgn=A₃ of order 3 | agrees |
| 3.1a su(2) brackets | H₀A₀−A₀H₀=[[0,2i],[2i,0]]=2B₀; A₀B₀−B₀A₀=2H₀; B₀H₀−H₀B₀=2A₀; exp(2πH₀)=I, exp(πH₀)=−I | agrees |
| 3.1a / 3.4 SO(3) values | KKS at r e₃: ω(−re₂,re₁)=r, so ω=dA/r and area 4πr. r=½: μ(2Z)=1, area/2π=1, phase −1. r=1: 2, 2, +1 | agrees |
| 3.2 integrality | ℏ=1, r=½: λ(exp tZ)=e^{it/2} is not 2π-periodic; Circle point orbit with moments 0, 1, ½ gives 1, z, rejected | agrees |
| 3.3 Picard (sampled) | ℂP¹ degree matrix (1); SU(3)/T identity; (0,q) weights are sums of q roots with strictly signed pairing, never 0; elliptic curve h^{0,1}=1, Chern map not injective | agrees |
| 3.4 forgetful map | SO(3): a↦⟨a,α∨⟩=2a, image 2ℤ; SU(2): a↦a. U(2): (1,1)↦0, (0,−1)↦1, central −I acts by (−1)^{−1}=−1. U(3): O(1) phase e^{−2πi/3}, O(3) phase 1 | agrees |
| 4.1 T*ℝ | ω(∂p,∂p)=0, rank 1; ∇_∂p q=0, ∇_∂p p=1 | agrees |
| 4.2 observables (sampled) | X_{p²}=2p∂q, [2p∂q,∂p]=−2∂q; Q_{p²}(1)=iℏ·2ip²/ℏ+p²=−p², ∂p(−p²)=−2p≠0. X_{qp}=q∂q−p∂p, [X_{qp},∂p]=∂p∈P. Module law: [aX_f+fX_a,Y] lies in P using Y(a)=0, X_a∈P^ω=P and involutivity | agrees |
| 5.1 half-densities | q↦2q gives factor √2, squared 2; v=q∂q: L_v^{1/2}φ=qφ′+φ/2; U_tφ(q)=φ(q−t), and d/dt=−φ′=(i/ℏ)(iℏφ′) | agrees |
| 5.2 dimensions (sampled) | binomial(2,1)=2, binomial(3,1)=3, binomial(4,2)=6, binomial(k,0)=1 | agrees |
| 5.3 torus (sampled) | cocycle ratio e^{−2πik}; at τ=i, k=1: h(z+i)/h(z)=e^{−4πy−2π} and \|e_τ\|²=e^{4πy+2π}. For general τ, the product of h-ratio and \|e_τ\|² is e^{−4πky−2πkt}·e^{2πkt+4πky}=1. Chern form 2πik(y/t)dz, curvature (πk/t)dz∧dz̄=−2πik dq∧dp=−iω/ℏ. q-holonomy e^{−2πi(kp+α)}. Fourier: c_{m+k}=e^{2πi(m+α)τ−2πiβ+πikτ}c_m | agrees |
| 4.3 / 5.3 leaves | k=2, α=0: p∈{0,½}; p=¼ gives −1; α=½ gives {¼,¾}; k=1, α=½ gives p=½ | agrees |
| 6.1 weights | ℂP¹, weights (0,2): x^{n−b}y^b has weight −2b; twist by 1 gives n−2b | agrees |
| 6.2 embedding (sampled) | [x:y]↦[x²:xy:y²] has degree 2. Thresholds (2,4,1), m=3, k≥4: 12=3·4, 13=3·4+1, 14=3·4+2 | agrees |
| 6.3 characters (sampled) | `fourier n` = exp(2πinx/P): P=2π gives frequency 1, P=1 gives 2π; frequency ½ gives e^{iπ}=−1; (1,−1) gives 1 at (2π,0) and (0,2π) | agrees |
| 6.3a RR (sampled) | u=e^{−2it}: 1/(1−u)+u/(1−u⁻¹)=(1−u²)/(1−u)=1+u; at t=π/2 the value is 0; at t=0, ∫(1+c)²=2. Degree count: Td_{T,j}(X/n) with exp(nω/2π) gives n^{d−j}. O(n): n⁻¹χ_n(1)=1+1/n. Point: χ_n=e^{in⟨κ,X⟩} | agrees |
| 6.4 limit (sampled, headline) | ℂP¹ (0,2): mass (n+1)/n = 1.1, 1.01, 1.001 at n=10, 100, 1000; density 1/2. ℂP² O(1): binomial(n+2,2)/n² = 0.66, 0.5151, 0.5015 → ½ = ∫c²/2 | agrees |
| 6.5 / 6.8 orbifold index | [pt/μ₂]: (1+1)/2=1 and (1−1)/2=0; Ann(H_B) has index \|H_B\| because restriction X*(T)→Hom(H_B,S¹) is onto; normal factor 1−e^{−iπ}=2; nε−C₀ is 0 at n=6 and ½ at n=7 | agrees |
| 6.6 potential (sampled) | ℂP¹ (0,1), n=2, λ=−1: κ=2log cosh a gives 0, 0, 2 at a=0. Formula: 2mn·g(X,X) with g(X,X)=2r/(1+r)²=½ at r=1 gives 2. Dual weights {−1,0,1} at generic points; unstable at y=0 | agrees |
| 6.7 Kostant bound (headline) | xy, r=¼: ‖s‖²=4/25, η=3/10, 4·2·(9/100)·(4/25)=72/625. Direct check: dr/dt=4rη=3/10 and d‖s‖²/dr=(1−r)/(1+r)³=48/125, product 72/625. Maximum on r=1 is ¼≥4/25 | agrees |
| 6.9 quasi-polynomial (sampled, headline) | (0,1,2), n=6: C(2)=C(3)=2; leading terms 6·(1/6)=1 and 6·(1/4)=3/2; errors 1 and ½. Points on {x₁=0} have μ₂ isotropy on 0-dimensional strata, so the O(1) error depends on parity | agrees |
| 6.10 support transport | T² on ℂP¹: (−j,nb) with β=(0,b) gives −j; with β=(1,b) gives −j−n, and adding nβ returns (−j,nb) | agrees |
| 6.11 counts (sampled) | Enumerated n=0,1,2,3,6,10,25 against both formulas for j∈[−3n−5,3n+5]: all equal. n=2 (0,1,−2): {−4,−2,−1,0,1,2}; n=3: 0 twice, eight others once, total 10 | agrees |
| Suggested.lean (R03) | 14 declarations, each closed in one step by `rfl`, `MonoidHom.mem_ker`, `QuotientGroup.lift_mk`, `lift_comp_mk'` or `simp [DFunLike.ext_iff]` | padding; R03 |

**Headline theorems and statability.** The headlines are:
- §2.1–2.2: intrinsic lift, commutator, complete-flow essential self-adjointness.
- §2.3: circle extensions.
- §§3.1–3.4: homogeneous line/character equivalence, coadjoint integrality, Pic_hol(K/H)≃P_I, forgetful map.
- §§4.2–4.3: observable algebra, Bohr–Sommerfeld.
- §§5.1–5.3: Schrödinger, projective and theta quantizations.
- Layer 6: distribution limit, shifted Kostant bound and H⁰ isomorphisms, regular [Q,R]=0, uniform chamber estimate.

The module docstring names each with its missing carrier: prequantum circle bundle and associated line, L² sections, homogeneous lines, compact root data, flag Picard classes, polarized and half-density sections, holomorphic H⁰, equivariant Dolbeault, reduced orbifold line.

I considered stating the theta dimension k through the automorphy model (entire functions with the two §5.3 factors). I accept the docstring's position: the headline concerns the line on ℝ²/ℤ², and the automorphic description is a coordinate presentation that §5.3 itself derives. Nothing statable is missing. After R03, the file again states nothing and its docstring explains why.

**Shape.** Every layer ends with Examples and Dependencies. Each sampled subsection has API bullets, at least three Checks and a `*Needs:*` line. There are no LaTeX delimiters, pull-request numbers, pin hashes, local paths or round labels. The only Lean names are in the supplier contracts.

## Not verifiable

- Kostant, Woodhouse, Śniatycki, Kodaira, Cannas da Silva and Meinrenken–Sjamaar are listed as background references without locators and are cited at no claim, so I fetched none of them this round. Earlier rounds recorded Kostant and Śniatycki as uncertified, Woodhouse as returning HTTP 403, and Kodaira as a JSTOR landing page only.
- I read ComplexComparisonPartII through the roadmaps tool at its open head; no checkout was supplied.

## Source issues

- **Error** in schottenloher at Proposition 7.16 proof, printed p. 105 (schottenloher line 4361): the source says multiplying the flow operators by −2π gives a unitary group; it should be the time reparametrization Φ_(−2πt); affects the proof.
- **Gap** in schottenloher at Proposition 7.16 proof, printed p. 105 (schottenloher line 4378): the source says one self-adjoint extension gives essential self-adjointness; it should use the invariant dense domain as a core; affects the proof.
- **Misprint** in ma-marinescu at §5.2 before equation (5.12), printed p. 33 (ma-marinescu lines 1583–1585): the source says ω is √−1 R^L/π; it should be √−1 R^L/(2π), as in line 1593; affects nothing.
- **Misprint** in graham-vogan at §7 after Proposition 7.2, printed p. 39 (graham-vogan line 1727): the source says Proposition 6.4 follows from Proposition 7.2; it should be Proposition 6.5, whose proof was deferred; affects nothing.
- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source says H¹(X,𝒪)≃H^{0,1} by (V-11.6); it should be (V-11.5), since 11.6 is notation; affects nothing.
- **Misprint** in demailly at proof of VII Theorem 13.1, printed p. 359 (demailly line 17604): the source says the section h with divisor E lies in O(E)⁻¹; it should lie in O(E), as the twist by h^(−(m+1)) requires; affects the proof.
- **Error** in sjamaar at Proposition 2.11 proof, printed p. 24 (sjamaar lines 1276–1278): the source says averaging over H⁰ gives H^ℂ-invariance; it should be (H⁰)^ℂ-invariance, with the finite component action kept separately; affects the proof.
- **Gap** in sjamaar at Theorem 2.15 proof, printed p. 28 (sjamaar line 1487): the source says F∞x lies in G^ℂx and s(F∞x)=s(x); it should use only the orbit closure, and continuity with monotone norm for nonvanishing; affects the proof.

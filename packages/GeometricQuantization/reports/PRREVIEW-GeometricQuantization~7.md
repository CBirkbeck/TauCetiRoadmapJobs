# Review of GeometricQuantization (pull request #1186 at bcc5698)

**Verdict:** needs changes

This is a full re-review: the folder changed by 287 lines since 663f762. Three of the previous four findings are repaired. The fourth, R01, is repaired in substance: the dropped roadmap is gone and the replacement Tau Ceti API is the right one. But that API exists only at the Tau Ceti pin on main, not at the pin this branch carries. Two findings remain, both P3, and neither blocks.

## R01 (P3) — The nine new Tau Ceti citations exist only at main's Tau Ceti pin

**Location.** `TauCetiRoadmap/GeometricQuantization/README.md` lines 30–33, 50–59, 125–140, 375–377, 442–448, 509–512, 879 and 922. For example, lines 30–32: "Hamiltonian vector fields, the symplectic Poisson bracket, infinitesimal actions, moment maps and the moment cocycle are already in Tau Ceti".

**Claim.** The branch's `lake-manifest.json` pins Tau Ceti `a91d3aa`, unchanged since the merge base. At that pin, none of the following exist:
- the nine declarations `TauCeti.SmoothTwoForm.{IsHamiltonianVectorField, hamiltonianVectorField, poissonBracket, IsNondegenerate.hamiltonianVectorField_poissonBracket, IsMomentMap, momentCocycle, IsMomentMap.momentCocycle_eq, IsMomentMap.momentCocycle_mem_twoCocycle}` and `TauCeti.InfinitesimalAction`;
- the four files the README names for them.

Main bumped the pin to `2fd255d` in commit a891cd1. There every declaration exists, with the hypotheses the README states.

Two related claims are also wrong at this pin:
- Line 57 says `TauCeti.SmoothTwoForm I M` is "DifferentialGeometry 0.4's generic smooth degree-two form". That is true only at `2fd255d`, where it is an `abbrev` for `SmoothForm I M ℝ 2`. At `a91d3aa` it is a standalone structure.
- Lines 120–121 place `TauCeti.SmoothTwoForm` in `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`. At both pins it is declared in `TauCeti/Geometry/Manifold/TwoForm/Basic.lean`.

**Witness.** At this head, a grep of `.lake/packages/TauCeti/TauCeti` for `hamiltonianVectorField|IsMomentMap|InfinitesimalAction` returns nothing. At main's pin the declarations are at:
- `Hamiltonian/Manifold.lean`:124, 179, 338
- `Hamiltonian/Bracket.lean`:182
- `Hamiltonian/MomentMap.lean`:133, 388, 505, 542
- `VectorField/InfinitesimalAction.lean`:83

**Repair.**
- Merge `origin/main` into the branch, so that `lake-manifest.json` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. Then re-run the gate and `lake env lean` on `Suggested.lean`.
- Replace lines 120–121 with: "Use `TauCeti.SmoothTwoForm` in `TauCeti/Geometry/Manifold/TwoForm/Basic.lean` and `TauCeti.SmoothTwoForm.IsSymplectic` in `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`".

**How I checked the repair.** I resolved all 34 distinct backticked library names of the README at main's pins, and every one exists. I opened the nine new declarations there and compared their hypotheses with the README; see the library table below. `Suggested.lean` imports only `Mathlib` and states nothing, so the new pin cannot break it. I did not elaborate it at the new pin, because this review may run Lean only in this worktree.

## R02 (P3) — The module docstring does not name §2.3's headline

**Location.** `TauCetiRoadmap/GeometricQuantization/Suggested.lean`:11–17, the two Layer 2 bullets. The first begins: "Layer 2: intrinsic Hamiltonian lifting and the prequantum commutator need the prequantum principal circle bundle".

**Claim.** §2.3 proves three results:
- a Hamiltonian action lifts through the simply connected cover G̃;
- the lift descends to G exactly when χ is trivial on the covering kernel F;
- a non-equivariant moment map integrates to a smooth circle extension with bracket `([ξ,η],−c(ξ,η)/ℏ)`.

These are a headline: the Summary lists "lifts of Hamiltonian symmetries", and the previous review's headline list included "§2.3: circle extensions". They are not statable at either pin. But the docstring must name each non-statable headline together with its missing carrier, and the two Layer 2 bullets cover only §2.1 and §2.2.

**Witness.** At both Tau Ceti pins, the declarations grep for `Prequantum|PrincipalBundle|PrincipalConnection|CircleBundle` returns nothing. The only related API at `2fd255d` is the Lie-algebra `momentCocycle`, which is not the group-level extension.

**Repair.** Insert, after line 17:

```text
* Layer 2: lifting a Hamiltonian group action to the prequantum bundle, the
  descent criterion on the kernel of the universal covering, and the smooth
  circle extension integrating a non-equivariant moment cocycle need the
  prequantum principal circle bundle and its group of connection-preserving
  bundle automorphisms; a Lie-algebra moment cocycle alone does not supply them.
```

I made this edit on a scratch copy and elaborated it with `lake env lean`: exit 0, no output.

## Previous findings

- **R01 of 663f762 (dropped HamiltonianSystems): partly repaired.**
  - What was fixed:
    - Lines 30–33 now read "Hamiltonian vector fields, the symplectic Poisson bracket, infinitesimal actions, moment maps and the moment cocycle are already in Tau Ceti".
    - The gate reports `dropped=0`, and a grep for `HamiltonianSystems` or `legacy` in the README returns nothing.
    - §4.2 now labels the closure and module laws as deductions (lines 876–897), as requested.
  - The §G4.1/§G4.2 contract is correct:
    - G4.1 installs the Lie algebra on the smooth functions of a Poisson manifold (LieGroupoidsPoisson README lines 1156–1157).
    - G4.2 gives `π♯=−(ω♭)⁻¹` (line 1186).
    - With G4.1's `β(π♯α)=π(α,β)`, I get `π(df,dg)=−dg((ω♭)⁻¹df)=−ω(X_g,X_f)=ω(X_f,X_g)`, which is the Tau Ceti bracket.
  - What remains: the replacement names resolve only at main's pin. That is this report's R01.
- **R02 of 663f762 (covering kernel): repaired.** Lines 464–468 now read "Let F be the kernel of this covering … Descent of the action to G holds iff χ is trivial on F". The point negative control was added at lines 501–505. I recomputed it: μ≡ℏ gives `χ(2π)=exp(−2πi)=1` (descends), and μ≡ℏ/2 gives `exp(−πi)=−1` (does not descend).
- **R03 of 663f762 (fourteen wrappers): repaired.** `Suggested.lean` has 59 lines, an empty namespace and no declarations.
- **R04 of 663f762 (misdescribed contracts): repaired.**
  - DifferentialGeometry §3.5 is replaced by §§3.1–3.4 (lines 157–160, 481–483, 1416–1418). On main, §3.1 is joint `C^(n+1)` dependence on time and initial condition, §3.2 maximal flows, §3.3 completeness, §3.4 commuting flows (main lines 375–399).
  - `ODE.exists_contDiffAt_picard_solution` is named, and its README description (finite dimension, `C^(n+1)` at the base point, vanishing near the base state, finite n) matches `SmoothParameter.lean`:207.
  - The two formal-character theorems are named at lines 1209–1213. Their hypotheses (`CharZero`, `IsKilling`, Cartan, `IsAlgClosed` for the first, `IsTriangularizable` for the second) match `FormalCharacter.lean`:476–493.
- No repair report marks a finding "not actionable in this package", so nothing is re-raised.

## Verified sound

**Gate, dependencies and elaboration.**
- My gate at bcc5698: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Dependency check, complete output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- Merge order: GeometricQuantization is at line 152, right after LieGroupoidsPoisson (151). ComplexComparisonPartII is at 39 and IndexTheory at 10.
- `lake env lean TauCetiRoadmap/GeometricQuantization/Suggested.lean`: exit 0, no output, 7 s.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.
- `#check @` comparison and one-tactic padding probe: `Suggested.lean` declares nothing, so there is nothing to compare or probe. The worker's signature file says the same.

**Library declarations opened.** Each was opened at the PR pin (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`) and at main's pin (`1b1ccf4`, `2fd255d`).

| Declaration | File:line | What the README uses |
|---|---|---|
| `TauCeti.SmoothTwoForm.IsHamiltonianVectorField`, `hamiltonianVectorField`, `poissonBracket` | `Geometry/Symplectic/Hamiltonian/Manifold.lean`:124, 179, 338 (main pin only) | `σ(X,v)=df(v)`; `X_f=(σ♭)⁻¹df`; `{f,g}=σ(X_f,X_g)` |
| `…IsNondegenerate.hamiltonianVectorField_poissonBracket` | `Bracket.lean`:182 (main pin only) | `X_{ {f,g} }=−[X_f,X_g]` for closed, nondegenerate σ, `FiniteDimensional ℝ E` and C² functions |
| `TauCeti.InfinitesimalAction` | `VectorField/InfinitesimalAction.lean`:83–91 (main pin only) | linear map to smooth fields with `toLinearMap ⁅Z,Z'⁆ = −mlieBracket …` |
| `…IsMomentMap`, `momentCocycle`, `momentCocycle_eq`, `momentCocycle_mem_twoCocycle` | `MomentMap.lean`:133, 388, 505, 542 (main pin only) | cocycle `σ(Z_M,Z'_M)−μ_{⁅Z,Z'⁆}`; constant under `PreconnectedSpace` and closedness (with `CompleteSpace E`); a 2-cocycle with trivial coefficients |
| `TauCeti.fundamentalVectorField`, `mlieBracket_fundamentalVectorField` | `Geometry/Lie/FundamentalVectorField.lean`:83, 248 (main pin) | supplies, with HamiltonianReduction R1, §2.3's "fundamental fields form an `InfinitesimalAction`" |
| `TauCeti.SmoothTwoForm`, `IsSymplectic` | `Manifold/TwoForm/Basic.lean`:61 (structure) / :37 (abbrev); `Symplectic/Manifold/TwoForm.lean`:92 / :115 | closed and nondegenerate (R01 locator) |
| `ODE.exists_contDiffAt_picard_solution` | `Analysis/ODE/SmoothParameter.lean`:207 / :215 | as in the R04 repair |
| `TauCeti.formalCharacter` and its two theorems; `TauCeti.fourierChar`, `TauCeti.fourierRep` | `FormalCharacter.lean`:156, 485, 493; `RepresentationTheory/Compact/Circle.lean`:126, 142 | as §6.3 states |
| `VectorField.mlieBracket_smul_left`, `VectorField.leibniz_identity_mlieBracket` | `Mathlib/Geometry/Manifold/VectorField/LieBracket.lean`:505, 1153 | `[fV,W]=−(df W)V+f[V,W]`; `[U,[V,W]]=[[U,V],W]+[V,[U,W]]`, as §4.2 uses them |
| `QuotientGroup.lift`, `lift_mk`, `lift_comp_mk'`; `ContinuousMonoidHom.comp`; `MonoidHom.ker`; `continuous_quot_lift` | `QuotientGroup/Defs.lean`:249, 253, 262; `ContinuousMonoidHom.lean`:152; `Subgroup/Ker.lean`:238; `Topology/Constructions.lean`:729 | character restriction and descent |
| `CovariantDerivative`; `jacobiTheta₂` and its three laws; `LieAlgebra.IsKilling.rootSystem`, `exists_isSl2Triple_of_weight_isNonZero`; `LieSubalgebra`; `LinearPMap` | `CovariantDerivative/Basic.lean`:365; `TwoVariable.lean`:251, 123, 384, 390; `RootSystem.lean`:411; `Killing.lean`:555; `Subalgebra.lean`:45; `LinearPMap.lean`:41 | exist at both pins |

**Cross-roadmap citations resolved this round.**

| Citation | Where | Outcome |
|---|---|---|
| SmoothBundlesConnections B1.4, B2.1, B2.2, B2.4, B3.1, B4.1, B5.0, B5.2, B6.2–B6.5 | main, lines 421–1780 | all exist; line 151 pins the dual-character prequantum convention the README uses |
| DifferentialGeometry 0.4, 1.4, Layer 3 (3.1–3.4), 4.3, 5.4 | main, lines 294, 325, 371–399, 463, 524 | exist and match the contracts |
| LieGroupoidsPoisson §G4.1, §G4.2 | main, lines 1144, 1181 | exist; sign computation in "Previous findings" |
| HamiltonianReduction R1, R2, R2a, R3 | main lines 33, 127, 157, 187; also at the open SymplecticGeometry-family head | exist; R1 defines θ with `dθ₁(η)(ξ)=c_μ(ξ,η)` (line 53) |
| ConvexityToric T1, T3, T4 | main; at the open revision head the labels "T1–T5 denote these same five layers" | exist |
| ComplexKahlerGeometry K3, K4, K5b.1, K6, K7.2 | main; K7.2 at line 1444 | K7.2 proves `binomial(n+k,n)` and assigns the torus theta sections here |
| ComplexComparisonPartII C0.3, C1.7, C1.8, C1.9, C5.1, C5.4 | open head (read with the roadmaps tool) | all six headings exist; its consumer list names this roadmap's §3.3 for C5.4's exponential sequence |
| IndexTheory I6, I7.3, I8.2, I8.3, I8.4 | open head, lines 1205, 1359, 1560, 1579, 1601 | exist |
| LieGroups Layers 0–8, LieHighestWeight Layer 0, CompactGroups Layers 0 and 6 | main | exist (Layer 7 complexification, Layer 8 Borel–Weil) |
| SchubertGeometry S9 items 1 and 7; Orbifolds O4/O5 | main lines 107–122; Orbifolds lines 296–367 | exist |

**Sources at the sampled locators.** Each source was fetched through the sources service into a scratch manifest. Page numbers are printed pages.

| Target | Locator | Found at | Outcome |
|---|---|---|---|
| 2.1 | Schottenloher v15.6, Thm 7.8 p. 99; Prop 7.10 p. 101 | schottenloher lines 4103, 4171 | Dirac conditions with factor `i/2π`; the natural lift preserves α, and every α-preserving field is a lift. Supports the comparison after the stated conjugation |
| 2.3 | Tuynman v2, Thm 7.9 p. 39 | tuynman line 1920 | unique global left action for complete even generators on a connected, simply connected group. His `X_M` uses `exp(−tX)` (line 24), a homomorphism, so the README's sign translation is right |
| 3.3, 3.4 | Demailly V §11 p. 267; VI §9.1 eq. (9.1) p. 314 | demailly lines 13167, 15569 | Pic=H¹(X,𝒪^×) (11.2); exponential sequence on a connected compact Kähler manifold |
| 4.3 | Schottenloher Def. 11.4, Prop. 11.5, pp. 167–168 | schottenloher lines 6877, 6894 | Bohr–Sommerfeld variety for a reducible polarization; polarized sections vanish off it |
| 5.2, 6.11 | ComplexKahlerGeometry K7.2 | main, lines 1451–1452, 1516–1517 | polynomial dictionary and dimension |
| 6.3a | Meinrenken v2 (3)–(5) p. 2; Vergne v1 §3 p. 4 | meinrenken lines 55–67; vergne lines 159–179 | fixed-set formula with `det(I−(g♯)⁻¹e^{−iF/2π})`; delocalized RR `(2iπ)^{−d}∫e^{iΩ(X)}Todd(X)` |
| 6.4 | Vergne Thm 3.2 p. 5 | vergne line 208 | `Θ_M(k)∼k^dΣk^{−n}DH_n`, with `⟨Θ(k),f⟩=Σm(λ,k)f(λ/k)` and `g^λ=e^{i⟨λ,X⟩}` (lines 23, 54–57) |
| 6.5, 6.9 | Meinrenken Thm 2.1 p. 5; (17)–(21) pp. 6–7 | meinrenken lines 181–199, 219–240 | large-m orbifold formula; m=1 for abelian G; sector phases and arithmetic polynomials |
| 6.1, 6.6 | Sjamaar v1 Prop. 2.2 p. 19; Thm 2.8 p. 22; §2.2 (2.3) p. 24; Prop. 2.11 pp. 24–25 | sjamaar lines 1000–1012, 1155–1160, 1245–1254, 1264 | semistable set with analytic complement; regular level gives an orbifold; `ξ·s=−∇s+2π√−1Φ_ξs`; V-line; §2.2 assumes the complexified action, as §6.6 says |
| 3.1a, 6.10 | none (deductions) | — | recomputed below |

**Adversarial table.** Each row gives the instances and the values computed on each side. "Agrees" means both sides match.

| Statement | Instances and values | Result |
|---|---|---|
| Conventions, new Check: `[X_f,X_g]=−X_{ {f,g} }` | ω=dq∧dp, f=q², g=p: X_f=−2q∂p, X_g=∂q, [X_f,X_g]=2∂p; {f,g}=ω(−2q∂p,∂q)=2q, X_{2q}=−2∂p | agrees with the Tau Ceti `Bracket.lean`:182 sign |
| Conventions: `{q,p}`, `Q_p` | X_q=−∂p, X_p=∂q, {q,p}=ω(−∂p,∂q)=1=dq(X_p). ∇=d+ip dq/ℏ gives Q_p=iℏ∂q−p+p=iℏ∂q, and [Q_q,Q_p]ψ=−iℏψ | agrees |
| §G4.2 bracket = Tau Ceti bracket | `π(df,dg)=dg(π♯df)=−dg(X_f)=ω(X_f,X_g)`; on the plane both give 1 | agrees |
| 2.1 lift (headline) | ℏ=1, a=dt−p dq: Y_q=∂p+q∂t, Y_p=−∂q, [Y_q,Y_p]=∂t=Y₁; L_{Y_q}a=dq−dq=0. F_q=−∂p+q∂t, F_p=∂q+2p∂t, bracket −2∂t−∂t=−3∂t=F_{−1}−2V. `L_Fa=(df+ι_Hω)/ℏ`, zero iff H=−X_f; for H=+X_f it is (2/ℏ)df | agrees |
| 2.2 operators (headline) | ℏ=1: Q_q q=q², Q_p q=i, commutator iq−2iq=−iq. Half-line: +i gives e^{q/ℏ} (not L²), −i gives e^{−q/ℏ} with norm² ℏ/2; indices (0,1) | agrees |
| 2.3 lift (headline) | `[−Y_ξ+sV,−Y_η+tV]=Y_{μ^[ξ,η]}+(c/ℏ)V`, the image of `([ξ,η],−c/ℏ)` under the anti-homomorphism. Translations: c={q,p}=1, central bracket −1/ℏ. Point: μ≡ℏ gives χ(2π)=1; μ≡ℏ/2 gives −1. SO(3) degree k: (−1)^k, so −1 at k=1 and +1 at k=2 | agrees |
| 3.1 characters | L_λ: h·[e,z]=[e,λ(h)z], so evaluation gives λ. μ₂: trivial and sign both have derivative 0, values 1 and −1. S₃: \|A₃\|=3 | agrees |
| 3.1a su(2) brackets | [H₀,A₀]=((0,2i),(2i,0))=2B₀; [A₀,B₀]=H₀−(−H₀)=2H₀; [B₀,H₀]=A₀−(−A₀)=2A₀; exp(2πH₀)=I, exp(πH₀)=−I | agrees |
| 3.1a / 3.2 SO(3) periods (headline) | area 4πr. r=½, ℏ=1: area/2π=1, μ(2Z)=1, phase e^{iπ}=−1, stabilizer weight ½ (no character). r=1: 2, 2, +1. `ℓ_ν(ι(y))=⟨ν,y⟩` from ν(exp(2πtι(y)))=e^{2πit⟨ν,y⟩} | agrees |
| 3.2 KKS curvature | da=⟨μ₀,[θ,θ]⟩/(2ℏ) gives da(ξ,η)=μ₀([ξ,η])/ℏ=ω(ξ_M,η_M)/ℏ; ι_{ξ_M}ω=dμ^ξ, since η_M(μ)(X)=μ([X,η]) | agrees |
| 3.2 point orbit | Circle with exp(t)=e^{it}: moments 0, 1 give characters 1, z; moment ½ gives e^{iπ}≠1 at t=2π | agrees |
| 3.3 Picard (headline) | ℂP¹: matrix (1), c₁(O(k))=k. SU(3)/T: identity. (0,q) weights are sums of q roots of one strict sign, pairing ≠0 for q≥1. Elliptic curve h^{0,1}=1, so the Chern map is not injective | agrees |
| 3.4 forgetful map | SO(3) a↦2a: kernel 0, image 2ℤ. U(2) [e₂]: (1,1)↦0, (0,−1)↦1, −I∈SU(2) acts by (−1)^{−1}=−1. U(3): O(1) phase e^{−2πi/3}, O(3) phase 1. SU(2) [e₂]: diag(z,z⁻¹) acts on O(k) by z^k, matching b=−k | agrees |
| 4.2 observables (new deductions) | p preserves ∂p; X_{p²}=2p∂q, [2p∂q,∂p]=−2∂q. X_{qp}=q∂q−p∂p, [X_{qp},∂p]=∂p. Jacobi: [[X_f,X_g],Y]=[X_f,[X_g,Y]]−[X_g,[X_f,Y]]∈P. Module: [aX_f+fX_a,Y]=a[X_f,Y]−Y(a)X_f+f[X_a,Y]−Y(f)X_a, each term in P | agrees |
| 4.3 leaves | k=2, α=0: exp(−2πi(kp+α)) is 1 at p=0 and ½, −1 at p=¼; α=½ gives p∈{¼,¾}; v=−v forces v=0 | agrees |
| 5.1 flow | U_tφ(q)=φ(q−t), d/dt=−φ′=(i/ℏ)(iℏφ′). Group law: ∫₀ᵗ+∫_t^{t+s}=∫₀^{t+s} | agrees |
| 5.2 dimensions | binomial(2,1)=2, binomial(3,1)=3, binomial(4,2)=6, binomial(k,0)=1; −I acts by (−1)^k | agrees |
| 5.3 theta (headline) | cocycle ratio e^{−2πik}=1 (−1 at k=½). c_{m+k}=e^{2πi(m+α)τ−2πiβ+πikτ}c_m, derived from the two laws. h-ratio·\|e_τ\|²=e^{−4πky−2πkt}·e^{2πkt+4πky}=1. Curvature (πk/t)dz∧dz̄=−2πik dq∧dp=−iω/ℏ | agrees |
| 6.1 weights | ℂP¹ (0,2), O(n): 0,−2,…,−2n; twist by 1 gives n,…,−n | agrees |
| 6.2 thresholds | m=3, k≥4: 12=3·4, 13=3·4+1, 14=3·4+2 | agrees |
| 6.3a RR (sampled) | u=e^{−2it}: 1/(1−u)+u/(1−u⁻¹)=1+u, fixed-point eigenvalues e^{2it}, u; t=π/2 gives ½−½=0; t=π gives 2. Rescaling: Td_{T,j} of type (2a,b) with exp(nω/2π) gives n^{d−a−b}=n^{d−j}; j=0 is (2π)^{−d}∫e^{i⟨μ,X⟩}ω^d/d!. Equivariant closedness: d_X(ω/2π+i⟨μ,X⟩)=i dμ^X−iι_{X_M}ω=0 | agrees |
| 6.4 limit (headline) | ℂP¹ (0,2): mass (n+1)/n = 1.1, 1.01, 1.001 at n=10, 100, 1000; density ½. ℂP² O(1): binomial(n+2,2)/n² = 0.66, 0.5151, 0.5015 → ½=(2π)^{−2}(2π)²/2 | agrees |
| 6.5 admissible coset | doubled ℂP¹: κ_B=1, coset 2ℤ, index 2=\|μ₂\|. [pt/μ₂]: (1+1)/2=1 and (1−1)/2=0 | agrees |
| 6.6 potential (sampled) | ℂP¹ (0,1), n=2, λ=−1, [1:1]: κ=2log cosh a, with value 0, derivative 2tanh a=4(μ+½) (since μ=−1/(1+e^{2a})), Hessian 2=2·1·2·g, where g=2r/(1+r)²=½ at r=1 | agrees |
| 6.7 Kostant bound (headline) | ∇_{JX}s=−nη s gives d‖s‖²/dt=4n‖η‖²‖s‖². xy at r=¼: ‖s‖²=4/25, η=3/10, rate 72/625. Directly: (1−r)/(1+r)³·4rη=72/625. Maximum ¼ on r=1, and 4/25≤¼ | agrees |
| 6.8 orbifold index (headline) | nε−C₀ is 0 at n=6 and ½ at n=7; normal factor 1−(−1)=2; O(n)⊗K⁻¹ has degree n+2 | agrees |
| 6.9 quasi-polynomial (headline) | (0,1,2), n=6: C(2)=C(3)=2; leading terms 1 and 3/2; errors 1 and ½ | agrees |
| 6.10 support transport | T² on ℂP¹: weights (−j,nb). β=(0,b) gives −j; β=(1,b) gives −j−n, and adding nβ=(n,nb) recovers (−j,nb). X_*(K⁰) is primitive, so restriction is onto | agrees |
| 6.11 counts | Enumerated n=0,1,2,3,6,10,25 for j∈[−3n−5,3n+5]: 0 mismatches with either closed form. n=2 (0,1,−2): {−4,−2,−1,0,1,2}. n=3: 0 occurs twice, eight others once, total 10. Density areas ½ and 1/3+1/6 | agrees |
| `Suggested.lean` | no declarations; the docstring names 13 headlines; §2.3 is absent (R02) | R02 |

**Headline theorems and statability.** The headlines are:
- §2.1–2.2: intrinsic lift and commutator; complete-flow essential self-adjointness.
- §2.3: lifted actions, covering descent and circle extensions.
- §§3.1–3.4: homogeneous line/character equivalence, coadjoint integrality, Pic_hol(K/H)≃P_I, the forgetful map.
- §§4.2–4.3: polarized operators and Bohr–Sommerfeld leaves.
- §§5.1–5.3: Schrödinger, projective and theta quantizations.
- Layer 6: positive-line bridge, distribution limit, Kostant bound and H⁰ isomorphisms, regular [Q,R]=0, uniform chamber estimate.

I searched both Tau Ceti pins for prequantum, principal-bundle, principal-connection, polarization, half-density and holomorphic-line-bundle carriers and found none, so the docstring's "not statable" claims hold at both pins. I considered the theta dimension through the automorphy model again and keep the previous round's position: §5.3 pins the automorphy law as a presentation of the torus line, which is the missing carrier. With the Tau Ceti API at `2fd255d`, §4.2's bracket closure becomes statable, but it is a three-line Jacobi deduction and not a headline. Nothing statable is missing; R02 is the only docstring gap.

**Ownership and overlaps.**
- `roadmaps grep` over main and every open head for prequantum, Bohr–Sommerfeld, polarized section, half-density and "quantization commutes with reduction" finds no second owner. ComplexKahlerGeometry (main line 493) and SmoothBundlesConnections (main line 1925) name this roadmap as the consumer.
- The overlap tool reports no pull request changing this roadmap and no dropped or revision-only id.
- HamiltonianReduction's open head keeps R1/R2/R2a/R3, and ConvexityToric's keeps T1–T5 as layer aliases.
- The only roadmap-level suppliers are on main or earlier in the merge order.

## Not verifiable

- **Graham–Vogan** (§§3.1, 3.2, 3.4, 5.1). I fetched it from the author page through the sources service. Its text layer is glyph names; OCR is not installed here and PDF page rendering is unavailable. Its locators (Ex. 5.8 p. 25, Def. 6.4 p. 37, Def. 5.5 and (5.7) pp. 23–25) are unchanged since the previous round, which read them by OCR. I did not re-read them this round.
- **Ma–Marinescu** (§6.8) is not in this round's sample and was not fetched.
- **Kostant, Woodhouse, Śniatycki, Kodaira, Cannas da Silva and Meinrenken–Sjamaar** are background references without locators and support no claim. I did not fetch them.
- **Elaboration at main's pin** is outside this review's allowed Lean commands. R01's repair is tested by resolving names, not by building.

## Source issues

- **Error** in schottenloher at Proposition 7.16 proof, printed p. 105 (schottenloher line 4361): the source says multiplying the flow operators by −2π gives a unitary group; it should be the reparametrized flow Φ at time −2πt; affects the proof.
- **Gap** in schottenloher at Proposition 7.16 proof, printed p. 105 (schottenloher line 4378): the source says having one self-adjoint extension yields essential self-adjointness; it should argue that the invariant dense domain is a core; affects the proof.
- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source says H¹(X,𝒪)≃H^{0,1} by (V-11.6); it should cite (V-11.5), since (11.6) is a notation item; affects nothing.
- **Misprint** in demailly at proof of VII Theorem 13.1, printed p. 359 (demailly line 17604): the source says the section h with divisor E lies in 𝒪(E)⁻¹; it should lie in 𝒪(E); affects the proof.
- **Error** in sjamaar at Proposition 2.11 proof, printed p. 24 (sjamaar lines 1276–1278): the source says averaging over H⁰ gives an H^ℂ-invariant section; it should say (H⁰)^ℂ-invariant, as the next sentence uses; affects the proof.
- **Gap** in sjamaar at Theorem 2.15 proof, printed p. 28 (sjamaar line 1487): the source says F∞x lies in G^ℂx, so s(F∞x)=s(x); it should use only the orbit closure, with continuity and the monotone norm giving nonvanishing; affects the proof.

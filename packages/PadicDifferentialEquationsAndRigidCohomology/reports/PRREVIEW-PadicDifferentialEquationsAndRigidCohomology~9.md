# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at b19bbff)

**Verdict:** needs changes

## R01 (P2) — RD.3.43 is stated over noetherian schemes, but its objects and its source need finite type

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:6830`: “Let `X` be a noetherian scheme over a perfect field `k` of characteristic `p` and `E` a convergent F-isocrystal on `X`”. Line 6832: “Noetherian base”.

**Claim:**
- This roadmap defines convergent F-isocrystals only on `k`-schemes of finite type, and the cited source proves the theorem only for those.
- For a noetherian `X` that is not of finite type, such as `Spec k⟦t⟧`, the theorem quantifies over a category the roadmap never defines.

**Witness:**
- §RD.3.33, line 6501: “Let `X` be a `k`-scheme of finite type.”
- arXiv:1606.01321v6 (Kedlaya, *Notes on isocrystals*), lines 58–60, Notation 1.1: `X` is reduced, separated and of finite type over `k`. Theorem 3.12 is at line 288, on p. 7.

**Repair:**
- Replace the quoted clause with “Let `X` be a scheme of finite type over a perfect field `k` of characteristic `p` and `E` a convergent F-isocrystal on `X` (§RD.3.34)”.
- Replace “Noetherian base” with “`X` of finite type over `k`, the domain of §RD.3.33”.
- Cite “Theorem 3.12, p. 7”.

## R02 (P3) — RD.3.43a cites LefschetzPencilsAndVanishingCycles §1.8 for branch purity, which that section imports from PurityOfBranchLocus on main

**Location:**
- `README.md:6854`, the *Needs* line of RD.3.43a: “LefschetzPencilsAndVanishingCycles §1.8 *Purity of branch locus*”.
- Line 634, the supplier contract: “§1.8 (*Purity of branch locus*): … used in RD.3.43a”.

**Claim:**
- That §1.8 states tame restriction along a normal crossings divisor.
- Branch purity is PurityOfBranchLocus §§2.1–2.2 on main, which this README never cites.
- The wrong citation also makes RD.3.43a wait for an open pull request.

**Witness:** LefschetzPencilsAndVanishingCycles at the head of #873, line 1324: “### 1.8 Tame restriction along a normal crossings divisor”. Its line 1340 *Needs* “PurityOfBranchLocus §§2.1–2.2 (branch purity and its global corollary)”. Those are main's PurityOfBranchLocus lines 319 and 357.

**Repair:**
- At line 6854, replace the citation with “PurityOfBranchLocus §2.1 *Purity of the branch locus*; PurityOfBranchLocus §2.2 *The global corollary*”.
- Replace the §1.8 bullet at line 634 with a **PurityOfBranchLocus.** block: “§§2.1–2.2 (*Purity of the branch locus*; *The global corollary*): a finite dominant, generically étale morphism from a normal integral scheme to a regular integral scheme, formally unramified at codimension-one points, is étale; used in RD.3.43a.”

## R03 (P3) — Two *Needs* lines cite §CR.4.7 under titles that CrystallineCohomology does not have

**Location:**
- `README.md:3022` (RD.1.27): “CrystallineCohomology §CR.4.7 *Standard blocks on the existing isocrystal carrier*”.
- Line 3127 (RD.1.32): “CrystallineCohomology §CR.4.7 *All-rank standard blocks, isoclinicity and slope decomposition on the existing isocrystal carrier*”.

**Claim:** Neither title is a heading or a target of CrystallineCohomology. The target that supplies the blocks and the slope decomposition is *Slope decomposition on the existing isocrystal carrier*, the title already used at lines 562 and 6959.

**Witness:** CrystallineCohomology at the head of #857, line 6622: “**Slope decomposition on the existing isocrystal carrier.**” This is the only isocrystal target in §CR.4.7 (line 6511). No line of that README contains either cited title.

**Repair:** At lines 3022 and 3127, replace the italic title with *Slope decomposition on the existing isocrystal carrier*.

## R04 (P3) — RD.5.112a needs a target of the later Layer RD.6

**Location:**
- `README.md:11295`, the *Needs* line of RD.5.112a: “§RD.6.64 *Neutral Tannakian recognition theorem*”.
- Line 13025: “§RD.5.112a, independently of the layer numbering.”

**Claim:**
- This is the only place where the layers are not in build order: a Layer RD.5 target consumes RD.6.64.
- RD.6.64's own inputs are all external, so nothing forces it into Layer RD.6.

**Witness:**
- Over all 526 targets, the *Needs* graph has exactly one cross-layer forward edge, RD.5.112a → RD.6.64, and no cycle.
- RD.6.64's *Needs* (line 13040) are MotivesAndAlgebraicCycles §§6.1–6.3, Tau Ceti and Mathlib only.

**Repair:**
- Move §RD.6.64 to the end of Layer RD.2, after the Tannakian targets RD.2.49–RD.2.51, as §RD.2.52.
- Under the layer table, add “Target RD.6.64 is now §RD.2.52.”
- Replace every `RD.6.64` in the README with `RD.2.52`.
- Delete “, independently of the layer numbering”.

## R05 (P3) — The RD.0 headline “valuation p-bases” is neither stated nor named as not statable

**Location:**
- `README.md:37`, the RD.0 row: “… Bézout property and closed ideals, valuation p-bases, Arabia's controlled lifting”.
- `Suggested.lean:25–28`, which lists the other RD.0 headlines as not statable.

**Claim:**
- RD.0.48–RD.0.49 can be stated at the pins, so the docstring cannot call them not statable.
- They are the input to §RD.0.50's projection, not a result the roadmap is built to reach.

**Witness:**
- Mathlib `RingTheory/LaurentSeries.lean:504`: `instance valued : Valued K⸨X⸩ ℤᵐ⁰`.
- The layer table lists valuation p-bases as an RD.0 headline, but the docstring's RD.0 paragraph omits them.

**Repair:** In the RD.0 row, delete “valuation p-bases, ”.

## R06 (P3) — About 170 code spans still join two clauses across a comma

**Location:**
- `README.md:719`: “For discretely valued `K, O_E` is the integral part of `E, R^bd = R^int[1/π]`”.
- Line 954: “bounded away from `r_0, Γ_I` is the Fréchet completion”.
- Line 13834: “on `W(𝔽_q), φ^f` is `W`-linear”.

**Claim:** The previous R07 fixed this defect where a semicolon was swallowed. The same defect remains with commas: one span holds the last formula of one clause and the first formula of the next.

**Witness:** I counted spans that contain a comma outside brackets and are followed by a verb (`is`, `are`, `has`, `lies`, `gives`, `admits`, …). There are 179 such spans on 171 lines. A few are genuine lists, such as `σ, σ'`.

**Repair:** Split each such span at the comma that ends the clause:
- “For discretely valued `K`, `O_E` is the integral part of `E`, `R^bd = R^int[1/π]` and `E = O_E[1/π]`”
- “bounded away from `r_0`, `Γ_I` is”
- “on `W(𝔽_q)`, `φ^f` is `W`-linear”

## R07 (P3) — RD.1.32 calls `F̄_q` a finite residue field

**Location:** `README.md:3112`: “For `κ = F̄_q` this is the familiar finite-residue-field special case of the present classification”.

**Claim:** `F̄_q` is algebraically closed and infinite. The theorem assumes `κ` algebraically closed, so it has no finite-residue-field case.

**Witness:** The theorem's hypothesis on the same line: “Let `κ` be an algebraically closed field of characteristic `p`”. No finite field is algebraically closed.

**Repair:** Replace the quoted sentence with “For `κ = F̄_q` this is the classification used for isocrystals over finite fields after extension of scalars to `F̄_q`”.

## R08 (P3) — RD.3.51 repeats two Checks

**Location:** `README.md:7033–7034`: “`K_0` is the unit; `K_1 ≅ K_0` through `e ↦ t e`.” and “For `p` odd, `K_{1/2}` carries the Frobenius structure `t^{(p−1)/2}`”.

**Claim:** Both bullets repeat earlier bullets in the same Checks list.

**Witness:**
- Line 7028: “`K_0` is the unit object `(j†O, d)`.”
- Line 7029: “`K_1 ≅ K_0` via `e ↦ t e`”.
- Line 7030: “For `p` odd, `K_{1/2}` has the Frobenius structure given by multiplication by `t^{(p−1)/2}`.”

**Repair:** Delete lines 7033–7034.

## Verified sound

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| Previous R01 (RD.7.13(b) in Lean) | `Suggested.lean:259`; README 14112; docstring lines 20–23 | Declared and named in both places. For `p=3, g=1, Q=x³+x+1, B=x², m=0`: `F=(2/9)x³+(4/45)x+2/9`, so the multiplier `9=3^⌊log₃9⌋` is needed | Repaired |
| Previous R02 (RD.5.8 step 3) | README 8841 | “`M` over `R[1/p]`, where `R = O⟨x_1, …, x_n⟩†` … `R^∧` the `π`-adic completion of `R`” | Repaired |
| Previous R03 (*Needs* of RD.7.7 and RD.7.8) | README 13990, 14015 | Both list §IG.0.T4 (#850 line 588) and DeligneWeightsAndPurity §0.10 (#929 line 731). RD.7.8 adds §RD.7.7, §RD.7.5 and §RD.6.86 | Repaired |
| Previous R04 (F1.4 and F1.9 in *Needs*) | README 1850, 6343 | RD.3.27: F1.2 and F1.3 only. RD.0.42 keeps the F1.4 tensor for `S†⊗_{σ_K}O_K`. Lines citing F1.9: 29 → 15 | Repaired |
| Previous R05 (RD.5.7 Check) | README 8826 | `f=x^{p+1}−yx+1`, `f′=x^p−y=−x^{−1}`, a unit; `x+x^{−1}` is ramified at `x=±1` | Repaired |
| Previous R06 (numbering sentence) | README 46–47 | “Target `RD.k.n` belongs to layer RD.`k`, and its label orders it within the layer.” | Repaired |
| Previous R07 (semicolons in spans) | Whole README | Spans containing `; `: 230 → 24, all notation (`Kl(z; q)`, `H¹(A; K)`, `det(1 − Ft; V)`) | Repaired; comma variant is R06 |
| Sample: Definition RD.2.12 | `∇e=(1/2)e dt/t`, `p` odd | The candidate `ct^{−1/2}e` is not in `R_K`; over `v²=t`, `∇(v⁻¹e)=0`. Checked: SFR Def. 7.2.2 p. 68; overview Def. 4.3.1 and Lemma 4.3.2, p. 20 | Pass |
| Sample: Definition RD.0.6 | `x=Σ[y^{q^i}]π^i` with `v(y)<0`; `[z^{−1}]` | `v_{n,r}(x)=rq^n v(y)+n→−∞`; `v_{n,r}([z^{−1}])=−rv(z)+n→∞`; `w_{r/q}(x^σ)=w_r(x)`. Checked: SFR Defs 2.1.3–2.1.8, pp. 6–7 | Pass |
| Sample: Theorem RD.1.28 | `M_{1,2}` | `F²e₁=πe₁`; `Hom(R(c),M_{1,2})≠0` iff `c≥1/2` (Cor. 4.1.4, p. 40). Checked: Prop. 4.2.2 p. 41; Lemma 4.2.3 pp. 42–43 | Pass |
| Sample: Lemma RD.1.30 | `x=Σ[y^{q^{−i}}]π^i`; `M_{1,1}⊕M_{−1,1}` | `x^σ=πx`; `F(xe₂)=πx·π^{−1}e₂=xe₂`. Checked: SFR Lemma 4.3.1 p. 44, Lemma 4.3.3 p. 45, Prop. 4.3.4 p. 46 | Pass |
| Sample: Theorem RD.1.32 | `[[0,1],[p,u]]` with `u` a unit; `[[0,1],[p,0]]` | Newton polygon of `x²−ux−p` has vertices (0,1), (1,0), (2,0), slopes 1 and 0; the second matrix gives `M_{1,2}`. Checked: LMT Thm 5.6 p. 63; SFR Rem. 4.5.8 p. 50 | Pass; wording is R07 |
| Sample: Theorem RD.3.43 | `X` noetherian, not of finite type | `Isoc(X/K)` is defined only on finite-type `X` (§RD.3.33). Ordinary polygon (0,0),(1,0),(2,1) lies below supersingular (value 1/2 at 1) | R01 |
| Sample: Definition RD.6.57 | `L_π`, `p≥3`, `Tr(x)=1` | `Tr(F_x)=ζ_p^{−1}`, not real; `ι(q^{wd}/α)` is the conjugate of `ι(α)`. Checked: Weil II §6.1 p. 40 | Pass |
| Sample: Theorem RD.5.103 | Kummer module `d+(1/2)dt/t` | Horizontal section `t^{−1/2}`; residue 1/2 is not nilpotent. Checked: SSR I Thm 6.4.5 p. 56, Thm 3.3.4 p. 27; SSR IV Rem. 2.4.2 p. 16 | Pass |
| Sample: Theorem RD.0.14 | `(1−t)^{−1}`; `Γ_{[0,0]}` | `(1−t)^{−1}` lies in `Γ_r` with a pole at `t=1`; `Γ_{[0,0]}=E` is a field. Checked: Prop. 2.6.5 p. 21, Prop. 2.6.8 p. 22. Remark 2.6.4 is corrected in the README | Pass |
| Sample: Construction RD.4.15 | `G_m⊂A¹` | Excision gives `H⁰(pt)≅H¹_c(G_m)`, `H¹_c(A¹)=0` and `H²_c(G_m)≅H²_c(A¹)`. Checked: Berthelot (3.1)(ii), printed p. 21 | Pass |
| Sample: Theorem RD.0.49 | `k=𝔽_p(s₁,s₂,…)`, `f=Σs_n t^{pn}` | Every `s_n` would have to be one of finitely many monomials: contradiction, so the README's finite p-rank hypothesis is needed. Checked: SFR Ex. 2.2.18 p. 10 | Pass; source issue |
| Sample: Lemma RD.6.76 | `E=O`, `r=0` | `H⁰(E^{⊗−2i})(1)=K(1)` has weight −2; `|ι(α)|≤q^{deg x·(ir+1)/(2i)}` tends to `q^{deg x·r/2}`. Checked: Weil II Lemma 6.3.2 p. 45 | Pass |
| Sample: Theorem RD.1.13 | `exp(−π(t^{−1}−t_ρ^{−1}))` | `|t^{−1}−t_ρ^{−1}|=|t−t_ρ|/ρ²`, so it converges iff `|t−t_ρ|<ρ²`. Checked: overview Lemma 5.2.2 and Prop. 5.2.3, p. 29; Kedlaya–Xiao Prop. 1.2.14 p. 8 | Pass |
| Sample: Construction RD.3.51 | `K_b→K_a`; Frobenius lift `t↦t^p` | `tg′=(b−a)g` gives `g=ct^{b−a}`; `th′=(p−1)ah` gives `h=ct^{(p−1)a}`; `∂^{[k]}e=binom(a,k)t^{−k}e` | Pass; duplicates are R08 |
| Sample: Theorem RD.0.31 | Artin–Schreier, `π^{p−1}=−p` | `(1+πu)^p=1+pπt^{−1}` reduces to `u−u^p=t^{−1}`, the same field after `u↦−u`. Checked: SFR Prop. 2.4.10 and Cor. 2.4.11 p. 15; overview Prop. 3.5.5 p. 15 | Pass |
| `arabia_controlled_lifting` | `I=0`; `I=R` | `I=0`: `E≅B` and `hE=hbar`. `I=R`: the lift into the henselization of `(B, ker p)` factors through an étale `E` | Pass |
| `exists_frobenius_lift_weakCompletion` | `f=0`; `σK` on `m` | `σK(a)≡a^q≡0` on `m`, so `σK` is local; `weakCompletion` needs `FiniteType`, which follows from `Smooth` | Pass |
| RD.0.55 (eight theorems, two definitions) | `ℤ→ℤ/4`; `S/gS≅A/gA` | `Tor₁(ℤ/4,ℤ/2)=ℤ/2` blocks non-flat base change; `A⊗^L_S N=(A/gA)⊗^L_{S/g}N=N` | Pass |
| RD.0.56 (two theorems, two definitions) | `n=1`, `n=2`; zero ring | A monic unit equals 1; `[[x,y],[−b,a]]·(a,b)ᵀ=(1,0)`; over the zero ring both sides hold | Pass |
| `rigid_quillen_suslin` | `n=0` | `washnitzerAlgebra (Fin 0) K` is `K`; finite modules are free | Pass |
| `hyperelliptic_reduction_denominator_bound` | 882 random cases, `p∈{3,5,7}`, `g≤3`, `m≤6`; `g=0` | 0 failures; the bound is attained at `p=3, g=1, m=0`. At `g=0`, `b=0` and `F=2B(x+c)^{m+1}/(2m+3)` | Pass |
| End theorems (RD.2, RD.5, RD.6, RD.7) | Pins | No Robba, isocrystal or rigid-cohomology carrier at the pins; the docstring names each theorem | Pass |
| RD.3.43a, branch purity | LefschetzPencilsAndVanishingCycles (#873) §1.8 | That section is about tame restriction; its *Needs* import PurityOfBranchLocus §§2.1–2.2 | R02 |
| RD.1.27 and RD.1.32, `CR.4.7` titles | CrystallineCohomology (#857), line 6622 | Its only isocrystal target is *Slope decomposition on the existing isocrystal carrier* | R03 |
| RD.5.112a → RD.6.64 | *Needs* graph | 1 forward cross-layer edge, 0 cycles; RD.6.64's *Needs* are external only | R04 |
| RD.0 headline “valuation p-bases” | Pins | `Valued K⸨X⸩ ℤᵐ⁰`; neither stated nor named as not statable | R05 |

- **Gate:**
  - The worker's gate at `b19bbff` passes.
  - My rerun against the default order fails only on `depcheck: UPWARD: PadicDifferentialEquationsAndRigidCohomology (#120) -> CongruenceSpectralGap (#157)`, which is the worker's move.
  - The prescribed depcheck on the moved order prints `depcheck: 206 roadmaps, 1916 edges, 0 problem(s)`.
  - The diff outside the folder is empty.
- **Elaboration:**
  - `lake env lean` gives 14 `sorry` warnings and nothing else.
  - The one-tactic probes (`rfl | simp | infer_instance | trivial | decide | simp_all | aesop`) fail on all 14 theorems.
  - I compared the `#check @` types of all 18 declarations with the README: no binder is lost.
- **Sources:** I checked 46 locators against 9 texts: SFR (arXiv v4), LMT (arXiv v4), the overview (arXiv math/0501361), *Notes on isocrystals* (v6), Weil II (v3), SSR I (v5), SSR IV (v4), Berthelot (Mém. SMF 23) and Kedlaya–Xiao (v4).
- **Library declarations opened at the pins:**
  - Mathlib:
    - `LinearAlgebra/Unimodular.lean:46`.
    - `Algebra/Module/StablyFree/Basic.lean:34`: the complement must be finite free.
    - `RingTheory/LaurentSeries.lean:504`.
  - Tau Ceti:
    - `RingTheory/Dagger/WeakCompletion/Basic.lean:81`.
    - `RingTheory/Dagger/WeakCompletion/Basic.lean:190`: requires `Algebra.FiniteType`.
    - `RingTheory/Dagger/WashnitzerAlgebra.lean:115`.
    - `Algebra/Homology/ModuleCat/FiniteFreeResolution.lean:268`: complexes over noetherian rings, with no length bound, so it does not duplicate RD.0.55.
- **Citations:**
  - I resolved 153 distinct cross-roadmap section-and-title citations to 22 suppliers, at main or at their open heads. 121 match a heading or target title exactly.
  - Of the other 32, 29 paraphrase content that exists in the cited section. The remaining three are R02 and R03.
  - The Tannakian targets RD.2.49 and RD.2.51 use Tau Ceti `Tannaka` directly.
- **Ownership:**
  - No roadmap on main or in an open pull request owns Quillen–Suslin, finite free resolutions in Lang's sense or the unimodular extension property.
  - PurityOfBranchLocus §0.3 owns projective and global dimension only.
  - AlgebraicKTheory owns stable range only.
- Overlap check: read CrystallineCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AInfCohomology and RelativeFarguesFontainePartII (open), and AdicSpacesPartIV, NewtonPolygons and ClassicalArithmeticCompletion (main); the third list is empty. Shared objects and their owners:
  - Smooth-strata rigid cohomology and the Witt-isocrystal slope decomposition: CrystallineCohomology §§CR.6.4 and CR.4.7 (cited).
  - Dagger algebras: AdicSpacesPartIV F1 (cited).
  - RD.0.1–RD.0.3 and RD.0.54: this roadmap (PadicHodgeTheory and RelativeFarguesFontainePartII consume them).
  - Robba rings and isocrystal polygons: excluded by NewtonPolygons.
  - Kedlaya's classification for `C^♭`: AInfCohomology uses it only inside one proof and owns no Dieudonné–Manin target.

## Not verifiable

- Berthelot, *Cohomologie rigide et cohomologie rigide à supports propres, première partie* ((2.2.15)(ii)(b), p. 67; (2.3.8)(iii), p. 76; cited in RD.3.51): the sources service found no legal copy, and the author's page timed out. I checked the mathematics of RD.3.51 by computation instead.
- Katz, *Slope filtration of F-crystals*, Thm 2.3.1, and de Jong–Oort, JAMS 13, Thm 4.1 (RD.3.43): I did not fetch them; the statement was checked against *Notes on isocrystals*, Theorem 3.12.
- Kedlaya's errata to SFR Lemma 2.6.3 and Remark 2.6.4 (RD.0.14 and the corrections section): I did not fetch them; the proof on pp. 20–21 was read directly.

## Source issues

- **Error** in Kedlaya, *Slope filtrations revisited* at Example 2.2.18, p. 10: the source says `t` together with any p-basis of `k` is a valuation p-basis of `k((t))`; it should require `[k:k^p]` finite, since `Σ s_n t^{pn}` over `𝔽_p(s₁,s₂,…)` has no finite expansion; affects a stated result.
- **Misprint** in Kedlaya, *Slope filtrations revisited* at Remark 2.6.4, p. 21: the source says discreteness of the valuation on the residue-type field `K` is essential to the convergence in Lemma 2.6.3; it should name `O`, since each step gains the fixed `1 − r/r₀` (compare Remark 2.6.6); affects nothing.

# Review of CompactQuantumMetricSpaces (pull request #1155 at 92ab84b)

**Verdict:** needs changes

This is an incremental re-review of the 34 lines changed in the folder since 7211966: 29 in `TauCetiRoadmap/CompactQuantumMetricSpaces/README.md` and 5 in the module docstring of `TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean`. No Lean statement changed. The gate passes, nothing changed outside the folder, and the dependency check reports no problem. There are three findings. R01 (P2) is new: the repair of the previous R02 gives this roadmap a theorem that OperatorKTheory K7.5 already plans. R02 (P3) is the previous R01, still unrepaired at this branch's Tau Ceti pin. R03 (P3) is new: a hypothesis list that the previous review itself supplied is incomplete. In two of these cases (R01 and R03) the defect comes from wording the previous review recommended, and this report says so in each.

Sources are cited by line number in the sources service's extractions: rieffel00 = arXiv math/0011063.

## R01 (P2) — Two owners for point-norm continuity of the gauge action: §6.1 and OperatorKTheory K7.5

**Location.** README line 1487: "Prove, owned here, that the gauge action of §6.0 is point-norm continuous: each `α_z` is isometric and `z ↦ z^pW_p` is continuous". Also Scope, line 36: "the point-norm continuity of its gauge action".

**Claim.** No other roadmap states the continuity of `z ↦ α_z(a)` on `A_Θ`, so this roadmap owns it.

**Witness.** `TauCetiRoadmap/OperatorKTheory/README.md` (#866, head b328ec07), line 1850: "the gauge action is norm continuous in χ at each element", for every discrete abelian `L` and factor set `c` (lines 1825–1838). Lines 2327–2330 name this roadmap's §6.0 as `L = ℤᵈ`.

**Why this is a defect here.** In the merge order OperatorKTheory is line 10 and this roadmap is line 209. At `L = ℤᵈ`, `c = σ_Θ`, OperatorKTheory's `C*(L, c)` is exactly this roadmap's `A_Θ`. The span of the `W_p` is already a unital star algebra (`W_p* = W_(−p)`), so the C*-subalgebra it generates is its closure. OperatorKTheory's `α_χ = Ad(M_χ)` is §6.0's `α_z` when `χ(p) = z^p`. One theorem about one object therefore has two owners, and the earlier one is OperatorKTheory. The previous review recommended taking ownership here. Its ownership search covered OperatorAlgebraDynamics but missed this bullet, which was already in #866 before commit 5dbc4acd. This finding reverses that advice.

**Repair.**
- Replace the first sentence of §6.1 with: "The gauge action of §6.0 is point-norm continuous by OperatorKTheory K7.5 at `L = ℤᵈ`, `c = σ_Θ`. Its `C*(L, c)` is the closed span of the same `W_p` on `ℓ²(ℤᵈ)`, and its `α_χ = Ad(M_χ)` is `α_z` for `χ(p) = z^p`."
- Delete "the point-norm continuity of its gauge action," from the Scope paragraph (line 36).
- Add "OperatorKTheory K7.5 (point-norm continuity of the gauge action)" to §6.1's *Needs:* line and to Layer 6's Dependencies, with a matching bullet under "From other roadmaps".
- The pull request's depends-on list then also needs #866. Its merge-order paragraph already names #866.

**Repair tested.** `M_χ W_y M_χ* δ_z = conj(χ(z)) c(y,z) χ(y+z) δ_(y+z) = χ(y) W_y δ_z`, so with `χ(p) = z^p` this is §6.0's `α_z(W_p) = z^pW_p`. The dependency check with OperatorKTheory at line 10 has no upward edge.

## R02 (P3) — The module docstring names a Tau Ceti declaration and file absent at this branch's pin

**Location.** `Suggested.lean` lines 27–30: "provided by neither pinned library (the smooth noncommutative torus `TauCeti.SmoothNoncommutativeTorus θ` of `TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.lean`, a star algebra of rapidly decreasing coefficient functions, carries no norm and no completion)".

**Claim.** The pinned Tau Ceti has that file and declaration.

**Witness.** `lake-manifest.json` pins Tau Ceti at a91d3aa, and `git ls-tree -r a91d3aa` has no `TauCeti/NoncommutativeGeometry/`. The file comes from Tau Ceti commit 2db61e3 (2026-11-01). That commit is not an ancestor of a91d3aa but is in main's pin 2fd255d.

This is the previous R01, still unrepaired at this head. Main has pinned 2fd255d since the pin bump of #1800.

**Repair.** Either of these:
- Rebase onto main, so the branch takes the pin 2fd255d, and re-run the gate including the build. At 2fd255d the file exists. `TauCeti.SmoothNoncommutativeTorus` is declared in namespace `TauCeti` (lines 75, 230) with `Ring`, `Algebra ℂ`, `StarRing` and `StarModule ℂ` instances (lines 453–519) and no norm instance. So the sentence becomes true as written.
- Keep the pin a91d3aa and write "(neither pinned library has the rotation algebra or a smooth subalgebra of it)".

**Repair tested.** At 2fd255d, every other Tau Ceti declaration the README names still exists: `wassersteinEDist_one_eq_iSup_of_compactSpace` and `wassersteinEDist_one_eq_iSup_apply_eq_zero` (`KantorovichRubinstein.lean` lines 161, 304), `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.of`, `of_mul_of`, `lift` and `equivOfCoboundary` (`Twisted/Basic.lean` lines 288, 322, 336, 397, 498), and `IsFactorSet` (line 99). The build at 2fd255d could not be run here (see Not verifiable).

## R03 (P3) — The repaired Tau Ceti contract still omits two hypotheses of the basepoint-normalized duality, and §3.3's *Needs:* omits that declaration

**Location.** README lines 228–231: "the basepoint-normalized form assumes `HasFiniteMoment 1 μ` and `HasFiniteMoment 1 ν` and no compactness, which §3.3's adapter proves on a compact metric space". Also §3.3, line 879: "*Needs:* 3.2, 1.5, 0.3; Tau Ceti `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`".

**Claim.** The finite first moments are the basepoint-normalized form's only hypotheses beyond probability measures.

**Witness.** At the pin, `KantorovichRubinstein.lean` line 304 states `wassersteinEDist_one_eq_iSup_apply_eq_zero` in `section StandardBorel`, whose variables (lines 184–185) add `[SecondCountableTopology X] [StandardBorelSpace X]`. §3.3's *Needs:* omits this declaration.

The previous review proposed this sentence and left out the two hypotheses. The contract says §3.3 proves the hypotheses of a declaration that §3.3's *Needs:* line never lists.

**Repair.**
- Contract sentence: "the basepoint-normalized form assumes `SecondCountableTopology X`, `StandardBorelSpace X`, `TauCeti.HasFiniteMoment 1 μ` and `TauCeti.HasFiniteMoment 1 ν`, and no compactness. On a compact metric space with its Borel σ-algebra the first two are instances, and §3.3's adapter proves the moment bounds."
- Add `TauCeti.wassersteinEDist_one_eq_iSup_apply_eq_zero` to §3.3's *Needs:*. Alternatively, if §3.3 derives the normalized form from the compact one by subtracting `f(x₀)`, delete it from the contract.

**Repair tested.** In a scratch file under `[MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]`, the carrier of `integrationState`, `inferInstance` closes both `SecondCountableTopology X` and `StandardBorelSpace X` (elaboration exit 0). `HasFiniteMoment 1 μ` (`Wasserstein/Basic.lean` line 415: `edist x ·` lies in `L¹`) holds because `edist x₀ · ≤ diam X < ∞` and `μ` is a probability measure.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 28–30 "the smooth noncommutative torus `TauCeti.SmoothNoncommutativeTorus θ` of `TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.lean`". The path is absent at the branch's pin a91d3aa and present at main's pin 2fd255d. Carried as R02.
- R02 — repaired: README lines 1487–1491 "Prove, owned here, that the gauge action of §6.0 is point-norm continuous … HeisenbergImprimitivity §3.1's gauge average … (stated there for positive `a` and extended to all `a` by linearity)". The ownership this adopts duplicates OperatorKTheory K7.5 (R01).
- R03 — repaired: line 1217 "`N_ε` is finite everywhere, so `M_ε` has exactly the product domain"; line 230 adds the moment hypotheses (two typeclass hypotheses are still missing, R03); line 1131 "(owned here: … Rieffel 2000, Example 6.5 …)".

## Verified sound

**Gate and direction.**
- The worker's gate at 92ab84b passes every check, `build=0` included. My rerun of the gate (`--base origin/main`) prints the same line without the build field, then `OK`.
- My rerun of the dependency check with `--movable`:

```
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Merge order: this roadmap is at line 209, OperatorKTheory at line 10, VonNeumannAlgebras at line 6, CStarAlgebras at line 8. The suppliers HeisenbergImprimitivity (#1149) and SmoothBanachRepresentations (#1145) are named in the description's depends-on list and merge-order paragraph.

**Elaboration and signatures.**
- `lake env lean` on a scratch copy of `Suggested.lean`, with `#check @name` appended for the 37 named declarations, exits 0 with 17 "declaration uses `sorry`" warnings and no other diagnostic.
- The diff of `Suggested.lean` touches only docstring lines 27–30, so every elaborated type equals the one compared with the README in the previous review. No binder changed. The context audit of the previous review stands.
- Padding probe: on a copy with each of the 17 `sorry` lines replaced by `first | rfl | simp | infer_instance | (intros; rfl) | (intros; simp) | aesop`, all 17 fail (10 "aesop made no progress", 7 unsolved goals).
- Instance test (R03): `SecondCountableTopology X` and `StandardBorelSpace X` are inferred on a compact metric Borel space.

**Headlines.** Unchanged since the previous review: `tendsto_stateEDist_iff`, `closedLipNorm_recovery`, `stateEDist_integrationState`, `exists_closedLipNorm_actionLip`, `quantumGHEDist_eq_quotientQuantumGHEDist`, `quantumGHEDist_triangle`, `quantumGHEDist_eq_zero_iff`, `exists_limit_of_cauchySeq_quantumGHEDist` and `totallyBounded_quantumGHEDist_iff` are all stated. The docstring names three items as not statable: the §5.5 isometry-class space, `Φ_θ` (§6.1) and the §6.5 continuity. At a91d3aa Mathlib has no rotation algebra, and Tau Ceti has neither the rotation algebra nor its smooth subalgebra (R02). At 2fd255d the smooth subalgebra exists but has no norm, so `Φ_θ` remains not statable at either pin.

**Cross-roadmap citations resolved this round (8).**
- HeisenbergImprimitivity (#1149, head a9eeb6ec, unchanged since the previous review):
  - §3.1, lines 440–462: twisted convolution, `λ_c`, universal property, trace and Fourier coefficients, gauge action with fixed algebra `ℂ1`.
  - Line 477: gauge average `τ(a)1` for positive `a`, which matches the new §6.1 wording. It states no continuity.
  - Line 816: names this roadmap's §6.0 as a consumer.
- OperatorKTheory (#866, head b328ec07):
  - Scope, lines 21–25: claims `C*(L, c)` with its trace, gauge action and universal property.
  - §7.5, lines 1825–1850: the construction and the continuity bullet (R01).
  - Lines 2327–2330: name this roadmap's §6.0 as an instance.
- NoncommutativeGeometry on main (65930bac), N6, lines 478–479: joint strong continuity of the two-torus action `β` on `A_θ`, for `d = 2` only and on a different algebra. It is consistent with §6.1's `Φ_θ ∘ α_z = β_z ∘ Φ_θ` and is no second owner for general `d`.
- OperatorAlgebraDynamics on main: its gauge actions (lines 459 and 558) are those of `O_n` and of the CAR algebra, not of `C*(ℤᵈ, σ)`.

**Ownership note (not a finding here).** HeisenbergImprimitivity §3.1 and OperatorKTheory K7.5 both claim `C*(L, c)` with its trace, gauge action and universal property, and each names this roadmap's §6.0 as its consumer. This roadmap consumes from HeisenbergImprimitivity, and both suppliers precede it in the merge order. Settling which of the two owns `C*(L, c)` is for their reviews. Whichever way it is settled, §6.0 and §6.1 should cite the survivor. Ownership against open pull requests was checked through the brief's sibling checkouts and `roadmaps grep` (searches for the gauge action with "point-norm", "strongly" and "norm continu").

**Pinned declarations opened this round (14).**
- At a91d3aa, `KantorovichRubinstein.lean`:
  - lines 113–115: section `Compact` with `[PseudoMetricSpace X] [CompactSpace X] [OpensMeasurableSpace X]`;
  - line 161: `wassersteinEDist_one_eq_iSup_of_compactSpace`, with probability measures only and no moment hypothesis (matches the contract);
  - lines 182–185: section `StandardBorel`;
  - line 304: `wassersteinEDist_one_eq_iSup_apply_eq_zero`, with `hμ hν : HasFiniteMoment 1 _` and `x₀`.
- At a91d3aa, other files:
  - `Wasserstein/Basic.lean` line 415: `HasFiniteMoment`;
  - `Twisted/Basic.lean` lines 282, 316, 330, 391, 501: `twistedMonoidAlgebra`, `of`, `of_mul_of`, `lift`, `equivOfCoboundary`.
- At 2fd255d: `SmoothTorus/Basic.lean` lines 75, 230 and 453–519, and the five twisted-algebra declarations, `IsFactorSet` and the two duality theorems at the lines given in R02.

**Sources: the seeded sample where it falls in the changed passages, and every locator a finding touches.**

| README target | Source item | Lines | Agrees |
|---|---|---|---|
| 3.3 contract (KR duality) | Tau Ceti `KantorovichRubinstein.lean` at a91d3aa | 115, 161, 184–185, 304 | compact form yes; basepoint form missing two hypotheses (R03) |
| 4.6 `C(G/H)` | rieffel00 Example 6.5, printed pp. 29–30 | 1134–1148 | yes: conjugation-invariant `ℓ` makes `α` leave `L` invariant; the equality with `classicalLip` is owned here, proof checked below |
| 5.1 admissible Lip-norms, distance | rieffel00 Notation 4.1, Definition 4.2, p. 16 | 620–630 | yes |
| 6.1 gauge action, average | HeisenbergImprimitivity §3.1 (a9eeb6ec) | 440–462, 477 | average for positive `a` yes; continuity owned here but planned by OperatorKTheory K7.5 (R01) |
| 1.1, 1.3, 2.4, 4.5, 5.2, 5.6, 6.0, 6.3 | as in the previous review's table | — | untouched by the diff; carried from the previous review |

**Adversarial table.** The first 10 rows are new, with values computed this round for every changed statement. The 54 rows after them are carried from the previous review (marked r5) for statements the diff leaves untouched.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.6 `actionLip = classicalLip` on `C(G/H)`, abelian | `G = T`, `ℓ = \|θ\|`, `H = {0, π}`, `f = cos 2θ` | `classicalLip = sup\|f′\| = 2`; `‖f(·−x) − f‖ = 2\|sin x\|`, `sup 2\|sin x\|/\|x\| = 2` (as `x → 0`) | equal | none |
| 4.6 the witness `x = gh⁻¹k⁻¹`, non-abelian | `S₃`, `ℓ` = transposition length (conjugation-invariant), `H = ⟨(12)⟩`, `g = e`, `k = (13)` | `d = min(ℓ(13), ℓ((13)(12))) = min(1, 2) = 1`; `x = (13)`: `x⁻¹gH = (13)H = kH`, `ℓ(x) = 1 = ℓ(g⁻¹k)` | both identities hold | none |
| 4.6 conjugation invariance needed for well-definedness | `S₃`, Coxeter length for `{(12), (23)}`, `H = ⟨(12)⟩`, representatives `e` and `(12)` of `H`, `k = (23)` | `min(ℓ(23), ℓ((23)(12))) = min(1, 2) = 1`; `min(ℓ((12)(23)), ℓ((12)(23)(12))) = min(2, ℓ(13) = 3) = 2` | `d` ill-defined without the hypothesis; the hypothesis is present | none |
| 5.1 Check: domain of `M_ε` | `E = C([0,1], ℝ)`, `a = √t`; `ℝ² × ℝ` with `M_δ` | `L_E(√t) = sup √s/s = ∞`, so `M_ε(a, b) = ∞`; `N_ε(a, b) ≤ ε⁻¹ max(1, ‖b‖) < ∞`; for `M_δ`, `N_ε ≤ ε⁻¹‖v‖`, `dom M_ε = ℝ³ = ℝ² × ℝ` | Check correct | none |
| 6.1 point-norm continuity | `a = W_p`; `a` within `ε` of the span | `‖α_zW_p − α_wW_p‖ = \|z^p − w^p\| → 0`; `‖α_za − α_wa‖ ≤ 2ε + ‖α_zb − α_wb‖` by isometry | true | R01 (owner) |
| 6.1 average extended from positive `a` | `a = W_p`, not positive | `∫ z^p dz · W_p = δ_(p,0)W_p = τ_Θ(W_p)·1`; `W_p` = combination of four positives, both sides linear | consistent | none |
| 6.1 OperatorKTheory's `α_χ` equals §6.0's `α_z` | `Ad(M_χ)` on `W_yδ_z` | `conj(χ(z)) c(y,z) χ(y+z) = χ(y)c(y,z)`, giving `χ(y)W_y`; `χ(p) = z^p` | same automorphisms | R01 repair |
| Tau Ceti contract, compact form | line 161 context | `[PseudoMetricSpace] [CompactSpace] [OpensMeasurableSpace]`, two probability measures, no moment | contract correct | none |
| Tau Ceti contract, basepoint form | lines 184–185, 304–305; §3.3 carrier | adds `SecondCountableTopology`, `StandardBorelSpace`, moments; on compact metric Borel `X` the instances are inferred and `edist x₀ · ≤ diam X` | contract list incomplete | R03 |
| Docstring: smooth torus at the pins | a91d3aa; 2fd255d | `ls-tree`: no `NoncommutativeGeometry/`; at 2fd255d present, ring and star instances, no `Norm` | false at branch pin, true at main's | R02 |
| 0.1 interval formula | `ℝ²`, `e=(1,1)`, `a=(1,1)` | Euclidean `√2`, max norm `1`; `−e ≤ a ≤ e` | formula selects the max norm | none (r5) |
| 0.1 non-Archimedean Check | cone `{x>\|y\|} ∪ {(t,−t)}`, `a=(−1,−1)`, `(0,1)` | `εe−a=(1+ε,1)` in cone ∀ε; `−a=(1,1)` not; `a+re=(r−1,−1)` in cone iff `r>2` or ray at `r=2`: `‖a‖=2`; `(0,1)`: `(r,−1)` in cone iff `r≥1`, `(r,1)` iff `r>1`: inf `1`, fails at `r=1`; `(ε,−1)` in cone iff `ε≥1` | Check correct | none (r5) |
| 0.1 `a ≥ 0 ↔ ‖‖a‖e−a‖ ≤ ‖a‖` | `(1,0)`; `(1,−1)` | `‖(0,1)‖=1 ≤ 1`; `‖(0,2)‖=2 > 1` | both directions | none (r5) |
| 0.1 Archimedean from the formula | `a ≤ εe ∀ε` | `b=a+‖a‖e`: `0 ≤ b ≤ (‖a‖+ε)e` so `‖b‖ ≤ ‖a‖`, then `b ≤ ‖a‖e` | derivation valid | none (r5) |
| 0.2 normalization without positivity | `2a₁−a₂`; `f(0)−f(1)+f(1/2)` | value `1` at `e`, norm `3`; unital, norm `3` | not states, not contractive | none (r5) |
| 0.3 `norm_eq_iSup_states` | `(1,−1)`; `E=0` | `sup\|2t−1\|=1`; `‖0‖=0≠1` so `he` excludes it; `iSup` over a bounded family | holds | none (r5) |
| 0.4 dual ball | `λ=(1/2,−1/2)` | `‖λ‖=1`, `t=1/2`, `φ=(3/4,1/4)`, `ψ=(1/4,3/4)`, `φ−ψ=λ`; `φ′−ψ′=(1,−1)≠λ` | exact | none (r5) |
| 0.4 quotient norm | `a=(3,1)` | `(3−1)/2=1=‖(1,−1)‖` | holds | none (r5) |
| 0.5 algebraic quotient by `o(t)` | class of `t` | `ε−t+max(t−ε,0)=max(ε−t,0) ≥ 0`; `−t=h+g`, `h≥0`, `g=o(t)` impossible near `0` | non-Archimedean | none (r5) |
| 1.1 `map_smul` junk | `r=0`, `L a=∞` | `L 0=0=0·∞` | consistent | none (r5) |
| 1.1 kernel axiom | `\|a₁\|`; `∞` off `ℝe` | kernel `{a₁=0}`; domain not dense | excluded | none (r5) |
| 1.2 `ρ(δ_x, Leb)` | `x=0, 1/2` | `x²−x+1/2`: `1/2`, `1/4` | holds | none (r5) |
| 1.3 radius, centered ball | `\|a₁−a₂\|`, `φ=ev₂` | diam `1`, `r=1/2`; ball `[−1,1]×{0}`, norm sup `1=diam > 1/2` | holds | none (r5) |
| 1.4 section bound | `a=(1,−1)`, `φ=ev₁` | `‖q(a)‖=1`, `‖a−φ(a)e‖=‖(0,−2)‖=2` | constant `2` sharp | none (r5) |
| 1.5 separability | `{L≤1} ⊆ B_φ+ℝe`, `dom L=⋃ n{L≤1}` | `a−φ(a)e ∈ B_φ`; `ℓ^∞` nonseparable | no Lip-norm on `ℓ^∞` | none (r5) |
| 1.6 `G_n` | `n=2` | `G_n′=min(n\|t\|,1)`, `L(G_n)=1`; `‖G_n−(t+1)‖=∫₀^{1/n}(1−ns)ds=1/(2n)`; `L(t+1)=2` | not closed | none (r5) |
| 2.1 kernel loss | `p_n=∫q_n`, `q_n→g′` | `L(p_n) ≤ ‖q_n−g′‖_∞→0`, `‖q(p_n)‖→1/2` | `g` in closure kernel, radius `∞` | none (r5) |
| 2.2 `closedLipNorm_recovery` | `a∉dom L`, sup `=C<∞` | `a` in the `E`-closure of `C·{L≤1}={L≤C}` by closed sublevel sets, so `L(a)≤C` | `∞` case holds | none (r5) |
| 2.2 `√t` | `φ=δ_h`, `ψ=δ_0` | `√h/h=h^(−1/2)→∞` | sup `∞=L(a)` | none (r5) |
| 2.3 simplex | `K⊆ℝ³` | `K−K={Σx=0, Σ\|x\|≤2}` (`c=(1−Σx⁺)/3≥0`); `‖(1/2,1/2,−1)‖₂=√1.5<√2=W₁` | extreme points do not recover `L` | none (r5) |
| 2.3 `\|x−y\|²` | `0,1/2,1` | `1 > 1/4+1/4` | metric hypothesis needed | none (r5) |
| 2.4 pullback direction | `T=id`, `L_F=L_E/2` | `ρ_E(T*φ,T*ψ)=ρ_F/2` | correct | none (r5) |
| 2.5 edge quotient; restriction vs quotient; image norm | `max\|a_i−a_j\|`; `\|a₁−a₂\|+2\|a₂−a₃\|`; `b=(0,1)` | `\|b₁−b₂\|` at `a₃=(b₁+b₂)/2`; `\|b₁−b₃\|` at `t=b₃` vs `2\|a₁−a₃\|`; image norm `1`, every lift has `a(1)=2` | all Checks correct | none (r5) |
| 3.1 `classicalLip`, Leibniz | `t²` on `[0,1]`; `X=∅` | `sup(s+t)=2 ≤ 1+1`; `0` | holds | none (r5) |
| 3.2 `exists_closedLipNorm_classicalLip` | `X=∅` | `C(∅)=0`, `L=0` satisfies every field, `TotallyBounded` of `{0}` | statement also true for empty `X`; `Nonempty` keeps the README's generality | none (r5) |
| 3.2 `√x`, inverse law | `f_r=min(rx,√x)`; `1/t` on `[1,2]` | error `1/(4r)` at `x=1/(4r²)`; `classicalLip(1/t)=1=1²·1` | sharp | none (r5) |
| 3.3 `stateEDist_integrationState` | `{0,1}`; `δ_(1/2)` vs Leb | `\|t−s\|`; `1/4`; KR sup over `LipschitzWith 1 f` of `∫f dμ−∫f dν` equals the `\|·\|` form by `f↦−f` | equals `W₁` | none (r5) |
| 3.5 `M₂`, `D=diag(1,−1)` | `[D,a]` | entries `2a₁₂`, `−2a₂₁`; kernel diagonal `ℂ²` | not a Lip-norm | none (r5) |
| 3.5 maximal-domain closedness (owned) | `a_n→a`, `‖[D,a_n]‖≤C` | `D a_nξ` bounded, weak subsequence limit in the closed graph: `aξ∈dom D`, `‖[D,a]ξ‖≤C‖ξ‖` | true | none (r5) |
| 4.1 inverse law | `C(T)`, `2+z` | `L(f)=1`, `‖f⁻¹‖=1`, `L(f⁻¹)=sup 1/\|2+z\|²=1` | equality | none (r5) |
| 4.3 `exists_closedLipNorm_actionLip` | `T`, `ℓ=\|θ\|`; `ℤ/2`; `A=0` | `∫ℓ=π/2`, diam `π` sharp; `1/2`, diam `1`; `L=0` satisfies all fields | true, Lean needs no `A≠0` | none (r5) |
| 4.4 `ℓ` dominates a Lie length (owned) | `ℓ(x_k)/d(x_k)→0` | `ℓ(x_k^{m_k}) ≤ m_kℓ(x_k)→0` on the shell `d∈[r/2,r]` where `ℓ≥c>0` | contradiction, claim true | none (r5) |
| 4.4 kernels | `T`, `1⊕z`; `ℤ/2`, `1⊕sgn`; `T`, `1⊕z²` | `2+2cosθ`, support `{−n..n}`; `k_n=2δ_1`, `δ_n=0`; maxima at `0,π`, `δ_n→π/2` | Checks correct | none (r5) |
| 4.5 `actionLip=L_der` | path; `exp(tX)` | `≤` by `∫‖c′‖`; `≥` by `ℓ(exp tX) ≤ \|t\|‖X‖` | equality for any norm | none (r5) |
| 4.6 Jordan factor | `a∘b=(ab+ba)/2` | `L ≤ (L(ab)+L(ba))/2 ≤ L(a)‖b‖+‖a‖L(b)` | factor `1` | none (r5) |
| 5.1 `M_δ` | `ℝ²` vs `ℝ` | `ρ_M(φ_t,ψ)=\|t−1/2\|+δ`, Hausdorff `1/2+δ`; `dist_q=1/2` by diameters | Check correct | none (r5) |
| 5.1 `ρ_M ≤ ρ_(M_ε) ≤ ρ_M+2ε` | `M_ε≤M`; `M_ε(v)≤1` | `‖v−w‖≤ε(1+η)`, `M(w)≤1+η`: `\|φ(v)−ψ(v)\| ≤ (1+η)(ρ_M+2ε)` | both inequalities | none (r5) |
| 5.2 compatibility | `P=id`, `L_F=L_E/2` | diam `1` vs `2`, `dist_q ≥ 1/2` | Check correct | none (r5) |
| 5.2 quotient estimate | `K₁={δ_0}`, `K₂={δ_1}`; `K=S(E)` | `dist_q(ℝ,ℝ)=0 < 1=W₁`; quotient by `S(E)` is `E` since restriction is injective | strict case, special case | none (r5) |
| 5.3 two-point spaces | `d=1` vs `d=2` | `ghDist=1/2`, `dist_q ≥ (2−1)/2` | equality | none (r5) |
| 5.4 `quantumGHEDist_eq_zero_iff` | `C¹` vs `C[0,1]` | distance `0`; `C¹` fails `CompleteSpace`, `‖f′‖_∞` fails closedness | hypotheses needed and present | none (r5) |
| 5.4 closed = Rieffel-closed | complete `E`, closed sublevel sets | Kadison onto `Aff_c`; a `1`-Lipschitz affine `â` has `L(a)≤1` by recovery | `E` is `A^c` | none (r5) |
| 5.5 limit of `(D,L_D)` | closed completion | diagonal bridge with `{L_D≤t}` dense in `{L̄≤t}`: `dist_q(D,D̄)=0` | closed limit exists | none (r5) |
| 5.6 `Fin`, `Scv`, nets | `{δ_(k/n)}`; `[0,1]`; `(ℝ²,t\|a₁−a₂\|)` | `dist_H(co(net),S)=1/(2n)` (nearest grid point; `δ_(1/(2n))` attains), `n+1 ≤ 1/ε+2`; `⌈1/(2ε)⌉`; `Fin≤2`, diam `1/t` | Checks correct | none (r5) |
| 6.0 relation, `d=2` | `Θ₁₂=−θ` | `W_(1,0)W_(0,1)=e^(−πiθ)W_(1,1)`, `W_(0,1)W_(1,0)=e^(πiθ)W_(1,1)`: `U₂U₁=e^(2πiθ)U₁U₂` | matches N6 | none (r5) |
| 6.0 supplier convention; `δ_p∗δ_q` | HI's `c(x,y−x)h(y−x)`; (9.1) | `λ_c(x)δ_q=c(x,q)δ_(x+q)`; `(δ_p∗δ_q)(p+q)=σ(p,p+q)=σ(p,q)` | matches | none (r5) |
| 6.0 negative control | `d=1`, `B=C({±1})` | `V_2=1`, `τ_B(V_2)=1≠0` | hypothesis fails, map not injective | none (r5) |
| 6.1 `V*π_τ(U₂)V` | `δ_(m,n)` | phase `πiθmn+2πiθm−πiθm(n+1)=πiθm`; `σ((0,1),(m,n))=e^(πiθm)` | equal | none (r5) |
| 6.1 `E_p` | `a=W_q` | `∫z^(q−p)dz·W_q=δ_(p,q)W_q=τ(W_qW_p*)W_p` | holds | none (r5) |
| 6.2 Dirac bound | `W_(1,0)+W_(−1,0)` | `x=2πi(W−W*)`, `‖x‖=4π`, `y=0`; `σ₁x−σ₂y=[[0,x+iy],[x−iy,0]]` | both bounds attained | none (r5) |
| 6.3 Følner boxes; Harper | `d=2,n=1,k=(1,0),(1,1)`; `θ=1/2` | `4≤4`, `6≤8`; cross terms cancel, `A+B` with `A=2+2cos2x`, `B=2+2cos2y` central: `‖H‖²=8` vs `16` at `0` | Checks correct | none (r5) |
| 6.4 support functions | `a=(−1,−3)`, `R=1,2,3` | `max(\|R−1\|,\|R−3\|)−R=1,−1,−1`; `max(a)=−1` | `R≥2` needed | none (r5) |
| 6.5 coboundary | `N₁₂=1`, `p=(1,0)`, `q=(0,1)` | `σ_(Θ+N)/σ_Θ=e^(πi p₁q₂−πi p₂q₁)`; `b(p)b(q)/b(p+q)=e^(−πi(p₁q₂+p₂q₁))`; ratio `e^(2πi p₁q₂)=1` | `equivOfCoboundary` hypothesis `β·c(p+q)=α·c(p)c(q)` holds | none (r5) |
| 6.5 global `δ` | `D` fundamental domain, `K={dist(·,D)≤1}` | `‖Θ−Ψ‖<δ≤1`, `Θ−N∈D` gives `Ψ−N∈K`; `dist_q(A_Θ,A_Ψ)=dist_q(A_(Θ−N),A_(Ψ−N))<ε` | Theorem 9.2 as stated | none (r5) |

**Checks per definition.** Unchanged since the previous review except §5.1, whose fourth Check was reworded and recomputed above. Every `### k.n` still carries at least three Checks, a `*Needs:*` line, and each layer ends with `### Examples` and `### Dependencies`.

**Counts.** 4 sample locators re-read in the changed passages; 8 cross-roadmap citations resolved at their current heads or on main; 14 pinned declarations opened across two Tau Ceti revisions; 37 Lean declarations elaborated; 17 sorried statements probed for padding; 10 new and 54 carried adversarial rows.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): the DOI resolves to JSTOR, which is paywalled. It is consumed only through VonNeumannAlgebras V8.CompactErgodicActions.
- R02's rebase repair: building `Suggested.lean` against main's pin 2fd255d was not run, because this review may not change the lake manifest. Only the presence of the cited Tau Ceti declarations at 2fd255d was checked.

## Source issues

- **Misprint** in rieffel00 at Example 6.5, printed page 30: the source defines the domain as the self-adjoint elements with the seminorm of capital `A` finite; it should be the seminorm of the element `a`; affects nothing.

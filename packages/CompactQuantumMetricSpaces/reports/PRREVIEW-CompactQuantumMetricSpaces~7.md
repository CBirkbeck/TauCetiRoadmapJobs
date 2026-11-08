# Review of CompactQuantumMetricSpaces (pull request #1155 at c4343b9)

**Verdict:** needs changes

This is an incremental re-review of the 140 lines (85 insertions, 55 deletions) changed in `TauCetiRoadmap/CompactQuantumMetricSpaces/README.md` since 92ab84b. `Suggested.lean` and `metadata.toml` are unchanged, and nothing changed outside the folder. One finding remains, the previous R02 (P3), still unrepaired. The repairs of the previous R01 and R03 are correct and introduce no new problem. The gate passes.

## R01 (P3) — The module docstring names a Tau Ceti declaration and file absent at this branch's pin

**Location.** `TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean` lines 27–30: "provided by neither pinned library (the smooth noncommutative torus `TauCeti.SmoothNoncommutativeTorus θ` of `TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.lean`, a star algebra of rapidly decreasing coefficient functions, carries no norm and no completion)".

**Claim.** The pinned Tau Ceti has that file and declaration.

**Witness.** This branch's `lake-manifest.json` pins Tau Ceti at a91d3aa, and `git ls-tree -r a91d3aa` lists 0 paths under `TauCeti/NoncommutativeGeometry/`. The file exists at main's pin 2fd255d (structure at line 230), which this branch does not carry.

This is the third review in a row to raise it (as R01 in the fifth review and R02 in the sixth). No repair report marks it as not actionable, and the second repair below needs no rebase.

**Repair.** Either of these:
- Rebase onto main, so the branch takes the pin 2fd255d, and re-run the gate including the build. At 2fd255d the sentence is true as written. `TauCeti.SmoothNoncommutativeTorus` (`SmoothTorus/Basic.lean` line 230, namespace `TauCeti` from line 75) has `Ring`, `Algebra ℂ`, `StarRing` and `StarModule ℂ` instances (lines 453–519) and no norm instance.
- Keep the pin a91d3aa and replace the parenthesis with "(neither pinned library has the rotation algebra or a smooth subalgebra of it)".

**Repair tested.** At 2fd255d, the declarations this round's other repairs depend on are unchanged. `KantorovichRubinstein.lean` has the same variable blocks (lines 115 and 184–185) and theorems (lines 161 and 304). `TauCeti.HasFiniteMoment` is at `Wasserstein/Basic.lean` line 445 (line 415 at a91d3aa). So after a rebase the repaired contract (README lines 229–239) and §3.3 *Needs:* stay true. The build at 2fd255d was not run (see Not verifiable).

## Previous findings

- R01 — repaired: README line 1509, "The gauge action of §6.0 is point-norm continuous by OperatorKTheory K7.5 at `L = ℤᵈ`, `c = σ_Θ`", plus the Scope deferral (lines 101–104), the contract bullet (309–314), §6.1 *Needs:* (1538) and Layer 6 Dependencies (1699).
- R02 — not repaired: `Suggested.lean` lines 28–30, "the smooth noncommutative torus `TauCeti.SmoothNoncommutativeTorus θ` of `TauCeti/NoncommutativeGeometry/SmoothTorus/Basic.lean`", is unchanged, and the pin is still a91d3aa. Carried as R01.
- R03 — repaired: lines 234–237, "The basepoint-normalized form assumes a pseudometric space with `OpensMeasurableSpace X`, `SecondCountableTopology X` and `StandardBorelSpace X`, two probability measures with `TauCeti.HasFiniteMoment 1 μ` …"; §3.3 *Needs:* (lines 896–897) now lists that declaration and `TauCeti.HasFiniteMoment`.

## Verified sound

**Gate and direction.**
- The worker's gate at c4343b9 passes every check, `build=0` included. My rerun (`--base origin/main`) prints the same line without the build field, then `OK`.
- My rerun of the dependency check with `--movable`:

```
depcheck: 244 roadmaps, 2462 edges, 0 problem(s)
```

- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Merge order: VonNeumannAlgebras is at line 6, CStarAlgebras at 8, HilbertModules at 9, OperatorKTheory at 10 and this roadmap at 209.
- OperatorKTheory is not on main (3b3f7ef), so its pull request adds a new roadmap folder and is a permitted supplier. The new edge points down the merge order. The description's depends-on list names it.

**Elaboration and signatures.**
- `lake env lean` on a scratch copy of `Suggested.lean`, with `#check @name` appended for its 37 declarations, exits 0 with 17 "declaration uses `sorry`" warnings and no other diagnostic.
- `Suggested.lean` has no diff since 92ab84b. Every elaborated type therefore equals the one the previous reviews compared with the README. I re-compared the one statement the changed README text describes, `stateEDist_integrationState`: carriers `[MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]`, two probability measures, conclusion `stateEDist L … = TauCeti.wassersteinEDist 1 μ ν`. These are the carriers of the instance probe below. No binder changed.
- Padding probe: on a copy with each of the 17 `sorry` lines replaced by `first | rfl | simp | infer_instance | (intros; rfl) | (intros; simp) | aesop`, all 17 fail (10 "aesop made no progress", 7 unsolved goals).
- Instance and moment probe (a scratch file with `import Mathlib` and Tau Ceti `Wasserstein.Basic`; exit 0, no diagnostic):
  - Under `[MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]`, `inferInstance` closes `OpensMeasurableSpace X`, `SecondCountableTopology X`, `StandardBorelSpace X` and `PolishSpace X`. This is the contract's "a compact metric space is Polish".
  - `TauCeti.HasFiniteMoment 1 μ` holds for every probability measure `μ`. The proof uses `MemLp.of_enorm_bound` with the bound `Metric.ediam univ`, finite by compactness, as §3.3 says. Empty `X` is excluded because `μ univ = 1`.

**Headlines.** Unchanged since the previous review: `tendsto_stateEDist_iff`, `closedLipNorm_recovery`, `stateEDist_integrationState`, `exists_closedLipNorm_actionLip`, `quantumGHEDist_eq_quotientQuantumGHEDist`, `quantumGHEDist_triangle`, `quantumGHEDist_eq_zero_iff`, `exists_limit_of_cauchySeq_quantumGHEDist` and `totallyBounded_quantumGHEDist_iff` are all stated. The docstring names three items as not statable: the §5.5 isometry-class space, `Φ_θ` (§6.1) and the §6.5 continuity. At either pin no library has a norm on the rotation algebra, so `Φ_θ` stays not statable; only the docstring's parenthesis is wrong (R01).

**Cross-roadmap citations resolved this round (6).**
- OperatorKTheory (#866, head b328ec07):
  - Line 28: its citation convention, "Subsection k.n of layer Kk is cited as `Kk.n`", so "K7.5" is its own id.
  - Scope, lines 21–25: it owns `C*(L, c)`, with its gauge action, built in 7.5.
  - §7.5, lines 1825–1838: any discrete abelian `L`; `c` with `TauCeti.IsFactorSet c` and `|c| = 1`; twisted shifts `W_xδ_z = c(x,z)δ_(x+z)`; `C*(L, c)` defined as the norm closure of their span; `α_χ = Ad(M_χ)`.
  - Line 1847: `W_0 = 1` and `W_x* = conj(c(x,−x))W_(−x)`.
  - Line 1850: `α_χ(W_y) = χ(y)W_y`, norm continuous in `χ` at each element.
  - Check, line 1882: `M_χW_xM_χ*δ_z = χ(x)W_xδ_z`.
  - Every clause of the new contract bullet (README lines 309–314) and of the Scope deferral (lines 101–104) is there.
- HeisenbergImprimitivity (#1149, head a9eeb6ec, unchanged since the previous review): §3.1 (lines 440–462) states the gauge action but no continuity of it. `roadmaps grep -i 'gauge action.{0,60}(norm|strongly|point-norm) continu'` over every open head and main finds only OperatorKTheory line 1850 and this README. The new deferral therefore names the only owner, and this roadmap no longer states the theorem.
- NoncommutativeGeometry on main (3b3f7ef):
  - N6, line 481: joint strong continuity of `β` on `A_θ = C(𝕋)⋊ℤ`. This holds for `d = 2` only and on another carrier, and §6.1 consumes N6 and N7 only at `d = 2`.
  - The N5, N6 and N7 headings are at lines 410, 475 and 530.
- RepresentationTheory/CompactGroups on main: Layer 0, line 205 (normalized Haar measure and averaging), cited by §6.1.

**Ownership note (not a finding here).** HeisenbergImprimitivity §3.1 and OperatorKTheory 7.5 still both claim `C*(L, c)` with its gauge action:
- HeisenbergImprimitivity Downstream consumers, lines 821–827, calls OperatorKTheory's algebras instances of its §3.1.
- OperatorKTheory's Scope, lines 21–25, claims to build them.

This roadmap now takes disjoint facts from each: from HeisenbergImprimitivity the trace, Fourier coefficients, fixed algebra and gauge average; from OperatorKTheory only the continuity. Which of the two owns the algebra is for their reviews; §6.0–§6.1 should cite whichever survives. Ownership against open pull requests was checked through the brief's sibling checkouts and `roadmaps grep`.

**Pinned declarations opened this round (12).**
- At a91d3aa, `KantorovichRubinstein.lean`:
  - line 83: the ambient `[MeasurableSpace X]`;
  - line 115: `[PseudoMetricSpace X] [CompactSpace X] [OpensMeasurableSpace X]`;
  - line 161: `wassersteinEDist_one_eq_iSup_of_compactSpace`, with two probability measures and no moment hypothesis;
  - lines 184–185: `[PseudoMetricSpace X] [OpensMeasurableSpace X] [SecondCountableTopology X] [StandardBorelSpace X]`;
  - line 304: `wassersteinEDist_one_eq_iSup_apply_eq_zero`, with `hμ hν : HasFiniteMoment 1 _` and `x₀ : X`.
- At a91d3aa, `Wasserstein/Basic.lean`:
  - line 415: `HasFiniteMoment p ν := ∃ x, MemLp (edist x ·) p ν`;
  - line 642: `hasFiniteMoment_of_ae_mem_finset`, the model for the probe.
- At the Mathlib pin:
  - `RealRMK.rieszMeasure` (`RieszMarkovKakutani/Real.lean` line 65);
  - `ContinuousMap.toLp` (`LpSpace/ContinuousFunctions.lean` line 143);
  - `MemLp.of_enorm_bound` (`LpSeminorm/Basic.lean` line 615).
- At 2fd255d: `SmoothTorus/Basic.lean` lines 75, 230 and 453–519, and the Kantorovich–Rubinstein and `HasFiniteMoment` lines given in R01.

**Sources: the seeded sample where it falls in the changed passages.** Of the sample, §3.3 and §6.1 are changed. Neither cites a source passage: their locators are library declarations and supplier sections, all checked above.

| README target | Locator | Lines | Agrees |
|---|---|---|---|
| 3.3 contract and route | Tau Ceti `KantorovichRubinstein.lean` at a91d3aa | 115, 161, 184–185, 304 | yes, both forms with their full hypotheses |
| 3.3 moments | Tau Ceti `Wasserstein/Basic.lean` at a91d3aa | 415 | yes, proved on compact metric Borel `X` in the probe |
| 6.1 point-norm continuity | OperatorKTheory 7.5 (b328ec07) | 1825–1850, 1882 | yes |
| 6.1 trace, coefficients, gauge average | HeisenbergImprimitivity §3.1 (a9eeb6ec) | 440–462, 477 | yes, unchanged |
| 6.1 `d = 2` | NoncommutativeGeometry N6, N7 (main) | 475–481, 530 | yes |

The other sampled targets (0.2, 1.1, 1.6, 3.1, 3.5, 3.6, 4.3, 4.5, 4.6, 5.2, 5.5, 6.3, 6.5) are untouched by the diff. Their locators were checked in earlier reviews and were not re-read.

**Adversarial table.** The first 14 rows are new, with values computed this round for every changed statement. The 59 rows after them are carried from the previous review (~6) for statements the diff leaves untouched. Of these, 54 date from the fifth review (r5).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Scope and contract: OperatorKTheory 7.5 hypotheses at `c = σ_Θ` | `σ_Θ(p,q) = exp(πi pᵀΘq)`; `d = 2`, `Θ₁₂ = −θ` | `σ(0,q) = σ(q,0) = 1`; cocycle sides both `exp(πi(pᵀΘq + pᵀΘr + qᵀΘr))`; `\|σ\| = 1` | `TauCeti.IsFactorSet` with `\|c\| = 1` holds | none |
| Contract: supplier star formula against §6.0 | `W_x* = conj(c(x,−x))W_(−x)`; `p = (1,0)`, `q = (m,n)` | `c(p,−p) = exp(−πi pᵀΘp) = 1`; `W_(1,0)*δ_q = conj(exp(−πiθn))δ_(m−1,n) = exp(πiθn)δ_(m−1,n) = W_(−1,0)δ_q` | `W_p* = W_(−p)`, as §6.0 says | none |
| 6.1 supplier's `C*(L, c)` equals `A_Θ` | `W_0δ_q = σ(0,q)δ_q`; `W_pW_q = σ(p,q)W_(p+q)` | `W_0 = 1`; products and adjoints of `W`'s stay in the span; closure of the span equals the C*-algebra generated | the same operator algebra on `ℓ²(ℤᵈ)` | none (the parenthesis names unit and star; §6.0 states the product rule) |
| 6.1 `Ad(M_χ) = α_z` | `d = 2`, `z = (i, −1)`, `p = (1,0)`, `q = (0,1)` | `M_χ*δ_q = −δ_(0,1)`; `W_p`: `−exp(−πiθ)δ_(1,1)`; `M_χ`, `χ(1,1) = −i`: `i·exp(−πiθ)δ_(1,1)`; `χ(p)W_pδ_q = i·exp(−πiθ)δ_(1,1)` | equal | none |
| 6.1 `z ↦ χ_z` continuous into `L̂` | discrete `ℤᵈ` (compact-open = pointwise); `d = 0` | each `z ↦ z^p` is continuous; `d = 0`: `T⁰` is a point, `A_Θ = ℂ` | continuous | none |
| 6.1 point-norm, not uniform, continuity | `d = 1`, `a = W_1`, `z = e^(iε)`; supremum over the `W_p` | `‖α_z(W_1) − W_1‖ = 2\|sin(ε/2)\| → 0`; for `0 < ε < 2π/3` some `p` has `pε ∈ [2π/3, 4π/3]`, so `sup_p ‖α_z(W_p) − W_p‖ ≥ √3` | "norm continuous at each element" is the right notion | none |
| 6.1 new Check, `d = 1` | `χ(p) = z^p`, `δ_q` | `Ad(M_χ)W_1δ_q = z^(q+1)z^(−q)δ_(q+1) = zW_1δ_q`; `M_χ*W_1M_χδ_q = z^(−q−1)z^qδ_(q+1) = z^(−1)W_1δ_q` | Check correct; it separates the reversed convention | none |
| Contract, compact form | Tau Ceti lines 83, 115, 161 | `[MeasurableSpace] [PseudoMetricSpace] [CompactSpace] [OpensMeasurableSpace]`, two `IsProbabilityMeasure`, no moment | matches README lines 233–234 | none |
| Contract, basepoint form | Tau Ceti lines 184–185, 304–305 | `[PseudoMetricSpace] [OpensMeasurableSpace] [SecondCountableTopology] [StandardBorelSpace]`, `hμ hν : HasFiniteMoment 1 _`, `x₀ : X`, no `CompactSpace` | matches lines 234–237 | none |
| Contract: instances on compact metric Borel `X` | Lean probe | `inferInstance` closes `OpensMeasurableSpace`, `SecondCountableTopology`, `StandardBorelSpace`, `PolishSpace` (exit 0) | true | none |
| 3.3 every probability measure has a finite first moment | Lean probe; `X = ∅` | `MemLp.of_enorm_bound` with `C = ediam univ < ∞`; `X = ∅` is impossible since `μ univ = 1 ≠ 0` | proved | none |
| 3.3 Check: first moments | `[0, 1]`, `μ = δ_1`, `x₀ = 0`; the Cauchy law | `∫\|t − x₀\| dμ ≤ 1`, attained (`= 1`) at `δ_1`, `x₀ = 0`; Cauchy `∫_(−R)^R \|t\| dμ = (1/π)ln(1 + R²) → ∞` | Check correct | none |
| 3.3 absolute value removed by `f ↦ −f` | `X = {0, 1}`, `μ = δ_0`, `ν = δ_1`, `f = id` | `ofReal(f(0) − f(1)) = ofReal(−1) = 0`; `−f` gives `1`; supremum `1 = \|f(0) − f(1)\| = W₁` | the Tau Ceti supremum equals `ρ_L` | none |
| Docstring: smooth torus at the pins | a91d3aa; 2fd255d | `ls-tree`: 0 paths under `NoncommutativeGeometry/`; at 2fd255d structure at line 230, ring and star instances, no `Norm` | false at the branch's pin | R01 |
| 4.6 `actionLip = classicalLip` on `C(G/H)`, abelian | `G = T`, `ℓ = \|θ\|`, `H = {0, π}`, `f = cos 2θ` | `classicalLip = sup\|f′\| = 2`; `‖f(·−x) − f‖ = 2\|sin x\|`, `sup 2\|sin x\|/\|x\| = 2` (as `x → 0`) | equal | none (carried from ~6) |
| 4.6 the witness `x = gh⁻¹k⁻¹`, non-abelian | `S₃`, `ℓ` = transposition length (conjugation-invariant), `H = ⟨(12)⟩`, `g = e`, `k = (13)` | `d = min(ℓ(13), ℓ((13)(12))) = min(1, 2) = 1`; `x = (13)`: `x⁻¹gH = (13)H = kH`, `ℓ(x) = 1 = ℓ(g⁻¹k)` | both identities hold | none (carried from ~6) |
| 4.6 conjugation invariance needed for well-definedness | `S₃`, Coxeter length for `{(12), (23)}`, `H = ⟨(12)⟩`, representatives `e` and `(12)` of `H`, `k = (23)` | `min(ℓ(23), ℓ((23)(12))) = min(1, 2) = 1`; `min(ℓ((12)(23)), ℓ((12)(23)(12))) = min(2, ℓ(13) = 3) = 2` | `d` ill-defined without the hypothesis; the hypothesis is present | none (carried from ~6) |
| 5.1 Check: domain of `M_ε` | `E = C([0,1], ℝ)`, `a = √t`; `ℝ² × ℝ` with `M_δ` | `L_E(√t) = sup √s/s = ∞`, so `M_ε(a, b) = ∞`; `N_ε(a, b) ≤ ε⁻¹ max(1, ‖b‖) < ∞`; for `M_δ`, `N_ε ≤ ε⁻¹‖v‖`, `dom M_ε = ℝ³ = ℝ² × ℝ` | Check correct | none (carried from ~6) |
| 6.1 average extended from positive `a` | `a = W_p`, not positive | `∫ z^p dz · W_p = δ_(p,0)W_p = τ_Θ(W_p)·1`; `W_p` = combination of four positives, both sides linear | consistent | none (carried from ~6) |
| 0.1 interval formula | `ℝ²`, `e=(1,1)`, `a=(1,1)` | Euclidean `√2`, max norm `1`; `−e ≤ a ≤ e` | formula selects the max norm | none (carried from ~6, r5) |
| 0.1 non-Archimedean Check | cone `{x>\|y\|} ∪ {(t,−t)}`, `a=(−1,−1)`, `(0,1)` | `εe−a=(1+ε,1)` in cone ∀ε; `−a=(1,1)` not; `a+re=(r−1,−1)` in cone iff `r>2` or ray at `r=2`: `‖a‖=2`; `(0,1)`: `(r,−1)` in cone iff `r≥1`, `(r,1)` iff `r>1`: inf `1`, fails at `r=1`; `(ε,−1)` in cone iff `ε≥1` | Check correct | none (carried from ~6, r5) |
| 0.1 `a ≥ 0 ↔ ‖‖a‖e−a‖ ≤ ‖a‖` | `(1,0)`; `(1,−1)` | `‖(0,1)‖=1 ≤ 1`; `‖(0,2)‖=2 > 1` | both directions | none (carried from ~6, r5) |
| 0.1 Archimedean from the formula | `a ≤ εe ∀ε` | `b=a+‖a‖e`: `0 ≤ b ≤ (‖a‖+ε)e` so `‖b‖ ≤ ‖a‖`, then `b ≤ ‖a‖e` | derivation valid | none (carried from ~6, r5) |
| 0.2 normalization without positivity | `2a₁−a₂`; `f(0)−f(1)+f(1/2)` | value `1` at `e`, norm `3`; unital, norm `3` | not states, not contractive | none (carried from ~6, r5) |
| 0.3 `norm_eq_iSup_states` | `(1,−1)`; `E=0` | `sup\|2t−1\|=1`; `‖0‖=0≠1` so `he` excludes it; `iSup` over a bounded family | holds | none (carried from ~6, r5) |
| 0.4 dual ball | `λ=(1/2,−1/2)` | `‖λ‖=1`, `t=1/2`, `φ=(3/4,1/4)`, `ψ=(1/4,3/4)`, `φ−ψ=λ`; `φ′−ψ′=(1,−1)≠λ` | exact | none (carried from ~6, r5) |
| 0.4 quotient norm | `a=(3,1)` | `(3−1)/2=1=‖(1,−1)‖` | holds | none (carried from ~6, r5) |
| 0.5 algebraic quotient by `o(t)` | class of `t` | `ε−t+max(t−ε,0)=max(ε−t,0) ≥ 0`; `−t=h+g`, `h≥0`, `g=o(t)` impossible near `0` | non-Archimedean | none (carried from ~6, r5) |
| 1.1 `map_smul` junk | `r=0`, `L a=∞` | `L 0=0=0·∞` | consistent | none (carried from ~6, r5) |
| 1.1 kernel axiom | `\|a₁\|`; `∞` off `ℝe` | kernel `{a₁=0}`; domain not dense | excluded | none (carried from ~6, r5) |
| 1.2 `ρ(δ_x, Leb)` | `x=0, 1/2` | `x²−x+1/2`: `1/2`, `1/4` | holds | none (carried from ~6, r5) |
| 1.3 radius, centered ball | `\|a₁−a₂\|`, `φ=ev₂` | diam `1`, `r=1/2`; ball `[−1,1]×{0}`, norm sup `1=diam > 1/2` | holds | none (carried from ~6, r5) |
| 1.4 section bound | `a=(1,−1)`, `φ=ev₁` | `‖q(a)‖=1`, `‖a−φ(a)e‖=‖(0,−2)‖=2` | constant `2` sharp | none (carried from ~6, r5) |
| 1.5 separability | `{L≤1} ⊆ B_φ+ℝe`, `dom L=⋃ n{L≤1}` | `a−φ(a)e ∈ B_φ`; `ℓ^∞` nonseparable | no Lip-norm on `ℓ^∞` | none (carried from ~6, r5) |
| 1.6 `G_n` | `n=2` | `G_n′=min(n\|t\|,1)`, `L(G_n)=1`; `‖G_n−(t+1)‖=∫₀^{1/n}(1−ns)ds=1/(2n)`; `L(t+1)=2` | not closed | none (carried from ~6, r5) |
| 2.1 kernel loss | `p_n=∫q_n`, `q_n→g′` | `L(p_n) ≤ ‖q_n−g′‖_∞→0`, `‖q(p_n)‖→1/2` | `g` in closure kernel, radius `∞` | none (carried from ~6, r5) |
| 2.2 `closedLipNorm_recovery` | `a∉dom L`, sup `=C<∞` | `a` in the `E`-closure of `C·{L≤1}={L≤C}` by closed sublevel sets, so `L(a)≤C` | `∞` case holds | none (carried from ~6, r5) |
| 2.2 `√t` | `φ=δ_h`, `ψ=δ_0` | `√h/h=h^(−1/2)→∞` | sup `∞=L(a)` | none (carried from ~6, r5) |
| 2.3 simplex | `K⊆ℝ³` | `K−K={Σx=0, Σ\|x\|≤2}` (`c=(1−Σx⁺)/3≥0`); `‖(1/2,1/2,−1)‖₂=√1.5<√2=W₁` | extreme points do not recover `L` | none (carried from ~6, r5) |
| 2.3 `\|x−y\|²` | `0,1/2,1` | `1 > 1/4+1/4` | metric hypothesis needed | none (carried from ~6, r5) |
| 2.4 pullback direction | `T=id`, `L_F=L_E/2` | `ρ_E(T*φ,T*ψ)=ρ_F/2` | correct | none (carried from ~6, r5) |
| 2.5 edge quotient; restriction vs quotient; image norm | `max\|a_i−a_j\|`; `\|a₁−a₂\|+2\|a₂−a₃\|`; `b=(0,1)` | `\|b₁−b₂\|` at `a₃=(b₁+b₂)/2`; `\|b₁−b₃\|` at `t=b₃` vs `2\|a₁−a₃\|`; image norm `1`, every lift has `a(1)=2` | all Checks correct | none (carried from ~6, r5) |
| 3.1 `classicalLip`, Leibniz | `t²` on `[0,1]`; `X=∅` | `sup(s+t)=2 ≤ 1+1`; `0` | holds | none (carried from ~6, r5) |
| 3.2 `exists_closedLipNorm_classicalLip` | `X=∅` | `C(∅)=0`, `L=0` satisfies every field, `TotallyBounded` of `{0}` | statement also true for empty `X`; `Nonempty` keeps the README's generality | none (carried from ~6, r5) |
| 3.2 `√x`, inverse law | `f_r=min(rx,√x)`; `1/t` on `[1,2]` | error `1/(4r)` at `x=1/(4r²)`; `classicalLip(1/t)=1=1²·1` | sharp | none (carried from ~6, r5) |
| 3.3 `stateEDist_integrationState` | `{0,1}`; `δ_(1/2)` vs Leb | `\|t−s\|`; `1/4`; KR sup over `LipschitzWith 1 f` of `∫f dμ−∫f dν` equals the `\|·\|` form by `f↦−f` | equals `W₁` | none (carried from ~6, r5) |
| 3.5 `M₂`, `D=diag(1,−1)` | `[D,a]` | entries `2a₁₂`, `−2a₂₁`; kernel diagonal `ℂ²` | not a Lip-norm | none (carried from ~6, r5) |
| 3.5 maximal-domain closedness (owned) | `a_n→a`, `‖[D,a_n]‖≤C` | `D a_nξ` bounded, weak subsequence limit in the closed graph: `aξ∈dom D`, `‖[D,a]ξ‖≤C‖ξ‖` | true | none (carried from ~6, r5) |
| 4.1 inverse law | `C(T)`, `2+z` | `L(f)=1`, `‖f⁻¹‖=1`, `L(f⁻¹)=sup 1/\|2+z\|²=1` | equality | none (carried from ~6, r5) |
| 4.3 `exists_closedLipNorm_actionLip` | `T`, `ℓ=\|θ\|`; `ℤ/2`; `A=0` | `∫ℓ=π/2`, diam `π` sharp; `1/2`, diam `1`; `L=0` satisfies all fields | true, Lean needs no `A≠0` | none (carried from ~6, r5) |
| 4.4 `ℓ` dominates a Lie length (owned) | `ℓ(x_k)/d(x_k)→0` | `ℓ(x_k^{m_k}) ≤ m_kℓ(x_k)→0` on the shell `d∈[r/2,r]` where `ℓ≥c>0` | contradiction, claim true | none (carried from ~6, r5) |
| 4.4 kernels | `T`, `1⊕z`; `ℤ/2`, `1⊕sgn`; `T`, `1⊕z²` | `2+2cosθ`, support `{−n..n}`; `k_n=2δ_1`, `δ_n=0`; maxima at `0,π`, `δ_n→π/2` | Checks correct | none (carried from ~6, r5) |
| 4.5 `actionLip=L_der` | path; `exp(tX)` | `≤` by `∫‖c′‖`; `≥` by `ℓ(exp tX) ≤ \|t\|‖X‖` | equality for any norm | none (carried from ~6, r5) |
| 4.6 Jordan factor | `a∘b=(ab+ba)/2` | `L ≤ (L(ab)+L(ba))/2 ≤ L(a)‖b‖+‖a‖L(b)` | factor `1` | none (carried from ~6, r5) |
| 5.1 `M_δ` | `ℝ²` vs `ℝ` | `ρ_M(φ_t,ψ)=\|t−1/2\|+δ`, Hausdorff `1/2+δ`; `dist_q=1/2` by diameters | Check correct | none (carried from ~6, r5) |
| 5.1 `ρ_M ≤ ρ_(M_ε) ≤ ρ_M+2ε` | `M_ε≤M`; `M_ε(v)≤1` | `‖v−w‖≤ε(1+η)`, `M(w)≤1+η`: `\|φ(v)−ψ(v)\| ≤ (1+η)(ρ_M+2ε)` | both inequalities | none (carried from ~6, r5) |
| 5.2 compatibility | `P=id`, `L_F=L_E/2` | diam `1` vs `2`, `dist_q ≥ 1/2` | Check correct | none (carried from ~6, r5) |
| 5.2 quotient estimate | `K₁={δ_0}`, `K₂={δ_1}`; `K=S(E)` | `dist_q(ℝ,ℝ)=0 < 1=W₁`; quotient by `S(E)` is `E` since restriction is injective | strict case, special case | none (carried from ~6, r5) |
| 5.3 two-point spaces | `d=1` vs `d=2` | `ghDist=1/2`, `dist_q ≥ (2−1)/2` | equality | none (carried from ~6, r5) |
| 5.4 `quantumGHEDist_eq_zero_iff` | `C¹` vs `C[0,1]` | distance `0`; `C¹` fails `CompleteSpace`, `‖f′‖_∞` fails closedness | hypotheses needed and present | none (carried from ~6, r5) |
| 5.4 closed = Rieffel-closed | complete `E`, closed sublevel sets | Kadison onto `Aff_c`; a `1`-Lipschitz affine `â` has `L(a)≤1` by recovery | `E` is `A^c` | none (carried from ~6, r5) |
| 5.5 limit of `(D,L_D)` | closed completion | diagonal bridge with `{L_D≤t}` dense in `{L̄≤t}`: `dist_q(D,D̄)=0` | closed limit exists | none (carried from ~6, r5) |
| 5.6 `Fin`, `Scv`, nets | `{δ_(k/n)}`; `[0,1]`; `(ℝ²,t\|a₁−a₂\|)` | `dist_H(co(net),S)=1/(2n)` (nearest grid point; `δ_(1/(2n))` attains), `n+1 ≤ 1/ε+2`; `⌈1/(2ε)⌉`; `Fin≤2`, diam `1/t` | Checks correct | none (carried from ~6, r5) |
| 6.0 relation, `d=2` | `Θ₁₂=−θ` | `W_(1,0)W_(0,1)=e^(−πiθ)W_(1,1)`, `W_(0,1)W_(1,0)=e^(πiθ)W_(1,1)`: `U₂U₁=e^(2πiθ)U₁U₂` | matches N6 | none (carried from ~6, r5) |
| 6.0 supplier convention; `δ_p∗δ_q` | HI's `c(x,y−x)h(y−x)`; (9.1) | `λ_c(x)δ_q=c(x,q)δ_(x+q)`; `(δ_p∗δ_q)(p+q)=σ(p,p+q)=σ(p,q)` | matches | none (carried from ~6, r5) |
| 6.0 negative control | `d=1`, `B=C({±1})` | `V_2=1`, `τ_B(V_2)=1≠0` | hypothesis fails, map not injective | none (carried from ~6, r5) |
| 6.1 `V*π_τ(U₂)V` | `δ_(m,n)` | phase `πiθmn+2πiθm−πiθm(n+1)=πiθm`; `σ((0,1),(m,n))=e^(πiθm)` | equal | none (carried from ~6, r5) |
| 6.1 `E_p` | `a=W_q` | `∫z^(q−p)dz·W_q=δ_(p,q)W_q=τ(W_qW_p*)W_p` | holds | none (carried from ~6, r5) |
| 6.2 Dirac bound | `W_(1,0)+W_(−1,0)` | `x=2πi(W−W*)`, `‖x‖=4π`, `y=0`; `σ₁x−σ₂y=[[0,x+iy],[x−iy,0]]` | both bounds attained | none (carried from ~6, r5) |
| 6.3 Følner boxes; Harper | `d=2,n=1,k=(1,0),(1,1)`; `θ=1/2` | `4≤4`, `6≤8`; cross terms cancel, `A+B` with `A=2+2cos2x`, `B=2+2cos2y` central: `‖H‖²=8` vs `16` at `0` | Checks correct | none (carried from ~6, r5) |
| 6.4 support functions | `a=(−1,−3)`, `R=1,2,3` | `max(\|R−1\|,\|R−3\|)−R=1,−1,−1`; `max(a)=−1` | `R≥2` needed | none (carried from ~6, r5) |
| 6.5 coboundary | `N₁₂=1`, `p=(1,0)`, `q=(0,1)` | `σ_(Θ+N)/σ_Θ=e^(πi p₁q₂−πi p₂q₁)`; `b(p)b(q)/b(p+q)=e^(−πi(p₁q₂+p₂q₁))`; ratio `e^(2πi p₁q₂)=1` | `equivOfCoboundary` hypothesis `β·c(p+q)=α·c(p)c(q)` holds | none (carried from ~6, r5) |
| 6.5 global `δ` | `D` fundamental domain, `K={dist(·,D)≤1}` | `‖Θ−Ψ‖<δ≤1`, `Θ−N∈D` gives `Ψ−N∈K`; `dist_q(A_Θ,A_Ψ)=dist_q(A_(Θ−N),A_(Ψ−N))<ε` | Theorem 9.2 as stated | none (carried from ~6, r5) |

**Checks per definition.** Only §3.3 (one new Check, computed above) and §6.1 (one new Check, computed above) gained Checks; no Check was removed. Every `### k.n` still carries at least three Checks and a *Needs:* line, and each layer ends with `### Examples` and `### Dependencies`.

**Counts.** 6 cross-roadmap citations resolved at current heads or on main; 12 pinned declarations opened across two Tau Ceti revisions and the Mathlib pin; 37 Lean declarations elaborated; 17 sorried statements probed for padding; 2 Lean probes (instances, moment bound); 14 new and 59 carried adversarial rows.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): the DOI resolves to JSTOR, which is paywalled. This roadmap consumes it only through VonNeumannAlgebras V8.CompactErgodicActions.
- The build of `Suggested.lean` against main's pin 2fd255d (R01's rebase repair) was not run, because this review may not change the lake manifest. Only the presence of the cited Tau Ceti declarations at 2fd255d was checked, by `git show`.

## Source issues

- none

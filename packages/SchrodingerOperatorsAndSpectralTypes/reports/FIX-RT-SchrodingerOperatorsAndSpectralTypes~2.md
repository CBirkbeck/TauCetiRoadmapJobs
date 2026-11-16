# FIX-RT-SchrodingerOperatorsAndSpectralTypes~2

Repair of red-team round 2 (passes a and b) of `packages/SchrodingerOperatorsAndSpectralTypes`.
Six findings, no two overlapping, settled in six sections. Files changed: `README.md`,
`Suggested.lean` (one declaration, `pearson_tendsto`), `sources.toml` (one locator string).
`design/plan.json` is unchanged: no new supplier gap is needed.

## RT-SchrodingerOperatorsAndSpectralTypes~2a/F01 (P3) — applied

Layer 3 Dependencies gains "PDE §1.2 (3.6)", plus the Tau Ceti cusp-chart carriers (3.10) and the
Mathlib `LinearPMap`, `IsRiemannianManifold` and compact-operator APIs. Layer 4: "SA-C54, SA-E47" →
"SA-C54, SA-D22, SA-E47". Layer 1 gains BanachSpaceTheory B4 (2b/F01). A script then compared every
layer's *Needs:* roadmaps with its Dependencies: nothing is missing.

## RT-SchrodingerOperatorsAndSpectralTypes~2a/F02 (P3) — applied

References: "`rs2` (Ch. IX, §X.2, Theorem X.12)" → "(Ch. IX, §X.1, §X.2, Theorem X.12)". A sweep of
every body locator against its References entry found two more omissions: `rosenblum57` gains
"§§3–4" (§1.8) and `lp80` gains "§§4–7" (Downstream consumers). Both sections exist in the cached
texts (rosenblum57 line 142–157; lp80 line 343–935).

## RT-SchrodingerOperatorsAndSpectralTypes~2b/F01 (P2) — applied

The witness holds. BanachSpaceTheory B4 on main owns the compact Schmidt series with `s_n = a_n(T)`
(`TauCetiRoadmap/BanachSpaceTheory/README.md:299-322`), and SNumbers and VonNeumannAlgebras cite it
for the same thing. Changes: §1.9 route (Schmidt series of `C`, B4, compactness pin); §1.8 square
root (B4 for `V`, `|V|^{1/2}`; pinned `nuclearENorm_def`, `tsum_singularValue_sq_eq_hilbertSchmidtEnergy`);
*Needs:*; new contract and Scope bullet; Layer 1 Dependencies.

## RT-SchrodingerOperatorsAndSpectralTypes~2b/F02 (P2) — applied

README §1.9 and `pearson_tendsto` now take `H₁` on `ℋ₁` (`K₁`), `H₂` on `ℋ₂` (`K₂`), and `J`, `C`
between them. Added: the direct-sum reduction, the inclusion Check (recomputed), §1.8
for `C : ℋ → 𝒦`. yafaev04 line 116–198 states the one-space case.
Line 115 credits `J` to Kato's two-space theory (line 1051), and the README cites it so.

## RT-SchrodingerOperatorsAndSpectralTypes~2b/F03 (P3) — applied

The witness holds: in `ℕ ∪ {∞}` the three facts hold for `−diag(n)` (`∞ = ∞`). The rewritten Check
proves `μ_n = −∞` for all `n` (the old "`μ₁ = −∞`, so every `μ_n = −∞`" was a non sequitur). It shows
the failures: no least eigenvalue, an infinite-dimensional eigenspace sum, and `Module.finrank`'s
junk `0`.

## RT-SchrodingerOperatorsAndSpectralTypes~2b/F04 (P3) — applied

§1.8 *Needs:* adds UO-A01 (polarised-measure matrix elements and the bound
`|μ_{y,x}|(B) ≤ ‖P(B)y‖‖P(B)x‖`) and UO-B03 (the group `e^{isH}` as `e^{is·}[P_H]`, which its route
proves). The route now uses both (density `|g|² ≤ m²·dμ_y/dLeb`), and both contract entries say so.
§3.10 *Needs:* adds Tau Ceti `TauCeti.UpperHalfSpace`, `TauCeti.IsLocalRiemannianIsometry`,
`TauCeti.Manifold.instRiemannianBundleOpen`. The same sweep added: §3.6 Mathlib
`IsRiemannianManifold`; §1.9 Pearson 1.1, OI-B29.

## Checks run

**Elaboration.** `lake env lean packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean`, run
from the content checkout: exit 0, with exactly 12 warnings `declaration uses 'sorry'` (lines 87, 113,
123, 154, 173, 194, 218, 248, 275, 301, 354, 380), one per theorem. There are no errors and no other
warnings. No `TauCeti.*` object file was missing.

**`#check @name` pass.** All 19 declarations went into one scratch copy (kept in the job's scratch
directory, not the package), with 11 pinned names: `ContinuousLinearMap.nuclearENorm_def`,
`.singularValue`, `.tsum_singularValue_sq_eq_hilbertSchmidtEnergy`,
`.isCompactOperator_of_nuclearENorm_ne_top`, `.hilbertSchmidtEnergy`, `.hilbertSchmidtEnergy_indep`,
`TauCeti.Manifold.instRiemannianBundleOpen`, `TauCeti.IsLocalRiemannianIsometry`,
`TauCeti.UpperHalfSpace`, `IsRiemannianManifold`, `Module.finrank`. The copy elaborated once, and all
of them exist at the pins.

Only `pearson_tendsto` changed type. Elaborated, it is `∀ {K₁ K₂} [NormedAddCommGroup K₁]
[InnerProductSpace ℂ K₁] [CompleteSpace K₁] [NormedAddCommGroup K₂] [InnerProductSpace ℂ K₂]
[CompleteSpace K₂] (H₁ : K₁ →ₗ.[ℂ] K₁) (H₂ : K₂ →ₗ.[ℂ] K₂), IsSelfAdjoint H₁ → IsSelfAdjoint H₂ →
∀ (J C : K₁ →L[ℂ] K₂), C.nuclearENorm ≠ ∞ → … → (∃ y, Tendsto … atTop (𝓝 y)) ∧ ∃ y, Tendsto … atBot (𝓝 y)`.
This matches README §1.9 binder for binder, and no binder is lost. The other 18 types are unchanged
from the worker's signature file.

**Dependency check.**

    depcheck: 234 roadmaps, 2234 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The only new supplier is BanachSpaceTheory, which is on
main, so it adds no merge-order edge.

**Citations.** `roadmaps resolve` on the README (main 818115d and 444 open heads) lists no
cross-roadmap citation and no Lean name as found nowhere.

**Ownership.** I searched main by object: `grep` for Schmidt series, expansion and decomposition gives
BanachSpaceTheory B4, cited by SNumbers and VonNeumannAlgebras. `roadmaps grep -i Pearson` over main
and the open heads finds only statistics roadmaps (Pearson's χ² test, Neyman–Pearson); no roadmap
states Pearson's scattering theorem. No fully qualified name of `Suggested.lean` is declared
elsewhere.

**Gate failures.** None were listed for this round.

## Adversarial pass on changed or added statements

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Pearson, two spaces (§1.9, `pearson_tendsto`) | `ℋ₁ = ℋ₂`, `J = 1`, `C = V` | the hypothesis of Kato–Rosenblum: `⟪(H₁+V)ψ,φ⟫ − ⟪ψ,H₁φ⟫ = ⟪ψ,Vφ⟫` | true | none |
| same | `J = 0`, `C = 0` | `W(t)x = 0`, limit `0` | true | none |
| same | `ℋ₁ = L²(ℝ)`, `ℋ₂ = L²(ℝ) ⊕ ℂ`, `H₂ = M_x ⊕ 5`, `J` inclusion | `⟪xψ₁,φ⟫ − ⟪ψ₁,xφ⟫ = 0`; `W(t)x = (x, 0)` for all `t`; `W_± = J`, range `L² ⊕ 0 = ℋ_ac(H₂)` | true | new Check |
| same | `ℋ₂ = 0`; `ℋ₁ = 0` | `J = C = 0`, limit `0`; `x = 0`, limit `0` | true | none |
| same, negative control | `H₁ = M_x`, `H₂ = M_x + c` on `L²(ℝ)`, `J = 1` | `C = c·1`, gauge `∞`, excluded; `e^{itc}x` diverges | hypothesis needed | none |
| Duhamel sign, two spaces | `d/du ⟪e^{−iuH₂}ψ, J e^{−iuH₁}φ⟫` | `conj(−i)⟪H₂ψ_u,Jφ_u⟫ + (−i)⟪ψ_u,JH₁φ_u⟫ = i⟪ψ_u,Cφ_u⟫` | matches the route | none |
| Direct-sum reduction | `H₁⊕0`, `0⊕H₂`, `Ĵ(φ₁,φ₂) = (0,Jφ₁)` on `ℋ₁⊕ℋ₂` | `⟪(0,H₂ψ₂),(0,Jφ₁)⟫ − ⟪(ψ₁,ψ₂),(0,JH₁φ₁)⟫ = ⟪ψ₂,Cφ₁⟫`; `ℋ_ac(0 on ℋ₂) = 0` (measures `‖x‖²δ₀`); evolved `(x,0) ↦ (0, e^{itH₂}Je^{−itH₁}x)` | true | stated |
| Intertwining | `e^{isH₂}W(t)` | `e^{i(t+s)H₂}Je^{−i(t+s)H₁}e^{isH₁} = W(t+s)e^{isH₁}` | true | none |
| Rosenblum's lemma, `C : ℋ → 𝒦` (§1.8) | `𝒦 = ℂ`, `C = ⟨φ,·⟩`, `x = m1_{[0,1]}`, `φ` unit in `L²[0,1]` | `∫|⟨φ,e^{−itλ}x⟩|²dt = 2πm²` and `2πm²·‖φ‖² = 2πm²` | equality | none |
| same | `𝒦 = 0` | `0 ≤ 0` | true | none |
| Density bound of the route | `H = M_λ`, `x = m1_{[0,1]}`, `y = 1_{[0,2]}` | `g = m1_{[0,1]}`, `|g|² = m²1_{[0,1]} ≤ m²1_{[0,2]}`; `‖g‖² = m² ≤ 2m² = m²‖y‖²` | true | none |
| same | `M_λ ⊕ ½`, `x = (m1_{[0,1]},0)`, `y = (0,1)` | `μ_{y,x} = 0`, `g = 0 ≤ 0` | true | none |
| `hilbertSchmidtEnergy |V|^{1/2} b = nuclearENorm V` | `V = diag((−1)^{n+1}/n²)` | `a_n(V) = 1/(n+1)²`, sum `π²/6`; `a_n(|V|^{1/2}) = 1/(n+1)`, `Σ a_n² = π²/6` | equal | none |
| same | `V = −3⟨φ,·⟩φ`; `V = 0`; `V = diag(1/n)` (not trace class) | `3 = 3`; `0 = 0`; `∞ = ∞`, so the trace-class hypothesis of the claim excludes it | true | none |
| Schmidt series, B4 at `T = V` and `T = |V|^{1/2}` | `V = diag(1,−1/4)` | `V†V = diag(1,1/16)`, `s = (1, 1/4) = |λ|`; `|V| = diag(1,1/4)`, `s = (1,1/2)` | `s_j = |λ_j|`, `|λ_j|^{1/2}` | none |
| Check "bounded below is needed" (§1.6) | `A = −diag(n)`, `n` obstacles | `μ_n = −∞` for all `n`; `#{n : μ_n < 0} = ∞`; eigenspace sum infinite-dimensional; `finrank = 0` | three facts hold in `ℕ∪{∞}`; description and finiteness fail | rewritten |
| same, compared with bounded below | `A = diag(1,3,5)`, `c = 4` | count `2`, dimension `2` | agree | none |
| Dependencies paragraphs | script over all four layers | roadmap names in *Needs:* minus names in Dependencies | `∅` in each layer | 3 paragraphs |

## For the maintainer

- `pearson_tendsto` changed type: the one carrier `H` became `K₁`, `K₂`, with `J C : K₁ →L[ℂ] K₂`.
  No roadmap on main or at the open heads cites this declaration. `design/plan.json` still records the
  §1.9 statement in its one-space wording, because only its `gaps` list may be edited here.
- The new supplier BanachSpaceTheory (B4) is on main, so it adds no merge-order constraint.
- The new Tau Ceti citations (`ContinuousLinearMap.nuclearENorm_def`,
  `ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy`) are in the README contracts
  only. `Suggested.lean` does not import their modules.
- No source was fetched. `needs-references.toml` was not written, because no text was missing.
- I found no suspicious instructions in the reviews or the files I read.

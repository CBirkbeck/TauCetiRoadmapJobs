# GATE-NoncommutativeGeometry~1: answers to human review

## H01 (roed-math) — applied

The product/Bott contradiction was real at `db1d552`. It is gone at `84190a1`: N3 now separates the unswapped reduction `x⊠_u y` (Ch = Ch(x)#Ch(y), pairing +1 with β, equal to N7's Dirac class) from K5's swapped `x×_K5 y` (Ch = −Ch(x)#Ch(y), pairing −1, reversed grading). This round pins both in `TauCetiRoadmap/NoncommutativeGeometry/README.md` N3 by explicit operators, which the reviewer asked for. With K5's `e₁=σ₁`, `e₂=−σ₂`, `x⊠_u y` is `D₁⊗1⊗σ₁−1⊗D₂⊗σ₂=−i(σ₁δ₁−σ₂δ₂)` with grading σ₃, i.e. N7's D, and `x×_K5 y` is `−D₁⊗1⊗σ₂+1⊗D₂⊗σ₁`, which the odd unitary `(σ₁−σ₂)/√2` carries to the former with grading −σ₃. N3 also now contains the regression arithmetic: `Ch(x)=−(1+i)√π ψ`, `⟨β,Ch(x)#Ch(y)⟩=((1+i)√π)²/(2πi)=+1`, `Tr₂(σ₃[D,a][D,b])=2i(δ₁aδ₂b−δ₂aδ₁b)`, and the Hochschild class `(−1)(2i)/(4π)·τ(⋯)=+φ`.

## H02 (roed-math) — answered

The N1.Tensor/SB7.3 overlap is settled in one direction. At the open head, SmoothBanachRepresentations names N1.Tensor as the sole owner of the completed locally convex projective tensor over ℝ and ℂ (its README, supplier list line 39). Its SB7 item 3 (line 154) consumes the tensor and rebuilds neither the seminorm construction, the completion nor the universal property. NoncommutativeGeometry N1.Tensor uses no SB result, so no reciprocal edit is needed.

## H03 (roed-math) — answered

The A0–A3 (AlgebraicKTheory) and SB2/SB8 (SmoothBanachRepresentations) handoffs are consumed as the reviewer describes: N2 owns only the cyclic pairings and their descent, and N6 keeps the two-way estimates `Q_k≤C_kP_k`, `P_m≤D_mQ_(m+3)` and the torus normalizations. Both suppliers, and OperatorKTheory, are open pull requests that add new folders, not roadmaps on main. The mechanical direction check shows no UPWARD or CYCLE line (see below).

## H04 (kim-em) — answered

The claim that `84190a1` resolves H01 holds; the pairings were recomputed independently, see H01 and rows 1–4 of the table. One gap remained: "unswapped Clifford tensor/Morita reduction" had no operator. A naive bounded tensor `F₁⊗1⊗σ₁−1⊗F₂⊗σ₂` is not even a Fredholm module for C(𝕋²), because `[F₁⊗1,z₁]=[F₁,z₁]⊗1` is rank one tensored with an identity. N3 now states the product through the unbounded operators and notes this non-example.

## H05 (kim-em) — answered

Verified: N1.Tensor supplies the real/complex tensor contract that SB7 consumes, and N6 keeps the explicit two-way Fourier/smooth seminorm estimates. The witness `a=1+U₁` at θ=0 gives `Q_0=sup|a_rs|=1` and `P_0=‖a‖=2`, because the spectrum of U₁ is the circle. So the seminorm families are equivalent but not equal, as stated.

## Further repairs of Suggested.lean (gate)

The gate failed at `84190a1` because of the Lean file, which is unchanged from main: there were 8 sub-imports and no `import Mathlib`, and two `def`s had `sorry` proof fields.
- Imports: now `import Mathlib` plus `TauCeti.Algebra.Lie.Derivation.Basic` and `TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded`.
- `torusTwoCochain`: rebuilt sorry-free from `MultilinearMap.mkPiAlgebraFin`, `compLinearMap` and `LinearMap.compMultilinearMap`. A proved `example` checks that it evaluates to `(2πi)⁻¹τ(a₀(δ₁a₁δ₂a₂−δ₂a₁δ₁a₂))`, N6's formula.
- `torusTwoCocycle`: was a `def` with `sorry` fields. It is replaced by the theorem `exists_cyclicTwoCocycle_torusTwoCochain`, which has the same hypotheses: trace, τ∘δ_j=0, commuting δ's.
- Removed `positiveProjection` and `positiveProjection_equations`: the latter is an elementary consequence of F*=F, F²=1 and is padding. P=(1+F)/2 remains in the README conventions.
- Namespace is now `TauCetiRoadmap.NoncommutativeGeometry`, and the module docstring is in the house form, naming the headlines that cannot be stated at the pins. Grep of the pins finds no Dixmier trace, Schatten/trace-class ideal or cyclic-cohomology carrier.
- Every Lean name (`CyclicTwoCocycle`, `torusTwoCochain`, `exists_cyclicTwoCocycle_torusTwoCochain`, `NormalizedEvenCycle`, `SpectralTriple`) is now described in README N1, N6, N3 and N5.

Binder check: `#check @name` for all five declarations was elaborated once in a single build, by temporarily appending the checks and then removing them. Before the change, `NormalizedEvenCycle`, `SpectralTriple` and `positiveProjection` had lost `[SecondCountableTopology H]` (and `[CompleteSpace H]`). The README requires a separable Hilbert space, so both structures now carry `[SecondCountableTopology H]` explicitly. After the change, every elaborated type shows all the binders its README statement needs.

The README of this roadmap is older than the TauCetiRoadmap house shape (it has no Layer headings, Checks or per-layer Dependencies). Restructuring it is outside the points raised and was not done in this round.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hardy circle character | u = z, F = 2P−1 | `Tr(u⁻¹[F,u])=2·Tr(u⁻¹Pu−P)=2·rank(e₋₁)=2`; `λ₁=−(1+i)Γ(3/2)=−(1+i)√π/2`; `⟨[u],Ch₁⟩=(1+i)⁻¹·½·(2/√π)·(−(1+i)√π)=−1`; `ind(PuP)=0−1=−1` | consistent | none |
| ⟨β, Ch(x)#Ch(y)⟩ | N2's `ψ₁#ψ₂(β)=1/(2πi)` | `(−c)²/c²` with `c²=(1+i)²π=2πi` → +1 | matches `x⊠_u y` | arithmetic added to N3 |
| N7 Dirac Hochschild class | `D=−i(σ₁δ₁−σ₂δ₂)`, γ=σ₃ | `σ₁σ₂=iσ₃`, so `Tr₂(σ₃[D,a][D,b])=2i(δ₁aδ₂b−δ₂aδ₁b)`; `(−1)(2i)/(4π)=−i/(2π)=(2πi)⁻¹` → +φ; ⟨β,φ⟩=+1 | consistent with ⊠_u | added to N3 |
| Reductions vs K5 matrices | `e₂=[[0,i],[−i,0]]=−σ₂` | unswapped `F₁σ₁−F₂σ₂`, lower-left block `F₁−iF₂` ↔ `D⁺=−iδ₁−δ₂` on mode (m,n) `=2π(m−in)`; `U=(σ₁−σ₂)/√2`: `U²=1`, `Uσ₁U=−σ₂`, `Uσ₂U=−σ₁`, `Uσ₃U=−σ₃` | swapped ≅ unswapped with reversed grading | explicit operators added |
| Naive bounded product | `[F₁⊗1, z₁⊗1]` | `=[F₁,z₁]⊗1`, rank 1 ⊗ id on ℓ²(ℤ), not compact; `(F₁σ₁−F₂σ₂)²=2` | the naive product is not a cycle | non-example added to N3 |
| Graded interchange | K5 `[z₁]⊠_u[z₂]=−β` | `⟨x⊠_u y,β⟩=+1=(−1)·⟨x⊠_u y,[z₁]⊠_u[z₂]⟩`, so the interchange carries the odd×odd sign −1 = `(−1)^{1·1}` | consistent with K5's `(−1)^{pq}` adapter | none |
| Heisenberg cross-check (N7) | θ>0 | kernel of `−d/ds−2πs/θ` is `exp(−πs²/θ)`, index +1; `(2πi)⁻¹·(2πi/θ)·θ=1`; Chern–Weil `(i/2π)(2πi/θ)=−1/θ` | the φ-orientation is opposite to Chern–Weil, as N2 states | none |
| `torusTwoCochain` | A=ℂ (δ=0); δ₁=δ₂ | cochain 0 in both; Lean `example` evaluates the formula | correct | rebuilt sorry-free |
| `exists_cyclicTwoCocycle_torusTwoCochain` | cyclicity by parts | `τ(aδ₁bδ₂c)−τ(aδ₂bδ₁c)=τ(c(δ₁aδ₂b−δ₂aδ₁b))+τ(a[δ₁,δ₂]b·c)`; last term 0 by hcomm | hypotheses needed and sufficient for this route | def → theorem |
| `CyclicTwoCocycle` | n=2 conventions | N1 `φ(a₂,a₀,a₁)=(+1)φ(a₀,a₁,a₂)`; b with last sign `(−1)³` | matches fields | none |
| `NormalizedEvenCycle`, `SpectralTriple` | separability | elaborated type had no `SecondCountableTopology` | missing binder | binder added |
| N6 seminorm witness | a=1+U₁, θ=0 | Q₀=1, P₀=2 | consistent | none |

## Ownership, citations, sources

- Ownership: no new construction was added. The Lean declarations are stated under `TauCetiRoadmap.NoncommutativeGeometry`, and none takes the fully qualified name of a declaration in another roadmap.
- Citations: `roadmaps resolve` on the README reports nothing missing. K5 (OperatorKTheory, open head) and SB7/SB8 (SmoothBanachRepresentations, open head) were read at the given checkouts.
- Sources: no new source is cited. An unverified Connes locator that briefly appeared in a Lean docstring was removed. No `needs-references.toml` entry was needed.

## Build and gate

- `lake build TauCetiRoadmap.NoncommutativeGeometry.Suggested`: `Build completed successfully (8979 jobs).` There is one `declaration uses 'sorry'` warning, for `exists_cyclicTwoCocycle_torusTwoCochain`.
- Gate: `gate NoncommutativeGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: NoncommutativeGeometry (insert it after its last supplier)`. That is a placement in the merge order, not an UPWARD or CYCLE defect: the roadmap is on main but not listed in the order file. Before this round the gate also failed on `sorry-data=2`, `imports=1`, `mathlib-subimports=6` and `no-import-mathlib=1`.
- Depcheck `--movable` output:

```
NOT IN ORDER: NoncommutativeGeometry (insert it after its last supplier)
depcheck: 148 roadmaps, 1010 edges, 1 problem(s)
```

Commits (not pushed): `e952d756`, `537f7693`.

# GATE-VonNeumannAlgebras~3: answers to human review

One review (rwst). It splits into eleven points, H01–H11. The repairs are in one commit,
`dbf86808`, and change only `TauCetiRoadmap/VonNeumannAlgebras/README.md`. `Suggested.lean` is
unchanged. Line numbers below are for the new head.

## H01 (rwst) — applied
V2.PolarDecomposition (old :494–501) is deleted. The modulus and polar factor now come from
OperatorTheory PolarDecomposition PD-A36–A45 and PD-B23–B36, listed under the new supplier row
"From TauCetiRoadmap.OperatorTheory" (:200–231). V2 keeps only membership: x∈M implies v∈M
(:537–541), proved as follows. For a unitary u∈M′, `uvu*|x|=x`, and `uvu*` vanishes off the
closure of `range|x|` (u fixes that subspace), so `uvu*=v` by PD-B36, which gives v∈M″=M. Every
other polar mention now cites PD-B24 (:858, :912, :1241, :1276, :1465, :3253).

## H02 (rwst) — applied
V2.BorelCalculus (old :503–523) is deleted. V2 now proves only that values of `borelCalculus a`
lie in W*(a)⊆M (:534–537). The argument: SA-B57 (they commute with W*(a)′) plus the bicommutant
theorem. V2.AbelianClassification now consumes SA-B05, SA-B49, SA-B52–B53 and SA-B85–B86
(:708–753). This puts back the SA-B86 symbol quotient that the previous round had replaced by
bare `L∞`. V5's simplicity proof cites SA-B05 (:1286, :1299, :1365).

## H03 (rwst) — applied
The Hahn–Hellinger statement in V2.AbelianRepresentationMultiplicity (old :774–798) is removed.
That target now consumes SA-B85's model, control class, multiplicity and classification for
`C(K)`. It keeps only the normal-representation part (:793–815): restriction to `C(σ(a))`,
recovery through V4.Normality, and the fact that the control class is absolutely continuous
with respect to μ. Its Check is now the multiplicity-1 versus multiplicity-2 amplification of
`L∞[0,1]`, which are not equivalent because their commutants differ. V4.0.Decomposition now
consumes SA-B85 directly (:1161–1164, :1190, :1218), as main's SA Downstream (:1406) says.

## H04 (rwst) — applied differently
S₁ and S₂ are now OperatorIdeals OI-B29–B30 and OI-B32–B41 (:917–919). BanachSpaceTheory B4's
identification with nuclear operators is recorded in the B4 contract (:196–198); B4 already
cites OI-B29–B30. V4.Core keeps four things that OperatorIdeals does not state:
- the canonical trace functional;
- `Tr|x|=‖x‖₁`;
- cyclicity;
- the duality `S₁* = B(H)`.

OperatorIdeals' Part B lists ideal families, gauges and Hilbert–Schmidt energy only (OI-B29–B41,
`OperatorIdeals/README.md:349–375`), with no trace functional or duality. So deleting the whole
trace-class passage, as the review suggests, would leave V4.Core without these four inputs.

## H05 (rwst) — applied differently
V10.ClosedOperators now consumes SA-D14–D19 (bijectivity of `T−λ` and the resolvent bound),
SA-D24–D28 (the Cayley transform), SA-E02 (1 is not an eigenvalue) and SA-E01 with SA-B85 (the
spectral model) (:2113–2140). It keeps four things SelfAdjointSpectralTheory does not state:
- the inverse correspondence from a unitary without eigenvalue 1 back to a self-adjoint operator,
  `T=i(1+U)(1−U)⁻¹` on `range(1−U)`;
- the multiplier-form theorem (SA-E47 covers only spectral projections of a given multiplication
  operator);
- the polar decomposition of closed unbounded operators (SA has no polar target);
- the antilinear extension and the `L²[0,1]` derivative Checks.

The review lists the multiplier-form theorem among the duplicates, but no OperatorTheory target
states it.

## H06 (rwst) — applied
The Scope bullet that said OperatorTheory is "a consumer … so nothing here is taken from it" is
replaced (:28–44). The new bullet names the OperatorTheory owners and states the target-level
direction: SA-B85–B86 consume V4.0.Fields, which has no PVM, normal-operator or multiplicity
input, and every target here that consumes SA-B85–B86 comes after Fields. The "How to read the
build" section is rerouted the same way (:263–267). The mechanical check agrees with the review:
depcheck reports no cycle before or after citing OperatorTheory (output below). OperatorTheory
is on main, so it is a permitted supplier.

## H07 (rwst) — answered
The pull-request description is outside what this job may edit; the worker refreshes it. After
this commit, the accurate facts for its lines 21–25 are:
- the README consumes SA-B85–B86 and the other targets named in H06;
- finite Gleason is owned here (Scope :21–22);
- `Suggested.lean` declares 18 items, 10 of them `sorry` theorems.

## H08 (rwst) — answered
Closing the earlier pull request on the same folder, and redirecting main's SA :690 and :1391
from the old blob to V4.0.Fields, are actions outside this folder. Both are left to the worker
and the maintainers. None of this roadmap's declarations is named after a declaration in a
roadmap on main.

## H09 (rwst) — answered
This confirms that roed-math's four blockers (V7 type II₁, V11 faithful versus supported, V7
index domain, V12 property Γ) are fixed. No change is needed. This commit does not touch those
passages.

## H10 (rwst) — answered
Confirmed: `ProjectionClosureTargets.lean:34` (`wot_closure_projections`) states the same thing
as `Suggested.lean:102` (`closure_isStarProjection_eq_positive_contractions`). Only README.md and
Suggested.lean may be edited in this job, so deleting the file is left to the author, as the
review says.

## H11 (rwst) — answered
`FiniteComplexModularTargets.lean` is also outside this job's edit scope. Its `star` identity and
its diagonal-entry criterion `(h_i/h_j)^(2 Re z)=1` are consistent with the README's V10 example.
Deleting the file, or adding the missing docstring on `diagonalModularPower_star`, is the
author's choice.

## Adversarial pass on changed statements

| statement | instances | values | result |
|---|---|---|---|
| Borel values lie in W*(a) (:534) | a = multiplication by t on `L²[0,1]`; a = 0 | `1_[0,1/2](a)` = indicator multiplier ∈ `L∞[0,1]` = W*(a); for a = 0, f(0) = f(0)·1 ∈ ℂ1 = W*(0) | holds |
| polar part v ∈ M (:537–541) | M = ℓ∞ diagonal, x = diag(1,0,2,…); M = B(ℓ²), x = S (shift) | v = diag(1,0,1,…) ∈ ℓ∞, not unitary; for S, v = S ∈ B(ℓ²), M′ = ℂ, uvu* = v trivially | holds; added as Example (:832) |
| uvu* vanishes off closure of range \|x\| | u ∈ M′ unitary commutes with \|x\|, so u\|x\|H = \|x\|uH = \|x\|H | the subspace is fixed by u and by u*, so uvu*η = 0 for η ⊥ it | holds |
| control class of a normal rep ≪ μ (:803) | identity rep of L∞[0,1]; zero rep | ν = Lebesgue ~ μ; ν = 0 ≪ μ | holds |
| multiplicity 1 vs 2 not equivalent | `L²[0,1]` vs `L²[0,1]⊗ℂ²` | commutants L∞ vs M₂(L∞); multiplicity 1 vs 2 a.e. | not equivalent, as stated |
| `Tr(x)=∑⟨e_i,xe_i⟩`, `Tr\|x\|=‖x‖₁` (:920) | diag(1/n²); u⊗v*; shift S; H = 0 | Tr = π²/6 = ν; Tr(u⊗v*) = ∑⟨v,e_i⟩⟨e_i,u⟩ = ⟨v,u⟩; Tr\|S\| = Tr 1 = ∞; H = 0 gives 0 | holds; conjugate-first convention consistent |
| inverse Cayley `T=i(1+U)(1−U)⁻¹` on range(1−U) (:2116) | T = 0; T = diag(λ_n); U = (T−i)(T+i)⁻¹ | U = −1, i·0·(2)⁻¹ = 0; (1−U)(T+i)x = 2ix and (1+U)(T+i)x = 2Tx, so (1−U)⁻¹(2ix) = (T+i)x and i(1+U)(T+i)x = 2iTx = T(2ix) | holds |
| SA's `U=1+2iR(−i)` | R(z) = (z−T)⁻¹ | 1 − 2i(T+i)⁻¹ = (T−i)(T+i)⁻¹ | agrees with SA's stated equality under the (z−T)⁻¹ convention; the supplier row quotes `(T−i)(T+i)⁻¹` to avoid the sign ambiguity |
| no `W*(a)` minimal projection for multiplication by t (:836) | Lebesgue measure on [0,1] | every Borel set of positive measure splits into two of positive measure | holds |
| target-level acyclicity (:42) | V4.0.Fields Needs line (:1157) | Fields needs Mathlib `Lp`, Radon–Nikodym, `gramSchmidt`, V2 completed tensors; no SA input | holds |

Signatures: `Suggested.lean` is unchanged at this head. No declaration was added or edited, so
there was nothing new to `#check`. The elaborated types in `signatures.md` still apply (18
declarations, none with a dropped binder).

Ownership: the review's object-level search was repeated on main's OperatorTheory
(`PolarDecomposition`, `SelfAdjointSpectralTheory`, `OperatorIdeals`). Each kept item was checked
to be absent there:
- canonical trace, cyclicity and duality: not in OperatorIdeals Part B;
- inverse Cayley correspondence and multiplier form: not in SA Parts D/E;
- unbounded polar decomposition: SA has no "polar" target.

Ownership against the other open pull requests was not checked again this round.

No sources were fetched and `needs-references.toml` was not written. The commit drops four
references along with the deleted targets: Kadison–Ringrose §5.2/§6.1, Conway IX.2 and Arveson's
*Invitation* Ch. 2.

## Build and gate

- `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested`: `Build completed successfully (8976 jobs).`
  The only warnings are `declaration uses sorry`.
- Depcheck: `depcheck: 207 roadmaps, 1461 edges, 0 problem(s)`. There are no UPWARD, CYCLE or
  moved lines.
- `roadmaps resolve`: no cross-roadmap citations or Lean names found nowhere.
- Gate at `dbf86808`: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

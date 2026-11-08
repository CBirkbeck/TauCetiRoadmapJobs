# GATE-AlgebraicTopologyPartII~1: answers to human review

Commit `5ba2f00e` on top of `eb1270a` (not pushed). Files changed: `TauCetiRoadmap/AlgebraicTopologyPartII/README.md` and `TauCetiRoadmap/AlgebraicTopologyPartII/Suggested.lean`.

## H01 (roed-math) — applied differently

The AlgebraicTopology citations stay in main's "Stage N" numbering. AlgebraicTopology is on main, and #1652 and #1663 are competing revisions of it. #1663 keeps "Stage N", so switching to #1652's "Layer N"/"§N.M" ids now would break the citations both on main and under #1663. The only citations that #1652 actually splits are the item-level "Stage 5 item 5" ones (→ §5.0 + §5.5). The H02 repair removes all six of them (README L11, L74, §4.3 proof and *Needs:* at L675/L684, §4.4 *Needs:* at L711, the Layer 4 Dependencies), and `grep -c "Stage 5 item 5"` now returns 0. What remains are whole-stage citations (Stages 2, 4, 5, 6, 7, 8). #1652 keeps each of these as a layer with the same number and the same title (for example "## Layer 5: bundles, covers, products, and finite-cover descent", #1652 README L1309), so they stay unambiguous whichever rewrite merges. No dependency on #1652 is added.

## H02 (roed-math) — applied

Correct, and true on main as well as in both rewrites. AlgebraicTopology Stage 5 item 5 on main consumes "DGFloer Layer 1 item 2's homotopy LES and `arbitraryCWSerreSpectralSequence` and `arbitraryBaseSerreSpectralSequence`", and DGFloer on main owns them in Layer 1 item 2.

The changes:
- L11 now credits AlgebraicTopology only with the Serre spectral sequence's "bundle and monodromy applications … in Stage 5".
- A new scope bullet (L12) names DGFloer Layer 1 item 2 as the owner of CW approximation, the fibration long exact sequence (LES) and the homological and cohomological Serre spectral sequences. It names GeneralizedCohomology G2.10 as the owner of the based path-loop Hurewicz fibration.
- L74 "product/fibration spectral sequences … Stage 5 item 5's explicit Serre-fibration … interface" becomes "the Künneth spectral sequence and the identification of the Serre E² page under trivial monodromy".
- A new supplier contract, "From TauCetiRoadmap.DGFloer and TauCetiRoadmap.GeneralizedCohomology" (L78), names the four DGFloer spectral sequences and the pinned Tau Ceti `TauCeti.TopCat.serreFibrations` and `TauCeti.TopCat.mem_serreFibrations_proj` (both checked at the pin, `TauCeti/Topology/Homotopy/SerreFibration/{Basic,FiberBundle}.lean`). It carries three computed Checks.
- The §§4.3, 4.4 and 4.6 proof notes, their *Needs:* lines and the Layer 4 Dependencies cite DGFloer Layer 1 item 2 and GeneralizedCohomology G2.10 in place of "Stage 5 item 5".

## H03 (roed-math) — applied

Correct: with trivial involutions, §16.2 is the embedded first isotopy lemma (MATHER Proposition 11.1, MATHER line 969). StratifiedSpacesAndTameTopology owns that lemma in §5.5 and the controlled vector fields in §5.4, and its current head (`e46c8e4`, Downstream consumers) already names §16.2 as a consumer of §§5.4–5.5.

The rewritten §16.2 (L1509–1522) states the hypotheses with named involutions σ_M and σ_B. It requires invariant f-compatible control data (π_p∘σ_M=σ_M∘π_p, ρ_p∘σ_M=ρ_p) and gives the conclusion h∘σ_M=(σ_B×σ_M|A_b)∘h. Its proof keeps only the averaging step: ξ_i ↦ ½(ξ_i+ε_i(σ_M)_*ξ_i), so that (σ_M)_*ξ_i=ε_iξ_i and σ_M∘φ^i_t=φ^i_(ε_i t)∘σ_M. The lifts, the flows and the flow-composition trivialization come from StratifiedSpacesAndTameTopology §§5.1, 5.4 and 5.5. A new scope bullet (L21) and a new supplier contract (L136) state what is consumed and how A∩f⁻¹(U) meets the supplier's finite-stratum Thom–Mather hypotheses. Mather's Whitney prestratifications include the frontier condition (MATHER lines 206–215). The Layer 16 Dependencies list it, and the `Suggested.lean` docstring now says that stratified pair transport lacks Whitney stratifications, Thom–Mather control data and controlled vector fields at the pins (I checked: none exist in Mathlib or Tau Ceti).

The suggestion to consume the isotopy lemma of §5.5 is taken in this form: §5.5's *statement* alone gives a non-equivariant trivialization, so the route consumes its flow-composition construction (Mather Corollaries 10.2–10.3, MATHER lines 887–916) applied to the averaged lifts. The new Check on ℝ×S¹ computes a case where the unaveraged lift gives a non-equivariant trivialization.

## Build

`lake build TauCetiRoadmap.AlgebraicTopologyPartII.Suggested`: Build completed successfully (8960 jobs); 7 `declaration uses 'sorry'` warnings (lines 70, 109, 166, 175, 190, 216, 232), no errors.

## Gate

`gate AlgebraicTopologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

On the first run the gate failed with `statement-hygiene=1`, a P3 present at `eb1270a`: `[Fintype F]` beside `[Field F]` in `configurationTraceFormula`. I repaired it as the gate suggests: `[Fintype F]` → `[Finite F]` and `Fintype.card F` → `Nat.card F` (`Suggested.lean` L70, L79). This loses no generality, since a finite field has `Nat.card F = q ≥ 2`. The README already says "q=card(F)".

## Direction check

`depcheck: 239 roadmaps, 2358 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

## Dependencies only an open pull request defines

- **StratifiedSpacesAndTameTopology** (§§5.1, 5.4, 5.5) is a new roadmap in an open pull request by another author (#1519, head `e46c8e4`, read with `roadmaps show`). It is not in `ORDER.txt` and not on main, so it must merge before this roadmap; the worker names it in the merge-order paragraph. Its README cites this roadmap only as a downstream consumer and takes nothing from it, so there is no cycle.
- No id of an open *revision* is cited. DGFloer is cited in main's "Layer 1 item 2" numbering. Both open DGFloer revisions keep that id: #963 uses it verbatim, and #1798 has the heading "### 1.2" but its own scope text still says "Layer 1 items 1–2". GeneralizedCohomology "G2.10" is main's id.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## Signatures

The only declaration whose type changed is `configurationTraceFormula`: its own binders `(F : Type) [Field F] [Finite F] (m : ℕ) (χ : Multiset ℕ → ℚ)` are all in its signature, with no section variables, so no binder can be lost. The build confirms it elaborates. The brief allows only the `lake build` command, so I did not elaborate a separate `#check @name` file. The other 20 declarations are unchanged, so their types in `scratch/signatures.md` are still current. I compared the README statements touched by this round with them: none of the edited README text (Serre ownership, §§4.3/4.4/4.6 inputs, §16.2) is the statement of a Lean declaration. §16.2 is listed as not statable.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §16.2 equivariant isotopy | trivial σ_M, σ_B | (σ_M)_*ξ=ξ, ε_i=1, average = ξ; reduces to StratifiedSpacesAndTameTopology §5.5 | holds | added as Check |
| §16.2 | M=A=ℝ×S¹, f=pr, σ_M(x,z)=(x,z̄), σ_B=id, lift ∂_x+∂_θ | h(x,z)=(x,e^(−ix)z); h(σ_M(π/2,1))=(π/2,−i) vs (σ_B×σ_M)(h(π/2,1))=(π/2,i); averaged lift ∂_x gives h=id | unaveraged fails, averaged holds | added as Check |
| §16.2 | M=A=ℝ×F, F compact, σ_M(b,z)=(−b,τz), σ_B(b)=−b | ε_1=−1, (σ_M)_*∂_b=−∂_b, average ½(∂_b+∂_b)=∂_b, h=id, h(σ_M(b,z))=(−b,τz)=(σ_B×σ_M)(b,z) | holds | Check rewritten with F compact (properness) |
| §16.2 | xy=t over the t-line, strata node / D∖node / complement | d(t|_node stratum)=0 (rank 0≠1); zero fibre two crossing lines, nonzero fibre smooth (ℝ: two branches; ℂ: ℂ*) | hypothesis fails, conclusion fails | Check kept, fibre comparison added |
| §16.2 | m=0 (B a point), A=∅ | U={b}, h = identity of A_b; empty map | holds | none |
| §16.2 context | σ_* of a controlled field | dπ_p(σ_*ξ_q)=σ_*(ξ_p∘π_p) using π_p∘σ=σ∘π_p; dρ_p(σ_*ξ_q)=d(ρ_p∘σ)ξ_q=0; needs σ-invariant strata | holds under stated hypotheses | "not a consequence of the others" → "a hypothesis of this statement" (the old claim was unproved) |
| Stratified contract Checks | ℝ², strata {0}<ℝ²∖0, π₀=0, ρ₀=x²+y² | dρ₀(−y∂_x+x∂_y)=−2xy+2xy=0; dρ₀(x∂_x+y∂_y)=2(x²+y²)≠0; σ(x,y)=(x,−y): σ_*(−y∂_x+x∂_y)=y∂_x−x∂_y | rotation controlled, radial not, σ_*V=−V | added |
| DGFloer contract Checks | double cover z↦z² of S¹ | H_0(F)=ℤ², swap; coinvariants ℤ²/⟨(1,−1)⟩=ℤ=E²_(0,0); invariants ⟨(1,1)⟩=ℤ=E²_(1,0); trivial monodromy gives ℤ² | matches H_*(S¹) | added |
| DGFloer contract Checks | path-loop over S²; Hopf S¹→S³→S² | d²:E²_(2,q)≅E²_(0,q+1) ⇒ H_q(ΩS²)=ℤ ∀q; Hopf d²:ℤ→ℤ iso since H₁(S³)=H₂(S³)=0; S²×S¹ has H₂=ℤ | consistent | added |
| `configurationTraceFormula` (Finite F) | 𝔽_q, m=0; m=1, χ≡1 | m=0: LHS χ(∅) (f=1), RHS χ(∅)·1; m=1: LHS q monic linears, RHS q·1 − 1·0 = q | holds | binder change only |
| Scope claim "AT Stage 5 consumes the Serre SS from DGFloer" | main AT README Stage 5 item 5; #1652 L110–116; #1663 L118–120 | all three say DGFloer Layer 1 item 2 owns them | true | stated |

P3 note: condition (b) in §16.2 is used only to construct control data. Since invariant control data are a hypothesis, the statement holds without it (Mather Corollary 10.2 needs only a prestratified set with control data). I kept it because it is the setting in which applications construct the control data, and the supplier contract says so.

## Sources

No new sources. MATHER locators are from the cached text (lines 206–215, 887–916, 969). `needs-references.toml` was not written.

## Untrusted text

Nothing suspicious. The review's closing request to move the pull request's label is a process step for the worker and was not acted on.

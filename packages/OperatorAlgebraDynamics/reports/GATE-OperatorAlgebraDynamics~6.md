# GATE-OperatorAlgebraDynamics~6: answers to the human review of 08edaf5

One review is unanswered (CBirkbeck, 2026-11-07T21:28Z, of head 08edaf5). It contains four findings, F01–F04, numbered H01–H04 below. Its "Verified sound" section raises no further point (the comment text is truncated in the data after "RelativisticQuantumFieldTheory"). The branch head 5f95c1b already carried repairs for F01–F03. This round checked those repairs against the pins and sources and repaired what they left wrong or incomplete. The work is in commit `53ad9909` (not pushed).

## H01 (CBirkbeck) — applied

At 5f95c1b, Tau Ceti's Hilbert-space multiplier extension is consumed instead of planned:
- the "From Tau Ceti" bullet at `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` 259;
- the gap paragraph (`gap:cstar-ideals-multipliers` is now only the `M(B)` extension with the strict topology, line 544);
- D1 at 646–663, D1.CentralTwists at 917, D4.LCAWeyl at 2160, D5 at 2453;
- the `Suggested.lean` docstring at 48–51.

All five names exist at the pin in `TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean`: `IsNondegenerate` 62, `multiplierExtension` 204, `multiplierExtension_coe` 247, `eq_multiplierExtension_of_apply_coe` 251, `tendsto_multiplierExtension_apply` 260.

The same file also has `NonUnitalStarAlgHom.continuous_multiplierExtension_apply` (line 271): a bounded family of multipliers whose left actions are norm continuous goes to a strongly continuous family. The 5f95c1b repair had restated it as a D1 target ("Prove that π̃ sends a strictly continuous unitary multiplier map … to a strongly continuous unitary representation"). That target is now replaced by a citation of the pinned lemma (README 650–655), and the lemma is added to the contract (270–274).

The remaining unattributed multiplier extensions are fixed:
- ρ̃ in D1.CentralTwists (928–929);
- the *Needs:* lines of D1.CentralTwists (1045–1046) and of D2.SequenceToeplitz, whose route uses both the extension and the embedding `R→M(K(H))` (1842–1845).

In `Suggested.lean`, `CentralCovariantPair.projective` now states the README law `U_s U_t = π̃(ω(s,t)) U_(st)` directly with `pi.multiplierExtension nondegenerate` (lines 185–189). It replaces the left-multiplied form `π(a)U_sU_t = π(aω(s,t))U_(st)`. The two are equivalent because the structure carries nondegeneracy. On a degenerate π they differ: with `π(z)=z·diag(1,0)` on ℂ², `X=diag(0,1)` and `Y=0` give `π(a)X=π(a)Y` but `X≠Y`.

## H02 (CBirkbeck) — applied

At 5f95c1b the second remedy was taken. VonNeumannAlgebras V10 is no longer credited with Araki's perturbations, and D7 now builds `Ω^Q` with its hypotheses (README 2946–2967). The locators were then checked against Araki's paper, which the publisher (EMS Press, PRIMS archive) serves without login:
- Proposition 4.1 (`araki1973` lines 236–244): the expansion over `{s_i≥0, Σs_i≤1/2}`, membership in the natural cone, and norm convergence along strongly convergent sequences. The bound `e^(‖h‖/2)‖Ψ‖` is in its proof, line 246.
- Proposition 4.12 (lines 578–585): the domain of `exp z(log Δ+h)` for `Re z∈[0,1/2]`.
- Corollary 4.4 (385–386): cyclic and separating.
- Proposition 4.5 (419–420): inverse and chain laws.
- Proposition 4.6 (446–447): uniqueness.
- Proposition 4.8 (467–497): `H_Φ=H_Ψ+h−j(h)` with `H=−log Δ`, which is the README's `log Δ_(Ω^Q)=log Δ_Ω+Q−JQJ` for `Q=−h`.
- Proposition 4.3 (323–328): the cocycle intertwining the modular groups.

Araki's `Ψ(h)` is `e^((log Δ+h)/2)Ψ`, by Definition 4.2 and (1.5) at lines 55 and 307. This agrees with the README's `Ω^Q`.

Changes this round:
- **Locator.** The cyclic–separating claim now cites Araki, Corollary 4.4, instead of Bratteli–Robinson 5.4.4 (2959).
- **Continuity.** "Depends strongly continuously on Q" now reads "`Q_n→Q` strongly gives `Ω^(Q_n)→Ω^Q` in norm", Araki's sequential statement (2956–2958).
- **KMS application route (2970–2990), two defects.**
  - It applied `TauCeti.CStarAction.IsKMSState.restrict` to M. At the pin that lemma needs a `CStarAction` (point-norm continuous) on the ambient algebra, and `τ̄^P` on M is only strongly continuous.
  - It called "the converse of V10.KMS" the step that is the direct direction.
  - The new route defines `τ̄^P_t=Ad(π̃_ω(Γ_t))∘τ̄_t` from `TauCeti.CStarAction.perturbationCocycle` (group law by `perturbationCocycle_add`). It identifies the Dyson cocycle as `u_t=π̃_ω(Γ_(−βt))`: both solve `u'=u·iσ_t(Q)` with `σ_t(Q)=−βπ_ω(τ_(−βt)(P))`. It reads the β-KMS strip function of `ω^Q∘π_ω` for `τ^P` off V10.KMS's modular strip through `w↦i−w/β`.
- **Pattern: a roadmap credited for a theorem it does not state.** Scope (116–125) and D7 (2878–2893) credited V10 with "the modular characterization `σ^ω_t=τ̄_(−βt)` of a KMS state on its GNS von Neumann algebra … and support qualification". VonNeumannAlgebras V10.KMS on main (its README 2459–2480) proves only the characterization for a group satisfying the strip condition on all of M. D7 proved that condition only on `π_ω(A)`.
  - D7 now proves the extension to M for unital A: Kaplansky strong-star density from VonNeumannAlgebras V1, uniform convergence of the boundary values `⟨x*Ω,U_tyΩ⟩` and `⟨y*Ω,U_t*xΩ⟩`, and Phragmén–Lindelöf on the strip.
  - It then applies V10.KMS through `z↦−βz+iβ`.
  - "Support qualification" is no longer credited to V10. Nothing here used it.
- **Supplier contract and *Needs:*.** V1, V10.ModularTheory and V10.KMS had become inputs without a contract entry. One is added (499–513), and the D7 *Needs:* and Dependencies are updated (3053–3082).
- **Check correction.** The finite-dimensional Check claimed `‖Ω^Q‖²≤exp(β‖P‖)=exp(‖Q‖)`, which is false for β<0. At `K=diag(0,1)`, `P=−diag(0,1)`, β=−1: `Z_(K+P)/Z_K=2/(1+e)=0.538>e^(−1)=0.368`. It now reads `exp(|β|‖P‖)` (3025).
- **New Check.** The cocycle witness `u_t=diag(1,e^(iβt))=Γ_(−βt)`, with `Ad(u_t)∘τ_(−βt)=id=τ^P_(−βt)` (3027–3031).
- **Lean docstring.** It now names this theorem as not statable at the pins: no modular operator. Mathlib's `StandardSubspace` lists the Tomita conjugation as TODO, and Tau Ceti has none (`Suggested.lean` 64–66).

## H03 (CBirkbeck) — applied

At 5f95c1b:
- D2.CentralTwists cites `gap:cstar-nuclear-exact` where it had "C6/C7" (README 1481).
- The dependency order reads `gap:cstar-ideals-multipliers`/A7/D1.Modules → D1.CentralTwists → D2.CentralTwists and A7/`gap:cstar-ideals-multipliers` → D1.BorelPrefix → D1.TwistedBorel (1518–1520).

A search for bare `C<digit>` ids finds them only inside the five "What CStarAlgebras must provide" paragraphs, where the roadmap is named, and in "CStarAlgebras C8.4" (line 109).

## H04 (CBirkbeck) — answered

The order belongs in the pull-request description, which this job does not edit; the worker should state it.

#1187 (head 66ed0d4) bumps Tau Ceti from 2fd255d to ab00ba392. Its only hunk in this folder edits main's copy of `Suggested.lean`: `_root_.ContRepresentation.IsUnitary` becomes `ContRepresentation.IsUnitary` at three sites. This branch replaces that file and still writes `_root_.ContRepresentation.IsUnitary` twice, in `lcaWeyl_classification` (lines 341 and 344).

Recommended order: #1187 merges first, and this branch is rebased on it. The conflict resolves to this branch's file with the same `_root_` change at those two sites. `Suggested.lean` is then re-elaborated at ab00ba392, and the "From Tau Ceti" names are re-checked at that pin. #1097 also conflicts with this folder and is already named in the description.

## Adversarial pass on the statements changed or added this round

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `continuous_multiplierExtension_apply` consumed (D1, contract) | `A=c₀(ℕ)` on `ℓ²(ℕ)`, `u_s(n)=e^(isn)`; discontinuous character `u_s=χ(s)·1` | `u_s a` norm-continuous, `π̃(u_s)=diag(e^(isn))` strongly continuous, `‖π̃(u_s)−1‖=sup_n|e^(isn)−1|`, not →0; `χ(s)a` discontinuous ⇒ `π̃(u_s)=χ(s)` not strongly continuous | holds; left strict continuity needed | target replaced by citation |
| `projective` via `multiplierExtension` | ω=1; degenerate `π(z)=z·diag(1,0)` on ℂ² | ω=1: `U_sU_t=π̃(1)U_st=U_st`; degenerate case `π(a)X=π(a)Y`, X≠Y | equivalent to old form only with `nondegenerate` (a field) | Lean field restated |
| V10.KMS gives `σ^ω̄_t=τ̄_(−βt)` | `K=diag(0,1)`, Gibbs ρ | `σ_t(e₁₂)=e^(iβt)e₁₂=τ_(−βt)(e₁₂)`; `τ_(βt)(e₁₂)=e^(−iβt)e₁₂≠` | sign correct | route made explicit |
| strip condition on M | x=y=1; Gibbs on `M₂` (Ω=1, `U_t1=1`) | `F≡1` on both lines; `U_t*Ω=Ω` | holds | step added (unital A) |
| substitution `z↦−βz+iβ` | `x=e₁₂`, `y=e₂₁` | `F(z)=e^(iβz)/Z`: `F(t)=e^(iβt)/Z=φ(σ_t(x)y)`, `F(t+i)=e^(iβt)e^(−β)/Z=φ(yσ_t(x))`; `Im z∈[0,1]↦[β,0]` | holds | — |
| `w↦i−w/β` | general; β<0 | `G(s)=F(−s/β+i)=ω^Q(yτ̄^P_s(x))`, `G(s+iβ)=F(−s/β)=ω^Q(τ̄^P_s(x)y)`; `1−Im w/β∈[0,1]` | holds | — |
| `u_t=π̃_ω(Γ_(−βt))` | `K=diag(0,1)`, `P=−diag(0,1)` | `u_t=diag(1,e^(iβt))`; `Γ_s=diag(1,e^(−is))`, `Γ_(−βt)=diag(1,e^(iβt))`; `Γ_(βt)=diag(1,e^(−iβt))≠` | holds; sign pinned | Check added |
| `IsKMSState.restrict` on M (old route) | `M=B(L²(ℝ))`, translations | `t↦Ad U_t(M_{1[0,∞)})` not norm continuous | lemma inapplicable | removed |
| `Ω^Q` expansion sign | `M_n`, Q commuting with ρ | first-order term `∫₀^(1/2)Δ^sQΩds=Qρ^(1/2)/2` = first-order of `e^((log ρ+Q)/2)` | `+` sign correct | — |
| `‖Ω^Q‖≤e^(‖Q‖/2)‖Ω‖` | Q=c scalar; simplex volume | `‖Ω^c‖=e^(c/2)≤e^(|c|/2)`, equality c≥0; `Σ(‖Q‖/2)^n/n!=e^(‖Q‖/2)` | holds | — |
| Check `‖Ω^Q‖²≤exp(β‖P‖)` | β=1, β=−1 | β=1: `2/(1+e^(−1))=1.462≤e=2.718`; β=−1: `0.538>e^(−1)=0.368` | old false for β<0 | `|β|` |
| chain/inverse, uniqueness | commuting Q,Q′; central Q on ℂ⊕ℂ | `e^((log ρ+Q+Q′)/2)`; `(e^(q₁/2)ρ₁^(1/2), e^(q₂/2)ρ₂^(1/2))` distinct | hold | — |
| `log Δ_(Ω^Q)=log Δ+Q−JQJ` | `M_n`, `Jx=x*` | `JL(Q)J=R(Q)`; both sides `L(log ρ+Q)−R(log ρ+Q)` | holds | — |

## Ownership, citations, sources

- **Ownership of the Araki perturbations.** `roadmaps grep` over main and the open roadmap pull requests for "Araki", "relative Hamiltonian", "perturbed vector/state", "Ω^Q" and "Dyson" finds no other owner of Araki's perturbations.
- **VonNeumannAlgebras Layer 11 (main, README 2999).** It owns the Connes cocycle `(Dφ:Dψ)_t`. D7 states only Araki's identification of the specific Dyson cocycle, so the two do not duplicate each other.
- **The strip extension to M.** Tau Ceti has only the mixed analytic identity (`IsKMSState.inner_apply_toPreGNS_entireExtension_mul_I`), not the strip condition on M. D7 therefore owns that step.
- **Cited sections, checked on main.** VonNeumannAlgebras V1's Kaplansky strong-star form is at its README 477–479. V10.ModularTheory is at 2364–2393 and V10.KMS at 2459–2480. Every new Tau Ceti name was opened at the pin: `continuous_multiplierExtension_apply`, `perturbationCocycle`, `perturbationCocycle_add`, `IsKMSState`, and Mathlib's `StandardSubspace`.
- **New source to record.** The worker should add this entry to `sources.toml`, since this job does not edit the manifest:
  - id `araki1973`, H. Araki, "Relative Hamiltonian for faithful normal states of a von Neumann algebra", Publ. RIMS 9 (1973) 165–209;
  - doi 10.2977/prims/1195192744, fetched from the EMS Press PDF;
  - licence_class publisher-open; the text is recognised by OCR;
  - locator_scheme theorem; locators Propositions 4.1, 4.3, 4.5, 4.6, 4.8, 4.12 and Corollary 4.4; cited_for D7.
- **Remaining uncertified citation.** Bratteli–Robinson 2, Theorem 5.4.4 (uncertified, cited by locator) now backs only the KMS application. No `needs-references.toml` is left: the one written by the first, failed fetch was removed after the text was obtained.
- **Overlaps.** No id cited here is dropped by an open pull request, and only #1097 and #1187 change this folder.

## Signatures

- **Method.** `#check @name` lines for all 16 declarations, plus `CentralCovariantPair.projective` and `CentralCocycle.cocycle`, were appended temporarily to `Suggested.lean`. The file was elaborated with the prescribed `lake build` and then restored.
- **Changed signature.** The only change is the `projective` field, now `↑(U s) * ↑(U t) = (NonUnitalStarAlgHom.multiplierExtension ⋯) ↑(ω.value s t) * ↑(U (s * t))`. This is the README law at line 914.
- **Unchanged declarations.** No other declaration's source changed, and their types match `scratch/signatures.md`. None loses a section binder: each declaration carries its binders explicitly.

## Build and gate

- `lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested`: `Build completed successfully (18356 jobs).` There are 13 warnings, all `declaration uses 'sorry'`, at lines 94, 107, 122, 194, 213, 229, 250, 271, 282, 299, 315, 337 and 361, and nothing else.
- Gate on commit 53ad9909: `gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- No suspicious instructions were found in the review text.

# Review of HeisenbergImprimitivity (pull request #1149 at 4b902fe)
Folder: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/`
**Verdict:** needs changes

An incremental re-review of the 22 lines changed since 5333cb0 (the head round 8 read): the continuity input of β and σ repointed from Tau Ceti to Mathlib in the Mathlib contract, §1.1's `*Needs:*` line and Layer 1's Dependencies, the Tau Ceti citation deleted, and two sentences dropped from Downstream consumers. `Suggested.lean` is unchanged. Library citations were checked at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9); cross-roadmap citations on main (dba22e3b) and at the open heads named below. One P3 finding remains, carried from round 8; nothing blocks.

## R01 (P3) — The family index still cites a section "H6" this roadmap does not have

Location: `TauCetiRoadmap/HilbertModules/README.md` line 479 (this pull request's own file, byte-identical to main): "from the θ≠0 Schwartz imprimitivity model in HeisenbergImprimitivity H6."

Claim: the θ≠0 model lives in a section H6 of this roadmap.

Witness: this README's layers are numbered 1–6 with `### k.n` subsections; the two-torus dictionary with the θ≠0 model is `### 6.3` (line 830). No heading or id "H6" occurs in it (`grep -n "H6"` finds nothing). The parent's own `## H6` (line 705) is closed module operators, so a reader following the citation lands in the wrong roadmap.

Repair: in `TauCetiRoadmap/HilbertModules/README.md` line 479, replace "HeisenbergImprimitivity H6" with "HeisenbergImprimitivity §6.3". Round 8's R02 asked for this together with the Downstream consumers sentence; the sentence was repaired (the H5 clause is gone), the index was not. The brief treats the family index as this pull request's own, so the one-line edit belongs here.

## Previous findings

- R01 — repaired: §1.1 `*Needs:*` (lines 256–258) now cites Mathlib `ContinuousMonoidHom.instContinuousEval` "(joint continuity of evaluation `M̂×M→𝕋` for locally compact M, through `LocallyCompactPair`) for the continuity of β and σ on G×G"; the Mathlib contract (135–139) and Layer 1 Dependencies (333–334) carry it with its file; `TauCeti.PontryaginDual.continuous_coe_eval_const` no longer occurs in the folder.
- R02 — partly repaired: Downstream consumers (868–876) no longer mentions HilbertModules H5; the family index line 479 still reads "HeisenbergImprimitivity H6" (this report's R01).

## Verified sound

**The repair of round-8 R01, at the pin.** The new bullet's claims were opened at Mathlib 1b1ccf4b:
- `ContinuousMonoidHom.instContinuousEval [LocallyCompactPair A B] : ContinuousEval (A →ₜ* B) A B`, `Mathlib/Topology/Algebra/Group/CompactOpen.lean:50`, for monoids A, B with topologies; `instContinuousEvalConst` at line 46 is the pointwise version with no hypothesis.
- `instance (priority := 900) [LocallyCompactSpace X] : LocallyCompactPair X Y`, `Mathlib/Topology/Compactness/LocallyCompact.lean:142`, for every Y, as the bullet says.
- `PontryaginDual A := A →ₜ* Circle`, `Mathlib/Topology/Algebra/PontryaginDual.lean:40`, so "at `B=Circle` this is evaluation `M̂×M→𝕋`" is the definition.

Elaborated on scratch files at the pin (`lake env lean` from the worktree):
- `Continuous fun p : PontryaginDual A × A => ((p.1 p.2 : Circle) : ℂ)` under `[LocallyCompactSpace A]`, by `continuous_subtype_val.comp (continuous_eval : Continuous fun p : (A →ₜ* Circle) × A => p.1 p.2)`: no diagnostic.
- β itself: `Continuous fun p : (M × M̂) × (M × M̂) => ((p.2.2 p.1.1 : Circle) : ℂ)` for a locally compact abelian M, by composing `continuous_eval` with the projection `(p.2.2, p.1.1)`: no diagnostic. σ(x,y)=β(x,y)·conj β(y,x) is then continuous as a product of continuous maps.
- Negative control: `ContinuousEval (M →ₜ* Circle) M Circle` without `[LocallyCompactSpace M]` fails to synthesise, while `ContinuousEvalConst (M →ₜ* Circle) M Circle` synthesises with no hypothesis. So the joint-continuity input really needs the local compactness §1.1 assumes, and the pointwise lemma round 8 flagged would not have sufficed.
- One formal remark, no change needed: instance search does not unfold the `def PontryaginDual`, so an implementer writes the ascription `(M →ₜ* Circle)` or `continuous_eval` on that carrier; the README's statement is of the mathematics and is correct.

**Downstream consumers (lines 866–876).** The remaining paragraph names CompactQuantumMetricSpaces §6.0 and OperatorKTheory §7.5 only, as round 8 verified at the heads 7db4c193 and 1377338a; the two dropped sentences (HilbertModules H5, NoncommutativeGeometry N7) described no consumption of this roadmap, so dropping them loses nothing. N7 remains cited where it is used: Scope (17, 51), How to read (222), §6.3 (840–860) and Layer 6 Dependencies (864), all unchanged.

**Gate and dependency check.** The worker's gate at 4b902fe passes every check with `build=0`. My own run of the brief's gate command against the candidate order prints every text check at 0 (`set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`) and `OK`. The dependency check as the brief gives it prints `depcheck: 237 roadmaps, 2285 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. Candidate positions: CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, CompactQuantumMetricSpaces 208, HeisenbergImprimitivity 399; OperatorAlgebraDynamics, AmenableGroups, ThetaSeries and NoncommutativeGeometry are on main. The brief's outside-folder diff is empty; the pull request adds only `README.md`, `Suggested.lean` and `metadata.toml` under the folder.

**Lean.** `Suggested.lean` is unchanged since round 8. A scratch copy with `#check @name` for all 10 declarations elaborated with exactly the three `declaration uses 'sorry'` warnings (lines 84, 105, 114) and no other diagnostic; every elaborated type equals `signatures.md` and its README statement (the three headlines carry `[DiscreteTopology ↥L] [IsZLattice ℝ L]` in their own signatures; the file has no `variable` block). Form unchanged: single `import Mathlib`, no `set_option`, no `lemma`, no sorried data, docstrings everywhere. The padding probes and headline audit of round 8 stand (nothing in the file changed).

**Overlap facts** (`scratch/overlaps.md`): no other open pull request changes this roadmap; no cited id is dropped by one; the one id only an open revision defines, OperatorAlgebraDynamics D1.CentralTwists (#1137, head 895d9b85, heading at its README line 909, unchanged since round 8), is named in the description's depends-on list and merge-order paragraph, so it is not a finding. Ownership against the open heads was re-run by round 8 on the same folder content outside the 22 changed lines; the changed lines introduce no new object.

**Seeded sample.** None of the sampled targets (1.3, 2.1–2.4, 3.1–3.3, 4.1, 4.2, 5.2, 5.3, 6.1–6.3) falls in the changed lines; their locators were reread by round 8 against rieffel88 and austad-enstad20 and the text has not changed. The §1.1 locator adjacent to the change was reread: rieffel88 line 337 (p. 265) defines `D^⊥` as the set of y with `ρ(w,y)=1` for all w∈D, as §1.1 cites it.

**Adversarial table.** Rows for unchanged statements carry forward from round 8 (its table, with the values there); new rows were computed this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 continuity of β on G×G (changed, round-8 R01) | M locally compact; M arbitrary | positive: `continuous_eval` on `(M →ₜ* Circle)×M` composed with `(p.2.2,p.1.1)` elaborates; control: `ContinuousEval (M →ₜ* Circle) M Circle` without local compactness fails to synthesise; `ContinuousEvalConst` holds always | claim true at the pin; hypothesis needed and present | none |
| §1.1 continuity of σ (changed) | σ(x,y)=β(x,y)·conj β(y,x) | product of two continuous maps composed with the swap; at x=(1,0), y=(0,¼) on ℝ: β=i, conj β(y,x)=1, σ=i | continuous; value agrees with §1.1's Check | none |
| Layer 1 Dependencies (changed) | names listed | `instContinuousEval` at CompactOpen.lean:50; `ZLattice.dual` Dual.lean:78, `dual_comap_continuousLinearEquiv` 143, `covolume_comap_continuousLinearEquiv` Covolume.lean:99, `covolume_dual` 273 (round 8) | all exist at the pins | none |
| Downstream consumers (changed) | sentences dropped | H5 on main builds `M_k` "separately" (parent 478–479): no consumption; N7 is compared in §6.3 (840–860), not a consumer; CQMS §6.0 and OKT §7.5 as round 8 | consistent | none |
| Family index line 479 (round-8 R02) | id "H6" | this README: layers 1–6, θ≠0 model at `### 6.3` (830); parent's `## H6` (705) is closed operators | wrong id | R01 |
| §1.1 π, β = OperatorAlgebraDynamics Π, ω | as round 8 | `π_xπ_yξ(t)=ψ(m)π_(x+y)ξ(t)`; `π_x^*=conj(β(x,−x))π_(−x)` (round 8) | equal | none |
| §1.1 Check β on ℝ | as round 8 | `e((t+1)/2)=−e(t/2)`, β=−1; at ¼, β=i; control −i (round 8) | equal | none |
| Lean `schrodingerAdjoint` | as round 8 | k=1 probe `π_xπ_x^*ξ=ξ` closes (round 8) | inverse of a unitary | none |
| §1.2 annihilators | as round 8 | `D^⊥=(1/b)ℤ×(1/a)ℤ` for `aℤ×bℤ`; `F×{1}` self-annihilating (round 8) | equal | none |
| §1.3 `L^⊥=J⁻¹L^∨`, Checks | as round 8 | `L=ℤ×2ℤ`: `L^∨=ℤ×½ℤ`, `J⁻¹L^∨=½ℤ×ℤ`, covol ½; `c_L=2`, `c_(L^⊥)=½` (round 8) | equal | none |
| §2.1–2.4 Checks, Gaussian coefficient, orthogonality, four-vector identity, sign `F_sF(e)=𝓕F(−Je)`, native Poisson at v=0 | as round 8 | values in round 8's table | equal | none |
| `fundamental_identity` | `L=ℤ×2ℤ`; k=0 | `θ(1)θ(4)` both sides; k=0 both `conj(η)ξζ` (round 8) | equal | none |
| §3.1 star, cochain direction, rotation cocycle, gauge-ideal triviality | as round 8 | `δ₁^*=−δ₁`, `δ₁δ₁^*=1`; `U₂U₁=e(θ)U₁U₂`; `τ(a)1∈I` (round 8) | equal | none |
| §3.2, §3.3 pairings and Checks | as round 8 | `c_D=½` projection `½(1+M_χ₁)`; `⟨δ₀,δ₀⟩_A=1+M_χ₁` (round 8) | equal | none |
| §4.1 norms and trace, §4.2 Checks | as round 8 | `√2>1`; `B=ℂ`, `A≅M_|F|` (round 8) | consistent | none |
| §5.1 smooth vectors, inverse | as round 8 | `a⁻¹=Σ(−1)^n2^(−n−1)δ_n` (round 8) | equal | none |
| `exists_parsevalFrame`, `parsevalFrame_trace` | as round 8 | k=0: n=1, g=1; `L=(½)ℤ×ℤ`: `‖g‖²=½`; index-two sublattice doubles both sides (round 8) | true; nonvacuous | none |
| §5.3, §6.1, §6.2, §6.3 | as round 8 | `F₊π_(m,χ)` phase `e(−(s+s₀)m)`; mass 2 lattice; q=2 cocycle values 3/2, 2; `U₁⁻¹U₂=e(θ)U₂U₁⁻¹`; `‖g‖²=θ=τ(p)` (round 8) | equal | none |

**Policy and shape** of the changed lines: Unicode mathematics, backticked library names with files, no process words, no pull-request numbers, no absolute paths. The Tau Ceti contract (lines 147–167) now lists only declarations some target uses.

## Not verifiable

- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 24.10 (§1.2): `uncertified` in the manifest (paywalled), cited by its locator only; untouched by this change.
- The JFAA version of Austad–Enstad 2020 is paywalled; round 8 checked Propositions 3.5 and 3.7 in arXiv 1904.10826v2, the version the manifest records; untouched by this change.

## Source issues

- none

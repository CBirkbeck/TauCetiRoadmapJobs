# Review of HeisenbergImprimitivity (pull request #1149 at 926979b)
Folder: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/`
**Verdict:** accepted

This is an incremental re-review of the 3 lines changed since 4b902fe, the head that round 9 read. The only change is one added sentence at the end of "How to read the build" (`README.md` lines 238–239). It maps the parent's citation "HeisenbergImprimitivity H6" to this roadmap's §6.3. `Suggested.lean` is unchanged (`git diff 4b902fe HEAD` on it is empty). Nothing changed outside the folder. Cross-roadmap citations were resolved on main (11b9f2ea) and at the open heads named below. No finding remains.

## Previous findings

- R01 — repaired: `README.md` lines 238–239 now read "HilbertModules H5 cites the θ≠0 Schwartz imprimitivity model of that dictionary as HeisenbergImprimitivity H6; under this roadmap's numbering it is §6.3."

## Verified sound

**The repair: a mapping of the old id to the new section.** Round 9 asked for an edit to the parent's line 479. The author added an old → new mapping in this README instead. Under the brief's rule this keeps the parent's citation valid without changing it. I checked each part of the sentence:
- **"HilbertModules H5 cites …".** In `TauCetiRoadmap/HilbertModules/README.md` (byte-identical to main), `## H5` is at line 356 and `## H6` at line 705. The citation "constructed separately from the θ≠0 Schwartz imprimitivity model in HeisenbergImprimitivity H6" is at line 479, inside H5.
- **"… as HeisenbergImprimitivity H6".** The id comes from this roadmap's own earlier numbering, so the mapping records a real former id. At commit 18b9874a (the first version of this child), the README's line 310 heading was `## H6. Complete factor examples and the two-torus dictionary`. That material is now Layer 6 (line 791).
- **"… it is §6.3".** `### 6.3 The two-torus dictionary` (line 831) is the θ≠0 model. It builds the Schwartz module on S(ℝ) for `E_θ={(nθ,χ_m)}` and states "At θ=0, E_0 is not a lattice and the construction does not apply". This agrees with the parent building its commutative `M_k` "separately".
- **The mapping is complete.** `roadmaps grep 'HeisenbergImprimitivity'` over main and the 457 open heads finds 15 citations outside this folder:
  - CompactQuantumMetricSpaces: §3.1 and Layer 6;
  - OperatorAlgebraDynamics: Layer 1 and §3.1;
  - NoncommutativeGeometry: by name only;
  - HilbertModules: lines 119 and 479.

  Only line 479 uses the old H-numbering, and the new sentence maps it.
- **Form.** The sentence names a roadmap and its section in the house form. It uses no process words and no pull-request number. The gate's `layer-ids`, `target-ids`, `dropped` and `readme-ids-missing` checks are 0. `roadmaps resolve` on the parent README lists no citation found nowhere.
- Remark, no change requested: the parent's line 479 still says "H6". The mapping sentence is what makes that citation resolve.

**Gate.**
- The worker's gate at 926979b passes every check, including `build=0`.
- My run of the brief's command, verbatim, prints every text check at 0 except one line: `depcheck: NOT IN ORDER: HeisenbergImprimitivity (insert it after its last supplier)`. That run reads the configured default order, which does not list this roadmap yet; the brief says not being in the order is not a finding.
- The same command with `--order` set to the candidate merge order and `--build` prints `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- The brief's outside-folder diff is empty.

**Dependency check** (the brief's command, `--movable`, candidate order): `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Candidate positions: CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, CompactQuantumMetricSpaces 210, HeisenbergImprimitivity 401.
- OperatorAlgebraDynamics, NoncommutativeGeometry and ThetaSeries are on main.
- The new sentence's only cross-roadmap name, HilbertModules H5, is not a supplier edge: H5 consumes nothing from this roadmap.
- Remark, no change requested here: CompactQuantumMetricSpaces at its head 7db4c193 has `*Needs:* HeisenbergImprimitivity §3.1` (its line 1469) but sits at 210.
  - Its own dependency check prints `moved: HeisenbergImprimitivity moved in the merge order up before CompactQuantumMetricSpaces` with 0 problems.
  - That move keeps this roadmap's only non-main suppliers (CStarAlgebras 7, HilbertModules 8) earlier, so it creates no UPWARD edge here.
  - This README names CompactQuantumMetricSpaces only under Downstream consumers.

**Lean.**
- `lake env lean` on `Suggested.lean` gives exactly three warnings, `declaration uses 'sorry'` at lines 84, 105 and 114, and no other diagnostic.
- I elaborated a scratch copy with `#check @name` for all 10 declarations. Each elaborated type equals `signatures.md` and its README statement. `fundamental_identity`, `exists_parsevalFrame` and `parsevalFrame_trace` carry `[DiscreteTopology ↥L] [IsZLattice ℝ L]` in their own signatures; there is no `variable` block.
- Form unchanged: single `import Mathlib`, no `set_option`, no `lemma`, no sorried data. Round 8's padding probes and headline audit stand.

**Overlap facts** (`scratch/overlaps.md`).
- No other open pull request changes this roadmap, and none drops an id it cites.
- One cited id is defined only by an open revision: OperatorAlgebraDynamics D1.CentralTwists. At the #1137 head (895d9b85, unchanged since round 9) it is defined. The description names that pull request in its depends-on list and its merge-order paragraph, so this is not a finding.
- The change introduces no object, so round 8's ownership audit against the open heads stands.

**Seeded sample.** The changed passage touches the sample only through §6.3, which it names. §6.3 carries no source locator: rounds 7 and 8 recorded it as a computed comparison, and I recomputed its values below. No other sampled target, and no locator, is in the changed lines. Round 8 reread those locators against rieffel88 and austad-enstad20, and the text has not changed.

**Adversarial table.** New rows were computed this round. Rows for untouched statements carry forward from round 9, which carried round 8's values.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Mapping sentence, lines 238–239 (changed) | parent H5/H6 spans; old child numbering; other citations | citation at parent line 479 ∈ [356, 705) = H5; 18b9874a line 310 `## H6. … two-torus dictionary` → Layer 6 (791), θ≠0 model `### 6.3` (831); 15 citations elsewhere, only line 479 old-numbered | accurate and complete | none |
| §6.3 θ≠0 model (named by the change) | θ=½; general θ; θ=0 | `σ((nθ,χ_m),(l,χ_u))=e(ml−unθ)`, which is 1 for all m,n iff l∈ℤ, u∈(1/θ)ℤ; so `D_θ={(l,χ_(j/θ))}`. θ=½: `c_E=½`, `c_D=2`, product 1, `τ(p)=½` as its Check. θ=0: `c_E=0`, `φ(0,n)=(0,χ_0)` for all n | equal; θ=0 excluded, as the parent's "separately" says | none |
| §6.3 sign Check | `σ((nθ,−m),(l,−j/θ))` | `e(ml−(j/θ)nθ)=e(ml−jn)=1` | equal to the README's `e(−jn+ml)=1` | none |
| §1.1 continuity of β, σ | round 9 | `continuous_eval` on `(M →ₜ* Circle)×M` elaborates; without `LocallyCompactSpace` `ContinuousEval` fails to synthesise; σ at x=(1,0), y=(0,¼) on ℝ equals i | true; hypothesis present | none |
| §1.1 π, β = OperatorAlgebraDynamics Π, ω | round 8 | `π_xπ_yξ(t)=ψ(m)π_(x+y)ξ(t)`; `π_x^*=conj(β(x,−x))π_(−x)` | equal | none |
| §1.1 Check β on ℝ | round 8 | `e((t+1)/2)=−e(t/2)`, β=−1; at ¼, β=i; control −i | equal | none |
| Lean `schrodingerAdjoint` | round 8 | k=1: `π_xπ_x^*ξ=ξ` | inverse of a unitary | none |
| §1.2 annihilators | round 8 | `(aℤ×bℤ)^⊥=(1/b)ℤ×(1/a)ℤ`; `F×{1}` self-annihilating | equal | none |
| §1.3 `L^⊥=J⁻¹L^∨` | round 8 | `L=ℤ×2ℤ`: `L^∨=ℤ×½ℤ`, `J⁻¹L^∨=½ℤ×ℤ`, covolume ½; `c_L=2`, `c_(L^⊥)=½` | equal | none |
| §2.1–2.4 Checks | round 8 | Gaussian coefficient, orthogonality, four-vector identity, `F_sF(e)=𝓕F(−Je)`, native Poisson at v=0 (values in round 8) | equal | none |
| `fundamental_identity` (headline) | round 8: `L=ℤ×2ℤ`; k=0 | `θ(1)θ(4)` on both sides; k=0: both sides `conj(η)ξζ` | equal | none |
| §3.1 star, cocycles, gauge ideal | round 8 | `δ₁^*=−δ₁`, `δ₁δ₁^*=1`; `U₂U₁=e(θ)U₁U₂`; `τ(a)1∈I` | equal | none |
| §3.2, §3.3 pairings | round 8 | `c_D=½`: projection `½(1+M_χ₁)`; `⟨δ₀,δ₀⟩_A=1+M_χ₁` | equal | none |
| §4.1, §4.2 | round 8 | norm bound `√2>1`; `B=ℂ` gives `A≅M_|F|` | consistent | none |
| §5.1 smooth inverse | round 8 | `a⁻¹=Σ(−1)^n2^(−n−1)δ_n` | equal | none |
| `exists_parsevalFrame`, `parsevalFrame_trace` (headlines) | round 8: k=0; `L=(½)ℤ×ℤ`; index-two sublattice | k=0: n=1, g=1, `Σ|g|²=1=covol`; `‖g‖²=½`; both sides double | true; not vacuous | none |
| §5.3, §6.1, §6.2 | round 8 | `F₊π_(m,χ)` phase `e(−(s+s₀)m)`; mass-2 lattice in `ℝ×ℤ/2`, `D^⊥` covolume ½; q=2 cocycle parameter 3/2, covolume 2 | equal | none |

**Library and citations opened this round:**
- Parent `TauCetiRoadmap/HilbertModules/README.md` lines 112, 119, 356, 479 and 705.
- This README lines 19–60, 226–239 and 791–893.
- OperatorAlgebraDynamics at 895d9b85: D1.CentralTwists.
- CompactQuantumMetricSpaces at 7db4c193: lines 1465–1471.
- Commit 18b9874a's child README headings.

No new library declaration enters with the change.

**Policy and shape of the changed lines:** Unicode mathematics, no LaTeX, no process words, no pull-request numbers and no paths.

## Not verifiable

- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 24.10 (§1.2): `uncertified` in the manifest (paywalled) and cited by its locator only. The change does not touch it.
- The JFAA version of Austad–Enstad 2020 is paywalled. Round 8 checked Propositions 3.5 and 3.7 in arXiv 1904.10826v2, the version the manifest records. The change does not touch it.

## Source issues

- none

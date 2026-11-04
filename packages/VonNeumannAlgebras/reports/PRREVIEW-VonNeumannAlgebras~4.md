# Review of VonNeumannAlgebras (pull request #889 at f3d72f3)

**Verdict:** needs changes

Incremental re-review of the 54 README lines changed since 50bdeb4 (31 insertions, 23 deletions; `TauCetiRoadmap/VonNeumannAlgebras/README.md` only, no Lean file and nothing outside the folder). The change repairs the locator findings of the previous review in substance: every Anantharaman–Popa theorem page of Chapters 6 and 8 is now the printed page, Hiai's Theorem 6.6 is cited for the state case only, the vector-state sentence of V13b.SpatialNorm now claims the closed convex hull, three "B1's Hahn–Banach separation" citations are repointed to Mathlib's geometric separation theorems (which exist at the pin with the stated hypotheses), and Downstream names the CStarAlgebras C5 contract. What still blocks is untouched by the change: the folder re-plans four foundations that `OperatorTheory` on main plans (P1), and pull request 1041 still builds the same folder with the same declarations (P2).

## R01 (P1) — Four foundations are planned here although `OperatorTheory` on main plans them

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:28–39` ("OperatorTheory is a consumer of this roadmap … The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), and closed operators, Cayley transforms and the multiplier-form unbounded spectral theorem (V10.ClosedOperators)"); targets at `:473`, `:482`, `:877`, `:2072`.

**Claim:** Re-raised: R01 of the previous review (R02 of the one before). The diff since 50bdeb4 touches none of these lines. Main `OperatorTheory` plans the same four objects with ids: `PolarDecomposition/README.md:292` (Part B, polar decomposition and partial isometries) and `:365–372` (PD-B23 onward, bounded polar factor, initial and final projections); `SelfAdjointSpectralTheory/README.md:293` (SA-B05 Borel functional calculus), `:320` (SA-B14), `:676` (SA-B85 cyclic multiplication models), `:781`, `:1041`, `:1127` (SA-D24 Cayley transform), `:1186`; `OperatorIdeals/README.md:349–351` (OI-B29 nuclear gauge, OI-B30 trace-class family). What another roadmap plans is imported by name and section, never planned again.

**Witness:** `SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1371` consume "VonNeumannAlgebras V4.0.Fields" at commit `4831498` (pull request 1041's foundations folder); main therefore already fixes the direction VNA foundations → OperatorTheory → Borel calculus consumers, and this README's `:28–29` agrees with that direction while still planning the Borel calculus itself.

**Repair:** As before: keep the foundations prefix (V0–V4 with V4.0.Fields) as the supplier roadmap and make this pull request its Part II from V5 on, consuming `PolarDecomposition` PD-B23–B34, `SelfAdjointSpectralTheory` SA-B05–B14, SA-B85 and Parts C–E, and `OperatorIdeals` OI-B29–B30 and Part C by id; delete V2.PolarDecomposition, V2.BorelCalculus, the trace-class/Hilbert–Schmidt paragraph of V4.Core and V10.ClosedOperators, keeping the membership and affiliation adapters (`f(a)∈W*(a)`, `v∈M`, affiliation) that `:38–39` describes. Control: after the edit, every mention of polar decomposition, Borel calculus, trace class and Cayley transform is a citation of an OperatorTheory id, and `OperatorTheory` appears under `## Exact supplier contracts`.

## R02 (P2) — Two open pull requests build the same folder and declare the same names

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:82`, `:110`, `:114`, `:119`, `:127`, `:133`, `:139`, `:145` against pull request 1041's `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:24–79`; README Layers 0–4 against pull request 1041's V0–V4.

**Claim:** Re-raised: R02 of the previous review. `roadmaps list` (index of 2026-10-29T18:18:47Z) shows `#889 VonNeumannAlgebras (new) f3d72f3` and `#1041 VonNeumannAlgebras (new) 8b00f8a`. Pull request 1041's `Suggested.lean` declares `IsFactor` (`:24`), `ProjectionEquivalent` (`:30`), `ProjectionSubequivalent`/`equivalent_of_subequivalent` (`:48`), `double_commutant_iff_isClosed_image_ofCLM` (`:64`), `IsCyclic` (`:71`) and `isCyclic_iff_isSeparating_commutant` (`:79`) on `VonNeumannAlgebra H`, as this file does. One object has two owners, and main `OperatorTheory` cites the 1041 folder (R01).

**Witness:** `roadmaps show VonNeumannAlgebras --pr 1041 --file Suggested.lean`, lines listed above.

**Repair:** One owner per object, in the direction of R01: let 1041 be the foundations roadmap and this one its Part II (introduction says where the base stops; V0–V4 deleted here and cited by section), or close 1041 and split this folder into the same two pieces. Control: exactly one open pull request declares `IsFactor` on `VonNeumannAlgebra H`.

## R03 (P3) — The two companion Lean files are unchanged: Mathlib sub-imports, duplicate statement, boundary theorem, diagonal-only signature

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1–2`, `:4–9`, `:26`, `:34–38`; `TauCetiRoadmap/VonNeumannAlgebras/ProjectionClosureTargets.lean:1–3`, `:5–13`, `:34`, `:41`.

**Claim:** Re-raised: R03 of the previous review; `git diff --stat 50bdeb4 HEAD` lists `README.md` only, so both files are byte-identical to the two previous heads. They import `Mathlib.Analysis.InnerProductSpace.StarOrder`, `…WeakOperatorTopology`, `…Normed.Module.FiniteDimension`, `…SpecialFunctions.Pow.Complex`, `…Matrix.ConjTranspose` instead of `import Mathlib`; their docstrings ("**This file is not the roadmap and is not exhaustive.** These are suggested forms") are not the target-signatures form; `wot_closure_projections` (`ProjectionClosureTargets.lean:34`) states the theorem already in `Suggested.lean:102`; `isClosed_projections_of_finiteDimensional` (`:41`) is the finite-dimensional boundary case the README keeps as a Check; `diagonalModularPower_preserves_star_iff` takes `h : Fin n → ℝ`, so the README's non-diagonal admissible density is outside its signature; `diagonalModularPower_star` (`:26`) has no docstring.

**Witness:** the README Check computes `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]` for the non-diagonal `h=[[1/2,1/6],[1/6,1/2]]`, which no `Fin n → ℝ` encodes.

**Repair:** Delete both files; the README keeps every statement (the closure headline is in `Suggested.lean`, the finite-dimensional case and the two densities are Checks). Do not prove anything in place.

## R04 (P3) — Two citations of "BanachSpaceTheory B1's locally convex separation" remain; B1 has no separation target

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:381` ("Banach–Alaoglu; BanachSpaceTheory B1's locally convex separation; Layer 0's C*-structure on `B(H)`") and `:463` ("BanachSpaceTheory B1 (locally convex separation and weak-star topology on the predual side)").

**Claim:** The residual of the previous R05: the repair repointed the three citations at `:176`, `:1863` and `:3567` to Mathlib but left these two. Main `BanachSpaceTheory/README.md` B1 (`:41–73`) states annihilators, quotient duals, adjoints, the closed-range theorem, Goldstine, the bipolar theorem, the weak/norm closure agreement for convex sets, Mazur and the evaluation criteria for weak and weak-star continuity; its only separation statement is the prerequisite line `:27` ("Mathlib's Hahn–Banach theorem"), and separation lemmas appear only as B2 intermediates (`:76`). The B1 contract at `:176–177` ("annihilators, quotient duals, adjoints and Goldstine") is correct, so the two `*Needs:*`/Dependencies lines now cite B1 for something the contract itself no longer lists. The same two passages (V1's "shared continuous-dual and closed-convex-set results", `:377–379`) and the V13b route (`:3551–3553`, "separated by a self-adjoint a") also use that a weak-star continuous functional on the predual side is evaluation at an element, which is B1's evaluation criterion and is cited in neither `*Needs:*` line.

**Witness:** `BanachSpaceTheory/README.md:27` and `:41–73` at main; `Mathlib/Analysis/LocallyConvex/Separation.lean:230` (`geometric_hahn_banach_closed_point`) and `Mathlib/Analysis/LocallyConvex/WeakDual.lean:231–233` (`WeakBilin.locallyConvexSpace`, real local convexity of the weak and weak-star topologies, under `[NormedSpace ℝ 𝕜] [Module ℝ E] [IsScalarTower ℝ 𝕜 E]`).

**Repair:** At `:381` and `:463` replace "B1's locally convex separation" by "Mathlib's `geometric_hahn_banach_closed_point` (`WeakBilin.locallyConvexSpace` gives local convexity of the weak and weak-star topologies) and B1's weak/norm closure agreement for convex sets and weak-star continuity criteria by evaluation"; add "B1's weak-star continuity criterion by evaluation" to the V13b.SpatialNorm `*Needs:*` line (`:3565–3568`). Control: grep for "B1" next to "separation" returns nothing.

## Previous findings

- R01 — not repaired: `:28–39` still says "The Hilbert-space inputs of the theory are owned here: bounded polar decomposition (V2.PolarDecomposition), the bounded Borel calculus … (V2.BorelCalculus), trace class … (V4.Core), … (V10.ClosedOperators)"; targets at `:473`, `:482`, `:877`, `:2072` unchanged.
- R02 — not repaired: `roadmaps list` still shows `#1041 VonNeumannAlgebras (new) 8b00f8a` declaring `IsFactor`, `ProjectionEquivalent`, `IsCyclic`, `double_commutant_iff_isClosed_image_ofCLM` on `VonNeumannAlgebra H`.
- R03 — not repaired: `git diff --stat 50bdeb4 HEAD` lists `README.md` only; both companion files byte-identical, same imports, docstrings and signatures.
- R04 — repaired on this side: Downstream `:3999–4002` now reads "its C5 consumes V13b.SpatialNorm's spatial norm, its representation independence, slice maps and inclusion functoriality, and adds the maximal norm and the comparison of C*-norms", which matches what pull request 860's C5 (`CStarAlgebras/README.md:546–558` at `1d4e2ed`) constructs (minimal and maximal completions, `‖·‖min≤‖·‖max`, every C*-cross norm bounded). The 860 head's `:47` still says V13b "consumes C5's minimal tensor construction" and its C5 still proves representation independence; that is the other pull request's text and not a finding here.
- R05 — partly repaired: all Anantharaman–Popa theorem pages are now printed pages (6.2.8 p. 88, 6.3.4–6.3.5 pp. 91–92, 6.4.1 p. 93, 6.4.4 p. 95, 8.2.2 p. 124, 8.3.1–8.3.2 pp. 124–125, 8.3.5–8.3.8 pp. 126–127, 8.4.2 p. 128, 8.5.4 p. 133, 8.5.5–8.6.2 p. 134, coupling constant pp. 135–136; each verified below); Hiai 6.6 is cited for "a faithful normal state" and Takesaki II IX.4.2 for the weight (`:2867–2868`); `:3551–3552` now says "the weak-star closed convex hull of the vector states … is the whole state space"; `:176`, `:1863`, `:3567` cite Mathlib. The two "B1's locally convex separation" citations at `:381` and `:463` remain (R04 above).

## Verified sound

**Scope.** The diff of the folder since 50bdeb4 (`changes.md`, 54 lines) read in full, with every passage it touches at this head (`:120–135`, `:174–182`, `:1206–1232`, `:1334–1342`, `:1382–1392`, `:1505–1525`, `:1574–1582`, `:1637–1664`, `:1845–1868`, `:2860–2874`, `:3540–3572`, `:3990–4002`) and what cites them: the Scope bullet on BanachSpaceTheory (`:43–47`), the remaining B1 citations (`:248`, `:258`, `:343`, `:350`, `:381`, `:463`, `:915`, `:932`, `:1177`), the Mathlib contract paragraph. Main `BanachSpaceTheory/README.md` (B1 `:41–73`, B2 `:74–111`, James `:85`, Krein–Šmulian `:91`), main `OperatorTheory/{PolarDecomposition,SelfAdjointSpectralTheory,OperatorIdeals}` at the lines cited under R01, the `CStarAlgebras` head (860, `1d4e2ed`, `:40–50`, `:546–600`), pull request 1041's `Suggested.lean`. No file of the worktree was changed. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty. The Lean files are byte-identical to the previous head, so the previous report's full reading of them stands.

**Gate** (worker, at f3d72f3): `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Every check passes.

**Dependency check** (verbatim, run this round):

```text
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `ORDER.txt` lists this roadmap third (after KacMoody and LefschetzPencilsAndVanishingCyclesPartII). `roadmaps resolve` (worker): no cross-roadmap citation and no Lean name found nowhere.

**Lean.** `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` from the worktree, this round: exit 0, exactly 10 `declaration uses sorry` warnings (lines 71, 82, 91, 102, 119, 139, 168, 176, 183, 192), nothing else. A scratch copy with every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (simp [the eight definitions]; done) | sorry` and `#check @name` for all 18 declarations: all 10 theorems still report `sorry` (none closes, so no padding by that test); 17 elaborated types printed and compared with the README (`[CompleteSpace H]` on every `H`-declaration, `[μ.IsHaarMeasure] [μ.Regular] [Countable ↥Γ]` and `Dense ↑Γ` on `ergodicSMul_dense_subgroup`, `[Nontrivial A] [SeparableSpace A]` on the ℓ² theorem, `¬FiniteDimensional ℂ H` on the projection-closure theorem); the 18th (`IsCyclic`) is ambiguous with Mathlib's group-theoretic `IsCyclic` under `open`, and its fully qualified type in the worker's signature file keeps `[CompleteSpace H]`. **18 signatures checked, no dropped binder, nothing changed.**

**Pinned declarations opened this round** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; paths library-relative). `Analysis/LocallyConvex/Separation.lean:230` `geometric_hahn_banach_closed_point` (hypotheses `Convex ℝ s`, `IsClosed s`, `x ∉ s`; conclusion a `StrongDual ℝ E` functional `f` and `u` with `f a < u` on `s` and `u < f x`), `:197` `geometric_hahn_banach_compact_closed`, `:124` `geometric_hahn_banach_open_point`, under the section variables `[TopologicalSpace E] [AddCommGroup E] [Module ℝ E] [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] [LocallyConvexSpace ℝ E]` (`:86–193`), and the `RCLike` versions at `:338`, `:359` (`:258–259`): exactly "a locally convex real topological vector space" as the README says. `Analysis/LocallyConvex/WeakDual.lean:231–233` `WeakBilin.locallyConvexSpace : LocallyConvexSpace ℝ (WeakBilin B)` under `[NormedField 𝕜] [NormedSpace ℝ 𝕜] [Module ℝ E] [IsScalarTower ℝ 𝕜 E]`, which supplies the "applied in the weak and weak-star topologies" clause for `WeakDual ℂ A` and the weak topology of a predual. Everything else cited by the changed lines was opened in the previous report and is unchanged at the pin.

**Cross-roadmap citations resolved this round:** BanachSpaceTheory B1 `:41–73` (annihilators `:43`, quotient duals `:47–48`, adjoints `:49–50`, Goldstine `:60–61`: the contract at `:176–177` is exact), B2 `:85` (James) and `:91` (Krein–Šmulian), as `:178–179` cites; the CStarAlgebras head's C5 (`:546–558`) for the Downstream sentence; `OperatorTheory` on main for R01; pull request 1041 for R02. Ownership against open pull requests whose files the brief did not supply was not checked.

**Seeded sample (13.1, 13.2), where the diff touches it.** 13.1 is untouched (its locators were read in the previous report: Peterson 6.2.1 `peterson2013 line 3948`, 6.2.2 `line 3975`, 6.3.6 `line 4114`). In 13.2 the diff changes only V13b.SpatialNorm's route sentence and `*Needs:*` line; its source, Takesaki I Theorem IV.4.9, is uncertified (no legal text), and the route is checked on instances below. The Anantharaman–Popa and Hiai locators the diff corrects were each opened:

| Locator at this head | `anantharaman-popa` / `hiai2020` text | Outcome |
| --- | --- | --- |
| Theorem 6.2.8, p. 88 | line 4005 under the marker of PDF page 94 whose running head reads "88 6. FINITE FACTORS" (line 3992): unique dimension function on a diffuse finite factor | page correct |
| Theorems 6.3.4–6.3.5, pp. 91–92 | lines 4188 (PDF 97, head "6.3 … 91", line 4146) and 4228 (PDF 98, head "92 6. FINITE FACTORS", line 4201) | pages correct |
| Theorem 6.4.1, p. 93 | line 4268, PDF 99, head "6.4. DIXMIER AVERAGING THEOREM 93" (line 4255) | page correct |
| Theorem 6.4.4, p. 95 | line 4341, PDF 101, head "EXERCISES 95" (line 4331) | page correct |
| Proposition 8.2.2, p. 124 | line 5707, PDF 130, head "124 8. MODULES …" (line 5706) | page correct |
| Definitions 8.3.1–8.3.2, pp. 124–125 | lines 5742 (PDF 130, p. 124) and 5765 (PDF 131, head "… 125", line 5754) | pages correct |
| Corollary 8.3.5, Propositions 8.3.6, 8.3.8, pp. 126–127 | lines 5836, 5838 (PDF 132, head "126 8. MODULES …", line 5798) and 5862 (PDF 133, head "8.4 … 127", line 5845) | pages correct |
| Proposition 8.4.2, p. 128 | line 5920, PDF 134, head "128 8. MODULES …" (line 5888) | page correct |
| Definition 8.5.4, p. 133 | line 6157, PDF 139, head "8.5. FIRST RESULTS ON FINITE MODULES 133" (line 6120) | page correct |
| Propositions 8.5.5, 8.6.1, 8.6.2, p. 134 | lines 6182, 6196, 6205, PDF 140, head "134 8. MODULES …" (line 6163) | page correct |
| Coupling constant, pp. 135–136 | lines 6225–6226 (PDF 141, head "EXERCISES 135", line 6210) and 6299 (PDF 142, head "136 8. MODULES …", line 6261): the coupling constant is introduced in the exercises of Chapter 8 | pages correct (an exercise, consistent with "pp.") |
| Hiai, Theorem 6.6 (state case) | line 2698–2699: "Let ω be a faithful normal state on M", N a von Neumann subalgebra, equivalence of σ^ω-invariance with the existence of the ω-preserving expectation | supports the state case exactly as now cited; the weight case is Takesaki II IX.4.2, uncertified |

**Computed adversarial pass.** Rows marked "prev. ~3" are the previous report's rows for statements the diff leaves untouched, carried forward unchanged (their computed values are in `PRREVIEW-VonNeumannAlgebras~3.md`, Verified sound); the remaining rows are new, for the changed statements. "retain" means the instance confirms the statement; no row changed a statement.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| V5.Dixmier D(x) (6.4.1, p. 93) | M₂, x=e₁₁, u=[[0,1],[1,0]]; ℂ⊕ℂ, x=(1,0) | (e₁₁+ue₁₁u*)/2=I/2, central, so D(e₁₁)=I/2 and τ(D(e₁₁))=1/2=τ(e₁₁); in ℂ⊕ℂ the hull of a central x is {x}, D(x)=x | retain |
| Centre-valued trace (6.4.4, p. 95) | M₂⊕ℂ | T(e₁₁⊕0)=(1/2)I⊕0, T(0⊕1)=0⊕1, T(1)=1, T fixes the centre: a conditional expectation onto the centre | retain |
| 6.3.4/6.3.5 and `tracialState_unique` (pp. 91–92) | B(ℓ²), S the shift | 1=SS*+e₀₀ with S*S=1, and 1−e₀₀∼1 by the shift, so a tracial state gives τ(e₀₀)=0 and, halving 1 into two projections ∼1, τ(1)=2τ(1)=0≠1: no tracial state on an infinite factor; finite factor: at most one (constant on the Dixmier hull) | retain |
| Dimension function (6.2.8, p. 88) | R with p=1_[0,t]∈L∞[0,1]⊂R; M₂ | τ(p)=t covers [0,1]; M₂ is not diffuse (values {0,1/2,1} only), the theorem's hypothesis excludes it | retain |
| Semifinite trace definitions (8.3.1–8.3.2, pp. 124–125) | B(ℓ²), Tr=rank; type III | Tr(0·1)=0 (the `0·∞=0` convention), every nonzero projection majorizes a rank-one projection of trace 1<∞: semifinite; a type III algebra has no nonzero finite-trace projection | retain |
| II∞ trace values and comparison (8.3.5, 8.3.6, 8.3.8, pp. 126–127) | R⊗̄B(ℓ²), Tr=τ⊗rank; p=1⊗e₀₀, q=1⊗(e₀₀+e₁₁) | Tr(p⊗e₀₀)=τ(p)∈[0,1], Tr(1⊗1)=∞, values fill [0,∞]; 2Tr is another trace, so uniqueness is up to a scalar; Tr(p)=1≤2=Tr(q) and p≼q via v=1⊗e₀₀; q⋠p since 2>1 | retain, both directions |
| Standard amplification (8.2.2, p. 124) | N=M₂ on ℂ² | U:ℂ²→L²(M₂), ξ↦ξe₁ᵀ is left-N-linear, UU*=right multiplication by e₁₁∈N′, τ̂(UU*)=τ(e₁₁)=1/2=dim_N(ℂ²) | retain, matches the V7 normalisation row |
| Canonical commutant trace (8.4.2, p. 128) | N=M₂, J a point, T=ρ(e₁₂) with ρ(b)x=xb | ρ(b)ρ(c)=ρ(cb); T*T=ρ(e₂₁)ρ(e₁₂)=ρ(e₁₁), TT*=ρ(e₂₂); τ̂(TT*)=τ(e₂₂)=1/2=τ(e₁₁)=τ̂(T*T) | retain |
| dim=τ̂(1_H) (8.5.4, p. 133) | L²(M₂); ℂ²; ℂ²⊕ℂ² | 1; 1/2; 1/2+1/2=1 (additive over orthogonal sums) | retain |
| Commutant type and range (8.5.5, 8.6.1, 8.6.2, p. 134) | N=R on L²(R); on L²(R)⊗ℓ²; dim t∈(0,1] | commutant R^op type II₁, dim 1 finite; commutant R^op⊗̄B(ℓ²) type II∞, dim Σ1=∞; pL²(R) with τ(p)=t realises t | retain |
| Coupling constant (pp. 135–136) | N=M₂ on ℂ², ξ=e₁ and ξ=(e₁+e₂)/√2 | p_ξ (onto Nξ=ℂ²)=1 with τ_(N′)(1)=1; q_ξ (onto N′ξ=ℂξ) rank one with τ_N=1/2; ratio 1/2 for both vectors = dim_N(ℂ²) | retain, vector independence confirmed |
| Takesaki expectation, state case (Hiai 6.6) | M₂, φ=Tr(h·), h=diag(2/3,1/3), σ_t=Ad(h^(it)); N=diagonals; N=span{1,s}, s=e₁₂+e₂₁ | N diagonal: σ-invariant, E=diagonal compression, φ(E(x))=(2/3)x₁₁+(1/3)x₂₂=φ(x); N=span{1,s}: σ_t(s)=2^(it)e₁₂+2^(−it)e₂₁∉N for 2^(it)=i, and an N-bimodular E with φ∘E=φ would force E(e₂₂)=(2/3)1, giving φ(E(e₂₂))=2/3≠1/3: no expectation, as the converse says | retain, both directions |
| Takesaki expectation, weight case (Takesaki II IX.4.2, uncertified) | M=B(ℓ²), φ=Tr, N=ℓ∞ diagonal | Tr is not a state (Tr(1)=∞), so Hiai 6.6 does not cover it; Tr|N is semifinite (finitely supported diagonals), σ^Tr=id, E=diagonal compression has Tr(E(x))=Σx_nn=Tr(x) on positives | retain; the split citation is needed |
| V8.LCHRegularNormalBridge, Hahn–Banach step | V⊆M_* norm-closed subspace, ω∉V | `geometric_hahn_banach_closed_point` in the norm topology gives a real functional f with f<u on V and u<f(ω); f linear bounded on V forces f|_V=0, so f(ω)>0; f=Re ev_x for some x∈M by (M_*)*=M (V4), hence {Re ω′(x)=0}⊇V is weakly closed and misses ω: V weakly closed | retain |
| V8 bridge, James step and barycentre uniqueness | compact orbit set K⊆M_*, its closed convex hull | every x∈M attains sup Re ⟨·,x⟩ on K⊆hull, so on the hull: James (B2 `:85`) gives weak compactness; two barycentres agreeing against every x∈M are equal as functionals on M | retain |
| V13b.SpatialNorm route, reworded sentence | A=M₂, π=id on ℂ² | vector states = pure states (rank-one density matrices), a closed set not containing tr/2; tr/2=(ω_(e₁)+ω_(e₂))/2 lies in the convex hull. So "vector states are weak-star dense" (the old wording) is false here, while "the weak-star closed convex hull is the state space" holds | the rewording is a correction, retain |
| V13b.SpatialNorm separation step | ρ a state outside the hull K; a=diag(1,0) in M₂ | `geometric_hahn_banach_closed_point` on `WeakDual ℂ A` (locally convex over ℝ by `WeakBilin.locallyConvexSpace`) gives a weak-star continuous real functional, i.e. Re ev_a for some a∈A; replacing a by (a+a*)/2 changes no value on hermitian functionals; sup_ζ⟨ζ,aζ⟩=1=max σ(a) and every state has ρ(a)≤1, so ρ(a)>max σ(a) is impossible | retain |
| Downstream C5 sentence | 860 head C5 `:546–558` | C5 constructs min and max completions, proves `‖·‖min≤‖·‖max` and that every C*-cross norm lies between, slice maps, inclusion injectivity; the sentence names what C5 adds and what it consumes | consistent |
| Mathlib contract paragraph (`:127–130`) | `Separation.lean:197`, `:230`; `WeakDual.lean:231` | both names exist, both need `[LocallyConvexSpace ℝ E]` over `Module ℝ E`; weak and weak-star topologies are locally convex over ℝ at the pin | retain |
| B1 contract (`:176–177`) | main B1 `:41–73` | annihilators, quotient duals, adjoints, Goldstine all stated there; "Hahn–Banach separation" correctly removed | retain |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0 | prev. ~3 | retain |
| V0 Checks | ℂ², `x=[[1,−1],[−1,1]]`, c₀ | prev. ~3 | Checks correct |
| V0 GNS dimensions | tr/2 and x↦x₁₁ on M₂ | prev. ~3 | Check correct |
| `double_commutant_iff_isClosed_image_ofCLM` | A=ℂI, M₂, H=0 | prev. ~3 | retain |
| Generation Check | S={e₁₂} | prev. ~3 | Check correct |
| `closure_unitBall_eq_unitBall_double_centralizer` | A=ℂI; finite rank+ℂ on ℓ² | prev. ~3 | retain |
| `closure_isStarProjection_eq_positive_contractions` | C=1/4 on a line; H=ℂ; H=0 | prev. ~3 | retain |
| V2.RectangularL2 rectangle identity | cover A×B by A_n×B_n | prev. ~3 | retain |
| Two product conventions | μ=ν=∞·Lebesgue on [0,1], diagonal D | prev. ~3 | Check correct |
| ITP criteria | ζ_n=−e₁; cos(1/n); cos(1/√n) | prev. ~3 | Checks correct |
| V2.NonmodularProjectionLattice | D(x)_n=x_n/(n+1), y_n=1/(n+1) | prev. ~3 | retain |
| V3 multiplicity matrix | (x,c)↦(diag(x,x,c),diag(x,c)) | prev. ~3 | Check correct |
| V4.Core Checks | diag(1/n²), diag(1/n), shift | prev. ~3 | Checks correct |
| V4.PositivePredual norm formula | h=diag(2,−1) | prev. ~3 | retain |
| `IsCyclic`/`IsSeparating`/iff | M₂ on ℂ², ξ=e₁; diagonal algebra; H=0 | prev. ~3 | retain |
| Faithful C*-state counterexample | A=C([0,1],M₂) | prev. ~3 | retain |
| `ProjectionEquivalent`/`Subequivalent`/`equivalent_of_subequivalent` | v=e₂₁; M₂ e₁₁≼1; B(ℓ²) | prev. ~3 | retain |
| `IsFactor`, `IsFinite`, `IsTypeIIOne` | M₂, diag(ℂ²), H=0; M_n, B(ℓ²); R | prev. ~3 | retain |
| `isSimpleRing_of_isTypeIIOne` extraction | a=diag(1,1/2), ε=1/2 | prev. ~3 | retain |
| V6 Checks | B(ℓ²), R⊗̄B(ℓ²), ‖·‖ on positives | prev. ~3 | Checks correct |
| V6.LatticeTypes central formulas | R⊕B(ℓ²)⊕M_III | prev. ~3 | retain |
| V7 dimension normalisation | N=M₂: L²(N), ℂ²; p=e₁₁; N=ℂ, ℓ²(I) uncountable | prev. ~3 | Checks correct |
| V8.SubgroupCosets finite expansion | x=u_h, h∈Hg_j | prev. ~3 | retain |
| V8 group Checks | L(ℤ/2); Σ2^(−n)u_n; F₂ | prev. ~3 | Checks correct |
| V8.RegularL2 norm bound | G=ℤ, f=δ_{−1}+iδ₀+δ₁ | prev. ~3 | Check correct |
| V8.RegularL2 nondegeneracy | G=ℝ, h_ε, f=1_[0,1] | prev. ~3 | Check correct |
| V8.RegularL2 adjoint convention | affine group, g=(α,β) | prev. ~3 | Check correct |
| V8.LCHRegularNormalBridge weak⇒strong* | ultraweakly continuous orbit | prev. ~3 | retain |
| V8 crossed-product Checks | ℤ/2 flip on ℂ²; trivial action on ℂ; Pauli | prev. ~3 | Checks correct |
| `ergodicSMul_dense_subgroup` | Γ=ℚ⊂ℝ; Γ=ℤ⊂ℝ | prev. ~3 | retain, density needed |
| V8.Bernoulli stabiliser | finite support F; g of order 2 | prev. ~3 | retain |
| V9 covolume and formal degree | G=ℝ, Γ=ℤ, θℤ; PSL₂(ℝ), n | prev. ~3 | Checks correct |
| V10.ClosedOperators Checks | mult. by t; T=0; diag(λ_n) | prev. ~3 | Checks correct |
| V10.ClosedOperators spectra | Tf=f′ on L²[0,1] | prev. ~3 | retain |
| V10.Affiliation Check | T=t on L²(ℝ); derivative vs L∞ | prev. ~3 | Checks correct |
| V10.FiniteComplexPowers | h=diag(2/3,1/3); h=[[1/2,1/6],[1/6,1/2]]; h central | prev. ~3 | Checks correct; companion signature cannot take the second (R03) |
| V10.KMS strip convention | h=diag(2/3,1/3), x=e₁₂, y=e₂₁ | prev. ~3 | Checks correct |
| V10.Hecke | g=(m/n,b), H={(1,k)}; Schur test | prev. ~3 | retain |
| V10.AffineHecke state | n=2 | prev. ~3 | retain |
| V11 Checks | B(ℓ²), M₂ with h=diag(2/3,1/3), p=e₁₁; ℓ∞ weight | prev. ~3 | Checks correct |
| V11 core trace scaling | M=ℂ, u_t↦e^(itσ) | prev. ~3 | Check correct |
| V11.DoubleDualEmbedding | ε<1/3; injectivity; closed image | prev. ~3 | retain |
| V11 Bochner Check | G=ℝ, ξ=1_[0,1] | prev. ~3 | Check correct |
| V11 ℤ/𝕋 Check | K=𝕋, ε<2; K⊆ℤ finite | prev. ~3 | Check correct |
| V11.UnitizationCharacters | A=0; γ_φ bounded | prev. ~3 | retain |
| V11 invariants | B(H); R_λ; M₃ with ρ=diag(1,λ,μ)/(1+λ+μ) | prev. ~3 | Checks correct |
| V11 cocycle normalisation | φ=2ψ | prev. ~3 | retain |
| V12 two projections | p=e₁₁, q=½[[1,1],[1,1]] | prev. ~3 | retain |
| V12 R⊕ℂ regression | τ=(1/4)τ_R+(3/4)·, u_n at site n | prev. ~3 | retain |
| V12 ICC estimate Check | x=u_a∈L(F₂) | prev. ~3 | Check correct |
| V12.J.Frame dim 2 | f=1/2+sgn(n₃)/4 | prev. ~3 | retain |
| V12.J.Bloch | n=(1/√2,0,1/√2) | prev. ~3 | retain |
| V12.J.Maps transpose | x=e₁₂, y=e₂₁ | prev. ~3 | retain |
| 13.1 Checks | diagonal expectation; non-self-adjoint map; transpose; ρ=[[1/2,c],[c̄,1/2]] | prev. ~3 | Checks correct |
| 13.2 Q-stability | Definition 4.1, Haagerup 2016 | prev. ~3 | retain |
| 13.2 Powers–Størmer | h=diag(1,0), k=diag(1/4,0) | prev. ~3 | retain |
| 13.2 Checks | ℓ∞ truncations; B(ℓ²) via A_n; L(F₂) | prev. ~3 | Checks correct |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; 1⊗1; C(X); ℂ² on ℂ² and ℂ³ | prev. ~3 | Checks correct |
| V10.AffineAP | d=4,a₀=1; d=3 pair | prev. ~3 | retain |

20 new rows with computed values, 59 rows carried from the previous report; no statement changed.

## Not verifiable

- **Takesaki I, Theorem IV.4.9** (V13b.SpatialNorm) and **Takesaki II, Theorem IX.4.2** (the weight case of the expectation theorem, now cited by locator as the README says): paywalled, uncertified; checked on instances only (rows above).
- The remaining items of the previous report's list (Tomiyama 1957, Connes–Feldman–Weiss, Takesaki III, Runde, Arveson 1969, Haagerup 1985/1987, Wassermann, Bost–Connes, Goodman–de la Harpe–Jones, Araki–Woods, Connes–Takesaki, Høegh-Krohn–Landstad–Størmer, Gleason, Reed–Simon, Connes–Størmer, Connes–Woods, Haagerup 1979, Laca–Raeburn, Neshveyev, Sakai, Kadison–Ringrose, Conway, Rudin, Folland, Arveson's *Invitation*, Connes 1985) are untouched by the diff and were not re-fetched.

## Source issues

- none

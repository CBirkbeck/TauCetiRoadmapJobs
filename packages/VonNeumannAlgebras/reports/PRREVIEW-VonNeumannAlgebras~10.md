# Review of VonNeumannAlgebras (pull request #889 at 7b674dc)

**Verdict:** needs changes

:robot: AI review. This is an **incremental re-review of 9 changed lines since df71dfe**, not a new full review. The change set is two deletions in `TauCetiRoadmap/VonNeumannAlgebras/README.md`: the sentence at the old lines 41–44 asserting one-directional supply between V4.0.Fields and SelfAdjointSpectralTheory SA-B85–B86, and the clause at the old lines 4085–4087 asserting that CStarAlgebras C5 consumes V13b.SpatialNorm. No Lean file changed. Each previous finding was re-verified against this head, main at 4dffb5d and the supplied CStarAlgebras head 1d4e2ed.

## R01 (P1) — The spectral supplier cycle remains; only the sentence about it was deleted

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:34` “SA-B05–B13, SA-B26–B30, SA-B49–B57, SA-B85–B86”; `:755` “*Needs:* SelfAdjointSpectralTheory SA-B05, SA-B49, SA-B52–B53 and SA-B85–B86”; `:849`; `:4076–4077` “SA-B85 consumes V4.0.Fields' measurable fields and change-of-measure unitaries.”

**Claim:** This head deletes the claim that the supply “runs in one direction at the level of targets” but keeps both edges. VonNeumannAlgebras consumes SA-B85–B86 (V2.AbelianClassification `:712–755`, V4.0.Decomposition `:799–819`, Layer 2 dependencies `:849`), and SelfAdjointSpectralTheory on main consumes V4.0.Fields. Two roadmaps citing each other is a cycle whatever the order of targets inside each folder; the single direction of supply is a principle, so this blocks.

**Witness:** Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:255`, `:690`, `:1371` and `:1391` consume VonNeumannAlgebras V4.0.Fields; this README `:755` and `:849` consume SA-B85–B86. Edge count VNA→SA: 3 cited target groups; SA→VNA: 1. Cycle length 2. The dependency check reports 0 problems because it reads only this README's Needs lines against the order, not main's reverse edge.

**Repair:** Break the cycle by moving ownership, as in review 9: either (a) split the field foundations (V4.0.Fields and the elementary V2 carriers that precede it, `:263–265`) into a foundations roadmap that precedes OperatorTheory, with the SA-B85–B86 consumers (V2.AbelianClassification, V2.AbelianRepresentationMultiplicity, V4.0.Decomposition and their dependants) staying here, after OperatorTheory; or (b) state the cyclic multiplication model, scalar control and essential-symbol comparison of SA-B85–B86 here as targets and stop citing SA-B85–B86 (then SelfAdjointSpectralTheory's reverse edge is the only edge and the order is OperatorTheory after this roadmap). Under either repair the one-point change-of-measure test is unchanged: on a one-point space with μ′=2μ the unitary f↦f/√2 gives 2·|f/√2|²=|f|². Re-stated from review 9 R01, still present.

## R02 (P1) — V8.RegularL2, V11.UnitizationCharacters and V11.FourierUniqueness still duplicate BanachAlgebras A3/A7 on main

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:63–65` “a locally compact group is owned here (V8.RegularL2); the unitization/character-space comparison and the Fourier uniqueness theorem on `L¹` that V11 needs are owned in V11”; targets at `:1853`, `:3059`, `:3077`.

**Claim:** Unchanged since review 9. Main BanachAlgebras plans the same three general constructions, and its A7 explicitly says its uniqueness theorem precedes V11's inversion and Plancherel. What another roadmap plans is imported by name and section, never planned again.

**Witness:** Main `TauCetiRoadmap/BanachAlgebras/README.md:935` A7.RegularL2 constructs `λ_xξ(y)=ξ(x⁻¹y)` with unitarity, strong continuity and the integrated involution law; `:433–436` compares the character space of a commutative nonunital C*-algebra with that of `Unitization ℂ A`; `:997–1022` proves L¹ Fourier uniqueness and says at `:1020–1022` that this single A7 theorem precedes V11's inversion, Plancherel and double-dual surjectivity, consuming only V11's closed-embedding stage. This README `:3077` says “Own the uniqueness theorem that inversion uses.”

**Repair:** Delete the three general targets and cite BanachAlgebras A7.RegularL2, A3's unitization comparison and A7's uniqueness theorem by section in the supplier contracts and in the Needs lines of V8.LCHRegularNormalBridge (`:1917`), the unnamed inversion/Plancherel paragraph (`:3107–3118`) and the dependency lists at `:2055` and `:3257`. Keep V11.DoubleDualEmbedding, which A7 consumes, strictly before anything that consumes A7 (so the edge pair VNA.V11.DoubleDualEmbedding → BanachAlgebras A7 → VNA.V11 inversion is split across two roadmaps in one direction: the inversion consumers move to a Part II, or BanachAlgebras A7's closed-embedding input is restated as an A7-internal target). Controls after the repair: on ℤ both regular actions give λ₁δ₀=δ₁; for A=0 both unitized spectra are the singleton augmentation; on the trivial group both uniqueness statements say f=0 a.e. iff f̂(1)=∫f=0. Re-stated from review 9 R02.

## R03 (P2) — The spatial C*-norm and slice maps still have two owners in open pull requests

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:66–67` “the spatial C*-norm on the algebraic tensor product of two concrete C*-algebras is owned in V13b.SpatialNorm”; `:3618–3648`; the changed line `:4082–4083` “CStarAlgebras consumes V0–V4 and V12.J; its C3–C4 consume V13a; its C6–C9 consume the semidiscreteness theorems of V13b.”

**Claim:** The deletion removes the assertion that contradicted the CStarAlgebras head; it does not remove the duplication. Both open roadmaps construct the spatial norm, its representation independence, inclusion functoriality and slice maps, and the CStarAlgebras head says the supply runs the other way. Two open pull requests each building one object is the two-owner defect; since this roadmap is earlier in the merge order (line 4 of the order, CStarAlgebras unlisted and placed after it), ownership can only sit here, and the two READMEs must say the same thing.

**Witness:** Supplied `TauCetiRoadmap/CStarAlgebras/README.md:47` (head 1d4e2ed) “V13b owns injectivity versus semidiscreteness and consumes C5's minimal tensor construction”; `:548–556` constructs the minimal completion, representation independence and inclusion injectivity; `:565` constructs slice maps. This README `:3618–3648` constructs the same objects with Takesaki I IV.4.9 as locator. For `A=B=ℂ`, `ψ=id`, both give `R_ψ(z⊗w)=zw` with `‖R_ψ‖=1`: one construction, two owners.

**Repair:** Make the two roadmaps agree, in the only direction the order allows: CStarAlgebras C5 imports V13b.SpatialNorm (spatial norm, representation independence, inclusion functoriality, positive-functional slice maps) and keeps the maximal norm, the norm comparison, `C₀(X)⊗_min A≅C₀(X,A)` and the operator-space tensors; its line 47 then reads that C5 consumes V13b.SpatialNorm. This README's downstream list may then state that consumption again (the sentence deleted at this head was right in content and wrong only against the sibling's text). Until the sibling is amended, this folder cannot be the single owner it claims to be. Re-stated from review 9 R03, partly repaired.

## R04 (P3) — The two companion Lean files are unchanged and still violate the Lean form rules

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1–2` (`import Mathlib.Analysis.SpecialFunctions.Pow.Complex`, `import Mathlib.LinearAlgebra.Matrix.ConjTranspose`); `TauCetiRoadmap/VonNeumannAlgebras/ProjectionClosureTargets.lean:1–3`, `:34`, `:41`.

**Claim:** Byte-unchanged since review 8. Both files import Mathlib submodules instead of `import Mathlib`, carry the old “suggested forms” docstring, and ProjectionClosureTargets restates the Suggested headline and adds a boundary-case theorem; FiniteComplexModularTargets states a diagonal convention model rather than a headline.

**Witness:** `ProjectionClosureTargets.lean:34–37` has the same statement as `Suggested.lean:102–105` (closure of `IsStarProjection` in the WOT copy equals `0 ≤ A ≤ 1` under `¬ FiniteDimensional ℂ H`), so one `exact` closes it from the headline; `:41–43` at H=ℂ says only that {0,1} is closed, excluding the contraction 1/2. The gate's import scanner covers only `Suggested.lean`'s module.

**Repair:** Delete both companion files. The general WOT headline stays in `Suggested.lean`; the finite-block, boundary and diagonal modular examples stay in the README as targets and Checks. Re-stated from review 9 R04.

## R05 (P3) — The retained downstream clause overstates which CStarAlgebras sections consume V13b

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:4082–4083` “its C6–C9 consume the semidiscreteness theorems of V13b.”

**Claim:** At the supplied head only C6 cites V13b; C7 (weak expectation), C8 (quasidiagonality) and C9 (local reflexivity) do not cite V13b or any semidiscreteness theorem of this roadmap.

**Witness:** Supplied `TauCetiRoadmap/CStarAlgebras/README.md`: V13b is cited at `:47`, `:655`, `:661` and `:694`, all inside C6 (`:637–729`); the sections C7–C9 (`:730–900`) contain 0 citations of V13b or VonNeumannAlgebras. The clause “its C3–C4 consume V13a” is accurate (`:467` in C3, `:499` in C4).

**Repair:** Write “its C6 consumes the semidiscreteness theorems of V13b”, or name the C7–C9 targets that do once CStarAlgebras cites them. A downstream line is informational, so P3.

## Previous findings

- R01 — not repaired: README:34, :755, :849 still consume SA-B85–B86 and :4076–4077 still records SA-B85 consuming V4.0.Fields; the deleted sentence was the description of the cycle, not an edge. See R01.
- R02 — not repaired: README:63–65 still assigns V8.RegularL2, V11.UnitizationCharacters and V11.FourierUniqueness here; targets :1853, :3059, :3077 unchanged; main BanachAlgebras :433, :935, :997–1022 unchanged at 4dffb5d. See R02.
- R03 — partly repaired: the clause “its C5 consumes V13b.SpatialNorm's spatial norm …” is deleted at :4082, so this README no longer contradicts the CStarAlgebras head; but :3618–3648 and CStarAlgebras :548–565 still both build the object and CStarAlgebras :47 still points the supply the other way. See R03.
- R04 — not repaired: both companion files are byte-identical to df71dfe (the diff touches only README.md); submodule imports at FiniteComplexModularTargets:1–2 and ProjectionClosureTargets:1–3, duplicate headline at ProjectionClosureTargets:34. See R04.

No repair report marking a finding “not actionable in this package” exists among this package's reports (GATE~1–4, PRREVIEW~1–6, ~8, ~9); nothing is settled on that ground.

## Verified sound

**Gate.** The worker's gate at this head passes every check including the build. Re-run independently from the pull-request worktree:

```text
gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check with `--movable`:

```text
depcheck: 207 roadmaps, 1463 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The cycle of R01 is invisible to it because its reverse edge lives in main's SelfAdjointSpectralTheory README, not in this README's Needs lines. The diff outside the folder is empty (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` prints nothing). VonNeumannAlgebras is line 4 of the merge order, after KacMoody and LefschetzPencilsAndVanishingCyclesPartII; CStarAlgebras and BanachAlgebras are not listed (CStarAlgebras is placed after this roadmap as a consumer; BanachAlgebras and OperatorTheory are on main).

**Elaboration.** `lake env lean` on `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` (unchanged since df71dfe) exits 0 with exactly 11 `declaration uses 'sorry'` warnings and no other diagnostic. A scratch copy with `#check @name` for all 19 declarations elaborates (exit 0); the 19 elaborated types agree token for token (universe names aside) with the worker's signature report, and each theorem keeps its `CompleteSpace`, `InnerProductSpace ℂ`, `NonUnitalCStarAlgebra`, `IsTopologicalGroup` and `¬ FiniteDimensional` binders. No signature changed, so no README/Lean generality comparison changed from review 9. Mathlib pin 6b7abb3c, Tau Ceti pin a91d3aaf (from `lake-manifest.json`), as in review 9.

**Headlines and padding.** The 11 sorried theorems are the ones review 9 listed; nothing was added or removed, so the one-tactic probes of reviews 8 and 9 (including the successful `exact` probe showing ProjectionClosureTargets:34 is a duplicate of the headline) stand. No Lean statement is touched by the diff.

**Cross-roadmap citations resolved at this round.** Main at 4dffb5d: `OperatorTheory/SelfAdjointSpectralTheory/README.md:255`, `:690`, `:705`, `:779`, `:1371`, `:1391` (consume V4.0.Fields), `:1406` (downstream V4.0.Decomposition); `BanachAlgebras/README.md:433–436`, `:935–938`, `:997–1022`. CStarAlgebras head 1d4e2ed: `:41–49`, `:467`, `:499`, `:546–570`, `:637`, `:655`, `:661`, `:694`, `:730–900`. The retained clause “C3–C4 consume V13a” is correct at that head. Pull request #1041 (the earlier VonNeumannAlgebras proposal by the same author) declares its Lean names in namespace `VonNeumannAlgebra`, not `TauCetiRoadmap.VonNeumannAlgebras`, so no fully qualified name collides with `Suggested.lean`; the folder overlap itself was recorded in earlier rounds and is a board matter.

**Seeded sample (§13.1, §13.2).** Neither section's text changed; the diff touches them only through the downstream line (R03, R05). Re-opened: hiai line 2666 (arXiv:2004.02383v1, page marker at line 2654 = p. 55), Theorem 6.5 for a C*-algebra and a C*-subalgebra, a norm-one projection has properties (ii) and (v) of Theorem 6.4; its displayed proof treats a von Neumann inclusion, as review 9 recorded. The README `:3580` cites “Hiai, Theorem 6.5, pp. 55–56”, which matches. The remaining §13.1/§13.2 source checks (Tomiyama 1957, Peterson 6.2.1, Takesaki I IV.4.9 uncertified) are carried from reviews 8 and 9 and not re-read.

**Computed adversarial pass.** Fresh rows for the two changed passages, then the 152 rows of review 9 carried with their values.

[prior]: packages/VonNeumannAlgebras/reports/PRREVIEW-VonNeumannAlgebras~9.md

| Statement | Instances | Values on each side / negative control | Result and change |
| --- | --- | --- | --- |
| Scope :38–41 (deleted one-direction sentence): is the Fields ↔ SA-B85–B86 supply acyclic between roadmaps? | edges VNA→SA at :34/:755/:849; SA→VNA at main SA :255/:690/:1371/:1391 | VNA→SA: 3 cited groups (SA-B05, B49, B52–B53, B85–B86); SA→VNA: 1 (V4.0.Fields); roadmap-level cycle length 2; depcheck problems 0 (reads only this README) | Deleting the sentence leaves both edges; R01 |
| V4.0.Fields change-of-measure unitary (object both sides of the cycle use) | one-point space, μ′=2μ, f∈ℂ | U f=f/√2; ‖Uf‖²_{μ′}=2·\|f\|²/2=\|f\|²=‖f‖²_μ; with μ′=0 the target space is 0 and U=0 | Unitary for μ′≪μ with positive density; ownership move does not change it |
| Downstream :4082 (deleted C5 clause): single owner of the spatial norm and slice maps? | A=B=ℂ, ψ=id; A=0, B=ℂ | VNA :3634 and CStarAlgebras :565 both give R_ψ(z⊗w)=zw, ‖R_ψ‖=1; for A=0 both give norm 0 vs ‖ψ‖=1 | Same object in two open roadmaps; CStarAlgebras :47 points supply upward; R03 |
| Downstream :4082 retained clause “C3–C4 consume V13a; C6–C9 consume V13b” | citation counts at CStarAlgebras head 1d4e2ed | V13a: C3 :467 =1, C4 :499 =1; V13b: C6 :655/:661/:694 =3, C7 =0, C8 =0, C9 =0 | C3–C4 correct; C6–C9 overstates (only C6); R05 |

**Rows of review 9 carried (23 fresh rows of review 9, then its 129 carried rows; 152 in all, none touched by this diff).**

| Statement | Instances | Values on each side / negative control | Result and change |
| --- | --- | --- | --- |
| V0 state separation and GNS locator | ℂ² with coordinate states; M₂ with τ=Tr/2 | δ₁(1,0)=1, δ₂(1,0)=0; τ(e₁₁)=1/2; GNS dimension 4, cyclic span M₂·I=M₂ | Locator supports separation; unital GNS case explicit Carried from [review 9][prior]. |
| V0 nonunital essential-subspace reduction | c₀ acting diagonally on ℓ²⊕ℂ, by zero on last summand | closure(c₀H)=ℓ²⊕0; finite-support approximate units converge to I there and to 0 on the discarded summand | Nondegenerate after restriction, not before Carried from [review 9][prior]. |
| V0.SeparableFaithful ℓ² refinement | A=ℂ; A=0; c₀ with weights 2^(-n-1) | Σ weights=1; ψ(eₙ)=2^(-n-1)>0; scalar action on ℓ² has full orbit span; zero action has span 0≠ℓ² | Nontrivial hypothesis retained; countable amplification handles finite nonzero GNS Carried from [review 9][prior]. |
| V2 amended spectral dependencies | a=diag(0,1), f=1_{1}, ξ=e₂ | f(a)=e₂₂, ‖f(a)ξ‖²=1=∫\|f\|²dδ₁; Φ(f)=e₂₂ with norm 1 | B05/B49/B52/B85–B86 dependencies match; ownership cycle R01 remains Carried from [review 9][prior]. |
| V2 abelian representation multiplicity | ℂ² on ℂ² versus on ℂ³, first coordinate doubled | same null sets; multiplicities (1,1) versus (2,1), representation dimensions 2≠3 | Both constructions still need multiplicity, not just measure class Carried from [review 9][prior]. |
| V5 finite-dimensional unital embedding | 0, ℂ, ℂ⊕M₂ into R | zero source gives f(1)=0≠1_R; scalar source gives 1_R; block support traces 1/2+1/2=1, matrix atoms 1/4+1/4=1/2 | Repaired nonzero hypothesis and negative control Carried from [review 9][prior]. |
| V5 borrowed matrix-unit construction | q₁,q₂ orthogonal of trace 1/4, uᵢ*uᵢ=qᵢ and uᵢuᵢ*=q₁ | eᵢⱼ=uᵢ*uⱼ gives e₁₂e₂₁=q₁, e₂₁e₁₂=q₂, e₁₁e₂₂=0 | Construction uses equivalence, not minimality Carried from [review 9][prior]. |
| V8 small-radius convolution | ε=1/4 and 1/2 | four ramp integrals ε/12 sum to ε/3; values 1/12 and 1/6 respectively | Correct including endpoint ε=1/2 Carried from [review 9][prior]. |
| V8 excluded convolution radius | ε=1 | central error²=1/4; two tails 1/12 each; total 5/12≠1/3 | Added negative control correct Carried from [review 9][prior]. |
| Dense translations: hypotheses and Haar restriction | ℚ⊂ℝ; ℤ⊂ℝ; trivial group | ℚ-invariant events have indicator c∈{0,1}; restriction is 0μ or 1μ; ℤ-invariant periodic half-interval event has mass 1/2 per unit interval and is neither null nor conull; trivial group has only ∅ and G | Density essential; infinite total mass allowed Carried from [review 9][prior]. |
| L¹/L∞ pairing convention | ℝ, g=1, φ=1_[0,1], f=1_[−1,0] | ∫φ(x)f(x−1)dx=1; ∫φ(1+y)f(y)dy=1; using f(x+1) gives 0 | Correct inverse in α_g and direction of variable substitution Carried from [review 9][prior]. |
| Bernoulli labelled support and ergodicity | fair two-point base on ℤ; weights (3/4,1/4) | k prescribed fair coordinates have mass 2^(-k); N disjoint equal-label pairs have mass (1/2)^N or (5/8)^N→0; a nonzero constant orbit coefficient c has sum Σ\|c\|²=∞ | Finite-label generalization works; one-point base would give equality probability 1 Carried from [review 9][prior]. |
| V9 Haar scaling and coupling | weight n=2, c=2; n=4, c=3 | n=2: (1/(8π))(2π/3)=1/12; n=4: ((3/(4π))/3)(3π/3)=1/4=(n−1)/12 | Both separate factors and product now correct Carried from [review 9][prior]. |
| Native CP carrier used by tomiyama | identity on M₂; transpose on M₂; matrix level 0 | id amplification preserves each positive matrix; transpose sends rank-one Choi matrix to flip with eigenvalues 1,1,1,−1; level 0 has only zero | Native carrier excludes positive-but-not-CP transpose without a stand-in Carried from [review 9][prior]. |
| Tomiyama projection hypotheses and closed range | diagonal expectation E on M₂; transpose T; zero map | E²=E, ker(I−E)=diagonal matrices, ‖E‖=1; T(e₁₂)=e₂₁≠e₁₂ despite range M₂; ‖0‖=0 | Range/fixing hypotheses determine projection; zero excluded Carried from [review 9][prior]. |
| Tomiyama bimodularity Check | a=diag(2,3), b=diag(5,7), x=[[1,2],[3,4]] | axb=[[10,28],[45,84]]; E(axb)=diag(10,84)=aE(x)b | Correct computed convention witness Carried from [review 9][prior]. |
| Tomiyama positivity and all matrix levels | E diagonal expectation, x=[[1,1],[1,1]] | x eigenvalues 0,2; E(x)=I with eigenvalues 1,1; E^(k)(X)=Σⱼ (I_k⊗eⱼⱼ)X(I_k⊗eⱼⱼ)≥0 | Positive compression formula proves the Check at every level Carried from [review 9][prior]. |
| Tomiyama nonunital subalgebra | P(x)=e₁₁xe₁₁ on M₂; a=2e₁₁,b=5e₁₁, above x | P(1)=e₁₁≠I, P²=P, ‖P‖=1; P(axb)=10e₁₁=aP(x)b | Correctly includes corners without ambient unit preservation Carried from [review 9][prior]. |
| Tomiyama nonunital algebra and zero boundary | id on c₀; zero algebra | id(eₙ)=eₙ, ‖id‖=1; every amplified identity fixes X≥0; on 0 the only map has norm 0 | General signature includes c₀ and excludes impossible norm-one zero case Carried from [review 9][prior]. |
| Right slice, positive functional | (A,B,ψ)=(0,ℂ,id),(ℂ,ℂ,id),(ℂ,ℂ,2id) | map norms 0,1,2; functional norms 1,1,2; inequalities 0≤1,1≤1,2≤2 | Equality qualified by A≠0 Carried from [review 9][prior]. |
| Left slice, positive functional | (A,B,φ)=(ℂ,0,id),(ℂ,ℂ,id); φ=0 | map norms 0,1,0 versus functional norms 1,1,0 | Equality qualified by B≠0; zero functional valid Carried from [review 9][prior]. |
| Slice GNS vector functional and general extension | ψ=2idℂ; ψ=i·idℂ | ψ(b)=⟨√2,b√2⟩=2b, vector norm²=2; i·id is a linear combination of positive maps and its slice sends a⊗b to iab with norm 1 | “Vector functional” correctly replaces “vector state”; arbitrary extension is bounded Carried from [review 9][prior]. |
| Shared spatial tensor ownership | ℂ⊗minℂ, ψ=id | both C5 and V13b prescribe z⊗w↦zw and Rψ(z⊗w)=zw; both map norms 1 | Same construction, not two variants; R03 Carried from [review 9][prior]. |
| V0 norm-one state definition | ℂ, M₂, zero algebra | idℂ(1)=‖idℂ‖=1; Tr(I₂)=‖Tr‖=2; on 0 every functional has norm 0 | Retain; zero has no state  Carried from [review 9][prior]. |
| V0 state positivity and convex structure | ℂ²; x=[[1,−1],[−1,1]] | weights (t,1−t) have mass 1 for 0≤t≤1; x≥0 but x₁₂=−1 | Retain; boundedness alone is insufficient  Carried from [review 9][prior]. |
| V0 compactness restriction | c₀ point evaluations δₙ | ‖δₙ‖=1, δₙ(x)→0 for each x, ‖0‖=0 | Retain nonunital negative control  Carried from [review 9][prior]. |
| V0 finite amplification cyclicity | B(ℂ²) on ℂ²⊕ℂ² | vector (e₁,e₂) has arbitrary image (Te₁,Te₂); (e₁,e₁) always has equal image coordinates | Retain independent-coordinate criterion  Carried from [review 9][prior]. |
| V1 WOT versus SOT | unilateral shift S on ℓ² | ⟨eᵢ,Sⁿeⱼ⟩→0 but ‖Sⁿe₀‖=1; Cesàro averages have squared norm 1/N | Retain convexity in closure comparison  Carried from [review 9][prior]. |
| V1 continuous duals | φ(T)=Σₙ≥1 n⁻²⟨eₙ,Teₙ⟩ | φ(I)=π²/6; φ(eₙₙ)=1/n² at infinitely many n, unlike finite-rank coefficient functionals | Retain distinction between ordinary and ultra topologies  Carried from [review 9][prior]. |
| V1 bicommutant headline | scalar algebra on ℂ²; M₂; H=0 | (ℂI)′=M₂, (ℂI)″=ℂI; M₂″=M₂; zero case both sides singleton and closed | Retain both directions  Carried from [review 9][prior]. |
| V1 generated star algebra | generator e₁₂ in M₂ | adjoint gives e₂₁; products give e₁₁,e₂₂; generated algebra=M₂ | Retain star closure  Carried from [review 9][prior]. |
| V1 Kaplansky headline | finite-rank operators plus scalars on ℓ² | PₙTPₙ→T strongly, ‖PₙTPₙ‖≤‖T‖; scalar unit balls are already closed | Retain ball bound and strong topology  Carried from [review 9][prior]. |
| V1 projection closure / finite coefficient matching | compression C=1/2 to one coordinate | P=[[1/2,1/2],[1/2,1/2]] has P²=P and compression 1/2; (1/2)²=1/4≠1/2 | Retain infinite-dimensional extension requirement  Carried from [review 9][prior]. |
| Companion finite-dimensional projection closure | H=ℂ; H=0 | projection sets {0,1} and {0}; 1/2 is a positive contraction outside first set | True boundary case, delete from acceptance file (review 8 R07; this report R04)  Carried from [review 9][prior]. |
| V2 corner and support | p=e₁₁, x=diag(0,2) | pM₂p=ℂp with identity p; support(x)=e₂₂; support(0)=0 | Retain corner unit and zero conventions  Carried from [review 9][prior]. |
| V2 polar membership adapter | x=2e₂₁ | x*x=4e₁₁, modulus=2e₁₁, v=e₂₁, v·modulus=2e₂₁ | Retain algebra-membership adapter; import generic polar theorem  Carried from [review 9][prior]. |
| V2 Borel membership adapter | x=diag(0,2), indicator of {2} | f(x)=e₂₂ in W*(x); constant 1 gives I | Retain membership, import functional calculus  Carried from [review 9][prior]. |
| V2 projection joins | p=e₁₁, q=(1/2)[[1,1],[1,1]] | p∧q=0, p∨q=I; pq≠qp | Retain noncommuting lattice test  Carried from [review 9][prior]. |
| V2 completed Hilbert tensor | ℂ²⊗ℂ³; zero factor | dimension 6, ‖e₁⊗e₂‖=1·1=1; 0⊗K=0 | Retain genuine completion target  Carried from [review 9][prior]. |
| V2.RectangularL2 product and cross norm | counting two points × Lebesgue [0,1]; empty rectangle | rectangle mass 2·1=2 and indicator norm²=2; empty mass 0 even against infinite measure | Retain extended product convention  Carried from [review 9][prior]. |
| V2 rectangular non-σ-finite case | infinite counting space, finite singleton rectangle | κ({s}×[0,1])=1; elementary indicator norm²=1 | Retain named native product construction; no unlicensed Fubini inference  Carried from [review 9][prior]. |
| V2 reference-vector infinite tensor | ξₙ=e₁; ηₙ=−e₁ | raw finite-prefix overlaps (−1)ᴺ do not converge; phase-corrected overlaps all 1 | Retain phase-sensitive distinction  Carried from [review 9][prior]. |
| V2 abelian single generator | ℂ², a=diag(0,1) | spectral projections 1−a=e₁₁, a=e₂₂, generated algebra ℂ² | Retain self-adjoint generator example  Carried from [review 9][prior]. |
| V2 given-measure MASA | two atoms of positive mass | multiplication operators are diagonal; commutant also diagonal; off-diagonal e₁₂ fails to commute with e₁₁ | Retain  Carried from [review 9][prior]. |
| V2.AbelianLocalizable | ℓ∞(I), I uncountable | orthogonal nonzero atoms indexed by I; a finite positive sum has only countably many positive masses | Retain no universal faithful-normal-state assertion  Carried from [review 9][prior]. |
| V2.NonmodularProjectionLattice | D(x)ₙ=xₙ/(n+1), yₙ=1/(n+1) | D⁻¹y=(1,1,…)∉ℓ²; B∧C=0, A∨B=H; A∨(B∧C)=A≠C=(A∨B)∧C | Retain explicit failure of modularity  Carried from [review 9][prior]. |
| V3 matrix units and minimality | M₂; M₂⊕ℂ | e₁₂e₂₁=e₁₁; e₁₁ corner is ℂ; centers have dimensions 1 and 2 | Retain type-I blocks rather than factorizing a direct sum  Carried from [review 9][prior]. |
| V3 inclusion multiplicities | multiplicity matrix [[2,1],[1,1]] on dimensions (1,2) | target dimensions (4,3); dimension sums are 2·1+1·2=4 and 1·1+1·2=3 | Retain orientation of multiplicities  Carried from [review 9][prior]. |
| V3 algebraic subgroup basis | H=C₂ in S₃ | three cosets, group-algebra left rank 3; complex dimensions 2·3=6 | Retain finite-index algebraic statement  Carried from [review 9][prior]. |
| V4.Core trace duality | trace-class h=diag(n⁻²) | Tr(h)=‖h‖₁=π²/6 and φ_h(I)=π²/6; rank-one e₁₁ gives 1 | Retain canonical trace/duality extension of supplied ideals  Carried from [review 9][prior]. |
| V4.PositivePredual base norm | functional with density diag(1,−1) | positive/negative masses 1 and 1; norm=2, while value at I=0 | Retain base norm rather than absolute value at identity  Carried from [review 9][prior]. |
| V4.Normality | increasing rank-n projections in B(ℓ²) | Pₙ↑I, vector-state values eventually 1 for each basis vector; singular state killing compacts gives 0 on each Pₙ but 1 on I | Retain nets/normality distinction  Carried from [review 9][prior]. |
| IsCyclic definition | M₂ on ℂ², ξ=e₁ and ξ=0 | M₂e₁=ℂ²; M₂0={0} | Retain nonzero and zero-vector controls  Carried from [review 9][prior]. |
| IsSeparating definition | ℂI on ℂ², ξ=e₁; M₂, ξ=e₁ | cIe₁=0 forces c=0; e₂₂e₁=0 although e₂₂≠0 | Retain  Carried from [review 9][prior]. |
| Cyclic/separating commutant headline | M₂ and ℂI on ℂ²; H=0 | M₂e₁ cyclic=true and e₁ separating for ℂI=true; for ℂI cyclic=false and separating for M₂=false; zero case both true | Retain both implications and degenerate case  Carried from [review 9][prior]. |
| V4 faithful state versus extension | vector e₁ for ℂI⊂M₂ | φ(cI)=c is faithful on ℂI; extension has φ(e₂₂)=0 with e₂₂≠0 | Retain representation/support qualifications  Carried from [review 9][prior]. |
| V4.0.Fields measure-change unitary | one point, μ mass 1 and ν mass 2 | U(f)=f/√2, ‖Uf‖²_ν=2·\|f/√2\|²=\|f\|²=‖f‖²_μ | Retain square-root direction; ownership cycle R01  Carried from [review 9][prior]. |
| V4.0.Decomposition | M₂⊕ℂ | two central support projections (I₂,0),(0,1); fibres M₂ and ℂ | Retain measurable-fibre target; not a second owner of SA-B85  Carried from [review 9][prior]. |
| ProjectionEquivalent definition | p=e₁₁,q=e₂₂,v=e₂₁ | v*v=p, vv*=q; v*=e₁₂ reverses orientation | Retain initial-to-final convention  Carried from [review 9][prior]. |
| ProjectionSubequivalent definition | p=e₁₁,q=I₂ | v=e₁₁ gives v*v=p and vv*≤q; reverse impossible since ranks 2≤1 fails | Retain order direction  Carried from [review 9][prior]. |
| Projection Schröder–Bernstein headline | p=e₁₁,q=e₂₂ | both subequivalences true, equivalence true, p=q false | Retain equivalence, not equality  Carried from [review 9][prior]. |
| IsFactor definition | M₂, ℂ², zero algebra | centers ℂI, ℂ², {0}; factor predicate true,false,false because zero identity excluded | Retain explicit nonzero field  Carried from [review 9][prior]. |
| IsFinite definition | M₂; unilateral shift S in B(ℓ²) | finite matrices v*v=I imply vv*=I; S*S=I, SS*=I−e₀₀ | Retain finite/infinite distinction  Carried from [review 9][prior]. |
| IsTypeIIOne definition | R, M₂, zero | every nonzero R projection splits; e₁₁ in M₂ has no nonzero proper subprojection; zero fails factor condition | Retain exclusion of type I and zero  Carried from [review 9][prior]. |
| IsTracialState definition | tr/2 and x↦x₁₁ on M₂ | tr/2(e₁₂e₂₁)=tr/2(e₂₁e₁₂)=1/2; vector state gives 1 and 0 | Retain trace axiom independently of positivity  Carried from [review 9][prior]. |
| V5 Dixmier averaging | x=e₁₁ in M₂ | (x+uxu*)/2=I₂/2 for coordinate swap u; tr/2(x)=1/2 | Retain normalization  Carried from [review 9][prior]. |
| Trace uniqueness headline | M₂ versus ℂ² | matrix trace weights forced (1/2,1/2); on ℂ² weights (t,1−t) vary | Retain factor hypothesis  Carried from [review 9][prior]. |
| Faithful trace existence headline | R, dyadic projection p | τ(1)=1, τ(p)=1/2, τ(p*p)=1/2>0; zero functional has τ(1)=0 | Retain positive faithful normalization  Carried from [review 9][prior]. |
| Algebraic simplicity headline | R, nonzero dyadic p with trace 1/4 | four equivalent orthogonal translates of p sum to 1; any ideal containing p contains 1 | Retain algebraic rather than closed-ideal endpoint  Carried from [review 9][prior]. |
| V5.LatticeFinite | M₂; B(ℓ²) graph construction | finite-dimensional modular dimension identity holds; graph row gives A≠C | Retain full finite/infinite criterion  Carried from [review 9][prior]. |
| V6 semifinite trace | B(ℓ²); rank-n p | Tr(p)=n, Tr(I)=∞; τ on R has τ(I)=1 | Retain finite versus semifinite normalization  Carried from [review 9][prior]. |
| V6 product trace and II∞ comparison | R⊗B(ℓ²), p trace 1/2 in R | (τ⊗Tr)(p⊗e₁₁)=1/2; (τ⊗Tr)(I)=∞ | Retain extended values  Carried from [review 9][prior]. |
| V6 tracial standard form | L²(M₂,tr/2), Jx=x* | J²x=x and JL_aJ=R_a*; J fixes positive matrices | Retain conjugate-linear direction  Carried from [review 9][prior]. |
| V6.FullCornerType | M₂,e₁₁; type-III nonzero full p | e₁₁M₂e₁₁=ℂ finite; in type III no nonzero finite subprojection survives in the corner | Retain nonzero full-support condition  Carried from [review 9][prior]. |
| V6.LatticeTypes | M₂; diffuse R; ℂ² | rank-one atoms in M₂; none in R; all projections central in ℂ² | Retain separation of atomicity, centrality and finiteness  Carried from [review 9][prior]. |
| V7.StandardAmplifications | standard M₂ module and column module ℂ² | L²(M₂) has ordinary dimension 4; column module 2, represented by a commutant projection of normalized trace 1/2 | Retain normalized module dimension  Carried from [review 9][prior]. |
| V7.AmplificationTrace | 0, two copies, infinitely many copies of L²(R) | commutant unit traces 0,2,∞ | Retain sum over arbitrary index sets  Carried from [review 9][prior]. |
| V7.Dimension | same column module embedded using e₁₁ or e₂₂ in M₂ commutant | both trace values 1/2; equivalent projections, different operators | Retain embedding independence  Carried from [review 9][prior]. |
| V7.SumsAndCorners | two column M₂ modules; p in R with τ(p)=1/2 | dimensions 1/2+1/2=1; corner trace renormalization divides by 1/2 and thus multiplies by 2 | Retain direction of scaling  Carried from [review 9][prior]. |
| V7.CountableAndTypeI | nonzero separable versus uncountable amplification | countable infinite and uncountable units both have scalar trace ∞, but Hilbert dimensions differ | Retain warning that ∞ alone does not classify nonseparable modules  Carried from [review 9][prior]. |
| V7.Index | N⊂N⊗M₂ with product trace; N=N | indices 4 and 1, since L²(M₂) has dimension 4 | Retain unrestricted inclusion endpoint  Carried from [review 9][prior]. |
| V7.GroupApplications / V8.SubgroupCosets | C₂⊂S₃; {1}⊂ℤ | three cosets give dimension 3; ℤ gives ∞; Σ₂⁻ⁿuₙ has infinitely many coefficients and L² norm² 1/3 | Retain completed rather than algebraically finite expansion at infinite index  Carried from [review 9][prior]. |
| V8 group-algebra factor criterion | C₂, S₃, F₂ | L(C₂)=ℂ²; center L(S₃) has dimension 3; nonidentity F₂ conjugacy classes infinite | Retain ICC qualification and nonabelian controls  Carried from [review 9][prior]. |
| V8 nonsingular action convention | two-point flip | α_g(e₁₁)=e₂₂ and α_g²=id; scalar fixed space is one-dimensional | Retain inverse in pullback action  Carried from [review 9][prior]. |
| V8.RegularL2 bound and faithfulness | G=ℤ, f=δ₋₁+iδ₀+δ₁ | multiplier 2cosθ+i has norm √5; ‖f‖₁=3; λ(δ₁)δ₀=δ₁ | Mathematically consistent, duplicate owner R02  Carried from [review 9][prior]. |
| V8 strong versus norm continuity | translations on L²(ℝ) | for s≠0, operator norm distance from identity=2; orbit norm of 1_[0,1] tends to 0 | Retain strong continuity  Carried from [review 9][prior]. |
| V8 modular character | affine group, right multiplier (2,0) | pullback integral factor c=2; inversion multiplier at (2,0)=2, not 1/2 | Retain inversion/adjoint convention  Carried from [review 9][prior]. |
| V8.LCHRegularNormalBridge covariance | finite group flip acting on ℂ² | λ_gπ(e₁₁)λ_g*=π(e₂₂)=π(α_g(e₁₁)); group element squared gives identity | Retain regular covariance  Carried from [review 9][prior]. |
| V8 regular versus universal property | M=ℂ,G=ℤ | point character on C(𝕋) evaluates 1 at a singleton-supported representative; the same singleton is zero in Haar L∞ | Retain absence of a normal universal quotient  Carried from [review 9][prior]. |
| V8.CompactErgodicActions | conjugation on M₂ by SU(2) | Haar average of e₁₁=I₂/2, invariant state gives 1/2, fixed algebra=ℂI | Retain trace conclusion; primary locator remains uncertified  Carried from [review 9][prior]. |
| V9 Weil/covolume | ℝ/ℤ; ℝ/(2ℤ) | fundamental intervals have masses 1 and 2; at μ′=2μ these become 2 and 4 | Retain positive lattice-spacing convention  Carried from [review 9][prior]. |
| V9 formal degree | compact circle character; ℝ character | normalized circle coefficient norm²=1 so d=1; ℝ coefficient has infinite squared integral so no formal degree | Retain square-integrability hypothesis  Carried from [review 9][prior]. |
| V10.ClosedOperators inverse Cayley | T=0; T=1 on ℂ | U=(T−i)/(T+i)=−1,−i respectively; i(1+U)/(1−U)=0,1 | Retain direction and exclude fixed vectors at U=1  Carried from [review 9][prior]. |
| V10.Affiliation | multiplication by x on L²(ℝ) | spectral projection at [0,1] is multiplication by 1_[0,1]; it commutes with every bounded multiplier | Retain affiliation/PVM relation  Carried from [review 9][prior]. |
| V10.TracialLp | h=diag(4,1) with unnormalized trace | ‖h‖₁=5, ‖h‖₂²=17, ‖h‖∞=4 | Retain distinct norms and density construction  Carried from [review 9][prior]. |
| V10.ModularTheory | h=diag(2/3,1/3), standard matrix model | Δ(e₁₂)=2e₁₂, Δ(e₂₁)=e₂₁/2; σ_t(e₁₂)=2^(it)e₁₂ | Retain modular sign  Carried from [review 9][prior]. |
| V10.FiniteComplexPowers | same h, z=1 and z=i | β₁(e₁₂)=2e₁₂, β₁(e₂₁)=e₂₁/2; β_i factors have modulus 1 | Retain star locus Re z=0 for noncentral h  Carried from [review 9][prior]. |
| Companion diagonalPower / diagonalModularPower | h=(2,1), z=0,1; n=0 | h⁰=I; β₁(e₁₂)=2e₁₂; empty matrices form a singleton | Correct model, delete convention stand-in from acceptance material  Carried from [review 9][prior]. |
| Companion star identity and iff | h=(2,1), z=1; h=(1,1) | β₁(e₁₂)*=2e₂₁=β₋₁(e₂₁); β₁(e₂₁)=e₂₁/2; central h gives β_z=id for every z | Retain README mathematics, review 8 R07; this report R04 file repair  Carried from [review 9][prior]. |
| V10 KMS strip | h above, a=e₁₂,b=e₂₁ | φ(ab)=2/3, φ(ba)=1/3; φ(σ_i(a)b)=2⁻¹·2/3=1/3 | Retain inverse-ratio imaginary shift  Carried from [review 9][prior]. |
| V10 finite S/J commutants | S(x)=x* on matrix algebra | SL_aS(x)=xa*=R_a*(x); S²=id | Retain antilinear action, not linear conjugation  Carried from [review 9][prior]. |
| V10.Hecke conventions | H={1}, noncommuting g,h in S₃ | left convolution δ_g*δ_h=δ_gh; opposite convention gives δ_hg≠δ_gh | Retain left/right distinction and no false commutativity  Carried from [review 9][prior]. |
| V10.AffineHecke modular ratio | slope 2 | modular character=2; inverse ratio=1/2; for R_(2,0)1_H, Δ-eigenvalue=1/2 | Retain ratio and operator convention  Carried from [review 9][prior]. |
| V10.AffineAP prime-ratio target | ratio λ=2 and inverse | forward ratio=2, reversed pair ratio=1/2; block lower bounds c/k have divergent sum for c>0 | Retain reciprocal convention; arithmetic source contracts resolved  Carried from [review 9][prior]. |
| V10.AffineType endpoint | β=1 versus β=0 | prime weights p⁻¹ versus 1; modular ratios at β=1 are rational powers with dense log subgroup; β=0 makes all ratios 1 | Retain positive-temperature endpoint distinction, primary text not certified  Carried from [review 9][prior]. |
| V11 weights and supports | φ(x)=Tr(e₁₁x) on M₂ | φ(e₁₁)=1, φ(e₂₂)=0; support=e₁₁ rather than I | Retain nonfaithful support reduction  Carried from [review 9][prior]. |
| V11 weight scaling/cocycle | ψ=2φ for faithful φ | (Dψ:Dφ)_t=2^(it)I, value at t=0 is I; same modular automorphisms | Retain scalar cocycle rather than identifying weights  Carried from [review 9][prior]. |
| V11 Pedersen–Takesaki density | tracial M₂ and h=diag(2,1) | ψ(e₁₁)=2, ψ(e₂₂)=1; h^(it) conjugation gives ratio 2^(it) | Retain density, not normalized state by default  Carried from [review 9][prior]. |
| V11 standard cone | M₂ Hilbert–Schmidt model | positive x fixed by J; x=e₁₂ is not positive and Jx=e₂₁≠x | Retain cone and antiunitary distinction  Carried from [review 9][prior]. |
| V11 expectation criterion | diagonal subalgebra and h=diag(2/3,1/3) | σ_t preserves each eᵢᵢ; E removes off-diagonal entries; φ(E(x))=φ(x) | Retain state preservation and modular invariance  Carried from [review 9][prior]. |
| V11 Connes S/T | finite factor; III_λ, 0<λ<1 | finite S={1}; III_λ nonzero values λ^ℤ, with 0 also present; period magnitude 2π/abs(log λ) | Retain type distinction, no classification of arbitrary factors by S alone  Carried from [review 9][prior]. |
| V11 continuous core normalization | scalar algebra with trivial modular action | at s=log 2, θ_s(h)=2h; with trace density e^(−r)dr, substitution gives Tr(θ_s(f))=2Tr(f) | Retain paired sign convention  Carried from [review 9][prior]. |
| V11 Takesaki duality | trivial action of C₂ on ℂ | first algebra ℂ²; crossed again by dual flip gives M₂=B(ℓ²(C₂)) | Retain crossed-product direction  Carried from [review 9][prior]. |
| V11.DoubleDualEmbedding | G=ℤ, dual=𝕋 | ev(n)(z)=zⁿ; sup_z abs(zⁿ−1)=2 for n≠0, zero for n=0 | Retain discrete closed embedding; split ownership for later users  Carried from [review 9][prior]. |
| V11.UnitizationCharacters | A=0 and A=ℂ | external unitized spectra have cardinalities 1 and 2; removing augmentation leaves 0 and 1 points | Correct object already owned by A3, R02  Carried from [review 9][prior]. |
| V11.FourierUniqueness | G={1}, finite measures aδ₁,bδ₁ | transforms are constants a,b; equality iff a=b; L¹ zero transform iff scalar 0 | Correct specialization of existing A7 endpoint, R02  Carried from [review 9][prior]. |
| V11 inversion/Plancherel convention | finite C₂, normalized Haar | transform of (1,0) is (1/2,1/2); dual counting inverse gives (1,0), L² norm²=1/2 on both sides | Retain positive transform/conjugate inverse normalization  Carried from [review 9][prior]. |
| V11 ITPFI ratios | product densities diag(2/3,1/3) | single-site eigenvalue ratio 2, inverse 1/2; finite blocks give 2^ℤ; trace density gives only 1 | Retain ratio-set versus tracial boundary  Carried from [review 9][prior]. |
| V11 flow classification | III_λ with λ=1/2 | flow period abs(log λ)=log 2; reciprocal parameter gives same absolute period but lies outside 0<λ<1 | Retain parameter range; book locators uncertified  Carried from [review 9][prior]. |
| V12 two projections | p=e₁₁,q=(1/2)[[1,1],[1,1]] | (p−q)²=I₂/2; diagonal compression pqp=p/2 | Retain b=1/2 convention  Carried from [review 9][prior]. |
| V12 tracial ultrapower ideal | decreasing projections eₙ=1_[0,1/n] in diffuse MASA | ‖eₙ‖₂²=1/n→0, ‖eₙ‖=1; constant 1 has L² norm 1 | Retain Check; “orthogonal projections” means self-adjoint, not pairwise disjoint  Carried from [review 9][prior]. |
| V12 central sequence / Γ | site-n diag(1,−1) in R | τ(uₙ)=0, ‖uₙ‖₂=1; commutator with any earlier finite head is 0 | Retain nontrivial central sequence  Carried from [review 9][prior]. |
| V12 nonfactor warning | R⊕ℂ, weights 1/4 and 3/4 | distance² from (uₙ,0) to center≥1/4; every unitary has abs(trace)≥1/2 | Retain distinction from trace-zero Γ unitary  Carried from [review 9][prior]. |
| V12 free-group estimate | generators a,b and u_a in L(F₂) | ‖u_a u_b−u_b u_a‖₂²=2, while ‖u_a−τ(u_a)‖₂=1 | Retain noncommutative control for central-sequence estimate  Carried from [review 9][prior]. |
| V12.J.Maps | transpose on M₂ | T(x²)=T(x)², but T(e₁₂e₂₁)=e₁₁ whereas T(e₁₂)T(e₂₁)=e₂₂ | Retain Jordan rather than multiplicative conclusion  Carried from [review 9][prior]. |
| V12.J.Frame | constant frame function on ℂ³ | f(v)=1 for unit v, frame sum=3; density T=I₃ has Tr(T)=3 | Retain frame weight normalization  Carried from [review 9][prior]. |
| V12.J.Scalar | μ(p)=Tr(p) on M₃ | orthogonal ranks add: 1+1=2; extension has value 3 on I₃ | Retain bounded finite additivity, not state normalization  Carried from [review 9][prior]. |
| V12.J.Dye/Bloch boundary | odd nonlinear bijection of sphere: stretch z by factor 2 then normalize | e_x and e_z remain perpendicular as vectors, but (e_x+e_z)/√2 maps to (1,0,2)/√5; dot with e_z changes 1/√2→2/√5 | Retain type-I₂ obstruction; antipodes, hence projection orthogonality, preserved  Carried from [review 9][prior]. |
| V12.J.Enriched | transpose with states transported by transpose | Tr(T(ρ)T(p))=Tr(ρp); for ρ=p=e₁₁ both values 1 | Retain state/evaluation compatibility rather than arbitrary logic map  Carried from [review 9][prior]. |
| V12.J.CentralSplitting | identity on ℂ plus transpose on M₂ | scalar block multiplicative; matrix e₁₂,e₂₁ product reversed, e₁₁ versus e₂₂ | Retain central-piece orientation, not one global sign  Carried from [review 9][prior]. |
| V13a operator system / CP | transpose on M₂ | positive Choi rank-one matrix has partial transpose equal to flip; flip eigenvalue on e₁⊗e₂−e₂⊗e₁ is −1 | Retain CP rather than positivity  Carried from [review 9][prior]. |
| V13a Arveson extension | state on diagonal M₂ | density [[1/2,c],[conj c,1/2]] has eigenvalues 1/2±abs(c); c=0 and c=1/4 give distinct positive extensions | Retain existence without uniqueness  Carried from [review 9][prior]. |
| V13a injectivity/projection criterion | B(H); diagonal ℓ∞ in B(ℓ²); zero H | identity and diagonal projection have norm 1 when nonzero; zero-space projection has norm 0 | Retain norm-one qualifier for M≠0  Carried from [review 9][prior]. |
| V13a corners/expected subalgebras | e₁₁M₂e₁₁ | compression sends I to e₁₁, its corner identity; corner algebra ℂe₁₁ is injective | Retain corner unit rather than ambient-unit requirement  Carried from [review 9][prior]. |
| V13b.SpatialNorm sum | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁ | u exchanges 11 and 22, u*u projection rank 2, ‖u‖=1; sum of elementary norms=2 | Retain spatial norm, not projective sum norm  Carried from [review 9][prior]. |
| V13b cross norm | I₂⊗I₂ | operator norm 1=1·1, Hilbert–Schmidt cross norm √2·√2=2 | Retain operator norm  Carried from [review 9][prior]. |
| V13b representation independence | ℂ² on ℂ² and ℂ³, first coordinate doubled | represented tensor projection ranks 2 and 3, both norms 1 | Retain norm independence, not operator equality  Carried from [review 9][prior]. |
| V13b spatial inclusion | diagonal ℂ²⊂M₂, x=e₁₁⊗I₂ | domain and ambient operator norms both 1; zero inclusion gives norm 0 on its only element | Retain isometric inclusion, no quotient-exactness claim  Carried from [review 9][prior]. |
| V13b hyperfinite examples | R finite heads, B(ℓ²) finite corners plus scalar tail, zero | head approximants fix head elements exactly; Pₙξ→ξ; zero sequence generates 0 | Retain sequential scope at separable predual  Carried from [review 9][prior]. |
| V13b semidiscreteness topology | truncation maps on ℓ∞(ℕ), x=1 | each fixed coordinate error eventually 0; operator norm error=1 for all N | Retain point-ultraweak rather than norm convergence  Carried from [review 9][prior]. |
| V13b CP factorization | M₂ | identity factors through M₂ with both maps identity, error 0 and norms 1 | Retain matrix-stage normalization  Carried from [review 9][prior]. |
| V13b Powers–Størmer | a=diag(4,0),b=diag(1,0) | ‖√a−√b‖₂²=1, ‖a−b‖₁=3; a=b gives 0≤0 | Retain inequality, not equality  Carried from [review 9][prior]. |
| V13b min-norm criterion | M₂ in standard form with right opposite action | multiplication sends e₁₁⊗e₁₁^op to a rank-one compression of norm 1; tensor norm also 1 | Retain opposite-algebra orientation  Carried from [review 9][prior]. |
| V13b finite-rank Følner criterion | P=I on L²(M₂,tr/2) | rank P=4, Hilbert–Schmidt norm=2, commutators 0; Tr(L_e₁₁)/4=2/4=1/2=τ(e₁₁) | Retain both commutator and trace conditions  Carried from [review 9][prior]. |
| V13b II₁ hyperfinite uniqueness | dyadic heads M₂⊂M₄⊂R | a matrix element in head k has approximation error 0 at every n≥k; normalized traces agree | Retain separable II₁ qualification from source  Carried from [review 9][prior]. |
| V13b arbitrary-cardinality reduction | B(ℓ²(I)), I uncountable | finite-rank corner p_F has trace abs(F); sup_F p_F=I with trace ∞, no countable exhaustion of all basis vectors | Retain nets rather than an illicit sequence  Carried from [review 9][prior]. |
| V13b δ-related tuples | ξ=η and family {1} | Σa*a=Σaa*=1, tuple error 0; conjugating unitary 1 gives distance 0 | Retain normalization; zero family has sums 0 and is excluded  Carried from [review 9][prior]. |
| V13b equivalence-relation finite control | orbit relation on two equally weighted points | averaging sends (a,b) to ((a+b)/2,(a+b)/2); matrix algebra M₂ is finite-dimensional/hyperfinite | Retain finite instance; CFW proof text not obtained  Carried from [review 9][prior]. |
| V13b periodic automorphism invariant | α=id on R | outer period 1, implementing unitary 1, obstruction 1 | Retain boundary of periodic classification; no claim this tests the general conjugacy proof  Carried from [review 9][prior]. |
| V13b bicentralizer definition | tracial M₂ | all constant sequences centralize τ; commuting with every constant matrix forces B(M₂,τ)=ℂI | Retain ordinary bicentralizer normalization  Carried from [review 9][prior]. |
| V13b Q-stability convention | m orthogonal isometries with φuᵢ=m⁻¹uᵢφ | evaluating at uᵢ* gives φ(uᵢuᵢ*)=1/m; sum of range masses=m·1/m=1 | Retain bimodule-action orientation  Carried from [review 9][prior]. |
| V13b III₁ product approximation | faithful product state, finite tensor head F | φ=φ_F⊗φ_tail gives state error 0; expectation fixes head operators with operator error 0 | Retain product criterion's intended controls; uniqueness uses cited nontrivial sources  Carried from [review 9][prior]. |

## Not verifiable

- Takesaki I IV.4.9 (representation independence of the spatial norm, cited at README :3625), Takesaki III XV.3 and Runde 6.4.14/6.4.24–25 remain uncertified (paywalled) as reviews 8 and 9 recorded; the §13.2 statements were checked from the stated inputs, not from those pages.
- The unread classification and measured-relation inputs of review 8 (Connes–Woods, Araki–Woods, Connes–Takesaki, the CFW catalogue page) were not re-requested; their passages are untouched by this diff.
- Hiai's Theorem 6.5 states the nonunital generality the README uses, but its printed proof treats a von Neumann inclusion; reading it verifies the statement, not every step of the general nonunital proof.
- Ownership against open pull requests whose files this brief does not supply was not checked beyond the name probe of pull request #1041's `Suggested.lean`; the sibling checkouts listed in the brief were used for CStarAlgebras and BanachAlgebras (the latter via main, since its open pull request revises an existing roadmap).

## Source issues

- none

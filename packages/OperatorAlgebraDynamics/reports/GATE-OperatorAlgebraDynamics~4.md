# GATE-OperatorAlgebraDynamics~4: answers to the review of 8e24100

The review covers head 8e24100. Head f3a756d, the commit this job started from, already carries the repair for every point below; each was re-verified at f3a756d against the pins, main and the open heads, and nothing further needed changing, so this job adds no commit. Line numbers refer to `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (README) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (Lean) at f3a756d.

## H01 (CBirkbeck) — applied

Lean 5–8 now read `module`, a blank line, `public import Mathlib`, `public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic`, and Lean 47 adds `@[expose] public section` before `noncomputable section`, the form CoboundaryExpansion uses on main. `lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested` completes with the twelve `declaration uses sorry` warnings and no module-system advisory, and the gate's build check no longer fails (gate line below).

## H02 (CBirkbeck) — applied

The weak-closure identification is deferred whole. README 856–875 of 8e24100 (from "Prove the weak-closure identification" to "depends on this identification.") are deleted; D2's main body ends at "The C*-construction retains arbitrary locally compact Hausdorff G." (README 853–854). The scope bullet (README 53–61) now reads "The identification of the weak-operator closure of the regular representation of `A⋊_rG` with `M⋊̄G` belongs with those sections; no C*-result below depends on it", and D2's Dependencies (README 1402–1404) say the closure and its identification belong to the sections Scope and ownership names and nothing below uses them. Grep of README and Lean for "Kaplansky", "normal functional", "σ-weak", "normal automorphism", "diffused" and `ρ̄` returns nothing. At the pin `Mathlib/Analysis/VonNeumannAlgebra/` holds only `Basic.lean` and the files matching "Kaplansky" are the Erdős–Kaplansky, UFD and related algebra files, so the deleted route's inputs indeed exist nowhere this roadmap may cite. Board note, not the author's: VonNeumannAlgebras at head 889 (lines 2028–2030 of its README) still cites OperatorAlgebraDynamics D1 inside its regular `L²(G,H)` construction and should re-point when that pull request is next revised.

## H03 (CBirkbeck) — applied

The LCA Weyl dictionary moved from D3 to Layer 4 as D4.LCAWeyl (README 1701–1754), placed after D4.Harmonic (1515–1699) and before D4.Takai (1756). Its text, Checks and Needs line are unchanged apart from the name. Every internal reference was renamed (README 25, 37, 203, 1511, 1616, 1660, 1815, 2865; Lean 38), and the D4 preamble (1511–1513) introduces it. D3's Dependencies (README 1502–1503) now read "D1, D1.Modules and D2; BanachAlgebras A7; CStarAlgebras C1; Mathlib Haar measure and the quotient integral formula", with no mention of D4; D4's Dependencies (1815–1817) name D1–D3 and C1–C2. The Schrödinger-pair examples moved to D4's Examples (1807–1811). D4.Harmonic's body and Needs line (1515–1699) mention no D3 item, so within Layer 4 the order Harmonic → LCAWeyl → Takai has every input earlier. No other roadmap on main or at the open heads cites `D3.LCAWeyl` (`roadmaps grep 'LCAWeyl'` finds only this folder).

## H04 (CBirkbeck) — applied

Lean 33–34 add to the not-statable list "the Fourier isomorphism `C*(G) ≅ C₀(Ĝ)` of the full group C*-algebra and the identification `C*(Ĝ) ≅ C₀(G)` (D4.Harmonic): no group C*-algebra `ℂ ⋊ G`". The pins have no group C*-algebra: the only "CrossedProduct" files at the Tau Ceti pin are the algebraic Galois crossed products under `TauCeti/Algebra/CrossedProduct/`, which carry no C*-structure.

## H05 (CBirkbeck) — applied

README 905–913 add D2's main-body Needs line: D1 (regular covariant representation, integrated forms, full crossed product with universal property and multiplier maps, ideal short exact sequence); D1.Modules (induced Hilbert spaces); BanachAlgebras A7 (Haar integration, `L¹(G)` convolution, Fubini and support arguments); AmenableGroups (invariant means on Haar `L∞`, Layer 7's `L¹` approximation, Layer 5's Følner sets); CStarAlgebras C5–C7 (tensor products, nuclearity with CP approximations, exactness); RepresentationTheory/CompactGroups (Peter–Weyl); Mathlib `Lp`. Each cited item was resolved: D1's body states the multiplier maps (README 218–220) and the ideal short exact sequence (README 283); AmenableGroups on main has Layer 5 "Følner criteria for arbitrary discrete groups" (its line 289) and Layer 7 "locally compact Hausdorff groups and Haar L∞" (415) with `L¹` convolution and approximate identities (its items 2–3 of that layer); CStarAlgebras at head 860 has Layer 5 tensor products (1110), Layer 6 nuclearity (1270) and Layer 7 exactness (1453); RepresentationTheory/CompactGroups on main is the Peter–Weyl roadmap.

## Adversarial pass (statements added, moved or changed at f3a756d)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| D4.LCAWeyl Check, G=ℤ/2 | nontrivial χ, χ(a)=−1 | U_a = swap, V_χ = diag(1,−1); U_aV_χU_a* = diag(−1,1) = −V_χ = conj(χ(a))·V_χ | true | none |
| D4.LCAWeyl Check, G=ℤ | z∈𝕋, s∈ℤ | (U_sV_zξ)(t) = z^(t−s)ξ(t−s); (V_zU_sξ)(t) = z^tξ(t−s); quotient z^(−s) = conj(z^s). With V_(z⁻¹): conj(z̄^s) = z^s | both phases as stated | none |
| D4.LCAWeyl Check, G=ℝ | χ_ξ(t)=exp(iξt) | U_sVU_s* = exp(−iξs)V = conj(χ_ξ(s))V | true | none |
| D4.LCAWeyl multiplier image | f∈L¹(Ĝ), ψ=ev(t) | transform ∫f(χ)χ(t)dμ̂(χ); δ_χ ↦ (t↦χ(t)), matching README 1613–1616 | consistent | none |
| D4.LCAWeyl multiplicity Checks | H=0; L²(G)⊕L²(G) | H=0: nondegenerate vacuously, multiplicity 0; the direct sum has the reducing subspace L²(G)⊕0, multiplicity 2 | true | none |
| Layer order after the move | inputs of D4.Harmonic, D4.LCAWeyl, D4.Takai | Harmonic: A7, D1, C1, D2, Tau Ceti (1688–1699); LCAWeyl: D3, Harmonic, C1–C2 (1751–1754); Takai: D1–D3, Harmonic (1799–1803) | no layer cites a later one; no target cites a later target | none |
| Scope bullet (README 53–61) and D2 Dependencies (1402–1404) | G discrete, G = ℝ | the C*-results of D2 (reduced norm, expectation, amenability, nuclearity) use no von Neumann input; the deleted target was consumed by nothing (grep for its objects returns nothing) | deferral loses no consumer | none |
| D2 Needs line (905–913) | each cited section | resolved as recorded under H05 | every citation exists | none |
| Lean docstring bullet (33–34) | pins | no group C*-algebra or C*-crossed product at Mathlib f6090c7 or Tau Ceti 358314d | not statable, as stated | none |

## Signatures

`#check @TauCetiRoadmap.OperatorAlgebraDynamics.<name>` was run for all 18 declarations by appending the lines to the file, elaborating with `lake env lean`, and restoring the file (worktree clean afterwards). Every type is the one recorded in the worker's signature probe and in the previous review: the header change altered no type. The five declarations that drop section binders (`IsCovariant`, `convolution`, `CentralCocycle`, `CentralCovariantPair`, `transitive_commutant_scalar`) drop only binders their types do not mention; `pontryagin_duality` keeps `[CommGroup K] [TopologicalSpace K] [IsTopologicalGroup K] [LocallyCompactSpace K] [T2Space K]` and `exists_dualHaar_plancherel_inversion` additionally the Borel instances and `[μ.IsHaarMeasure] [μ.Regular]`, as README 1583–1587 and 1694–1697 state. No change.

## Ownership and direction

No later roadmap is cited. The weak-closure identification now belongs to VonNeumannAlgebras V8 and V11 (open heads 889 and 1041), which this on-main roadmap may not consume, and which is why it is deferred rather than planned. Ownership against the open pull requests the brief lists was checked with `roadmaps grep` for `LCAWeyl`; no overlap.

Dependency check output:

    depcheck: 235 roadmaps, 2063 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Build and gate

`lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested`: Build completed successfully (8957 jobs); the only warnings are twelve `declaration uses sorry`, no module-system advisory.

    gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

No new commit: the repairs are in f3a756d, which is the head. Not pushed.

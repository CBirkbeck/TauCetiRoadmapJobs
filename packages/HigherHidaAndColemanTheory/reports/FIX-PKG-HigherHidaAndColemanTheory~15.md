# FIX-PKG-HigherHidaAndColemanTheory~15

Findings of `REV-PKG-HigherHidaAndColemanTheory~14` (four findings). The review's "For the human reviewers" section lists no finding and changed nothing.

## F01 (P2) — applied

Old → new: §6.6b(2), the transposed bounds, was stated for finite extensions L/F only. It now holds for every complete nonarchimedean C/F, including ℂ_p. New §6.6b(3) transfers a strict slope violation to a rigid point, and §6.4 gains the specialization statement at C-valued points that (3) uses.

Verified. BP-Coleman line 7690–7694 quantifies both pairs of bounds over continuous ℂ_p-valued characters. The reviewer's character exists and is valued in no finite extension, so the old statement said nothing there.

The route is the reviewer's in outline, with one difference: it does not use PadicFamilies §§2a.15–2a.16. The finite algebra needed is elementary, so the route is self-contained:

- **§6.4, new statement.** For a C-valued weight ν, with rank-one image x in a weight affinoid, the perfect slope complex M• over a rational neighbourhood Spa(B) has `M•⊗_B C` equal to the slope ≤h′ complex for ν, with its Tor spectral sequence. Inputs: LocallyAnalyticDistributions §4.2 (completed scalar extension, Fredholm series base change) and §4.16 (Fredholm windows at rank-one points). The tensor product is derived; no single `H^q(M•)` is claimed to commute with the fibre.
- **§6.6b(3).** Let 𝒯 be the image in `End_B(⊕_q H^q(M•))` of the polynomial algebra on t₀ and the controlling element; it is finite over B, hence affinoid. A violating η gives a C′-point of Sp(𝒯). For rational c′ with `v(η(t₀))≤c′<c`, the rational subdomain `{|t₀|≥|p|^(c′)}` is nonempty, so it has a maximal ideal y with finite residue field. Faithfulness gives `N_y≠0`; in the largest degree q with `H^q(M•)_y≠0` the corner term of the spectral sequence at the rigid point survives. The degree may change from i to q, which is harmless since the bounds hold in every degree.
- **§6.6b(2) for general C.** A violation would specialize by (3) to a rigid point, where the finite-L case (via §6.6a(3)) forbids it. The thresholds do not depend on the weight.

Neither topological Serre duality over ℂ_p, nor §6.9, nor classicality is used. §6.6a stays over finite L/F. E17 is unchanged.

New supplier citations, all on main or earlier in the merge order: LocallyAnalyticDistributions §4.2; RigidAnalyticGeometry §1.1 (finite algebras over affinoids), §1.2 (finite maximal residue fields), §8.2 (classical points in rational subdomains). A "From TauCetiRoadmap.RigidAnalyticGeometry" contract block and the Layer 6 Dependencies record them.

New Checks in §6.6b: the reviewer's transcendental weight (thresholds −1 and 0, slope −1/2 excluded by (2) only, endpoint 0 allowed); a two-term complex where specialization returns degree 1 from a degree-0 class; an irrational slope showing (3) transfers an inequality and not a slope. One Check added to §6.4 (a transcendental point where the fibre is acyclic).

## F02 (P2) — applied

Old → new: §6.6a(3) said "between the parts of slope ≤h for a chosen t and for t⁻¹". Now: for t∈T++ on + (t∈T−− on −), acting through the potent compact operator of §6.3, the slope ≤h parts for t and for the operator of t⁻¹ are finite-dimensional and perfectly paired; no finiteness is asserted for general t∈T^±.

Verified at BP-Coleman line 7648 and 7656. Adjointness for all of T^± (item 2) and the nondegeneracy and character-block conclusions are kept. The route now names the compact lift. T−− is defined in §5.4a as the inverses of T++. The U versus identity computation is a new negative-control Check (dimension 3 at h=2; truncations 3, 6, 12 for the identity).

Same pattern elsewhere: the algebraic pairing, former §5.6(b), said "perfect on each matching finite-dimensional generalized eigenblock" with no slope-block claim; its replacement §5.4a states the slope-block form with the same T++ restriction and the same Check.

## F03 (P2) — applied

Old → new: §5.5's route gave only the lattice estimates, and its Needs omitted the pairing, which sat later in §5.6(b). The pairing is now the new target §5.4a, before §5.5. §5.5's route derives the two transposed bounds from §5.4a(2) and its Needs cites §5.4a. §5.6(b) keeps the canonical degree range and cites §5.4a.

Verified at BP-Coleman line 5704–5711. Recomputed: `κ∨=−w0Mκ−2ρ_nc`, so `−w⁻¹κ∨=w⁻¹w0Mκ+w⁻¹2ρ_nc` and `−w⁻¹w0Mκ∨=w⁻¹κ+w⁻¹2ρ_nc`. At κ=(5,3;−8), w=1, t₂: thresholds 0 and 3, and κ∨=(0,−2;8) pairs with v(t₂⁻¹) to 3.

No id is dropped: §§5.5 and 5.6 keep their numbers, and the layer's numbering table and one sentence say that a citation of §5.6(b) for the pairing is a citation of §5.4a. §5.4a's route uses §§5.2–5.3 only, so there is no cycle. Citations of the pairing in §§6.6a and 6.8 (text and Needs) now point to §5.4a. §5.5 gains three Checks (the GSp₄ witness, a torus datum, GL₂); §5.6 gains a modular-curve Check for the range `[ℓ±(w),d]`.

## F04 (P3) — applied

Old → new: the torus Check said "the pairing is multiplication L×L→L"; it now gives `Tr_(B/L)(xy)` on a finite étale L-algebra B, with B=L and B=L×L computed. The curve Check now requires X geometrically connected over F and D reduced effective, with ℙ¹ computed (1, 0, 0, 2) and both counterexamples as negative controls.

Verified: for B=L×L, (1,0)·(0,1) has trace 0 and (1,0)·(1,0) trace 1. For ℙ¹_E over F with [E:F]=2, `H¹(ω)` has F-dimension 2. For ℙ¹⊔ℙ¹ with D on one component, `H⁰(O(−D))=F`.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.4a(2), slope blocks | U(zⁿ)=pⁿzⁿ, h=2; t=1, h=0 | block dimension 3 on both sides; identity gives 3, 6, 12, … | Finite only for compact t | T++/T−− in statement; Check |
| §5.4a(2), cutoff on the second factor | t-eigenvalue p² on a line | adjointness `⟨tx,y⟩=⟨x,t⁻¹y⟩` forces the operator of t⁻¹ to have eigenvalue p², slope 2, not −2 | Same cutoff h on both sides | My first draft had slope ≥−h; corrected before submission; Check |
| §5.4a, κ∨ involution | κ=(5,3;−8) | κ∨=(0,−2;8); (κ∨)∨=(2,0;−8)−(−3,−3;0)=(5,3;−8) | Involution | Check |
| §5.5 transposed + bound | GSp₄, w=1, κ=(5,3;−8), t₂ | direct 0; `⟨v(t₂⁻¹),κ∨⟩=(0−2+8)/2=3` | Slope 2 excluded only after transposition; 3 not excluded | Route, Needs, Check |
| §5.5 transposed − bound | general w | `v(η)≤−w⁻¹w0Mκ∨=w⁻¹(κ+2ρ_nc)` | Matches the stated bound | Route |
| §5.5, torus | w0M=1, ρ_nc=0 | κ∨=−κ; all four bounds read v(η)=κ | Transposed pair repeats the direct pair | Check |
| §5.6(b) range | modular curve, d=1 | ℓ−=1−ℓ+; dual of [0,ℓ−] is [ℓ+,1]; using ℓ+ twice gives [1,1] at length 0 | Stated range correct | Check |
| §6.4 at a C-point | F⟨t⟩, [A --t→ A], t↦a≠0 transcendental | fibre [C --a→ C] acyclic; Tor₀=C/a=0, Tor₁=0 | Consistent | Check |
| §6.6b(2) over ℂ₃ | reviewer's ν, w=1, ⟨v(t),2ρ⟩=1 | thresholds −1 and 0; slope −1/2 passes (1), fails (2); 0 allowed | Quantifier now includes ν | Statement, Check |
| §6.6b(3), degree | F⟨s⟩, [B --s→ B], t₀=p⁻¹, c=0 | N=B/(s) in degree 1, 𝒯=F; fibre at s=0 has H⁰=H¹=F, slope −1 | Returns q=1 from i=0 | "q need not equal i" in statement; Check |
| §6.6b(3), strictness | N=F⟨s⟩, t₀=s, Gauss point of irrational radius r | v=r; rigid points have rational v(s); for c>r a rational c′∈[r,c) exists | Inequality transfers, slope does not | Check |
| §6.6b(3), corner term | localization at y | `E2^(p,q′)_y=0` for q′>q; `E2^(0,q)_y≠0` by Nakayama; no differential in or out | Class survives | Route |
| §6.6a torus Check | B=L, B=L×L | multiplication; x₁y₁+x₂y₂, dimension 2 | Old wording wrong for two points | Check restated |
| §6.6a curve Check | ℙ¹_F, D={∞}; ℙ¹_E/F; ℙ¹⊔ℙ¹ | 1, 0, 0, 2; dim_F H¹(ω)=2; H⁰(O(−D))=F | Needs geometric connectedness | Check restated |

## Checks

- `lake env lean` on `packages/HigherHidaAndColemanTheory/Suggested.lean`: exit 0, no output. The file is unchanged and declares nothing, so the `#check @name` comparison has no declaration to compare.
- Dependency check: `depcheck: 244 roadmaps, 2217 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## For the maintainer

- New ids: §5.4a. New statements inside existing ids: §6.4 (C-valued points), §6.6b(3). No id is removed or renumbered. PadicFamiliesPartII cites this package's §§5.5, 5.6 and 5.8; all three keep their numbers and content, and §5.6 still states the duality consequence.
- New suppliers named: RigidAnalyticGeometry §§1.1, 1.2, 8.2 (on main) and LocallyAnalyticDistributions §4.2 (a roadmap already in the contracts). No gap was added; `design/plan.json` and `metadata.toml` are untouched.
- `sources.toml`: the BP-Coleman entry gains `5.4a` in `cited_for`. No new source.
- Ownership: §6.6b(3) is a statement about this package's family complexes; the general spectral variety of PadicFamilies §2a.16 is not restated, and the route does not need it. Searched LocallyAnalyticDistributions §4.16 and PadicFamilies §§2a.15–2a.17: base change there is between affinoids or at rank-one fibres of a single module, not the C-valued specialization of these supported complexes.
- The source's Theorem 6.7.2 is stated for any field A. §6.6a remains over finite extensions, as the reviewer accepted; a pairing over ℂ_p would still need duality outside the `gap:banach-support-duality` contract.

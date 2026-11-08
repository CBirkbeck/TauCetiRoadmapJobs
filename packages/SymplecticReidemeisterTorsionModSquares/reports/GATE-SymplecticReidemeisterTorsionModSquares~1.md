# GATE-SymplecticReidemeisterTorsionModSquares~1: answers to human review

One review comment (roed-math, 2026-11-06), two distinct points: the AlgebraicTopology citations under
#1652's renumbering (H01) and declaring #1652 or #1663 as a dependency (H02). Commit `95862e1d`
(README only; `Suggested.lean` unchanged).

## H01 (roed-math) — applied differently

`TauCetiRoadmap/SymplecticReidemeisterTorsionModSquares/README.md` lines 57 and 59: the backticked
`compactTriadPoincareLefschetz` (a name that #1652 and #1663 both drop, and that no Lean file
declares) → prose "the compact-triad Poincaré–Lefschetz theorem" with its statement
`H^k(K,∂₁K;L) ≅ H_(m−k)(K,∂₀K;L⊗or_K)` and an interval witness. The Stage numbers stay as they are,
because they resolve on main (eaf17b1) and unchanged at #1663, #1797, #1807, #1808 and #1854, each of
which conflicts with #1652 in `TauCetiRoadmap/AlgebraicTopology/README.md`. Under #1652 every cited
id keeps its number and its content (Stage 2 → Layer 2 with §2.6 local systems, Stage 4 → Layer 4,
Stage 5 → Layer 5 with §5.2 Wang and §5.3 transfer, Stage 6.1–6.4 → §§6.1–6.4, with the
binary-cover Mayer–Vietoris sequence in §6.1 and the compact-triad theorem in §6.4), so if #1652
merges first the only update is the word Stage → Layer.

## H02 (roed-math) — answered

No dependency is needed. After the H01 repair every AlgebraicTopology citation resolves on main as
merged, and the README cites no id that only an open revision defines (the overlap check lists
none). Declaring #1652 or #1663 would put this roadmap behind one of six open pull requests that
rewrite `TauCetiRoadmap/AlgebraicTopology/README.md` in conflicting ways. If #1652 lands first, apply
the Stage → Layer rename given under H01 on rebase.

## Evidence for H01/H02

Main (eaf17b1), `TauCetiRoadmap/AlgebraicTopology/README.md`: `## Stage 2` (line 326; local
coefficient systems as functors on the fundamental groupoid, with map pullbacks, item 6, lines
382–386), `## Stage 4` (line 499), `## Stage 5` (line 849; Wang sequence with endomorphism `id − f_*`,
item 2, line 868; transfer with `p_* transfer = d * id`, item 3, line 870), `## Stage 6` (line 946),
item 1 (line 1011: local-system cochains, cellular comparison, the Mayer–Vietoris sequence of a binary
open cover at lines 1037–1038), item 2 (line 1056: cup/cap), item 3 (line 1180: orientation system,
fundamental classes), item 4 (line 1515: Poincaré–Lefschetz; `compactTriadPoincareLefschetz` at line
1534). Main itself writes these items as "Stage 6.3", "Stage 4.6", "6.1–6.4".

Open revisions of AlgebraicTopology, at their heads:

| PR | head | numbering | Stage 6 items 1–4 | compact-triad theorem |
|---|---|---|---|---|
| #1652 | 61ee7a2 | Layer N, `### N.M` | §6.1 line 1621 (binary-cover MV lines 1662–1663), §6.2, §6.3, §6.4 line 2212 | prose, §6.4 line 2243; backticked name dropped |
| #1663 | 08deda5 | Stage N, items | items 1–4 unchanged | prose "compact-triad Poincaré–Lefschetz duality"; backticked name dropped |
| #1797 | b3badcf | Stage N, items | unchanged | backticked name kept |
| #1807 | 2110869 | Stage N, items (adds Stage 5 item 0) | unchanged; Stage 5 items 1–7 unchanged | backticked name kept |
| #1808 | beeacfb | as #1807 | unchanged | backticked name kept |
| #1854 | 5c83375 | as #1807 | unchanged | backticked name kept |

The overlap tool reports #1652 conflicting with each of the other five in
`TauCetiRoadmap/AlgebraicTopology/README.md` and `Suggested.lean`; #1652 and #1663 conflict as the
review says. `compactTriadPoincareLefschetz` is not declared in AlgebraicTopology's `Suggested.lean`
on main, nor in Mathlib or Tau Ceti at the pins; it was the only backticked name in this README
without a Lean declaration behind it.

Why the Stage numbering stays: citing #1652's numbering would make #1652 a dependency and break the
citations against main and against the five other revisions; the reviewer's own suggestion makes
the rename conditional on #1652 landing, which it has not (main eaf17b1 still has `## Stage`).

## Same pattern in other suppliers

Every supplier this README cites that is on main and has an open revision was compared id by id at
each head:

- SchemeAndStackFoundations §§0.9, 0.21, 2.9, 2.11: same headings at #1276, #1656, #1807, #1808,
  #1854.
- RepresentationTheory/LieGroups Layer 5: same heading at #1051.
- Chebotarev Layers 7, 11 (11.3), 13: same headings at #1187.
- GeometricTopology Layers 1, 3, 11: same at #903, #1517, #1791, #1797. "The smoothing-and-triangulation
  comparison" is cited by title: unchanged at #1517 and #1791; at #1797 it becomes "Layer 12: the
  smoothing-and-triangulation comparison" (title kept); at #903 the section is gone and smooth
  triangulations sit in Layer 11.3. Same policy as H01: the citation follows main; if #903 lands
  first, "smoothing-and-triangulation comparison" → Layer 11.3.

TangentialBordism, StableHomotopyKTheory, KTheoryLowDegrees, KTheoryFiniteLocalFields, K3BlochGroups
and MetaplecticAutomorphicForms are new-roadmap pull requests earlier in the merge order, with no
open revision. PadicMeasuresIwasawaAlgebras is on main and has no open revision. The citation
resolver finds every citation (none found nowhere).

## Adversarial pass on the changed statements

| statement | instance | left side | right side | result | change |
|---|---|---|---|---|---|
| compact-triad PL: `H^k(K,∂₁K;L) ≅ H_(m−k)(K,∂₀K;L⊗or_K)` | K=[0,1], m=1, L=ℤ, ∂₀K=∂K, ∂₁K=∅, k=0 | H⁰(K)=ℤ | H₁(K,∂K)=ℤ | holds | used as README witness |
| same | same, k=1 | H¹(K)=0 | H₀(K,∂K)=0 | holds | none |
| same | K=[0,1], ∂₀K=∅, ∂₁K=∂K, k=0 / k=1 | H⁰(K,∂K)=0 / H¹(K,∂K)=ℤ | H₁(K)=0 / H₀(K)=ℤ | holds | none |
| same | K=[0,1], ∂₀K={0}, ∂₁K={1}, k=0 / k=1 | H⁰(K,{1})=0 / H¹(K,{1})=0 | H₁(K,{0})=0 / H₀(K,{0})=0 | holds | none |
| wrong model: same face relative on both sides | K=[0,1], ∂₁K=∅, k=0 | H⁰(K)=ℤ | H₁(K)=0 | fails, so the model is excluded | stated in README as the discriminating witness |
| orientation twist needed | Möbius band M, m=2, ∂₀M=∂M, ∂₁M=∅, L=ℤ, k=0 | H⁰(M)=ℤ | untwisted H₂(M,∂M;ℤ)=0 (∂M→core has degree 2, so H₁(∂M)→H₁(M) is ×2, injective); twisted H₂(M,∂M;or_M)=ℤ (H₁(M;or_M)=H₁(S¹;ε)=ker(−2)=0 and or_M is trivial on ∂M) | holds only with `L⊗or_K` | twist kept in the statement |
| empty boundary | K=S¹, k=0 / k=1 | H⁰=ℤ / H¹=ℤ | H₁=ℤ / H₀=ℤ | holds (Poincaré duality) | none |
| m=0 | K=point, ∂K=∅, k=0 | H⁰=ℤ | H₀=ℤ | holds | none |
| contract at line 59 extends the theorem | gap:poincare-boundary-cone hypotheses vs main item 4 | finite projective self-dual L, 2 invertible | main: every module-valued L | a specialisation, not a widening | none |
| Stage k.m citations | main item ↔ #1652 subsection, by content | Stage 6.1 binary-cover MV (main 1037–1038) | §6.1 (1652 lines 1662–1663) | same text | none |
| same | Stage 6.4 compact triad | main 1534 | §6.4 line 2243 | same text | none |
| same | Stage 5 Wang `id − f_*`, transfer `p_* transfer = d·id` | main 868, 870 | §5.2, §5.3 | same | none |

The two adjacent sentences of the same paragraph were recomputed: the interval endpoint coefficients
−1,+1 (outward-first, ∂[0,1] = {1} − {0}) and the index-three transfer composite 3 ≡ 1 mod 2.

## Signatures

`Suggested.lean` is unchanged. Its one declaration was elaborated with a temporary
`#check @TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula`
(reverted, not committed): the binders `[Field K] [Invertible 2] [AddCommGroup V] [Module K V]
[FiniteDimensional K V] (Q) (hQ : Q.Nondegenerate) (A : orthogonalGroup Q)` are all present and
agree with README line 753; nothing changed.

## Ownership

The repair adds no construction or target, so ownership against open pull requests is unaffected.

## Build

`lake build TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.Suggested`: `Build completed
successfully (9021 jobs).` One warning: `Suggested.lean:40:8: declaration uses 'sorry'`.

## Gate

`gate SymplecticReidemeisterTorsionModSquares: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
outside-folder=0 source-material=0 OK`

Direction check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`;
no UPWARD, CYCLE or moved line.

Sources: no new source was cited or fetched; `needs-references.toml` was not written.

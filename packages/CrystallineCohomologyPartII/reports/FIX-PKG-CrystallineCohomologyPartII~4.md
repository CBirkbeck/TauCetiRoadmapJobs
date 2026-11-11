# FIX-PKG-CrystallineCohomologyPartII~4

Repair of the three findings of the package review, round 3 (one P2, two P3). All three are correct, and all three are fixed in `packages/CrystallineCohomologyPartII/README.md`. `Suggested.lean`, `metadata.toml`, `sources.toml` and the `gaps` list in `design/plan.json` are unchanged: no headline statement, Lean name, source or supplier gap was affected.

## F01 (P2) — applied

Old (Layer 4 summary; §4.6 (iii)): the vanishing applied to correspondences "over a proper closed subset" of the target or source. New: the projection of Z must have positive codimension, i.e. contain no irreducible component. For connected Y this is the same as a proper closed subset; for disconnected Y it is not. New negative-control Check: two rational points, first diagonal component, acting by diag(1, 0).

*Verification.* CR12 line 3202 (Lemma 3.6.1) and line 3242 (Lemma 3.6.2) ask that every point of Z map to a point of codimension ≥ r. CR12 line 3190 assumes X and Y connected only for its simplified discussion. The review's witness is right: with X = Y = Spec k ⊔ Spec k and Z = {(x_1, y_1)}, [Z] has degree 0 and acts on W(k)² by diag(1, 0), which no N ≥ 1 kills.

*Same pattern elsewhere, also repaired.* §4.6 proof step 3 now reads "With r = 1". The three consumers of §4.6 (iii) also said "proper closed subset". Each now shows that its supports have positive codimension:
- §5.4 step 3: X′ and Y′ are integral and surject onto Y.
- §5.12 step 4: the supports lie over a divisor of the integral X′, or over the preimage of a divisor of Y, and X′ dominates Y.
- §5.12 step 5: Ỹ is now stated as integral, and X′ and Ỹ both dominate Y.

The "proper closed complement" at README §3.6 step 4 is about rigid descent and is unrelated.

## F02 (P3) — applied

The flagged Checks now match the domains of their definitions:
- §5.1 Check and Layer 5 Example: "Every smooth k-scheme" → "Every smooth equidimensional k-scheme of finite type".
- §5.2 Frobenius Check: "X smooth projective" → "X smooth projective and integral".
- §5.3 Check and Example: "smooth X" → "smooth integral X".

New negative controls:
- Spec k ⊔ A¹_k is not a finite quotient.
- P¹ ⊔ P¹ has a Frobenius that is not a quasi-resolution.
- On Spec k ⊔ A¹_k, u_\*u^\* acts by (1, p), not by p.

*Verification.* CR12 line 3700 (Definition 4.2.5) requires a finite quotient to be normal and equidimensional. CR12 Definition 4.3.1 (line 3751) defines quasi-resolutions between integral schemes. CR12 line 3686 (Lemma 4.2.4) requires integral normal schemes. The review's two disjoint unions are counterexamples, as stated.

*Same pattern elsewhere, also repaired.* These are statements whose domain went beyond the definition they use:
- §4.2 Check: the relative Frobenius degree formula is now stated for smooth connected X, matching §4.2's f_\*f^\* = deg f for connected schemes.
- §5.4 Check: now "X smooth integral".
- §5.5 Check and Layer 5 Example: now "smooth integral schemes and integral topological finite quotients are Witt-rational".
- §5.6 (i): restated for integral topological finite quotients. CR12 Definition 4.4.4 (line 3932) defines Witt-rationality only for integral S. The added sentence notes that a topological finite quotient is the disjoint union of its connected components, each an integral topological finite quotient.
- §5.6 Check and Example: now "smooth integral scheme".
- §5.7 Example: now "S smooth integral of dimension d" (d was unbound there).
- §5.8 Check and Example: the blowup is now of a smooth projective *integral* X along a centre C ≠ X. The blowup along C = X is empty, so H⁰ drops to 0 and the old Check was false.
- §5.12 Check and Example: now "Y smooth integral".

## F03 (P3) — applied

Old: §4.1 API "E(W_•Ω_X) ≅ Hom(W_•Ω_X, K_X)(−N)[−N]" and the §4.2 route "K_X ≅ E(W_•ω_X)(N)[N]", with N, E and K_X undefined. New:
- §4.1 (4) and its API bullet define E as the Cousin complex for the codimension filtration. They define K_X = ((W_nπ)^Δ W_n(k))_n as the Witt residual complex representing (`K_{X,n}`)_n.
- They state K_X ≅ E(W_•ω_X)(d)[d] and µ_X with (−d)[−d].
- The §4.2 route uses d_X, d_Y, with r = d_X − d_Y.

*Verification.* CR12 line 1507 (Corollary 1.10.5) says N is the pure dimension. CR12 line 1515 (Corollary 1.10.6) gives the shift. CR12 line 1321 (Notation 1.9.2) and line 3451 define K_X = ρ_X^Δ W_•ω, concentrated in de Rham–Witt degree 0. A new §4.1 Check tests d = 0 (Spec k, no shift) and d = 1 (P¹, n = 1, where K_{X,1} ≅ Ω¹[1] and the [−1] shift puts µ_X in degrees 0 and 1). In §4.2 the shifts (−d_X)[−d_X] and (d_Y)[d_Y] combine to (−r)[−r]. The non-pure-dimensional case is handled on each pair of connected components. No Lean declaration is involved.

## Checks run

- **Elaboration.** From the content checkout I ran `lake env lean packages/CrystallineCohomologyPartII/Suggested.lean` (the file is unchanged). It exited 0. The only warnings were `declaration uses 'sorry'`, at lines 74, 90, 102, 124 and 157 (five theorems). All nine imported `TauCeti.*` object files were present, so nothing needed building.
- **Signatures.** I put `#check @name` for all eight declarations in one scratch copy and elaborated it once (exit 0). Every elaborated type is identical to the one recorded for round 3. No binder was lost, no change was needed, and the README statements of §§6.4, 6.6, 6.9, 6.10 and 6.14 still match.
- **Dependency gate** (`gate --depcheck … --movable`), output verbatim:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

  It printed no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **House style.** The added lines contain no LaTeX delimiters, process words, machine paths or pull-request numbers.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §4.6 (iii), target WO, positive codimension | X = Y = Spec k ⊔ Spec k, Z = {(x_1,y_1)} | codim pr₂(Z) = 0, so excluded. deg = 0 − 0 = 0. Action diag(1,0); N·(1,0) = (N,0) ≠ 0 | The old wording admitted it and was false; the new one excludes it. Added as a Check |
| same | X = Y = P¹, Z = P¹×{x} | codim pr₂(Z) = 1. deg = 1 − 1 = 0. H⁰WO → 0; H¹WΩ¹ ∋ α ↦ (∫α)ĉl(x); target-WO projection 0, N = 1 | Pass |
| same | X = Spec k, Y = P¹, Z = {x} | codim 1, deg = 1. Target-WO projection 0; source WO 1 ↦ ĉl(x) with trace 1 | Pass. The degree-zero clause stays necessary |
| same | Z = ∅ | Hypothesis holds vacuously; [Z] = 0 acts by 0 | Pass |
| same | Y = P¹ ⊔ Spec k; Z over the point component, or over a point of P¹ | codim 0 (excluded) versus codim 1 (included) | Pass. Componentwise reading confirmed |
| §4.6 (iii), source Wω | X = Y = P¹, Z = {x}×P¹ | codim pr₁(Z) = 1. Kills H¹(P¹,WΩ¹) = W(k) (N = 1) | Pass |
| same | two points, Z = {(x_1,y_1)} | Wω = WO = W(k)²; action diag(1,0), not torsion | Excluded by the new hypothesis |
| §5.4 step 3 | Quadric cone Y, minimal resolution X = X′, Y′ = A² → Y, U_0 = Y ∖ {0} | Preimage in X′ is the exceptional P¹ (codim 1); preimage in Y′ is the origin (codim 2) | Pass |
| §5.12 steps 4–5 | X′ = P¹×A¹ → Y = A¹, divisor {0} ⊂ Y; Y = Spec k | Preimage P¹×{0}, codim 1. For dim Y = 0 the proper closed subset is ∅, so the error is 0 | Pass |
| §5.1 Check | A¹; Spec k ⊔ Spec k; Spec k ⊔ A¹; ∅ | Identity covers of degree 1 for the first two (equidimensional, of dimensions 1 and 0). Dimensions (0,1) for the third: excluded. ∅ is vacuously a finite quotient | Pass. Added the negative control |
| §5.2 Check | P¹; Spec k; P¹ ⊔ P¹ | k(t^p) ⊂ k(t) has degree p; Spec k gives p⁰ = 1, an isomorphism; P¹ ⊔ P¹ is not integral | Pass. Added the negative control |
| §5.3 Checks | A¹; Spec k; Spec k ⊔ A¹ | u_\*u^\* = p; 1; (1,p) ≠ p^{dim X} = p | Pass. Added the componentwise Check |
| §4.2 Frobenius Check | A¹; Spec k | F_\*F^\* = p (agrees with the A¹ Check above it); p⁰ = 1 | Pass |
| §5.4 Check | X = P¹, f = F_{X/k} | f_\*f^\* = p = p^{dim X} | Pass |
| §5.6 (i) and §5.5 Check | Quadric cone; A¹ ⊔ A¹ | Integral, so Witt-rational. A¹ ⊔ A¹ is an equidimensional finite quotient but not integral; each component is Witt-rational | Pass |
| §5.8 Check | P² blown up at a point, along a line, along ∅, along P² | H^i(WO_ℚ) = (K,0,0) before and after; line and ∅ give isomorphisms; Bl along P² is ∅, so H⁰ = 0 ≠ K | The old Check was false for C = X; fixed with C ≠ X |
| §5.12 Check | Y = A¹, X = P¹_Y, r = 1 | R⁰Wω = 0, R¹Wω ≅ Wω_Y(−1), R¹WO_ℚ = 0 | Pass |
| §4.1 µ_X shift d | Spec k (d = 0); P¹ (d = 1, n = 1); A² (d = 2) | No shift; K_{X,1} = Ω¹[1] with H⁻¹ = Ω¹, and µ_X is in degrees 0,1 with [−1] versus −1,0 without; K = Ω²[2], so [−2] returns to degree 0, matching (2) "K_{X,n} in [−d,0]" | Pass |
| §4.2 route, r = d_X − d_Y | P¹ → Spec k; identity; Spec k → P¹ at x | r = 1: H¹WΩ¹ (1,1) → W(k) (0,0) and H⁰WO → 0. r = 0: no shift. r = −1: 1 ↦ ĉl(x) in bidegree (1,1) | Pass. Agrees with the §4.2 and §4.6 Checks |

## Notes for the maintainer

- **Lean names.** No Lean name changed and no `Suggested.lean` declaration was added or removed. No other roadmap's citations are affected.
- **Section identifiers.** The section and target numbering is unchanged. §5.6 (i) is narrowed from "every topological finite quotient" to "every integral topological finite quotient". This only states the domain of CR12 Definition 4.4.4 explicitly; consumers in this roadmap (§§5.5, 5.7) use integral schemes.
- **Ownership.** No new construction was introduced; all edits restate hypotheses and Checks of targets this roadmap already owns. So no fresh ownership search was needed. Ownership against the open pull requests was settled in earlier rounds and is unchanged.
- **Sources.** Nothing new was fetched. Every locator used is in the cached CR12 text already in `sources.toml`. No `needs-references.toml` was written.
- **Review text.** The review contained no instruction-like or suspicious passages.
